@interface MFRecategorizationCardAction
- (BOOL)isSelected;
- (BOOL)isSenderRecategorization;
- (int64_t)categoryType;
- (void)setCategoryType:(int64_t)a3;
- (void)setIsSelected:(BOOL)a3;
- (void)setIsSenderRecategorization:(BOOL)a3;
@end

@implementation MFRecategorizationCardAction

- (int64_t)categoryType
{
  return self->_categoryType;
}

- (void)setCategoryType:(int64_t)a3
{
  self->_categoryType = a3;
}

- (BOOL)isSenderRecategorization
{
  return self->_isSenderRecategorization;
}

- (void)setIsSenderRecategorization:(BOOL)a3
{
  self->_isSenderRecategorization = a3;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

@end