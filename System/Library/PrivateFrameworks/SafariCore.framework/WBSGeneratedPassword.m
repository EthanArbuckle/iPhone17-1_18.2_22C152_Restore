@interface WBSGeneratedPassword
+ (NSString)privateBrowsingSentinel;
+ (id)keychainDictionaryRepresentationWithPassword:(id)a3;
- (BOOL)wasGeneratedInPrivateBrowsingSession;
- (NSData)keychainPersistentReference;
- (NSDate)generationDate;
- (NSDictionary)dictionaryRepresentation;
- (NSString)password;
- (NSURLProtectionSpace)protectionSpace;
- (WBSGeneratedPassword)initWithKeychainItemDictionary:(id)a3;
- (WBSGeneratedPassword)initWithPassword:(id)a3 protectionSpace:(id)a4 generationDate:(id)a5 wasGeneratedInPrivateBrowsingSession:(BOOL)a6;
- (id)keychainDictionaryRepresentationWithPassword:(id)a3;
@end

@implementation WBSGeneratedPassword

+ (NSString)privateBrowsingSentinel
{
  return (NSString *)@"Saved In Private Browsing";
}

+ (id)keychainDictionaryRepresentationWithPassword:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v7 = @"pwd";
    v8[0] = a3;
    v3 = (void *)MEMORY[0x1E4F1C9E8];
    id v4 = a3;
    v5 = [v3 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (WBSGeneratedPassword)initWithPassword:(id)a3 protectionSpace:(id)a4 generationDate:(id)a5 wasGeneratedInPrivateBrowsingSession:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WBSGeneratedPassword;
  v13 = [(WBSGeneratedPassword *)&v20 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    password = v13->_password;
    v13->_password = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    protectionSpace = v13->_protectionSpace;
    v13->_protectionSpace = (NSURLProtectionSpace *)v16;

    objc_storeStrong((id *)&v13->_generationDate, a5);
    v13->_wasGeneratedInPrivateBrowsingSession = a6;
    v18 = v13;
  }

  return v13;
}

- (WBSGeneratedPassword)initWithKeychainItemDictionary:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)WBSGeneratedPassword;
  v5 = [(WBSGeneratedPassword *)&v36 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B5C0]];
    [v6 doubleValue];
    double v8 = v7;

    uint64_t v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v8];
    generationDate = v5->_generationDate;
    v5->_generationDate = (NSDate *)v9;

    uint64_t v11 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3BD40]];
    keychainPersistentReference = v5->_keychainPersistentReference;
    v5->_keychainPersistentReference = (NSData *)v11;

    uint64_t v13 = *MEMORY[0x1E4F3B848];
    uint64_t v14 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B848]];
    char v15 = [v14 isEqualToString:@"Saved In Private Browsing"];
    v5->_wasGeneratedInPrivateBrowsingSession = v15;
    if ((v15 & 1) == 0)
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F29088]);
      [v16 setScheme:@"https"];
      v17 = [v4 objectForKeyedSubscript:v13];
      [v16 setHost:v17];

      v18 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B7C0]];
      [v16 setPort:v18];

      v19 = (void *)MEMORY[0x1E4F18D98];
      objc_super v20 = [v16 URL];
      uint64_t v21 = objc_msgSend(v19, "safari_HTMLFormProtectionSpaceForURL:", v20);
      protectionSpace = v5->_protectionSpace;
      v5->_protectionSpace = (NSURLProtectionSpace *)v21;
    }
    v23 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3BD38]];
    if (v23)
    {
      id v35 = 0;
      v24 = [MEMORY[0x1E4F28F98] propertyListWithData:v23 options:0 format:0 error:&v35];
      id v25 = v35;
      if (v24)
      {
        uint64_t v26 = [v24 copy];
        originalKeychainDictionary = v5->_originalKeychainDictionary;
        v5->_originalKeychainDictionary = (NSDictionary *)v26;

        v28 = [v24 objectForKeyedSubscript:@"pwd"];
        uint64_t v29 = [v28 copy];
        password = v5->_password;
        v5->_password = (NSString *)v29;

        v31 = v5;
      }
      else
      {
        v33 = WBS_LOG_CHANNEL_PREFIXPasswords();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          -[WBSGeneratedPassword initWithKeychainItemDictionary:](v33, v25);
        }
        v31 = 0;
      }
    }
    else
    {
      v32 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[WBSGeneratedPassword initWithKeychainItemDictionary:](v32);
      }
      v31 = 0;
    }
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)[(WBSGeneratedPassword *)self keychainDictionaryRepresentationWithPassword:self->_password];
}

- (id)keychainDictionaryRepresentationWithPassword:(id)a3
{
  if (self->_originalKeychainDictionary) {
    originalKeychainDictionary = self->_originalKeychainDictionary;
  }
  else {
    originalKeychainDictionary = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  id v4 = a3;
  v5 = (void *)[(NSDictionary *)originalKeychainDictionary mutableCopy];
  [v5 setObject:v4 forKeyedSubscript:@"pwd"];

  return v5;
}

- (BOOL)wasGeneratedInPrivateBrowsingSession
{
  return self->_wasGeneratedInPrivateBrowsingSession;
}

- (NSDate)generationDate
{
  return self->_generationDate;
}

- (NSURLProtectionSpace)protectionSpace
{
  return self->_protectionSpace;
}

- (NSString)password
{
  return self->_password;
}

- (NSData)keychainPersistentReference
{
  return self->_keychainPersistentReference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainPersistentReference, 0);
  objc_storeStrong((id *)&self->_generationDate, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_protectionSpace, 0);
  objc_storeStrong((id *)&self->_originalKeychainDictionary, 0);
}

- (void)initWithKeychainItemDictionary:(void *)a1 .cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1B728F000, v1, OS_LOG_TYPE_ERROR, "Found non-Data object in data field of generated password item: %@", (uint8_t *)&v4, 0xCu);
}

- (void)initWithKeychainItemDictionary:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  int v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_1B728F000, v3, OS_LOG_TYPE_ERROR, "Unable to unarchive data blob from generated password item: %@", (uint8_t *)&v5, 0xCu);
}

@end