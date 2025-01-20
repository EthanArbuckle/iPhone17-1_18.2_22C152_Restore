@interface AEHighlightRenderingController
+ (CGRect)p_currentLineRectForLine:(id)a3 ofHighlight:(id)a4;
+ (CGRect)p_fullLineRectForLine:(id)a3 ofHighlight:(id)a4;
+ (UIEdgeInsets)highlightInsets:(BOOL)a3;
+ (UIEdgeInsets)insetsForHighlight:(id)a3;
+ (UIEdgeInsets)insetsForHighlight:(id)a3 lineRect:(CGRect)a4 numberOfLines:(unint64_t)a5;
- (AEHighlightRenderingController)init;
- (BOOL)canUseFilters;
- (BOOL)drawSpecialGrayHighlights;
- (BOOL)isAddingHighlights;
- (BOOL)layer:(id)a3 containsHighlightAtPoint:(CGPoint)a4;
- (NSMapTable)containerLayers;
- (NSMapTable)dataHighlights;
- (id)annotationUuidForHighlightLayer:(id)a3;
- (id)highlightLayers;
- (id)highlightWithData:(id)a3;
- (id)p_highlightForContainerLayer:(id)a3;
- (id)p_lineRectsForHighlight:(id)a3;
- (id)p_orderHighlights:(id)a3;
- (int)annotationBlendMode;
- (int64_t)pageTheme;
- (void)addHighlight:(id)a3 forData:(id)a4;
- (void)p_renderLinesForHighlight:(id)a3 intoContainerLayer:(id)a4;
- (void)removeAll;
- (void)removeHighlightForData:(id)a3;
- (void)setAddingHighlights:(BOOL)a3;
- (void)setAnnotationBlendMode:(int)a3;
- (void)setCanUseFilters:(BOOL)a3;
- (void)setContainerLayers:(id)a3;
- (void)setDataHighlights:(id)a3;
- (void)setDrawSpecialGrayHighlights:(BOOL)a3;
- (void)setPageTheme:(int64_t)a3;
- (void)updatedHighlight:(id)a3;
- (void)updatedHighlight:(id)a3 forceRerender:(BOOL)a4;
@end

@implementation AEHighlightRenderingController

- (AEHighlightRenderingController)init
{
  v6.receiver = self;
  v6.super_class = (Class)AEHighlightRenderingController;
  v2 = [(AEHighlightRenderingController *)&v6 init];
  if (v2)
  {
    v3 = +[NSMapTable strongToStrongObjectsMapTable];
    [(AEHighlightRenderingController *)v2 setDataHighlights:v3];

    v4 = +[NSMapTable strongToStrongObjectsMapTable];
    [(AEHighlightRenderingController *)v2 setContainerLayers:v4];

    [(AEHighlightRenderingController *)v2 setAnnotationBlendMode:0];
  }
  return v2;
}

- (id)highlightWithData:(id)a3
{
  id v4 = a3;
  v5 = [(AEHighlightRenderingController *)self dataHighlights];
  objc_super v6 = [v5 objectForKey:v4];

  return v6;
}

+ (UIEdgeInsets)highlightInsets:(BOOL)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

+ (UIEdgeInsets)insetsForHighlight:(id)a3
{
  double v4 = [a3 annotation];
  [a1 highlightInsets:[v4 annotationIsUnderline]];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6 + 0.0;
  double v14 = v10 + 0.0;
  double v15 = v8;
  double v16 = v12;
  result.right = v16;
  result.bottom = v14;
  result.left = v15;
  result.top = v13;
  return result;
}

