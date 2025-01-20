@interface PKPassEntitlementTemplate
- (BOOL)clearGroupWhenSelected;
- (NSString)icon;
- (NSString)localizedDescription;
- (NSString)localizedGroup;
- (NSString)localizedTitle;
- (PKPassEntitlementTemplate)initWithDictionary:(id)a3 bundle:(id)a4;
- (id)_stringReplacingPlaceholdersInString:(id)a3 withInserts:(id)a4;
- (int64_t)groupRenderingPriority;
- (unint64_t)displayStyle;
- (void)setFieldInserts:(id)a3;
@end

@implementation PKPassEntitlementTemplate

- (PKPassEntitlementTemplate)initWithDictionary:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPassEntitlementTemplate;
  v9 = [(PKPassEntitlementTemplate *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rawDictionary, a3);
    objc_storeStrong((id *)&v10->_bundle, a4);
  }

  return v10;
}

- (void)setFieldInserts:(id)a3
{
  v4 = (NSDictionary *)[a3 copy];
  fieldInserts = self->_fieldInserts;
  self->_fieldInserts = v4;
}

- (NSString)localizedTitle
{
  v3 = [(NSDictionary *)self->_rawDictionary objectForKeyedSubscript:@"title"];
  v4 = [(NSDictionary *)self->_fieldInserts objectForKeyedSubscript:@"title"];
  v5 = [(PKPassEntitlementTemplate *)self _stringReplacingPlaceholdersInString:v3 withInserts:v4];

  return (NSString *)v5;
}

- (NSString)localizedDescription
{
  v3 = [(NSDictionary *)self->_rawDictionary objectForKeyedSubscript:@"description"];
  v4 = [(NSDictionary *)self->_fieldInserts objectForKeyedSubscript:@"description"];
  v5 = [(PKPassEntitlementTemplate *)self _stringReplacingPlaceholdersInString:v3 withInserts:v4];

  return (NSString *)v5;
}

- (NSString)localizedGroup
{
  v3 = [(NSDictionary *)self->_rawDictionary objectForKeyedSubscript:@"groupTitle"];
  v4 = [(NSDictionary *)self->_fieldInserts objectForKeyedSubscript:@"groupTitle"];
  v5 = [(PKPassEntitlementTemplate *)self _stringReplacingPlaceholdersInString:v3 withInserts:v4];

  return (NSString *)v5;
}

- (int64_t)groupRenderingPriority
{
  v2 = [(NSDictionary *)self->_rawDictionary PKNumberForKey:@"groupRenderingPriority"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (BOOL)clearGroupWhenSelected
{
  v2 = [(NSDictionary *)self->_rawDictionary objectForKeyedSubscript:@"clearGroupWhenSelected"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)icon
{
  return (NSString *)[(NSDictionary *)self->_rawDictionary objectForKeyedSubscript:@"icon"];
}

- (unint64_t)displayStyle
{
  v2 = [(NSDictionary *)self->_rawDictionary objectForKeyedSubscript:@"displayStyle"];
  unint64_t v3 = PKPassEntitlementDisplayStyleFromString(v2);

  return v3;
}

- (id)_stringReplacingPlaceholdersInString:(id)a3 withInserts:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v6 = (NSString *)a3;
  id v7 = a4;
  if (v6)
  {
    id v40 = v7;
    id v8 = PKLocalizedStringInMobileAssetsStringsBundle(v6, self->_bundle, 0);

    id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    id v47 = 0;
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"%\\w+%" options:0 error:&v47];
    id v11 = v47;
    objc_super v12 = objc_msgSend(v10, "matchesInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));
    uint64_t v13 = [v12 count];
    v14 = v8;
    if (v13)
    {
      v37 = v12;
      id v38 = v11;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id obj = v12;
      uint64_t v15 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
      v39 = v10;
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = 0;
        uint64_t v18 = *(void *)v44;
        do
        {
          uint64_t v19 = 0;
          uint64_t v41 = v16;
          do
          {
            if (*(void *)v44 != v18) {
              objc_enumerationMutation(obj);
            }
            uint64_t v20 = [*(id *)(*((void *)&v43 + 1) + 8 * v19) range];
            if (v20 != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v22 = v20;
              uint64_t v23 = v21;
              v24 = objc_msgSend(v8, "substringWithRange:", v17, v20);
              v25 = v9;
              [v9 appendString:v24];

              v26 = v8;
              v27 = objc_msgSend(v8, "substringWithRange:", v22 + 1, v23 - 2);
              uint64_t v28 = [v40 objectForKeyedSubscript:v27];
              if (!v28) {
                goto LABEL_12;
              }
              v29 = (void *)v28;
              v30 = NSString;
              v31 = [v40 objectForKeyedSubscript:v27];
              v32 = [v30 stringWithFormat:@"%@", v31];

              if (v32)
              {
                [v25 appendString:v32];
              }
              else
              {
LABEL_12:
                v33 = PKLogFacilityTypeGetObject(0x1BuLL);
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v49 = v27;
                  _os_log_impl(&dword_190E10000, v33, OS_LOG_TYPE_DEFAULT, "Error: Did not find %@ in entitlement template fields", buf, 0xCu);
                }

                [v25 appendString:@"•••"];
              }
              uint64_t v17 = v22 + v23;

              id v8 = v26;
              id v9 = v25;
              uint64_t v16 = v41;
            }
            ++v19;
          }
          while (v16 != v19);
          uint64_t v16 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
        }
        while (v16);
      }
      else
      {
        uint64_t v17 = 0;
      }

      v35 = objc_msgSend(v8, "substringWithRange:", v17, objc_msgSend(v8, "length") - v17);
      [v9 appendString:v35];

      v14 = v9;
      id v11 = v38;
      v10 = v39;
      objc_super v12 = v37;
    }
    id v34 = v14;

    id v7 = v40;
  }
  else
  {
    id v34 = 0;
  }

  return v34;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldInserts, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_rawDictionary, 0);
}

@end