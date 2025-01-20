@interface UIPDFSelection
- ($0AC6E346AE4835514AAA8AC86D8F4844)extent;
- ($0AC6E346AE4835514AAA8AC86D8F4844)stringRange;
- ($88E5F8DBFD3EF82B558D000E19B2526A)rectangleAtIndex:(SEL)a3 scale:(unint64_t)a4 inset:(double)a5;
- (BOOL)getBounds:(CGRect *)a3 transform:(CGAffineTransform *)a4 index:(unint64_t)a5;
- (BOOL)isEmpty;
- (BOOL)isNonEmpty;
- (BOOL)isWord;
- (CGAffineTransform)transform;
- (CGPDFSelection)CGSelection;
- (CGRect)bounds;
- (UIPDFSelection)init;
- (UIPDFSelection)initWithPage:(id)a3 cgSelection:(CGPDFSelection *)a4;
- (UIPDFSelection)initWithPage:(id)a3 fromArchive:(id)a4;
- (UIPDFSelection)initWithPage:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5;
- (UIPDFSelection)initWithSelection:(id)a3;
- (double)baseLineAtIndex:(unint64_t)a3;
- (id)archive;
- (id)attributedStringAtIndex:(unint64_t)a3;
- (id)containingTextLine;
- (id)description;
- (id)htmlAtIndex:(unint64_t)a3;
- (id)page;
- (id)selectionExtendedToLineBoundaries;
- (id)string;
- (id)textAtIndex:(unint64_t)a3;
- (unint64_t)endIndex;
- (unint64_t)extendAtEnd:(unint64_t)a3;
- (unint64_t)extendAtStart:(unint64_t)a3;
- (unint64_t)numberOfRectangles;
- (unint64_t)startIndex;
- (void)copyToPasteboard;
- (void)dealloc;
- (void)extendToParagraph;
- (void)setStringRange:(id)a3;
@end

@implementation UIPDFSelection

- (UIPDFSelection)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIPDFSelection;
  result = [(UIPDFSelection *)&v3 init];
  if (result)
  {
    result->_dirty = 0;
    result->_cachedStartIndex = -1;
    result->_cachedEndIndex = -1;
    result->_string = 0;
    result->_cgSelection = 0;
  }
  return result;
}

- (UIPDFSelection)initWithPage:(id)a3 fromArchive:(id)a4
{
  v6 = [(UIPDFSelection *)self init];
  if (v6)
  {
    v6->_page = (UIPDFPage *)a3;
    uint64_t v7 = [a4 dataUsingEncoding:4];
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F29250]) initWithData:v7];
    v9 = objc_alloc_init(UIPDFParserDelegate);
    [v8 setDelegate:v9];
    [v8 parse];
    if ([(UIPDFParserDelegate *)v9 parserError]) {
      MutableCopy = 0;
    }
    else {
      MutableCopy = CGPathCreateMutableCopy([(UIPDFParserDelegate *)v9 path]);
    }

    if (MutableCopy)
    {
      [a3 CGPage];
      v6->_cgSelection = (CGPDFSelection *)CGPDFSelectionCreateInPath();
      CGPathRelease(MutableCopy);
    }
  }
  return v6;
}

- (UIPDFSelection)initWithSelection:(id)a3
{
  v4 = [(UIPDFSelection *)self init];
  if (v4)
  {
    v4->_page = (UIPDFPage *)(id)[a3 page];
    [a3 CGSelection];
    v4->_cgSelection = (CGPDFSelection *)CGPDFSelectionCreateFromSelection();
  }
  return v4;
}

- (UIPDFSelection)initWithPage:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  v6 = [(UIPDFSelection *)self init];
  if (v6)
  {
    v6->_page = (UIPDFPage *)a3;
    [a3 CGPage];
    v6->_cgSelection = (CGPDFSelection *)CGPDFSelectionCreateForRange();
  }
  return v6;
}

- (id)page
{
  return self->_page;
}

