@interface STKListItem
- (BOOL)isSelected;
- (NSString)text;
- (STKListItem)initWithText:(id)a3 selected:(BOOL)a4;
- (STKListItem)initWithXPCDictionary:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation STKListItem

- (STKListItem)initWithText:(id)a3 selected:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STKListItem;
  v7 = [(STKListItem *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    text = v7->_text;
    v7->_text = (NSString *)v8;

    v7->_selected = a4;
  }

  return v7;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  BSSerializeStringToXPCDictionaryWithKey();
  xpc_dictionary_set_BOOL(xdict, "_selected", self->_selected);
}

- (STKListItem)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STKListItem;
  v5 = [(STKListItem *)&v9 init];
  if (v5)
  {
    uint64_t v6 = BSDeserializeStringFromXPCDictionaryWithKey();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    v5->_selected = xpc_dictionary_get_BOOL(v4, "_selected");
  }

  return v5;
}

- (NSString)text
{
  return self->_text;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void).cxx_destruct
{
}

@end