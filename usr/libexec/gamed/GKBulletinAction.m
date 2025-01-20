@interface GKBulletinAction
+ (BOOL)supportsSecureCoding;
- (BOOL)inAlertView;
- (BOOL)inBannerView;
- (BOOL)isDestructive;
- (GKBulletinAction)init;
- (GKBulletinAction)initWithCoder:(id)a3;
- (GKBulletinAction)initWithDictionary:(id)a3;
- (NSDictionary)actionDictionary;
- (NSNumber)adamID;
- (NSString)bundleID;
- (NSString)info;
- (NSString)playerID;
- (NSString)title;
- (id)appLaunchTrampolineURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAdamID:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setInAlertView:(BOOL)a3;
- (void)setInBannerView:(BOOL)a3;
- (void)setInfo:(id)a3;
- (void)setIsDestructive:(BOOL)a3;
- (void)setPlayerID:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation GKBulletinAction

- (GKBulletinAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKBulletinAction;
  result = [(GKBulletinAction *)&v3 init];
  if (result) {
    *(_WORD *)&result->_inAlertView = 257;
  }
  return result;
}

- (GKBulletinAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(GKBulletinAction *)self init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"type"];
    v5->_type = (int64_t)[v6 integerValue];

    uint64_t v7 = [v4 objectForKey:@"info"];
    info = v5->_info;
    v5->_info = (NSString *)v7;

    uint64_t v9 = [v4 objectForKey:@"adamID"];
    adamID = v5->_adamID;
    v5->_adamID = (NSNumber *)v9;

    uint64_t v11 = [v4 objectForKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v11;

    uint64_t v13 = [v4 objectForKey:@"playerID"];
    playerID = v5->_playerID;
    v5->_playerID = (NSString *)v13;
  }
  return v5;
}

- (GKBulletinAction)initWithCoder:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKBulletinAction initWithCoder:", buf, 2u);
  }
  v23.receiver = self;
  v23.super_class = (Class)GKBulletinAction;
  uint64_t v7 = [(GKBulletinAction *)&v23 init];
  if (v7)
  {
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v7->_type = (int64_t)[v8 integerValue];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v7->_title;
    v7->_title = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"info"];
    info = v7->_info;
    v7->_info = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"adamID"];
    adamID = v7->_adamID;
    v7->_adamID = (NSNumber *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v7->_bundleID;
    v7->_bundleID = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"playerID"];
    playerID = v7->_playerID;
    v7->_playerID = (NSString *)v17;

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isDestructive"];
    v7->_isDestructive = [v19 BOOLValue];

    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inAlertView"];
    v7->_inAlertView = [v20 BOOLValue];

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inBannerView"];
    v7->_inBannerView = [v21 BOOLValue];
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKBulletinAction encodeWithCoder:", v16, 2u);
  }
  uint64_t v7 = +[NSNumber numberWithInteger:[(GKBulletinAction *)self type]];
  [v4 encodeObject:v7 forKey:@"type"];

  v8 = [(GKBulletinAction *)self title];
  [v4 encodeObject:v8 forKey:@"title"];

  uint64_t v9 = [(GKBulletinAction *)self info];
  [v4 encodeObject:v9 forKey:@"info"];

  v10 = [(GKBulletinAction *)self adamID];
  [v4 encodeObject:v10 forKey:@"adamID"];

  uint64_t v11 = [(GKBulletinAction *)self bundleID];
  [v4 encodeObject:v11 forKey:@"bundleID"];

  v12 = [(GKBulletinAction *)self playerID];
  [v4 encodeObject:v12 forKey:@"playerID"];

  uint64_t v13 = +[NSNumber numberWithBool:[(GKBulletinAction *)self isDestructive]];
  [v4 encodeObject:v13 forKey:@"isDestructive"];

  v14 = +[NSNumber numberWithBool:[(GKBulletinAction *)self inAlertView]];
  [v4 encodeObject:v14 forKey:@"inAlertView"];

  uint64_t v15 = +[NSNumber numberWithBool:[(GKBulletinAction *)self inBannerView]];
  [v4 encodeObject:v15 forKey:@"inBannerView"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[GKBulletinAction allocWithZone:a3] init];
  v4->_type = self->_type;
  objc_storeStrong((id *)&v4->_info, self->_info);
  objc_storeStrong((id *)&v4->_title, self->_title);
  objc_storeStrong((id *)&v4->_adamID, self->_adamID);
  objc_storeStrong((id *)&v4->_bundleID, self->_bundleID);
  objc_storeStrong((id *)&v4->_playerID, self->_playerID);
  v4->_isDestructive = self->_isDestructive;
  v4->_inBannerView = self->_inBannerView;
  v4->_inAlertView = self->_inAlertView;
  return v4;
}

