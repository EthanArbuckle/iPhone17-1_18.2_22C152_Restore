@interface THWInteractiveImageRadioPanelRep
- (BOOL)buttonControlUseContentsScaleForImageCache:(id)a3;
- (BOOL)control:(id)a3 isInteractionEnabledForRep:(id)a4;
- (BOOL)directlyManagesLayerContent;
- (THWButtonControlRep)nextButtonRep;
- (THWButtonControlRep)previousButtonRep;
- (THWInteractiveImageTransportControlDelegate)transportControlDelegate;
- (THWPageControlRep)pageControlRep;
- (__CTFont)pageControlCreateFont:(id)a3;
- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5;
- (id)p_calloutOptionLayerWithSize:(CGSize)a3 index:(unint64_t)a4 state:(int)a5;
- (id)p_colorFromColor:(id)a3 withAlpha:(double)a4;
- (id)p_dotOptionLayerWithColor:(id)a3 size:(CGSize)a4;
- (id)p_simpleButtonLayerWithSize:(CGSize)a3 fillColor:(id)a4 borderColor:(id)a5;
- (id)p_textOptionWithColor:(id)a3 size:(CGSize)a4 index:(unint64_t)a5;
- (id)pageControl:(id)a3 layerForState:(int)a4;
- (id)pageControl:(id)a3 layerForState:(int)a4 pageIndex:(unint64_t)a5;
- (id)pageControlTextColor:(id)a3;
- (void)buttonControlWasPressed:(id)a3;
- (void)control:(id)a3 repWasAdded:(id)a4;
- (void)control:(id)a3 repWillBeRemoved:(id)a4;
- (void)pageControl:(id)a3 didChangeHighlightedFromPageIndex:(unint64_t)a4 toPageIndex:(unint64_t)a5;
- (void)pageControl:(id)a3 didChangeInteractivelyFromPageIndex:(unint64_t)a4 toPageIndex:(unint64_t)a5;
- (void)pageControl:(id)a3 updateLayer:(id)a4 forHighlight:(BOOL)a5;
- (void)setNextButtonRep:(id)a3;
- (void)setPageControlRep:(id)a3;
- (void)setPreviousButtonRep:(id)a3;
- (void)setSelectedCallout:(unint64_t)a3;
- (void)setTransportControlDelegate:(id)a3;
@end

@implementation THWInteractiveImageRadioPanelRep

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)setSelectedCallout:(unint64_t)a3
{
  id v4 = [[self layout] pageControl];

  [v4 setCurrentPage:a3];
}

- (void)buttonControlWasPressed:(id)a3
{
  id v5 = [self layout].pageControl;
  v6 = (char *)[v5 currentPage];
  v7 = (char *)objc_msgSend(objc_msgSend(a3, "layout"), "tag");
  if (v7)
  {
    if (v7 == (unsigned char *)&dword_0 + 1)
    {
      if (v6 < (char *)[v5 numberOfPages] - 1) {
        ++v6;
      }
      else {
        v6 = 0;
      }
    }
  }
  else
  {
    if (!v6) {
      v6 = (char *)[v5 numberOfPages];
    }
    --v6;
  }
  v8 = [(THWInteractiveImageRadioPanelRep *)self transportControlDelegate];

  [(THWInteractiveImageTransportControlDelegate *)v8 transportControl:self calloutOptionSelected:v6];
}

- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5
{
  id v7 = [a3 layout];
  v8 = (char *)[v7 tag];
  if (v8)
  {
    if (v8 != (unsigned char *)&dword_0 + 1) {
      return 0;
    }
    [v7 frame];
    double v10 = v9;
    double v12 = v11;
    id v13 = [[self layout] primaryColor];
    id v14 = [a3 highlighted];
    objc_msgSend(objc_msgSend(a3, "canvas"), "contentsScale");
    double v16 = v15;
    double v17 = v10;
    double v18 = v12;
    uint64_t v19 = 2;
  }
  else
  {
    [v7 frame];
    double v21 = v20;
    double v23 = v22;
    id v13 = [[self layout] primaryColor];
    id v14 = [a3 highlighted];
    objc_msgSend(objc_msgSend(a3, "canvas"), "contentsScale");
    double v16 = v24;
    double v17 = v21;
    double v18 = v23;
    uint64_t v19 = 4;
  }

  return +[THWButtonUtilities navigationArrowImageWithSize:direction:color:highlighted:contentsScale:](THWButtonUtilities, "navigationArrowImageWithSize:direction:color:highlighted:contentsScale:", v19, v13, v14, v17, v18, v16);
}

