@interface COSSecurePairingFlowViewController
- (BOOL)darkStyle;
- (BOOL)isOverCamera;
- (Class)pairingControllerClass;
- (void)setDarkStyle:(BOOL)a3;
@end

@implementation COSSecurePairingFlowViewController

- (BOOL)isOverCamera
{
  return !self->_darkStyle;
}

- (Class)pairingControllerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)darkStyle
{
  return self->_darkStyle;
}

- (void)setDarkStyle:(BOOL)a3
{
  self->_darkStyle = a3;
}

@end