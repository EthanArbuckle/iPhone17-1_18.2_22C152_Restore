@interface NDOConversionOutreachActivity
+ (id)outreachActivityForSerialNumber:(id)a3;
- (BOOL)requiresNetwork;
- (NSString)identifier;
- (NSString)uuid;
- (NSString)warrantySN;
- (void)performActivityForScheduler:(id)a3 withCompletionHandler:(id)a4;
- (void)setWarrantySN:(id)a3;
@end

@implementation NDOConversionOutreachActivity

- (NSString)identifier
{
  return (NSString *)@"com.apple.ndoagent.conversionoutreach";
}

- (NSString)uuid
{
  return [(NDOConversionOutreachActivity *)self warrantySN];
}

- (BOOL)requiresNetwork
{
  return 1;
}

- (void)performActivityForScheduler:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  v9 = _NDOLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136446210;
    v12 = "-[NDOConversionOutreachActivity performActivityForScheduler:withCompletionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: for conversion outreach", (uint8_t *)&v11, 0xCu);
  }

  v10 = [(NDOConversionOutreachActivity *)self identifier];
  [v8 performOutreachActivityForActivityID:v10 withScheduler:v7 andCompletion:v6];
}

+ (id)outreachActivityForSerialNumber:(id)a3
{
  id v3 = a3;
  v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    v8 = "+[NDOConversionOutreachActivity outreachActivityForSerialNumber:]";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: for conversion outreach %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = objc_opt_new();
  [v5 setWarrantySN:v3];

  return v5;
}

- (NSString)warrantySN
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setWarrantySN:(id)a3
{
}

- (void).cxx_destruct
{
}

@end