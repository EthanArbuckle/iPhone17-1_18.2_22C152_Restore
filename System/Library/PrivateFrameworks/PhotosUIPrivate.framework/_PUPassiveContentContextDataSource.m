@interface _PUPassiveContentContextDataSource
- (NSArray)suggestions;
- (NSString)context;
- (_PUPassiveContentContextDataSource)initWithContext:(id)a3 suggestions:(id)a4;
- (void)setContext:(id)a3;
@end

@implementation _PUPassiveContentContextDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void)setContext:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (_PUPassiveContentContextDataSource)initWithContext:(id)a3 suggestions:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)_PUPassiveContentContextDataSource;
  v8 = [(_PUPassiveContentContextDataSource *)&v28 init];
  if (v8)
  {
    id v9 = v6;
    v10 = [v7 firstObject];
    int v11 = [v10 type];

    if (v9 && (v11 == 8 || v11 == 6))
    {
      v12 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
      v13 = [v12 librarySpecificFetchOptions];

      v14 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
      [v13 setIncludedDetectionTypes:v14];

      v15 = (void *)MEMORY[0x1E4F391F0];
      v29[0] = v9;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
      v17 = [v15 fetchPersonsWithLocalIdentifiers:v16 options:v13];
      v18 = [v17 firstObject];

      v19 = [v18 displayName];
      if ([v19 length])
      {
        v20 = [v18 displayName];
      }
      else
      {
        v21 = [v18 name];
        if ([v21 length])
        {
          v20 = [v18 name];
        }
        else
        {
          v22 = [v18 uuid];
          v20 = [v22 substringToIndex:8];

          id v9 = v22;
        }

        id v9 = v21;
      }

      objc_msgSend(v20, "stringByAppendingFormat:", @" (%lu)", objc_msgSend(v7, "count"));
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    context = v8->_context;
    v8->_context = (NSString *)v9;
    id v24 = v9;

    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v7];
    suggestions = v8->_suggestions;
    v8->_suggestions = (NSArray *)v25;
  }
  return v8;
}

@end