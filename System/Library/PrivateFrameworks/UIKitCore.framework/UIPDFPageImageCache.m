@interface UIPDFPageImageCache
- (UIPDFDocument)document;
- (UIPDFPageImageCache)initWithDocument:(id)a3;
- (UIPDFPageImageCache)initWithDocument:(id)a3 cacheCount:(unint64_t)a4 lookAhead:(unint64_t)a5 withLookAheadResolution:(double)a6;
- (double)lookAheadResolution;
- (id)getImageIfAvailableForPage:(unint64_t)a3;
- (int)getRenderQueueJobsCount;
- (unint64_t)lookAhead;
- (unint64_t)pageCount;
- (void)addRenderJob:(id)a3;
- (void)cacheImageOfPage:(unint64_t)a3 maxSize:(CGSize)a4;
- (void)cancelPendingRenderOperations;
- (void)cancelPendingRenderOperationsForTarget:(id)a3;
- (void)clearCache;
- (void)dealloc;
- (void)deliverImageOfPage:(unint64_t)a3 maxSize:(CGSize)a4 quality:(BOOL *)a5 receiver:(id)a6 selector:(SEL)a7 info:(id)a8;
- (void)didReceiveMemoryWarning:(id)a3;
@end

@implementation UIPDFPageImageCache

- (UIPDFPageImageCache)initWithDocument:(id)a3
{
  return [(UIPDFPageImageCache *)self initWithDocument:a3 cacheCount:10 lookAhead:2 withLookAheadResolution:0.5];
}

- (UIPDFPageImageCache)initWithDocument:(id)a3 cacheCount:(unint64_t)a4 lookAhead:(unint64_t)a5 withLookAheadResolution:(double)a6
{
  v16.receiver = self;
  v16.super_class = (Class)UIPDFPageImageCache;
  v10 = [(UIPDFPageImageCache *)&v16 init];
  v11 = v10;
  if (v10)
  {
    v10->_document = (UIPDFDocument *)a3;
    v10->_lookAhead = a5;
    v10->_lookAheadResolution = a6;
    v10->_jobCount = a4;
    if (a4) {
      v12 = (id *)malloc_type_calloc(a4, 8uLL, 0x80040B8603338uLL);
    }
    else {
      v12 = 0;
    }
    v11->_jobsPrioritized = v12;
    v13 = (id *)[a3 numberOfPages];
    v11->_pageCount = (unint64_t)v13;
    if (v13) {
      v13 = (id *)malloc_type_calloc((size_t)v13, 8uLL, 0x80040B8603338uLL);
    }
    v11->_jobsByPage = v13;
    v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    v11->_renderQueue = v14;
    [(NSOperationQueue *)v14 setMaxConcurrentOperationCount:1];
    v11->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v11, sel_didReceiveMemoryWarning_, @"UIApplicationDidReceiveMemoryWarningNotification", 0);
  }
  return v11;
}

- (void)clearCache
{
  unint64_t jobCount = self->_jobCount;
  renderQueue = self->_renderQueue;
  if (jobCount)
  {
    [(NSOperationQueue *)renderQueue cancelAllOperations];
    unint64_t v5 = self->_jobCount;
    if (v5)
    {
      for (unint64_t i = 0; i < v5; ++i)
      {
        jobsPrioritized = self->_jobsPrioritized;
        id v8 = jobsPrioritized[i];
        if (v8)
        {
          jobsByPage = self->_jobsByPage;
          jobsByPage[[jobsPrioritized[i] pageIndex]] = 0;
          [v8 cancel];

          self->_jobsPrioritized[i] = 0;
          unint64_t v5 = self->_jobCount;
        }
      }
    }
  }
  else
  {
    v10 = [(NSOperationQueue *)renderQueue operations];
    uint64_t v11 = [(NSArray *)v10 count];
    if (v11)
    {
      uint64_t v12 = v11;
      for (uint64_t j = 0; j != v12; ++j)
        objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](v10, "objectAtIndex:", j), "job"), "cancel");
    }
  }
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);
  [(UIPDFPageImageCache *)self clearCache];

  free(self->_jobsPrioritized);
  free(self->_jobsByPage);
  v3.receiver = self;
  v3.super_class = (Class)UIPDFPageImageCache;
  [(UIPDFPageImageCache *)&v3 dealloc];
}

