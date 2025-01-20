@interface UIPDFPageRenderJob
- (BOOL)hasPage;
- (BOOL)releaseWhenDone;
- (CGSize)size;
- (UIImage)image;
- (UIPDFPageRenderJob)initWithPage:(id)a3 maxSize:(CGSize)a4 queuePriority:(int64_t)a5;
- (UIPDFPageRenderOperation)operation;
- (int64_t)priority;
- (unint64_t)pageIndex;
- (void)cancel;
- (void)cancelOperation;
- (void)cancelOperationForTarget:(id)a3;
- (void)dealloc;
- (void)releaseOperation;
- (void)renderImage;
- (void)sendImage;
- (void)sendImageTo:(id)a3 callback:(SEL)a4 userData:(id)a5;
- (void)setOperation:(id)a3;
- (void)setReleaseWhenDone:(BOOL)a3;
- (void)setTarget:(id)a3 callback:(SEL)a4 userData:(id)a5;
@end

@implementation UIPDFPageRenderJob

- (BOOL)hasPage
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_page != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (UIPDFPageRenderJob)initWithPage:(id)a3 maxSize:(CGSize)a4 queuePriority:(int64_t)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v16.receiver = self;
  v16.super_class = (Class)UIPDFPageRenderJob;
  v9 = [(UIPDFPageRenderJob *)&v16 init];
  v10 = v9;
  if (v9)
  {
    v9->_target = 0;
    v11 = (UIPDFPage *)a3;
    v10->_page = v11;
    uint64_t v12 = [(UIPDFPage *)v11 pageNumber];
    uint64_t v13 = v12 - 1;
    if (!v12) {
      uint64_t v13 = 0;
    }
    v10->_pageIndex = v13;
    v10->_size.CGFloat width = width;
    v10->_size.CGFloat height = height;
    v10->_priority = a5;
    v14 = [[UIPDFPageRenderOperation alloc] initWithJob:v10];
    v10->_operation = v14;
    [(UIPDFPageRenderOperation *)v14 setQueuePriority:a5];
    v10->_lock._os_unfair_lock_opaque = 0;
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UIPDFPageRenderJob;
  [(UIPDFPageRenderJob *)&v3 dealloc];
}

- (void)cancel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v3 = self;
  if (self->_sendPending && self->_target && self->_callback)
  {
    BOOL releaseWhenDone = self->_releaseWhenDone;
    v5 = self->_image;
    id v6 = self->_target;
    if (self->_callback) {
      SEL callback = self->_callback;
    }
    else {
      SEL callback = 0;
    }
    id v16 = self->_userData;
    objc_super v3 = self;
    id v9 = v16;
    int v8 = 1;
  }
  else
  {
    int v8 = 0;
    v5 = 0;
    id v6 = 0;
    SEL callback = 0;
    id v9 = 0;
    BOOL releaseWhenDone = self->_sendPending && self->_releaseWhenDone;
  }
  operation = v3->_operation;
  if (operation)
  {
    [(UIPDFPageRenderOperation *)operation cancel];
    objc_super v3 = self;
    self->_operation = 0;
  }
  image = v3->_image;
  if (image)
  {

    objc_super v3 = self;
  }
  id userData = v3->_userData;
  if (userData)
  {

    objc_super v3 = self;
  }
  p_id target = &v3->_target;
  id target = v3->_target;
  if (target)
  {

    objc_super v3 = self;
  }
  v3->_image = 0;
  p_target[1] = 0;
  p_target[2] = 0;
  *p_id target = 0;
  *((unsigned char *)p_target + 24) = 0;

  self->_page = 0;
  os_unfair_lock_unlock(p_lock);
  if (v8)
  {
    [v6 performSelector:callback withObject:v5 withObject:v9];
  }
  if (releaseWhenDone)
  {
  }
}

- (void)cancelOperation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v3 = self;
  if (self->_sendPending && self->_target && self->_callback)
  {
    BOOL releaseWhenDone = self->_releaseWhenDone;
    v5 = self->_image;
    id v6 = self->_target;
    if (self->_callback) {
      SEL callback = self->_callback;
    }
    else {
      SEL callback = 0;
    }
    id v15 = self->_userData;
    objc_super v3 = self;
    id v9 = v15;
    int v8 = 1;
  }
  else
  {
    int v8 = 0;
    v5 = 0;
    id v6 = 0;
    SEL callback = 0;
    id v9 = 0;
    BOOL releaseWhenDone = self->_sendPending && self->_releaseWhenDone;
  }
  operation = v3->_operation;
  if (operation)
  {
    [(UIPDFPageRenderOperation *)operation cancel];
    objc_super v3 = self;
    self->_operation = 0;
  }
  id userData = v3->_userData;
  if (userData)
  {

    objc_super v3 = self;
  }
  p_id target = &v3->_target;
  id target = v3->_target;
  if (target)
  {

    objc_super v3 = self;
  }
  *p_id target = 0;
  p_target[1] = 0;
  *((unsigned char *)p_target + 24) = 0;
  p_target[2] = 0;

  self->_page = 0;
  os_unfair_lock_unlock(p_lock);
  if (v8)
  {
    [v6 performSelector:callback withObject:v5 withObject:v9];
  }
  if (releaseWhenDone)
  {
  }
}

