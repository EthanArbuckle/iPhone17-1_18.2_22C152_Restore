@interface WBSPasswordManagerWebsiteMetadataEntry
+ (NSString)keychainAccountName;
- (BOOL)updateWebsiteName:(id)a3;
- (NSDate)websiteNameDateLastModified;
- (NSDate)websiteNameDateLastRefreshed;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)originalBackingDictionary;
- (NSString)keychainItemDescription;
- (NSString)websiteName;
- (WBSPasswordManagerWebsiteMetadataEntry)initWithKeychainDictionary:(id)a3 forDomain:(id)a4;
- (id)description;
- (id)keychainItemLabelForDomain:(id)a3;
@end

@implementation WBSPasswordManagerWebsiteMetadataEntry

+ (NSString)keychainAccountName
{
  return (NSString *)&stru_1F105D3F0;
}

- (WBSPasswordManagerWebsiteMetadataEntry)initWithKeychainDictionary:(id)a3 forDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WBSPasswordManagerWebsiteMetadataEntry;
  v8 = [(WBSPasswordManagerWebsiteMetadataEntry *)&v21 init];
  if (!v8)
  {
LABEL_9:
    v17 = 0;
    goto LABEL_10;
  }
  if (!v6)
  {
    v18 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[WBSPasswordManagerWebsiteMetadataEntry initWithKeychainDictionary:forDomain:]((uint64_t)v7, v18);
    }
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[WBSPasswordManagerWebsiteMetadataEntry initWithKeychainDictionary:forDomain:]((uint64_t)v7, v19);
    }
    goto LABEL_9;
  }
  uint64_t v9 = [v6 copy];
  originalBackingDictionary = v8->_originalBackingDictionary;
  v8->_originalBackingDictionary = (NSDictionary *)v9;

  uint64_t v11 = [(NSDictionary *)v8->_originalBackingDictionary safari_stringForKey:@"wn"];
  websiteName = v8->_websiteName;
  v8->_websiteName = (NSString *)v11;

  uint64_t v13 = [(NSDictionary *)v8->_originalBackingDictionary safari_dateForKey:@"wn_dm"];
  websiteNameDateLastModified = v8->_websiteNameDateLastModified;
  v8->_websiteNameDateLastModified = (NSDate *)v13;

  uint64_t v15 = [(NSDictionary *)v8->_originalBackingDictionary safari_dateForKey:@"wn_dr"];
  websiteNameDateLastRefreshed = v8->_websiteNameDateLastRefreshed;
  v8->_websiteNameDateLastRefreshed = (NSDate *)v15;

  v17 = v8;
LABEL_10:

  return v17;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; websiteName = %@; websiteNameDateLastModified = %@; websiteNameDateLastRefreshed = %@>",
    v5,
    self,
    self->_websiteName,
    self->_websiteNameDateLastModified,
  id v6 = self->_websiteNameDateLastRefreshed);

  return v6;
}

- (BOOL)updateWebsiteName:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1C9C8] now];
  websiteName = self->_websiteName;
  if (websiteName && [(NSString *)websiteName isEqualToString:v4])
  {
    BOOL v7 = 0;
  }
  else
  {
    v8 = (NSString *)[v4 copy];
    uint64_t v9 = self->_websiteName;
    self->_websiteName = v8;

    objc_storeStrong((id *)&self->_websiteNameDateLastModified, v5);
    BOOL v7 = 1;
  }
  websiteNameDateLastRefreshed = self->_websiteNameDateLastRefreshed;
  self->_websiteNameDateLastRefreshed = v5;

  return v7;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (void *)[(NSDictionary *)self->_originalBackingDictionary mutableCopy];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v6 = v5;

  if ([(NSString *)self->_websiteName length]) {
    [v6 setObject:self->_websiteName forKeyedSubscript:@"wn"];
  }
  websiteNameDateLastModified = self->_websiteNameDateLastModified;
  if (websiteNameDateLastModified) {
    [v6 setObject:websiteNameDateLastModified forKeyedSubscript:@"wn_dm"];
  }
  websiteNameDateLastRefreshed = self->_websiteNameDateLastRefreshed;
  if (websiteNameDateLastRefreshed) {
    [v6 setObject:websiteNameDateLastRefreshed forKeyedSubscript:@"wn_dr"];
  }
  uint64_t v9 = (void *)[v6 copy];

  return (NSDictionary *)v9;
}

- (NSString)keychainItemDescription
{
  return (NSString *)_WBSLocalizedString(@"Website Metadata", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
}

- (id)keychainItemLabelForDomain:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  id v5 = _WBSLocalizedString(@"Website Metadata for %@", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  id v6 = objc_msgSend(v3, "localizedStringWithFormat:", v5, v4);

  return v6;
}

- (NSDictionary)originalBackingDictionary
{
  return self->_originalBackingDictionary;
}

- (NSString)websiteName
{
  return self->_websiteName;
}

- (NSDate)websiteNameDateLastModified
{
  return self->_websiteNameDateLastModified;
}

- (NSDate)websiteNameDateLastRefreshed
{
  return self->_websiteNameDateLastRefreshed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_websiteNameDateLastRefreshed, 0);
  objc_storeStrong((id *)&self->_websiteNameDateLastModified, 0);
  objc_storeStrong((id *)&self->_websiteName, 0);
  objc_storeStrong((id *)&self->_originalBackingDictionary, 0);
}

- (void)initWithKeychainDictionary:(uint64_t)a1 forDomain:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B728F000, a2, OS_LOG_TYPE_ERROR, "Error initializing WBSPasswordManagerWebsiteMetadataEntry: received nil keychain dictionary for %{private}@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithKeychainDictionary:(uint64_t)a1 forDomain:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  int v4 = 138478083;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = objc_opt_class();
  _os_log_fault_impl(&dword_1B728F000, v3, OS_LOG_TYPE_FAULT, "Error initializing WBSPasswordManagerWebsiteMetadataEntry: received non-Dictionary keychain dictionary for %{private}@; type was %@",
    (uint8_t *)&v4,
    0x16u);
}

@end