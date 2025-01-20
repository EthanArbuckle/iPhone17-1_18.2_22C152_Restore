@interface VUIGenresRequestResponseParser
- (VUIGenresRequestResponseParser)init;
- (id)_parseRawGenreResults:(id)a3;
- (id)parseAMSURLResult:(id)a3;
@end

@implementation VUIGenresRequestResponseParser

- (VUIGenresRequestResponseParser)init
{
  v6.receiver = self;
  v6.super_class = (Class)VUIGenresRequestResponseParser;
  v2 = [(VUIGenresRequestResponseParser *)&v6 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.tv.mediaAPI", "VUIGenresRequestResponseParser");
    v4 = (void *)sLogObject_7;
    sLogObject_7 = (uint64_t)v3;
  }
  return v2;
}

- (id)parseAMSURLResult:(id)a3
{
  id v4 = a3;
  v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [v4 object];
    v8 = objc_msgSend(v7, "vui_arrayForKey:", @"data");

    if (v8)
    {
      v9 = [(VUIGenresRequestResponseParser *)self _parseRawGenreResults:v8];
    }
    else
    {
      v11 = sLogObject_7;
      if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Parsing AMS Genre Fetch with no data bag", v13, 2u);
      }
      v9 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v10 = sLogObject_7;
    if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "Parsing AMS Genre Fetch with no object dictionary", buf, 2u);
    }
    v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (id)_parseRawGenreResults:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    objc_super v6 = &unk_1EBFC8000;
    uint64_t v7 = *(void *)v43;
    uint64_t v32 = *(void *)v43;
    do
    {
      uint64_t v8 = 0;
      uint64_t v34 = v5;
      do
      {
        if (*(void *)v43 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v42 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v10 = objc_msgSend(v9, "vui_dictionaryForKey:", @"attributes");
          if (!v10)
          {
            v11 = *((void *)v6 + 327);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Parsing AMS Genre with no Attributes", buf, 2u);
            }
          }
          v12 = objc_msgSend(v10, "vui_stringForKey:", @"name");
          if (v12)
          {
            uint64_t v36 = objc_msgSend(v9, "vui_stringForKey:", @"id");
            long long v37 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            id v13 = v33;
            uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v47 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v38;
              while (2)
              {
                for (uint64_t i = 0; i != v15; ++i)
                {
                  if (*(void *)v38 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  v18 = *(void **)(*((void *)&v37 + 1) + 8 * i);
                  v19 = [v18 genreTitle];
                  int v20 = [v19 isEqualToString:v12];

                  if (v20)
                  {
                    id v25 = objc_alloc(MEMORY[0x1E4F1CA48]);
                    v26 = [v18 genreIdentifiers];
                    v27 = (void *)[v25 initWithArray:v26];

                    v22 = (void *)v36;
                    [v27 addObject:v36];
                    v28 = (void *)[v27 copy];
                    [v18 setGenreIdentifiers:v28];

                    goto LABEL_23;
                  }
                }
                uint64_t v15 = [v13 countByEnumeratingWithState:&v37 objects:v47 count:16];
                if (v15) {
                  continue;
                }
                break;
              }
            }

            v21 = objc_alloc_init(VUIFamilySharingGenre);
            v22 = (void *)v36;
            uint64_t v46 = v36;
            v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
            [(VUIFamilySharingGenre *)v21 setGenreIdentifiers:v23];

            [(VUIFamilySharingGenre *)v21 setGenreTitle:v12];
            [v13 addObject:v21];

LABEL_23:
            objc_super v6 = &unk_1EBFC8000;
            uint64_t v5 = v34;
            uint64_t v7 = v32;
          }
          else
          {
            v29 = *((void *)v6 + 327);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1E2BD7000, v29, OS_LOG_TYPE_DEFAULT, "Parsing AMS Genre with no Name", buf, 2u);
            }
            v22 = objc_msgSend(v9, "vui_stringForKey:", @"id");
          }
        }
        else
        {
          v24 = *((void *)v6 + 327);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E2BD7000, v24, OS_LOG_TYPE_DEFAULT, "Parsing AMS Genre invalid genre dictionary", buf, 2u);
          }
        }
        ++v8;
      }
      while (v8 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v5);
  }

  v30 = (void *)[v33 copy];
  return v30;
}

@end