+ (UIEdgeInsets)insetsForHighlight:(id)a3 lineRect:(CGRect)a4 numberOfLines:(unint64_t)a5
{
  id v5 = a3;
  +[AEHighlightRenderingController insetsForHighlight:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  unsigned int v14 = [v5 vertical];

  if (v14) {
    double v15 = v7;
  }
  else {
    double v15 = v13;
  }
  if (v14) {
    double v16 = v9;
  }
  else {
    double v16 = v11;
  }
  if (v14) {
    double v17 = v11;
  }
  else {
    double v17 = v9;
  }
  if (v14) {
    double v18 = v13;
  }
  else {
    double v18 = v7;
  }
  result.right = v15;
  result.bottom = v16;
  result.left = v17;
  result.top = v18;
  return result;
}

+ (CGRect)p_currentLineRectForLine:(id)a3 ofHighlight:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 currentLineRect];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  unsigned __int8 v16 = [v7 includesCapSpace];

  if ((v16 & 1) == 0)
  {
    [a1 insetsForHighlight:v6];
    double v9 = v9 + v17;
    double v11 = v11 + v18;
    double v13 = v13 - (v17 + v19);
    double v15 = v15 - (v18 + v20);
  }

  double v21 = v9;
  double v22 = v11;
  double v23 = v13;
  double v24 = v15;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

