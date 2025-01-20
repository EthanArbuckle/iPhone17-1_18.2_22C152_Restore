@interface UIPDFAnnotation
+ (id)newAnnotationWithPage:(id)a3 fromArchive:(id)a4;
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)editable;
- (BOOL)hasPopUp;
- (BOOL)hidden;
- (BOOL)recognizeGestures;
- (CALayer)drawingLayer;
- (CGColor)color;
- (CGPath)newPathFromQuadPoints;
- (CGRect)Rect;
- (CGRect)popUpAnnotationRect;
- (CGRect)rectIn:(CGPDFArray *)a3;
- (Class)viewClass;
- (NSString)associatedAnnotationID;
- (NSString)contents;
- (UIPDFAnnotation)init;
- (UIPDFAnnotation)initWithAnnotationDictionary:(CGPDFDictionary *)a3;
- (UIPDFAnnotationController)annotationController;
- (UIPDFAnnotationView)annotationView;
- (UIPDFPage)page;
- (UIPDFPopupAnnotation)popup;
- (UIPDFSelection)selection;
- (const)pdfContents;
- (id)annotationID;
- (id)archive;
- (id)data;
- (id)descriptionHOLD;
- (id)getImageNamed:(id)a3 ofType:(id)a4;
- (id)newSelection;
- (int)annotationType;
- (int64_t)index;
- (unint64_t)tag;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3;
- (void)makeQuadpointsFrom:(id)a3;
- (void)setAnnotationController:(id)a3;
- (void)setAnnotationID:(id)a3;
- (void)setAnnotationView:(id)a3;
- (void)setAssociatedAnnotationID:(id)a3;
- (void)setColor:(CGColor *)a3;
- (void)setContents:(id)a3;
- (void)setData:(id)a3;
- (void)setDrawingLayer:(id)a3;
- (void)setEditable:(BOOL)a3;
- (void)setIndex:(int64_t)a3;
- (void)setPage:(id)a3;
- (void)setPageView:(id)a3;
- (void)setPopup:(id)a3;
- (void)setSelection:(id)a3;
- (void)setTag:(unint64_t)a3;
@end

@implementation UIPDFAnnotation

+ (id)newAnnotationWithPage:(id)a3 fromArchive:(id)a4
{
  uint64_t v6 = [a4 rangeOfString:@"<UIPDFSelection"];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
    goto LABEL_3;
  }
  uint64_t v12 = v6;
  uint64_t v13 = [a4 rangeOfString:@"</UIPDFSelection>"];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  v14 = -[UIPDFSelection initWithPage:fromArchive:]([UIPDFSelection alloc], "initWithPage:fromArchive:", a3, objc_msgSend(a4, "substringWithRange:", v12, v13 - v12 + 17));
  v7 = v14;
  if (v14 && ![(UIPDFSelection *)v14 CGSelection])
  {

    return 0;
  }
LABEL_3:
  v8 = objc_alloc_init(UIPDFAnnotationParserDelegate);
  uint64_t v9 = [a4 dataUsingEncoding:4];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F29250]) initWithData:v9];
  [v10 setDelegate:v8];
  [v10 parse];
  if ([(UIPDFAnnotationParserDelegate *)v8 parseError])
  {
    v11 = 0;
  }
  else
  {
    v11 = [(UIPDFAnnotationParserDelegate *)v8 annotation];
    [(UIPDFAnnotation *)v11 setEditable:1];
    [(UIPDFAnnotation *)v11 setSelection:v7];
  }

  return v11;
}

- (UIPDFAnnotation)init
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)UIPDFAnnotation;
  v2 = [(UIPDFAnnotation *)&v7 init];
  if (v2)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *(_OWORD *)components = xmmword_186B9C490;
    long long v9 = unk_186B9C4A0;
    v2->_color = CGColorCreate(DeviceRGB, components);
    CGColorSpaceRelease(DeviceRGB);
    v2->_pdfContents = 0;
    v2->_index = -1;
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFUUIDRef v5 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
    v2->_annotationID = (NSString *)CFUUIDCreateString(v4, v5);
    CFRelease(v5);
    v2->_quadPoints = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  }
  return v2;
}