- (CGAffineTransform)transform
{
  result = (CGAffineTransform *)self->_cgSelection;
  if (!result || (result = (CGAffineTransform *)CGPDFSelectionGetNumberOfRectsAndTransforms(), (uint64_t)result < 1))
  {
LABEL_8:
    uint64_t v9 = MEMORY[0x1E4F1DAB8];
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v10;
    long long v8 = *(_OWORD *)(v9 + 32);
    goto LABEL_9;
  }
  v5 = result;
  memset(&v13[1], 0, sizeof(CGAffineTransform));
  result = (CGAffineTransform *)CGPDFSelectionGetRectAndTransform();
  if (v5 != (CGAffineTransform *)1)
  {
    uint64_t v6 = 1;
    do
    {
      memset(v13, 0, 48);
      CGPDFSelectionGetRectAndTransform();
      CGAffineTransform t1 = v13[1];
      CGAffineTransform v11 = v13[0];
      result = (CGAffineTransform *)CGAffineTransformEqualToTransform(&t1, &v11);
      if ((result & 1) == 0) {
        goto LABEL_8;
      }
    }
    while (v5 != (CGAffineTransform *)++v6);
  }
  long long v7 = *(_OWORD *)&v13[1].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v13[1].a;
  *(_OWORD *)&retstr->c = v7;
  long long v8 = *(_OWORD *)&v13[1].tx;
LABEL_9:
  *(_OWORD *)&retstr->tx = v8;
  return result;
}

