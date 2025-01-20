@interface SFWebExtensionButtonConfiguration
- (BOOL)alwaysShowMultipleExtensionsButton;
- (BOOL)isEqual:(id)a3;
- (NSArray)buttons;
- (SFWebExtensionButtonConfiguration)initWithActiveExtensionCount:(unint64_t)a3 alwaysShowMultipleExtensionsButton:(BOOL)a4 buttons:(id)a5 extensionsController:(id)a6;
- (SFWebExtensionsController)webExtensionsController;
- (unint64_t)activeExtensionCount;
@end

@implementation SFWebExtensionButtonConfiguration

- (SFWebExtensionButtonConfiguration)initWithActiveExtensionCount:(unint64_t)a3 alwaysShowMultipleExtensionsButton:(BOOL)a4 buttons:(id)a5 extensionsController:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SFWebExtensionButtonConfiguration;
  v13 = [(SFWebExtensionButtonConfiguration *)&v17 init];
  v14 = v13;
  if (v13)
  {
    v13->_activeExtensionCount = a3;
    v13->_alwaysShowMultipleExtensionsButton = a4;
    objc_storeStrong((id *)&v13->_buttons, a5);
    objc_storeStrong((id *)&v14->_webExtensionsController, a6);
    v15 = v14;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFWebExtensionButtonConfiguration *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = v5;
      if (self->_activeExtensionCount == v5->_activeExtensionCount
        && self->_alwaysShowMultipleExtensionsButton == v5->_alwaysShowMultipleExtensionsButton)
      {
        char v7 = WBSIsEqual();
      }
      else
      {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)activeExtensionCount
{
  return self->_activeExtensionCount;
}

- (BOOL)alwaysShowMultipleExtensionsButton
{
  return self->_alwaysShowMultipleExtensionsButton;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (SFWebExtensionsController)webExtensionsController
{
  return self->_webExtensionsController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webExtensionsController, 0);

  objc_storeStrong((id *)&self->_buttons, 0);
}

@end