- (UIPDFAnnotation)initWithAnnotationDictionary:(CGPDFDictionary *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)UIPDFAnnotation;
  CFAllocatorRef v4 = [(UIPDFAnnotation *)&v23 init];
  CFUUIDRef v5 = v4;
  if (!v4) {
    return v5;
  }
  v4->_hidden = 0;
  v4->_pdfContents = 0;
  v4->_dictionary = a3;
  v4->_color = 0;
  v4->_index = -1;
  v4->_quadPoints = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  CGPDFArrayRef value = 0;
  *(_OWORD *)components = xmmword_186B9C490;
  *(_OWORD *)v25 = unk_186B9C4A0;
  if (CGPDFDictionaryGetArray(a3, "C", &value))
  {
    size_t Count = CGPDFArrayGetCount(value);
    switch(Count)
    {
      case 4uLL:
        DeviceCMYK = CGColorSpaceCreateDeviceCMYK();
        CGPDFArrayGetNumber(value, 0, components);
        CGPDFArrayGetNumber(value, 1uLL, &components[1]);
        CGPDFArrayGetNumber(value, 2uLL, v25);
        v8 = value;
        long long v9 = &v25[1];
        size_t v10 = 3;
        break;
      case 3uLL:
        DeviceCMYK = CGColorSpaceCreateDeviceRGB();
        CGPDFArrayGetNumber(value, 0, components);
        CGPDFArrayGetNumber(value, 1uLL, &components[1]);
        v8 = value;
        long long v9 = v25;
        size_t v10 = 2;
        break;
      case 1uLL:
        DeviceCMYK = CGColorSpaceCreateDeviceGray();
        v8 = value;
        long long v9 = components;
        size_t v10 = 0;
        break;
      default:
        goto LABEL_12;
    }
    CGPDFArrayGetNumber(v8, v10, v9);
  }
  else
  {
    DeviceCMYK = CGColorSpaceCreateDeviceRGB();
  }
  v5->_color = CGColorCreate(DeviceCMYK, components);
  CGColorSpaceRelease(DeviceCMYK);
LABEL_12:
  CGPDFArrayRef array = 0;
  if (CGPDFDictionaryGetArray(a3, "QuadPoints", &array))
  {
    int64_t v11 = CGPDFArrayGetCount(array);
    int64_t v12 = v11 - 1;
    if (v11 >= 1 && (v11 & 7) == 0)
    {
      CGPDFReal v19 = 0.0;
      CGPDFReal v20 = 0.0;
      if ((unint64_t)v11 >= 2)
      {
        int64_t v13 = 0;
        do
        {
          CGPDFArrayGetNumber(array, v13, &v20);
          CGPDFArrayGetNumber(array, v13 + 1, &v19);
          -[NSMutableArray addObject:](v5->_quadPoints, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v20, v19));
          v13 += 2;
        }
        while (v13 < v12);
      }
    }
  }
  CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFUUIDRef v15 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  v5->_annotationID = (NSString *)CFUUIDCreateString(v14, v15);
  CFRelease(v15);
  v5->_appearanceStream = 0;
  CGPDFReal v20 = 0.0;
  if (CGPDFDictionaryGetDictionary(a3, "AP", (CGPDFDictionaryRef *)&v20))
  {
    uint64_t v18 = 0;
    CGPDFReal v19 = 0.0;
    if (CGPDFDictionaryGetObject(*(CGPDFDictionaryRef *)&v20, "N", (CGPDFObjectRef *)&v19)
      && CGPDFObjectGetValue(*(CGPDFObjectRef *)&v19, kCGPDFObjectTypeStream, &v18))
    {
      v5->_appearanceStream = (void *)CGPDFFormCreate();
    }
  }
  CGPDFReal v19 = 0.0;
  if (CGPDFDictionaryGetString(a3, "Contents", (CGPDFStringRef *)&v19))
  {
    BytePtr = CGPDFStringGetBytePtr(*(CGPDFStringRef *)&v19);
    v5->_contents = (NSString *)[[NSString alloc] initWithBytes:BytePtr length:CGPDFStringGetLength(*(CGPDFStringRef *)&v19) encoding:1];
  }
  return v5;
}

