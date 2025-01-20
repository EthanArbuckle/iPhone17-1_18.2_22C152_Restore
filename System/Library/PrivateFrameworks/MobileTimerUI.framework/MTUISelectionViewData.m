@interface MTUISelectionViewData
- (BOOL)isSelected;
- (NSString)title;
- (void)setIsSelected:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation MTUISelectionViewData

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (void).cxx_destruct
{
}

@end