@interface PXSelectionBadgeTileUserData
- (BOOL)isSelected;
- (void)setSelected:(BOOL)a3;
@end

@implementation PXSelectionBadgeTileUserData

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

@end