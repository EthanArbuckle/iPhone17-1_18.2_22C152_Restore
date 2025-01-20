@interface SXTextView
- (BOOL)isAccessibilityElement;
- (BOOL)isSelectable;
- (BOOL)mightBeVisuallyMisplaced;
- (BOOL)shouldHyphenate;
- (CALayer)overlayContainerLayer;
- (CALayer)repContainerLayer;
- (CGRect)frameInCanvas;
- (CGRect)parentFrame;
- (NSString)description;
- (SXTextLayouter)textLayouter;
- (SXTextSource)textSource;
- (SXTextTangierContainerInfo)textInfo;
- (SXTextTangierRepAccessibilityElement)rep;
- (SXTextView)initWithCoder:(id)a3;
- (SXTextView)initWithFrame:(CGRect)a3;
- (SXTextViewDelegate)delegate;
- (TSDCanvas)canvas;
- (TSDLayoutController)layoutController;
- (id)accessibilityCustomRotorMembershipForRep:(id)a3;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)infoGeometry;
- (int64_t)accessibilityContainerType;
- (void)_updateOverlayTransform;
- (void)directLayerHostRemoveIfMatchingContainerLayer:(id)a3 forRep:(id)a4;
- (void)directLayerHostUpdateOverlayLayers:(id)a3 forRep:(id)a4;
- (void)directLayerHostUpdateWithContainerLayer:(id)a3 forRep:(id)a4;
- (void)directLayerhostUpdateTopLevelTilingLayers:(id)a3 forRep:(id)a4;
- (void)invalidate;
- (void)provideInfosLayoutTo:(id)a3;
- (void)setCanvas:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setFrameInCanvas:(CGRect)a3;
- (void)setIsSelectable:(BOOL)a3;
- (void)setMightBeVisuallyMisplaced:(BOOL)a3;
- (void)setOverlayContainerLayer:(id)a3;
- (void)setParentFrame:(CGRect)a3;
- (void)setRep:(id)a3;
- (void)setRepContainerLayer:(id)a3;
- (void)setShouldHyphenate:(BOOL)a3;
- (void)setTextLayouter:(id)a3;
@end

@implementation SXTextView

- (SXTextView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SXTextView;
  v3 = -[SXTextView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] clearColor];
    [(SXTextView *)v3 setBackgroundColor:v4];

    [(SXTextView *)v3 setIsSelectable:1];
  }
  return v3;
}

