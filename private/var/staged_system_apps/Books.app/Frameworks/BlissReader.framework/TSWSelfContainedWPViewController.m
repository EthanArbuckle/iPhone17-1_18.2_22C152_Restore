@interface TSWSelfContainedWPViewController
- (BOOL)editorAllowsCaret;
- (BOOL)editorAllowsMagnifier;
- (BOOL)isCanvasInteractive;
- (BOOL)shouldTruncateText;
- (BOOL)spellCheckingSuppressed;
- (Class)wpEditorClassOverride;
- (TSDMutableInfoGeometry)editorGeometry;
- (TSKDocumentRoot)documentRoot;
- (TSWPInteractiveCanvasController)icc;
- (TSWPStorage)storage;
- (TSWPiOSCanvasViewController)cvc;
- (TSWSelfContainedWPViewController)initWithStorage:(id)a3 fontSize:(float)a4 textColor:(id)a5;
- (TSWSelfContainedWPViewControllerDelegate)delegate;
- (double)maximumHeight;
- (double)minimumHeight;
- (void)dealloc;
- (void)interactiveCanvasControllerDidLayout:(id)a3;
- (void)layoutWithFrame:(CGRect)a3;
- (void)loadView;
- (void)overrideFontColorOfSmartFields:(id)a3;
- (void)p_alignScrollViewForHeight:(double)a3;
- (void)p_cleanup;
- (void)setCvc:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditorGeometry:(id)a3;
- (void)setIcc:(id)a3;
- (void)setMaximumHeight:(double)a3;
- (void)setMinimumHeight:(double)a3;
- (void)setParagraphAlignment:(unsigned int)a3;
- (void)setShouldTruncateText:(BOOL)a3;
@end

@implementation TSWSelfContainedWPViewController

- (TSWSelfContainedWPViewController)initWithStorage:(id)a3 fontSize:(float)a4 textColor:(id)a5
{
  v24.receiver = self;
  v24.super_class = (Class)TSWSelfContainedWPViewController;
  v8 = [(TSWSelfContainedWPViewController *)&v24 initWithNibName:0 bundle:0];
  if (v8)
  {
    v9 = [a3 copyWithContext:[a3 context]];
    v8->mStorage = v9;
    double v10 = a4;
    id v11 = [objc_alloc((Class)TSSPropertyMap) initWithPropertiesAndValues:17, *(void *)&v10, 18, [TSUColor colorWithUIColor:](TSUColor, "colorWithUIColor:", a5), 102, 0, 87, 0, 88, 0, 85, [objc_alloc((Class)TSWPLineSpacing) initWithMode:amount:](objc_alloc((Class)TSWPLineSpacing), "initWithMode:amount:", 0, 1.0), 104, 0, 98, [UIColor clearColor](UIColor, "clearColor"), 0];
    id v12 = [objc_alloc((Class)TSSPropertyMap) initWithPropertiesAndValues:17, *(void *)&v10, 18, +[TSUColor colorWithUIColor:](TSUColor, "colorWithUIColor:", a5), 0];
    [a3 range];
    if (v13)
    {
      unint64_t v14 = 0;
      do
      {
        uint64_t v22 = v14;
        uint64_t v23 = 0;
        id v15 = [a3 paragraphStyleAtCharIndex:v14 effectiveRange:&v22];
        id v16 = objc_msgSend(objc_msgSend(v15, "stylesheet"), "variationOfStyle:propertyMap:", v15, v11);
        -[TSWPStorage setParagraphStyle:forCharRange:undoTransaction:](v9, "setParagraphStyle:forCharRange:undoTransaction:", v16, v22, v23, 0);
        v14 += v23;
        [a3 range];
      }
      while (v14 < v17);
    }
    id v18 = [(TSWPStorage *)v9 range];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_4EC38;
    v21[3] = &unk_457A60;
    v21[4] = v12;
    v21[5] = v9;
    -[TSWPStorage enumerateWithAttributeKind:inRange:usingBlock:](v9, "enumerateWithAttributeKind:inRange:usingBlock:", 3, v18, v19, v21);
  }
  return v8;
}

