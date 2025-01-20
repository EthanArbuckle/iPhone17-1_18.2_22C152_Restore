@interface TKPickerRowItem
- (int64_t)row;
- (void)_appendDescriptionOfAttributesToString:(id)a3;
- (void)_setRow:(int64_t)a3;
@end

@implementation TKPickerRowItem

- (void)_appendDescriptionOfAttributesToString:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TKPickerRowItem;
  id v4 = a3;
  [(TKPickerItem *)&v5 _appendDescriptionOfAttributesToString:v4];
  [(TKPickerItem *)self _appendDescriptionOfAttributeNamed:@"row" withIntegerValue:[(TKPickerRowItem *)self row] toString:v4];
}

- (int64_t)row
{
  return self->_row;
}

- (void)_setRow:(int64_t)a3
{
  self->_row = a3;
}

@end