- (BOOL)buttonControlUseContentsScaleForImageCache:(id)a3
{
  return 1;
}

- (BOOL)control:(id)a3 isInteractionEnabledForRep:(id)a4
{
  v6 = [(THWInteractiveImageRadioPanelRep *)self transportControlDelegate];

  return [(THWInteractiveImageTransportControlDelegate *)v6 transportControl:self isInteractionEnabledForRep:a4];
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  id v5 = (char *)[a3 tag];
  if (!v5)
  {
    objc_opt_class();
    v6 = (void *)TSUDynamicCast();
    uint64_t v7 = 304;
LABEL_6:
    *(void *)&self->super.TSDContainerRep_opaque[v7] = v6;
    [v6 setDelegate:self];
    return;
  }
  if (v5 != (unsigned char *)&dword_0 + 2)
  {
    if (v5 != (unsigned char *)&dword_0 + 1) {
      return;
    }
    objc_opt_class();
    v6 = (void *)TSUDynamicCast();
    uint64_t v7 = 312;
    goto LABEL_6;
  }
  objc_opt_class();
  v8 = (THWPageControlRep *)TSUDynamicCast();
  self->_pageControlRep = v8;
  [(THWPageControlRep *)v8 setDelegate:self];
  pageControlRep = self->_pageControlRep;

  [(THWPageControlRep *)pageControlRep setPageDirectlyToIndex:1];
}

- (void)control:(id)a3 repWillBeRemoved:(id)a4
{
  if ((unint64_t)[a3 tag] <= 2) {
    self->_nextButtonRep = 0;
  }
}

- (void)pageControl:(id)a3 didChangeInteractivelyFromPageIndex:(unint64_t)a4 toPageIndex:(unint64_t)a5
{
  if (a5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = [(THWInteractiveImageRadioPanelRep *)self transportControlDelegate];
    [(THWInteractiveImageTransportControlDelegate *)v8 transportControl:self calloutOptionSelected:a5];
  }
}

- (__CTFont)pageControlCreateFont:(id)a3
{
  id v3 = [[TSUFont systemFontOfSize:17.0] familyName];
  v4.n128_u64[0] = 17.0;

  return (__CTFont *)_TSWPCreateFontWithFamilyName(v3, 1, 0, v4);
}

- (id)pageControlTextColor:(id)a3
{
  id v3 = [(THWInteractiveImageRadioPanelRep *)self layout];

  return [v3 primaryColor];
}

- (id)pageControl:(id)a3 layerForState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [self layout:a3 controlButtonSize];

  return -[THWInteractiveImageRadioPanelRep p_calloutOptionLayerWithSize:index:state:](self, "p_calloutOptionLayerWithSize:index:state:", 0, v4);
}

- (id)pageControl:(id)a3 layerForState:(int)a4 pageIndex:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  [self layout:a3 controlButtonSize];

  return -[THWInteractiveImageRadioPanelRep p_calloutOptionLayerWithSize:index:state:](self, "p_calloutOptionLayerWithSize:index:state:", a5, v6);
}

- (void)pageControl:(id)a3 didChangeHighlightedFromPageIndex:(unint64_t)a4 toPageIndex:(unint64_t)a5
{
  id v5 = [(THWInteractiveImageRadioPanelRep *)self interactiveCanvasController];

  [v5 invalidateLayers];
}

- (void)pageControl:(id)a3 updateLayer:(id)a4 forHighlight:(BOOL)a5
{
  LODWORD(v5) = 1.0;
  if (a5) {
    *(float *)&double v5 = 0.5;
  }
  [a4 setOpacity:a3];
}

- (id)p_colorFromColor:(id)a3 withAlpha:(double)a4
{
  CopyWithAlpha = CGColorCreateCopyWithAlpha((CGColorRef)[a3 CGColor], a4);
  double v5 = +[TSUColor colorWithCGColor:CopyWithAlpha];
  CGColorRelease(CopyWithAlpha);
  return v5;
}

- (id)p_simpleButtonLayerWithSize:(CGSize)a3 fillColor:(id)a4 borderColor:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v10 = +[TSDNoDefaultImplicitActionLayer layer];
  [v10 setDelegate:[self interactiveCanvasController]];
  double v11 = 0.0;
  [v10 setFrame:CGRectMake(0.0, 0.0, width, height)];
  [v10 setCornerRadius:width * 0.5];
  [self canvas].contentsScale
  [v10 setContentsScale:];
  if (a5)
  {
    [v10 setBorderColor:[a5 CGColor]];
    double v11 = 1.0;
  }
  [v10 setBorderWidth:v11];
  if (a4) {
    [v10 setBackgroundColor:[a4 CGColor]];
  }
  return v10;
}

