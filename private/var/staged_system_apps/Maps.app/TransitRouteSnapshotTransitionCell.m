@interface TransitRouteSnapshotTransitionCell
+ (id)snapshotToTransitionFromCell:(id)a3 toCell:(id)a4 withBackgroundBlur:(BOOL)a5;
- (id)initToTransitionFromCell:(id)a3 toCell:(id)a4 withBackgroundBlur:(BOOL)a5;
- (void)updateWithTransitionProgress:(double)a3;
@end

@implementation TransitRouteSnapshotTransitionCell

- (id)initToTransitionFromCell:(id)a3 toCell:(id)a4 withBackgroundBlur:(BOOL)a5
{
  BOOL v5 = a5;
  id v67 = a3;
  id v68 = a4;
  [v67 frame];
  v85.receiver = self;
  v85.super_class = (Class)TransitRouteSnapshotTransitionCell;
  v8 = -[TransitRouteSnapshotTransitionCell initWithFrame:](&v85, "initWithFrame:");
  if (v8)
  {
    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    updateHandlers = v8->_updateHandlers;
    v8->_updateHandlers = v9;

    if (v5)
    {
      v11 = +[RoutingAppearanceManager customGrayBlurCellBackgroundView];
    }
    else
    {
      v11 = 0;
    }
    [v67 bounds];
    v13 = v12;
    v15 = v14;
    [v68 bounds];
    v17 = v16;
    v19 = v18;
    [(TransitRouteSnapshotTransitionCell *)v8 frame];
    -[TransitRouteSnapshotTransitionCell setFrame:](v8, "setFrame:");
    if (v5) {
      [v11 setFrame:CGRectZero.origin.x, CGRectZero.origin.y, *(double *)&v13, *(double *)&v15];
    }
    objc_initWeak(&location, v8);
    v20 = v8->_updateHandlers;
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_1008D3B84;
    v80[3] = &unk_1012FFB50;
    v82[1] = v13;
    v82[2] = v15;
    v82[3] = v17;
    v82[4] = v19;
    objc_copyWeak(v82, &location);
    BOOL v83 = v5;
    id v66 = v11;
    id v81 = v66;
    v21 = objc_retainBlock(v80);
    [(NSMutableArray *)v20 addObject:v21];

    if (v5) {
      [(TransitRouteSnapshotTransitionCell *)v8 addSubview:v66];
    }
    v22 = [v67 _indexedContentSubviewOrNullArray];
    v23 = [v68 _indexedContentSubviewOrNullArray];
    for (unint64_t i = 0; ; ++i)
    {
      if (i >= (unint64_t)[v22 count])
      {
        v64 = v8;

        objc_destroyWeak(v82);
        objc_destroyWeak(&location);

        goto LABEL_38;
      }
      v25 = [v22 objectAtIndexedSubscript:i];
      v26 = +[NSNull null];
      if (v25 == v26)
      {
        v27 = 0;
      }
      else
      {
        v27 = [v22 objectAtIndexedSubscript:i];
      }

      v28 = [v23 objectAtIndexedSubscript:i];
      v29 = +[NSNull null];
      if (v28 == v29)
      {
        v30 = 0;
      }
      else
      {
        v30 = [v23 objectAtIndexedSubscript:i];
      }

      if (!v27)
      {
        if (v30) {
          break;
        }
      }
      if (v27 && !v30)
      {
        v36 = [v27 snapshotViewAfterScreenUpdates:1];
        [v27 bounds];
        [v67 convertRect:v27 fromView:];
        [v36 setFrame:];
        [v36 setAlpha:1.0];
        v37 = v8->_updateHandlers;
        v76[0] = _NSConcreteStackBlock;
        v76[1] = 3221225472;
        v76[2] = sub_1008D3C68;
        v76[3] = &unk_1012EB730;
        id v33 = v36;
        id v77 = v33;
        v38 = objc_retainBlock(v76);
        [(NSMutableArray *)v37 addObject:v38];

        [(TransitRouteSnapshotTransitionCell *)v8 addSubview:v33];
        id v35 = v77;
        goto LABEL_35;
      }
      if (v27 && v30)
      {
        v39 = [v30 snapshotViewAfterScreenUpdates:1];
        v40 = [v27 snapshotViewAfterScreenUpdates:1];
        if (MKApplicationLayoutDirectionIsRightToLeft()) {
          double v41 = 1.0;
        }
        else {
          double v41 = 0.0;
        }
        if (MKApplicationLayoutDirectionIsRightToLeft())
        {
          [v27 bounds];
          double MaxX = CGRectGetMaxX(v86);
        }
        else
        {
          [v27 bounds];
        }
        double v43 = MaxX;
        [v27 bounds];
        double v45 = v44;
        if (MKApplicationLayoutDirectionIsRightToLeft())
        {
          [v30 bounds];
          double v46 = CGRectGetMaxX(v87);
        }
        else
        {
          [v30 bounds];
        }
        double v47 = v46;
        [v30 bounds];
        double v49 = v48;
        [v67 convertPoint:v27 fromView:v43];
        double v51 = v50;
        double v53 = v52;
        [v68 convertPoint:v30 fromView:v47];
        uint64_t v55 = v54;
        uint64_t v57 = v56;
        [v39 setAlpha:0.0];
        [v40 setAlpha:1.0];
        v58 = [v39 layer];
        [v58 setAnchorPoint:v41, 0.0];
        v59 = [v40 layer];
        [v59 setAnchorPoint:v41, 0.0];

        v60 = [v39 layer];
        [v60 setPosition:v51, v53];
        v61 = [v40 layer];
        [v61 setPosition:v51, v53];

        v62 = v8->_updateHandlers;
        v69[0] = _NSConcreteStackBlock;
        v69[1] = 3221225472;
        v69[2] = sub_1008D3C78;
        v69[3] = &unk_1012FFB78;
        id v35 = v40;
        id v70 = v35;
        id v33 = v39;
        id v71 = v33;
        double v72 = v51;
        double v73 = v53;
        uint64_t v74 = v55;
        uint64_t v75 = v57;
        v63 = objc_retainBlock(v69);
        [(NSMutableArray *)v62 addObject:v63];

        [(TransitRouteSnapshotTransitionCell *)v8 addSubview:v35];
        [(TransitRouteSnapshotTransitionCell *)v8 addSubview:v33];

        goto LABEL_35;
      }
LABEL_36:
    }
    v31 = [v30 snapshotViewAfterScreenUpdates:1];
    [v30 bounds];
    [v68 convertRect:v30 fromView:];
    [v31 setFrame:];
    [v31 setAlpha:0.0];
    v32 = v8->_updateHandlers;
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_1008D3C60;
    v78[3] = &unk_1012EB730;
    id v33 = v31;
    id v79 = v33;
    v34 = objc_retainBlock(v78);
    [(NSMutableArray *)v32 addObject:v34];

    [(TransitRouteSnapshotTransitionCell *)v8 addSubview:v33];
    id v35 = v79;
LABEL_35:

    goto LABEL_36;
  }
LABEL_38:

  return v8;
}

+ (id)snapshotToTransitionFromCell:(id)a3 toCell:(id)a4 withBackgroundBlur:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initToTransitionFromCell:v9 toCell:v8 withBackgroundBlur:v5];

  return v10;
}

- (void)updateWithTransitionProgress:(double)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = self->_updateHandlers;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(double))(*(void *)(*((void *)&v9 + 1) + 8 * (void)v8) + 16))(a3);
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
}

@end