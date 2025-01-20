@interface WFFocusConfigurationButton
+ (BOOL)supportsSecureCoding;
- (BOOL)isDestructive;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (NSString)localizedTitle;
- (WFFocusConfigurationButton)initWithCoder:(id)a3;
- (WFFocusConfigurationButton)initWithIdentifier:(id)a3 localizedTitle:(id)a4 isDestructive:(BOOL)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFFocusConfigurationButton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isDestructive
{
  return self->_isDestructive;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (WFFocusConfigurationButton)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTitle"];
  uint64_t v7 = [v4 decodeBoolForKey:@"isDestructive"];

  v8 = [(WFFocusConfigurationButton *)self initWithIdentifier:v5 localizedTitle:v6 isDestructive:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(WFFocusConfigurationButton *)self identifier];
  [v6 encodeObject:v4 forKey:@"identifier"];

  v5 = [(WFFocusConfigurationButton *)self localizedTitle];
  [v6 encodeObject:v5 forKey:@"localizedTitle"];

  objc_msgSend(v6, "encodeBool:forKey:", -[WFFocusConfigurationButton isDestructive](self, "isDestructive"), @"isDestructive");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [(WFFocusConfigurationButton *)self identifier];
    id v6 = [v4 identifier];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(WFFocusConfigurationButton *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (WFFocusConfigurationButton)initWithIdentifier:(id)a3 localizedTitle:(id)a4 isDestructive:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFFocusConfigurationButton;
  v11 = [(WFFocusConfigurationButton *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_localizedTitle, a4);
    v12->_isDestructive = a5;
    v13 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end