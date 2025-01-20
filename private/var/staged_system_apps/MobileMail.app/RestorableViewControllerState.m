@interface RestorableViewControllerState
+ (BOOL)supportsSecureCoding;
- (Class)storedViewControllerClass;
- (NSUserActivity)storedUserActivity;
- (RestorableViewControllerState)initWithCoder:(id)a3;
- (RestorableViewControllerState)initWithRestorableViewController:(id)a3;
- (RestorableViewControllerState)initWithUserActivity:(id)a3 viewControllerClass:(Class)a4;
- (id)restoreViewControllerWithScene:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setStoredUserActivity:(id)a3;
- (void)setStoredViewControllerClass:(Class)a3;
@end

@implementation RestorableViewControllerState

- (RestorableViewControllerState)initWithRestorableViewController:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RestorableViewControllerState;
  v5 = [(RestorableViewControllerState *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 userActivityForRestoration];
    storedUserActivity = v5->_storedUserActivity;
    v5->_storedUserActivity = (NSUserActivity *)v6;

    uint64_t v8 = objc_opt_class();
    Class storedViewControllerClass = v5->_storedViewControllerClass;
    v5->_Class storedViewControllerClass = (Class)v8;
  }
  return v5;
}

- (RestorableViewControllerState)initWithUserActivity:(id)a3 viewControllerClass:(Class)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RestorableViewControllerState;
  uint64_t v8 = [(RestorableViewControllerState *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_storedViewControllerClass, a4);
    objc_storeStrong((id *)&v9->_storedUserActivity, a3);
  }

  return v9;
}

- (id)restoreViewControllerWithScene:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc([(RestorableViewControllerState *)self storedViewControllerClass]);
  uint64_t v6 = [(RestorableViewControllerState *)self storedUserActivity];
  id v7 = [v5 initWithUserActivity:v6 scene:v4];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RestorableViewControllerState)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kStoredActivityType"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kStoredViewControllerClassName"];
  Class v7 = NSClassFromString(v6);
  uint64_t v8 = 0;
  if (v5)
  {
    Class v9 = v7;
    if (v7)
    {
      v17.receiver = self;
      v17.super_class = (Class)RestorableViewControllerState;
      v10 = [(RestorableViewControllerState *)&v17 init];
      if (v10)
      {
        objc_super v11 = (NSUserActivity *)[objc_alloc((Class)NSUserActivity) initWithActivityType:v5];
        storedUserActivity = v10->_storedUserActivity;
        v10->_storedUserActivity = v11;

        uint64_t v13 = objc_opt_class();
        v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, objc_opt_class(), 0);
        v15 = [v4 decodeObjectOfClasses:v14 forKey:@"kStoredActivityInfo"];
        [(NSUserActivity *)v10->_storedUserActivity setUserInfo:v15];

        objc_storeStrong((id *)&v10->_storedViewControllerClass, v9);
      }
      self = v10;
      uint64_t v8 = self;
    }
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = [(RestorableViewControllerState *)self storedUserActivity];
  id v5 = [v4 activityType];
  [v9 encodeObject:v5 forKey:@"kStoredActivityType"];

  uint64_t v6 = [(RestorableViewControllerState *)self storedUserActivity];
  Class v7 = [v6 userInfo];
  [v9 encodeObject:v7 forKey:@"kStoredActivityInfo"];

  uint64_t v8 = NSStringFromClass([(RestorableViewControllerState *)self storedViewControllerClass]);
  [v9 encodeObject:v8 forKey:@"kStoredViewControllerClassName"];
}

- (NSUserActivity)storedUserActivity
{
  return self->_storedUserActivity;
}

- (void)setStoredUserActivity:(id)a3
{
}

- (Class)storedViewControllerClass
{
  return self->_storedViewControllerClass;
}

- (void)setStoredViewControllerClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storedViewControllerClass, 0);

  objc_storeStrong((id *)&self->_storedUserActivity, 0);
}

@end