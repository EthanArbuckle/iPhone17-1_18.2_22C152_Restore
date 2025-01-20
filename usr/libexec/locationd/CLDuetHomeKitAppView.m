@interface CLDuetHomeKitAppView
- (CLDuetHomeKitAppView)initWithHomeUUID:(id)a3 viewUUID:(id)a4 viewName:(id)a5 viewInformation:(id)a6;
- (NSString)homeUUID;
- (NSString)viewInformation;
- (NSString)viewName;
- (NSString)viewUUID;
- (void)dealloc;
- (void)setHomeUUID:(id)a3;
- (void)setViewInformation:(id)a3;
- (void)setViewName:(id)a3;
- (void)setViewUUID:(id)a3;
@end

@implementation CLDuetHomeKitAppView

- (CLDuetHomeKitAppView)initWithHomeUUID:(id)a3 viewUUID:(id)a4 viewName:(id)a5 viewInformation:(id)a6
{
  v13.receiver = self;
  v13.super_class = (Class)CLDuetHomeKitAppView;
  v10 = [(CLDuetHomeKitAppView *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(CLDuetHomeKitAppView *)v10 setHomeUUID:a3];
    [(CLDuetHomeKitAppView *)v11 setViewUUID:a4];
    [(CLDuetHomeKitAppView *)v11 setViewName:a5];
    [(CLDuetHomeKitAppView *)v11 setViewInformation:a6];
  }
  return v11;
}

- (void)dealloc
{
  [(CLDuetHomeKitAppView *)self setHomeUUID:0];
  [(CLDuetHomeKitAppView *)self setViewUUID:0];
  [(CLDuetHomeKitAppView *)self setViewName:0];
  [(CLDuetHomeKitAppView *)self setViewInformation:0];
  v3.receiver = self;
  v3.super_class = (Class)CLDuetHomeKitAppView;
  [(CLDuetHomeKitAppView *)&v3 dealloc];
}

- (NSString)homeUUID
{
  return self->_homeUUID;
}

- (void)setHomeUUID:(id)a3
{
}

- (NSString)viewUUID
{
  return self->_viewUUID;
}

- (void)setViewUUID:(id)a3
{
}

- (NSString)viewName
{
  return self->_viewName;
}

- (void)setViewName:(id)a3
{
}

- (NSString)viewInformation
{
  return self->_viewInformation;
}

- (void)setViewInformation:(id)a3
{
}

@end