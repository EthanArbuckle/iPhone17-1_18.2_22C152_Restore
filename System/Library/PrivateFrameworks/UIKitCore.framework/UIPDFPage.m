@interface UIPDFPage
- (CGPDFPage)CGPage;
- (CGRect)cropBox;
- (CGRect)cropBoxAccountForRotation;
- (CGRect)mediaBox;
- (CGRect)mediaBoxAccountForRotation;
- (CGSize)size;
- (UIImage)pageImage;
- (UIPDFDocument)document;
- (UIPDFPage)initWithCGPDFPage:(CGPDFPage *)a3;
- (UIPDFPage)initWithDocument:(id)a3 pageNumber:(unint64_t)a4;
- (UIPDFSelection)selection;
- (id)annotationIn:(id)a3 withIndex:(unint64_t)a4;
- (id)annotations;
- (id)copyPage;
- (id)findString:(id)a3 fromSelection:(id)a4 options:(unint64_t)a5;
- (id)getImageIfAvailable;
- (id)string;
- (unint64_t)cfCompareFlagsFromNSOptions:(unint64_t)a3;
- (unint64_t)pageIndex;
- (unint64_t)pageNumber;
- (unint64_t)rotation;
- (void)addAnnotation:(id)a3;
- (void)clearAnnotations;
- (void)dealloc;
- (void)deliverImageWithWidth:(unint64_t)a3 height:(unint64_t)a4 receiver:(id)a5 selector:(SEL)a6 info:(id)a7;
- (void)drawInRect:(CGRect)a3 context:(CGContext *)a4;
- (void)refresh;
- (void)removeAllAnnotations;
- (void)removeAnnotation:(id)a3;
- (void)setDocument:(id)a3;
- (void)setPageImage:(id)a3;
- (void)setSelection:(id)a3;
@end

@implementation UIPDFPage

