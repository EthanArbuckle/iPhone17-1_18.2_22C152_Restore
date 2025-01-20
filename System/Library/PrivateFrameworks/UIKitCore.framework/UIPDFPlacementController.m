@interface UIPDFPlacementController
- (CGRect)boundsForObjectAtIndex:(unint64_t)a3;
- (UIPDFPageView)pageView;
- (UIPDFPlacementController)initWithAnnotations:(id)a3 viewSize:(CGSize)a4;
- (double)yForObjectAtIndex:(unint64_t)a3;
- (id)viewAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)layoutViews:(double)a3;
- (void)setPageView:(id)a3;
- (void)shift:(double)a3;
@end

@implementation UIPDFPlacementController

- (UIPDFPlacementController)initWithAnnotations:(id)a3 viewSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)UIPDFPlacementController;
  v7 = [(UIPDFPlacementController *)&v19 init];
  v8 = v7;
  if (v7)
  {
    v7->_viewSize.CGFloat width = width;
    v7->_viewSize.CGFloat height = height;
    v7->_popups = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v9 = [a3 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(a3);
          }
          uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(NSMutableArray *)v8->_popups addObject:v13];
          }
        }
        uint64_t v10 = [a3 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v10);
    }
  }
  return v8;
}

- (void)dealloc
{
  [(NSMutableArray *)self->_popups removeAllObjects];

  v3.receiver = self;
  v3.super_class = (Class)UIPDFPlacementController;
  [(UIPDFPlacementController *)&v3 dealloc];
}

- (CGRect)boundsForObjectAtIndex:(unint64_t)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_popups, "objectAtIndex:", a3), "parent"), "selection");
  if ([v4 numberOfRectangles])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    memset(&v15, 0, sizeof(v15));
    [v4 getBounds:&v16 transform:&v15 index:0];
    CGAffineTransform v14 = v15;
    if (!CGAffineTransformIsIdentity(&v14))
    {
      CGAffineTransform v14 = v15;
      *(void *)&long long v16 = boundsForRotatedSelection((float64x2_t *)&v14, *(CGFloat *)&v16, *((CGFloat *)&v16 + 1), *(CGFloat *)&v17, *((CGFloat *)&v17 + 1));
      *((void *)&v16 + 1) = v5;
      *(void *)&long long v17 = v6;
      *((void *)&v17 + 1) = v7;
    }
    v8 = [(UIPDFPlacementController *)self pageView];
    -[UIPDFPageView convertRectFromPDFPageSpace:](v8, "convertRectFromPDFPageSpace:", v16, v17);
  }
  else
  {
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    long long v16 = *MEMORY[0x1E4F1DB28];
    long long v17 = v13;
    double v10 = *((double *)&v16 + 1);
    double v9 = *(double *)&v16;
    double v12 = *((double *)&v17 + 1);
    double v11 = *(double *)&v17;
  }
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (double)yForObjectAtIndex:(unint64_t)a3
{
  [(UIPDFPlacementController *)self boundsForObjectAtIndex:a3];
  return CGRectGetMinY(*(CGRect *)&v3);
}

- (id)viewAtIndex:(unint64_t)a3
{
  uint64_t v3 = (void *)[(NSMutableArray *)self->_popups objectAtIndex:a3];
  return (id)[v3 annotationView];
}

- (void)shift:(double)a3
{
  uint64_t v4 = [(NSMutableArray *)self->_popups count];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
    {
      id v7 = [(UIPDFPlacementController *)self viewAtIndex:i];
      [v7 frame];
      objc_msgSend(v7, "setFrame:");
    }
  }
}