- (void)dealloc
{
  [(UIPDFAnnotation *)self setPopup:0];
  CGColorRelease(self->_color);
  CGPDFFormRelease();
  annotationID = self->_annotationID;
  if (annotationID) {
    CFRelease(annotationID);
  }
  CFAllocatorRef v4 = [(UIPDFAnnotation *)self annotationView];
  if (v4)
  {
    [(UIView *)v4 removeFromSuperview];
    [(UIPDFAnnotation *)self setAnnotationView:0];
  }
  CFUUIDRef v5 = [(UIPDFAnnotation *)self drawingLayer];
  if (v5)
  {
    uint64_t v6 = v5;
    [(CALayer *)v5 setDelegate:0];
    [(CALayer *)v6 removeFromSuperlayer];
    [(UIPDFAnnotation *)self setDrawingLayer:0];
  }

  v7.receiver = self;
  v7.super_class = (Class)UIPDFAnnotation;
  [(UIPDFAnnotation *)&v7 dealloc];
}

- (void)setPageView:(id)a3
{
  self->_annotationController = (UIPDFAnnotationController *)[a3 annotationController];
}

- (id)annotationID
{
  return self->_annotationID;
}

- (void)setAnnotationID:(id)a3
{
  annotationID = self->_annotationID;
  if (annotationID) {

  }
  self->_annotationID = (NSString *)a3;
}

- (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (int)annotationType
{
  return 10;
}

- (id)archive
{
  id v3 = [(UIPDFAnnotation *)self newSelection];
  CFAllocatorRef v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 archive];
  }
  else {
    uint64_t v5 = 0;
  }

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  int v7 = [(UIPDFAnnotation *)self annotationType];
  if (v7 > 0xA) {
    v8 = @"UIPDFAnnotationTypeOther";
  }
  else {
    v8 = *(&off_1E5305648 + v7);
  }
  [v6 appendString:@"<UIPDFAnnotation type=\""];
  [v6 appendString:v8];
  [v6 appendString:@"\">"];
  [v6 appendString:@"<ID>"];
  [v6 appendString:self->_annotationID];
  [v6 appendString:@"</ID>"];
  ColorSpace = CGColorGetColorSpace(self->_color);
  if (CGColorSpaceGetModel(ColorSpace) == kCGColorSpaceModelRGB)
  {
    Components = CGColorGetComponents(self->_color);
    objc_msgSend(v6, "appendFormat:", @"<Color R=\"%g\" G=\"%g\" B=\"%g\"", *(void *)Components, *((void *)Components + 1), *((void *)Components + 2));
    if (CGColorGetNumberOfComponents(self->_color) == 4) {
      objc_msgSend(v6, "appendFormat:", @" A=\"%g\"", *((void *)Components + 3));
    }
    [v6 appendString:@"/>"];
  }
  if (v5) {
    [v6 appendString:v5];
  }
  int64_t v11 = [(UIPDFAnnotation *)self contents];
  if (v11)
  {
    int64_t v12 = v11;
    [v6 appendString:@"<Contents>"];
    [v6 appendString:v12];
    [v6 appendString:@"</Contents>"];
  }
  popup = self->_popup;
  if (popup)
  {
    uint64_t v14 = [(UIPDFAnnotation *)popup annotationID];
    [v6 appendString:@"<PopupID>"];
    [v6 appendString:v14];
    [v6 appendString:@"</PopupID>"];
  }
  [v6 appendString:@"<Tag>"];
  objc_msgSend(v6, "appendFormat:", @"%ld", -[UIPDFAnnotation tag](self, "tag"));
  [v6 appendString:@"</Tag>"];
  [v6 appendString:@"<Index>"];
  objc_msgSend(v6, "appendFormat:", @"%ld", -[UIPDFAnnotation index](self, "index"));
  [v6 appendString:@"</Index>"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [(UIPDFAnnotation *)self parent])
  {
    uint64_t v15 = objc_msgSend((id)-[UIPDFAnnotation parent](self, "parent"), "annotationID");
    [v6 appendString:@"<ParentID>"];
    [v6 appendString:v15];
    [v6 appendString:@"</ParentID>"];
  }
  [v6 appendString:@"</UIPDFAnnotation>"];
  return v6;
}

