@interface VSCredentialEntryPickerItem
- (NSString)itemId;
- (NSString)itemName;
- (NSString)itemValue;
- (void)setItemId:(id)a3;
- (void)setItemName:(id)a3;
- (void)setItemValue:(id)a3;
@end

@implementation VSCredentialEntryPickerItem

- (NSString)itemName
{
  return self->_itemName;
}

- (void)setItemName:(id)a3
{
}

- (NSString)itemValue
{
  return self->_itemValue;
}

- (void)setItemValue:(id)a3
{
}

- (NSString)itemId
{
  return self->_itemId;
}

- (void)setItemId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemId, 0);
  objc_storeStrong((id *)&self->_itemValue, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
}

@end