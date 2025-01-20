@interface ViewControllerBackOption
- (BOOL)hidesBackButton;
- (NSArray)leftBarButtonItems;
- (void)setHidesBackButton:(BOOL)a3;
- (void)setLeftBarButtonItems:(id)a3;
@end

@implementation ViewControllerBackOption

- (BOOL)hidesBackButton
{
  return self->_hidesBackButton;
}

- (void)setHidesBackButton:(BOOL)a3
{
  self->_hidesBackButton = a3;
}

- (NSArray)leftBarButtonItems
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLeftBarButtonItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end