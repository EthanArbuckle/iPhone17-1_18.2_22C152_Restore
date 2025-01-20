@interface THPageViewProvider
- (BOOL)p_recursivelyFindPageInfos:(id)a3 callingBlock:(id)a4;
- (BOOL)previewEnabled;
- (CGRect)p_unclippedVisibleBounds;
- (CGSize)pageSize;
- (THPageViewProvider)initWithInteractiveCanvasController:(id)a3 pageSize:(CGSize)a4;
- (THPageViewProviderDelegate)delegate;
- (id)layerAndSubviewHostForPageInfo:(id)a3;
- (id)p_pageInfoForAbsolutePageIndex:(unint64_t)a3;
- (id)pageHostForAbsolutePageIndex:(unint64_t)a3;
- (int64_t)p_relativePageIndexForPageInfo:(id)a3;
- (void)canvasDidLayout;
- (void)canvasDidLayoutAndRenderOnBackgroundThread;
- (void)canvasDidStopScrolling;
- (void)dealloc;
- (void)enumeratePageHostsUsingBlock:(id)a3;
- (void)p_recyclePageHosts;
- (void)p_updatePageViewsWithInfos:(id)a3;
- (void)p_updatePageViewsWithInfos:(id)a3 removeUnused:(BOOL)a4;
- (void)p_updateRenderedPageHosts;
- (void)pageLayerAndSubviewHostRecycle:(id)a3;
- (void)popDisabled;
- (void)pushDisabled;
- (void)setDelegate:(id)a3;
- (void)setPageSize:(CGSize)a3;
- (void)setPreviewEnabled:(BOOL)a3;
- (void)syncPerformBlock:(id)a3;
- (void)teardown;
@end

@implementation THPageViewProvider

- (THPageViewProvider)initWithInteractiveCanvasController:(id)a3 pageSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v10.receiver = self;
  v10.super_class = (Class)THPageViewProvider;
  v7 = [(THPageViewProvider *)&v10 init];
  if (v7)
  {
    v7->_icc = (TSDInteractiveCanvasController *)a3;
    v7->_pageSize.CGFloat width = width;
    v7->_pageSize.CGFloat height = height;
    v7->_pageHostMutex = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iBooks.THPageViewProvider.mutex", 0);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7->_previewLoadQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iBooks.THPageViewProvider.previewLoadQueue", v8);
    v7->_previewEnabled = 1;
    [(THPageViewProvider *)v7 p_updatePageViewsWithInfos:[(TSDInteractiveCanvasController *)v7->_icc infosToDisplay]];
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THPageViewProvider;
  [(THPageViewProvider *)&v3 dealloc];
}

- (void)teardown
{
  [(THPageViewProvider *)self p_updatePageViewsWithInfos:0 removeUnused:1];
  if ([(TSURetainedPointerKeyDictionary *)self->_pageInfoToPageHost count]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageViewProvider teardown]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageViewProvider.m") lineNumber:61 description:@"there should be no pageHosts left:\n%@", self->_pageInfoToPageHost];
  }

  self->_pageInfoToPageHost = 0;
  self->_pageHostForRecycling = 0;
  pageHostMutex = self->_pageHostMutex;
  if (pageHostMutex)
  {
    dispatch_barrier_sync(pageHostMutex, &stru_4580C8);
    dispatch_release((dispatch_object_t)self->_pageHostMutex);
    self->_pageHostMutex = 0;
  }
  previewLoadQueue = self->_previewLoadQueue;
  if (previewLoadQueue)
  {
    dispatch_barrier_sync(previewLoadQueue, &stru_4580E8);
    dispatch_release((dispatch_object_t)self->_previewLoadQueue);
    self->_previewLoadQueue = 0;
  }
  self->_delegate = 0;
}

- (BOOL)p_recursivelyFindPageInfos:(id)a3 callingBlock:(id)a4
{
  char v19 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v7 = (char *)[a3 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (!v7) {
    return (char)v7;
  }
  v8 = v7;
  uint64_t v9 = *(void *)v16;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(a3);
      }
      objc_opt_class();
      uint64_t v11 = TSUDynamicCast();
      if (v11)
      {
        (*((void (**)(id, uint64_t, char *))a4 + 2))(a4, v11, &v19);
LABEL_8:
        if (v19) {
          goto LABEL_15;
        }
        continue;
      }
      v12 = (void *)TSUProtocolCast();
      if (!v12) {
        goto LABEL_8;
      }
      unsigned int v13 = -[THPageViewProvider p_recursivelyFindPageInfos:callingBlock:](self, "p_recursivelyFindPageInfos:callingBlock:", [v12 childInfos], a4);
      char v19 = v13;
      if (v13)
      {
LABEL_15:
        LOBYTE(v7) = 1;
        return (char)v7;
      }
    }
    v8 = (char *)[a3 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8) {
      continue;
    }
    break;
  }
  LOBYTE(v7) = v19 != 0;
  return (char)v7;
}

