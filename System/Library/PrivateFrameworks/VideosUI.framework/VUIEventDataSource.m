@interface VUIEventDataSource
+ (VUIEventDataSource)eventDataSourceWithEventDict:(id)a3 appContext:(id)a4;
+ (id)_actionForKey:(id)a3 eventDict:(id)a4 appContext:(id)a5;
+ (id)_documentDataSourceWithDict:(id)a3;
+ (id)attachPrefetchedDict:(id)a3 eventDict:(id)a4;
+ (id)selectEventDataSourceWithLibraryMediaEntity:(id)a3;
- (VUIAction)action;
- (VUIAction)postAction;
- (VUIAction)preAction;
- (VUIDocumentDataSource)documentDataSource;
- (VUIDocumentDataSource)postActionDocumentDataSource;
- (VUIDocumentDataSource)preActionDocumentDataSource;
- (VUIMediaEntity)mediaEntity;
- (id)_initWithLibraryMediaEntity:(id)a3;
- (void)setAction:(id)a3;
- (void)setDocumentDataSource:(id)a3;
- (void)setMediaEntity:(id)a3;
- (void)setPostAction:(id)a3;
- (void)setPostActionDocumentDataSource:(id)a3;
- (void)setPreAction:(id)a3;
- (void)setPreActionDocumentDataSource:(id)a3;
@end

@implementation VUIEventDataSource

- (void)setDocumentDataSource:(id)a3
{
}

+ (VUIEventDataSource)eventDataSourceWithEventDict:(id)a3 appContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_class();
  v8 = objc_msgSend(v5, "vui_dictionaryForKey:", @"documentDataSource");
  uint64_t v9 = [v7 _documentDataSourceWithDict:v8];

  uint64_t v10 = [(id)objc_opt_class() _actionForKey:@"actionDataSource" eventDict:v5 appContext:v6];
  if (v9 | v10)
  {
    v11 = [(id)objc_opt_class() _actionForKey:@"preActionDataSource" eventDict:v5 appContext:v6];
    v12 = objc_opt_class();
    v13 = objc_msgSend(v5, "vui_dictionaryForKey:", @"preActionDocumentDataSource");
    v14 = [v12 _documentDataSourceWithDict:v13];

    v15 = [(id)objc_opt_class() _actionForKey:@"postActionDataSource" eventDict:v5 appContext:v6];
    v16 = objc_opt_class();
    v17 = objc_msgSend(v5, "vui_dictionaryForKey:", @"postActionDocumentDataSource");
    v18 = [v16 _documentDataSourceWithDict:v17];

    v19 = objc_opt_new();
    [v19 setPreActionDocumentDataSource:v14];
    [v19 setPreAction:v11];
    [v19 setDocumentDataSource:v9];
    [v19 setAction:v10];
    [v19 setPostActionDocumentDataSource:v18];
    [v19 setPostAction:v15];
  }
  else
  {
    v19 = 0;
  }

  return (VUIEventDataSource *)v19;
}

+ (id)attachPrefetchedDict:(id)a3 eventDict:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[v5 mutableCopy];
  v8 = objc_msgSend(v5, "vui_dictionaryForKey:", @"documentDataSource");

  uint64_t v9 = (void *)[v8 mutableCopy];
  [v9 setValue:v6 forKey:@"prefetchedData"];

  [v7 setValue:v9 forKey:@"documentDataSource"];
  uint64_t v10 = (void *)[v7 copy];

  return v10;
}

+ (id)_documentDataSourceWithDict:(id)a3
{
  return +[VUIDocumentDataSource documentDataSourceWithDictionary:a3];
}

+ (id)_actionForKey:(id)a3 eventDict:(id)a4 appContext:(id)a5
{
  id v7 = a5;
  v8 = objc_msgSend(a4, "vui_dictionaryForKey:", a3);
  if (v8)
  {
    uint64_t v9 = +[VUIAction actionWithDictionary:v8 appContext:v7];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (VUIDocumentDataSource)preActionDocumentDataSource
{
  return self->_preActionDocumentDataSource;
}

- (void)setPreActionDocumentDataSource:(id)a3
{
}

- (VUIAction)preAction
{
  return self->_preAction;
}

- (void)setPreAction:(id)a3
{
}

- (VUIDocumentDataSource)documentDataSource
{
  return self->_documentDataSource;
}

- (VUIAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (VUIDocumentDataSource)postActionDocumentDataSource
{
  return self->_postActionDocumentDataSource;
}

- (void)setPostActionDocumentDataSource:(id)a3
{
}

- (VUIAction)postAction
{
  return self->_postAction;
}

- (void)setPostAction:(id)a3
{
}

- (VUIMediaEntity)mediaEntity
{
  return self->_mediaEntity;
}

- (void)setMediaEntity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaEntity, 0);
  objc_storeStrong((id *)&self->_postAction, 0);
  objc_storeStrong((id *)&self->_postActionDocumentDataSource, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_documentDataSource, 0);
  objc_storeStrong((id *)&self->_preAction, 0);
  objc_storeStrong((id *)&self->_preActionDocumentDataSource, 0);
}

- (id)_initWithLibraryMediaEntity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIEventDataSource;
  id v6 = [(VUIEventDataSource *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mediaEntity, a3);
  }

  return v7;
}

+ (id)selectEventDataSourceWithLibraryMediaEntity:(id)a3
{
  id v3 = a3;
  id v4 = [[VUIEventDataSource alloc] _initWithLibraryMediaEntity:v3];

  return v4;
}

@end