- (id)getImageNamed:(id)a3 ofType:(id)a4
{
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:a3];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", v5, a4);

  return +[UIImage imageWithContentsOfFile:v6];
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (CGRect)rectIn:(CGPDFArray *)a3
{
  if (CGPDFArrayGetCount(a3) == 4
    && (v10 = 0.0, value = 0.0, v8 = 0.0, CGPDFReal v9 = 0.0, CGPDFArrayGetNumber(a3, 0, &value))
    && CGPDFArrayGetNumber(a3, 1uLL, &v10)
    && CGPDFArrayGetNumber(a3, 2uLL, &v9)
    && CGPDFArrayGetNumber(a3, 3uLL, &v8))
  {
    double v5 = v10;
    double v4 = value;
    double v6 = v9 - value;
    double v7 = v8 - v10;
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB28];
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)Rect
{
  CGPDFArrayRef value = 0;
  if (CGPDFDictionaryGetArray(self->_dictionary, "Rect", &value))
  {
    [(UIPDFAnnotation *)self rectIn:value];
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB28];
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(UIPDFAnnotation *)self Rect];
  CGFloat v9 = x;
  CGFloat v10 = y;
  return CGRectContainsPoint(*(CGRect *)&v5, *(CGPoint *)&v9);
}

- (void)setColor:(CGColor *)a3
{
  color = self->_color;
  if (color) {
    CGColorRelease(color);
  }
  self->_color = a3;
  CGColorRetain(a3);
}

- (CGColor)color
{
  return self->_color;
}

- (void)drawInContext:(CGContext *)a3
{
  if (self->_appearanceStream)
  {
    CGPDFFormGetStream();
    CGPDFFormGetResources();
    CGPDFDrawingContextCreateWithStream();
    [(UIPDFAnnotation *)self Rect];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    memset(&v22, 0, sizeof(v22));
    CGPDFFormGetMatrix();
    CGPDFFormGetBBox();
    memset(&v21, 0, sizeof(v21));
    CGRect v24 = CGRectApplyAffineTransform(v23, &v21);
    CGFloat v13 = v10 / v24.size.width;
    CGFloat v14 = v12 / v24.size.height;
    memset(&v21, 0, sizeof(v21));
    CGAffineTransformMakeTranslation(&v21, v6 - v24.origin.x * v13, v8 - v24.origin.y * v14);
    memset(&v20, 0, sizeof(v20));
    CGAffineTransformMakeScale(&v20, v13, v14);
    CGAffineTransform t1 = v21;
    CGAffineTransform v17 = v20;
    CGAffineTransformConcat(&v19, &t1, &v17);
    long long v15 = *(_OWORD *)&v19.c;
    CGAffineTransform v21 = v19;
    long long v16 = *(_OWORD *)&v19.a;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&v19.tx;
    memset(&v19, 0, sizeof(v19));
    *(_OWORD *)&t1.a = v16;
    *(_OWORD *)&t1.c = v15;
    CGAffineTransform v17 = v22;
    CGAffineTransformConcat(&v19, &t1, &v17);
    CGContextSaveGState(a3);
    CGAffineTransform t1 = v19;
    CGContextConcatCTM(a3, &t1);
    CGPDFDrawingContextDraw();
    CGContextRestoreGState(a3);
    CGPDFDrawingContextRelease();
  }
}

- (BOOL)hasPopUp
{
  p_pdfContents = &self->_pdfContents;
  BOOL String = CGPDFDictionaryGetString(self->_dictionary, "Contents", &self->_pdfContents);
  if (String) {
    LOBYTE(String) = CGPDFStringGetLength(*p_pdfContents) != 0;
  }
  return String;
}

- (const)pdfContents
{
  p_pdfContents = &self->_pdfContents;
  pdfContents = self->_pdfContents;
  if (!pdfContents)
  {
    CGPDFDictionaryGetString(self->_dictionary, "Contents", p_pdfContents);
    pdfContents = self->_pdfContents;
  }
  return (const char *)CGPDFStringGetBytePtr(pdfContents);
}

