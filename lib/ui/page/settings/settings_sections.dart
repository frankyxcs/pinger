import 'package:flutter/material.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/model/user_settings.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/store/settings_store.dart';
import 'package:pinger/ui/page/settings/settings_items.dart';

class PingSettingsSection extends StatelessWidget {
  final bool showHeader;
  final PingSettings settings;
  final ValueChanged<PingSettings> onChanged;

  const PingSettingsSection({
    Key key,
    this.showHeader = true,
    @required this.settings,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (showHeader)
          SettingsHeaderItem(title: S.current.settingsPingSectionTitle),
        PingSettingItem(
          label: S.current.settingsPingCountLabel,
          unit: S.current.settingsPingCountUnit,
          value: settings.count,
          onChanged: (it) => onChanged(settings.copyWith(count: it)),
        ),
        PingSettingItem(
          label: S.current.settingsPingPacketSizeLabel,
          unit: S.current.settingsPingPacketSizeUnit,
          value: settings.packetSize,
          onChanged: (it) => onChanged(settings.copyWith(packetSize: it)),
        ),
        PingSettingItem(
          label: S.current.settingsPingIntervalLabel,
          unit: S.current.settingsPingIntervalUnit,
          value: settings.interval,
          onChanged: (it) => onChanged(settings.copyWith(interval: it)),
        ),
        PingSettingItem(
          label: S.current.settingsPingTimeoutLabel,
          unit: S.current.settingsPingTimeoutUnit,
          value: settings.timeout,
          onChanged: (it) => onChanged(settings.copyWith(timeout: it)),
        )
      ],
    );
  }
}

class OtherSettingsSection extends StatelessWidget {
  final UserSettings settings;
  final ValueChanged<UserSettings> onChanged;

  const OtherSettingsSection({
    Key key,
    @required this.settings,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SettingsHeaderItem(title: S.current.settingsOtherSectionTitle),
        SwitchSettingItem(
          label: S.current.settingsRestoreHostTitle,
          description: S.current.settingsRestoreHostDesc,
          value: settings.restoreHost,
          onChanged: (it) => onChanged(settings.copyWith(restoreHost: it)),
        ),
        SwitchSettingItem(
          label: S.current.settingsSystemNotificationTitle,
          description: S.current.settingsSystemNotificationDesc,
          value: settings.showSystemNotification,
          onChanged: (it) =>
              onChanged(settings.copyWith(showSystemNotification: it)),
        ),
        SwitchSettingItem(
          label: S.current.settingsNightModeTitle,
          value: settings.nightMode,
          onChanged: (it) => onChanged(settings.copyWith(nightMode: it)),
        )
      ],
    );
  }
}

class ShareSettingsSection extends StatelessWidget {
  final ShareSettings settings;
  final ValueChanged<ShareSettings> onChanged;

  const ShareSettingsSection({
    Key key,
    @required this.settings,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SettingsHeaderItem(title: S.current.settingsResultsSectionTitle),
        SwitchSettingItem(
          label: S.current.settingsShareResultsLabel,
          description: S.current.settingsShareResultsDesc,
          value: settings.shareResults,
          onChanged: (it) => onChanged(settings.copyWith(
            shareResults: it,
            attachLocation: it ? settings.attachLocation : false,
          )),
        ),
        SwitchSettingItem(
          label: S.current.settingsAttachLocationTitle,
          description: S.current.settingsAttachLocationDesc,
          enabled: settings.shareResults,
          value: settings.attachLocation,
          onChanged: (it) => onChanged(settings.copyWith(attachLocation: it)),
        ),
      ],
    );
  }
}

class SettingsFooterSection extends StatelessWidget {
  final AppInfo appInfo;
  final VoidCallback onShowIntroPressed;

  const SettingsFooterSection({
    Key key,
    @required this.appInfo,
    @required this.onShowIntroPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Center(
          child: ButtonTheme.fromButtonThemeData(
            data: R.themes.raisedButton,
            child: RaisedButton(
              child: Text(S.current.showIntroButtonLabel),
              onPressed: onShowIntroPressed,
            ),
          ),
        ),
        Container(height: 12.0),
        GestureDetector(
          onTap: () => showAboutDialog(
            context: context,
            applicationVersion: appInfo.version,
            applicationName: appInfo.name,
            applicationLegalese: appInfo.copyright,
            applicationIcon: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.asset(
                appInfo.icon,
                width: 36.0,
                height: 36.0,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  S.current.appVersion,
                  style: TextStyle(fontSize: 18.0, color: R.colors.gray),
                ),
                Container(width: 12.0),
                Text(
                  appInfo.version,
                  style: TextStyle(fontSize: 18.0, color: R.colors.primary),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
