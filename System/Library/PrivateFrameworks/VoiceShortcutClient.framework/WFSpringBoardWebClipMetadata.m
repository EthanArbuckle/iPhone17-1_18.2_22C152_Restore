@interface WFSpringBoardWebClipMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)appIsInstalled;
- (NSString)applicationIdentifier;
- (NSString)shortcutIdentifier;
- (WFSpringBoardWebClipMetadata)initWithCoder:(id)a3;
- (WFSpringBoardWebClipMetadata)initWithShortcutIdentifier:(id)a3 applicationIdentifier:(id)a4 appIsInstalled:(BOOL)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFSpringBoardWebClipMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_shortcutIdentifier, 0);
}

- (BOOL)appIsInstalled
{
  return self->_appIsInstalled;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (NSString)shortcutIdentifier
{
  return self->_shortcutIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(WFSpringBoardWebClipMetadata *)self shortcutIdentifier];
  [v6 encodeObject:v4 forKey:@"shortcutIdentifier"];

  v5 = [(WFSpringBoardWebClipMetadata *)self applicationIdentifier];
  [v6 encodeObject:v5 forKey:@"applicationIdentifier"];

  objc_msgSend(v6, "encodeBool:forKey:", -[WFSpringBoardWebClipMetadata appIsInstalled](self, "appIsInstalled"), @"appIsInstalled");
}

- (WFSpringBoardWebClipMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFSpringBoardWebClipMetadata;
  v5 = [(WFSpringBoardWebClipMetadata *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortcutIdentifier"];
    shortcutIdentifier = v5->_shortcutIdentifier;
    v5->_shortcutIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationIdentifier"];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v8;

    v5->_appIsInstalled = [v4 decodeBoolForKey:@"appIsInstalled"];
    v10 = v5;
  }

  return v5;
}

- (WFSpringBoardWebClipMetadata)initWithShortcutIdentifier:(id)a3 applicationIdentifier:(id)a4 appIsInstalled:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WFSpringBoardWebClipMetadata;
  v10 = [(WFSpringBoardWebClipMetadata *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    shortcutIdentifier = v10->_shortcutIdentifier;
    v10->_shortcutIdentifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    applicationIdentifier = v10->_applicationIdentifier;
    v10->_applicationIdentifier = (NSString *)v13;

    v10->_appIsInstalled = a5;
    v15 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end