- (void)addRenderJob:(id)a3
{
  if (self->_jobCount)
  {
    jobsPrioritized = self->_jobsPrioritized;
    unint64_t nextJobIndex = self->_nextJobIndex;
    id v7 = jobsPrioritized[nextJobIndex];
    if (v7)
    {
      jobsByPage = self->_jobsByPage;
      jobsByPage[[jobsPrioritized[nextJobIndex] pageIndex]] = 0;
      [v7 cancel];

      jobsPrioritized = self->_jobsPrioritized;
      unint64_t nextJobIndex = self->_nextJobIndex;
    }
    jobsPrioritized[nextJobIndex] = a3;
    v9 = self->_jobsByPage;
    v9[[a3 pageIndex]] = a3;
    id v10 = a3;
    unint64_t v11 = self->_nextJobIndex;
    if (v11 + 1 < self->_jobCount) {
      unint64_t v12 = v11 + 1;
    }
    else {
      unint64_t v12 = 0;
    }
    self->_unint64_t nextJobIndex = v12;
  }
  else
  {
    [a3 setReleaseWhenDone:1];
  }
  -[NSOperationQueue addOperation:](self->_renderQueue, "addOperation:", [a3 operation]);
  [a3 releaseOperation];
}

- (void)cacheImageOfPage:(unint64_t)a3 maxSize:(CGSize)a4
{
  if (a3)
  {
    double height = a4.height;
    double width = a4.width;
    if ([(UIPDFPageImageCache *)self pageCount] >= a3)
    {
      double lookAheadResolution = self->_lookAheadResolution;
      os_unfair_lock_lock(&self->_lock);
      unint64_t v9 = a3 - 1;
      if (!self->_jobsByPage[v9])
      {
        id v10 = [(UIPDFDocument *)[(UIPDFPageImageCache *)self document] copyPageAtIndex:v9];
        unint64_t v11 = -[UIPDFPageRenderJob initWithPage:maxSize:queuePriority:]([UIPDFPageRenderJob alloc], "initWithPage:maxSize:queuePriority:", v10, 0, width * lookAheadResolution, height * lookAheadResolution);

        [(UIPDFPageImageCache *)self addRenderJob:v11];
      }
      os_unfair_lock_unlock(&self->_lock);
    }
  }
}

