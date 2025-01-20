@interface BKWK2LoaderContentInfoRequest
+ (BKWK2LoaderContentInfoRequest)contentInfoRequestWithLocation:(id)a3 bookSnapshot:(id)a4 ordinal:(unint64_t)a5 configuration:(id)a6 stylesheetSet:(id)a7 completion:(id)a8;
+ (BKWK2LoaderContentInfoRequest)contentInfoRequestWithPaginationOptions:(id)a3 cleanupOptions:(id)a4 cfiOptions:(id)a5 ordinal:(unint64_t)a6 stylesheetSet:(id)a7 completion:(id)a8;
- (AEBookInfoSnapshot)bookSnapshot;
- (BECFIUtilitiesJSOptions)cfiOptions;
- (BEContentCleanupJSOptions)cleanupOptions;
- (BEWebViewFactoryPaginationOptions)paginationOptions;
- (BEWebViewFactoryStylesheetSet)stylesheetSet;
- (BKLocation)location;
- (BKWK2LoaderContentInfoRequest)initWithLocation:(id)a3 bookSnapshot:(id)a4 ordinal:(unint64_t)a5 configuration:(id)a6 stylesheetSet:(id)a7 completion:(id)a8;
- (BKWK2LoaderContentInfoRequest)initWithPaginationOptions:(id)a3 cleanupOptions:(id)a4 cfiOptions:(id)a5 ordinal:(unint64_t)a6 stylesheetSet:(id)a7 fontSize:(double)a8 completion:(id)a9;
- (BOOL)isRequestValid;
- (BOOL)restoreFrame;
- (NSString)requestID;
- (double)fontSize;
- (id)completion;
- (id)description;
- (unint64_t)ordinal;
- (unint64_t)state;
- (void)invalidateRequest;
- (void)setBookSnapshot:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setFontSize:(double)a3;
- (void)setLocation:(id)a3;
- (void)setPaginationOptions:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setRestoreFrame:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setStylesheetSet:(id)a3;
@end

@implementation BKWK2LoaderContentInfoRequest

+ (BKWK2LoaderContentInfoRequest)contentInfoRequestWithLocation:(id)a3 bookSnapshot:(id)a4 ordinal:(unint64_t)a5 configuration:(id)a6 stylesheetSet:(id)a7 completion:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a4;
  id v17 = a3;
  v18 = [[BKWK2LoaderContentInfoRequest alloc] initWithLocation:v17 bookSnapshot:v16 ordinal:a5 configuration:v15 stylesheetSet:v14 completion:v13];

  return v18;
}

- (BKWK2LoaderContentInfoRequest)initWithLocation:(id)a3 bookSnapshot:(id)a4 ordinal:(unint64_t)a5 configuration:(id)a6 stylesheetSet:(id)a7 completion:(id)a8
{
  id v27 = a3;
  id obj = a4;
  id v14 = a4;
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  [v17 contentLayoutSize];
  v18 = +[BEWebViewFactoryPaginationOptions paginationOptionsForBookInfoSnapshot:withConfiguration:contentLayoutSize:](BEWebViewFactoryPaginationOptions, "paginationOptionsForBookInfoSnapshot:withConfiguration:contentLayoutSize:", v14, v17);
  v19 = +[BEContentCleanupJSOptions cleanupJSOptionsForBookInfoSnapshot:v14 withConfiguration:v17];
  v20 = +[BECFIUtilitiesJSOptions cfiUtilitiesJSOptionsForBookInfoSnapshot:v14 ordinal:a5];
  [v17 fontSize];
  double v22 = v21;

  v23 = [(BKWK2LoaderContentInfoRequest *)self initWithPaginationOptions:v18 cleanupOptions:v19 cfiOptions:v20 ordinal:a5 stylesheetSet:v16 fontSize:v15 completion:v22];
  if (v23)
  {
    objc_storeStrong((id *)&v23->_location, a3);
    objc_storeStrong((id *)&v23->_bookSnapshot, obj);
  }

  return v23;
}

+ (BKWK2LoaderContentInfoRequest)contentInfoRequestWithPaginationOptions:(id)a3 cleanupOptions:(id)a4 cfiOptions:(id)a5 ordinal:(unint64_t)a6 stylesheetSet:(id)a7 completion:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = [BKWK2LoaderContentInfoRequest alloc];
  [v17 fontSize];
  v19 = -[BKWK2LoaderContentInfoRequest initWithPaginationOptions:cleanupOptions:cfiOptions:ordinal:stylesheetSet:fontSize:completion:](v18, "initWithPaginationOptions:cleanupOptions:cfiOptions:ordinal:stylesheetSet:fontSize:completion:", v17, v16, v15, a6, v14, v13);

  return v19;
}