- (CGRect)popUpAnnotationRect
{
  CGPDFDictionaryRef value = 0;
  if (CGPDFDictionaryGetDictionary(self->_dictionary, "Popup", &value)
    && (CGPDFArrayRef v7 = 0, CGPDFDictionaryGetArray(value, "Rect", &v7)))
  {
    [(UIPDFAnnotation *)self rectIn:v7];
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB28];
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (id)descriptionHOLD
{
  double v3 = [(UIPDFAnnotation *)self selection];
  if (!v3)
  {
    uint64_t TextRange = 0;
    goto LABEL_6;
  }
  uint64_t TextRange = [(UIPDFSelection *)v3 CGSelection];
  if (!TextRange)
  {
LABEL_6:
    uint64_t NumberOfTextRanges = 0;
    goto LABEL_8;
  }
  uint64_t NumberOfTextRanges = CGPDFSelectionGetNumberOfTextRanges();
  if (NumberOfTextRanges >= 1)
  {
    uint64_t TextRange = CGPDFSelectionGetTextRange();
    uint64_t v7 = v6 - 1;
    goto LABEL_9;
  }
  uint64_t TextRange = 0;
LABEL_8:
  uint64_t v7 = -1;
LABEL_9:
  double v8 = [(UIPDFAnnotation *)self annotationView];
  if (v8)
  {
    [(UIView *)v8 frame];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
  }
  else
  {
    CGFloat v10 = *MEMORY[0x1E4F1DB28];
    CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  CGAffineTransform v17 = NSString;
  id v18 = [(UIPDFAnnotation *)self annotationID];
  v20.origin.CGFloat x = v10;
  v20.origin.CGFloat y = v12;
  v20.size.width = v14;
  v20.size.height = v16;
  return (id)objc_msgSend(v17, "stringWithFormat:", @"Annotation %@ Ranges: %ld Indexes (inclusive) <%ld,%ld>; view frame: %@",
               v18,
               NumberOfTextRanges,
               TextRange,
               TextRange + v7,
               NSStringFromCGRect(v20));
}

- (void)setSelection:(id)a3
{
  -[UIPDFAnnotation makeQuadpointsFrom:](self, "makeQuadpointsFrom:");
  selection = self->_selection;
  if (selection != a3) {

  }
  self->_selection = (UIPDFSelection *)a3;
}

- (UIPDFSelection)selection
{
  CGRect result = self->_selection;
  if (!result)
  {
    CGRect result = [(UIPDFAnnotation *)self newSelection];
    self->_selection = result;
  }
  return result;
}

- (UIPDFAnnotationView)annotationView
{
  return self->_annotationView;
}

- (void)setAnnotationView:(id)a3
{
}

- (UIPDFAnnotationController)annotationController
{
  return self->_annotationController;
}

- (void)setAnnotationController:(id)a3
{
  self->_annotationController = (UIPDFAnnotationController *)a3;
}

- (BOOL)editable
{
  return self->editable;
}

- (void)setEditable:(BOOL)a3
{
  self->editable = a3;
}

- (id)data
{
  return self->data;
}

- (void)setData:(id)a3
{
}

- (NSString)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_indeCGFloat x = a3;
}

- (UIPDFPopupAnnotation)popup
{
  return self->_popup;
}

- (void)setPopup:(id)a3
{
  self->_popup = (UIPDFPopupAnnotation *)a3;
}

- (NSString)associatedAnnotationID
{
  return self->_associatedAnnotationID;
}

- (void)setAssociatedAnnotationID:(id)a3
{
}

- (CALayer)drawingLayer
{
  return self->_drawingLayer;
}

- (void)setDrawingLayer:(id)a3
{
}

- (UIPDFPage)page
{
  return self->_page;
}

- (void)setPage:(id)a3
{
  self->_page = (UIPDFPage *)a3;
}

- (unint64_t)tag
{
  return self->_tag;
}

- (void)setTag:(unint64_t)a3
{
  self->_tag = a3;
}

- (id)newSelection
{
  double v3 = [(UIPDFAnnotation *)self newPathFromQuadPoints];
  if (v3)
  {
    double v4 = v3;
    [(UIPDFPage *)[(UIPDFAnnotation *)self page] CGPage];
    uint64_t v5 = CGPDFSelectionCreateInPath();
    if (v5)
    {
      uint64_t v6 = [[UIPDFSelection alloc] initWithPage:[(UIPDFAnnotation *)self page] cgSelection:v5];
      CGPathRelease(v4);
      CGPDFSelectionRelease();
      return v6;
    }
    CGPathRelease(v4);
  }
  return 0;
}

- (void)makeQuadpointsFrom:(id)a3
{
  [(NSMutableArray *)self->_quadPoints removeAllObjects];
  uint64_t v5 = [a3 numberOfRectangles];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    memset(&v26, 0, sizeof(v26));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v23 = 0u;
    do
    {
      [a3 getBounds:&v26 transform:&v23 index:v7];
      CGPoint origin = v26.origin;
      double MinX = CGRectGetMinX(v26);
      double MaxY = CGRectGetMaxY(v26);
      double MaxX = CGRectGetMaxX(v26);
      double v12 = CGRectGetMaxY(v26);
      double v13 = CGRectGetMaxX(v26);
      CGFloat MinY = CGRectGetMinY(v26);
      double v15 = *(double *)&v25 + origin.x * *(double *)&v23 + origin.y * *(double *)&v24;
      double v16 = *((double *)&v25 + 1) + origin.x * *((double *)&v23 + 1) + origin.y * *((double *)&v24 + 1);
      double v17 = *(double *)&v25 + MinX * *(double *)&v23 + MaxY * *(double *)&v24;
      double v18 = *((double *)&v25 + 1) + MinX * *((double *)&v23 + 1) + MaxY * *((double *)&v24 + 1);
      double v19 = *(double *)&v25 + MaxX * *(double *)&v23 + v12 * *(double *)&v24;
      double v20 = *((double *)&v25 + 1) + MaxX * *((double *)&v23 + 1) + v12 * *((double *)&v24 + 1);
      double v21 = *(double *)&v25 + v13 * *(double *)&v23 + MinY * *(double *)&v24;
      double v22 = *((double *)&v25 + 1) + v13 * *((double *)&v23 + 1) + MinY * *((double *)&v24 + 1);
      -[NSMutableArray addObject:](self->_quadPoints, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v17, v18));
      -[NSMutableArray addObject:](self->_quadPoints, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v19, v20));
      -[NSMutableArray addObject:](self->_quadPoints, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v15, v16));
      -[NSMutableArray addObject:](self->_quadPoints, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v21, v22));
      ++v7;
    }
    while (v6 != v7);
  }
}

