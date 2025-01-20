@interface AppNotificationSettings
- (AppNotificationSettings)initWithAnnounceEnabled:(BOOL)a3 carPlayBannersEnabled:(BOOL)a4;
- (BOOL)areCarPlayBannersEnabled;
- (BOOL)isAnnounceEnabled;
- (BOOL)isEqual:(id)a3;
- (void)setAnnounceEnabled:(BOOL)a3;
- (void)setCarPlayBannersEnabled:(BOOL)a3;
@end

@implementation AppNotificationSettings

- (AppNotificationSettings)initWithAnnounceEnabled:(BOOL)a3 carPlayBannersEnabled:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AppNotificationSettings;
  result = [(AppNotificationSettings *)&v7 init];
  if (result)
  {
    result->_announceEnabled = a3;
    result->_carPlayBannersEnabled = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [(AppNotificationSettings *)self isAnnounceEnabled];
    if (v6 == [v5 isAnnounceEnabled])
    {
      BOOL v8 = [(AppNotificationSettings *)self areCarPlayBannersEnabled];
      int v7 = v8 ^ [v5 areCarPlayBannersEnabled] ^ 1;
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isAnnounceEnabled
{
  return self->_announceEnabled;
}

- (void)setAnnounceEnabled:(BOOL)a3
{
  self->_announceEnabled = a3;
}

- (BOOL)areCarPlayBannersEnabled
{
  return self->_carPlayBannersEnabled;
}

- (void)setCarPlayBannersEnabled:(BOOL)a3
{
  self->_carPlayBannersEnabled = a3;
}

@end