- (BKWK2LoaderContentInfoRequest)initWithPaginationOptions:(id)a3 cleanupOptions:(id)a4 cfiOptions:(id)a5 ordinal:(unint64_t)a6 stylesheetSet:(id)a7 fontSize:(double)a8 completion:(id)a9
{
  id v26 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a9;
  v27.receiver = self;
  v27.super_class = (Class)BKWK2LoaderContentInfoRequest;
  v20 = [(BKWK2LoaderContentInfoRequest *)&v27 init];
  double v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_paginationOptions, a3);
    objc_storeStrong((id *)&v21->_cleanupOptions, a4);
    objc_storeStrong((id *)&v21->_cfiOptions, a5);
    objc_storeStrong((id *)&v21->_stylesheetSet, a7);
    v21->_ordinal = a6;
    v21->_fontSize = a8;
    v21->_state = 0;
    v21->_restoreFrame = 1;
    id v22 = [v19 copy];
    id completion = v21->_completion;
    v21->_id completion = v22;
  }
  return v21;
}

- (NSString)requestID
{
  requestID = self->_requestID;
  if (!requestID)
  {
    v4 = [(BKWK2LoaderContentInfoRequest *)self bookSnapshot];
    v5 = [(BKWK2LoaderContentInfoRequest *)self bookSnapshot];
    v6 = [v5 assetID];
    [(BKWK2LoaderContentInfoRequest *)self fontSize];
    v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v8 = [(BKWK2LoaderContentInfoRequest *)self stylesheetSet];
    v9 = [v8 unifedAllFrameStylesheet];
    v10 = +[NSString stringWithFormat:@"%@-%@-%@-%@", v4, v6, v7, v9];

    v11 = [v10 dataUsingEncoding:4];
    [v11 bu_sha256];
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v13 = self->_requestID;
    self->_requestID = v12;

    requestID = self->_requestID;
  }

  return requestID;
}

- (BOOL)isRequestValid
{
  return (char *)[(BKWK2LoaderContentInfoRequest *)self state] != (char *)&dword_4 + 3;
}

- (void)invalidateRequest
{
}

- (void)setState:(unint64_t)a3
{
  v5 = _AERePaginationLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t state = self->_state;
    if (state > 7) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = (uint64_t)*(&off_1DD268 + state);
    }
    if (a3 > 7) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = (uint64_t)*(&off_1DD268 + a3);
    }
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Request transition from '%@' to '%@'", (uint8_t *)&v9, 0x16u);
  }

  self->_unint64_t state = a3;
}

- (id)description
{
  v19.receiver = self;
  v19.super_class = (Class)BKWK2LoaderContentInfoRequest;
  id v16 = [(BKWK2LoaderContentInfoRequest *)&v19 description];
  id v18 = NSStringFromSelector("requestID");
  id v17 = [(BKWK2LoaderContentInfoRequest *)self requestID];
  v3 = NSStringFromSelector("location");
  v4 = [(BKWK2LoaderContentInfoRequest *)self location];
  v5 = NSStringFromSelector("fontSize");
  [(BKWK2LoaderContentInfoRequest *)self fontSize];
  id v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v6 = NSStringFromSelector("bookSnapshot");
  uint64_t v7 = [(BKWK2LoaderContentInfoRequest *)self bookSnapshot];
  uint64_t v8 = NSStringFromSelector("stylesheetSet");
  int v9 = [(BKWK2LoaderContentInfoRequest *)self stylesheetSet];
  uint64_t v10 = NSStringFromSelector("state");
  unint64_t v11 = [(BKWK2LoaderContentInfoRequest *)self state];
  if (v11 > 7) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = (uint64_t)*(&off_1DD268 + v11);
  }
  id v15 = +[NSString stringWithFormat:@"%@: %@, %@ %@: %@, %@: %@, %@: %@, %@: %@, %@: %@", v16, v18, v17, v3, v4, v5, v14, v6, v7, v8, v9, v10, v12];

  return v15;
}

- (void)setRequestID:(id)a3
{
}

- (BKLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (AEBookInfoSnapshot)bookSnapshot
{
  return self->_bookSnapshot;
}

- (void)setBookSnapshot:(id)a3
{
}

- (unint64_t)ordinal
{
  return self->_ordinal;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (BEWebViewFactoryPaginationOptions)paginationOptions
{
  return self->_paginationOptions;
}

- (void)setPaginationOptions:(id)a3
{
}

- (BEWebViewFactoryStylesheetSet)stylesheetSet
{
  return self->_stylesheetSet;
}

- (void)setStylesheetSet:(id)a3
{
}

- (BEContentCleanupJSOptions)cleanupOptions
{
  return self->_cleanupOptions;
}

- (BECFIUtilitiesJSOptions)cfiOptions
{
  return self->_cfiOptions;
}

- (unint64_t)state
{
  return self->_state;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (BOOL)restoreFrame
{
  return self->_restoreFrame;
}

- (void)setRestoreFrame:(BOOL)a3
{
  self->_restoreFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_cfiOptions, 0);
  objc_storeStrong((id *)&self->_cleanupOptions, 0);
  objc_storeStrong((id *)&self->_stylesheetSet, 0);
  objc_storeStrong((id *)&self->_paginationOptions, 0);
  objc_storeStrong((id *)&self->_bookSnapshot, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_requestID, 0);
}

@end