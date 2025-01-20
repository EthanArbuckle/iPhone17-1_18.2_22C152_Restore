@interface CXCallFailureContext
- (id)endedReasonUserInfoForCall:(id)a3;
@end

@implementation CXCallFailureContext

- (id)endedReasonUserInfoForCall:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableDictionary dictionary];
  v6 = [(CXCallFailureContext *)self title];
  [v5 setObject:v6 forKeyedSubscript:TUCallRemoteUnavailableTitle];

  v7 = [(CXCallFailureContext *)self message];
  id v8 = [v7 length];

  if (v8)
  {
    v9 = [(CXCallFailureContext *)self message];
    v10 = [v4 displayName];
    v11 = [v9 stringByReplacingOccurrencesOfString:@"<display_name>" withString:v10];

    [v5 setObject:v11 forKeyedSubscript:TUCallRemoteUnavailableMessage];
  }
  v12 = +[NSMutableArray array];
  v13 = +[NSMutableArray array];
  if ([(CXCallFailureContext *)self hasCellularSettingsRemediation])
  {
    v14 = TUBundle();
    v15 = [v14 localizedStringForKey:@"CELLULAR_SETTINGS" value:&stru_100517F40 table:@"TelephonyUtilities"];
    [v12 addObject:v15];

    v16 = +[NSURL URLWithString:@"prefs:root=MOBILE_DATA_SETTINGS_ID"];
    [v13 addObject:v16];
  }
  if ([(CXCallFailureContext *)self hasWiFiSettingsRemediation])
  {
    v17 = +[FTDeviceSupport sharedInstance];
    unsigned int v18 = [v17 supportsWLAN];
    v19 = TUBundle();
    v20 = v19;
    if (v18) {
      CFStringRef v21 = @"WLAN_SETTINGS";
    }
    else {
      CFStringRef v21 = @"WIFI_SETTINGS";
    }
    v22 = [v19 localizedStringForKey:v21 value:&stru_100517F40 table:@"TelephonyUtilities"];
    [v12 addObject:v22];

    v23 = +[NSURL URLWithString:@"prefs:root=WIFI"];
    [v13 addObject:v23];
  }
  if ([(CXCallFailureContext *)self hasDateAndTimeSettingsRemediation])
  {
    v24 = TUBundle();
    v25 = [v24 localizedStringForKey:@"SETTINGS" value:&stru_100517F40 table:@"TelephonyUtilities"];
    [v12 addObject:v25];

    v26 = +[NSURL URLWithString:@"prefs:root=General&path=DATE_AND_TIME"];
    [v13 addObject:v26];
  }
  if ([(CXCallFailureContext *)self hasLocationSettingsRemediation])
  {
    if ([v4 isVideo]) {
      +[IMService facetimeService];
    }
    else {
    v27 = +[IMService callService];
    }
    if (qword_10058C4F0 != -1) {
      dispatch_once(&qword_10058C4F0, &stru_1005096A0);
    }
    v28 = off_10058C4E8(v27);
    v29 = TUBundle();
    v30 = [v29 localizedStringForKey:@"SETTINGS" value:&stru_100517F40 table:@"TelephonyUtilities"];
    [v12 addObject:v30];

    v31 = [v28 uniqueID];
    v32 = +[NSString stringWithFormat:@"prefs:root=FACETIME&path=LOCATION&guid=%@", v31];
    v33 = +[NSURL URLWithString:v32];
    [v13 addObject:v33];
  }
  if ([v12 count])
  {
    v34 = [v12 objectAtIndexedSubscript:0];
    [v5 setObject:v34 forKeyedSubscript:TUCallRemoteUnavailableAlternateButton];

    v35 = [v13 objectAtIndexedSubscript:0];
    [v5 setObject:v35 forKeyedSubscript:TUCallRemoteUnavailableAlternateButtonURL];

    if ((unint64_t)[v12 count] >= 2)
    {
      v36 = [v12 objectAtIndexedSubscript:1];
      [v5 setObject:v36 forKeyedSubscript:TUCallRemoteUnavailableOtherButton];

      v37 = [v13 objectAtIndexedSubscript:1];
      [v5 setObject:v37 forKeyedSubscript:TUCallRemoteUnavailableOtherButtonURL];
    }
  }
  if ([v5 count]) {
    id v38 = [v5 copy];
  }
  else {
    id v38 = 0;
  }

  return v38;
}

@end