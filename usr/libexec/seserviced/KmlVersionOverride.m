@interface KmlVersionOverride
+ (id)sharedVersionsOverrides;
- (KmlVersionOverride)init;
- (unsigned)keyRoleToShare;
- (unsigned)kmlOverrideVersion;
- (void)setKeyRoleToShare:(unsigned __int16)a3;
- (void)setKmlOverrideVersion:(unsigned __int16)a3;
@end

@implementation KmlVersionOverride

+ (id)sharedVersionsOverrides
{
  if (qword_100468348 != -1) {
    dispatch_once(&qword_100468348, &stru_100419B68);
  }
  v2 = (void *)qword_100468340;

  return v2;
}

- (KmlVersionOverride)init
{
  v13.receiver = self;
  v13.super_class = (Class)KmlVersionOverride;
  v2 = [(KmlVersionOverride *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_kmlOverrideVersion = 768;
    id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.seserviced"];
    v5 = [v4 stringForKey:@"KmlVersion"];
    unsigned int v6 = [v5 isEqualToString:@"SharingInChainTest"];
    if (v6) {
      v3->_kmlOverrideVersion = 256;
    }
    v3->_keyRoleToShare = -1;
    v11 = [v4 objectForKey:@"KeyRole"];
    if (v11)
    {
      v3->_keyRoleToShare = (unsigned __int16)[v4 integerForKey:@"KeyRole"];
    }
    else if (!v6)
    {
LABEL_8:

      return v3;
    }
    KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlVersionOverride init]", 63, @"UserDefault: %@", v7, v8, v9, v10, (uint64_t)v4);
    goto LABEL_8;
  }
  return v3;
}

- (unsigned)kmlOverrideVersion
{
  return self->_kmlOverrideVersion;
}

- (void)setKmlOverrideVersion:(unsigned __int16)a3
{
  self->_kmlOverrideVersion = a3;
}

- (unsigned)keyRoleToShare
{
  return self->_keyRoleToShare;
}

- (void)setKeyRoleToShare:(unsigned __int16)a3
{
  self->_keyRoleToShare = a3;
}

@end