@interface PKKeychainItemWrapper
- (NSMutableDictionary)genericPasswordQuery;
- (NSMutableDictionary)keychainItemData;
- (NSString)label;
- (PKKeychainItemWrapper)initWithIdentifier:(id)a3 accessGroup:(id)a4 serviceName:(id)a5;
- (PKKeychainItemWrapper)initWithIdentifier:(id)a3 accessGroup:(id)a4 serviceName:(id)a5 type:(unint64_t)a6 invisible:(BOOL)a7;
- (PKKeychainItemWrapper)initWithIdentifier:(id)a3 accessGroup:(id)a4 serviceName:(id)a5 type:(unint64_t)a6 invisible:(BOOL)a7 accessibility:(unint64_t)a8;
- (id)dictionaryToSecItemFormat:(id)a3;
- (id)objectForKey:(id)a3;
- (id)secItemFormatToDictionary:(id)a3;
- (unint64_t)accessibility;
- (unint64_t)type;
- (void)_resetKeychainItem:(BOOL)a3;
- (void)applyAccessibilityValueToDictionary:(id)a3;
- (void)applySynchronizableValueToDictionary:(id)a3;
- (void)resetKeychainItem;
- (void)resetLocalKeychainItem;
- (void)setAccessibility:(unint64_t)a3;
- (void)setGenericPasswordQuery:(id)a3;
- (void)setKeychainItemData:(id)a3;
- (void)setLabel:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setType:(unint64_t)a3;
- (void)writeToKeychain;
@end

@implementation PKKeychainItemWrapper

- (void)setLabel:(id)a3
{
}

- (id)objectForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->keychainItemData objectForKey:a3];
}

- (PKKeychainItemWrapper)initWithIdentifier:(id)a3 accessGroup:(id)a4 serviceName:(id)a5 type:(unint64_t)a6 invisible:(BOOL)a7 accessibility:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PKKeychainItemWrapper;
  v17 = [(PKKeychainItemWrapper *)&v25 init];
  v18 = v17;
  if (v17)
  {
    v17->_invisible = a7;
    v17->_accessibility = a8;
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    genericPasswordQuery = v18->genericPasswordQuery;
    v18->genericPasswordQuery = v19;

    [(NSMutableDictionary *)v18->genericPasswordQuery setObject:*MEMORY[0x1E4F3B988] forKey:*MEMORY[0x1E4F3B978]];
    [(NSMutableDictionary *)v18->genericPasswordQuery setObject:v14 forKey:*MEMORY[0x1E4F3B5C0]];
    v18->type = a6;
    [(PKKeychainItemWrapper *)v18 applySynchronizableValueToDictionary:v18->genericPasswordQuery];
    if (v16) {
      [(NSMutableDictionary *)v18->genericPasswordQuery setObject:v16 forKey:*MEMORY[0x1E4F3B850]];
    }
    if (v15) {
      [(NSMutableDictionary *)v18->genericPasswordQuery setObject:v15 forKey:*MEMORY[0x1E4F3B550]];
    }
    [(NSMutableDictionary *)v18->genericPasswordQuery setObject:*MEMORY[0x1E4F3BB90] forKey:*MEMORY[0x1E4F3BB80]];
    [(NSMutableDictionary *)v18->genericPasswordQuery setObject:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3BC68]];
    CFDictionaryRef v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v18->genericPasswordQuery];
    CFTypeRef result = 0;
    if (SecItemCopyMatching(v21, &result) || !result)
    {
      [(PKKeychainItemWrapper *)v18 resetKeychainItem];
    }
    else
    {
      v22 = -[PKKeychainItemWrapper secItemFormatToDictionary:](v18, "secItemFormatToDictionary:");
      [(PKKeychainItemWrapper *)v18 setKeychainItemData:v22];
    }
    if (result) {
      CFRelease(result);
    }
  }
  return v18;
}

- (void)setKeychainItemData:(id)a3
{
}

