@interface TKToneClassicsPickerItem
- (TKTonePickerItem)parentItem;
- (id)childItemAtIndex:(int64_t)a3;
- (int64_t)classicToneIndex;
- (void)_appendDescriptionOfAttributesToString:(id)a3;
- (void)_setClassicToneIndex:(int64_t)a3;
- (void)_setParentItem:(id)a3;
@end

@implementation TKToneClassicsPickerItem

- (id)childItemAtIndex:(int64_t)a3
{
  return 0;
}

- (void)_appendDescriptionOfAttributesToString:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TKToneClassicsPickerItem;
  id v4 = a3;
  [(TKTonePickerItem *)&v5 _appendDescriptionOfAttributesToString:v4];
  [(TKPickerItem *)self _appendDescriptionOfAttributeNamed:@"classicToneIndex" withIntegerValue:[(TKToneClassicsPickerItem *)self classicToneIndex] toString:v4];
}

- (TKTonePickerItem)parentItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentItem);

  return (TKTonePickerItem *)WeakRetained;
}

- (void)_setParentItem:(id)a3
{
}

- (int64_t)classicToneIndex
{
  return self->_classicToneIndex;
}

- (void)_setClassicToneIndex:(int64_t)a3
{
  self->_classicToneIndex = a3;
}

- (void).cxx_destruct
{
}

@end