- (CGRect)bounds
{
  if (self->_cgSelection)
  {
    uint64_t NumberOfRectsAndTransforms = CGPDFSelectionGetNumberOfRectsAndTransforms();
    CGFloat v4 = *MEMORY[0x1E4F1DB20];
    CGFloat v5 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    [(UIPDFSelection *)self transform];
    BOOL IsIdentity = CGAffineTransformIsIdentity(&v20);
    if (NumberOfRectsAndTransforms >= 1)
    {
      BOOL v9 = IsIdentity;
      for (uint64_t i = 0; i != NumberOfRectsAndTransforms; ++i)
      {
        memset(&v19[48], 0, 80);
        CGPDFSelectionGetRectAndTransform();
        CGFloat y = *(double *)&v19[104];
        CGFloat x = *(double *)&v19[96];
        CGFloat height = *(double *)&v19[120];
        CGFloat width = *(double *)&v19[112];
        if (v9)
        {
          *(CGAffineTransform *)v19 = *(CGAffineTransform *)&v19[48];
          CGRect v21 = CGRectApplyAffineTransform(*(CGRect *)&v19[96], (CGAffineTransform *)v19);
          CGFloat x = v21.origin.x;
          CGFloat y = v21.origin.y;
          CGFloat width = v21.size.width;
          CGFloat height = v21.size.height;
          *(CGRect *)&v19[96] = v21;
        }
        v22.origin.CGFloat x = v4;
        v22.origin.CGFloat y = v5;
        v22.size.CGFloat width = v6;
        v22.size.CGFloat height = v7;
        CGRect v23 = CGRectUnion(v22, *(CGRect *)&x);
        CGFloat v4 = v23.origin.x;
        CGFloat v5 = v23.origin.y;
        CGFloat v6 = v23.size.width;
        CGFloat v7 = v23.size.height;
      }
    }
  }
  else
  {
    CGFloat v4 = *MEMORY[0x1E4F1DB20];
    CGFloat v5 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v15 = v4;
  double v16 = v5;
  double v17 = v6;
  double v18 = v7;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (id)string
{
  dirtCGFloat y = self->_dirty;
  id result = self->_string;
  if (dirty)
  {
    if (result)
    {
      CFRelease(result);
      self->_string = 0;
    }
  }
  else if (result)
  {
    goto LABEL_7;
  }
  id result = self->_cgSelection;
  if (result)
  {
    id result = (id)CGPDFSelectionCreateString();
    self->_string = (__CFString *)result;
  }
LABEL_7:
  self->_dirtCGFloat y = 0;
  return result;
}

- (id)attributedStringAtIndex:(unint64_t)a3
{
  CGPDFSelectionGetRangeForRectIndex();
  if (!v3) {
    return 0;
  }
  CGPDFSelectionGetPage();
  CGPDFSelectionCreateForRange();
  AttributedString = (void *)CGPDFSelectionCreateAttributedString();
  CGPDFSelectionRelease();
  return AttributedString;
}

- (BOOL)isEmpty
{
  if (self->_cgSelection) {
    return CGPDFSelectionIsEmpty();
  }
  else {
    return 1;
  }
}

- (BOOL)isNonEmpty
{
  cgSelection = self->_cgSelection;
  if (cgSelection) {
    LOBYTE(cgSelection) = CGPDFSelectionIsEmpty() ^ 1;
  }
  return (char)cgSelection;
}

- (id)selectionExtendedToLineBoundaries
{
  if (!self->_cgSelection) {
    return 0;
  }
  CFArrayRef SelectionsByLine = (const __CFArray *)CGPDFSelectionCreateSelectionsByLine();
  if (!SelectionsByLine) {
    return 0;
  }
  CFArrayRef v4 = SelectionsByLine;
  CFIndex Count = CFArrayGetCount(SelectionsByLine);
  if (!Count
    || (CFIndex v6 = Count,
        ValueAtIndeCGFloat x = CFArrayGetValueAtIndex(v4, 0),
        long long v8 = CFArrayGetValueAtIndex(v4, v6 - 1),
        !ValueAtIndex)
    || !v8
    || !CGPDFSelectionCreateContainingSelection())
  {
LABEL_12:
    CFRelease(v4);
    return 0;
  }
  if (!CGPDFSelectionCreateContainingSelection())
  {
    CGPDFSelectionRelease();
    goto LABEL_12;
  }
  objc_msgSend(-[UIPDFSelection page](self, "page"), "CGPage");
  CGPDFSelectionGetTextRange();
  if (CGPDFSelectionGetNumberOfTextRanges() >= 1
    && (CGPDFSelectionGetTextRange(), (uint64_t v9 = CGPDFSelectionCreateForRange()) != 0))
  {
    long long v10 = [[UIPDFSelection alloc] initWithPage:[(UIPDFSelection *)self page] cgSelection:v9];
    CGPDFSelectionRelease();
  }
  else
  {
    long long v10 = 0;
  }
  CGPDFSelectionRelease();
  CGPDFSelectionRelease();
  CFRelease(v4);
  return v10;
}

- (id)containingTextLine
{
  id result = self->_cgSelection;
  if (result)
  {
    uint64_t ContainingSelection = CGPDFSelectionCreateContainingSelection();
    if (ContainingSelection)
    {
      CGFloat v5 = [[UIPDFSelection alloc] initWithPage:[(UIPDFSelection *)self page] cgSelection:ContainingSelection];
      CGPDFSelectionRelease();
    }
    else
    {
      CGFloat v5 = 0;
    }
    return v5;
  }
  return result;
}

- (BOOL)isWord
{
  cgSelection = self->_cgSelection;
  if (cgSelection) {
    LOBYTE(cgSelection) = MEMORY[0x1F40DAF28](cgSelection, a2);
  }
  return (char)cgSelection;
}

- (unint64_t)numberOfRectangles
{
  unint64_t result = (unint64_t)self->_cgSelection;
  if (result) {
    return CGPDFSelectionGetNumberOfRectsAndTransforms();
  }
  return result;
}

- (BOOL)getBounds:(CGRect *)a3 transform:(CGAffineTransform *)a4 index:(unint64_t)a5
{
  cgSelection = self->_cgSelection;
  if (cgSelection)
  {
    LOBYTE(cgSelection) = CGPDFSelectionGetRectAndTransform();
  }
  else
  {
    CGSize v6 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    a3->origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    a3->size = v6;
    uint64_t v7 = MEMORY[0x1E4F1DAB8];
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&a4->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&a4->c = v8;
    *(_OWORD *)&a4->tCGFloat x = *(_OWORD *)(v7 + 32);
  }
  return (char)cgSelection;
}

- (id)textAtIndex:(unint64_t)a3
{
  CGPDFSelectionGetRangeForRectIndex();
  if (v3)
  {
    CGPDFSelectionGetPage();
    CGPDFSelectionCreateForStringRange();
    CGPDFArchiveCreate();
    CGPDFArchiveAddSelection();
    PlainText = (void *)CGPDFArchiveGetPlainText();
    id v5 = PlainText;
    CGPDFArchiveRelease();
    CGPDFSelectionRelease();
    return PlainText;
  }
  else
  {
    uint64_t v7 = NSString;
    return (id)[v7 string];
  }
}

- (id)htmlAtIndex:(unint64_t)a3
{
  CGPDFSelectionGetRangeForRectIndex();
  if (v3)
  {
    CGPDFSelectionGetPage();
    CGPDFSelectionCreateForRange();
    CGPDFArchiveCreate();
    CGPDFArchiveAddSelection();
    HTML = (void *)CGPDFArchiveGetHTML();
    id v5 = HTML;
    CGPDFArchiveRelease();
    CGPDFSelectionRelease();
    return HTML;
  }
  else
  {
    uint64_t v7 = NSString;
    return (id)[v7 string];
  }
}

- ($88E5F8DBFD3EF82B558D000E19B2526A)rectangleAtIndex:(SEL)a3 scale:(unint64_t)a4 inset:(double)a5
{
  retstr->var2 = 0u;
  retstr->var3 = 0u;
  retstr->var0 = 0u;
  retstr->var1 = 0u;
  unint64_t result = [(UIPDFSelection *)self numberOfRectangles];
  if ((unint64_t)result > a4)
  {
    memset(&v38, 0, sizeof(v38));
    memset(&v37, 0, sizeof(v37));
    [(UIPDFSelection *)self getBounds:&v38 transform:&v37 index:a4];
    CGRect v38 = CGRectInset(v38, -1.0, -1.0);
    double MidX = CGRectGetMidX(v38);
    CGFloat MidY = CGRectGetMidY(v38);
    double v14 = v37.tx + MidX * v37.a + MidY * v37.c;
    double v15 = v37.ty + MidX * v37.b + MidY * v37.d;
    memset(&v36, 0, sizeof(v36));
    CGAffineTransformMakeScale(&v36, a5, a5);
    CGAffineTransform v35 = v36;
    CGRect v39 = CGRectApplyAffineTransform(v38, &v35);
    double x = v39.origin.x;
    double y = v39.origin.y;
    CGFloat width = v39.size.width;
    CGFloat height = v39.size.height;
    if (a6 != 0.0)
    {
      CGRect v40 = CGRectInset(v39, a6, a6);
      double x = v40.origin.x;
      double y = v40.origin.y;
      CGFloat width = v40.size.width;
      CGFloat height = v40.size.height;
    }
    v41.origin.double x = x;
    v41.origin.double y = y;
    v41.size.CGFloat width = width;
    v41.size.CGFloat height = height;
    double v20 = CGRectGetMidX(v41);
    v42.origin.double x = x;
    v42.origin.double y = y;
    v42.size.CGFloat width = width;
    v42.size.CGFloat height = height;
    CGFloat v21 = CGRectGetMidY(v42);
    CGFloat v30 = v37.ty + v20 * v37.b + v21 * v37.d - v15;
    CGFloat v31 = v37.tx + v20 * v37.a + v21 * v37.c - v14;
    retstr->var0.double x = x;
    retstr->var0.double y = y;
    v43.origin.double x = x;
    v43.origin.double y = y;
    v43.size.CGFloat width = width;
    v43.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v43);
    v44.origin.double x = x;
    v44.origin.double y = y;
    v44.size.CGFloat width = width;
    v44.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v44);
    retstr->var1.double x = MinX;
    retstr->var1.double y = MaxY;
    v45.origin.double x = x;
    v45.origin.double y = y;
    v45.size.CGFloat width = width;
    v45.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v45);
    v46.origin.double x = x;
    v46.origin.double y = y;
    v46.size.CGFloat width = width;
    v46.size.CGFloat height = height;
    double v25 = CGRectGetMaxY(v46);
    retstr->var2.double x = MaxX;
    retstr->var2.double y = v25;
    v47.origin.double x = x;
    v47.origin.double y = y;
    v47.size.CGFloat width = width;
    v47.size.CGFloat height = height;
    double v32 = CGRectGetMaxX(v47);
    v48.origin.double x = x;
    v48.origin.double y = y;
    v48.size.CGFloat width = width;
    v48.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v48);
    CGAffineTransformMakeTranslation(&t2, -v31, -v30);
    CGAffineTransform t1 = v37;
    unint64_t result = ($88E5F8DBFD3EF82B558D000E19B2526A *)CGAffineTransformConcat(&v35, &t1, &t2);
    long long v27 = *(_OWORD *)&v35.a;
    long long v28 = *(_OWORD *)&v35.c;
    long long v29 = *(_OWORD *)&v35.tx;
    retstr->var0.double x = v35.tx + x * v35.a + y * v35.c;
    retstr->var0.double y = *((double *)&v29 + 1) + x * *((double *)&v27 + 1) + y * *((double *)&v28 + 1);
    retstr->var1.double x = *(double *)&v29 + MinX * *(double *)&v27 + MaxY * *(double *)&v28;
    retstr->var1.double y = *((double *)&v29 + 1) + MinX * *((double *)&v27 + 1) + MaxY * *((double *)&v28 + 1);
    retstr->var2.double x = *(double *)&v29 + MaxX * *(double *)&v27 + v25 * *(double *)&v28;
    retstr->var2.double y = *((double *)&v29 + 1) + MaxX * *((double *)&v27 + 1) + v25 * *((double *)&v28 + 1);
    retstr->var3.double x = *(double *)&v29 + v32 * *(double *)&v27 + MinY * *(double *)&v28;
    retstr->var3.double y = *((double *)&v29 + 1) + v32 * *((double *)&v27 + 1) + MinY * *((double *)&v28 + 1);
  }
  return result;
}