- (void)cancelOperationForTarget:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = self;
  p_id target = &self->_target;
  if (self->_target == a3)
  {
    if (a3 && self->_sendPending && self->_callback)
    {
      BOOL releaseWhenDone = self->_releaseWhenDone;
      int v8 = self->_image;
      id v9 = self->_target;
      if (self->_callback) {
        SEL callback = self->_callback;
      }
      else {
        SEL callback = 0;
      }
      id v14 = self->_userData;
      v5 = self;
      id v12 = v14;
      int v11 = 1;
    }
    else
    {
      int v11 = 0;
      int v8 = 0;
      id v9 = 0;
      SEL callback = 0;
      id v12 = 0;
      BOOL releaseWhenDone = self->_sendPending && self->_releaseWhenDone;
    }
    operation = v5->_operation;
    if (operation)
    {
      [(UIPDFPageRenderOperation *)operation cancel];
      v5 = self;
      self->_operation = 0;
    }
    id userData = v5->_userData;
    if (userData)
    {

      v5 = self;
    }
    if (*p_target)
    {

      v5 = self;
    }
    *p_id target = 0;
    self->_SEL callback = 0;
    self->_sendPending = 0;
    self->_id userData = 0;

    self->_page = 0;
    os_unfair_lock_unlock(p_lock);
    if (v11)
    {
      [v9 performSelector:callback withObject:v8 withObject:v12];

      if (!releaseWhenDone) {
        return;
      }
    }
    else if (!releaseWhenDone)
    {
      return;
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)setTarget:(id)a3 callback:(SEL)a4 userData:(id)a5
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_sendPending && self->_target && self->_callback)
  {
    v17 = self->_image;
    id v10 = self->_target;
    if (self->_callback) {
      SEL callback = self->_callback;
    }
    else {
      SEL callback = 0;
    }
    id v13 = self->_userData;
    int v12 = 1;
  }
  else
  {
    int v12 = 0;
    v17 = 0;
    id v10 = 0;
    SEL callback = 0;
    id v13 = 0;
  }
  id userData = self->_userData;
  if (userData) {

  }
  id target = self->_target;
  if (target) {

  }
  self->_id target = a3;
  if (a4) {
    id v16 = a4;
  }
  else {
    id v16 = 0;
  }
  self->_SEL callback = v16;
  self->_id userData = a5;
  self->_sendPending = 1;
  os_unfair_lock_unlock(p_lock);
  if (v12)
  {
    [v10 performSelector:callback withObject:v17 withObject:v13];
  }
}

- (void)setOperation:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_operation != a3)
  {
    id v6 = a3;

    self->_operation = (UIPDFPageRenderOperation *)a3;
  }
  os_unfair_lock_unlock(p_lock);
}

- (UIPDFPageRenderOperation)operation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  operation = self->_operation;
  os_unfair_lock_unlock(p_lock);
  return operation;
}

- (void)releaseOperation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);

  self->_operation = 0;
  os_unfair_lock_unlock(p_lock);
}

- (UIImage)image
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  image = self->_image;
  os_unfair_lock_unlock(p_lock);
  return image;
}

