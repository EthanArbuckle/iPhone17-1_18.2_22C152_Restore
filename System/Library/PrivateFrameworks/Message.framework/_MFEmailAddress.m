@interface _MFEmailAddress
- (NSString)address;
- (NSString)displayName;
- (NSString)fullAddress;
- (_MFEmailAddress)initWithAddress:(id)a3;
- (_MFEmailAddress)initWithAddress:(id)a3 displayName:(id)a4;
@end

@implementation _MFEmailAddress

- (_MFEmailAddress)initWithAddress:(id)a3 displayName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_MFEmailAddress;
  v8 = [(_MFEmailAddress *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    address = v8->_address;
    v8->_address = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    displayName = v8->_displayName;
    v8->_displayName = (NSString *)v11;

    fullAddress = v8->_fullAddress;
    v8->_fullAddress = 0;
  }
  return v8;
}

- (NSString)fullAddress
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_fullAddress)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F60800]);
    v4 = [(_MFEmailAddress *)v2 address];
    v5 = (void *)[v3 initWithString:v4];

    id v6 = [(_MFEmailAddress *)v2 displayName];
    [v5 setDisplayName:v6];

    id v7 = [v5 stringValue];
    v8 = v7;
    if (v7)
    {
      uint64_t v9 = v7;
    }
    else
    {
      uint64_t v9 = [(_MFEmailAddress *)v2 address];
    }
    fullAddress = v2->_fullAddress;
    v2->_fullAddress = v9;
  }
  objc_sync_exit(v2);

  uint64_t v11 = v2->_fullAddress;
  return v11;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)address
{
  return self->_address;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_fullAddress, 0);
}

- (_MFEmailAddress)initWithAddress:(id)a3
{
  id v4 = a3;
  v5 = [v4 emailAddressValue];
  id v6 = [v5 simpleAddress];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v4 stringValue];
  }
  uint64_t v9 = v8;

  v10 = [v5 displayName];
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v12 = [v10 stringByTrimmingCharactersInSet:v11];

    v13 = objc_msgSend(v12, "ef_stringByTrimmingOuterQuotes");

    v14 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v10 = [v13 stringByTrimmingCharactersInSet:v14];
  }
  if (v5)
  {
    objc_super v15 = [v10 emailAddressValue];
    if (v15)
    {

      v10 = 0;
    }
  }
  v16 = [(_MFEmailAddress *)self initWithAddress:v9 displayName:v10];

  return v16;
}

@end