- (id)archive
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  CFArrayRef v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"<UIPDFSelection pageIndex=\"%lu\" count=\"%lu\">", objc_msgSend(-[UIPDFSelection page](self, "page"), "pageIndex"), -[UIPDFSelection numberOfRectangles](self, "numberOfRectangles"));
  [v3 appendString:v4];

  if ([(UIPDFSelection *)self numberOfRectangles])
  {
    unint64_t v5 = 0;
    do
    {
      if (self) {
        [(UIPDFSelection *)self rectangleAtIndex:v5 scale:1.0 inset:-1.0];
      }
      CGSize v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"<Rectangle><Point id=\"bottomLeft\" x=\"%g\" y=\"%g\"/><Point id=\"topLeft\" x=\"%g\" y=\"%g\"/><Point id=\"topRight\" x=\"%g\" y=\"%g\"/><Point id=\"bottomRight\" x=\"%g\" y=\"%g\"/></Rectangle>", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0);
      [v3 appendString:v6];

      ++v5;
    }
    while (v5 < [(UIPDFSelection *)self numberOfRectangles]);
  }
  [v3 appendString:@"</UIPDFSelection>"];
  return v3;
}

- (unint64_t)extendAtStart:(unint64_t)a3
{
  self->_dirtdouble y = 1;
  self->_cachedStartIndedouble x = -1;
  self->_cachedEndIndedouble x = -1;
  return MEMORY[0x1F40DAE78](self->_cgSelection, a3);
}

