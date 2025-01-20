@interface VUIExtrasInfo
+ (BOOL)isValidExtrasInfo:(id)a3;
- (BOOL)isEntitledToPlay;
- (BOOL)isLightTheme;
- (NSNumber)contentRating;
- (NSString)actionParams;
- (NSString)adamID;
- (NSString)extrasURLString;
- (NSString)loadingImage;
- (NSString)name;
- (NSString)previewURLString;
- (NSURL)tvAppDeeplinkURL;
- (VUIExtrasInfo)initWithDictionary:(id)a3;
- (VUIExtrasInfo)initWithMediaItem:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_initializeWithMPMediaItem:(id)a3;
- (void)setActionParams:(id)a3;
@end

@implementation VUIExtrasInfo

- (VUIExtrasInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VUIExtrasInfo;
  v5 = [(VUIExtrasInfo *)&v10 init];
  v6 = v5;
  if (!v4) {
    goto LABEL_5;
  }
  if (!v5)
  {
    extrasDict = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = (NSDictionary *)v4;
    extrasDict = v6->_extrasDict;
    v6->_extrasDict = v7;
  }
  else
  {
LABEL_5:
    extrasDict = v6;
    v6 = 0;
  }
LABEL_7:

  return v6;
}

- (VUIExtrasInfo)initWithMediaItem:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VUIExtrasInfo;
  v5 = [(VUIExtrasInfo *)&v8 init];
  if (v5)
  {
    v6 = [v4 mediaPlayerMediaItem];
    [(VUIExtrasInfo *)v5 _initializeWithMPMediaItem:v6];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [VUIExtrasInfo alloc];
  extrasDict = self->_extrasDict;
  return [(VUIExtrasInfo *)v4 initWithDictionary:extrasDict];
}

- (NSString)adamID
{
  return (NSString *)[(NSDictionary *)self->_extrasDict vui_stringForKey:@"adamId"];
}

- (NSString)extrasURLString
{
  v2 = [(NSDictionary *)self->_extrasDict vui_stringForKey:@"extrasUrl"];
  v3 = v2;
  if (v2)
  {
    if ([v2 length]) {
      v2 = v3;
    }
    else {
      v2 = 0;
    }
  }
  id v4 = v2;

  return v4;
}

- (NSString)previewURLString
{
  v2 = [(NSDictionary *)self->_extrasDict vui_stringForKey:@"previewUrl"];
  v3 = v2;
  if (v2)
  {
    if ([v2 length]) {
      v2 = v3;
    }
    else {
      v2 = 0;
    }
  }
  id v4 = v2;

  return v4;
}

- (NSNumber)contentRating
{
  return (NSNumber *)[(NSDictionary *)self->_extrasDict vui_numberForKey:@"ratingValue"];
}

- (NSString)actionParams
{
  return (NSString *)[(NSDictionary *)self->_extrasDict vui_stringForKey:@"buyParams"];
}

- (void)setActionParams:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  extrasDict = self->_extrasDict;
  id v6 = a3;
  id v9 = [v4 dictionaryWithDictionary:extrasDict];
  [v9 setValue:v6 forKey:@"buyParams"];

  v7 = (NSDictionary *)[v9 copy];
  objc_super v8 = self->_extrasDict;
  self->_extrasDict = v7;
}

- (NSString)loadingImage
{
  return (NSString *)[(NSDictionary *)self->_extrasDict vui_stringForKey:@"loadingImage"];
}

- (BOOL)isLightTheme
{
  return [(NSDictionary *)self->_extrasDict vui_BOOLForKey:@"isLightTheme" defaultValue:0];
}

- (NSString)name
{
  return (NSString *)[(NSDictionary *)self->_extrasDict vui_stringForKey:@"name"];
}

- (NSURL)tvAppDeeplinkURL
{
  return (NSURL *)[(NSDictionary *)self->_extrasDict vui_URLForKey:@"url"];
}

- (BOOL)isEntitledToPlay
{
  return [(NSDictionary *)self->_extrasDict vui_BOOLForKey:@"isEntitledToPlay" defaultValue:0];
}

+ (BOOL)isValidExtrasInfo:(id)a3
{
  v3 = [a3 extrasURLString];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (void)_initializeWithMPMediaItem:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v25 = v4;
    v5 = objc_opt_new();
    id v6 = [v25 valueForProperty:*MEMORY[0x1E4F314F0]];
    if ([v6 length])
    {
      v7 = [v25 valueForProperty:*MEMORY[0x1E4F31388]];
      if ([v7 length])
      {
        objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:v6];
        id v9 = v8;
        if (v8)
        {
          objc_super v10 = [v8 queryItems];
          id v11 = (id)[v10 mutableCopy];

          if (!v11) {
            id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          v12 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"hlsUrl" value:v7];
          if (v12)
          {
            [v11 addObject:v12];
            [v9 setQueryItems:v11];
            v13 = [v9 URL];
            v14 = [v13 absoluteString];

            if ([v14 length])
            {
              id v15 = v14;

              id v6 = v15;
            }
          }
        }
      }
      [v5 setObject:v6 forKey:@"extrasUrl"];
    }
    v16 = [v25 valueForProperty:*MEMORY[0x1E4F31510]];
    if ([v16 length]) {
      [v5 setObject:v16 forKey:@"buyParams"];
    }
    v17 = [v25 valueForProperty:*MEMORY[0x1E4F31500]];
    v18 = v17;
    if (v17 && [v17 longLongValue])
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", objc_msgSend(v18, "longLongValue"));
      [v5 setObject:v19 forKey:@"adamId"];
    }
    v20 = [v25 valueForProperty:*MEMORY[0x1E4F31338]];
    if (![v20 count]) {
      goto LABEL_24;
    }
    v21 = [v20 objectForKeyedSubscript:@"ratingLevel"];
    if ([v21 length])
    {
      uint64_t v22 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v21, "integerValue"));

      if (!v22)
      {
LABEL_24:
        v23 = (NSDictionary *)[v5 copy];
        extrasDict = self->_extrasDict;
        self->_extrasDict = v23;

        id v4 = v25;
        goto LABEL_25;
      }
      [v5 setObject:v22 forKey:@"ratingValue"];
      v21 = (void *)v22;
    }

    goto LABEL_24;
  }
LABEL_25:
}

- (void).cxx_destruct
{
}

@end