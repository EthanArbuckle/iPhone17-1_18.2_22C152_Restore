@interface SUInstallOptions
- (id)initWithSUSUIInstallOptions:(id)a3;
@end

@implementation SUInstallOptions

- (id)initWithSUSUIInstallOptions:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v11;
  v11 = 0;
  v9 = [(SUInstallOptions *)v3 init];
  v11 = v9;
  objc_storeStrong((id *)&v11, v9);
  if (v9)
  {
    unsigned __int8 v4 = [location[0] installDark];
    [(SUInstallOptions *)v11 setDarkBoot:v4 & 1];
    unsigned __int8 v5 = [location[0] automaticInstallAttempt];
    [(SUInstallOptions *)v11 setAutomaticInstallation:v5 & 1];
    id v6 = [location[0] ignorableConstraints];
    [(SUInstallOptions *)v11 setIgnorableConstraints:v6];
  }
  v8 = v11;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v8;
}

@end