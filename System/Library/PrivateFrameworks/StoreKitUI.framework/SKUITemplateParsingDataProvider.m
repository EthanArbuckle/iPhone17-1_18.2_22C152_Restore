@interface SKUITemplateParsingDataProvider
+ (id)templateParsingRegularExpression;
+ (void)templateParsingRegularExpression;
- (NSRegularExpression)regularExpression;
- (SKUITemplateParsingDataProvider)initWithRegularExpression:(id)a3;
- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5;
@end

@implementation SKUITemplateParsingDataProvider

+ (id)templateParsingRegularExpression
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        +[SKUITemplateParsingDataProvider templateParsingRegularExpression];
      }
    }
  }
  uint64_t v12 = 0;
  v10 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"<script.*?id=\"(.*?)\".*?>((?:.|\\n)*?)</script>" options:8 error:&v12];

  return v10;
}

- (SKUITemplateParsingDataProvider)initWithRegularExpression:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUITemplateParsingDataProvider initWithRegularExpression:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUITemplateParsingDataProvider;
  v14 = [(SKUITemplateParsingDataProvider *)&v17 init];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_regularExpression, a3);
  }

  return v15;
}

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  v44[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [a4 statusCode];
  if ((unint64_t)(v9 - 400) > 0xC7)
  {
    uint64_t v11 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
    if (v11)
    {
      id v35 = v8;
      v16 = [(SKUITemplateParsingDataProvider *)self regularExpression];
      objc_super v17 = objc_msgSend(v16, "matchesInString:options:range:", v11, 0, 0, objc_msgSend(v11, "length"));

      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v17, "count"));
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v13 = v17;
      uint64_t v19 = [v13 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v37 != v21) {
              objc_enumerationMutation(v13);
            }
            v23 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            if ([v23 numberOfRanges] == 3)
            {
              v24 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
              uint64_t v25 = [v23 rangeAtIndex:1];
              v27 = objc_msgSend(v11, "substringWithRange:", v25, v26);
              v28 = [v27 stringByTrimmingCharactersInSet:v24];

              uint64_t v29 = [v23 rangeAtIndex:2];
              v31 = objc_msgSend(v11, "substringWithRange:", v29, v30);
              v32 = [v31 stringByTrimmingCharactersInSet:v24];

              [v18 setObject:v32 forKeyedSubscript:v28];
            }
            else
            {
              NSLog(&cfstr_MalformedMatch.isa, v23);
            }
          }
          uint64_t v20 = [v13 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v20);
      }

      v15 = (void *)[v18 copy];
      id v8 = v35;
    }
    else
    {
      if (!a5)
      {
        v15 = 0;
        goto LABEL_20;
      }
      v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = *MEMORY[0x1E4F28908];
      v42 = &unk_1F1D61E08;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      [v33 errorWithDomain:@"SKUITemplateLoaderErrorDomain" code:561214578 userInfo:v13];
      v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (!a5)
    {
      v15 = 0;
      goto LABEL_21;
    }
    uint64_t v10 = v9;
    uint64_t v11 = [MEMORY[0x1E4F18D40] localizedStringForStatusCode:v9];
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    v43[0] = @"SKUITemplateLoaderErrorHTTPStatusCodeKey";
    id v13 = [NSNumber numberWithInteger:v10];
    v43[1] = *MEMORY[0x1E4F28568];
    v44[0] = v13;
    v44[1] = v11;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];
    *a5 = [v12 errorWithDomain:@"SKUITemplateLoaderErrorDomain" code:1752462448 userInfo:v14];

    v15 = 0;
  }

LABEL_20:
LABEL_21:

  return v15;
}

- (NSRegularExpression)regularExpression
{
  return self->_regularExpression;
}

- (void).cxx_destruct
{
}

+ (void)templateParsingRegularExpression
{
}

- (void)initWithRegularExpression:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end