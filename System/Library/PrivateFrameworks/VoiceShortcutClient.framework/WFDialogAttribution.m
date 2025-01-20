@interface WFDialogAttribution
+ (BOOL)supportsSecureCoding;
+ (WFDialogAttribution)attributionWithAppBundleIdentifier:(id)a3;
+ (WFDialogAttribution)attributionWithTitle:(id)a3 icon:(id)a4;
- (NSString)appBundleIdentifier;
- (NSString)title;
- (WFDialogAttribution)initWithCoder:(id)a3;
- (WFDialogAttribution)initWithTitle:(id)a3 icon:(id)a4;
- (WFDialogAttribution)initWithTitle:(id)a3 icon:(id)a4 workflowIcon:(id)a5;
- (WFDialogAttribution)initWithTitle:(id)a3 icon:(id)a4 workflowIcon:(id)a5 appBundleIdentifier:(id)a6;
- (WFIcon)icon;
- (WFWorkflowIcon)workflowIcon;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setWorkflowIcon:(id)a3;
@end

@implementation WFDialogAttribution

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowIcon, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setWorkflowIcon:(id)a3
{
}

- (WFWorkflowIcon)workflowIcon
{
  return self->_workflowIcon;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (WFIcon)icon
{
  return self->_icon;
}

- (NSString)title
{
  return self->_title;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFDialogAttribution *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  v6 = [(WFDialogAttribution *)self icon];
  [v4 encodeObject:v6 forKey:@"icon"];

  v7 = [(WFDialogAttribution *)self workflowIcon];
  [v4 encodeObject:v7 forKey:@"workflowIcon"];

  id v8 = [(WFDialogAttribution *)self appBundleIdentifier];
  [v4 encodeObject:v8 forKey:@"appBundleIdentifier"];
}

- (WFDialogAttribution)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workflowIcon"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appBundleIdentifier"];

  int v9 = INIsHomepod();
  v10 = 0;
  if (v6) {
    int v11 = 1;
  }
  else {
    int v11 = v9;
  }
  if (v5 && v11)
  {
    self = [(WFDialogAttribution *)self initWithTitle:v5 icon:v6 workflowIcon:v7 appBundleIdentifier:v8];
    v10 = self;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(WFDialogAttribution *)self title];
  v6 = [(WFDialogAttribution *)self icon];
  v7 = [(WFDialogAttribution *)self workflowIcon];
  id v8 = (void *)[v4 initWithTitle:v5 icon:v6 workflowIcon:v7];

  return v8;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(WFDialogAttribution *)self title];
  v7 = [(WFDialogAttribution *)self icon];
  id v8 = [v3 stringWithFormat:@"<%@: %p, title: %@, icon: %@>", v5, self, v6, v7];

  return v8;
}

- (WFDialogAttribution)initWithTitle:(id)a3 icon:(id)a4 workflowIcon:(id)a5 appBundleIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)WFDialogAttribution;
  v14 = [(WFDialogAttribution *)&v21 init];
  if (v14)
  {
    if ([v10 length])
    {
      uint64_t v15 = [v10 copy];
    }
    else
    {
      uint64_t v15 = WFLocalizedString(@"Shortcuts");
    }
    title = v14->_title;
    v14->_title = (NSString *)v15;

    if (v11) {
      v17 = (WFAppIcon *)v11;
    }
    else {
      v17 = [[WFAppIcon alloc] initWithBundleIdentifier:@"com.apple.shortcuts"];
    }
    icon = v14->_icon;
    v14->_icon = &v17->super;

    objc_storeStrong((id *)&v14->_workflowIcon, a5);
    objc_storeStrong((id *)&v14->_appBundleIdentifier, a6);
    v19 = v14;
  }

  return v14;
}

- (WFDialogAttribution)initWithTitle:(id)a3 icon:(id)a4 workflowIcon:(id)a5
{
  return [(WFDialogAttribution *)self initWithTitle:a3 icon:a4 workflowIcon:a5 appBundleIdentifier:0];
}

- (WFDialogAttribution)initWithTitle:(id)a3 icon:(id)a4
{
  return [(WFDialogAttribution *)self initWithTitle:a3 icon:a4 workflowIcon:0 appBundleIdentifier:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (WFDialogAttribution)attributionWithAppBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v4 allowPlaceholder:1 error:&v11];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 localizedName];
    id v8 = [[WFAppIcon alloc] initWithBundleIdentifier:v4];
    int v9 = [a1 attributionWithTitle:v7 icon:v8];
  }
  else
  {
    int v9 = 0;
  }

  return (WFDialogAttribution *)v9;
}

+ (WFDialogAttribution)attributionWithTitle:(id)a3 icon:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithTitle:v7 icon:v6];

  return (WFDialogAttribution *)v8;
}

@end