+ (CGRect)p_fullLineRectForLine:(id)a3 ofHighlight:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 fullLineRect];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  unsigned __int8 v16 = [v7 includesCapSpace];

  if ((v16 & 1) == 0)
  {
    [a1 insetsForHighlight:v6];
    double v9 = v9 + v17;
    double v11 = v11 + v18;
    double v13 = v13 - (v17 + v19);
    double v15 = v15 - (v18 + v20);
  }

  double v21 = v9;
  double v22 = v11;
  double v23 = v13;
  double v24 = v15;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)p_lineRectsForHighlight:(id)a3
{
  id v3 = a3;
  double v4 = [v3 lines];
  id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        [objc_opt_class() p_currentLineRectForLine:*((void *)&v13 + 8 * i) ofHighlight:v3 v13];
        double v11 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:");
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)p_renderLinesForHighlight:(id)a3 intoContainerLayer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  id v8 = [(AEHighlightRenderingController *)self p_lineRectsForHighlight:v6];
  uint64_t v9 = [v6 annotation];
  id v10 = [v9 annotationIsUnderline];

  v68 = self;
  if ([(AEHighlightRenderingController *)self canUseFilters]) {
    uint64_t v11 = [(AEHighlightRenderingController *)self annotationBlendMode];
  }
  else {
    uint64_t v11 = 0;
  }
  [v7 setBlendMode:v11];
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v16 = v8;
  id v17 = [v16 countByEnumeratingWithState:&v79 objects:v85 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v80;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v80 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v79 + 1) + 8 * i) CGRectValue];
        CGFloat v21 = v86.origin.x;
        CGFloat v22 = v86.origin.y;
        CGFloat v23 = v86.size.width;
        CGFloat v24 = v86.size.height;
        if (!CGRectIsEmpty(v86))
        {
          v87.origin.double x = x;
          v87.origin.double y = y;
          v87.size.double width = width;
          v87.size.double height = height;
          v94.origin.double x = v21;
          v94.origin.double y = v22;
          v94.size.double width = v23;
          v94.size.double height = v24;
          CGRect v88 = CGRectUnion(v87, v94);
          double x = v88.origin.x;
          double y = v88.origin.y;
          double width = v88.size.width;
          double height = v88.size.height;
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v79 objects:v85 count:16];
    }
    while (v18);
  }

  v89.origin.double x = x;
  v89.origin.double y = y;
  v89.size.double width = width;
  v89.size.double height = height;
  if (CGRectIsNull(v89))
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }
  v69 = v7;
  [v7 setFrame:CGRectMake(x, y, width, height)];
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  v70 = v6;
  v26 = [v6 lines];
  id v27 = [v26 countByEnumeratingWithState:&v75 objects:v84 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = 0;
    uint64_t v30 = *(void *)v76;
    do
    {
      for (j = 0; j != v28; j = (char *)j + 1)
      {
        if (*(void *)v76 != v30) {
          objc_enumerationMutation(v26);
        }
        v32 = *(void **)(*((void *)&v75 + 1) + 8 * (void)j);
        v33 = [v16 objectAtIndexedSubscript:(char *)j + v29];
        [v33 CGRectValue];
        CGFloat v35 = v34;
        CGFloat v37 = v36;
        double v39 = v38;
        double v41 = v40;

        v90.origin.double x = v35;
        v90.origin.double y = v37;
        v90.size.double width = v39;
        v90.size.double height = v41;
        if (!CGRectIsEmpty(v90))
        {
          CGPointSubtract();
          double v43 = v42;
          double v45 = v44;
          if (v10)
          {
            unsigned int v46 = [v32 underlineDirection];
            if (v46 == 2)
            {
              v92.origin.double x = v43;
              v92.origin.double y = v45;
              v92.size.double width = v39;
              v92.size.double height = v41;
              double v43 = CGRectGetMaxX(v92) + -2.0;
            }
            else
            {
              if (v46 != 1)
              {
                if (!v46)
                {
                  v91.origin.double x = v43;
                  v91.origin.double y = v45;
                  v91.size.double width = v39;
                  v91.size.double height = v41;
                  double v45 = CGRectGetMaxY(v91) + -2.0;
                  double v41 = 2.0;
                }
                goto LABEL_29;
              }
              double v43 = v43 + 0.0;
            }
            double v39 = 2.0;
          }
LABEL_29:
          [v70 cornerRadius];
          if (v47 <= 0.0)
          {
            v93.origin.double x = v43;
            v93.origin.double y = v45;
            v93.size.double width = v39;
            v93.size.double height = v41;
            CGPathAddRect(Mutable, 0, v93);
          }
          else
          {
            [v70 cornerRadius];
            +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v43, v45, v39, v41, v48);
            id v49 = objc_claimAutoreleasedReturnValue();
            CGPathAddPath(Mutable, 0, (CGPathRef)[v49 CGPath]);
          }
          continue;
        }
      }
      id v28 = [v26 countByEnumeratingWithState:&v75 objects:v84 count:16];
      v29 += (uint64_t)j;
    }
    while (v28);
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v50 = [v69 sublayers];
  id v51 = [v50 copy];

  id v52 = [v51 countByEnumeratingWithState:&v71 objects:v83 count:16];
  if (v52)
  {
    id v53 = v52;
    uint64_t v54 = *(void *)v72;
    do
    {
      for (k = 0; k != v53; k = (char *)k + 1)
      {
        if (*(void *)v72 != v54) {
          objc_enumerationMutation(v51);
        }
        [*(id *)(*((void *)&v71 + 1) + 8 * (void)k) removeFromSuperlayer];
      }
      id v53 = [v51 countByEnumeratingWithState:&v71 objects:v83 count:16];
    }
    while (v53);
  }

  v56 = [v70 annotation];
  v57 = +[AEAnnotationTheme themeForAnnotationStyle:pageTheme:isUnderline:](AEAnnotationTheme, "themeForAnnotationStyle:pageTheme:isUnderline:", [v56 annotationStyle], -[AEHighlightRenderingController pageTheme](v68, "pageTheme"), v10);

  v58 = [v57 highlightColor];
  if ((char *)[(AEHighlightRenderingController *)v68 pageTheme] != (char *)&def_7D91C + 3)
  {
    uint64_t v59 = [v58 bkaxAdjustedDarkerForIncreaseContrast];

    v58 = (void *)v59;
  }
  +[AEAnnotationTheme highlightOpacityForPageTheme:[(AEHighlightRenderingController *)v68 pageTheme]];
  v60 = [v58 colorWithAlphaComponent:];

  if ([(AEHighlightRenderingController *)v68 drawSpecialGrayHighlights]
    && (char *)[(AEHighlightRenderingController *)v68 pageTheme] == (char *)&def_7D91C + 2)
  {
    v61 = +[CAShapeLayer layer];
    id v62 = +[UIColor blackColor];
    [v61 setFillColor:[v62 CGColor]];

    v63 = v69;
    [v69 bounds];
    [v61 setBounds:];
    double v64 = CGPointZero.y;
    [v61 setAnchorPoint:CGPointZero.x, v64];
    [v61 setPosition:CGPointZero.x, v64];
    [v61 setPath:Mutable];
    [v69 addSublayer:v61];
    v65 = +[CAShapeLayer layer];
    [v65 setFillColor:[v60 CGColor]];
    [v69 bounds];
    [v65 setBounds:];
    [v65 setAnchorPoint:CGPointZero.x, v64];
    [v65 setPosition:CGPointZero.x, v64];
    [v65 setPath:Mutable];
    [v69 addSublayer:v65];
  }
  else
  {
    v63 = v69;
    [v69 setFillColor:[v60 CGColor]];
  }
  [v63 setPath:Mutable];
  CGPathRelease(Mutable);
  [v63 setHidden:0];
  v66 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", x, y, width, height);
  [v63 setValue:v66 forKey:@"kAEHighlightLayerCurrentRectKey"];

  v67 = [(AEHighlightRenderingController *)v68 containerLayers];
  [v67 setObject:v63 forKey:v70];

  +[CATransaction commit];
}

