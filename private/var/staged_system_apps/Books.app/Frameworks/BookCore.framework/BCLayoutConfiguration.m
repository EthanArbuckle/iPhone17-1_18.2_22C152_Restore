@interface BCLayoutConfiguration
- (BCLayoutConfiguration)initWithViewController:(id)a3 configurationEnvironment:(id)a4;
- (BCLayoutConfigurationEnvironment)environment;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLayoutConfiguration:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation BCLayoutConfiguration

- (BCLayoutConfiguration)initWithViewController:(id)a3 configurationEnvironment:(id)a4
{
  id v6 = a3;
  v7 = (BCLayoutConfigurationEnvironment *)a4;
  if (!v7) {
    v7 = [[BCLayoutConfigurationEnvironment alloc] initWithViewController:v6];
  }
  v11.receiver = self;
  v11.super_class = (Class)BCLayoutConfiguration;
  v8 = [(BCLayoutConfiguration *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_environment, v7);
    objc_storeWeak((id *)&v9->_viewController, v6);
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [(id)objc_opt_class() allocWithZone:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  v7 = [(BCLayoutConfiguration *)self environment];
  id v8 = [v7 copyWithZone:a3];
  id v9 = [v5 initWithViewController:WeakRetained configurationEnvironment:v8];

  return v9;
}

- (BOOL)isEqualToLayoutConfiguration:(id)a3
{
  v4 = (id *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  id v6 = objc_loadWeakRetained(v4 + 1);
  if (WeakRetained == v6)
  {
    environment = self->_environment;
    if (environment == v4[2]) {
      unsigned __int8 v7 = 1;
    }
    else {
      unsigned __int8 v7 = -[BCLayoutConfigurationEnvironment isEqual:](environment, "isEqual:");
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BCLayoutConfiguration *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(BCLayoutConfiguration *)self isEqualToLayoutConfiguration:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  BOOL v5 = [(BCLayoutConfiguration *)self environment];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  unsigned __int8 v7 = +[NSString stringWithFormat:@"<%@:%p environment:%@, viewController:%@>", v4, self, v5, WeakRetained];

  return v7;
}

- (BCLayoutConfigurationEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);

  objc_destroyWeak((id *)&self->_viewController);
}

@end