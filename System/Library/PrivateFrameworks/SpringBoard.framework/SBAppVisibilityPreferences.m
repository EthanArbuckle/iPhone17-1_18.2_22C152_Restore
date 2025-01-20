@interface SBAppVisibilityPreferences
- (BOOL)isCurrentlyVisible;
- (BOOL)isDefaultVisible;
- (BOOL)update;
- (SBAppVisibilityPreferences)initWithDefaultVisible:(BOOL)a3 bundleID:(id)a4 containerPath:(id)a5;
- (id)description;
- (uint64_t)setCurrentlyVisible:(uint64_t)result;
@end

@implementation SBAppVisibilityPreferences

- (BOOL)update
{
  CFPreferencesAppSynchronize((CFStringRef)self->_bundleID);
  _CFPreferencesAppSynchronizeWithContainer();
  Boolean keyExistsAndHasValidFormat = 0;
  _CFPreferencesGetAppBooleanValueWithContainer();
  BOOL v3 = CFPreferencesGetAppBooleanValue(@"SBIconVisibility", (CFStringRef)self->_bundleID, &keyExistsAndHasValidFormat) != 0;
  if (!keyExistsAndHasValidFormat) {
    BOOL v3 = [(SBAppVisibilityPreferences *)self isDefaultVisible];
  }
  BOOL result = v3 ^ [(SBAppVisibilityPreferences *)self isCurrentlyVisible];
  self->_currentlyVisible = v3;
  return result;
}

- (BOOL)isDefaultVisible
{
  return self->_defaultVisible;
}

- (BOOL)isCurrentlyVisible
{
  return self->_currentlyVisible;
}

- (SBAppVisibilityPreferences)initWithDefaultVisible:(BOOL)a3 bundleID:(id)a4 containerPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBAppVisibilityPreferences;
  v10 = [(SBAppVisibilityPreferences *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    bundleID = v10->_bundleID;
    v10->_bundleID = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    containerPath = v10->_containerPath;
    v10->_containerPath = (NSString *)v13;

    v10->_defaultVisible = a3;
    v10->_currentlyVisible = a3;
    [(SBAppVisibilityPreferences *)v10 update];
  }

  return v10;
}

- (id)description
{
  BOOL v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p, bundle=%@ default=%i current=%i>", v5, self, self->_bundleID, -[SBAppVisibilityPreferences isDefaultVisible](self, "isDefaultVisible"), -[SBAppVisibilityPreferences isCurrentlyVisible](self, "isCurrentlyVisible")];

  return v6;
}

- (uint64_t)setCurrentlyVisible:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 25) = a2;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerPath, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end