- (id)secItemFormatToDictionary:(id)a3
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a3];
  uint64_t v4 = *MEMORY[0x1E4F3BC70];
  [v3 setObject:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3BC70]];
  [v3 setObject:*MEMORY[0x1E4F3B988] forKey:*MEMORY[0x1E4F3B978]];
  CFTypeRef result = 0;
  if (SecItemCopyMatching((CFDictionaryRef)v3, &result))
  {
    v5 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Serious error, no matching item found in the keychain.\n", v7, 2u);
    }
  }
  else
  {
    [v3 setObject:result forKey:*MEMORY[0x1E4F3BD38]];
  }
  [v3 removeObjectForKey:v4];
  if (result) {
    CFRelease(result);
  }
  return v3;
}

- (PKKeychainItemWrapper)initWithIdentifier:(id)a3 accessGroup:(id)a4 serviceName:(id)a5 type:(unint64_t)a6 invisible:(BOOL)a7
{
  return [(PKKeychainItemWrapper *)self initWithIdentifier:a3 accessGroup:a4 serviceName:a5 type:a6 invisible:a7 accessibility:0];
}

- (void)applySynchronizableValueToDictionary:(id)a3
{
  id v4 = a3;
  unint64_t type = self->type;
  if (type == 2)
  {
    v8 = (void **)MEMORY[0x1E4F3B880];
LABEL_7:
    v7 = *v8;
    uint64_t v6 = *MEMORY[0x1E4F3B878];
    id v9 = v4;
    goto LABEL_8;
  }
  if (type == 1)
  {
    v8 = (void **)MEMORY[0x1E4F1CFD0];
    goto LABEL_7;
  }
  if (type) {
    goto LABEL_9;
  }
  id v9 = v4;
  [v4 setObject:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3BD08]];
  [v9 setObject:*MEMORY[0x1E4F1CFC8] forKey:*MEMORY[0x1E4F3B878]];
  uint64_t v6 = *MEMORY[0x1E4F3B888];
  v7 = &unk_1EE22C818;
LABEL_8:
  [v9 setObject:v7 forKey:v6];
  id v4 = v9;
LABEL_9:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->genericPasswordQuery, 0);
  objc_storeStrong((id *)&self->keychainItemData, 0);
}

- (PKKeychainItemWrapper)initWithIdentifier:(id)a3 accessGroup:(id)a4 serviceName:(id)a5
{
  return [(PKKeychainItemWrapper *)self initWithIdentifier:a3 accessGroup:a4 serviceName:a5 type:1 invisible:0];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8)
  {
    v7 = [(NSMutableDictionary *)self->keychainItemData objectForKey:v6];
    if (([v7 isEqual:v8] & 1) == 0)
    {
      [(NSMutableDictionary *)self->keychainItemData setObject:v8 forKey:v6];
      [(PKKeychainItemWrapper *)self writeToKeychain];
    }
  }
}

- (void)resetKeychainItem
{
}

- (void)resetLocalKeychainItem
{
}

- (void)_resetKeychainItem:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  keychainItemData = self->keychainItemData;
  if (keychainItemData)
  {
    BOOL v5 = a3;
    if ([(NSMutableDictionary *)keychainItemData count])
    {
      id v6 = [(PKKeychainItemWrapper *)self dictionaryToSecItemFormat:self->keychainItemData];
      v7 = v6;
      if (v5)
      {
        uint64_t v8 = MEMORY[0x1E4F1CC28];
        [v6 setObject:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F3B8B8]];
        [v7 setObject:v8 forKey:*MEMORY[0x1E4F3BD30]];
      }
      OSStatus v9 = SecItemDelete((CFDictionaryRef)v7);
      if (v9 != -25300 && v9 != 0)
      {
        OSStatus v11 = v9;
        v12 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          OSStatus v15 = v11;
          _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Problem deleting current dictionary (%d)", buf, 8u);
        }
      }
      [(NSMutableDictionary *)self->keychainItemData removeAllObjects];
    }
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    -[PKKeychainItemWrapper setKeychainItemData:](self, "setKeychainItemData:");
  }
}

- (id)dictionaryToSecItemFormat:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a3];
  uint64_t v5 = *MEMORY[0x1E4F3B5C0];
  id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B5C0]];

  if (!v6)
  {
    v7 = [(NSMutableDictionary *)self->genericPasswordQuery objectForKeyedSubscript:v5];
    [v4 setObject:v7 forKeyedSubscript:v5];
  }
  uint64_t v8 = *MEMORY[0x1E4F3B550];
  OSStatus v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B550]];
  if (!v9)
  {
    v10 = [(NSMutableDictionary *)self->genericPasswordQuery objectForKeyedSubscript:v8];

    if (!v10) {
      goto LABEL_7;
    }
    OSStatus v9 = [(NSMutableDictionary *)self->genericPasswordQuery objectForKeyedSubscript:v8];
    [v4 setObject:v9 forKeyedSubscript:v8];
  }

