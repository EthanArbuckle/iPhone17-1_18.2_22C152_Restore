@interface WFAutoShortcutEntityInfo
+ (BOOL)supportsSecureCoding;
- (NSString)name;
- (NSString)subtitle;
- (WFAutoShortcutEntityInfo)initWithCoder:(id)a3;
- (WFAutoShortcutEntityInfo)initWithName:(id)a3 subtitle:(id)a4 icon:(id)a5 badge:(unint64_t)a6;
- (WFContextualActionIcon)icon;
- (unint64_t)badge;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFAutoShortcutEntityInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (unint64_t)badge
{
  return self->_badge;
}

- (WFContextualActionIcon)icon
{
  return self->_icon;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)name
{
  return self->_name;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFAutoShortcutEntityInfo *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  v6 = [(WFAutoShortcutEntityInfo *)self subtitle];
  [v4 encodeObject:v6 forKey:@"subtitle"];

  v7 = [(WFAutoShortcutEntityInfo *)self icon];
  [v4 encodeObject:v7 forKey:@"icon"];

  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFAutoShortcutEntityInfo badge](self, "badge"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"badge"];
}

- (WFAutoShortcutEntityInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"badge"];

  v9 = [(WFAutoShortcutEntityInfo *)self initWithName:v5 subtitle:v6 icon:v7 badge:v8];
  return v9;
}

- (WFAutoShortcutEntityInfo)initWithName:(id)a3 subtitle:(id)a4 icon:(id)a5 badge:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WFAutoShortcutEntityInfo;
  v13 = [(WFAutoShortcutEntityInfo *)&v20 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    name = v13->_name;
    v13->_name = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    subtitle = v13->_subtitle;
    v13->_subtitle = (NSString *)v16;

    objc_storeStrong((id *)&v13->_icon, a5);
    v13->_badge = a6;
    v18 = v13;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end