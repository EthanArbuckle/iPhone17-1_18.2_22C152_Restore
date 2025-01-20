@interface MKHTTPContentDisposition
- (MKHTTPContentDisposition)initWithHeaderValue:(id)a3;
- (NSString)filename;
- (NSString)folder;
- (NSString)originalFilename;
- (void)setFilename:(id)a3;
- (void)setFolder:(id)a3;
- (void)setOriginalFilename:(id)a3;
@end

@implementation MKHTTPContentDisposition

- (MKHTTPContentDisposition)initWithHeaderValue:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)MKHTTPContentDisposition;
  v5 = [(MKHTTPContentDisposition *)&v39 init];
  v6 = v5;
  if (v5)
  {
    v30 = v5;
    id v32 = v4;
    id v33 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v4 componentsSeparatedByString:@";"];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v36;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v36 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * v10), "componentsSeparatedByString:", @"=", v30);
          if ([v11 count] == 2)
          {
            v12 = [v11 objectAtIndexedSubscript:0];
            v13 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
            v14 = [v12 stringByTrimmingCharactersInSet:v13];

            v15 = [v11 objectAtIndexedSubscript:1];
            v16 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
            v17 = [v15 stringByTrimmingCharactersInSet:v16];

            if ((unint64_t)[v17 length] >= 2)
            {
              uint64_t v18 = [v14 lowercaseString];

              uint64_t v19 = objc_msgSend(v17, "substringWithRange:", 1, objc_msgSend(v17, "length") - 2);

              [v33 setObject:v19 forKey:v18];
              v14 = (void *)v18;
              v17 = (void *)v19;
            }
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v8);
    }
    v20 = objc_msgSend(v33, "objectForKeyedSubscript:", @"filename", v30);
    v21 = [v20 stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    v22 = [v21 stringByRemovingPercentEncoding];
    v6 = v31;
    [(MKHTTPContentDisposition *)v31 setFilename:v22];

    v23 = [v33 objectForKeyedSubscript:@"folder"];
    v24 = [v23 stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    v25 = [v24 stringByRemovingPercentEncoding];
    [(MKHTTPContentDisposition *)v31 setFolder:v25];

    v26 = [v33 objectForKeyedSubscript:@"original_filename"];
    v27 = [v26 stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    v28 = [v27 stringByRemovingPercentEncoding];
    [(MKHTTPContentDisposition *)v31 setOriginalFilename:v28];

    id v4 = v32;
  }

  return v6;
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (NSString)folder
{
  return self->_folder;
}

- (void)setFolder:(id)a3
{
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (void)setOriginalFilename:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalFilename, 0);
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_filename, 0);
}

@end