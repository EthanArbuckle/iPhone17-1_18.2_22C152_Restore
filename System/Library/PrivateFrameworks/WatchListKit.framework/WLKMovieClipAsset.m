@interface WLKMovieClipAsset
+ (id)movieClipAssetsWithArray:(id)a3;
- (NSString)durationString;
- (NSString)flavor;
- (NSString)url;
- (WLKMovieClipAsset)init;
- (WLKMovieClipAsset)initWithDictionary:(id)a3;
- (id)_init;
- (unint64_t)duration;
@end

@implementation WLKMovieClipAsset

+ (id)movieClipAssetsWithArray:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (v10)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v11 = v10;
              v12 = [WLKMovieClipAsset alloc];
              v13 = -[WLKMovieClipAsset initWithDictionary:](v12, "initWithDictionary:", v11, (void)v16);

              [v4 addObject:v13];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    v14 = (void *)[v4 copy];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (WLKMovieClipAsset)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(WLKMovieClipAsset *)self _init];
    if (v5)
    {
      uint64_t v6 = objc_msgSend(v4, "wlk_numberForKey:", @"durationInMilliseconds");
      v5[1] = [v6 unsignedIntegerValue] / 0x3E8uLL;

      uint64_t v7 = objc_msgSend(v4, "wlk_stringForKey:", @"flavor");
      uint64_t v8 = [v7 copy];
      v9 = (void *)v5[2];
      v5[2] = v8;

      v10 = objc_msgSend(v4, "wlk_stringForKey:", @"url");
      uint64_t v11 = [v10 copy];
      v12 = (void *)v5[3];
      v5[3] = v11;
    }
    self = v5;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)WLKMovieClipAsset;
  return [(WLKMovieClipAsset *)&v3 init];
}

- (WLKMovieClipAsset)init
{
  return 0;
}

- (NSString)durationString
{
  objc_super v3 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_duration / 0x3C);
  if (self->_duration % 0x3C >= 0xA) {
    id v4 = @"%lu";
  }
  else {
    id v4 = @"0%lu";
  }
  id v5 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v4, @"%lu", 0, self->_duration % 0x3C);
  uint64_t v6 = [NSString stringWithFormat:@"%@:%@", v3, v5];

  return (NSString *)v6;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (NSString)flavor
{
  return self->_flavor;
}

- (NSString)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_flavor, 0);
}

@end