- (id)p_dotOptionLayerWithColor:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = +[CAShapeLayer layer];
  [v7 setFrame:CGRectMake(0.0, 0.0, width, height)];
  [v7 setBorderWidth:0.0];
  [v7 setFillColor:[a3 CGColor]];
  Mutable = CGPathCreateMutable();
  v10.origin.x = (width + -7.0) * 0.5;
  v10.origin.y = (height + -7.0) * 0.5;
  v10.size.double width = 7.0;
  v10.size.double height = 7.0;
  CGPathAddEllipseInRect(Mutable, 0, v10);
  [v7 setPath:Mutable];
  CGPathRelease(Mutable);
  return v7;
}

- (id)p_textOptionWithColor:(id)a3 size:(CGSize)a4 index:(unint64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  CGRect v10 = objc_alloc_init(THWLabelLayer);
  -[THWLabelLayer setFrame:](v10, "setFrame:", 0.0, 0.0, width, height);
  [self canvas].contentsScale;
  -[THWLabelLayer setContentsScale:](v10, "setContentsScale:");
  [(THWLabelLayer *)v10 setDelegate:+[THNoAnimationLayerDelegate sharedInstance]];
  [(THWLabelLayer *)v10 setTextColor:a3];
  [(THWLabelLayer *)v10 setVerticalAlignment:1];
  [(THWLabelLayer *)v10 setHorizontalAlignment:1];
  [(THWLabelLayer *)v10 setVerticalAlignmentRule:0];
  [(THWLabelLayer *)v10 setFontSize:17.0];
  -[v10 setFontName:[+[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", 17.0) fontName]];
  [(THWLabelLayer *)v10 setString:+[NSString stringWithFormat:@"%lu", a5]];
  return v10;
}

- (id)p_calloutOptionLayerWithSize:(CGSize)a3 index:(unint64_t)a4 state:(int)a5
{
  double height = a3.height;
  double width = a3.width;
  id v10 = [self layout].primaryColor;
  id v11 = v10;
  if (a5 == 1)
  {
    id v12 = [(THWInteractiveImageRadioPanelRep *)self p_colorFromColor:v10 withAlpha:0.2];
    id v13 = [(THWInteractiveImageRadioPanelRep *)self p_colorFromColor:v11 withAlpha:0.7];
  }
  else
  {
    id v11 = [v10 colorWithAlphaComponent:0.4];
    id v12 = 0;
    id v13 = 0;
  }
  if (a4) {
    id v14 = -[THWInteractiveImageRadioPanelRep p_textOptionWithColor:size:index:](self, "p_textOptionWithColor:size:index:", v11, a4, width, height);
  }
  else {
    id v14 = -[THWInteractiveImageRadioPanelRep p_dotOptionLayerWithColor:size:](self, "p_dotOptionLayerWithColor:size:", v11, width, height);
  }
  double v15 = v14;
  [self canvas].contentsScale;
  [v15 setContentsScale:];
  id v16 = -[THWInteractiveImageRadioPanelRep p_simpleButtonLayerWithSize:fillColor:borderColor:](self, "p_simpleButtonLayerWithSize:fillColor:borderColor:", v12, v13, width, height);
  [v16 addSublayer:v15];
  return v16;
}

- (THWInteractiveImageTransportControlDelegate)transportControlDelegate
{
  return self->_transportControlDelegate;
}

- (void)setTransportControlDelegate:(id)a3
{
  self->_transportControlDelegate = (THWInteractiveImageTransportControlDelegate *)a3;
}

- (THWButtonControlRep)previousButtonRep
{
  return self->_previousButtonRep;
}

- (void)setPreviousButtonRep:(id)a3
{
  self->_previousButtonRep = (THWButtonControlRep *)a3;
}

- (THWButtonControlRep)nextButtonRep
{
  return self->_nextButtonRep;
}

- (void)setNextButtonRep:(id)a3
{
  self->_nextButtonRep = (THWButtonControlRep *)a3;
}

- (THWPageControlRep)pageControlRep
{
  return self->_pageControlRep;
}

- (void)setPageControlRep:(id)a3
{
  self->_pageControlRep = (THWPageControlRep *)a3;
}

@end