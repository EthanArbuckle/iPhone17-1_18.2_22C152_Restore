@interface STKListItemsSessionData
- (NSArray)listItems;
- (STKListItemsSessionData)initWithText:(id)a3 simLabel:(id)a4 listItems:(id)a5;
- (STKListItemsSessionData)initWithXPCDictionary:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation STKListItemsSessionData

- (STKListItemsSessionData)initWithText:(id)a3 simLabel:(id)a4 listItems:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)STKListItemsSessionData;
  v10 = [(STKTextSessionData *)&v13 initWithText:a3 simLabel:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_listItems, a5);
  }

  return v11;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)STKListItemsSessionData;
  id v3 = a3;
  [(STKTextSessionData *)&v4 encodeWithXPCDictionary:v3];
  BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();
}

- (STKListItemsSessionData)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STKListItemsSessionData;
  v5 = [(STKTextSessionData *)&v11 initWithXPCDictionary:v4];
  if (v5)
  {
    uint64_t v6 = BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
    listItems = v5->_listItems;
    v5->_listItems = (NSArray *)v6;

    if (!v5->_listItems)
    {
      uint64_t v8 = [MEMORY[0x263EFF8C0] array];
      id v9 = v5->_listItems;
      v5->_listItems = (NSArray *)v8;
    }
  }

  return v5;
}

- (NSArray)listItems
{
  return self->_listItems;
}

- (void).cxx_destruct
{
}

@end