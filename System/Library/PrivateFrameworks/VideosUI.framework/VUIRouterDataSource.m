@interface VUIRouterDataSource
- (VUIEventDataSource)contextMenuEventDataSource;
- (VUIEventDataSource)playEventDataSource;
- (VUIEventDataSource)selectEventDataSource;
- (VUIRouterDataSource)initWithLibraryMediaEntity:(id)a3;
- (VUIRouterDataSource)initWithRouterData:(id)a3 appContext:(id)a4;
- (VUIRouterDataSource)initWithRouterData:(id)a3 prefetchedData:(id)a4;
- (void)setContextMenuEventDataSource:(id)a3;
- (void)setPlayEventDataSource:(id)a3;
- (void)setSelectEventDataSource:(id)a3;
@end

@implementation VUIRouterDataSource

- (void)setSelectEventDataSource:(id)a3
{
}

- (VUIRouterDataSource)initWithRouterData:(id)a3 appContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)VUIRouterDataSource;
  v8 = [(VUIRouterDataSource *)&v19 init];
  if (v8 && [v6 count])
  {
    v9 = objc_msgSend(v6, "vui_dictionaryForKey:", @"selectEventDataSource");
    uint64_t v10 = +[VUIEventDataSource eventDataSourceWithEventDict:v9 appContext:v7];
    selectEventDataSource = v8->_selectEventDataSource;
    v8->_selectEventDataSource = (VUIEventDataSource *)v10;

    v12 = objc_msgSend(v6, "vui_dictionaryForKey:", @"playEventDataSource");
    uint64_t v13 = +[VUIEventDataSource eventDataSourceWithEventDict:v12 appContext:v7];
    playEventDataSource = v8->_playEventDataSource;
    v8->_playEventDataSource = (VUIEventDataSource *)v13;

    v15 = objc_msgSend(v6, "vui_dictionaryForKey:", @"contextMenuEventDataSource");
    uint64_t v16 = +[VUIEventDataSource eventDataSourceWithEventDict:v15 appContext:v7];
    contextMenuEventDataSource = v8->_contextMenuEventDataSource;
    v8->_contextMenuEventDataSource = (VUIEventDataSource *)v16;
  }
  return v8;
}

- (VUIRouterDataSource)initWithRouterData:(id)a3 prefetchedData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[v7 mutableCopy];
  v9 = objc_msgSend(v7, "vui_dictionaryForKey:", @"selectEventDataSource");

  uint64_t v10 = +[VUIEventDataSource attachPrefetchedDict:v6 eventDict:v9];

  [v8 setValue:v10 forKey:@"selectEventDataSource"];
  v11 = (void *)[v8 copy];
  v12 = [[VUIRouterDataSource alloc] initWithRouterData:v11 appContext:0];

  return v12;
}

- (VUIEventDataSource)selectEventDataSource
{
  return self->_selectEventDataSource;
}

- (VUIEventDataSource)playEventDataSource
{
  return self->_playEventDataSource;
}

- (void)setPlayEventDataSource:(id)a3
{
}

- (VUIEventDataSource)contextMenuEventDataSource
{
  return self->_contextMenuEventDataSource;
}

- (void)setContextMenuEventDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextMenuEventDataSource, 0);
  objc_storeStrong((id *)&self->_playEventDataSource, 0);
  objc_storeStrong((id *)&self->_selectEventDataSource, 0);
}

- (VUIRouterDataSource)initWithLibraryMediaEntity:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIRouterDataSource;
  v5 = [(VUIRouterDataSource *)&v9 init];
  if (v5)
  {
    uint64_t v6 = +[VUIEventDataSource selectEventDataSourceWithLibraryMediaEntity:v4];
    selectEventDataSource = v5->_selectEventDataSource;
    v5->_selectEventDataSource = (VUIEventDataSource *)v6;
  }
  return v5;
}

@end