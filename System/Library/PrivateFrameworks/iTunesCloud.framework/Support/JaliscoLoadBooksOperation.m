@interface JaliscoLoadBooksOperation
- (BOOL)parserSuccess;
- (NSArray)books;
- (NSArray)queryStoreIDs;
- (id)_queryFilterEncodedStringForDAAPNameString:(id)a3;
- (id)metadataFilter;
- (id)queryFilter;
- (void)main;
- (void)setBooks:(id)a3;
- (void)setParserSuccess:(BOOL)a3;
- (void)setQueryStoreIDs:(id)a3;
@end

@implementation JaliscoLoadBooksOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_books, 0);

  objc_storeStrong((id *)&self->_queryStoreIDs, 0);
}

- (void)setParserSuccess:(BOOL)a3
{
  self->_parserSuccess = a3;
}

- (BOOL)parserSuccess
{
  return self->_parserSuccess;
}

- (void)setBooks:(id)a3
{
}

- (NSArray)books
{
  return self->_books;
}

- (void)setQueryStoreIDs:(id)a3
{
}

- (NSArray)queryStoreIDs
{
  return self->_queryStoreIDs;
}

- (id)metadataFilter
{
  return [&off_1001CCD18 componentsJoinedByString:@","];
}

- (id)queryFilter
{
  v2 = [(JaliscoLoadBooksOperation *)self _queryFilterEncodedStringForDAAPNameString:@"com.apple.itunes.extended-media-kind"];
  v3 = +[NSString stringWithFormat:@"('%@:%d')", v2, 0x400000];

  return v3;
}

- (id)_queryFilterEncodedStringForDAAPNameString:(id)a3
{
  return [a3 stringByReplacingOccurrencesOfString:@"-" withString:@"\\-"];
}

- (void)main
{
  v3 = [(JaliscoLoadBooksOperation *)self queryStoreIDs];
  if (v3
    && ([(JaliscoLoadBooksOperation *)self queryStoreIDs],
        v4 = objc_claimAutoreleasedReturnValue(),
        id v5 = [v4 count],
        v4,
        v3,
        !v5))
  {
    [(JaliscoLoadBooksOperation *)self setBooks:&__NSArray0__struct];
    [(CloudLibraryOperation *)self setStatus:1];
  }
  else
  {
    id v6 = [objc_alloc((Class)MSVXPCTransaction) initWithName:@"JaliscoLoadBooksOperation"];
    [v6 beginTransaction];
    v7 = [(CloudLibraryOperation *)self connection];
    v8 = NSTemporaryDirectory();
    v41[0] = v8;
    v41[1] = @"com.apple.MediaServices";
    v9 = +[NSUUID UUID];
    v10 = [v9 UUIDString];
    v41[2] = v10;
    v11 = +[NSArray arrayWithObjects:v41 count:3];
    v12 = +[NSString pathWithComponents:v11];

    v40[0] = v12;
    v40[1] = @"books.daap";
    v13 = +[NSArray arrayWithObjects:v40 count:2];
    v14 = +[NSURL fileURLWithPathComponents:v13];

    id v15 = [v7 databaseID];
    v16 = [(JaliscoLoadBooksOperation *)self metadataFilter];
    v17 = [(JaliscoLoadBooksOperation *)self queryFilter];
    v18 = +[ICItemsRequest requestWithDatabaseID:v15 metadataFilter:v16 queryFilter:v17 purchaseTokens:0 includeHiddenItems:0];

    [v18 setResponseDataDestinationFileURL:v14];
    [v18 setVerificationInteractionLevel:2];
    v19 = os_log_create("com.apple.amp.itunescloudd", "SDK");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      if ([v18 method]) {
        CFStringRef v22 = @"POST";
      }
      else {
        CFStringRef v22 = @"GET";
      }
      v23 = [v18 action];
      *(_DWORD *)buf = 138544386;
      *(void *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2114;
      v38 = (uint64_t (*)(uint64_t, uint64_t))v22;
      *(_WORD *)v39 = 2114;
      *(void *)&v39[2] = v23;
      *(_WORD *)&v39[10] = 2048;
      *(void *)&v39[12] = v7;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Sending Books ItemsRequest [<%{public}@: %p method=%{public}@ action=%{public}@>] on Connection: [%p]", buf, 0x34u);
    }
    dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v38 = sub_1000D0618;
    *(void *)v39 = sub_1000D0628;
    *(void *)&v39[8] = 0;
    v31 = _NSConcreteStackBlock;
    uint64_t v32 = 3221225472;
    v33 = sub_1000D0630;
    v34 = &unk_1001BEF30;
    v36 = buf;
    v25 = v24;
    v35 = v25;
    [v7 sendRequest:v18 withResponseHandler:&v31];
    dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
    if (objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "responseCode", v31, v32, v33, v34) == (id)200)
    {
      v26 = [*(id *)(*(void *)&buf[8] + 40) responseDataFileURL];
      v27 = +[NSInputStream inputStreamWithURL:v26];

      id v28 = [objc_alloc((Class)DKDAAPParser) initWithStream:v27];
      v29 = [[BooksParserDelegate alloc] initWithOperation:self];
      [v28 setDelegate:v29];
      [v28 parse];
    }
    if (self->_parserSuccess) {
      uint64_t v30 = 1;
    }
    else {
      uint64_t v30 = 2;
    }
    [(CloudLibraryOperation *)self setStatus:v30];
    [v6 endTransaction];

    _Block_object_dispose(buf, 8);
  }
}

@end