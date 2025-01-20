@interface THWPageControlRep
+ (id)dotLayerUsingColor:(id)a3 diameter:(double)a4;
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)handleGesture:(id)a3;
- (BOOL)pageDirectlyToIndex;
- (NSMutableArray)indicators;
- (THWLabelLayer)textIndicator;
- (THWPageControlDelegate)delegate;
- (THWPageControlRep)initWithLayout:(id)a3 canvas:(id)a4;
- (TSUIntegerKeyDictionary)cachedLayers;
- (id)p_indicatorAtIndex:(unint64_t)a3;
- (id)p_layerForState:(int)a3 pageIndex:(unint64_t)a4;
- (id)p_nearestIndicatorToLocation:(CGPoint)a3;
- (unint64_t)currentPage;
- (unint64_t)highlightedPageIndex;
- (void)addAdditionalChildLayersToArray:(id)a3;
- (void)dealloc;
- (void)p_changeToPageAtIndex:(unint64_t)a3;
- (void)screenScaleDidChange;
- (void)setDelegate:(id)a3;
- (void)setHighlightedPageIndex:(unint64_t)a3;
- (void)setPageDirectlyToIndex:(BOOL)a3;
- (void)updateFromLayout;
@end

@implementation THWPageControlRep

- (THWPageControlRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)THWPageControlRep;
  result = [(THWPageControlRep *)&v5 initWithLayout:a3 canvas:a4];
  if (result)
  {
    *(unint64_t *)((char *)&result->_highlightedPageIndex + 1) = 0x7FFFFFFFFFFFFFFFLL;
    *(unint64_t *)((char *)&result->_currentPage + 1) = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWPageControlRep;
  [(THWPageControlRep *)&v3 dealloc];
}

- (id)p_nearestIndicatorToLocation:(CGPoint)a3
{
  double x = a3.x;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  objc_super v5 = *(NSMutableArray **)((char *)&self->_indicators + 1);
  id v6 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (!v6) {
    return 0;
  }
  id v7 = v6;
  v8 = 0;
  uint64_t v9 = *(void *)v33;
  double y = CGRectZero.origin.y;
  double v31 = CGRectZero.origin.x;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  double v13 = 1.79769313e308;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v33 != v9) {
        objc_enumerationMutation(v5);
      }
      v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      id v16 = [v15 layer:v31];
      v17 = v16;
      double v18 = y;
      double v19 = width;
      double v20 = height;
      double v21 = v31;
      if (v16) {
        [v16 bounds:v31, y, width, height];
      }
      double v22 = CGRectGetWidth(*(CGRect *)&v21);
      [self layout] spacing
      double v24 = v23;
      [v17 frame];
      TSDCenterOfRect();
      double v26 = v25;
      TSDDistanceSquared();
      double v28 = vabdd_f64(v26, x);
      if (v27 < v13 && v28 <= (v22 + v24) * 0.5)
      {
        v8 = v15;
        double v13 = v27;
      }
    }
    id v7 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
  }
  while (v7);
  return v8;
}

- (id)p_indicatorAtIndex:(unint64_t)a3
{
  if ((unint64_t)[*(id *)((char *)&self->_indicators + 1) count] <= a3) {
    return 0;
  }
  objc_super v5 = *(NSMutableArray **)((char *)&self->_indicators + 1);

  return [v5 objectAtIndex:a3];
}

+ (id)dotLayerUsingColor:(id)a3 diameter:(double)a4
{
  id v6 = +[TSDNoDefaultImplicitActionLayer layer];
  [v6 setMasksToBounds:1];
  [v6 setBackgroundColor:[a3 CGColor]];
  [v6 setCornerRadius:a4 * 0.5];
  [v6 setBounds:0.0, 0.0, a4, a4];
  return v6;
}

