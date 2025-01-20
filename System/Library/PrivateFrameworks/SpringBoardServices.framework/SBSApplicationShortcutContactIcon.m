@interface SBSApplicationShortcutContactIcon
- (BOOL)isEqual:(id)a3;
- (NSData)imageData;
- (NSString)contactIdentifier;
- (NSString)firstName;
- (NSString)lastName;
- (SBSApplicationShortcutContactIcon)initWithContactIdentifier:(id)a3;
- (SBSApplicationShortcutContactIcon)initWithFirstName:(id)a3 lastName:(id)a4;
- (SBSApplicationShortcutContactIcon)initWithFirstName:(id)a3 lastName:(id)a4 imageData:(id)a5;
- (SBSApplicationShortcutContactIcon)initWithXPCDictionary:(id)a3;
- (id)_initForSubclass;
- (unint64_t)hash;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation SBSApplicationShortcutContactIcon

- (SBSApplicationShortcutContactIcon)initWithContactIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSApplicationShortcutContactIcon;
  v5 = [(SBSApplicationShortcutIcon *)&v9 _initForSubclass];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v6;
  }
  return v5;
}

- (SBSApplicationShortcutContactIcon)initWithFirstName:(id)a3 lastName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBSApplicationShortcutContactIcon;
  v8 = [(SBSApplicationShortcutIcon *)&v14 _initForSubclass];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    firstName = v8->_firstName;
    v8->_firstName = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    lastName = v8->_lastName;
    v8->_lastName = (NSString *)v11;
  }
  return v8;
}

- (SBSApplicationShortcutContactIcon)initWithFirstName:(id)a3 lastName:(id)a4 imageData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBSApplicationShortcutContactIcon;
  uint64_t v11 = [(SBSApplicationShortcutIcon *)&v17 _initForSubclass];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    firstName = v11->_firstName;
    v11->_firstName = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    lastName = v11->_lastName;
    v11->_lastName = (NSString *)v14;

    objc_storeStrong((id *)&v11->_imageData, a5);
  }

  return v11;
}

- (id)_initForSubclass
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"%s is not a valid initializer. You must call -[%@ initWithContactIdentifier:].", "-[SBSApplicationShortcutContactIcon _initForSubclass]", v6 format];

  return [(SBSApplicationShortcutContactIcon *)self initWithContactIdentifier:0];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SBSApplicationShortcutContactIcon *)a3;
  if (self == v4)
  {
    char v17 = 1;
  }
  else
  {
    v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
    id v6 = [(SBSApplicationShortcutContactIcon *)self contactIdentifier];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __45__SBSApplicationShortcutContactIcon_isEqual___block_invoke;
    v28[3] = &unk_1E566CB30;
    id v7 = v4;
    v29 = v7;
    id v8 = (id)[v5 appendObject:v6 counterpart:v28];

    id v9 = [(SBSApplicationShortcutContactIcon *)self firstName];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __45__SBSApplicationShortcutContactIcon_isEqual___block_invoke_2;
    v26[3] = &unk_1E566CB30;
    id v10 = v7;
    v27 = v10;
    id v11 = (id)[v5 appendObject:v9 counterpart:v26];

    uint64_t v12 = [(SBSApplicationShortcutContactIcon *)self lastName];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __45__SBSApplicationShortcutContactIcon_isEqual___block_invoke_3;
    v24[3] = &unk_1E566CB30;
    v13 = v10;
    v25 = v13;
    id v14 = (id)[v5 appendObject:v12 counterpart:v24];

    v15 = [(SBSApplicationShortcutContactIcon *)self imageData];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __45__SBSApplicationShortcutContactIcon_isEqual___block_invoke_4;
    v22 = &unk_1E566CEC0;
    v23 = v13;
    id v16 = (id)[v5 appendObject:v15 counterpart:&v19];

    char v17 = [v5 isEqual:v19 v20:v21 v22:v22];
  }

  return v17;
}

uint64_t __45__SBSApplicationShortcutContactIcon_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) contactIdentifier];
}

uint64_t __45__SBSApplicationShortcutContactIcon_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) firstName];
}

uint64_t __45__SBSApplicationShortcutContactIcon_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) lastName];
}

uint64_t __45__SBSApplicationShortcutContactIcon_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) imageData];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  uint64_t v4 = [(SBSApplicationShortcutContactIcon *)self contactIdentifier];
  id v5 = (id)[v3 appendObject:v4];

  id v6 = [(SBSApplicationShortcutContactIcon *)self lastName];
  id v7 = (id)[v3 appendObject:v6];

  unint64_t v8 = [v3 hash];
  return v8;
}

- (SBSApplicationShortcutContactIcon)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_18;
  }
  id v5 = BSDeserializeStringFromXPCDictionaryWithKey();
  if (!v5)
  {
    id v5 = BSDeserializeStringFromXPCDictionaryWithKey();
    if (!v5)
    {
      id v7 = BSDeserializeStringFromXPCDictionaryWithKey();
      unint64_t v8 = v7;
      if (v7)
      {
        id v9 = v7;
      }
      else
      {
        BSDeserializeStringFromXPCDictionaryWithKey();
        id v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v10 = v9;

      id v11 = BSDeserializeStringFromXPCDictionaryWithKey();
      uint64_t v12 = v11;
      if (v11)
      {
        id v13 = v11;
      }
      else
      {
        BSDeserializeStringFromXPCDictionaryWithKey();
        id v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v14 = v13;

      v15 = xpc_dictionary_get_value(v4, "contactIconImageData");
      if ((v15
         || (xpc_dictionary_get_value(v4, "contactImageData"), (v15 = objc_claimAutoreleasedReturnValue()) != 0))
        && MEMORY[0x192FC1100](v15) == MEMORY[0x1E4F14580])
      {
        v18 = (void *)MEMORY[0x1E4F1C9B8];
        bytes_ptr = xpc_data_get_bytes_ptr(v15);
        char v17 = [v18 dataWithBytes:bytes_ptr length:xpc_data_get_length(v15)];
        self = [(SBSApplicationShortcutContactIcon *)self initWithFirstName:v10 lastName:v14 imageData:v17];
        int v16 = 1;
      }
      else
      {
        int v16 = 0;
        char v17 = 0;
      }

      if (v16) {
        goto LABEL_5;
      }
LABEL_18:
      id v6 = 0;
      goto LABEL_19;
    }
  }
  self = [(SBSApplicationShortcutContactIcon *)self initWithContactIdentifier:v5];

LABEL_5:
  self = self;
  id v6 = self;
LABEL_19:

  return v6;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    xpc_object_t xdict = v4;
    id v5 = [(SBSApplicationShortcutContactIcon *)self contactIdentifier];
    BSSerializeStringToXPCDictionaryWithKey();

    id v6 = [(SBSApplicationShortcutContactIcon *)self firstName];
    BSSerializeStringToXPCDictionaryWithKey();

    id v7 = [(SBSApplicationShortcutContactIcon *)self lastName];
    BSSerializeStringToXPCDictionaryWithKey();

    unint64_t v8 = [(SBSApplicationShortcutContactIcon *)self imageData];
    size_t v9 = [v8 length];
    if (v9) {
      xpc_dictionary_set_data(xdict, "contactIconImageData", (const void *)[v8 bytes], v9);
    }
  }
  MEMORY[0x1F41817F8]();
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end