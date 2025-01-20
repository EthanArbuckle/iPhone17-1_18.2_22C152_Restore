@interface WFFocusConfigurationHostContext
+ (id)_allowedErrorClasses;
+ (id)_allowedItemPayloadClasses;
+ (id)_extensionAuxiliaryHostProtocol;
- (WFFocusConfigurationHostContextDelegate)focusConfigurationDelegate;
- (void)configurationUIStateDidUpdate:(id)a3;
- (void)didPressButtonWithIdentifier:(id)a3 cellFrame:(CGRect)a4;
- (void)setFocusConfigurationDelegate:(id)a3;
@end

@implementation WFFocusConfigurationHostContext

+ (id)_allowedItemPayloadClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

+ (id)_allowedErrorClasses
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C7E9CA8];
}

- (void).cxx_destruct
{
}

- (void)setFocusConfigurationDelegate:(id)a3
{
}

- (WFFocusConfigurationHostContextDelegate)focusConfigurationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusConfigurationDelegate);
  return (WFFocusConfigurationHostContextDelegate *)WeakRetained;
}

- (void)didPressButtonWithIdentifier:(id)a3 cellFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  id v10 = [(WFFocusConfigurationHostContext *)self focusConfigurationDelegate];
  objc_msgSend(v10, "focusConfigurationHostContext:didPressButtonWithIdentifier:cellFrame:", self, v9, x, y, width, height);
}

- (void)configurationUIStateDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(WFFocusConfigurationHostContext *)self focusConfigurationDelegate];
  [v5 focusConfigurationHostContext:self configurationUIStateDidChange:v4];
}

@end