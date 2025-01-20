@interface CSStudiesServerConfiguration
+ (id)igneousCMPrototypingConfiguration;
+ (id)igneousGMConfiguration;
+ (id)igneousStagingConfiguration;
+ (id)kappaCMPrototypingConfiguration;
+ (id)kappaGMConfiguration;
+ (id)kappaInternalConfiguration;
+ (id)kappaStagingConfiguration;
+ (id)persistentConfiguration;
+ (id)persistentConfigurationIgneous;
- (CSStudiesServerConfiguration)initWithServer:(id)a3 certificate:(id)a4 study:(id)a5 andAuthorizationID:(id)a6;
- (NSString)auth;
- (NSString)certificate;
- (NSString)server;
- (NSUUID)studyUUID;
@end

@implementation CSStudiesServerConfiguration

- (CSStudiesServerConfiguration)initWithServer:(id)a3 certificate:(id)a4 study:(id)a5 andAuthorizationID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CSStudiesServerConfiguration;
  v15 = [(CSStudiesServerConfiguration *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_server, a3);
    objc_storeStrong((id *)&v16->_certificate, a4);
    objc_storeStrong((id *)&v16->_studyUUID, a5);
    objc_storeStrong((id *)&v16->_auth, a6);
  }

  return v16;
}

+ (id)persistentConfiguration
{
  v2 = +[CSPersistentConfiguration sharedConfiguration];
  v3 = [v2 objectForKey:@"hdsEndpointName"];
  if ([v3 isEqualToString:@"GM"])
  {
    uint64_t v4 = +[CSStudiesServerConfiguration kappaGMConfiguration];
  }
  else if ([v3 isEqualToString:@"Internal"])
  {
    uint64_t v4 = +[CSStudiesServerConfiguration kappaInternalConfiguration];
  }
  else if ([v3 isEqualToString:@"CMPrototyping"])
  {
    uint64_t v4 = +[CSStudiesServerConfiguration kappaCMPrototypingConfiguration];
  }
  else
  {
    if (![v3 isEqualToString:@"Staging"])
    {
      v7 = +[CSPlatformInfo sharedInstance];
      if ([v7 isInternalInstall]) {
        +[CSStudiesServerConfiguration kappaInternalConfiguration];
      }
      else {
      v5 = +[CSStudiesServerConfiguration kappaGMConfiguration];
      }

      goto LABEL_10;
    }
    uint64_t v4 = +[CSStudiesServerConfiguration kappaStagingConfiguration];
  }
  v5 = (void *)v4;
LABEL_10:

  return v5;
}

+ (id)persistentConfigurationIgneous
{
  v2 = +[CSPersistentConfiguration sharedConfiguration];
  v3 = [v2 objectForKey:@"hdsEndpointNameIgneous"];
  if ([v3 isEqualToString:@"GM"]) {
    goto LABEL_2;
  }
  if ([v3 isEqualToString:@"CMPrototyping"])
  {
    uint64_t v4 = +[CSStudiesServerConfiguration igneousCMPrototypingConfiguration];
  }
  else
  {
    if (![v3 isEqualToString:@"Staging"])
    {
LABEL_2:
      uint64_t v4 = +[CSStudiesServerConfiguration igneousGMConfiguration];
      goto LABEL_7;
    }
    uint64_t v4 = +[CSStudiesServerConfiguration igneousStagingConfiguration];
  }
LABEL_7:
  v5 = (void *)v4;

  return v5;
}

+ (id)kappaGMConfiguration
{
  if (qword_1003DD680 != -1) {
    dispatch_once(&qword_1003DD680, &stru_10039B2D8);
  }
  v2 = (void *)qword_1003DD648;

  return v2;
}

+ (id)kappaInternalConfiguration
{
  if (qword_1003DD688 != -1) {
    dispatch_once(&qword_1003DD688, &stru_10039B2F8);
  }
  v2 = (void *)qword_1003DD650;

  return v2;
}

+ (id)kappaCMPrototypingConfiguration
{
  if (qword_1003DD690 != -1) {
    dispatch_once(&qword_1003DD690, &stru_10039B318);
  }
  v2 = (void *)qword_1003DD658;

  return v2;
}

+ (id)kappaStagingConfiguration
{
  if (qword_1003DD698 != -1) {
    dispatch_once(&qword_1003DD698, &stru_10039B338);
  }
  v2 = (void *)qword_1003DD660;

  return v2;
}

+ (id)igneousCMPrototypingConfiguration
{
  if (qword_1003DD6A0 != -1) {
    dispatch_once(&qword_1003DD6A0, &stru_10039B358);
  }
  v2 = (void *)qword_1003DD668;

  return v2;
}

+ (id)igneousStagingConfiguration
{
  if (qword_1003DD6A8 != -1) {
    dispatch_once(&qword_1003DD6A8, &stru_10039B378);
  }
  v2 = (void *)qword_1003DD670;

  return v2;
}

+ (id)igneousGMConfiguration
{
  if (qword_1003DD6B0 != -1) {
    dispatch_once(&qword_1003DD6B0, &stru_10039B398);
  }
  v2 = (void *)qword_1003DD678;

  return v2;
}

- (NSString)server
{
  return self->_server;
}

- (NSString)certificate
{
  return self->_certificate;
}

- (NSUUID)studyUUID
{
  return self->_studyUUID;
}

- (NSString)auth
{
  return self->_auth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auth, 0);
  objc_storeStrong((id *)&self->_studyUUID, 0);
  objc_storeStrong((id *)&self->_certificate, 0);

  objc_storeStrong((id *)&self->_server, 0);
}

@end