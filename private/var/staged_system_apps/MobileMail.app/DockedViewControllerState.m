@interface DockedViewControllerState
+ (BOOL)supportsSecureCoding;
+ (id)withID:(id)a3 title:(id)a4;
- (BOOL)isEqual:(id)a3;
- (DockedViewControllerState)initWithCoder:(id)a3;
- (DockedViewControllerState)initWithDockableViewController:(id)a3;
- (NSString)dockIdentifier;
- (id)createDockedViewWithFrame:(CGRect)a3;
- (id)restoreViewControllerWithScene:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDockIdentifier:(id)a3;
@end

@implementation DockedViewControllerState

- (DockedViewControllerState)initWithDockableViewController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DockedViewControllerState;
  v5 = [(RestorableViewControllerState *)&v10 initWithRestorableViewController:v4];
  if (v5)
  {
    v6 = [v4 dockIdentifier];
    v7 = (NSString *)[v6 copy];
    dockIdentifier = v5->_dockIdentifier;
    v5->_dockIdentifier = v7;
  }
  return v5;
}

- (DockedViewControllerState)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DockedViewControllerState;
  v5 = [(RestorableViewControllerState *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDockIdentifierKey"];
    dockIdentifier = v5->_dockIdentifier;
    v5->_dockIdentifier = (NSString *)v6;
  }
  return v5;
}

- (id)restoreViewControllerWithScene:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DockedViewControllerState;
  v3 = [(RestorableViewControllerState *)&v5 restoreViewControllerWithScene:a3];

  return v3;
}

- (id)createDockedViewWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(RestorableViewControllerState *)self storedViewControllerClass];
  objc_super v9 = [(RestorableViewControllerState *)self storedUserActivity];
  objc_super v10 = -[objc_class dockedViewForUserActivity:withFrame:](v8, "dockedViewForUserActivity:withFrame:", v9, x, y, width, height);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DockedViewControllerState;
  [(RestorableViewControllerState *)&v6 encodeWithCoder:v4];
  dockIdentifier = self->_dockIdentifier;
  if (dockIdentifier) {
    [v4 encodeObject:dockIdentifier forKey:@"kDockIdentifierKey"];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = [v4 dockIdentifier];
    objc_super v6 = [(DockedViewControllerState *)self dockIdentifier];
    unsigned __int8 v7 = [v5 isEqualToString:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (NSString)dockIdentifier
{
  return self->_dockIdentifier;
}

- (void)setDockIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)withID:(id)a3 title:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v6)
    {
      unsigned __int8 v7 = v6;
    }
    else
    {
      objc_super v9 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned __int8 v7 = [v9 localizedStringForKey:@"NEW_MESSAGE" value:&stru_100619928 table:@"Main"];
    }
    v18[0] = MSMailActivityHandoffComposeKeyAutosaveID;
    v18[1] = MSMailActivityHandoffComposeKeySubject;
    v19[0] = v5;
    v19[1] = v7;
    objc_super v10 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    id v11 = objc_alloc((Class)NSUserActivity);
    id v12 = [v11 initWithActivityType:MSMailActivityHandoffTypeComposeWithStreams];
    [v12 setUserInfo:v10];
    v8 = [(RestorableViewControllerState *)[DockedViewControllerState alloc] initWithUserActivity:v12 viewControllerClass:objc_opt_class()];
    [(DockedViewControllerState *)v8 setDockIdentifier:v5];
    v13 = +[DockPersistenceSerialization log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = [(DockedViewControllerState *)v8 dockIdentifier];
      int v16 = 138412290;
      v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Created docked state with identifier: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    unsigned __int8 v7 = +[DockPersistenceSerialization log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100459A28();
    }
    v8 = 0;
  }

  return v8;
}

@end