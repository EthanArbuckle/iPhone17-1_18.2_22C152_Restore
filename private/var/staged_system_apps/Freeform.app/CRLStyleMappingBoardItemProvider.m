@interface CRLStyleMappingBoardItemProvider
- (CRLIngestibleItemImportableBoardItemProviderDelegate)delegate;
- (CRLProgress)progress;
- (CRLStyleMappingBoardItemProvider)init;
- (CRLStyleMappingBoardItemProvider)initWithIngestibleBoardItem:(id)a3;
- (NSDictionary)pasteboardDescription;
- (NSError)error;
- (_TtC8Freeform12CRLBoardItem)boardItem;
- (id)imageData;
- (id)newBoardItemWithFactory:(id)a3 bakedSize:(BOOL)a4;
- (id)thumbnailImageData;
- (unint64_t)embeddedDataLength;
- (unint64_t)uploadDataLength;
- (void)provideBoardItemWithFactory:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation CRLStyleMappingBoardItemProvider

- (CRLStyleMappingBoardItemProvider)initWithIngestibleBoardItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLStyleMappingBoardItemProvider;
  v6 = [(CRLStyleMappingBoardItemProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_ingestibleItemDrawable, a3);
  }

  return v7;
}

- (CRLStyleMappingBoardItemProvider)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D7028);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLStyleMappingBoardItemProvider init]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLStyleMappingBoardItemProvider.m";
    __int16 v17 = 1024;
    int v18 = 27;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D7048);
  }
  v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v5 = v4;
    v6 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v12 = v2;
    __int16 v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStyleMappingBoardItemProvider init]");
  v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLStyleMappingBoardItemProvider.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:27 isFatal:0 description:"Do not call method"];

  objc_super v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLStyleMappingBoardItemProvider init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)newBoardItemWithFactory:(id)a3 bakedSize:(BOOL)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)pasteboardDescription
{
  return [(CRLIngestibleBoardItemAndDescription *)self->_ingestibleItemDrawable ingestibleDescription];
}

- (id)imageData
{
  unsigned int v2 = [(CRLIngestibleBoardItemAndDescription *)self->_ingestibleItemDrawable boardItem];
  objc_super v9 = sub_100246AC8(v2, 1, v3, v4, v5, v6, v7, v8, (uint64_t)&OBJC_PROTOCOL___CRLPasteboardImageDataProvider);

  id v10 = [v9 imageData];

  return v10;
}

- (id)thumbnailImageData
{
  unsigned int v2 = [(CRLIngestibleBoardItemAndDescription *)self->_ingestibleItemDrawable boardItem];
  objc_super v9 = sub_100246AC8(v2, 1, v3, v4, v5, v6, v7, v8, (uint64_t)&OBJC_PROTOCOL___CRLPasteboardImageDataProvider);

  id v10 = [v9 thumbnailImageData];

  return v10;
}

- (void)provideBoardItemWithFactory:(id)a3 completionHandler:(id)a4
{
  id v9 = a4;
  uint64_t v6 = [(CRLStyleMappingBoardItemProvider *)self newBoardItemWithFactory:a3 bakedSize:0];
  boardItem = self->_boardItem;
  self->_boardItem = v6;

  uint64_t v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    uint64_t v8 = v9;
  }
}

- (_TtC8Freeform12CRLBoardItem)boardItem
{
  return self->_boardItem;
}

- (NSError)error
{
  return self->error;
}

- (CRLProgress)progress
{
  return self->progress;
}

- (unint64_t)uploadDataLength
{
  return self->uploadDataLength;
}

- (unint64_t)embeddedDataLength
{
  return self->embeddedDataLength;
}

- (CRLIngestibleItemImportableBoardItemProviderDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  self->delegate = (CRLIngestibleItemImportableBoardItemProviderDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->progress, 0);
  objc_storeStrong((id *)&self->error, 0);
  objc_storeStrong((id *)&self->_boardItem, 0);

  objc_storeStrong((id *)&self->_ingestibleItemDrawable, 0);
}

@end