- (NSDictionary)actionDictionary
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKBulletinAction actionDictionary", v16, 2u);
  }
  id v5 = +[NSMutableDictionary dictionary];
  v6 = +[NSNumber numberWithLong:[(GKBulletinAction *)self type]];
  [v5 setObject:v6 forKey:@"type"];

  uint64_t v7 = [(GKBulletinAction *)self info];

  if (v7)
  {
    v8 = [(GKBulletinAction *)self info];
    [v5 setObject:v8 forKey:@"info"];
  }
  uint64_t v9 = [(GKBulletinAction *)self adamID];

  if (v9)
  {
    v10 = [(GKBulletinAction *)self adamID];
    [v5 setObject:v10 forKey:@"adamID"];
  }
  uint64_t v11 = [(GKBulletinAction *)self bundleID];

  if (v11)
  {
    v12 = [(GKBulletinAction *)self bundleID];
    [v5 setObject:v12 forKey:@"bundleID"];
  }
  uint64_t v13 = [(GKBulletinAction *)self playerID];

  if (v13)
  {
    v14 = [(GKBulletinAction *)self playerID];
    [v5 setObject:v14 forKey:@"playerID"];
  }

  return (NSDictionary *)v5;
}

- (id)description
{
  int64_t v3 = [(GKBulletinAction *)self type];
  CFStringRef v4 = @"NO TYPE";
  if (!v3) {
    CFStringRef v4 = @"NoAction";
  }
  if (v3 == 1) {
    CFStringRef v5 = @"LaunchTrampoline";
  }
  else {
    CFStringRef v5 = v4;
  }
  v14.receiver = self;
  v14.super_class = (Class)GKBulletinAction;
  v6 = [(GKBulletinAction *)&v14 description];
  uint64_t v7 = [(GKBulletinAction *)self title];
  v8 = [(GKBulletinAction *)self info];
  if ([(GKBulletinAction *)self isDestructive]) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  if ([(GKBulletinAction *)self inBannerView]) {
    CFStringRef v10 = @"YES";
  }
  else {
    CFStringRef v10 = @"NO";
  }
  if ([(GKBulletinAction *)self inAlertView]) {
    CFStringRef v11 = @"YES";
  }
  else {
    CFStringRef v11 = @"NO";
  }
  v12 = [v6 stringByAppendingFormat:@"\n\ttitle:%@\n\ttype:%@\n\tinfo:%@\n\tisDestructive:%@\n\tinBannerView:%@\n\tinAlertView:%@", v7, v5, v8, v9, v10, v11];

  return v12;
}

- (id)appLaunchTrampolineURL
{
  uint64_t v3 = [(GKBulletinAction *)self adamID];
  if (v3
    && (CFStringRef v4 = (void *)v3,
        [(GKBulletinAction *)self bundleID],
        CFStringRef v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = [(GKBulletinAction *)self adamID];
    uint64_t v7 = [v6 stringValue];
    v8 = [(GKBulletinAction *)self bundleID];
    CFStringRef v9 = +[NSBundle mainBundle];
    CFStringRef v10 = [v9 bundleIdentifier];
    CFStringRef v11 = +[ASCAppLaunchTrampolineURL URLWithAdamId:v7 bundleId:v8 localizedName:0 sourceApplication:v10 topic:0];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v12 = (id)GKOSLoggers();
    }
    uint64_t v13 = (void *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_10013AAD8(v13, self);
    }
    CFStringRef v11 = 0;
  }

  return v11;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSString)info
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInfo:(id)a3
{
}

- (NSNumber)adamID
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAdamID:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBundleID:(id)a3
{
}

- (NSString)playerID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPlayerID:(id)a3
{
}

- (BOOL)isDestructive
{
  return self->_isDestructive;
}

- (void)setIsDestructive:(BOOL)a3
{
  self->_isDestructive = a3;
}

- (BOOL)inAlertView
{
  return self->_inAlertView;
}

- (void)setInAlertView:(BOOL)a3
{
  self->_inAlertView = a3;
}

- (BOOL)inBannerView
{
  return self->_inBannerView;
}

- (void)setInBannerView:(BOOL)a3
{
  self->_inBannerView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_info, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end