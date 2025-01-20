@interface MSDConfigurationProfile
- (MSDConfigurationProfile)initWithDefaultProfile;
- (MSDConfigurationProfile)initWithDemoModeProfile;
- (MSDConfigurationProfile)initWithFile:(id)a3 andIdentifier:(id)a4;
- (NSString)profileIdentifier;
- (NSString)profilePath;
- (id)getProfileData;
- (id)getSupervisedRestrictions;
- (void)setProfileIdentifier:(id)a3;
- (void)setProfilePath:(id)a3;
@end

@implementation MSDConfigurationProfile

- (MSDConfigurationProfile)initWithFile:(id)a3 andIdentifier:(id)a4
{
  id v6 = a3;
  v7 = (__CFString *)a4;
  v11.receiver = self;
  v11.super_class = (Class)MSDConfigurationProfile;
  v8 = [(MSDConfigurationProfile *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(MSDConfigurationProfile *)v8 setProfilePath:v6];
    if ([(__CFString *)v7 isEqualToString:@"com.apple.mobilestoredemo.demoBundleProfile"])
    {

      v7 = @"com.apple.mobilestoredemo.demoProfile.standardPreferences";
    }
    [(MSDConfigurationProfile *)v9 setProfileIdentifier:v7];
  }

  return v9;
}

- (MSDConfigurationProfile)initWithDefaultProfile
{
  v5.receiver = self;
  v5.super_class = (Class)MSDConfigurationProfile;
  v2 = [(MSDConfigurationProfile *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(MSDConfigurationProfile *)v2 setProfilePath:0];
    [(MSDConfigurationProfile *)v3 setProfileIdentifier:@"com.apple.mobilestoredemo.defaultProfile"];
  }
  return v3;
}

- (MSDConfigurationProfile)initWithDemoModeProfile
{
  v5.receiver = self;
  v5.super_class = (Class)MSDConfigurationProfile;
  v2 = [(MSDConfigurationProfile *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(MSDConfigurationProfile *)v2 setProfilePath:0];
    [(MSDConfigurationProfile *)v3 setProfileIdentifier:@"com.apple.mobilestoredemo.demoMode"];
  }
  return v3;
}

- (id)getProfileData
{
  v3 = [(MSDConfigurationProfile *)self profileIdentifier];
  unsigned int v4 = [v3 isEqualToString:@"com.apple.mobilestoredemo.defaultProfile"];

  if (v4)
  {
    uint64_t v5 = dword_100187CB0;
    id v6 = aXmlVersion10En;
LABEL_5:
    v9 = +[NSData dataWithBytes:v6 length:v5];
    goto LABEL_13;
  }
  v7 = [(MSDConfigurationProfile *)self profileIdentifier];
  unsigned int v8 = [v7 isEqualToString:@"com.apple.mobilestoredemo.demoMode"];

  if (v8)
  {
    uint64_t v5 = dword_10018830C;
    id v6 = aXmlVersion10En_0;
    goto LABEL_5;
  }
  v10 = [(MSDConfigurationProfile *)self profileIdentifier];
  if ([v10 isEqualToString:@"com.apple.mobilestoredemo.demoProfile.standardPreferences"])
  {

LABEL_9:
    v13 = [(MSDConfigurationProfile *)self profilePath];
    v9 = +[NSData dataWithContentsOfFile:v13];

    goto LABEL_13;
  }
  objc_super v11 = [(MSDConfigurationProfile *)self profileIdentifier];
  unsigned int v12 = [v11 isEqualToString:@"com.apple.mobilestoredemo.mdmProfile.dockLayout"];

  if (v12) {
    goto LABEL_9;
  }
  v14 = sub_100068600();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [(MSDConfigurationProfile *)self profileIdentifier];
    int v17 = 138543362;
    v18 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "getProfileData called for unknown profile type: %{public}@", (uint8_t *)&v17, 0xCu);
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (id)getSupervisedRestrictions
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v4 = [(MSDConfigurationProfile *)self profileIdentifier];
  unsigned int v5 = [v4 isEqualToString:@"com.apple.mobilestoredemo.demoProfile.supervisedRestrictions"];

  if (v5)
  {
    id v6 = [(MSDConfigurationProfile *)self profilePath];
    v7 = +[NSDictionary dictionaryWithContentsOfFile:v6];
    unsigned int v8 = [v7 objectForKey:@"PayloadContent"];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v8;
    id v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v22)
    {
      uint64_t v21 = *(void *)v29;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = v9;
          v10 = *(void **)(*((void *)&v28 + 1) + 8 * v9);
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v11 = v10;
          id v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v25;
            do
            {
              for (i = 0; i != v13; i = (char *)i + 1)
              {
                if (*(void *)v25 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
                if (([v16 containsString:@"Payload"] & 1) == 0)
                {
                  int v17 = [v11 objectForKey:v16];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    CFTypeID v18 = CFGetTypeID(v17);
                    if (v18 == CFBooleanGetTypeID()) {
                      [v3 MCSetBoolRestriction:v16 value:[v17 BOOLValue]];
                    }
                  }
                }
              }
              id v13 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v13);
          }

          uint64_t v9 = v23 + 1;
        }
        while ((id)(v23 + 1) != v22);
        id v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v22);
    }
  }

  return v3;
}

- (NSString)profileIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setProfileIdentifier:(id)a3
{
}

- (NSString)profilePath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProfilePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profilePath, 0);

  objc_storeStrong((id *)&self->_profileIdentifier, 0);
}

@end