- (void)addHighlight:(id)a3 forData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AEHighlightRenderingController *)self dataHighlights];
  [v8 setObject:v7 forKey:v6];

  id v9 = +[AEHighlightContainerLayer layer];
  [(AEHighlightRenderingController *)self p_renderLinesForHighlight:v7 intoContainerLayer:v9];
}

- (void)removeHighlightForData:(id)a3
{
  id v10 = a3;
  double v4 = [(AEHighlightRenderingController *)self dataHighlights];
  id v5 = [v4 objectForKey:v10];

  if (v5)
  {
    id v6 = [(AEHighlightRenderingController *)self containerLayers];
    id v7 = [v6 objectForKey:v5];

    id v8 = [(AEHighlightRenderingController *)self containerLayers];
    [v8 removeObjectForKey:v5];

    [v7 removeFromSuperlayer];
    id v9 = [(AEHighlightRenderingController *)self dataHighlights];
    [v9 removeObjectForKey:v10];
  }
}

- (void)removeAll
{
  id v3 = [(AEHighlightRenderingController *)self dataHighlights];
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = [(AEHighlightRenderingController *)self dataHighlights];
    id v6 = NSAllMapTableKeys(v5);
    id v7 = [v6 copy];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        double v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          -[AEHighlightRenderingController removeHighlightForData:](self, "removeHighlightForData:", *(void *)(*((void *)&v13 + 1) + 8 * (void)v12), (void)v13);
          double v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)updatedHighlight:(id)a3 forceRerender:(BOOL)a4
{
  id v5 = a3;
  if (v5)
  {
    id v8 = v5;
    id v6 = [(AEHighlightRenderingController *)self containerLayers];
    id v7 = [v6 objectForKey:v8];

    if (!v7)
    {
      id v7 = +[AEHighlightContainerLayer layer];
    }
    [(AEHighlightRenderingController *)self p_renderLinesForHighlight:v8 intoContainerLayer:v7];
  }

  _objc_release_x1();
}

- (void)updatedHighlight:(id)a3
{
}

- (id)p_orderHighlights:(id)a3
{
  return [a3 sortedArrayUsingComparator:&stru_2C81C8];
}

- (id)highlightLayers
{
  id v3 = +[NSMutableArray array];
  id v4 = [(AEHighlightRenderingController *)self dataHighlights];
  id v5 = [v4 objectEnumerator];
  id v6 = [v5 allObjects];
  id v7 = [(AEHighlightRenderingController *)self p_orderHighlights:v6];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      double v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v12);
        long long v14 = [(AEHighlightRenderingController *)self containerLayers];
        long long v15 = [v14 objectForKey:v13];

        if (v15) {
          [v3 addObject:v15];
        }
        else {
          BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AssetsEngine/AECore/Annotations/AEHighlightRenderingController.m", 393, (uint64_t)"-[AEHighlightRenderingController highlightLayers]", (uint64_t)"containerLayer", 0, v16, v17, v18, v21);
        }

        double v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v19 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      id v10 = v19;
    }
    while (v19);
  }

  return v3;
}

