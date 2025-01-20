@interface DPCDefaults
+ (BOOL)isRSSIModeEnabled;
+ (id)sharedInstance;
- (DPCDefaults)init;
- (id)NSNumberForDefault:(id)a3;
@end

@implementation DPCDefaults

+ (id)sharedInstance
{
  if (qword_100016EA8 != -1) {
    dispatch_once(&qword_100016EA8, &stru_100010488);
  }
  v2 = (void *)qword_100016EB0;

  return v2;
}

- (DPCDefaults)init
{
  v8.receiver = self;
  v8.super_class = (Class)DPCDefaults;
  v2 = [(DPCDefaults *)&v8 init];
  if (v2)
  {
    v3 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.devicepresence"];
    defaults = v2->_defaults;
    v2->_defaults = v3;

    v9[0] = @"DPCDefaultsThresholdD1";
    v9[1] = @"DPCDefaultsThresholdD2";
    v10[0] = &off_100010D98;
    v10[1] = &off_100010DB0;
    v9[2] = @"DPCDefaultsThresholdDMAX";
    v9[3] = @"DPCDefaultsThresholdDMIN";
    v10[2] = &off_100010DC8;
    v10[3] = &off_100010D68;
    v9[4] = @"DPCDefaultsThresholdDDiscovery";
    v9[5] = @"DPCDefaultsHoldOffSec";
    v10[4] = &off_100010D80;
    v10[5] = &off_100010E58;
    v9[6] = @"DPCDefaultsAPWakeToSuppressionBreakEvenDuration";
    v9[7] = @"DPCDefaultsPowerWinGainTimes";
    v10[6] = &off_100010E68;
    v10[7] = &off_100010DE0;
    v9[8] = @"DPCDefaultsSessionBasedAdaptiveRSSIEnabled";
    v9[9] = @"DPCDefaultsBTCRSSIWindowSizeD1";
    v10[8] = &off_100010E28;
    v10[9] = &off_100010DF8;
    v9[10] = @"DPCDefaultsBTCRSSIWindowSizeD2";
    v9[11] = @"DPCDefaultsD2FixedStepSize";
    v10[10] = &off_100010DF8;
    v10[11] = &off_100010E10;
    v9[12] = @"DPCDefaultsSessionBasedAdaptiveRSSITwoWaysEnabled";
    v9[13] = @"DPCDefaultsSessionBasedAdaptiveRSSICapValue";
    v10[12] = &off_100010D68;
    v10[13] = &off_100010E40;
    uint64_t v5 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:14];
    defaultValues = v2->_defaultValues;
    v2->_defaultValues = (NSDictionary *)v5;

    [(NSUserDefaults *)v2->_defaults registerDefaults:v2->_defaultValues];
  }
  return v2;
}

- (id)NSNumberForDefault:(id)a3
{
  defaults = self->_defaults;
  id v5 = a3;
  v6 = [(NSUserDefaults *)defaults objectForKey:v5];

  if (v6)
  {
    NSInteger v7 = [(NSUserDefaults *)self->_defaults integerForKey:v5];

    objc_super v8 = +[NSNumber numberWithInteger:v7];
  }
  else
  {
    objc_super v8 = [(NSDictionary *)self->_defaultValues objectForKey:v5];
  }

  return v8;
}

+ (BOOL)isRSSIModeEnabled
{
  return __os_feature_enabled_impl("DevicePresence", "RSSIMode");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValues, 0);

  objc_storeStrong((id *)&self->_defaults, 0);
}

@end