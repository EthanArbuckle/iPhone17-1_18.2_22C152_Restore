@interface WFSiriLinkRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)showWhenRun;
- (LNAction)action;
- (NSString)bundleIdentifier;
- (NSString)nameOverride;
- (WFSiriLinkRequest)initWithAction:(id)a3 bundleIdentifier:(id)a4 nameOverride:(id)a5 showWhenRun:(BOOL)a6;
- (WFSiriLinkRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFSiriLinkRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameOverride, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (BOOL)showWhenRun
{
  return self->_showWhenRun;
}

- (NSString)nameOverride
{
  return self->_nameOverride;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (LNAction)action
{
  return self->_action;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFSiriLinkRequest;
  id v4 = a3;
  [(WFSiriActionRequest *)&v8 encodeWithCoder:v4];
  v5 = [(WFSiriLinkRequest *)self action];
  [v4 encodeObject:v5 forKey:@"action"];

  v6 = [(WFSiriLinkRequest *)self bundleIdentifier];
  [v4 encodeObject:v6 forKey:@"bundleIdentifier"];

  v7 = [(WFSiriLinkRequest *)self nameOverride];
  [v4 encodeObject:v7 forKey:@"nameOverride"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFSiriLinkRequest showWhenRun](self, "showWhenRun"), @"showWhenRun");
}

- (WFSiriLinkRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFSiriLinkRequest;
  v5 = [(WFSiriActionRequest *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
    action = v5->_action;
    v5->_action = (LNAction *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nameOverride"];
    nameOverride = v5->_nameOverride;
    v5->_nameOverride = (NSString *)v10;

    v5->_showWhenRun = [v4 decodeBoolForKey:@"showWhenRun"];
    v12 = v5;
  }

  return v5;
}

- (WFSiriLinkRequest)initWithAction:(id)a3 bundleIdentifier:(id)a4 nameOverride:(id)a5 showWhenRun:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WFSiriLinkRequest;
  objc_super v14 = [(WFSiriActionRequest *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_action, a3);
    objc_storeStrong((id *)&v15->_bundleIdentifier, a4);
    objc_storeStrong((id *)&v15->_nameOverride, a5);
    v15->_showWhenRun = a6;
    v16 = v15;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end