LABEL_7:
  uint64_t v11 = *MEMORY[0x1E4F3B850];
  v12 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B850]];
  if (!v12)
  {
    id v13 = [(NSMutableDictionary *)self->genericPasswordQuery objectForKeyedSubscript:v11];

    if (!v13) {
      goto LABEL_11;
    }
    v12 = [(NSMutableDictionary *)self->genericPasswordQuery objectForKeyedSubscript:v11];
    [v4 setObject:v12 forKeyedSubscript:v11];
  }

LABEL_11:
  [v4 setObject:*MEMORY[0x1E4F3B988] forKey:*MEMORY[0x1E4F3B978]];
  if (self->_label) {
    label = (__CFString *)self->_label;
  }
  else {
    label = @"com.apple.wallet.default.contact";
  }
  [v4 setObject:label forKey:*MEMORY[0x1E4F3B788]];
  return v4;
}

- (void)writeToKeychain
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CFTypeRef result = 0;
  if (SecItemCopyMatching((CFDictionaryRef)self->genericPasswordQuery, &result))
  {
    v3 = [(PKKeychainItemWrapper *)self dictionaryToSecItemFormat:self->keychainItemData];
    [(PKKeychainItemWrapper *)self applySynchronizableValueToDictionary:v3];
    [(PKKeychainItemWrapper *)self applyAccessibilityValueToDictionary:v3];
    CFDictionaryRef v4 = [(PKKeychainItemWrapper *)self dictionaryToSecItemFormat:v3];
    OSStatus v5 = SecItemAdd(v4, 0);

    if (!v5) {
      goto LABEL_12;
    }
    id v6 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      OSStatus v14 = v5;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Couldn't add the Keychain Item (%d)", buf, 8u);
    }
  }
  else
  {
    v3 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:result];
    uint64_t v7 = *MEMORY[0x1E4F3B978];
    uint64_t v8 = [(NSMutableDictionary *)self->genericPasswordQuery objectForKey:*MEMORY[0x1E4F3B978]];
    [v3 setObject:v8 forKey:v7];

    if (!self->type) {
      [v3 setObject:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3BD08]];
    }
    id v6 = [(PKKeychainItemWrapper *)self dictionaryToSecItemFormat:self->keychainItemData];
    [v6 removeObjectForKey:v7];
    [(PKKeychainItemWrapper *)self applySynchronizableValueToDictionary:v6];
    [(PKKeychainItemWrapper *)self applyAccessibilityValueToDictionary:v6];
    OSStatus v9 = SecItemUpdate((CFDictionaryRef)v3, (CFDictionaryRef)v6);
    if (v9)
    {
      OSStatus v10 = v9;
      uint64_t v11 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        OSStatus v14 = v10;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Couldn't update the Keychain Item (%d)", buf, 8u);
      }
    }
  }

LABEL_12:
  if (result) {
    CFRelease(result);
  }
}

- (void)applyAccessibilityValueToDictionary:(id)a3
{
  if (self->_accessibility == 1)
  {
    v3 = (void *)MEMORY[0x1E4F3B578];
    if (self->type) {
      v3 = (void *)MEMORY[0x1E4F3B570];
    }
    [a3 setObject:*v3 forKey:*MEMORY[0x1E4F3B558]];
  }
}

- (NSMutableDictionary)keychainItemData
{
  return self->keychainItemData;
}

- (NSMutableDictionary)genericPasswordQuery
{
  return self->genericPasswordQuery;
}

- (void)setGenericPasswordQuery:(id)a3
{
}

- (unint64_t)type
{
  return self->type;
}

- (void)setType:(unint64_t)a3
{
  self->unint64_t type = a3;
}

- (NSString)label
{
  return self->_label;
}

- (unint64_t)accessibility
{
  return self->_accessibility;
}

- (void)setAccessibility:(unint64_t)a3
{
  self->_accessibility = a3;
}

@end