@interface SBIconViewDragInfo
+ (BOOL)supportsSecureCoding;
- (NSArray)customIconDataSourceConfigurations;
- (NSString)activeCustomIconDataSourceUniqueIdentifier;
- (NSString)applicationBundleIdentifier;
- (NSString)description;
- (NSString)gridSizeClass;
- (NSString)uniqueIdentifier;
- (NSURL)launchURL;
- (SBIconViewDragInfo)initWithCoder:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)startLocation;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveCustomIconDataSourceUniqueIdentifier:(id)a3;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setCustomIconDataSourceConfigurations:(id)a3;
- (void)setGridSizeClass:(id)a3;
- (void)setLaunchURL:(id)a3;
- (void)setStartLocation:(int64_t)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation SBIconViewDragInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uniqueIdentifier = self->_uniqueIdentifier;
  id v5 = a3;
  [v5 encodeObject:uniqueIdentifier forKey:@"uniqueIdentifier"];
  [v5 encodeObject:self->_applicationBundleIdentifier forKey:@"applicationBundleIdentifier"];
  [v5 encodeObject:self->_launchURL forKey:@"launchURL"];
  [v5 encodeInteger:self->_startLocation forKey:@"startLocation"];
  [v5 encodeObject:self->_customIconDataSourceConfigurations forKey:@"customIconDataSourceConfigurations"];
  [v5 encodeObject:self->_activeCustomIconDataSourceUniqueIdentifier forKey:@"activeCustomIconDataSourceUniqueIdentifier"];
  [v5 encodeObject:self->_gridSizeClass forKey:@"gridSizeClass"];
}

- (SBIconViewDragInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SBIconViewDragInfo;
  id v5 = [(SBIconViewDragInfo *)&v23 init];
  if (v5)
  {
    v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"uniqueIdentifier"];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v7;

    v9 = self;
    uint64_t v10 = [v4 decodeObjectOfClass:v9 forKey:@"applicationBundleIdentifier"];
    applicationBundleIdentifier = v5->_applicationBundleIdentifier;
    v5->_applicationBundleIdentifier = (NSString *)v10;

    v12 = self;
    uint64_t v13 = [v4 decodeObjectOfClass:v12 forKey:@"launchURL"];
    launchURL = v5->_launchURL;
    v5->_launchURL = (NSURL *)v13;

    v5->_startLocation = [v4 decodeIntegerForKey:@"startLocation"];
    uint64_t v15 = [v4 decodeObjectForKey:@"customIconDataSourceConfigurations"];
    customIconDataSourceConfigurations = v5->_customIconDataSourceConfigurations;
    v5->_customIconDataSourceConfigurations = (NSArray *)v15;

    uint64_t v17 = [v4 decodeObjectForKey:@"activeCustomIconDataSourceUniqueIdentifier"];
    activeCustomIconDataSourceUniqueIdentifier = v5->_activeCustomIconDataSourceUniqueIdentifier;
    v5->_activeCustomIconDataSourceUniqueIdentifier = (NSString *)v17;

    v19 = self;
    uint64_t v20 = [v4 decodeObjectOfClass:v19 forKey:@"gridSizeClass"];
    gridSizeClass = v5->_gridSizeClass;
    v5->_gridSizeClass = (NSString *)v20;
  }
  return v5;
}

- (NSString)description
{
  return (NSString *)[(SBIconViewDragInfo *)self descriptionWithMultilinePrefix:@"\t"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBIconViewDragInfo *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescription
{
  v2 = [(SBIconViewDragInfo *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = (id)[v4 appendObject:self->_uniqueIdentifier withName:@"uniqueIdentifier"];
  id v6 = (id)[v4 appendObject:self->_applicationBundleIdentifier withName:@"applicationBundleIdentifier"];
  id v7 = (id)[v4 appendObject:self->_launchURL withName:@"launchURL"];
  id v8 = (id)[v4 appendInteger:self->_startLocation withName:@"startLocation"];
  id v9 = (id)[v4 appendObject:self->_customIconDataSourceConfigurations withName:@"customIconDataSourceConfigurations"];
  id v10 = (id)[v4 appendObject:self->_activeCustomIconDataSourceUniqueIdentifier withName:@"activeCustomIconDataSourceUniqueIdentifier"];
  [v4 appendString:self->_gridSizeClass withName:@"gridSizeClass"];
  return v4;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (NSURL)launchURL
{
  return self->_launchURL;
}

- (void)setLaunchURL:(id)a3
{
}

- (int64_t)startLocation
{
  return self->_startLocation;
}

- (void)setStartLocation:(int64_t)a3
{
  self->_startLocation = a3;
}

- (NSString)activeCustomIconDataSourceUniqueIdentifier
{
  return self->_activeCustomIconDataSourceUniqueIdentifier;
}

- (void)setActiveCustomIconDataSourceUniqueIdentifier:(id)a3
{
}

- (NSArray)customIconDataSourceConfigurations
{
  return self->_customIconDataSourceConfigurations;
}

- (void)setCustomIconDataSourceConfigurations:(id)a3
{
}

- (NSString)gridSizeClass
{
  return self->_gridSizeClass;
}

- (void)setGridSizeClass:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridSizeClass, 0);
  objc_storeStrong((id *)&self->_customIconDataSourceConfigurations, 0);
  objc_storeStrong((id *)&self->_activeCustomIconDataSourceUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end