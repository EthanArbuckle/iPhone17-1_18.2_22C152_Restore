@interface SSVGratisRequestBody
- (BOOL)isBackgroundRequest;
- (NSArray)applications;
- (NSArray)bundleIdentifiers;
- (NSArray)itemIdentifiers;
- (NSData)JSONBodyData;
- (NSData)propertyListBodyData;
- (NSMutableDictionary)bodyDictionary;
- (NSNumber)accountIdentifier;
- (SSVGratisRequestBody)initWithRequestStyle:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)requestStyle;
- (void)setAccountIdentifier:(id)a3;
- (void)setApplications:(id)a3;
- (void)setBackgroundRequest:(BOOL)a3;
- (void)setBundleIdentifiers:(id)a3;
- (void)setItemIdentifiers:(id)a3;
- (void)setValue:(id)a3 forBodyParameter:(id)a4;
@end

@implementation SSVGratisRequestBody

- (SSVGratisRequestBody)initWithRequestStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SSVGratisRequestBody;
  result = [(SSVGratisRequestBody *)&v5 init];
  if (result) {
    result->_style = a3;
  }
  return result;
}

- (NSMutableDictionary)bodyDictionary
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  if (self->_additionalParameters) {
    objc_msgSend(v3, "addEntriesFromDictionary:");
  }
  if (self->_backgroundRequest) {
    [v4 setObject:@"1" forKey:@"is-background"];
  }
  objc_super v5 = self->_bundleIdentifiers;
  v6 = self->_itemIdentifiers;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NSArray *)self->_applications count])
  {
    v35 = v6;
    v36 = v5;
    v37 = v4;
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v34 = self;
    v9 = self->_applications;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v40 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          v15 = [v14 bundleIdentifier];
          if (v15) {
            [v8 addObject:v15];
          }
          v16 = [v14 itemIdentifier];
          if (v16)
          {
            v17 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", strtoll((const char *)objc_msgSend(v16, "UTF8String"), 0, 10));
            [v38 addObject:v17];
          }
          v18 = [v14 dictionaryRepresentation];
          [v7 addObject:v18];
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v11);
    }

    if ([v8 count])
    {
      objc_super v5 = (NSArray *)v8;
    }
    else
    {
      objc_super v5 = v36;
    }
    self = v34;
    v6 = v35;
    if ([v38 count])
    {
      v19 = (NSArray *)v38;

      v6 = v19;
    }
    v4 = v37;
  }
  int64_t style = self->_style;
  if (!style)
  {
    accountID = self->_accountID;
    if (accountID)
    {
      v23 = [(NSNumber *)accountID stringValue];
      [v4 setObject:v23 forKey:@"ds-id"];
    }
    if (v5) {
      [v4 setObject:v5 forKey:@"bundle-ids"];
    }
    if (v6) {
      [v4 setObject:v6 forKey:@"item-ids"];
    }
    v24 = @"application/json";
    v25 = @"response-content-type";
    v26 = v4;
    goto LABEL_46;
  }
  if (style != 2)
  {
    if (style != 1) {
      goto LABEL_47;
    }
    if ([v7 count]) {
      [v4 setObject:v7 forKey:@"apps"];
    }
    if ([(NSArray *)v5 count] == 1)
    {
      v21 = [(NSArray *)v5 objectAtIndex:0];
      [v4 setObject:v21 forKey:@"bid"];
    }
    else if (v5)
    {
      [v4 setObject:v5 forKey:@"bundle-ids"];
    }
    if (!v6) {
      goto LABEL_47;
    }
    [v4 setObject:v6 forKey:@"claim-item-ids"];
    v25 = @"download-item-ids";
    v26 = v4;
    v24 = (__CFString *)v6;
LABEL_46:
    [v26 setObject:v24 forKey:v25];
LABEL_47:
    uint64_t v27 = 2;
    goto LABEL_48;
  }
  if ([v7 count]) {
    [v4 setObject:v7 forKey:@"apps"];
  }
  if (v5) {
    [v4 setObject:v5 forKey:@"bundle-ids"];
  }
  uint64_t v27 = 4;
LABEL_48:
  v28 = [NSNumber numberWithInteger:v27];
  [v4 setObject:v28 forKey:@"claim-type"];

  v29 = (void *)MGCopyAnswer();
  if (v29) {
    [v4 setObject:v29 forKey:@"serial-no"];
  }
  v30 = (void *)MGCopyAnswer();
  if (v30)
  {
    [v4 setObject:v30 forKey:@"guid"];
    [v4 setObject:v30 forKey:@"udid"];
  }
  v31 = (void *)MGCopyAnswer();
  if (v31) {
    [v4 setObject:v31 forKey:@"imei"];
  }
  v32 = (void *)MGCopyAnswer();
  if (v32) {
    [v4 setObject:v32 forKey:@"meid"];
  }

  return (NSMutableDictionary *)v4;
}

- (NSData)JSONBodyData
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  id v3 = [(SSVGratisRequestBody *)self bodyDictionary];
  v4 = [v2 dataWithJSONObject:v3 options:0 error:0];

  return (NSData *)v4;
}

- (NSData)propertyListBodyData
{
  v2 = (void *)MEMORY[0x1E4F28F98];
  id v3 = [(SSVGratisRequestBody *)self bodyDictionary];
  v4 = [v2 dataWithPropertyList:v3 format:100 options:0 error:0];

  return (NSData *)v4;
}

- (void)setValue:(id)a3 forBodyParameter:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (!self->_additionalParameters)
  {
    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    additionalParameters = self->_additionalParameters;
    self->_additionalParameters = v7;
  }
  v9 = self->_additionalParameters;
  if (v10) {
    [(NSMutableDictionary *)v9 setObject:v10 forKey:v6];
  }
  else {
    [(NSMutableDictionary *)v9 removeObjectForKey:v6];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithRequestStyle:", self->_style);
  uint64_t v6 = [(NSNumber *)self->_accountID copyWithZone:a3];
  id v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSMutableDictionary *)self->_additionalParameters mutableCopyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSArray *)self->_applications copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  *(unsigned char *)(v5 + 32) = self->_backgroundRequest;
  uint64_t v12 = [(NSArray *)self->_bundleIdentifiers copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  uint64_t v14 = [(NSArray *)self->_itemIdentifiers copyWithZone:a3];
  v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  return (id)v5;
}

- (id)description
{
  id v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)SSVGratisRequestBody;
  uint64_t v4 = [(SSVGratisRequestBody *)&v9 description];
  uint64_t v5 = (void *)v4;
  itemIdentifiers = self->_itemIdentifiers;
  if (!itemIdentifiers) {
    itemIdentifiers = self->_bundleIdentifiers;
  }
  id v7 = [v3 stringWithFormat:@"%@: [IDs: %@]", v4, itemIdentifiers];

  return v7;
}

- (NSNumber)accountIdentifier
{
  return self->_accountID;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSArray)applications
{
  return self->_applications;
}

- (void)setApplications:(id)a3
{
}

- (BOOL)isBackgroundRequest
{
  return self->_backgroundRequest;
}

- (void)setBackgroundRequest:(BOOL)a3
{
  self->_backgroundRequest = a3;
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void)setBundleIdentifiers:(id)a3
{
}

- (NSArray)itemIdentifiers
{
  return self->_itemIdentifiers;
}

- (void)setItemIdentifiers:(id)a3
{
}

- (int64_t)requestStyle
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_additionalParameters, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end