- (unint64_t)extendAtEnd:(unint64_t)a3
{
  self->_dirtdouble y = 1;
  self->_cachedStartIndedouble x = -1;
  self->_cachedEndIndedouble x = -1;
  return MEMORY[0x1F40DAE70](self->_cgSelection, a3);
}

- (void)copyToPasteboard
{
  CGPDFArchiveCreate();
  CGPDFArchiveAddSelection();
  uint64_t PlainText = CGPDFArchiveGetPlainText();
  WebArchiveData = (void *)CGPDFArchiveGetWebArchiveData();
  if (WebArchiveData)
  {
    CFArrayRef v4 = WebArchiveData;
    if ([WebArchiveData length]) {
      [+[UIPasteboard generalPasteboard] setValue:v4 forPasteboardType:@"Apple Web Archive pasteboard type"];
    }
  }
  if (PlainText) {
    [+[UIPasteboard generalPasteboard] setString:PlainText];
  }
  CGPDFArchiveRelease();
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)extent
{
  FirstIndedouble x = CGPDFSelectionGetFirstIndex();
  LastIndedouble x = CGPDFSelectionGetLastIndex();
  BOOL v4 = FirstIndex == -1 || LastIndex == -1;
  if (v4) {
    int64_t v5 = 0;
  }
  else {
    int64_t v5 = LastIndex - FirstIndex + 1;
  }
  if (v4) {
    int64_t v6 = 0;
  }
  else {
    int64_t v6 = FirstIndex;
  }
  result.var1 = v5;
  result.var0 = v6;
  return result;
}