- (id)p_highlightForContainerLayer:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(AEHighlightRenderingController *)self containerLayers];
  id v6 = [v5 keyEnumerator];

  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        double v12 = [(AEHighlightRenderingController *)self containerLayers];
        id v13 = [v12 objectForKey:v11];

        if (v13 == v4)
        {
          id v14 = v11;

          goto LABEL_11;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (id)annotationUuidForHighlightLayer:(id)a3
{
  id v3 = [(AEHighlightRenderingController *)self p_highlightForContainerLayer:a3];
  id v4 = [v3 annotation];
  id v5 = [v4 annotationUuid];

  return v5;
}

- (BOOL)layer:(id)a3 containsHighlightAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  objc_opt_class();
  uint64_t v11 = BUDynamicCast();
  if (!v11) {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AssetsEngine/AECore/Annotations/AEHighlightRenderingController.m", 432, (uint64_t)"-[AEHighlightRenderingController layer:containsHighlightAtPoint:]", (uint64_t)"shapeLayer", 0, v8, v9, v10, v30);
  }
  long long v15 = [(AEHighlightRenderingController *)self p_highlightForContainerLayer:v7];
  if (!v15)
  {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AssetsEngine/AECore/Annotations/AEHighlightRenderingController.m", 434, (uint64_t)"-[AEHighlightRenderingController layer:containsHighlightAtPoint:]", (uint64_t)"highlight", 0, v12, v13, v14, v30);
    unsigned __int8 v28 = [v7 containsPoint:x, y];
    goto LABEL_17;
  }
  if (!objc_msgSend(v7, "containsPoint:", x, y))
  {
    LOBYTE(v20) = 0;
    goto LABEL_20;
  }
  long long v16 = [v15 annotation];
  unsigned int v17 = [v16 annotationIsUnderline];

  if (!v17)
  {
    id v27 = (const CGPath *)[v11 path];
    v35.double x = x;
    v35.double y = y;
    unsigned __int8 v28 = CGPathContainsPoint(v27, 0, v35, 0);
LABEL_17:
    LOBYTE(v20) = v28;
    goto LABEL_20;
  }
  long long v18 = [(AEHighlightRenderingController *)self p_lineRectsForHighlight:v15];
  [v11 frame];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v19 = v18;
  id v20 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v31;
    while (2)
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v30 + 1) + 8 * i) CGRectValue:(void)v30];
        CGFloat v24 = v23;
        CGFloat v26 = v25;
        CGPointSubtract();
        v37.size.double width = v24;
        v37.size.double height = v26;
        v36.double x = x;
        v36.double y = y;
        if (CGRectContainsPoint(v37, v36))
        {
          LOBYTE(v20) = 1;
          goto LABEL_19;
        }
      }
      id v20 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
LABEL_19:

LABEL_20:
  return (char)v20;
}

- (BOOL)canUseFilters
{
  return self->_canUseFilters;
}

- (void)setCanUseFilters:(BOOL)a3
{
  self->_canUseFilters = a3;
}

- (int)annotationBlendMode
{
  return self->_annotationBlendMode;
}

- (void)setAnnotationBlendMode:(int)a3
{
  self->_annotationBlendMode = a3;
}

- (int64_t)pageTheme
{
  return self->_pageTheme;
}

- (void)setPageTheme:(int64_t)a3
{
  self->_pageTheme = a3;
}

- (BOOL)drawSpecialGrayHighlights
{
  return self->_drawSpecialGrayHighlights;
}

- (void)setDrawSpecialGrayHighlights:(BOOL)a3
{
  self->_drawSpecialGrayHighlights = a3;
}

- (BOOL)isAddingHighlights
{
  return self->_addingHighlights;
}

- (void)setAddingHighlights:(BOOL)a3
{
  self->_addingHighlights = a3;
}

- (NSMapTable)dataHighlights
{
  return self->_dataHighlights;
}

- (void)setDataHighlights:(id)a3
{
}

- (NSMapTable)containerLayers
{
  return self->_containerLayers;
}

- (void)setContainerLayers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerLayers, 0);

  objc_storeStrong((id *)&self->_dataHighlights, 0);
}

@end