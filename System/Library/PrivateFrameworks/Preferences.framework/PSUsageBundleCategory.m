@interface PSUsageBundleCategory
+ (id)categoryNamed:(id)a3 withIdentifier:(id)a4 forUsageBundleApp:(id)a5;
- (NSString)identifier;
- (NSString)name;
- (PSUsageBundleApp)usageBundleApp;
- (id)description;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setUsageBundleApp:(id)a3;
@end

@implementation PSUsageBundleCategory

+ (id)categoryNamed:(id)a3 withIdentifier:(id)a4 forUsageBundleApp:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(PSUsageBundleCategory);
  [(PSUsageBundleCategory *)v10 setIdentifier:v8];

  [(PSUsageBundleCategory *)v10 setName:v9];
  [(PSUsageBundleCategory *)v10 setUsageBundleApp:v7];

  return v10;
}

- (id)description
{
  v3 = NSString;
  v4 = [(PSUsageBundleCategory *)self usageBundleApp];
  v5 = [v4 name];
  v6 = [(PSUsageBundleCategory *)self identifier];
  id v7 = [(PSUsageBundleCategory *)self name];
  id v8 = [v3 stringWithFormat:@"%@: %@ (%@)", v5, v6, v7];

  return v8;
}

- (PSUsageBundleApp)usageBundleApp
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_usageBundleApp);
  return (PSUsageBundleApp *)WeakRetained;
}

- (void)setUsageBundleApp:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_usageBundleApp);
}

@end