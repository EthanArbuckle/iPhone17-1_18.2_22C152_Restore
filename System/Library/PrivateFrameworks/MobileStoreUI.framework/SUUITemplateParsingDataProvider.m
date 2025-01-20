@interface SUUITemplateParsingDataProvider
+ (id)templateParsingRegularExpression;
- (NSRegularExpression)regularExpression;
- (SUUITemplateParsingDataProvider)initWithRegularExpression:(id)a3;
- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5;
@end

@implementation SUUITemplateParsingDataProvider

+ (id)templateParsingRegularExpression
{
  id v8 = 0;
  v4 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"<script.*?id=\"(.*?)\".*?>((?:.|\\n)*?)</script>" options:8 error:&v8];
  id v5 = v8;
  if (!v4)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, a1, @"SUUITemplateLoader.m", 31, @"Malformed regular expression: %@", v5 object file lineNumber description];
  }
  return v4;
}

- (SUUITemplateParsingDataProvider)initWithRegularExpression:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUITemplateParsingDataProvider;
  v6 = [(SUUITemplateParsingDataProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_regularExpression, a3);
  }

  return v7;
}

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  v44[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = [a4 statusCode];
  if ((unint64_t)(v9 - 400) > 0xC7)
  {
    v11 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
    if (v11)
    {
      id v35 = v8;
      v16 = [(SUUITemplateParsingDataProvider *)self regularExpression];
      v17 = objc_msgSend(v16, "matchesInString:options:range:", v11, 0, 0, objc_msgSend(v11, "length"));

      v18 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v17, "count"));
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
              v24 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
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
      v33 = (void *)MEMORY[0x263F087E8];
      uint64_t v41 = *MEMORY[0x263F084D0];
      v42 = &unk_2705D0E38;
      id v13 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      [v33 errorWithDomain:@"SUUITemplateLoaderErrorDomain" code:561214578 userInfo:v13];
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
    v11 = [MEMORY[0x263EFC5E0] localizedStringForStatusCode:v9];
    v12 = (void *)MEMORY[0x263F087E8];
    v43[0] = @"SUUITemplateLoaderErrorHTTPStatusCodeKey";
    id v13 = [NSNumber numberWithInteger:v10];
    v43[1] = *MEMORY[0x263F08320];
    v44[0] = v13;
    v44[1] = v11;
    v14 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
    *a5 = [v12 errorWithDomain:@"SUUITemplateLoaderErrorDomain" code:1752462448 userInfo:v14];

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

@end