- (double)baseLineAtIndex:(unint64_t)a3
{
  [(UIPDFPage *)self->_page CGPage];
  CGPDFPageGetLayout();
  CGPDFLayoutGetRootNode();
  CGPDFSelectionGetRangeForRectIndex();
  uint64_t NodeContainingTextRange = CGPDFNodeGetNodeContainingTextRange();
  MEMORY[0x1F40DAD48](NodeContainingTextRange);
  return result;
}

- (unint64_t)startIndex
{
  if (!self->_cgSelection) {
    return 0;
  }
  unint64_t result = self->_cachedStartIndex;
  if (result == -1)
  {
    unint64_t result = CGPDFSelectionGetStartIndex();
    self->_cachedStartIndedouble x = result;
  }
  return result;
}

- (unint64_t)endIndex
{
  if (!self->_cgSelection) {
    return 0;
  }
  unint64_t result = self->_cachedEndIndex;
  if (result == -1)
  {
    unint64_t result = CGPDFSelectionGetEndIndex();
    self->_cachedEndIndedouble x = result;
  }
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)stringRange
{
  int64_t length = self->stringRange.length;
  int64_t location = self->stringRange.location;
  result.var1 = length;
  result.var0 = location;
  return result;
}

- (void)setStringRange:(id)a3
{
  self->stringRange = ($5CFEE62CA76FAE445C6F9DBCEE669C70)a3;
}

- (UIPDFSelection)initWithPage:(id)a3 cgSelection:(CGPDFSelection *)a4
{
  int64_t v5 = [(UIPDFSelection *)self init];
  if (v5)
  {
    v5->_page = (UIPDFPage *)a3;
    v5->_cgSelection = (CGPDFSelection *)CGPDFSelectionRetain();
  }
  return v5;
}

- (void)dealloc
{
  string = self->_string;
  if (string) {
    CFRelease(string);
  }
  CGPDFSelectionRelease();

  v4.receiver = self;
  v4.super_class = (Class)UIPDFSelection;
  [(UIPDFSelection *)&v4 dealloc];
}

- (CGPDFSelection)CGSelection
{
  return self->_cgSelection;
}

- (void)extendToParagraph
{
  if (self->_cgSelection)
  {
    uint64_t ContainingSelection = CGPDFSelectionCreateContainingSelection();
    if (ContainingSelection)
    {
      objc_super v4 = (CGPDFSelection *)ContainingSelection;
      CGPDFSelectionRelease();
      self->_cgSelection = v4;
    }
  }
}

- (id)description
{
  uint64_t NumberOfTextRanges = CGPDFSelectionGetNumberOfTextRanges();
  if (!NumberOfTextRanges) {
    return @"[]";
  }
  uint64_t v3 = NumberOfTextRanges;
  uint64_t TextRange = CGPDFSelectionGetTextRange();
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"[%ld:%ld,%ld]", v3, TextRange, v5);
}

@end