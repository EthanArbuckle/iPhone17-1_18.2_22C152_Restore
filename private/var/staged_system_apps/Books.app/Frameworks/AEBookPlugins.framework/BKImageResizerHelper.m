@interface BKImageResizerHelper
- (BKImageResizerHelper)init;
- (NSOperationQueue)operationQueue;
- (id)resizeImage:(id)a3 toSize:(CGSize)a4 callback:(id)a5;
- (void)setOperationQueue:(id)a3;
@end

@implementation BKImageResizerHelper

- (BKImageResizerHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKImageResizerHelper;
  v2 = [(BKImageResizerHelper *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSOperationQueue);
    [(BKImageResizerHelper *)v2 setOperationQueue:v3];

    v4 = [(BKImageResizerHelper *)v2 operationQueue];
    [v4 setMaxConcurrentOperationCount:5];
  }
  return v2;
}

- (id)resizeImage:(id)a3 toSize:(CGSize)a4 callback:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v9 = a3;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)NSBlockOperation);
  objc_initWeak(&location, v11);
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_87D48;
  v19 = &unk_1DCA98;
  objc_copyWeak(v22, &location);
  id v12 = v9;
  id v20 = v12;
  v22[1] = *(id *)&width;
  v22[2] = *(id *)&height;
  id v13 = v10;
  id v21 = v13;
  [v11 addExecutionBlock:&v16];
  v14 = [(BKImageResizerHelper *)self operationQueue];
  [v14 addOperation:v11];

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

  return v11;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end