- (id)p_layerForState:(int)a3 pageIndex:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = *(TSUIntegerKeyDictionary **)((char *)&self->_cachedLayers + 1);
  if (!v7) {
    *(TSUIntegerKeyDictionary **)((char *)&self->_cachedLayers + 1) = (TSUIntegerKeyDictionary *)objc_alloc_init((Class)TSUIntegerKeyDictionary);
  }
  [(THWPageControlRep *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v9 = v5;
    id v10 = [v7 objectForKey:v5];
    if (v10) {
      return v10;
    }
    id v11 = [(THWPageControlDelegate *)[(THWPageControlRep *)self delegate] pageControl:self layerForState:v5];
    goto LABEL_10;
  }
  objc_opt_class();
  [*(id *)((char *)&self->_cachedLayers + 1) objectForKey:a4];
  id v7 = (id)TSUDynamicCast();
  if (!v7)
  {
    id v7 = objc_alloc_init((Class)TSUIntegerKeyDictionary);
    [*(id *)((char *)&self->_cachedLayers + 1) setObject:v7 forKey:a4];
    id v8 = v7;
  }
  uint64_t v9 = v5;
  id v10 = [v7 objectForKey:v5];
  if (!v10)
  {
    id v11 = [(THWPageControlDelegate *)[(THWPageControlRep *)self delegate] pageControl:self layerForState:v5 pageIndex:a4];
LABEL_10:
    id v10 = v11;
    if (v11) {
      [v7 setObject:v11 forKey:v9];
    }
  }
  return v10;
}

- (void)updateFromLayout
{
  v18.receiver = self;
  v18.super_class = (Class)THWPageControlRep;
  [(THWPageControlRep *)&v18 updateFromLayout];
  id v3 = [(THWPageControlRep *)self layout];
  v4 = (char *)[v3 numberOfPages];
  if ((unint64_t)v4 > 0xA || [v3 forceTextOnly])
  {
    uint64_t v5 = *(NSMutableArray **)((char *)&self->_indicators + 1);
    if (v5)
    {
      *(unint64_t *)((char *)&self->_currentPage + 1) = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v5 = *(NSMutableArray **)((char *)&self->_indicators + 1);
    }

    *(NSMutableArray **)((char *)&self->_indicators + 1) = 0;
    if (!*(THWLabelLayer **)((char *)&self->_textIndicator + 1))
    {
      *(THWLabelLayer **)((char *)&self->_textIndicator + 1) = objc_alloc_init(THWLabelLayer);
      [*(id *)((char *)&self->_textIndicator + 1) setDelegate:[+[THNoAnimationLayerDelegate sharedInstance](THNoAnimationLayerDelegate, "sharedInstance")]];
      [self canvas].contentsScale
      [*(id *)((char *)&self->_textIndicator + 1) setContentsScale:];
      id v6 = [(THWPageControlRep *)self delegate];
      id v7 = (const __CTFont *)[(THWPageControlDelegate *)v6 pageControlCreateFont:self];
      id v8 = [(THWPageControlDelegate *)v6 pageControlTextColor:self];
      CFStringRef v9 = CTFontCopyPostScriptName(v7);
      [*(id *)((char *)&self->_textIndicator + 1) setFontName:v9];
      [*(id *)((char *)&self->_textIndicator + 1) setFontSize:14.0];
      [*(id *)((char *)&self->_textIndicator + 1) setTextColor:v8];
      [*(id *)((char *)&self->_textIndicator + 1) setVerticalAlignment:1];
      [*(id *)((char *)&self->_textIndicator + 1) setHorizontalAlignment:1];
      [*(id *)((char *)&self->_textIndicator + 1) setVerticalAlignmentRule:1];
      if (v7) {
        CFRelease(v7);
      }
      if (v9) {
        CFRelease(v9);
      }
    }
  }
  else
  {
    id v10 = *(THWLabelLayer **)((char *)&self->_textIndicator + 1);
    if (v10)
    {
      *(unint64_t *)((char *)&self->_currentPage + 1) = 0x7FFFFFFFFFFFFFFFLL;
      id v10 = *(THWLabelLayer **)((char *)&self->_textIndicator + 1);
    }

    *(THWLabelLayer **)((char *)&self->_textIndicator + 1) = 0;
    if (!*(NSMutableArray **)((char *)&self->_indicators + 1)) {
      *(NSMutableArray **)((char *)&self->_indicators + 1) = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    }
  }
  id v11 = *(NSMutableArray **)((char *)&self->_indicators + 1);
  if (v11)
  {
    if ([v11 count] != v4)
    {
      [*(id *)((char *)&self->_indicators + 1) removeAllObjects];
      *(unint64_t *)((char *)&self->_currentPage + 1) = 0x7FFFFFFFFFFFFFFFLL;
      if (v4)
      {
        for (i = 0; i != v4; ++i)
        {
          double v13 = [[THWPageIndicator alloc] initWithLayer:[(THWPageControlRep *)self p_layerForState:0 pageIndex:i]];
          [*(id *)((char *)&self->_indicators + 1) addObject:v13];
        }
      }
    }
    id v14 = [v3 currentPage];
    id v15 = *(id *)((char *)&self->_currentPage + 1);
    if (v15 != v14)
    {
      unint64_t v16 = (unint64_t)v14;
      if (v15 != (id)0x7FFFFFFFFFFFFFFFLL) {
        [self p_indicatorAtIndex:0].layer = [self p_layerForState:0 pageIndex:self->_currentPage];
      }
      *(unint64_t *)((char *)&self->_currentPage + 1) = v16;
      if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
        [self p_indicatorAtIndex:v16].layer = [self p_layerForState:1 pageIndex:v16];
      }
    }
  }
  if (*(THWLabelLayer **)((char *)&self->_textIndicator + 1))
  {
    id v17 = [v3 currentPage];
    if (*(id *)((char *)&self->_currentPage + 1) != v17)
    {
      *(unint64_t *)((char *)&self->_currentPage + 1) = (unint64_t)v17;
      [*(id *)((char *)&self->_textIndicator + 1) setString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", @"%lu of %lu", &stru_46D7E8, 0), *(unint64_t *)((char *)&self->_currentPage + 1) + 1, v4)];
    }
  }
}