- (void)p_updatePageViewsWithInfos:(id)a3
{
  uint64_t v5 = [(TSDInteractiveCanvasController *)self->_icc currentlyWaitingOnThreadedLayoutAndRender] ^ 1;

  [(THPageViewProvider *)self p_updatePageViewsWithInfos:a3 removeUnused:v5];
}

- (int64_t)p_relativePageIndexForPageInfo:(id)a3
{
  if (objc_opt_respondsToSelector()) {
    uint64_t v5 = [(THPageViewProviderDelegate *)self->_delegate pageViewProvider:self absolutePageIndexForPageInfo:a3];
  }
  else {
    uint64_t v5 = [a3 absolutePageIndex];
  }
  return v5
       - (unsigned char *)[(THPageViewProviderDelegate *)self->_delegate pageViewProviderStartAbsolutePageIndex:self];
}

- (void)p_updatePageViewsWithInfos:(id)a3 removeUnused:(BOOL)a4
{
  id v7 = objc_alloc_init((Class)NSMutableArray);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_743D0;
  v22[3] = &unk_458110;
  v22[4] = v7;
  [(THPageViewProvider *)self p_recursivelyFindPageInfos:a3 callingBlock:v22];
  id v8 = objc_alloc_init((Class)NSMutableArray);
  CGSize pageSize = self->_pageSize;
  [(TSDInteractiveCanvasController *)self->_icc viewScale];
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3052000000;
  long long v18 = sub_743DC;
  char v19 = sub_743EC;
  uint64_t v20 = 0;
  pageHostMutex = self->_pageHostMutex;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_743F8;
  v11[3] = &unk_458138;
  v11[4] = v7;
  v11[5] = self;
  CGSize v12 = pageSize;
  uint64_t v13 = v10;
  v11[6] = v8;
  v11[7] = &v15;
  BOOL v14 = a4;
  dispatch_sync(pageHostMutex, v11);
  if ([v8 count])
  {
    objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](self->_icc, "layerHost"), "subviewsController"), "addSubviews:", v8);
    [(THPageViewProviderDelegate *)self->_delegate pageViewProviderViewsAdded:self pageIndexSet:v16[5]];
  }

  [(THPageViewProvider *)self p_recyclePageHosts];
  _Block_object_dispose(&v15, 8);
}

- (void)p_recyclePageHosts
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageViewProvider p_recyclePageHosts]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageViewProvider.m") lineNumber:234 description:@"This operation must only be performed on the main thread."];
  }
  if (!self->_pageHostMutex) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageViewProvider p_recyclePageHosts]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageViewProvider.m") lineNumber:236 description:@"invalid nil value for '%s'", "_pageHostMutex"];
  }
  id v3 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3052000000;
  uint64_t v17 = sub_743DC;
  long long v18 = sub_743EC;
  uint64_t v19 = 0;
  pageHostMutex = self->_pageHostMutex;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_749F4;
  block[3] = &unk_457DA0;
  block[5] = v3;
  block[6] = &v14;
  block[4] = self;
  dispatch_sync(pageHostMutex, block);
  objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](self->_icc, "layerHost"), "subviewsController"), "removeSubviews:", v3);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v5 = (void *)v15[5];
  id v6 = [v5 countByEnumeratingWithState:&v9 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) teardown];
      }
      id v6 = [v5 countByEnumeratingWithState:&v9 objects:v20 count:16];
    }
    while (v6);
  }

  _Block_object_dispose(&v14, 8);
}

