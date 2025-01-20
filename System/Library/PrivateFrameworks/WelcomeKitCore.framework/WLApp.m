@interface WLApp
- (BOOL)isFree;
- (NSNumber)appStoreIdentifier;
- (NSString)bundleIdentifier;
- (WLApp)initWithBundleIdentifier:(id)a3 appStoreIdentifier:(id)a4 isFree:(BOOL)a5;
- (void)setAppStoreIdentifier:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setIsFree:(BOOL)a3;
@end

@implementation WLApp

- (WLApp)initWithBundleIdentifier:(id)a3 appStoreIdentifier:(id)a4 isFree:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WLApp;
  v10 = [(WLApp *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(WLApp *)v10 setBundleIdentifier:v8];
    [(WLApp *)v11 setAppStoreIdentifier:v9];
    [(WLApp *)v11 setIsFree:v5];
  }

  return v11;
}

- (BOOL)isFree
{
  return self->_isFree;
}

- (void)setIsFree:(BOOL)a3
{
  self->_isFree = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSNumber)appStoreIdentifier
{
  return self->_appStoreIdentifier;
}

- (void)setAppStoreIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end