- (SXTextView)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SXTextView;
  v5 = [(SXTextView *)&v8 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [MEMORY[0x263F1C550] clearColor];
    [(SXTextView *)v5 setBackgroundColor:v6];

    [(SXTextView *)v5 setIsSelectable:1];
  }

  return v5;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(SXTextView *)self mightBeVisuallyMisplaced])
  {
    objc_super v8 = [(SXTextView *)self rep];
    int v9 = [v8 updateFromVisualPosition];

    if (v9)
    {
      v10 = [(SXTextView *)self rep];
      v11 = [v10 icc];
      [v11 invalidateLayers];
    }
  }
  if (-[SXTextView pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    v12 = [(SXTextView *)self canvas];
    v13 = [v12 canvasController];
    v14 = [v13 canvasView];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)invalidate
{
  id v6 = [(SXTextView *)self infoGeometry];
  v3 = [(SXTextView *)self textInfo];
  [v3 setGeometry:v6];

  id v7 = [(SXTextView *)self layoutController];
  id v4 = [(SXTextView *)self textInfo];
  v5 = [v7 layoutForInfo:v4];
  [v5 invalidate];
}

- (void)directLayerHostRemoveIfMatchingContainerLayer:(id)a3 forRep:(id)a4
{
  id v6 = a4;
  if (self->_repContainerLayer == a3) {
    [(SXTextView *)self directLayerHostUpdateWithContainerLayer:0 forRep:v6];
  }
}

- (void)directLayerHostUpdateWithContainerLayer:(id)a3 forRep:(id)a4
{
  id v7 = (CALayer *)a3;
  id v8 = a4;
  [(SXTextView *)self setRep:v8];
  int v9 = [(SXTextView *)self rep];
  v10 = +[SXAXCustomRotorDefinition linksRotor]();
  v11 = +[SXAXCustomRotor rotorWithName:v10];
  [v9 setLinkRotor:v11];

  v12 = [(SXTextView *)self rep];
  v13 = +[SXAXCustomRotorDefinition headingsRotor]();
  v14 = +[SXAXCustomRotor rotorWithName:v13];
  [v12 setHeadingsRotor:v14];

  v15 = [(SXTextView *)self rep];
  [(SXTextView *)self frameInCanvas];
  objc_msgSend(v15, "setFrameInCanvas:");

  v16 = [v8 canvas];
  v17 = [v16 canvasController];
  v18 = [(SXTextView *)self rep];
  [v18 setIcc:v17];

  v19 = [v8 canvas];
  [(SXTextView *)self setCanvas:v19];

  v20 = [(SXTextView *)self rep];
  [v20 setAccessibilityDataSource:self];

  p_repContainerLayer = &self->_repContainerLayer;
  repContainerLayer = self->_repContainerLayer;
  v23 = v7;
  if (repContainerLayer != v7)
  {
    [(CALayer *)repContainerLayer removeFromSuperlayer];
    objc_storeStrong((id *)&self->_repContainerLayer, a3);
    if (!*p_repContainerLayer) {
      goto LABEL_6;
    }
    v24 = [(SXTextView *)self layer];
    [v24 insertSublayer:*p_repContainerLayer atIndex:0];

    v23 = *p_repContainerLayer;
  }
  if (v23)
  {
    [(SXTextView *)self frameInCanvas];
    memset(&v29, 0, sizeof(v29));
    CATransform3DMakeTranslation(&v29, -v25, -v26, 0.0);
    CATransform3D v28 = v29;
    [(CALayer *)*p_repContainerLayer setSublayerTransform:&v28];
    v27 = [(SXTextView *)self rep];
    [v27 updateFromVisualPosition];
  }
LABEL_6:
}

- (void)directLayerhostUpdateTopLevelTilingLayers:(id)a3 forRep:(id)a4
{
  id v5 = a3;
  if (self->_repContainerLayer) {
    objc_msgSend(v5, "addObject:");
  }
}

- (void)_updateOverlayTransform
{
  v3 = [(SXTextView *)self rep];

  if (v3)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v9 = 0u;
    id v4 = [(SXTextView *)self rep];
    id v5 = [v4 layout];
    id v6 = v5;
    if (v5)
    {
      [v5 transformInRoot];
    }
    else
    {
      long long v10 = 0u;
      long long v11 = 0u;
      long long v9 = 0u;
    }

    CATransform3DMakeTranslation(&v8, -(*(double *)&v11+ *(double *)(MEMORY[0x263F00148] + 8) * *(double *)&v10+ *(double *)&v9 * *MEMORY[0x263F00148]), -(*((double *)&v11 + 1)+ *(double *)(MEMORY[0x263F00148] + 8) * *((double *)&v10 + 1)+ *((double *)&v9 + 1) * *MEMORY[0x263F00148]), 0.0);
    CATransform3D v7 = v8;
    [(CALayer *)self->_overlayContainerLayer setSublayerTransform:&v7];
  }
}

- (void)directLayerHostUpdateOverlayLayers:(id)a3 forRep:(id)a4
{
  id v13 = a3;
  uint64_t v5 = [v13 count];
  overlayContainerLayer = self->_overlayContainerLayer;
  if (v5)
  {
    if (!overlayContainerLayer)
    {
      CATransform3D v7 = [MEMORY[0x263F7C6D8] layer];
      CATransform3D v8 = self->_overlayContainerLayer;
      self->_overlayContainerLayer = v7;

      if (self->_repContainerLayer)
      {
        long long v9 = [(SXTextView *)self layer];
        [v9 insertSublayer:self->_overlayContainerLayer above:self->_repContainerLayer];
      }
      else
      {
        long long v9 = [(SXTextView *)self layer];
        [v9 insertSublayer:self->_overlayContainerLayer atIndex:0];
      }
    }
    [(SXTextView *)self _updateOverlayTransform];
    long long v11 = [(CALayer *)self->_overlayContainerLayer sublayers];
    char v12 = [v11 isEqual:v13];

    if ((v12 & 1) == 0) {
      [(CALayer *)self->_overlayContainerLayer setSublayers:v13];
    }
  }
  else if (overlayContainerLayer)
  {
    [(CALayer *)overlayContainerLayer removeFromSuperlayer];
    long long v10 = self->_overlayContainerLayer;
    self->_overlayContainerLayer = 0;
  }
}