- (void)deliverImageOfPage:(unint64_t)a3 maxSize:(CGSize)a4 quality:(BOOL *)a5 receiver:(id)a6 selector:(SEL)a7 info:(id)a8
{
  if (!a3) {
    return;
  }
  double height = a4.height;
  double width = a4.width;
  if ([(UIPDFPageImageCache *)self pageCount] < a3) {
    return;
  }
  id v50 = [(UIPDFDocument *)[(UIPDFPageImageCache *)self document] copyPageAtIndex:a3 - 1];
  os_unfair_lock_lock(&self->_lock);
  unint64_t v16 = [(UIPDFPageImageCache *)self lookAhead];
  unint64_t jobCount = self->_jobCount;
  id v17 = self->_jobsByPage[a3 - 1];
  id v18 = v17;
  os_unfair_lock_unlock(&self->_lock);
  if (v17)
  {
    unint64_t v48 = v16;
    if (v16)
    {
      BOOL v19 = [v17 priority] == 4;
      BOOL v20 = [v17 image] != 0;
    }
    else
    {
      [v17 size];
      BOOL v20 = 0;
      BOOL v19 = v22 == height && v21 == width;
    }
    if (!*a5 || v19 || v20)
    {
      *a5 = v19;
      [v17 sendImageTo:a6 callback:a7 userData:a8];

      if (!jobCount || !v48) {
        goto LABEL_48;
      }
      goto LABEL_31;
    }

    unint64_t v16 = v48;
  }
  os_unfair_lock_lock(&self->_lock);
  *a5 = 1;
  v23 = -[UIPDFPageRenderJob initWithPage:maxSize:queuePriority:]([UIPDFPageRenderJob alloc], "initWithPage:maxSize:queuePriority:", v50, 4, width, height);
  [(UIPDFPageRenderJob *)v23 setTarget:a6 callback:a7 userData:a8];
  if (!jobCount || !v16)
  {
    [(UIPDFPageImageCache *)self addRenderJob:v23];

    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_48;
  }
  id v24 = self->_jobsPrioritized[self->_nextJobIndex];
  if (v24)
  {
    uint64_t v25 = -1;
    do
    {
      int v26 = a3 - 1 - [v24 pageIndex];
      if (v26 >= 0) {
        unint64_t v27 = v26;
      }
      else {
        unint64_t v27 = -v26;
      }
      if ([(UIPDFPageImageCache *)self lookAhead] < v27) {
        break;
      }
      unint64_t v28 = self->_jobCount;
      if (++v25 >= v28) {
        break;
      }
      jobsPrioritized = self->_jobsPrioritized;
      unint64_t nextJobIndex = self->_nextJobIndex;
      unint64_t v31 = nextJobIndex + 1 < v28 ? nextJobIndex + 1 : 0;
      self->_unint64_t nextJobIndex = v31;
      id v24 = jobsPrioritized[v31];
    }
    while (v24);
  }
  [(UIPDFPageImageCache *)self addRenderJob:v23];

  os_unfair_lock_unlock(&self->_lock);
LABEL_31:
  [v50 cropBoxAccountForRotation];
  double v34 = height * v32;
  double v35 = height / v33;
  if (v33 <= 0.0) {
    double v35 = 1.0;
  }
  if (v32 <= 0.0) {
    double v36 = 1.0;
  }
  else {
    double v36 = width / v32;
  }
  if (v34 >= width * v33) {
    double v37 = v36;
  }
  else {
    double v37 = v35;
  }
  unint64_t v38 = [(UIPDFPageImageCache *)self lookAhead];
  if (v38)
  {
    unint64_t v39 = v38;
    unint64_t v40 = 1;
    char v41 = 1;
    do
    {
      if (v41)
      {
        unint64_t v42 = v40 + a3;
        if (v40 + a3 <= [(UIPDFPageImageCache *)self pageCount]) {
          goto LABEL_45;
        }
      }
      else
      {
        unint64_t v42 = a3 - v40;
        if (a3 > v40)
        {
LABEL_45:
          if (v42)
          {
            id v43 = [(UIPDFDocument *)[(UIPDFPageImageCache *)self document] copyPageAtIndex:v42 - 1];
            [v43 cropBoxAccountForRotation];
            double v45 = v44;
            double v47 = v46;

            -[UIPDFPageImageCache cacheImageOfPage:maxSize:](self, "cacheImageOfPage:maxSize:", v42, v37 * v45, v37 * v47);
          }
        }
      }
      v41 ^= 1u;
      v40 += v41 & 1;
    }
    while (v40 <= v39);
  }
LABEL_48:
}

- (id)getImageIfAvailableForPage:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = self->_jobsByPage[a3 - 1];
  if (v6) {
    id v7 = (id)[v6 image];
  }
  else {
    id v7 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)cancelPendingRenderOperations
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSOperationQueue *)self->_renderQueue cancelAllOperations];
  unint64_t jobCount = self->_jobCount;
  if (jobCount)
  {
    for (unint64_t i = 0; i < jobCount; ++i)
    {
      id v6 = self->_jobsPrioritized[i];
      if (v6)
      {
        [v6 cancelOperation];
        unint64_t jobCount = self->_jobCount;
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)cancelPendingRenderOperationsForTarget:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t jobCount = self->_jobCount;
  if (jobCount)
  {
    for (unint64_t i = 0; i < jobCount; ++i)
    {
      id v8 = self->_jobsPrioritized[i];
      if (v8)
      {
        [v8 cancelOperationForTarget:a3];
        unint64_t jobCount = self->_jobCount;
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)didReceiveMemoryWarning:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(UIPDFPageImageCache *)self clearCache];
  os_unfair_lock_unlock(p_lock);
}

- (int)getRenderQueueJobsCount
{
  return [(NSOperationQueue *)self->_renderQueue operationCount];
}

- (UIPDFDocument)document
{
  return self->_document;
}

- (unint64_t)pageCount
{
  return self->_pageCount;
}

- (unint64_t)lookAhead
{
  return self->_lookAhead;
}

- (double)lookAheadResolution
{
  return self->_lookAheadResolution;
}

@end