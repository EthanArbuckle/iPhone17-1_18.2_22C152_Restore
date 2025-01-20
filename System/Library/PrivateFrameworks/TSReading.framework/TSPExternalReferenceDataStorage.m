@interface TSPExternalReferenceDataStorage
- (BOOL)isReadable;
- (TSPExternalReferenceDataStorage)initWithBookmarkData:(id)a3 context:(id)a4;
- (TSPExternalReferenceDataStorage)initWithURL:(id)a3;
- (id)bookmarkDataForArchiver:(id)a3;
- (void)performReadWithAccessor:(id)a3;
@end

@implementation TSPExternalReferenceDataStorage

- (TSPExternalReferenceDataStorage)initWithURL:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TSPExternalReferenceDataStorage;
  v6 = [(TSPExternalReferenceDataStorage *)&v13 init];
  if (v6)
  {
    if ([v5 isFileReferenceURL])
    {
      objc_storeStrong((id *)&v6->_URL, a3);
    }
    else if ([v5 isFileURL])
    {
      uint64_t v7 = [v5 fileReferenceURL];
      URL = v6->_URL;
      v6->_URL = (NSURL *)v7;
    }
    else
    {
      v9 = [MEMORY[0x263F7C7F0] currentHandler];
      v10 = [NSString stringWithUTF8String:"-[TSPExternalReferenceDataStorage initWithURL:]"];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPExternalReferenceDataStorage.mm"];
      [v9 handleFailureInFunction:v10 file:v11 lineNumber:51 description:@"Bad URL type"];

      v6 = 0;
    }
  }

  return v6;
}

- (TSPExternalReferenceDataStorage)initWithBookmarkData:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TSPExternalReferenceDataStorage;
  v9 = [(TSPExternalReferenceDataStorage *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bookmarkData, a3);
    objc_storeWeak((id *)&v10->_context, v8);
    v11 = v10;
  }

  return v10;
}

- (id)bookmarkDataForArchiver:(id)a3
{
  return self->_bookmarkData;
}

- (void)performReadWithAccessor:(id)a3
{
}

- (BOOL)isReadable
{
  return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_bookmarkData, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

@end