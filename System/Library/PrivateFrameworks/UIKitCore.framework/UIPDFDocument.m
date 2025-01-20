@interface UIPDFDocument
+ (id)documentNamed:(id)a3;
- (BOOL)allowsCopying;
- (CGPDFDocument)CGDocument;
- (CGPDFDocument)copyCGPDFDocument;
- (NSObject)delegate;
- (NSString)documentID;
- (UIPDFDocument)initWithCGPDFDocument:(CGPDFDocument *)a3;
- (UIPDFDocument)initWithCGPDFDocumentLimitedMemory:(CGPDFDocument *)a3;
- (UIPDFDocument)initWithURL:(id)a3;
- (UIPDFPageImageCache)pageImageCache;
- (UIPDFPageImageCache)thumbnailCache;
- (double)maxHeight;
- (double)maxWidth;
- (double)sumHeight;
- (double)sumWidth;
- (id)copyPageAtIndex:(unint64_t)a3;
- (id)pageAtIndex:(unint64_t)a3;
- (unint64_t)numberOfPages;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setImageCacheCount:(unint64_t)a3 lookAhead:(unint64_t)a4 withResolution:(double)a5;
- (void)setPageImageCache:(id)a3;
- (void)setThumbnailCache:(id)a3;
- (void)updateWidthHeightCache;
@end

@implementation UIPDFDocument

+ (id)documentNamed:(id)a3
{
  v4 = (void *)[MEMORY[0x1E4F28B50] mainBundle];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = objc_msgSend(v4, "URLForResource:withExtension:", objc_msgSend(a3, "stringByDeletingPathExtension"), @"pdf");
  if (!v5) {
    return 0;
  }
  v6 = [[UIPDFDocument alloc] initWithURL:v5];
  return v6;
}

- (CGPDFDocument)copyCGPDFDocument
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = CGPDFDocumentRetain(self->_cgDocument);
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (UIPDFDocument)initWithCGPDFDocument:(CGPDFDocument *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)UIPDFDocument;
  v4 = [(UIPDFDocument *)&v13 init];
  uint64_t v5 = v4;
  if (v4)
  {
    *(void *)&v4->_lock._os_unfair_lock_opaque = 0;
    v4->_thumbnailLock._os_unfair_lock_opaque = 0;
    v6 = CGPDFDocumentRetain(a3);
    v5->_cgDocument = v6;
    v5->_numberOfPages = CGPDFDocumentGetNumberOfPages(v6);
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v5->_cachedWidth = _Q0;
    [(UIPDFDocument *)v5 setImageCacheCount:10 lookAhead:2 withResolution:0.5];
  }
  return v5;
}

- (UIPDFDocument)initWithCGPDFDocumentLimitedMemory:(CGPDFDocument *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)UIPDFDocument;
  v4 = [(UIPDFDocument *)&v13 init];
  uint64_t v5 = v4;
  if (v4)
  {
    *(void *)&v4->_lock._os_unfair_lock_opaque = 0;
    v4->_thumbnailLock._os_unfair_lock_opaque = 0;
    v6 = CGPDFDocumentRetain(a3);
    v5->_cgDocument = v6;
    v5->_numberOfPages = CGPDFDocumentGetNumberOfPages(v6);
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v5->_cachedWidth = _Q0;
    [(UIPDFDocument *)v5 setImageCacheCount:1 lookAhead:0 withResolution:0.25];
  }
  return v5;
}

- (UIPDFDocument)initWithURL:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)UIPDFDocument;
  v4 = [(UIPDFDocument *)&v12 init];
  if (v4)
  {
    CGPDFDocumentRef v5 = CGPDFDocumentCreateWithURL((CFURLRef)a3);
    *((void *)v4 + 1) = v5;
    if (v5)
    {
      *((void *)v4 + 11) = 0;
      *((_DWORD *)v4 + 26) = 0;
      *((void *)v4 + 6) = (id)[a3 lastPathComponent];
      *((void *)v4 + 2) = CGPDFDocumentGetNumberOfPages(*((CGPDFDocumentRef *)v4 + 1));
      __asm { FMOV            V0.2D, #-1.0 }
      *(_OWORD *)(v4 + 24) = _Q0;
      [v4 setImageCacheCount:10 lookAhead:2 withResolution:0.5];
    }
  }
  return (UIPDFDocument *)v4;
}

