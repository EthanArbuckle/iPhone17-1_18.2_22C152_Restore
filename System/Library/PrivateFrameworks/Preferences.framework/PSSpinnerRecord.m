@interface PSSpinnerRecord
- (BOOL)hidesBackButton;
- (NSArray)leftItems;
- (NSArray)rightItems;
- (UINavigationItem)navigationItem;
- (void)setHidesBackButton:(BOOL)a3;
- (void)setLeftItems:(id)a3;
- (void)setNavigationItem:(id)a3;
- (void)setRightItems:(id)a3;
@end

@implementation PSSpinnerRecord

- (NSArray)rightItems
{
  return self->_rightItems;
}

- (void)setRightItems:(id)a3
{
}

- (NSArray)leftItems
{
  return self->_leftItems;
}

- (void)setLeftItems:(id)a3
{
}

- (UINavigationItem)navigationItem
{
  return self->_navigationItem;
}

- (void)setNavigationItem:(id)a3
{
}

- (BOOL)hidesBackButton
{
  return self->_hidesBackButton;
}

- (void)setHidesBackButton:(BOOL)a3
{
  self->_hidesBackButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationItem, 0);
  objc_storeStrong((id *)&self->_leftItems, 0);
  objc_storeStrong((id *)&self->_rightItems, 0);
}

@end