- (void)layoutViews:(double)a3
{
  uint64_t v5 = [(NSMutableArray *)self->_popups count];
  if (v5)
  {
    uint64_t v6 = v5;
    double v61 = a3;
    [[(UIPDFPageView *)[(UIPDFPlacementController *)self pageView] page] cropBox];
    -[UIPDFPageView convertRectFromPDFPageSpace:](self->pageView, "convertRectFromPDFPageSpace:");
    CGFloat x = v69.origin.x;
    CGFloat y = v69.origin.y;
    CGFloat width = v69.size.width;
    CGFloat height = v69.size.height;
    double v11 = self->_viewSize.height;
    double MaxY = CGRectGetMaxY(v69);
    v70.origin.CGFloat x = x;
    v70.origin.CGFloat y = y;
    v70.size.CGFloat width = width;
    v70.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v70);
    v71.origin.CGFloat x = x;
    v71.origin.CGFloat y = y;
    v71.size.CGFloat width = width;
    v71.size.CGFloat height = height;
    CGFloat MaxX = CGRectGetMaxX(v71);
    double v16 = self->_viewSize.width;
    double v15 = self->_viewSize.height;
    double v17 = MaxX - v16;
    [(NSMutableArray *)self->_popups sortUsingFunction:sortByYAscendingThenX context:0];
    uint64_t v18 = 0;
    double v67 = MinY;
    do
    {
      [(UIPDFPlacementController *)self yForObjectAtIndex:v18];
      if (v19 >= MinY) {
        double v20 = v19;
      }
      else {
        double v20 = MinY;
      }
      double MinY = v11 + v20;
      objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_popups, "objectAtIndex:", v18++), "annotationView"), "setFrame:", v17, v20, v16, v15);
    }
    while (v6 != v18);
    id v21 = [(UIPDFPlacementController *)self viewAtIndex:0];
    uint64_t v22 = v6 - 1;
    id v23 = [(UIPDFPlacementController *)self viewAtIndex:v6 - 1];
    [v23 frame];
    double v25 = v11 + CGRectGetMinY(v72);
    if (v25 > MaxY)
    {
      [v21 frame];
      CGFloat v26 = CGRectGetMinY(v73);
      double v24 = v67;
      if (v26 - v67 > v15 && v25 > MaxY)
      {
        uint64_t v28 = v6 - 2;
        double v66 = MaxY;
        do
        {
          if (v22)
          {
            uint64_t v29 = v28;
            do
            {
              id v30 = [(UIPDFPlacementController *)self viewAtIndex:v29 + 1];
              id v31 = [(UIPDFPlacementController *)self viewAtIndex:v29];
              [v30 frame];
              double v33 = v32;
              double v35 = v34;
              double v37 = v36;
              double v39 = v38;
              [v31 frame];
              double v40 = CGRectGetMaxY(v74);
              v75.origin.CGFloat x = v33;
              v75.origin.CGFloat y = v35;
              v75.size.CGFloat width = v37;
              v75.size.CGFloat height = v39;
              double v41 = CGRectGetMinY(v75);
              objc_msgSend(v30, "setFrame:", v33, v35 - v11, v37, v39);
              double v42 = v11 + v40;
              if (!v29) {
                break;
              }
              --v29;
            }
            while (v41 < v42);
            double MaxY = v66;
            if (v41 < v42)
            {
              [v21 frame];
              CGFloat v44 = v43;
              double v63 = v45;
              double v64 = v43;
              double v47 = v46;
              CGFloat v48 = v45;
              double v65 = v49;
              objc_msgSend(-[UIPDFPlacementController viewAtIndex:](self, "viewAtIndex:", 1), "frame");
              CGFloat v51 = v50;
              CGFloat v53 = v52;
              CGFloat v55 = v54;
              CGFloat recta = v56;
              v76.origin.CGFloat x = v44;
              v76.origin.CGFloat y = v47;
              v76.size.CGFloat width = v48;
              v76.size.CGFloat height = v65;
              double v57 = CGRectGetMaxY(v76);
              v77.origin.CGFloat x = v51;
              v77.origin.CGFloat y = v53;
              v77.size.CGFloat width = v55;
              v77.size.CGFloat height = recta;
              double MaxY = v66;
              objc_msgSend(v21, "setFrame:", v64, v47 - (v57 - CGRectGetMinY(v77)), v63, v65);
            }
          }
          [v23 frame];
          double v58 = CGRectGetMinY(v78);
          [v21 frame];
          CGFloat v59 = CGRectGetMinY(v79);
          double v24 = v11 + v58;
        }
        while (v59 - v67 > v15 && v24 > MaxY);
      }
    }
    -[UIPDFPlacementController shift:](self, "shift:", v61, v24);
  }
}

- (UIPDFPageView)pageView
{
  return self->pageView;
}

- (void)setPageView:(id)a3
{
  self->pageView = (UIPDFPageView *)a3;
}

@end