- (void)loadView
{
  id v3 = objc_alloc_init((Class)TSWPInteractiveCanvasController);
  [v3 setDelegate:self];
  [(TSWSelfContainedWPViewController *)self setIcc:v3];
  id v4 = objc_alloc_init((Class)TSWPiOSCanvasViewController);
  [v3 setLayerHost:v4];
  [v4 setInteractiveCanvasController:v3];
  objc_msgSend(objc_msgSend(v4, "canvasView"), "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(objc_msgSend(v4, "canvasView"), "setClipsToBounds:", 0);
  [(TSWSelfContainedWPViewController *)self setCvc:v4];

  id v5 = objc_alloc((Class)TSKScrollView);
  objc_msgSend(objc_msgSend(v4, "canvasView"), "bounds");
  id v6 = [v5 initWithFrame:];
  [v6 setUserInteractionEnabled:0];
  [v6 addSubview:[-[TSWSelfContainedWPViewController cvc](self, "cvc") canvasView]];
  [(TSWSelfContainedWPViewController *)self setView:v6];
  [self view].setClipsToBounds:0;
}

- (void)p_cleanup
{
  self->mICC = 0;
  self->mCVC = 0;

  self->mEditorGeometry = 0;
}

- (void)dealloc
{
  [(TSWSelfContainedWPViewController *)self p_cleanup];

  self->mStorage = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWSelfContainedWPViewController;
  [(TSWSelfContainedWPViewController *)&v3 dealloc];
}

- (void)overrideFontColorOfSmartFields:(id)a3
{
  id v5 = [(TSWSelfContainedWPViewController *)self storage];
  id v6 = [(TSWPStorage *)[(TSWSelfContainedWPViewController *)self storage] range];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_4EF64;
  v8[3] = &unk_457A88;
  v8[4] = a3;
  -[TSWPStorage enumerateWithAttributeKind:inRange:usingBlock:](v5, "enumerateWithAttributeKind:inRange:usingBlock:", 3, v6, v7, v8);
}

- (void)layoutWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  [self.view setFrame:CGRectMake(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height)];
  if (![(TSWSelfContainedWPViewController *)self editorGeometry])
  {
    id v6 = [objc_alloc((Class)TSDMutableInfoGeometry) initWithPosition:1, -[TSWSelfContainedWPViewController shouldTruncateText](self, "shouldTruncateText"), 0, 0, 0.0, 0.0, width, height, 0.0];
    [(TSWSelfContainedWPViewController *)self setEditorGeometry:v6];

    id v7 = +[TSWPShapeStyle defaultStyleWithContext:[(TSWPStorage *)[(TSWSelfContainedWPViewController *)self storage] context]];
    [v7 setValue:[TSDStroke emptyStroke] forProperty:517];
    id v8 = [objc_alloc((Class)TSWPShapeInfo) initWithContext:[-[TSWSelfContainedWPViewController storage](self, "storage") context] geometry:v6 style:v7 wpStorage:[-[TSWSelfContainedWPViewController storage](self, "storage")]];
    [v8 setAllowsLastLineTruncation:[self shouldTruncateText]];
    [v8 setTextUserEditable:0];
    [(TSWPInteractiveCanvasController *)[(TSWSelfContainedWPViewController *)self icc] setInfosToDisplay:+[NSArray arrayWithObject:v8]];
  }
  objc_msgSend(objc_msgSend(-[TSWPInteractiveCanvasController canvasView](-[TSWSelfContainedWPViewController icc](self, "icc"), "canvasView"), "canvasLayer"), "unscaledSize");
  objc_msgSend(objc_msgSend(-[TSWPInteractiveCanvasController canvasView](-[TSWSelfContainedWPViewController icc](self, "icc"), "canvasView"), "canvasLayer"), "setUnscaledSize:", width, height);
  [(-[TSWSelfContainedWPViewController icc](self, "icc"), "canvas") setUnscaledSize:width, height];
  -[TSDMutableInfoGeometry setSize:]([(TSWSelfContainedWPViewController *)self editorGeometry], "setSize:", width, height);
  id v9 = [[-[TSWSelfContainedWPViewController icc](self, "icc") repForInfo:[-[TSWSelfContainedWPViewController storage](self, "storage")] layout] parent];

  [v9 invalidateSize];
}

- (void)setParagraphAlignment:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(TSWPStorage *)[(TSWSelfContainedWPViewController *)self storage] paragraphStyleAtCharIndex:0 effectiveRange:0];
  id v10 = [objc_alloc((Class)TSSPropertyMap) initWithPropertiesAndValues:86, v3, 0];
  id v6 = objc_msgSend(objc_msgSend(v5, "stylesheet"), "variationOfStyle:propertyMap:", v5, v10);
  id v7 = [(TSWSelfContainedWPViewController *)self storage];
  id v8 = [(TSWPStorage *)[(TSWSelfContainedWPViewController *)self storage] range];
  -[TSWPStorage setParagraphStyle:forCharRange:undoTransaction:](v7, "setParagraphStyle:forCharRange:undoTransaction:", v6, v8, v9, 0);
}