- (void)screenScaleDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)THWPageControlRep;
  [(THWPageControlRep *)&v5 screenScaleDidChange];
  [self canvas].contentsScale;
  [*(id *)((char *)&self->_textIndicator + 1) setContentsScale:];
  [*(id *)((char *)&self->_cachedLayers + 1) removeAllObjects];
  id v3 = *(NSMutableArray **)((char *)&self->_indicators + 1);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_163EA4;
  v4[3] = &unk_459F78;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  if (*(NSMutableArray **)((char *)&self->_indicators + 1))
  {
    v49 = [(THWPageControlRep *)self delegate];
    char v5 = objc_opt_respondsToSelector();
    id v6 = [(THWPageControlRep *)self layout];
    id v7 = [(THWPageControlRep *)self p_layerForState:0 pageIndex:0];
    if (v7)
    {
      [v7 bounds];
      double width = v8;
      CGFloat height = v10;
    }
    else
    {
      double width = CGSizeZero.width;
      CGFloat height = CGSizeZero.height;
    }
    [v6 spacing:v49];
    double v13 = v12;
    id v14 = [*(id *)((char *)&self->_indicators + 1) count];
    double v51 = v13;
    double v15 = v13 * (double)((unint64_t)v14 - 1);
    if ((unint64_t)v14 <= 1) {
      double v15 = 0.0;
    }
    double v16 = v15 + width * (double)(unint64_t)v14;
    if (v14 && *(unint64_t *)((char *)&self->_currentPage + 1) != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v17 = [(THWPageControlRep *)self p_layerForState:1 pageIndex:0];
      if (v17) {
        [v17 bounds];
      }
      else {
        double v18 = CGSizeZero.width;
      }
      double v16 = v16 + v18 - width;
    }
    [self canvas].contentsScale;
    [self canvas].viewScale;
    double v20 = v19;
    memset(&v57, 0, sizeof(v57));
    CATransform3DMakeScale(&v57, v19, v19, 1.0);
    [v6 frame];
    double v22 = v21;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    double v23 = *(NSMutableArray **)((char *)&self->_indicators + 1);
    id v24 = [v23 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = 0;
      float v27 = (v22 - v16) * 0.5;
      double v28 = floorf(v27);
      uint64_t v29 = *(void *)v54;
      double v30 = height;
      double v31 = width * v20;
      double v32 = v30 * v20;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v54 != v29) {
            objc_enumerationMutation(v23);
          }
          id v34 = [*(id *)(*((void *)&v53 + 1) + 8 * i) layer];
          [v34 bounds];
          double v36 = v35;
          TSDRoundedPointForScale();
          [v34 setPosition:v37 + v31 * 0.5, v38 + v32 * 0.5];
          CATransform3D v52 = v57;
          [v34 setTransform:&v52];
          if (v34)
          {
            if (v5) {
              [v50 pageControl:self updateLayer:v34 forHighlight:(char *)i + v26 == *(void **)((char *)&self->_highlightedPageIndex + 1)];
            }
            [a3 addObject:v34];
          }
          double v28 = v28 + v51 + v36;
        }
        id v25 = [v23 countByEnumeratingWithState:&v53 objects:v58 count:16];
        v26 += (uint64_t)i;
      }
      while (v25);
    }
  }
  if (*(THWLabelLayer **)((char *)&self->_textIndicator + 1))
  {
    [(THWPageControlRep *)self layerFrameInScaledCanvas];
    TSDRectWithSize();
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    [self canvas].viewScale
    double v48 = v47;
    [*(id *)((char *)&self->_textIndicator + 1) setFrame:v40, v42, v44, v46];
    [*(id *)((char *)&self->_textIndicator + 1) setFontSize:v48 * 14.0];
    [a3 addObject:*(THWLabelLayer **)((char *)&self->_textIndicator + 1)];
  }
}