- (CGRect)p_unclippedVisibleBounds
{
  delegate = self->_delegate;
  if (delegate) {
    [(THPageViewProviderDelegate *)delegate pageViewProviderUnclippedVisibleBounds:self];
  }
  else {
    [(TSDInteractiveCanvasController *)self->_icc visibleBoundsRect];
  }
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)p_updateRenderedPageHosts
{
  [(THPageViewProvider *)self p_unclippedVisibleBounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  unsigned __int8 v11 = [(TSDInteractiveCanvasController *)self->_icc currentlyScrolling];
  pageHostMutex = self->_pageHostMutex;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_74CE8;
  v13[3] = &unk_458160;
  v13[4] = self;
  v13[5] = v4;
  v13[6] = v6;
  v13[7] = v8;
  v13[8] = v10;
  unsigned __int8 v14 = v11;
  dispatch_sync(pageHostMutex, v13);
}

- (void)canvasDidStopScrolling
{
  if (([(TSDInteractiveCanvasController *)self->_icc currentlyWaitingOnThreadedLayoutAndRender] & 1) == 0&& !self->_disabledCount)
  {
    [(THPageViewProvider *)self p_recyclePageHosts];
  }

  [(THPageViewProvider *)self p_updateRenderedPageHosts];
}

- (void)canvasDidLayout
{
  if (([(TSDInteractiveCanvasController *)self->_icc currentlyWaitingOnThreadedLayoutAndRender] & 1) == 0)
  {
    [(THPageViewProvider *)self p_updateRenderedPageHosts];
    if (!self->_disabledCount)
    {
      if (+[NSThread isMainThread])
      {
        [(THPageViewProvider *)self p_recyclePageHosts];
      }
    }
  }
}

- (void)canvasDidLayoutAndRenderOnBackgroundThread
{
  if (([(TSDInteractiveCanvasController *)self->_icc currentlyWaitingOnThreadedLayoutAndRender] & 1) == 0&& !self->_disabledCount)
  {
    [(THPageViewProvider *)self p_updateRenderedPageHosts];
    [(THPageViewProvider *)self p_recyclePageHosts];
  }
}

- (void)pushDisabled
{
}

- (void)popDisabled
{
  unint64_t disabledCount = self->_disabledCount;
  if (disabledCount)
  {
    self->_unint64_t disabledCount = disabledCount - 1;
    if (([(TSDInteractiveCanvasController *)self->_icc currentlyWaitingOnThreadedLayoutAndRender] & 1) == 0&& !self->_disabledCount)
    {
      [(THPageViewProvider *)self p_updateRenderedPageHosts];
    }
  }
}

- (id)p_pageInfoForAbsolutePageIndex:(unint64_t)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  long long v12 = sub_743DC;
  uint64_t v13 = sub_743EC;
  uint64_t v14 = 0;
  id v5 = [(TSDInteractiveCanvasController *)self->_icc infosToDisplay];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_750A8;
  v8[3] = &unk_458188;
  v8[4] = &v9;
  v8[5] = a3;
  [(THPageViewProvider *)self p_recursivelyFindPageInfos:v5 callingBlock:v8];
  uint64_t v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)pageHostForAbsolutePageIndex:(unint64_t)a3
{
  id v5 = -[THPageViewProvider p_pageInfoForAbsolutePageIndex:](self, "p_pageInfoForAbsolutePageIndex:");
  if (!v5
    || (id result = [(TSURetainedPointerKeyDictionary *)self->_pageInfoToPageHost objectForKey:v5]) == 0)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageViewProvider pageHostForAbsolutePageIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageViewProvider.m") lineNumber:373 description:@"failed to find a page host for page index %lu" a3];
    return 0;
  }
  return result;
}

- (void)enumeratePageHostsUsingBlock:(id)a3
{
  if (a3)
  {
    pageInfoToPageHost = self->_pageInfoToPageHost;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_75224;
    v4[3] = &unk_4581B0;
    v4[4] = a3;
    [(TSURetainedPointerKeyDictionary *)pageInfoToPageHost enumerateKeysAndObjectsUsingBlock:v4];
  }
}

- (void)syncPerformBlock:(id)a3
{
  if (a3) {
    dispatch_sync((dispatch_queue_t)self->_pageHostMutex, a3);
  }
}

- (id)layerAndSubviewHostForPageInfo:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = sub_743DC;
  uint64_t v11 = sub_743EC;
  uint64_t v12 = 0;
  if (a3)
  {
    pageHostMutex = self->_pageHostMutex;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_7532C;
    block[3] = &unk_4581D8;
    block[5] = a3;
    block[6] = &v7;
    block[4] = self;
    dispatch_sync(pageHostMutex, block);
    uint64_t v4 = (void *)v8[5];
  }
  else
  {
    uint64_t v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)pageLayerAndSubviewHostRecycle:(id)a3
{
  pageHostMutex = self->_pageHostMutex;
  if (pageHostMutex
    || (objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageViewProvider pageLayerAndSubviewHostRecycle:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageViewProvider.m"), 434, @"invalid nil value for '%s'", "_pageHostMutex"), (pageHostMutex = self->_pageHostMutex) != 0))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_7553C;
    block[3] = &unk_456E38;
    block[4] = self;
    block[5] = a3;
    dispatch_sync(pageHostMutex, block);
  }
}

- (CGSize)pageSize
{
  double width = self->_pageSize.width;
  double height = self->_pageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPageSize:(CGSize)a3
{
  self->_CGSize pageSize = a3;
}

- (THPageViewProviderDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THPageViewProviderDelegate *)a3;
}

- (BOOL)previewEnabled
{
  return self->_previewEnabled;
}

- (void)setPreviewEnabled:(BOOL)a3
{
  self->_previewEnabled = a3;
}

@end