- (UIPDFPage)initWithCGPDFPage:(CGPDFPage *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIPDFPage;
  v4 = [(UIPDFPage *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_cgPage = a3;
    CGPDFPageRetain(a3);
    size_t PageNumber = CGPDFPageGetPageNumber(a3);
    v5->_pageNumber = PageNumber;
    v5->_pageIndex = PageNumber - 1;
    v5->_lock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (void)setDocument:(id)a3
{
  uint64_t v3 = 0;
  atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_document, (unint64_t *)&v3, (unint64_t)a3);
}

- (UIPDFPage)initWithDocument:(id)a3 pageNumber:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIPDFPage;
  v5 = [(UIPDFPage *)&v7 init];
  if (v5)
  {
    [a3 CGDocument];
    v5->_cgPage = (CGPDFPage *)CGPDFDocumentCopyPage();
    v5->_pageIndex = v5->_pageNumber - 1;
    v5->_lock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (void)dealloc
{
  [(UIPDFPage *)self setSelection:0];
  [(UIPDFPage *)self setPageImage:0];
  CGPDFPageRemoveLayout();
  CGPDFPageRelease(self->_cgPage);
  v3.receiver = self;
  v3.super_class = (Class)UIPDFPage;
  [(UIPDFPage *)&v3 dealloc];
}

- (void)drawInRect:(CGRect)a3 context:(CGContext *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGContextSaveGState(a4);
  v41.origin.CGFloat x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  CGContextClipToRect(a4, v41);
  CGContextSetFillColorWithColor(a4, [+[UIColor whiteColor] CGColor]);
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  CGContextFillRect(a4, v42);
  cgPage = self->_cgPage;
  memset(&v36, 0, 32);
  memset(&transform, 0, sizeof(transform));
  CGRect BoxRect = CGPDFPageGetBoxRect(cgPage, kCGPDFCropBox);
  CGFloat v11 = BoxRect.origin.x;
  CGFloat v12 = BoxRect.origin.y;
  CGFloat v13 = BoxRect.size.width;
  CGFloat v14 = BoxRect.size.height;
  CGRect v55 = CGPDFPageGetBoxRect(cgPage, kCGPDFMediaBox);
  v44.origin.CGFloat x = v11;
  v44.origin.CGFloat y = v12;
  v44.size.CGFloat width = v13;
  v44.size.CGFloat height = v14;
  CGRect v45 = CGRectIntersection(v44, v55);
  CGFloat v15 = v45.origin.x;
  CGFloat v16 = v45.origin.y;
  CGFloat v17 = v45.size.width;
  CGFloat v18 = v45.size.height;
  double MinX = CGRectGetMinX(v45);
  v46.origin.CGFloat x = v15;
  v46.origin.CGFloat y = v16;
  v46.size.CGFloat width = v17;
  v46.size.CGFloat height = v18;
  double MinY = CGRectGetMinY(v46);
  v47.origin.CGFloat x = v15;
  v47.origin.CGFloat y = v16;
  v47.size.CGFloat width = v17;
  v47.size.CGFloat height = v18;
  CGFloat MaxX = CGRectGetMaxX(v47);
  v48.origin.CGFloat x = v15;
  v48.origin.CGFloat y = v16;
  v48.size.CGFloat width = v17;
  v48.size.CGFloat height = v18;
  CGFloat MaxY = CGRectGetMaxY(v48);
  v49.origin.CGFloat x = v15;
  v49.origin.CGFloat y = v16;
  v49.size.CGFloat width = v17;
  v49.size.CGFloat height = v18;
  tCGFloat x = CGRectGetWidth(v49);
  v50.origin.CGFloat x = v15;
  v50.origin.CGFloat y = v16;
  v50.size.CGFloat width = v17;
  v50.size.CGFloat height = v18;
  double v19 = CGRectGetHeight(v50);
  int v20 = CGPDFPageGetRotationAngle(cgPage) % 360;
  int v21 = v20 + (v20 < 0 ? 0x168 : 0);
  if (v21 > 179)
  {
    if (v21 != 180)
    {
      if (v21 == 270)
      {
        double v24 = -MinX;
        *(_OWORD *)&v36.a = xmmword_186B89740;
        *(_OWORD *)&v36.c = xmmword_186B9C3F0;
        double v22 = MaxY;
        double v23 = v19;
        double v19 = tx;
        goto LABEL_11;
      }
LABEL_12:
      abort();
    }
    v36.a = -1.0;
    v36.b = 0.0;
    v36.c = 0.0;
    v36.d = -1.0;
    double v22 = MaxX;
    double v24 = MaxY;
LABEL_10:
    double v23 = tx;
    goto LABEL_11;
  }
  if (!v21)
  {
    double v22 = -MinX;
    double v24 = -MinY;
    v36.a = 1.0;
    v36.b = 0.0;
    v36.c = 0.0;
    v36.d = 1.0;
    goto LABEL_10;
  }
  if (v21 != 90) {
    goto LABEL_12;
  }
  double v22 = -MinY;
  *(_OWORD *)&v36.a = xmmword_186B97840;
  *(_OWORD *)&v36.c = xmmword_186B8C800;
  double v23 = v19;
  double v24 = MaxX;
  double v19 = tx;
LABEL_11:
  v36.tCGFloat x = v22;
  v36.tCGFloat y = v24;
  CGAffineTransformMakeTranslation(&transform, v23 * -0.5, v19 * -0.5);
  CGAffineTransform t1 = v36;
  CGAffineTransform t2 = transform;
  CGAffineTransformConcat(&v36, &t1, &t2);
  v51.origin.CGFloat x = x;
  v51.origin.CGFloat y = y;
  v51.size.CGFloat width = width;
  v51.size.CGFloat height = height;
  CGFloat txa = CGRectGetMinX(v51);
  v52.origin.CGFloat x = x;
  v52.origin.CGFloat y = y;
  v52.size.CGFloat width = width;
  v52.size.CGFloat height = height;
  CGFloat v25 = CGRectGetMinY(v52);
  v53.origin.CGFloat x = x;
  v53.origin.CGFloat y = y;
  v53.size.CGFloat width = width;
  v53.size.CGFloat height = height;
  double v26 = CGRectGetWidth(v53);
  v54.origin.CGFloat x = x;
  v54.origin.CGFloat y = y;
  v54.size.CGFloat width = width;
  v54.size.CGFloat height = height;
  double v27 = CGRectGetHeight(v54);
  CGFloat v28 = fmin(v26 / v23, v27 / v19);
  CGAffineTransformMakeScale(&t1, v28, v28);
  CGAffineTransform transform = t1;
  CGAffineTransform t2 = v36;
  CGAffineTransform v37 = t1;
  CGAffineTransformConcat(&t1, &t2, &v37);
  CGAffineTransform v36 = t1;
  CGAffineTransformMakeTranslation(&t1, v26 * 0.5, v27 * 0.5);
  CGAffineTransform transform = t1;
  CGAffineTransform t2 = v36;
  CGAffineTransform v37 = t1;
  CGAffineTransformConcat(&t1, &t2, &v37);
  CGAffineTransform v36 = t1;
  CGAffineTransformMakeTranslation(&t1, txa, v25);
  CGAffineTransform transform = t1;
  CGAffineTransform t2 = v36;
  CGAffineTransform v37 = t1;
  CGAffineTransformConcat(&t1, &t2, &v37);
  CGAffineTransform v36 = t1;
  CGAffineTransform transform = t1;
  CGContextConcatCTM(a4, &transform);
  v29 = self;
  CGContextDrawPDFPage(a4, [(UIPDFPage *)self CGPage]);

  CGContextRestoreGState(a4);
}

- (id)getImageIfAvailable
{
  objc_super v3 = [(UIPDFPage *)self pageImage];
  if (v3)
  {
    v4 = v3;
    v5 = v3;
    return v4;
  }
  else
  {
    objc_super v7 = [(UIPDFDocument *)[(UIPDFPage *)self document] pageImageCache];
    unint64_t v8 = [(UIPDFPage *)self pageNumber];
    return [(UIPDFPageImageCache *)v7 getImageIfAvailableForPage:v8];
  }
}

- (void)deliverImageWithWidth:(unint64_t)a3 height:(unint64_t)a4 receiver:(id)a5 selector:(SEL)a6 info:(id)a7
{
  char v7 = 1;
  -[UIPDFPageImageCache deliverImageOfPage:maxSize:quality:receiver:selector:info:]([(UIPDFDocument *)[(UIPDFPage *)self document] thumbnailCache], "deliverImageOfPage:maxSize:quality:receiver:selector:info:", [(UIPDFPage *)self pageNumber], &v7, a5, a6, a7, (double)a3, (double)a4);
}

- (CGSize)size
{
  CGRect BoxRect = CGPDFPageGetBoxRect(self->_cgPage, kCGPDFCropBox);
  double width = BoxRect.size.width;
  double height = BoxRect.size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)cropBox
{
  return CGPDFPageGetBoxRect(self->_cgPage, kCGPDFCropBox);
}

- (CGRect)cropBoxAccountForRotation
{
  double BoxRectWithRotation = CGPDFPageGetBoxRectWithRotation(self->_cgPage, kCGPDFCropBox);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = BoxRectWithRotation;
  return result;
}

- (CGRect)mediaBox
{
  return CGPDFPageGetBoxRect(self->_cgPage, kCGPDFMediaBox);
}

- (CGRect)mediaBoxAccountForRotation
{
  double BoxRectWithRotation = CGPDFPageGetBoxRectWithRotation(self->_cgPage, kCGPDFMediaBox);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = BoxRectWithRotation;
  return result;
}

- (unint64_t)rotation
{
  int v2 = CGPDFPageGetRotationAngle(self->_cgPage) % 360;
  if (v2 >= 0) {
    return v2;
  }
  else {
    return (v2 + 360);
  }
}

- (id)string
{
  id result = self->_stringInReadingOrder;
  if (!result)
  {
    CGPDFPageGetLayout();
    id result = (id)CGPDFLayoutCreateString();
    self->_stringInReadingOrder = (NSString *)result;
  }
  return result;
}

- (unint64_t)cfCompareFlagsFromNSOptions:(unint64_t)a3
{
  return (a3 & 5 | (16 * ((a3 >> 1) & 1))) ^ 0x10;
}

- (id)findString:(id)a3 fromSelection:(id)a4 options:(unint64_t)a5
{
  id result = [(UIPDFPage *)self string];
  if (!result) {
    return result;
  }
  CFStringRef v10 = (const __CFString *)result;
  if ((a5 & 4) == 0)
  {
    CFIndex v11 = 0;
    if (!a4) {
      goto LABEL_11;
    }
LABEL_6:
    uint64_t v12 = [a4 stringRange];
    if ((a5 & 4) != 0) {
      uint64_t v14 = -1;
    }
    else {
      uint64_t v14 = v13;
    }
    CFIndex v15 = v14 + v12;
    if (v12 != -1) {
      CFIndex v11 = v15;
    }
    goto LABEL_11;
  }
  CFIndex v11 = CFStringGetLength((CFStringRef)result) - 1;
  if (a4) {
    goto LABEL_6;
  }
LABEL_11:
  if ((a5 & 4) != 0)
  {
    CFIndex v16 = 0;
  }
  else
  {
    CFIndex v16 = v11;
    CFIndex v11 = CFStringGetLength(v10) - v11;
  }
  CFStringCompareFlags v17 = -[UIPDFPage cfCompareFlagsFromNSOptions:](self, "cfCompareFlagsFromNSOptions:", a5, 0, 0);
  v20.location = v16;
  v20.length = v11;
  if (!CFStringFindWithOptions(v10, (CFStringRef)a3, v20, v17, &v19)) {
    return 0;
  }
  CGFloat v18 = [[UIPDFSelection alloc] initWithPage:self cgSelection:CGPDFSelectionCreateForStringRange()];
  -[UIPDFSelection setStringRange:](v18, "setStringRange:", v19.location, v19.length);
  CGPDFSelectionRelease();
  return v18;
}

- (id)copyPage
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  document = self->_document;
  if (document && self->_cgPage)
  {
    [(UIPDFDocument *)document CGDocument];
    double v5 = (CGPDFPage *)CGPDFDocumentCopyPage();
    if (CGPDFPageGetProperty()) {
      CGPDFPageSetProperty();
    }
    v6 = [[UIPDFPage alloc] initWithCGPDFPage:v5];
    CGPDFPageRelease(v5);
    [(UIPDFPage *)v6 setDocument:self->_document];
  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)refresh
{
  if (self->_cgPage)
  {
    os_unfair_lock_lock(&self->_lock);
    CGPDFPageRemoveProperty();
    os_unfair_lock_unlock(&self->_lock);
  }
  [(UIPDFPage *)self clearAnnotations];
}

- (id)annotationIn:(id)a3 withIndex:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(a3);
    }
    CFStringRef v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if ([v10 index] == a4) {
      return v10;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)annotations
{
  id result = self->_annotations;
  if (!result)
  {
    double v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    DictionarCGFloat y = CGPDFPageGetDictionary(self->_cgPage);
    if (Dictionary && (CGPDFArrayRef value = 0, CGPDFDictionaryGetArray(Dictionary, "Annots", &value)))
    {
      size_t Count = CGPDFArrayGetCount(value);
      if (Count)
      {
        size_t v7 = Count;
        for (size_t i = 0; i != v7; ++i)
        {
          CGPDFDictionaryRef dict = 0;
          if (CGPDFArrayGetDictionary(value, i, &dict))
          {
            CGPDFDictionaryRef v23 = 0;
            if (CGPDFDictionaryGetName(dict, "Subtype", (const char **)&v23))
            {
              id v9 = +[UIPDFAnnotationController newAnnotation:dict type:v23];
              if (v9)
              {
                CFStringRef v10 = v9;
                [v9 setIndex:i];
                [v10 setEditable:0];
                [v10 setPage:self];
                [v4 addObject:v10];
              }
            }
          }
        }
        for (size_t j = 0; j != v7; ++j)
        {
          CGPDFDictionaryRef v23 = 0;
          if (CGPDFArrayGetDictionary(value, j, &v23))
          {
            __s2 = 0;
            if (CGPDFDictionaryGetName(v23, "Subtype", (const char **)&__s2) && !strcmp("Popup", __s2))
            {
              CGPDFDictionaryRef v21 = 0;
              if (CGPDFDictionaryGetDictionary(v23, "Parent", &v21))
              {
                long long v12 = value;
                long long v13 = v21;
                size_t v14 = CGPDFArrayGetCount(value);
                if (v14)
                {
                  size_t v15 = v14;
                  size_t v16 = 0;
                  while (1)
                  {
                    CGPDFDictionaryRef dict = 0;
                    if (CGPDFArrayGetDictionary(v12, v16, &dict) && dict == v13) {
                      break;
                    }
                    if (v15 == ++v16) {
                      goto LABEL_28;
                    }
                  }
                  if ((v16 & 0x8000000000000000) == 0)
                  {
                    id v17 = [(UIPDFPage *)self annotationIn:v4 withIndex:v16];
                    id v18 = [(UIPDFPage *)self annotationIn:v4 withIndex:j];
                    if (v17)
                    {
                      CFRange v19 = v18;
                      if (v18)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            [v17 setPopup:v19];
                            [v19 setParent:v17];
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
LABEL_28:
          ;
        }
      }
      uint64_t v20 = 0;
      atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_annotations, (unint64_t *)&v20, (unint64_t)v4);
      if (v20) {

      }
      return self->_annotations;
    }
    else
    {

      return 0;
    }
  }
  return result;
}

- (void)clearAnnotations
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);

  self->_annotations = 0;
  os_unfair_lock_unlock(p_lock);
}

- (void)removeAllAnnotations
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableArray *)self->_annotations removeAllObjects];
  os_unfair_lock_unlock(p_lock);
}

- (void)addAnnotation:(id)a3
{
  if (self->_annotations)
  {
    os_unfair_lock_lock(&self->_lock);
    [(NSMutableArray *)self->_annotations addObject:a3];
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    [v6 addObject:a3];
    uint64_t v5 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_annotations, (unint64_t *)&v5, (unint64_t)v6);
    if (v5)
    {
    }
  }
}

- (void)removeAnnotation:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = (void *)[a3 popup];
  if (v6)
  {
    size_t v7 = v6;
    [v6 setParent:0];
    [(NSMutableArray *)self->_annotations removeObject:v7];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = (void *)[a3 parent];
    if (v8) {
      [v8 setPopup:0];
    }
  }
  if ([a3 annotationView]) {
    objc_msgSend((id)objc_msgSend(a3, "annotationView"), "removeFromSuperview");
  }
  [(NSMutableArray *)self->_annotations removeObject:a3];
  os_unfair_lock_unlock(p_lock);
}

- (CGPDFPage)CGPage
{
  return self->_cgPage;
}

- (unint64_t)pageNumber
{
  return self->_pageNumber;
}

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

- (UIPDFSelection)selection
{
  return (UIPDFSelection *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSelection:(id)a3
{
}

- (UIPDFDocument)document
{
  return self->_document;
}

- (UIImage)pageImage
{
  return (UIImage *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPageImage:(id)a3
{
}

@end