- (BOOL)canHandleGesture:(id)a3
{
  id v5 = [(THWControlRep *)self controlHostRep];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (unsigned int v6 = objc_msgSend(v5, "control:isInteractionEnabledForRep:", -[THWPageControlRep layout](self, "layout"), self)) != 0)
  {
    LOBYTE(v6) = *(NSMutableArray **)((char *)&self->_indicators + 1)
              && (id v7 = [a3 gestureKind], v7 == (id)TSWPImmediatePress)
              && [self layout].numberOfPages != 0;
  }
  return v6;
}

- (BOOL)handleGesture:(id)a3
{
  if (!*(NSMutableArray **)((char *)&self->_indicators + 1)
    || (id v5 = [(THWPageControlRep *)self layout],
        id v6 = [a3 gestureKind],
        v6 != (id)TSWPImmediatePress))
  {
    LOBYTE(v7) = 0;
    return (char)v7;
  }
  id v7 = [v5 numberOfPages];
  if (!v7) {
    return (char)v7;
  }
  [a3 naturalLocationForRep:self];
  double v9 = v8;
  -[THWPageControlRep convertNaturalPointToLayerRelative:](self, "convertNaturalPointToLayerRelative:");
  id v10 = -[THWPageControlRep p_nearestIndicatorToLocation:](self, "p_nearestIndicatorToLocation:");
  if (v10) {
    uint64_t v11 = (uint64_t)[*(id *)((char *)&self->_indicators + 1) indexOfObject:v10];
  }
  else {
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  unsigned int v12 = [a3 gestureState];
  if (v12 - 1 < 2)
  {
    if (!objc_msgSend(objc_msgSend(-[THWPageControlRep interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), "isAncestorScrollViewDragging"))
    {
      double v18 = self;
      uint64_t v19 = v11;
      goto LABEL_23;
    }
    objc_opt_class();
    [(id)TSUDynamicCast() cancel];
  }
  else if (v12 - 4 >= 2)
  {
    if (v12 == 3)
    {
      [(THWPageControlRep *)self setHighlightedPageIndex:0x7FFFFFFFFFFFFFFFLL];
      double v13 = (char *)[v5 currentPage];
      if (![(THWPageControlRep *)self pageDirectlyToIndex])
      {
        id v14 = [(THWPageControlRep *)self p_indicatorAtIndex:*(unint64_t *)((char *)&self->_currentPage + 1)];
        double v15 = (char *)[v5 numberOfPages];
        if (v14
          && (objc_msgSend(-[THWPageControlRep canvas](self, "canvas"), "viewScale"),
              CGFloat v17 = v9 * v16,
              objc_msgSend(objc_msgSend(v14, "layer"), "frame"),
              v17 > CGRectGetMidX(v21)))
        {
          uint64_t v11 = (uint64_t)(v13 + 1);
          if (v13 + 1 == v15)
          {
            if ([v5 wrapEnabled]) {
              uint64_t v11 = 0;
            }
            else {
              uint64_t v11 = (uint64_t)v13;
            }
          }
        }
        else if (![v5 wrapEnabled] || v13)
        {
          if (v13) {
            uint64_t v11 = (uint64_t)(v13 - 1);
          }
          else {
            uint64_t v11 = 0;
          }
        }
        else
        {
          uint64_t v11 = (uint64_t)(v15 - 1);
        }
      }
      [(THWPageControlRep *)self p_changeToPageAtIndex:v11];
    }
    goto LABEL_31;
  }
  double v18 = self;
  uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_23:
  [(THWPageControlRep *)v18 setHighlightedPageIndex:v19];
LABEL_31:
  LOBYTE(v7) = 1;
  return (char)v7;
}

- (void)p_changeToPageAtIndex:(unint64_t)a3
{
  id v5 = [self layout].currentPage;
  if (v5 != (id)a3)
  {
    id v6 = v5;
    [self layout].setCurrentPage:a3;
    id v7 = [(THWPageControlRep *)self delegate];
    [(THWPageControlDelegate *)v7 pageControl:self didChangeInteractivelyFromPageIndex:v6 toPageIndex:a3];
  }
}

- (void)setHighlightedPageIndex:(unint64_t)a3
{
  uint64_t v3 = *(unint64_t *)((char *)&self->_highlightedPageIndex + 1);
  if (v3 != a3)
  {
    *(unint64_t *)((char *)&self->_highlightedPageIndex + 1) = a3;
    id v5 = [(THWPageControlRep *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = *(unint64_t *)((char *)&self->_highlightedPageIndex + 1);
      [(THWPageControlDelegate *)v5 pageControl:self didChangeHighlightedFromPageIndex:v3 toPageIndex:v6];
    }
  }
}

- (THWPageControlDelegate)delegate
{
  return *(THWPageControlDelegate **)((char *)&self->_delegate + 1);
}

- (void)setDelegate:(id)a3
{
  *(THWPageControlDelegate **)((char *)&self->_delegate + 1) = (THWPageControlDelegate *)a3;
}

- (BOOL)pageDirectlyToIndex
{
  return self->_pageDirectlyToIndex;
}

- (void)setPageDirectlyToIndex:(BOOL)a3
{
  self->_pageDirectlyToIndedouble x = a3;
}

- (unint64_t)highlightedPageIndex
{
  return *(unint64_t *)((char *)&self->_highlightedPageIndex + 1);
}

- (NSMutableArray)indicators
{
  return *(NSMutableArray **)((char *)&self->_indicators + 1);
}

- (unint64_t)currentPage
{
  return *(unint64_t *)((char *)&self->_currentPage + 1);
}

- (THWLabelLayer)textIndicator
{
  return *(THWLabelLayer **)((char *)&self->_textIndicator + 1);
}

- (TSUIntegerKeyDictionary)cachedLayers
{
  return *(TSUIntegerKeyDictionary **)((char *)&self->_cachedLayers + 1);
}

@end