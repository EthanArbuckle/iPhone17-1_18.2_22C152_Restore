@interface VUIFamilySharingMediaEntitiesResponseMetadataParser
- (AMSURLResult)result;
- (VUIFamilySharingMediaEntitiesResponseMetadataParser)init;
- (id)_parseOffsetFromMetaBag;
- (id)_parseTotalFromMetaBag;
- (id)parseAMSURLResult:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation VUIFamilySharingMediaEntitiesResponseMetadataParser

- (VUIFamilySharingMediaEntitiesResponseMetadataParser)init
{
  v6.receiver = self;
  v6.super_class = (Class)VUIFamilySharingMediaEntitiesResponseMetadataParser;
  v2 = [(VUIFamilySharingMediaEntitiesResponseMetadataParser *)&v6 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.tv.mediaAPI", "VUIFamilySharingMediaEntitiesResponseMetadataParser");
    v4 = (void *)sLogObject_3;
    sLogObject_3 = (uint64_t)v3;
  }
  return v2;
}

- (id)parseAMSURLResult:(id)a3
{
  id v4 = a3;
  [(VUIFamilySharingMediaEntitiesResponseMetadataParser *)self setResult:v4];
  v5 = objc_alloc_init(VUIMediaAPIResponseMetadata);
  objc_super v6 = [v4 object];

  objc_opt_class();
  LOBYTE(v4) = objc_opt_isKindOfClass();

  if (v4)
  {
    v7 = [(VUIFamilySharingMediaEntitiesResponseMetadataParser *)self _parseTotalFromMetaBag];
    [(VUIMediaAPIResponseMetadata *)v5 setTotal:v7];

    v8 = [(VUIFamilySharingMediaEntitiesResponseMetadataParser *)self _parseOffsetFromMetaBag];
    [(VUIMediaAPIResponseMetadata *)v5 setOffset:v8];
  }
  else
  {
    v9 = sLogObject_3;
    if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "Parsing AMS Metadata with no object dictionary", v11, 2u);
    }
  }
  return v5;
}

- (id)_parseTotalFromMetaBag
{
  v2 = [(VUIFamilySharingMediaEntitiesResponseMetadataParser *)self result];
  os_log_t v3 = [v2 object];
  id v4 = objc_msgSend(v3, "vui_dictionaryForKey:", @"meta");

  if (!v4)
  {
    v5 = sLogObject_3;
    if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Parsing AMS Meta with no meta bag", v8, 2u);
    }
  }
  objc_super v6 = objc_msgSend(v4, "vui_numberForKey:", @"total");

  return v6;
}

- (id)_parseOffsetFromMetaBag
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [(VUIFamilySharingMediaEntitiesResponseMetadataParser *)self result];
  os_log_t v3 = [v2 object];
  id v4 = objc_msgSend(v3, "vui_stringForKey:", @"next");

  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:v4];
    [v5 queryItems];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "name", (void)v17);
          int v13 = [v12 isEqualToString:@"offset"];

          if (v13)
          {
            v14 = [v11 value];
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    v14 = 0;
LABEL_12:
  }
  else
  {
    v15 = sLogObject_3;
    if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "Parsing AMS Meta with no offset bag", buf, 2u);
    }
    v14 = 0;
  }

  return v14;
}

- (AMSURLResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end