- (void)p_alignScrollViewForHeight:(double)a3
{
  [self view].frame
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(TSWSelfContainedWPViewController *)self maximumHeight];
  if (v11 != 0.0)
  {
    [(TSWSelfContainedWPViewController *)self maximumHeight];
    *(float *)&double v12 = v12;
    float v13 = a3;
    a3 = fminf(fminf(*(float *)&v12, INFINITY), v13);
  }
  -[TSWSelfContainedWPViewControllerDelegate selfContainedWPViewController:didChangeSize:]([(TSWSelfContainedWPViewController *)self delegate], "selfContainedWPViewController:didChangeSize:", self, v10, a3);
  id v14 = [(TSWSelfContainedWPViewController *)self view];

  [v14 setFrame:v6, v8, v10, a3];
}

- (TSKDocumentRoot)documentRoot
{
  id v2 = [(TSWPStorage *)self->mStorage context];

  return (TSKDocumentRoot *)[v2 documentRoot];
}

- (BOOL)isCanvasInteractive
{
  return 1;
}

- (void)interactiveCanvasControllerDidLayout:(id)a3
{
  [self view:a3].frame;
  double v5 = v4;
  [(-[TSWSelfContainedWPViewController icc](self, "icc")) layoutController rectOfTopLevelLayouts];
  double v7 = v6;
  if (v6 != self->mLastLayoutHeight || v5 != self->mLastLayoutWidth)
  {
    objc_msgSend(objc_msgSend(-[TSWPInteractiveCanvasController canvasView](-[TSWSelfContainedWPViewController icc](self, "icc"), "canvasView"), "canvasLayer"), "setUnscaledSize:", v5 + -2.0, v6);
    [(-[TSWSelfContainedWPViewController icc](self, "icc"), "canvas") setUnscaledSize:v5 + -2.0, v7];
    [(TSWSelfContainedWPViewController *)self minimumHeight];
    *(float *)&double v8 = v8;
    -[TSDMutableInfoGeometry setSize:]([(TSWSelfContainedWPViewController *)self editorGeometry], "setSize:", v5 + -2.0, fmaxf(*(float *)&v8, 20.0));
    if (v5 != self->mLastLayoutWidth) {
      objc_msgSend(objc_msgSend(objc_msgSend(-[TSWPInteractiveCanvasController repForInfo:](-[TSWSelfContainedWPViewController icc](self, "icc"), "repForInfo:", -[TSWSelfContainedWPViewController storage](self, "storage")), "layout"), "parent"), "invalidateSize");
    }
    [(TSWSelfContainedWPViewController *)self p_alignScrollViewForHeight:v7];
    self->mLastLayoutHeight = v7;
    self->mLastLayoutWidth = v5;
  }
}

- (BOOL)spellCheckingSuppressed
{
  return 1;
}

- (BOOL)editorAllowsMagnifier
{
  return 0;
}

- (BOOL)editorAllowsCaret
{
  return 0;
}

- (Class)wpEditorClassOverride
{
  return (Class)objc_opt_class();
}

- (TSWPInteractiveCanvasController)icc
{
  return self->mICC;
}

- (void)setIcc:(id)a3
{
}

- (TSWPiOSCanvasViewController)cvc
{
  return self->mCVC;
}

- (void)setCvc:(id)a3
{
}

- (TSDMutableInfoGeometry)editorGeometry
{
  return self->mEditorGeometry;
}

- (void)setEditorGeometry:(id)a3
{
}

- (TSWSelfContainedWPViewControllerDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (TSWSelfContainedWPViewControllerDelegate *)a3;
}

- (double)minimumHeight
{
  return self->mMinimumHeight;
}

- (void)setMinimumHeight:(double)a3
{
  self->mMinimumHeight = a3;
}

- (double)maximumHeight
{
  return self->mMaximumHeight;
}

- (void)setMaximumHeight:(double)a3
{
  self->mMaximumHeight = a3;
}

- (TSWPStorage)storage
{
  return self->mStorage;
}

- (BOOL)shouldTruncateText
{
  return self->mShouldTruncateText;
}

- (void)setShouldTruncateText:(BOOL)a3
{
  self->mShouldTruncateText = a3;
}

@end