- (void)renderImage
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (self->_page)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    page = self->_page;
    if (page)
    {
      double v5 = trunc(self->_size.width);
      double v6 = trunc(self->_size.height);
      double v7 = 1.0;
      if (v5 >= 1.0) {
        double v8 = v5;
      }
      else {
        double v8 = 1.0;
      }
      if (v6 >= 1.0) {
        double v9 = v6;
      }
      else {
        double v9 = 1.0;
      }
      [(UIPDFPage *)page cropBoxAccountForRotation];
      if (v10 <= 0.0) {
        double v12 = 1.0;
      }
      else {
        double v12 = v8 / v10;
      }
      if (v11 > 0.0) {
        double v7 = v9 / v11;
      }
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      id v14 = CGBitmapContextCreate(0, (unint64_t)v8, (unint64_t)v9, 8uLL, 0, DeviceRGB, 0x4001u);
      CGContextSetFillColorWithColor(v14, [+[UIColor whiteColor] CGColor]);
      v38.origin.x = 0.0;
      v38.origin.y = 0.0;
      v38.size.CGFloat width = v8;
      v38.size.CGFloat height = v9;
      CGContextFillRect(v14, v38);
      CGContextScaleCTM(v14, v12, v7);
      unint64_t v15 = [(UIPDFPage *)self->_page rotation];
      if (v15)
      {
        memset(&v34, 0, sizeof(v34));
        CGAffineTransformMakeRotation(&v34, (double)v15 * -0.0174532925);
        [(UIPDFPage *)self->_page cropBox];
        CGAffineTransform transform = v34;
        CGRect v40 = CGRectApplyAffineTransform(v39, &transform);
        CGContextTranslateCTM(v14, -v40.origin.x, -v40.origin.y);
        CGAffineTransform transform = v34;
        CGContextConcatCTM(v14, &transform);
      }
      else
      {
        [(UIPDFPage *)self->_page cropBox];
        CGContextTranslateCTM(v14, -v16, -v17);
      }
      v18 = CGPDFPageRetain([(UIPDFPage *)self->_page CGPage]);
      v19 = self;
      os_unfair_lock_unlock(p_lock);
      CGContextDrawPDFPageWithProgressCallback();
      CGPDFPageRelease(v18);
      if (self->_userData)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([self->_userData objectForKey:kUIPDFPageRenderAnnotationToImage])
          {
            id v20 = [(UIPDFPage *)self->_page annotations];
            long long v29 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v35 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v30;
              do
              {
                for (uint64_t i = 0; i != v22; ++i)
                {
                  if (*(void *)v30 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  v25 = *(void **)(*((void *)&v29 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    [v25 drawInContext:v14];
                  }
                }
                uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v35 count:16];
              }
              while (v22);
            }
          }
        }
      }
      os_unfair_lock_lock(p_lock);
      if (self->_page) {
        Image = CGBitmapContextCreateImage(v14);
      }
      else {
        Image = 0;
      }
      CGContextRelease(v14);
      CGColorSpaceRelease(DeviceRGB);
      if (Image) {
        v27 = [[UIImage alloc] initWithCGImage:Image];
      }
      else {
        v27 = 0;
      }
      v28 = self->_image;
      if (v28) {

      }
      self->_image = v27;
      self->_page = 0;

      os_unfair_lock_unlock(p_lock);
      CGImageRelease(Image);
    }
    else
    {
      os_unfair_lock_unlock(p_lock);
    }
  }
}

- (void)sendImage
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v3 = self;
  if (self->_sendPending && self->_target && self->_callback)
  {
    BOOL releaseWhenDone = self->_releaseWhenDone;
    double v5 = self->_image;
    id v6 = self->_target;
    if (self->_callback) {
      SEL callback = self->_callback;
    }
    else {
      SEL callback = 0;
    }
    id v9 = self->_userData;
    objc_super v3 = self;
    int v8 = 1;
  }
  else
  {
    int v8 = 0;
    double v5 = 0;
    id v6 = 0;
    SEL callback = 0;
    id v9 = 0;
    BOOL releaseWhenDone = self->_sendPending && self->_releaseWhenDone;
  }
  id userData = v3->_userData;
  if (userData)
  {

    objc_super v3 = self;
  }
  p_id target = &v3->_target;
  id target = v3->_target;
  if (target) {

  }
  *p_id target = 0;
  p_target[1] = 0;
  *((unsigned char *)p_target + 24) = 0;
  p_target[2] = 0;
  os_unfair_lock_unlock(p_lock);
  if (v8)
  {
    [v6 performSelector:callback withObject:v5 withObject:v9];
  }
  if (releaseWhenDone)
  {
  }
}

- (void)sendImageTo:(id)a3 callback:(SEL)a4 userData:(id)a5
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  image = self->_image;
  if (image)
  {
    uint64_t v21 = self->_image;
    double v11 = image;
    os_unfair_lock_unlock(p_lock);
    [a3 performSelector:a4 withObject:v21 withObject:a5];
  }
  else
  {
    if (self->_sendPending && (target = self->_target) != 0 && (p_SEL callback = &self->_callback, self->_callback))
    {
      uint64_t v21 = (UIImage *)target;
      if (*p_callback) {
        SEL v14 = *p_callback;
      }
      else {
        SEL v14 = 0;
      }
      id v16 = self->_userData;
      int v15 = 1;
    }
    else
    {
      int v15 = 0;
      uint64_t v21 = 0;
      SEL v14 = 0;
      id v16 = 0;
    }
    id userData = self->_userData;
    if (userData) {

    }
    id v18 = self->_target;
    if (v18) {

    }
    self->_id target = a3;
    if (a4) {
      v19 = a4;
    }
    else {
      v19 = 0;
    }
    self->_SEL callback = v19;
    self->_id userData = a5;
    self->_sendPending = 1;
    operation = self->_operation;
    if (operation && ![(UIPDFPageRenderOperation *)operation isExecuting])
    {
      [(UIPDFPageRenderOperation *)self->_operation setQueuePriority:4];
      os_unfair_lock_unlock(p_lock);
      if ((v15 & 1) == 0) {
        return;
      }
    }
    else
    {
      os_unfair_lock_unlock(p_lock);
      if (!v15) {
        return;
      }
    }
    [(UIImage *)v21 performSelector:v14 withObject:0 withObject:v16];
  }
}

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

- (int64_t)priority
{
  return self->_priority;
}

- (BOOL)releaseWhenDone
{
  return self->_releaseWhenDone;
}

- (void)setReleaseWhenDone:(BOOL)a3
{
  self->_BOOL releaseWhenDone = a3;
}

- (CGSize)size
{
  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

@end