@interface _BCDragStoreURLProvider
+ (NSArray)writableTypeIdentifiersForItemProvider;
- (_BCDragStoreURLProvider)initWithStoreID:(id)a3 contentType:(int64_t)a4 storeURL:(id)a5;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (void)_loadStoreURL:(id)a3;
@end

@implementation _BCDragStoreURLProvider

- (_BCDragStoreURLProvider)initWithStoreID:(id)a3 contentType:(int64_t)a4 storeURL:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_BCDragStoreURLProvider;
  v11 = [(_BCDragStoreURLProvider *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_storeID, a3);
    v12->_contentType = a4;
    objc_storeStrong((id *)&v12->_storeURL, a5);
  }

  return v12;
}

- (void)_loadStoreURL:(id)a3
{
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_DEB30;
  v19 = &unk_2C8D10;
  id v4 = a3;
  id v20 = v4;
  v5 = objc_retainBlock(&v16);
  v6 = v5;
  storeURL = self->_storeURL;
  if (storeURL)
  {
    ((void (*)(void ***, NSURL *, void))v5[2])(v5, storeURL, 0);
  }
  else
  {
    int64_t contentType = self->_contentType;
    if (contentType == 1)
    {
      +[NSString stringWithFormat:@"https://books.apple.com/book/id%@", self->_storeID, v16, v17, v18, v19];
    }
    else
    {
      if (contentType != 6)
      {
        v11 = +[BCMBridgedCatalogService sharedInstance];
        storeID = self->_storeID;
        id v13 = objc_alloc((Class)BFMRequestMetadata);
        objc_super v14 = +[NSString stringWithFormat:@"%s", "BCDragRepresentationFactory.m", v16, v17, v18, v19];
        id v15 = [v13 initWithFileID:v14 line:286];
        [v11 fetchStoreURLOfUnknownTypeForAdamID:storeID metadata:v15 completionHandler:v6];

        goto LABEL_9;
      }
      +[NSString stringWithFormat:@"https://books.apple.com/audiobook/id%@", self->_storeID, v16, v17, v18, v19];
    id v9 = };
    id v10 = +[NSURL URLWithString:v9];
    ((void (*)(void ***, void *, void))v6[2])(v6, v10, 0);
  }
LABEL_9:
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  v2 = [UTTypeURL identifier];
  v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return (NSArray *)v3;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  v8 = [UTTypeURL identifier];
  unsigned int v9 = [v8 isEqualToString:v6];

  if (v9)
  {
    [(_BCDragStoreURLProvider *)self _loadStoreURL:v7];
  }
  else
  {
    if (v6)
    {
      CFStringRef v13 = @"typeIdentifier";
      id v14 = v6;
      id v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    }
    else
    {
      id v10 = 0;
    }
    v11 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:v10];
    v7[2](v7, 0, v11);
  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeURL, 0);

  objc_storeStrong((id *)&self->_storeID, 0);
}

@end