- (void)setFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SXTextView;
  -[SXTextView setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = [(SXTextView *)self rep];
  [(SXTextView *)self frameInCanvas];
  objc_msgSend(v4, "setFrameInCanvas:");
}

- (CGRect)frameInCanvas
{
  p_frameInCanvas = &self->_frameInCanvas;
  if (CGRectIsEmpty(self->_frameInCanvas))
  {
    [(SXTextView *)self frame];
  }
  else
  {
    double x = p_frameInCanvas->origin.x;
    double y = p_frameInCanvas->origin.y;
    double width = p_frameInCanvas->size.width;
    double height = p_frameInCanvas->size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrameInCanvas:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  self->_frameInCanvas = a3;
  id v7 = [(SXTextView *)self rep];
  objc_msgSend(v7, "setFrameInCanvas:", x, y, width, height);
}

- (void)setShouldHyphenate:(BOOL)a3
{
  self->_shouldHyphenate = a3;
  BOOL v4 = [(SXTextView *)self shouldHyphenate];
  id v5 = [(SXTextView *)self textInfo];
  [v5 setShouldHyphenate:v4];
}

- (void)setIsSelectable:(BOOL)a3
{
  self->_isSelectable = a3;
  BOOL v4 = [(SXTextView *)self isSelectable];
  id v5 = [(SXTextView *)self textInfo];
  [v5 setIsSelectable:v4];
}

- (id)infoGeometry
{
  [(SXTextView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  long long v11 = [(SXTextView *)self canvas];
  char v12 = [v11 canvasController];
  id v13 = [v12 canvasView];

  if (v13)
  {
    -[SXTextView convertRect:toView:](self, "convertRect:toView:", v13, v4, v6, v8, v10);
    double v4 = v14;
    double v6 = v15;
    double v8 = v16;
    double v10 = v17;
  }
  v18 = objc_msgSend(objc_alloc(MEMORY[0x263F7C6B0]), "initWithPosition:size:", v4, v6, v8, v10);

  return v18;
}

- (void)setMightBeVisuallyMisplaced:(BOOL)a3
{
  if (self->_mightBeVisuallyMisplaced)
  {
    double v5 = [(SXTextView *)self rep];
    int v6 = [v5 updateFromVisualPosition];

    if (v6)
    {
      double v7 = [(SXTextView *)self rep];
      double v8 = [v7 icc];
      char v9 = [v8 currentlyScrolling];

      if ((v9 & 1) == 0)
      {
        double v10 = [(SXTextView *)self rep];
        long long v11 = [v10 icc];
        [v11 invalidateLayers];
      }
    }
  }
  self->_mightBeVisuallyMisplaced = a3;
}

- (void)provideInfosLayoutTo:(id)a3
{
  id v13 = a3;
  double v4 = [(SXTextView *)self delegate];
  double v5 = [v4 textRulesForTextView:self];

  int v6 = [(SXTextView *)self delegate];
  double v7 = [v6 componentIdentifierForTextView:self];

  if ([v5 textFlow] == 1) {
    double v8 = @"body";
  }
  else {
    double v8 = v7;
  }
  char v9 = [(SXTextView *)self textLayouter];
  double v10 = [v9 wpStorage];
  long long v11 = [(SXTextView *)self textLayouter];
  char v12 = [v11 wpLayout];
  objc_msgSend(v13, "addTextStorage:withLayout:forNamedFlow:directLayerHostView:selectable:componentIdentifier:", v10, v12, v8, self, -[SXTextView isSelectable](self, "isSelectable"), v7);
}

- (id)accessibilityCustomRotorMembershipForRep:(id)a3
{
  double v4 = [(SXTextView *)self delegate];
  double v5 = [v4 accessibilityCustomRotorMembershipForTextView:self];

  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  double v3 = [(SXTextView *)self delegate];
  double v4 = [v3 accessibilityContextualLabelForTextView:self];

  return v4;
}

- (int64_t)accessibilityContainerType
{
  double v3 = [(SXTextView *)self accessibilityLabel];
  uint64_t v4 = [v3 length];

  if (v4) {
    return 4;
  }
  v6.receiver = self;
  v6.super_class = (Class)SXTextView;
  return [(SXTextView *)&v6 accessibilityContainerType];
}

- (id)accessibilityElements
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(SXTextView *)self rep];
  uint64_t v4 = (void *)v3;
  if (v3)
  {
    v10[0] = v3;
    double v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    [v4 setAccessibilityContainer:self];
  }
  else
  {
    double v5 = 0;
  }
  if (_AXSCommandAndControlEnabled() && !UIAccessibilityIsVoiceOverRunning())
  {
    objc_super v6 = [v4 valueForKey:@"sxaxLinkElements"];
    double v7 = [v6 array];

    if ([v7 count])
    {
      uint64_t v8 = [v7 arrayByAddingObject:v4];

      double v5 = (void *)v8;
    }
  }
  return v5;
}

- (NSString)description
{
  uint64_t v3 = [(SXTextView *)self textInfo];
  uint64_t v4 = [v3 storage];
  double v5 = [v4 string];
  objc_super v6 = [(SXTextView *)self textInfo];
  double v7 = [v6 storage];
  uint64_t v8 = [v7 string];
  unint64_t v9 = [v8 length];

  if (v9 >= 0xF) {
    uint64_t v10 = 15;
  }
  else {
    uint64_t v10 = v9;
  }
  long long v11 = objc_msgSend(v5, "substringWithRange:", 0, v10);

  char v12 = NSString;
  uint64_t v13 = objc_opt_class();
  [(SXTextView *)self frame];
  double v14 = NSStringFromCGRect(v19);
  [(SXTextView *)self frameInCanvas];
  double v15 = NSStringFromCGRect(v20);
  objc_msgSend(v12, "stringWithFormat:", @"<%@: %p; frame: %@; frameInCanvas: %@; string: %@>",
    v13,
    self,
    v14,
    v15,
  double v16 = v11);

  return (NSString *)v16;
}

- (SXTextLayouter)textLayouter
{
  return self->_textLayouter;
}

- (void)setTextLayouter:(id)a3
{
}

- (SXTextViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SXTextViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SXTextSource)textSource
{
  return self->_textSource;
}

- (CGRect)parentFrame
{
  double x = self->_parentFrame.origin.x;
  double y = self->_parentFrame.origin.y;
  double width = self->_parentFrame.size.width;
  double height = self->_parentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setParentFrame:(CGRect)a3
{
  self->_parentFrame = a3;
}

- (BOOL)isSelectable
{
  return self->_isSelectable;
}

- (BOOL)shouldHyphenate
{
  return self->_shouldHyphenate;
}

- (SXTextTangierContainerInfo)textInfo
{
  return self->_textInfo;
}

- (BOOL)mightBeVisuallyMisplaced
{
  return self->_mightBeVisuallyMisplaced;
}

- (SXTextTangierRepAccessibilityElement)rep
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
  return (SXTextTangierRepAccessibilityElement *)WeakRetained;
}

- (void)setRep:(id)a3
{
}

- (TSDLayoutController)layoutController
{
  return self->_layoutController;
}

- (CALayer)repContainerLayer
{
  return self->_repContainerLayer;
}

- (void)setRepContainerLayer:(id)a3
{
}

- (CALayer)overlayContainerLayer
{
  return self->_overlayContainerLayer;
}

- (void)setOverlayContainerLayer:(id)a3
{
}

- (TSDCanvas)canvas
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
  return (TSDCanvas *)WeakRetained;
}

- (void)setCanvas:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_canvas);
  objc_storeStrong((id *)&self->_overlayContainerLayer, 0);
  objc_storeStrong((id *)&self->_repContainerLayer, 0);
  objc_storeStrong((id *)&self->_layoutController, 0);
  objc_destroyWeak((id *)&self->_rep);
  objc_storeStrong((id *)&self->_textInfo, 0);
  objc_storeStrong((id *)&self->_textSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textLayouter, 0);
}

@end