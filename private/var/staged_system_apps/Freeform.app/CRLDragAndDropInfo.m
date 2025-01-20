@interface CRLDragAndDropInfo
- (BOOL)canCreateItemsOfClass:(Class)a3;
- (BOOL)shouldHidePromisedFileTypes;
- (CGPoint)targetPreviewCenter;
- (CRLDragAndDropInfo)initWithPlatformDraggingInfo:(id)a3;
- (CRLIngestibleItemSource)itemSource;
- (NSArray)inProcessDraggingSources;
- (NSArray)promisedUTIs;
- (UIDropSession)platformDraggingInfo;
- (id)createItemsOfClass:(Class)a3 completion:(id)a4;
- (unint64_t)dragOperationMask;
- (unint64_t)numberOfDraggingItems;
- (void)setShouldHidePromisedFileTypes:(BOOL)a3;
- (void)setTargetPreviewCenter:(CGPoint)a3;
@end

@implementation CRLDragAndDropInfo

- (CRLDragAndDropInfo)initWithPlatformDraggingInfo:(id)a3
{
  id v4 = a3;
  if ([(CRLDragAndDropInfo *)self isMemberOfClass:objc_opt_class()])
  {
    v5 = (CRLDragAndDropInfo *)objc_alloc((Class)objc_opt_class());

    self = v5;
  }
  v27.receiver = self;
  v27.super_class = (Class)CRLDragAndDropInfo;
  v6 = [(CRLDragAndDropInfo *)&v27 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_platformDraggingInfo, v4);
    v8 = +[NSMutableArray array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v9 = [v4 items];
    id v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v23 + 1) + 8 * i) itemProvider];
          [v8 addObject:v14];
        }
        id v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v11);
    }

    v15 = [[CRLiOSItemProviderItemSource alloc] initWithItemProviders:v8];
    itemSource = v7->_itemSource;
    v7->_itemSource = (CRLIngestibleItemSource *)v15;

    if (!v7->_itemSource)
    {
      int v17 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CC998);
      }
      v18 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106810C(v17, v18);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CC9B8);
      }
      v19 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101066770(v19, v17);
      }
      v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropInfo initWithPlatformDraggingInfo:]");
      v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropInfo.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 63, 0, "invalid nil value for '%{public}s'", "_itemSource");
    }
    v7->_targetPreviewCenter = (CGPoint)xmmword_101175160;
  }
  return v7;
}

- (NSArray)inProcessDraggingSources
{
  return (NSArray *)&__NSArray0__struct;
}

- (unint64_t)dragOperationMask
{
  return 0;
}

- (NSArray)promisedUTIs
{
  return (NSArray *)&__NSArray0__struct;
}

- (unint64_t)numberOfDraggingItems
{
  return 0;
}

- (BOOL)canCreateItemsOfClass:(Class)a3
{
  return 0;
}

- (id)createItemsOfClass:(Class)a3 completion:(id)a4
{
  return 0;
}

- (UIDropSession)platformDraggingInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformDraggingInfo);

  return (UIDropSession *)WeakRetained;
}

- (BOOL)shouldHidePromisedFileTypes
{
  return self->_shouldHidePromisedFileTypes;
}

- (void)setShouldHidePromisedFileTypes:(BOOL)a3
{
  self->_shouldHidePromisedFileTypes = a3;
}

- (CRLIngestibleItemSource)itemSource
{
  return self->_itemSource;
}

- (CGPoint)targetPreviewCenter
{
  double x = self->_targetPreviewCenter.x;
  double y = self->_targetPreviewCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTargetPreviewCenter:(CGPoint)a3
{
  self->_targetPreviewCenter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSource, 0);

  objc_destroyWeak((id *)&self->_platformDraggingInfo);
}

@end