- (void)dealloc
{
  thumbnailCache = self->_thumbnailCache;
  if (thumbnailCache)
  {

    self->_thumbnailCache = 0;
  }
  pageImageCache = self->_pageImageCache;
  if (pageImageCache)
  {

    self->_pageImageCache = 0;
  }
  CGPDFDocumentRelease(self->_cgDocument);

  +[UIPDFViewTouchHandler releaseViewManager];
  v5.receiver = self;
  v5.super_class = (Class)UIPDFDocument;
  [(UIPDFDocument *)&v5 dealloc];
}

- (void)setImageCacheCount:(unint64_t)a3 lookAhead:(unint64_t)a4 withResolution:(double)a5
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_imageCacheCount = a3;
  self->_imageCacheLookAhead = a4;
  self->_imageCacheResolution = a5;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)numberOfPages
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t numberOfPages = self->_numberOfPages;
  os_unfair_lock_unlock(p_lock);
  return numberOfPages;
}

- (id)pageAtIndex:(unint64_t)a3
{
  id v3 = [(UIPDFDocument *)self copyPageAtIndex:a3];
  return v3;
}

- (id)copyPageAtIndex:(unint64_t)a3
{
  if (self->_numberOfPages <= a3) {
    return 0;
  }
  uint64_t v4 = CGPDFDocumentCopyPage();
  if (!v4) {
    return 0;
  }
  objc_super v5 = (CGPDFPage *)v4;
  v6 = [[UIPDFPage alloc] initWithCGPDFPage:v4];
  CGPDFPageRelease(v5);
  if (v6) {
    [(UIPDFPage *)v6 setDocument:self];
  }
  return v6;
}

- (NSString)documentID
{
  result = self->_documentID;
  if (!result)
  {
    result = (NSString *)self->_cgDocument;
    if (result)
    {
      result = (NSString *)CGPDFDocumentGetID((CGPDFDocumentRef)result);
      if (result)
      {
        uint64_t v4 = result;
        if (CGPDFArrayGetCount((CGPDFArrayRef)result))
        {
          CGPDFStringRef value = 0;
          if (CGPDFArrayGetString((CGPDFArrayRef)v4, 0, &value))
          {
            objc_super v5 = (__CFString *)CGPDFStringCopyTextString(value);
            if (v5)
            {
              v6 = v5;
              uint64_t v7 = [(__CFString *)v5 length];
              v8 = malloc_type_malloc((4 * v7) | 1, 0xCF0469B0uLL);
              if (v7)
              {
                uint64_t v9 = 0;
                uint64_t v10 = 0;
                do
                {
                  unint64_t v11 = [(__CFString *)v6 characterAtIndex:v9];
                  objc_super v12 = &v8[v10];
                  *objc_super v12 = a0123456789abcd[(unint64_t)v11 >> 12];
                  v12[1] = a0123456789abcd[(v11 >> 8) & 0xF];
                  v12[2] = a0123456789abcd[v11 >> 4];
                  v10 += 4;
                  v12[3] = a0123456789abcd[v11 & 0xF];
                  ++v9;
                }
                while (v7 != v9);
              }
              else
              {
                uint64_t v10 = 0;
              }
              v8[v10] = 0;
              objc_super v13 = (NSString *)[[NSString alloc] initWithCString:v8 encoding:1];
              free(v8);
              self->_documentID = v13;
              CFRelease(v6);
            }
          }
        }
        return self->_documentID;
      }
    }
  }
  return result;
}

- (BOOL)allowsCopying
{
  cgDocument = self->_cgDocument;
  if (cgDocument) {
    LOBYTE(cgDocument) = CGPDFDocumentAllowsCopying(cgDocument);
  }
  return (char)cgDocument;
}

- (NSObject)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (CGPDFDocument)CGDocument
{
  return self->_cgDocument;
}

