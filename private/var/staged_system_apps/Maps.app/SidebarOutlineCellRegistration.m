@interface SidebarOutlineCellRegistration
+ (id)registrationWithCellClass:(Class)a3 configurationHandler:(id)a4;
- (id)viewModelConfigurationHandler;
@end

@implementation SidebarOutlineCellRegistration

+ (id)registrationWithCellClass:(Class)a3 configurationHandler:(id)a4
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___SidebarOutlineCellRegistration;
  id v5 = a4;
  v6 = [super registrationWithCellClass:a3 configurationHandler:&stru_10131BAE0];
  id v7 = objc_retainBlock(v5);

  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (id)viewModelConfigurationHandler
{
  return self->_viewModelConfigurationHandler;
}

- (void).cxx_destruct
{
}

@end