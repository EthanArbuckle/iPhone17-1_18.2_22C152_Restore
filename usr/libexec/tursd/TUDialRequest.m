@interface TUDialRequest
+ (void)_logProvider:(id)a3;
- (BOOL)nph_isSOS;
- (BOOL)nph_needsPrompt;
- (BOOL)nph_needsRTTDisambiguationPrompt;
- (NSString)nph_errorAlertMessage;
- (id)nph_localizedShortDescription;
- (unint64_t)nph_audioMessageType;
- (void)nph_logWithReason:(id)a3 indented:(BOOL)a4;
- (void)setNph_audioMessageType:(unint64_t)a3;
- (void)setNph_errorAlertMessage:(id)a3;
@end

@implementation TUDialRequest

- (BOOL)nph_needsPrompt
{
  if ([(TUDialRequest *)self nph_isSOS]) {
    return 0;
  }

  return [(TUDialRequest *)self nph_needsRTTDisambiguationPrompt];
}

- (BOOL)nph_isSOS
{
  v3 = +[NSUserDefaults standardUserDefaults];
  v4 = [v3 stringForKey:@"CSLEmergencyPhoneNumber"];

  if (NPHDeviceOSIsInternalInstall()
    && v4
    && ([(TUDialRequest *)self handle],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 value],
        v6 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v7 = [v6 isEqualToString:v4],
        v6,
        v5,
        (v7 & 1) != 0))
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    unsigned __int8 v8 = [(TUDialRequest *)self isSOS];
  }

  return v8;
}

- (BOOL)nph_needsRTTDisambiguationPrompt
{
  v3 = [(TUDialRequest *)self provider];
  unsigned int v4 = [v3 isTelephonyProvider];

  if (v4)
  {
    int v5 = sub_100001210();
    if (v5 == 1)
    {
      [(TUDialRequest *)self setTtyType:2];
    }
    else if (v5 == 2)
    {
      return [(TUDialRequest *)self ttyType] == 0;
    }
  }
  return 0;
}

- (void)nph_logWithReason:(id)a3 indented:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned __int8 v7 = &stru_100010A90;
  if (v4) {
    unsigned __int8 v7 = @"\t";
  }
  unsigned __int8 v8 = v7;
  v9 = sub_100001854();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138413058;
    v11 = v8;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2048;
    v15 = self;
    __int16 v16 = 2112;
    v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@%@ TUDialRequest %p: %@", (uint8_t *)&v10, 0x2Au);
  }
}

+ (void)_logProvider:(id)a3
{
  id v3 = a3;
  BOOL v4 = sub_100001854();
  int v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "provider: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    sub_1000084C4(v5);
  }
}

- (NSString)nph_errorAlertMessage
{
  return (NSString *)objc_getAssociatedObject(self, "nph_errorAlertMessage");
}

- (void)setNph_errorAlertMessage:(id)a3
{
}

- (void)setNph_audioMessageType:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  objc_setAssociatedObject(self, "nph_audioMessageType", v4, (void *)3);
}

- (unint64_t)nph_audioMessageType
{
  v2 = objc_getAssociatedObject(self, "nph_audioMessageType");
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (id)nph_localizedShortDescription
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [(TUDialRequest *)self handle];
  int v5 = [v4 value];
  int v6 = TUNetworkCountryCode();
  if (v6)
  {
    id v7 = TUFormattedPhoneNumber();
  }
  else
  {
    unsigned __int8 v8 = TUHomeCountryCode();
    id v7 = TUFormattedPhoneNumber();
  }
  if (![v7 length])
  {
    if (([(TUDialRequest *)self isSOS] & 1) != 0
      || [(TUDialRequest *)self dialType] == (id)1)
    {
      CFStringRef v9 = @"PROMPT_RTT_CALL_EMERGENCY";
LABEL_8:
      uint64_t v10 = [v3 localizedStringForKey:v9 value:&stru_100010A90 table:0];

      id v7 = (void *)v10;
      goto LABEL_9;
    }
    if ([(TUDialRequest *)self dialType] == (id)2)
    {
      CFStringRef v9 = @"TOP_LEVEL_MENU_ITEM_VOICEMAIL";
      goto LABEL_8;
    }
    __int16 v12 = sub_100001854();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100008508(self, v12);
    }
  }
LABEL_9:

  return v7;
}

@end