- (void)updateWidthHeightCache
{
  unint64_t numberOfPages = self->_numberOfPages;
  if (numberOfPages)
  {
    for (unint64_t i = 1; i <= numberOfPages; ++i)
    {
      objc_super v5 = (CGPDFPage *)CGPDFDocumentCopyPage();
      if (v5)
      {
        v6 = v5;
        CGRect BoxRect = CGPDFPageGetBoxRect(v5, kCGPDFCropBox);
        if (BoxRect.size.width > self->_cachedWidth) {
          self->_cachedWidth = BoxRect.size.width;
        }
        if (BoxRect.size.height > self->_cachedHeight) {
          self->_cachedHeight = BoxRect.size.height;
        }
        CGPDFPageRelease(v6);
      }
    }
  }
}

- (double)maxWidth
{
  double result = self->_cachedWidth;
  if (result < 0.0)
  {
    [(UIPDFDocument *)self updateWidthHeightCache];
    return self->_cachedWidth;
  }
  return result;
}

- (double)maxHeight
{
  double result = self->_cachedHeight;
  if (result < 0.0)
  {
    [(UIPDFDocument *)self updateWidthHeightCache];
    return self->_cachedHeight;
  }
  return result;
}

- (double)sumWidth
{
  unint64_t numberOfPages = self->_numberOfPages;
  if (!numberOfPages) {
    return 0.0;
  }
  double v3 = 0.0;
  for (unint64_t i = 1; i <= numberOfPages; ++i)
  {
    objc_super v5 = (CGPDFPage *)CGPDFDocumentCopyPage();
    if (v5)
    {
      v6 = v5;
      CGRect BoxRect = CGPDFPageGetBoxRect(v5, kCGPDFCropBox);
      double v3 = v3 + BoxRect.size.width;
      CGPDFPageRelease(v6);
    }
  }
  return v3;
}

- (double)sumHeight
{
  unint64_t numberOfPages = self->_numberOfPages;
  if (!numberOfPages) {
    return 0.0;
  }
  double v3 = 0.0;
  for (unint64_t i = 1; i <= numberOfPages; ++i)
  {
    objc_super v5 = (CGPDFPage *)CGPDFDocumentCopyPage();
    if (v5)
    {
      v6 = v5;
      CGRect BoxRect = CGPDFPageGetBoxRect(v5, kCGPDFCropBox);
      double v3 = v3 + BoxRect.size.height;
      CGPDFPageRelease(v6);
    }
  }
  return v3;
}

- (UIPDFPageImageCache)pageImageCache
{
  p_imageCacheLock = &self->_imageCacheLock;
  os_unfair_lock_lock(&self->_imageCacheLock);
  pageImageCache = self->_pageImageCache;
  if (!pageImageCache)
  {
    pageImageCache = [[UIPDFPageImageCache alloc] initWithDocument:self cacheCount:self->_imageCacheCount lookAhead:self->_imageCacheLookAhead withLookAheadResolution:self->_imageCacheResolution];
    self->_pageImageCache = pageImageCache;
  }
  os_unfair_lock_unlock(p_imageCacheLock);
  return pageImageCache;
}

- (void)setPageImageCache:(id)a3
{
  if (a3) {
    id v5 = a3;
  }
  os_unfair_lock_lock(&self->_imageCacheLock);
  pageImageCache = self->_pageImageCache;
  if (pageImageCache) {

  }
  self->_pageImageCache = (UIPDFPageImageCache *)a3;
  os_unfair_lock_unlock(&self->_imageCacheLock);
}

- (UIPDFPageImageCache)thumbnailCache
{
  p_thumbnailLock = &self->_thumbnailLock;
  os_unfair_lock_lock(&self->_thumbnailLock);
  thumbnailCache = self->_thumbnailCache;
  if (!thumbnailCache)
  {
    thumbnailCache = [[UIPDFPageImageCache alloc] initWithDocument:self cacheCount:1 lookAhead:0 withLookAheadResolution:self->_imageCacheResolution];
    self->_thumbnailCache = thumbnailCache;
  }
  os_unfair_lock_unlock(p_thumbnailLock);
  return thumbnailCache;
}

- (void)setThumbnailCache:(id)a3
{
  if (a3) {
    id v5 = a3;
  }
  os_unfair_lock_lock(&self->_thumbnailLock);
  thumbnailCache = self->_thumbnailCache;
  if (thumbnailCache) {

  }
  self->_thumbnailCache = (UIPDFPageImageCache *)a3;
  os_unfair_lock_unlock(&self->_thumbnailLock);
}

@end