- (CGPath)newPathFromQuadPoints
{
  uint64_t v3 = [(NSMutableArray *)self->_quadPoints count];
  if (!v3) {
    return 0;
  }
  unint64_t v4 = v3;
  Mutable = CGPathCreateMutable();
  for (unint64_t i = 0; i < v4; i += 4)
  {
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_quadPoints, "objectAtIndex:", i), "CGPointValue");
    double v8 = v7;
    double v10 = v9;
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_quadPoints, "objectAtIndex:", i + 1), "CGPointValue");
    double v12 = v11;
    double v14 = v13;
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_quadPoints, "objectAtIndex:", i + 2), "CGPointValue");
    double v16 = v15;
    double v18 = v17;
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_quadPoints, "objectAtIndex:", i + 3), "CGPointValue");
    float v19 = v8;
    CGFloat v20 = (float)(truncf(v19) + -1.0);
    float v21 = v10;
    CGFloat v22 = (float)(ceilf(v21) + 1.0);
    float v23 = v16;
    float v24 = v18;
    float v25 = v12;
    CGFloat v26 = (float)(ceilf(v25) + 1.0);
    float v27 = v14;
    CGFloat v28 = (float)(ceilf(v27) + 1.0);
    *(float *)&double v29 = v29;
    CGFloat v30 = (float)(ceilf(*(float *)&v29) + 1.0);
    *(float *)&double v29 = v31;
    CGFloat v32 = (float)(truncf(*(float *)&v29) + -1.0);
    CGPathMoveToPoint(Mutable, 0, (float)(truncf(v23) + -1.0), (float)(truncf(v24) + -1.0));
    CGPathAddLineToPoint(Mutable, 0, v30, v32);
    CGPathAddLineToPoint(Mutable, 0, v26, v28);
    CGPathAddLineToPoint(Mutable, 0, v20, v22);
    CGPathCloseSubpath(Mutable);
  }
  return Mutable;
}

- (BOOL)recognizeGestures
{
  return 0;
}

@end