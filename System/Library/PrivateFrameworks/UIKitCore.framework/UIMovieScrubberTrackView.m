@interface UIMovieScrubberTrackView
- (BOOL)zoomAtPoint:(CGPoint)a3;
- (UIMovieScrubberTrackView)initWithFrame:(CGRect)a3;
- (UIMovieScrubberTrackViewDataSource)dataSource;
- (UIMovieScrubberTrackViewDelegate)delegate;
- (double)zoomAnimationDuration;
- (id)_createImageViewForTimestamp:(id)a3 isSummaryThumbnail:(BOOL)a4;
- (void)_reallyReloadData;
- (void)_setOverlayViewIsZoomed:(BOOL)a3 minValue:(float)a4 maxValue:(float)a5;
- (void)_unzoomAnimationDidFinish;
- (void)_zoomAnimationDidFinish;
- (void)animateFillFramesAway;
- (void)clear;
- (void)layoutSubviews;
- (void)reloadData;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEndValue:(double)a3;
- (void)setStartValue:(double)a3;
- (void)setThumbnailImage:(CGImage *)a3 forTimestamp:(id)a4;
- (void)setValue:(double)a3;
- (void)setZoomAnimationDuration:(double)a3;
- (void)unzoom;
@end

@implementation UIMovieScrubberTrackView

- (UIMovieScrubberTrackView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v15.receiver = self;
  v15.super_class = (Class)UIMovieScrubberTrackView;
  v5 = -[UIView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    v6 = +[UIColor colorWithWhite:0.0 alpha:1.0];
    [(UIView *)v5 setBackgroundColor:v6];

    [(UIView *)v5 setClipsToBounds:1];
    [(UIView *)v5 setUserInteractionEnabled:0];
    [(UIView *)v5 setOpaque:0];
    [(UIView *)v5 setContentMode:3];
    v5->_zoomAnimationDuration = 0.5;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    thumbnailViews = v5->_thumbnailViews;
    v5->_thumbnailViews = v7;

    v9 = [UIView alloc];
    [(UIView *)v5 bounds];
    uint64_t v10 = -[UIView initWithFrame:](v9, "initWithFrame:");
    maskContainerView = v5->_maskContainerView;
    v5->_maskContainerView = (UIView *)v10;

    [(UIView *)v5->_maskContainerView setAutoresizingMask:2];
    [(UIView *)v5->_maskContainerView setUserInteractionEnabled:0];
    [(UIView *)v5->_maskContainerView setOpaque:0];
    v12 = -[UIMovieScrubberTrackOverlayView initWithFrame:]([UIMovieScrubberTrackOverlayView alloc], "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), width, height);
    overlayView = v5->_overlayView;
    v5->_overlayView = v12;

    [(UIView *)v5->_overlayView setAutoresizingMask:2];
    [(UIView *)v5->_maskContainerView addSubview:v5->_overlayView];
    [(UIView *)v5 addSubview:v5->_maskContainerView];
  }
  return v5;
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    [(UIView *)self setNeedsLayout];
    v5 = obj;
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (!obj || WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(_WORD *)&self->_trackFlags = *(_WORD *)&self->_trackFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      __int16 v6 = 2;
    }
    else {
      __int16 v6 = 0;
    }
    *(_WORD *)&self->_trackFlags = *(_WORD *)&self->_trackFlags & 0xFFFD | v6;
    if (objc_opt_respondsToSelector()) {
      __int16 v7 = 4;
    }
    else {
      __int16 v7 = 0;
    }
    *(_WORD *)&self->_trackFlags = *(_WORD *)&self->_trackFlags & 0xFFFB | v7;
    if (objc_opt_respondsToSelector()) {
      __int16 v8 = 8;
    }
    else {
      __int16 v8 = 0;
    }
    *(_WORD *)&self->_trackFlags = *(_WORD *)&self->_trackFlags & 0xFFF7 | v8;
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 16;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&self->_trackFlags = *(_WORD *)&self->_trackFlags & 0xFFEF | v9;
    if (objc_opt_respondsToSelector()) {
      __int16 v10 = 32;
    }
    else {
      __int16 v10 = 0;
    }
    *(_WORD *)&self->_trackFlags = *(_WORD *)&self->_trackFlags & 0xFFDF | v10;
    char v11 = objc_opt_respondsToSelector();
    v5 = obj;
    if (v11) {
      __int16 v12 = 64;
    }
    else {
      __int16 v12 = 0;
    }
    *(_WORD *)&self->_trackFlags = *(_WORD *)&self->_trackFlags & 0xFFBF | v12;
  }
}

- (void)setValue:(double)a3
{
  if (self->_value != a3)
  {
    self->_value = a3;
    if ((*(_WORD *)&self->_trackFlags & 0x100) != 0) {
      self->_trackFlags.editingHandle = 0;
    }
    else {
      -[UIMovieScrubberTrackOverlayView setValue:](self->_overlayView, "setValue:");
    }
  }
}

- (void)setEditing:(BOOL)a3
{
  __int16 trackFlags = (__int16)self->_trackFlags;
  if (((((trackFlags & 0x100) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v5 = 256;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->___int16 trackFlags = trackFlags & 0xFEFF | v5;
    -[UIMovieScrubberTrackOverlayView setEditing:](self->_overlayView, "setEditing:");
    overlayView = self->_overlayView;
    if ((*(_WORD *)&self->_trackFlags & 0x100) != 0) {
      __int16 v7 = &OBJC_IVAR___UIMovieScrubberTrackView__startValue;
    }
    else {
      __int16 v7 = &OBJC_IVAR___UIMovieScrubberTrackView__value;
    }
    double v8 = *(double *)((char *)&self->super.super.super.isa + *v7);
    [(UIMovieScrubberTrackOverlayView *)overlayView setValue:v8];
  }
}

- (void)animateFillFramesAway
{
  *(_WORD *)&self->_trackFlags &= ~0x100u;
  [(UIMovieScrubberTrackOverlayView *)self->_overlayView animateFillFramesAway];
}

- (void)setStartValue:(double)a3
{
  if (self->_startValue != a3)
  {
    self->_startValue = a3;
    -[UIMovieScrubberTrackOverlayView setStartValue:](self->_overlayView, "setStartValue:");
  }
  if ((*(_WORD *)&self->_trackFlags & 0x100) != 0)
  {
    self->_trackFlags.editingHandle = 1;
    overlayView = self->_overlayView;
    [(UIMovieScrubberTrackOverlayView *)overlayView setEditingHandle:1];
  }
}

- (void)setEndValue:(double)a3
{
  if (self->_endValue != a3)
  {
    self->_endValue = a3;
    -[UIMovieScrubberTrackOverlayView setEndValue:](self->_overlayView, "setEndValue:");
  }
  if ((*(_WORD *)&self->_trackFlags & 0x100) != 0)
  {
    self->_trackFlags.editingHandle = 2;
    overlayView = self->_overlayView;
    [(UIMovieScrubberTrackOverlayView *)overlayView setEditingHandle:2];
  }
}

- (void)setThumbnailImage:(CGImage *)a3 forTimestamp:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v45 = self;
  __int16 v7 = [(NSMutableDictionary *)self->_thumbnailViews objectForKey:v6];
  uint64_t v8 = [v7 count];
  if (a3 && v8)
  {
    __int16 v9 = [[UIImage alloc] initWithCGImage:a3];
    double v10 = *MEMORY[0x1E4F1DAD8];
    double v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [(UIImage *)v9 size];
    double v13 = v12;
    double v15 = v14;
    _UIGraphicsBeginImageContextWithOptions(0, 0, v12, v14, 1.0);
    v42 = v9;
    -[UIImage drawInRect:](v9, "drawInRect:", v10, v11, v13, v15);
    v16 = +[UIColor colorWithWhite:0.0 alpha:0.2];
    [v16 set];

    v64.origin.x = v13 + -1.0;
    v64.origin.y = 0.0;
    v64.size.double width = 1.0;
    v64.size.double height = v15;
    UIRectFillUsingBlendMode(v64, kCGBlendModeNormal);
    v17 = _UIGraphicsGetImageFromCurrentImageContext(0);
    UIGraphicsEndImageContext();
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v43 = v7;
    id v18 = v7;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v56 objects:v62 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v57 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          [v23 setImage:v17];
          [v23 setHasPlaceholderImage:0];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v56 objects:v62 count:16];
      }
      while (v20);
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = [(NSMutableDictionary *)v45->_thumbnailViews allKeys];
    uint64_t v24 = [obj countByEnumeratingWithState:&v52 objects:v61 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v53;
      uint64_t v44 = *(void *)v53;
      do
      {
        uint64_t v27 = 0;
        uint64_t v46 = v25;
        do
        {
          if (*(void *)v53 != v26) {
            objc_enumerationMutation(obj);
          }
          v28 = *(void **)(*((void *)&v52 + 1) + 8 * v27);
          [v28 doubleValue];
          double v30 = v29;
          [v6 doubleValue];
          if (v30 >= v31)
          {
            id v32 = v6;
            id v33 = [(NSMutableDictionary *)v45->_thumbnailViews objectForKey:v28];
            v34 = v33;
            id v35 = v18;
            if (v33 != v18)
            {
              long long v50 = 0u;
              long long v51 = 0u;
              long long v48 = 0u;
              long long v49 = 0u;
              uint64_t v36 = [v33 countByEnumeratingWithState:&v48 objects:v60 count:16];
              if (v36)
              {
                uint64_t v37 = v36;
                uint64_t v38 = *(void *)v49;
                do
                {
                  for (uint64_t j = 0; j != v37; ++j)
                  {
                    if (*(void *)v49 != v38) {
                      objc_enumerationMutation(v34);
                    }
                    v40 = *(void **)(*((void *)&v48 + 1) + 8 * j);
                    v41 = [v40 image];

                    if (!v41)
                    {
                      [v40 setImage:v17];
                      [v40 setHasPlaceholderImage:1];
                    }
                  }
                  uint64_t v37 = [v34 countByEnumeratingWithState:&v48 objects:v60 count:16];
                }
                while (v37);
              }
            }

            id v6 = v32;
            id v18 = v35;
            uint64_t v26 = v44;
            uint64_t v25 = v46;
          }
          ++v27;
        }
        while (v27 != v25);
        uint64_t v25 = [obj countByEnumeratingWithState:&v52 objects:v61 count:16];
      }
      while (v25);
    }

    __int16 v7 = v43;
  }
}

- (id)_createImageViewForTimestamp:(id)a3 isSummaryThumbnail:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  __int16 v7 = -[UIImageView initWithFrame:]([UIMovieScrubberThumbnailView alloc], "initWithFrame:", 0.0, 0.0, self->_thumbnailSize.width, self->_thumbnailSize.height);
  [(UIView *)v7 setUserInteractionEnabled:1];
  uint64_t v8 = [(NSMutableDictionary *)self->_thumbnailViews objectForKey:v6];
  if (v8)
  {
    __int16 v9 = v8;
    if ([v8 count])
    {
      double v10 = [v9 objectAtIndex:0];
      double v11 = [v10 image];

      if (v11)
      {
        [(UIImageView *)v7 setImage:v11];
      }
    }
    [v9 addObject:v7];
  }
  else
  {
    __int16 v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v7, 0);
    [(NSMutableDictionary *)self->_thumbnailViews setObject:v9 forKey:v6];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    [WeakRetained movieScrubberTrackView:self requestThumbnailImageForTimestamp:v6 isSummaryThumbnail:v4];
  }
  return v7;
}

- (void)clear
{
  v3 = [(NSMutableDictionary *)self->_thumbnailViews allValues];
  [v3 makeObjectsPerformSelector:sel_removeViewsFromSuperview];

  [(NSMutableDictionary *)self->_thumbnailViews removeAllObjects];
  thumbnailStartXValues = self->_thumbnailStartXValues;
  self->_thumbnailStartXValues = 0;

  childThumbnailViews = self->_childThumbnailViews;
  self->_childThumbnailViews = 0;

  summaryThumbnailViews = self->_summaryThumbnailViews;
  self->_summaryThumbnailViews = 0;

  summaryThumbnailTimestamps = self->_summaryThumbnailTimestamps;
  self->_summaryThumbnailTimestamps = 0;

  summaryThumbnailChildTimestamps = self->_summaryThumbnailChildTimestamps;
  self->_summaryThumbnailChildTimestamps = 0;

  timestamps = self->_timestamps;
  self->_timestamps = 0;
}

- (void)_reallyReloadData
{
  [(UIMovieScrubberTrackView *)self clear];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v60 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v61 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  [WeakRetained movieScrubberTrackViewThumbnailAspectRatio:self];
  double v7 = v6;

  self->_thumbnailSize.double height = 32.0;
  float v8 = v7 * 32.0;
  self->_thumbnailSize.double width = rintf(v8);
  id v9 = objc_loadWeakRetained((id *)&self->_dataSource);
  [v9 movieScrubberTrackViewDuration:self];
  double v11 = v10;

  [(UIView *)self bounds];
  LODWORD(v2) = vcvtpd_s64_f64(v12 / self->_thumbnailSize.width);
  id v13 = objc_loadWeakRetained((id *)&self->_dataSource);
  CGFloat v14 = [NSNumber numberWithDouble:0.0];
  double v15 = [NSNumber numberWithDouble:v11];
  v16 = [v13 movieScrubberTrackView:self evenlySpacedTimestamps:v2 startingAt:v14 endingAt:v15];

  int v17 = [(NSArray *)v16 count];
  int v18 = v17;
  p___int16 trackFlags = &self->_trackFlags;
  *((unsigned char *)&self->_trackFlags + 8) = *((unsigned char *)&self->_trackFlags + 8) & 0xFE | (v17 < (int)v2);
  BOOL v19 = v17 >= (int)v2 || v17 < 1;
  id v56 = v4;
  if (!v19)
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v20 count] < (unint64_t)(int)v2)
    {
      int v21 = v18 - 1;
      do
      {
        if (v21 >= v18) {
          int v22 = 0;
        }
        else {
          int v22 = v21;
        }
        v23 = -[NSArray objectAtIndex:](v16, "objectAtIndex:", v22, v56);
        [v20 addObject:v23];

        int v21 = v22 + 1;
      }
      while ([v20 count] < (unint64_t)(int)v2);
    }
    objc_msgSend(v20, "sortUsingSelector:", sel_compare_, v56);
    uint64_t v24 = (NSArray *)v20;

    int v18 = [(NSArray *)v24 count];
    v16 = v24;
    id v4 = v56;
  }
  double width = self->_thumbnailSize.width;
  double height = self->_thumbnailSize.height;
  id v58 = objc_loadWeakRetained((id *)&self->_delegate);
  if ((*(_WORD *)p_trackFlags & 8) != 0) {
    [v58 movieScrubberTrackViewWillBeginRequestingThumbnails:self];
  }
  if (v18 >= 1)
  {
    uint64_t v27 = 0;
    double v28 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    uint64_t v29 = v18;
    do
    {
      double v30 = -[NSArray objectAtIndex:](v16, "objectAtIndex:", v27, v56);
      id v31 = [(UIMovieScrubberTrackView *)self _createImageViewForTimestamp:v30 isSummaryThumbnail:1];
      [(UIView *)self->_maskContainerView addSubview:v31];
      float v32 = width * (double)(int)v27;
      objc_msgSend(v31, "setFrame:", rintf(v32) + 0.0, v28, width, height);
      [v4 addObject:v31];

      ++v27;
    }
    while (v29 != v27);
  }
  if ((*(_WORD *)p_trackFlags & 0x10) != 0) {
    [v58 movieScrubberTrackViewDidFinishRequestingThumbnails:self];
  }
  int v33 = [(NSArray *)v16 count];
  if ((*((unsigned char *)&self->_trackFlags + 8) & 1) == 0 && v33 >= 1)
  {
    uint64_t v34 = 0;
    uint64_t v35 = (v33 - 1);
    uint64_t v36 = v33;
    do
    {
      uint64_t v37 = [(NSArray *)v16 objectAtIndex:v34];
      if (v35 == v34) {
        [NSNumber numberWithDouble:v11];
      }
      else {
      uint64_t v38 = [(NSArray *)v16 objectAtIndex:v34 + 1];
      }
      id v39 = objc_loadWeakRetained((id *)&self->_dataSource);
      v40 = [v39 movieScrubberTrackView:self evenlySpacedTimestamps:5 startingAt:v37 endingAt:v38];

      int v41 = [v40 count];
      if (v41)
      {
        v42 = [v40 objectAtIndex:0];
        [v42 doubleValue];
        double v44 = v43;
        [v37 doubleValue];
        double v46 = v45;

        if (v44 == v46)
        {
          uint64_t v47 = objc_msgSend(v40, "subarrayWithRange:", 1, v41 - 1);

          v40 = (void *)v47;
        }
      }
      [(NSArray *)v60 addObject:v40];
      [(NSArray *)v61 addObject:v37];
      [(NSArray *)v61 addObjectsFromArray:v40];

      ++v34;
    }
    while (v36 != v34);
  }
  summaryThumbnailViews = self->_summaryThumbnailViews;
  self->_summaryThumbnailViews = v57;
  long long v49 = v57;

  summaryThumbnailTimestamps = self->_summaryThumbnailTimestamps;
  self->_summaryThumbnailTimestamps = v16;
  long long v51 = v16;

  summaryThumbnailChildTimestamps = self->_summaryThumbnailChildTimestamps;
  self->_summaryThumbnailChildTimestamps = v60;
  long long v53 = v60;

  timestamps = self->_timestamps;
  self->_timestamps = v61;
  long long v55 = v61;

  [(UIMovieScrubberTrackOverlayView *)self->_overlayView setMinimumValue:0.0];
  [(UIMovieScrubberTrackOverlayView *)self->_overlayView setMaximumValue:v11];
  [(UIView *)self->_overlayView layoutIfNeeded];
  self->_duration = v11;
  [(UIView *)self->_maskContainerView bringSubviewToFront:self->_overlayView];

  *(_WORD *)p_trackFlags &= ~0x80u;
}

- (void)reloadData
{
  *(_WORD *)&self->_trackFlags |= 0x80u;
  [(UIView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  if ((*(_WORD *)&self->_trackFlags & 0x80) != 0) {
    [(UIMovieScrubberTrackView *)self _reallyReloadData];
  }
  v3.receiver = self;
  v3.super_class = (Class)UIMovieScrubberTrackView;
  [(UIView *)&v3 layoutSubviews];
}

- (void)setZoomAnimationDuration:(double)a3
{
  float v3 = a3;
  self->_zoomAnimationDuration = v3;
}

- (double)zoomAnimationDuration
{
  return self->_zoomAnimationDuration;
}

- (BOOL)zoomAtPoint:(CGPoint)a3
{
  p___int16 trackFlags = &self->_trackFlags;
  if (*((unsigned char *)&self->_trackFlags + 8))
  {
    LOBYTE(v14) = 0;
  }
  else
  {
    double y = a3.y;
    double x = a3.x;
    int v7 = [(NSArray *)self->_summaryThumbnailViews count];
    int v8 = v7;
    double v9 = 0.0;
    if (x >= self->_thumbnailSize.width * (double)v7 + 0.0 + -1.0) {
      double x = self->_thumbnailSize.width * (double)v7 + 0.0 + -1.0;
    }
    [(UIView *)self->_maskContainerView setUserInteractionEnabled:1];
    double v10 = -[UIView hitTest:withEvent:](self->_maskContainerView, "hitTest:withEvent:", 0, x, y);
    [(UIView *)self->_maskContainerView setUserInteractionEnabled:0];
    int v11 = [(NSArray *)self->_summaryThumbnailViews indexOfObject:v10];
    int v12 = v11;
    LODWORD(v14) = v11 >= 0 && v11 < v8;
    if (v14 == 1)
    {
      v114 = v10;
      childThumbnailViews = self->_childThumbnailViews;
      self->_childThumbnailViews = 0;

      thumbnailStartXValues = self->_thumbnailStartXValues;
      self->_thumbnailStartXValues = 0;

      id v123 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v124 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v121 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      int v115 = v12;
      if (v12)
      {
        uint64_t v17 = 0;
        int v18 = 0;
        do
        {
          BOOL v19 = [(NSArray *)self->_summaryThumbnailChildTimestamps objectAtIndex:v17];
          v18 += [v19 count];

          ++v17;
        }
        while (v12 != v17);
        double v9 = (double)v18;
      }
      id v20 = [(UIView *)self superview];
      if ([v20 isInsideNavigationBar]) {
        EnclosingNavigationBar(v20);
      }
      else {
      int v21 = [v20 superview];
      }
      [v21 bounds];
      CGFloat v128 = v23;
      CGFloat v129 = v22;
      CGFloat v126 = v25;
      double v127 = v24;
      [(UIView *)self bounds];
      objc_msgSend(v21, "convertRect:fromView:", self);
      double v135 = v26;
      double v137 = v27;
      int v28 = [(NSArray *)self->_timestamps count];
      double width = self->_thumbnailSize.width;
      float v30 = width * (double)(v28 - v8);
      float v133 = rintf(v30);
      double v31 = v133;
      double v32 = -(width * v9);
      float v33 = v133 - width * v9;
      self->_unclampedZoomWidthDelta = v33;
      [(UIView *)self bounds];
      uint64_t v36 = &OBJC_IVAR___UIMovieScrubberTrackView__value;
      if ((*(_WORD *)p_trackFlags & 0x100) != 0)
      {
        unsigned int editingHandle = p_trackFlags->editingHandle;
        if (editingHandle == 2) {
          uint64_t v36 = &OBJC_IVAR___UIMovieScrubberTrackView__endValue;
        }
        if (editingHandle == 1) {
          uint64_t v36 = &OBJC_IVAR___UIMovieScrubberTrackView__startValue;
        }
      }
      float v38 = *(double *)((char *)&self->super.super.super.isa + *v36);
      double v39 = v35 + v31;
      float v40 = v32 - (v32 + v34 + (v35 + v31) * (v38 / self->_duration) - (v34 + v35 * (v38 / self->_duration)));
      float v41 = rintf(v40);
      double v42 = v41;
      [(UIView *)self bounds];
      objc_msgSend(v21, "convertRect:fromView:", self);
      CGFloat v44 = v43;
      CGFloat v46 = v45;
      CGFloat v139 = v47 + v41;
      CGFloat v141 = v48 + v31;
      v152.origin.double y = v128;
      v152.origin.double x = v129;
      v152.size.CGFloat height = v126;
      v152.size.double width = v127;
      CGRect v153 = CGRectInset(v152, -0.0, 0.0);
      v159.origin.double x = v139;
      v159.size.double width = v141;
      v159.origin.double y = v44;
      v159.size.CGFloat height = v46;
      CGRect v154 = CGRectIntersection(v153, v159);
      CGFloat v131 = v154.origin.x;
      CGFloat MaxX = CGRectGetMaxX(v154);
      v50.f64[0] = v131;
      v50.f64[1] = MaxX;
      float64x2_t v142 = vmulq_n_f64(vcvtq_f64_f32(vcvt_f32_f64(vdivq_f64(vsubq_f64(v50, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v139, 0)), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v141, 0)))), self->_duration);
      [v20 frame];
      double v110 = v52;
      double v111 = v51;
      double v108 = v54;
      double v109 = v53;
      v113 = v20;
      [v20 setFrame:v51 + v41];
      double duration = self->_duration;
      float v56 = duration / v39;
      *(float *)&double duration = duration;
      if (vabds_f32(v38, *(float *)&duration) >= v56) {
        double v57 = -v135;
      }
      else {
        double v57 = v135 * -2.0;
      }
      if (v57 >= v42)
      {
        float v58 = v57;
        float v59 = v58;
      }
      else
      {
        float v59 = v41;
      }
      self->_double zoomOriginXDelta = v59;
      double v60 = v127 - v137 + 0.0;
      float v61 = v60;
      BOOL v62 = v60 < v31;
      float v63 = v133;
      if (v62) {
        float v63 = v61;
      }
      self->_zoomWidthDelta = v63;
      double zoomOriginXDelta = self->_zoomOriginXDelta;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      id v66 = WeakRetained;
      v112 = p_trackFlags;
      if ((*(_WORD *)p_trackFlags & 8) != 0) {
        [WeakRetained movieScrubberTrackViewWillBeginRequestingThumbnails:self];
      }
      v107 = v66;
      uint64_t v67 = 0;
      int v68 = 0;
      double v105 = zoomOriginXDelta - v42;
      float32x2_t v106 = vcvt_f32_f64(v142);
      uint64_t v116 = v8;
      v122 = v21;
      do
      {
        v69 = -[NSArray objectAtIndex:](self->_summaryThumbnailViews, "objectAtIndex:", v67, *(void *)&v105);
        v70 = [v69 superview];
        [v69 frame];
        double v72 = v71;
        double v134 = v73;
        double v136 = v74;
        double v132 = v75;
        uint64_t v120 = v67;
        v125 = [(NSArray *)self->_summaryThumbnailChildTimestamps objectAtIndex:v67];
        int v76 = [v125 count];
        int v118 = v68;
        double v77 = v72 + self->_thumbnailSize.width * (double)v68;
        uint64_t v78 = [MEMORY[0x1E4F29238] valueWithPointer:v69];
        *(float *)&double v79 = v72;
        v80 = [NSNumber numberWithFloat:v79];
        [(NSDictionary *)v124 setObject:v80 forKey:v78];
        *(float *)&double v81 = v77;
        v82 = [NSNumber numberWithFloat:v81];
        v117 = (void *)v78;
        [v123 setObject:v82 forKey:v78];

        int v119 = v76;
        if (v76 >= 1)
        {
          int v83 = v67 - v115;
          if ((int)v67 - v115 < 0) {
            int v83 = v115 - v67;
          }
          double v143 = v136 / (double)v83;
          unint64_t v84 = v76 + 1;
          int v85 = v76;
          do
          {
            double v130 = v77 + self->_thumbnailSize.width * (double)v85;
            objc_msgSend(v21, "convertRect:fromView:", v70);
            CGFloat v86 = v155.origin.x;
            CGFloat v87 = v155.origin.y;
            CGFloat v88 = v155.size.width;
            CGFloat height = v155.size.height;
            double MinX = CGRectGetMinX(v155);
            v156.origin.double x = v129;
            v156.origin.double y = v128;
            v156.size.double width = v127;
            v156.size.CGFloat height = v126;
            double v138 = CGRectGetMaxX(v156);
            v157.origin.double x = v129;
            v157.origin.double y = v128;
            v157.size.double width = v127;
            v157.size.CGFloat height = v126;
            double v90 = CGRectGetMinX(v157);
            v158.origin.double x = v86;
            v158.origin.double y = v87;
            v158.size.double width = v88;
            v158.size.CGFloat height = height;
            if (v90 - CGRectGetMaxX(v158) - v143 <= 0.0 && MinX - v138 - v143 <= 0.0)
            {
              v91 = [v125 objectAtIndex:(v84 - 2)];
              id v92 = [(UIMovieScrubberTrackView *)self _createImageViewForTimestamp:v91 isSummaryThumbnail:0];
              [(NSDictionary *)v121 setObject:v92 forKey:v91];
              [(UIView *)self->_maskContainerView insertSubview:v92 below:v69];
              objc_msgSend(v92, "setFrame:", v72, v134, v136, v132);
              v93 = [MEMORY[0x1E4F29238] valueWithPointer:v92];
              [(NSDictionary *)v124 setObject:v80 forKey:v93];
              HIDWORD(v94) = HIDWORD(v130);
              *(float *)&double v94 = v130;
              v95 = [NSNumber numberWithFloat:v94];
              [v123 setObject:v95 forKey:v93];

              int v21 = v122;
            }
            --v84;
            --v85;
          }
          while (v84 > 1);
        }
        int v68 = v118 + v119;

        uint64_t v67 = v120 + 1;
      }
      while (v120 + 1 != v116);
      if ((*(_WORD *)v112 & 0x10) != 0) {
        [v107 movieScrubberTrackViewDidFinishRequestingThumbnails:self];
      }
      v96 = [(UIView *)self window];
      [v96 beginDisablingInterfaceAutorotation];

      double zoomAnimationDuration = self->_zoomAnimationDuration;
      v148[0] = MEMORY[0x1E4F143A8];
      v148[1] = 3221225472;
      v148[2] = __40__UIMovieScrubberTrackView_zoomAtPoint___block_invoke;
      v148[3] = &unk_1E52DA070;
      id v149 = v123;
      v150 = self;
      double v151 = v105;
      v147[0] = MEMORY[0x1E4F143A8];
      v147[1] = 3221225472;
      v147[2] = __40__UIMovieScrubberTrackView_zoomAtPoint___block_invoke_2;
      v147[3] = &unk_1E52DC3A0;
      v147[4] = self;
      id v98 = v123;
      +[UIView animateWithDuration:4 delay:v148 options:v147 animations:zoomAnimationDuration completion:0.0];
      v99 = self->_childThumbnailViews;
      self->_childThumbnailViews = v121;
      v100 = v121;

      CGFloat v14 = self->_thumbnailStartXValues;
      self->_thumbnailStartXValues = v124;
      v101 = v124;

      objc_msgSend(v113, "setFrame:", v111, v110, v109, v108);
      double v102 = self->_zoomAnimationDuration;
      v144[0] = MEMORY[0x1E4F143A8];
      v144[1] = 3221225472;
      v144[2] = __40__UIMovieScrubberTrackView_zoomAtPoint___block_invoke_3;
      v144[3] = &unk_1E52DA070;
      v144[4] = self;
      id v145 = v107;
      float32x2_t v146 = v106;
      id v103 = v107;
      +[UIView animateWithDuration:4 delay:v144 options:0 animations:v102 completion:0.0];

      double v10 = v114;
      LOBYTE(v14) = 1;
    }
  }
  return (char)v14;
}

void __40__UIMovieScrubberTrackView_zoomAtPoint___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        int v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        double v9 = *(double *)(*(void *)(a1 + 40) + 480);
        double v10 = *(double *)(*(void *)(a1 + 40) + 488);
        int v11 = [*(id *)(a1 + 32) objectForKey:v8];
        [v11 floatValue];
        double v13 = v12 - *(double *)(a1 + 48);

        CGFloat v14 = [v8 pointerValue];
        objc_msgSend(v14, "setFrame:", v13, v6, v9, v10);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
}

uint64_t __40__UIMovieScrubberTrackView_zoomAtPoint___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _zoomAnimationDidFinish];
}

uint64_t __40__UIMovieScrubberTrackView_zoomAtPoint___block_invoke_3(uint64_t a1, double a2, double a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(_WORD *)(v4 + 544))
  {
    objc_msgSend(*(id *)(a1 + 40), "movieScrubberTrackView:clampedSizeWidthDelta:actualSizeWidthDelta:originXDelta:minimumVisibleValue:maximumVisibleValue:", *(float *)(v4 + 500), *(float *)(v4 + 504), *(float *)(v4 + 496), *(float *)(a1 + 48), *(float *)(a1 + 52));
    uint64_t v4 = *(void *)(a1 + 32);
  }
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  LODWORD(a3) = *(_DWORD *)(a1 + 52);
  return [(id)v4 _setOverlayViewIsZoomed:1 minValue:a2 maxValue:a3];
}

- (void)_setOverlayViewIsZoomed:(BOOL)a3 minValue:(float)a4 maxValue:(float)a5
{
  float zoomAnimationDuration = self->_zoomAnimationDuration;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v11 = WeakRetained;
  __int16 trackFlags = (__int16)self->_trackFlags;
  if ((trackFlags & 0x20) != 0)
  {
    [WeakRetained movieScrubberTrackViewZoomAnimationDuration:self];
    double v13 = v14;
    __int16 trackFlags = (__int16)self->_trackFlags;
  }
  else
  {
    double v13 = zoomAnimationDuration;
  }
  double v15 = 0.0;
  if ((trackFlags & 0x40) != 0)
  {
    [v11 movieScrubberTrackViewZoomAnimationDelay:self];
    double v15 = v16;
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__UIMovieScrubberTrackView__setOverlayViewIsZoomed_minValue_maxValue___block_invoke;
  v17[3] = &unk_1E52E8040;
  v17[4] = self;
  BOOL v20 = a3;
  float v18 = a4;
  float v19 = a5;
  +[UIView animateWithDuration:4 delay:v17 options:0 animations:v13 completion:v15];
}

uint64_t __70__UIMovieScrubberTrackView__setOverlayViewIsZoomed_minValue_maxValue___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 464) setIsZoomed:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 32) + 464) setMinimumValue:*(float *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 464) setMaximumValue:*(float *)(a1 + 44)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 464);
  return [v2 layoutSubviews];
}

- (void)unzoom
{
  double zoomAnimationDuration = self->_zoomAnimationDuration;
  v3[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__UIMovieScrubberTrackView_unzoom__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __34__UIMovieScrubberTrackView_unzoom__block_invoke_2;
  v3[3] = &unk_1E52DC3A0;
  +[UIView animateWithDuration:4 delay:v4 options:v3 animations:zoomAnimationDuration completion:0.0];
}

uint64_t __34__UIMovieScrubberTrackView_unzoom__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 432), "allKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v2);
        }
        int v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        double v9 = [v8 pointerValue];
        uint64_t v10 = *(void *)(a1 + 32);
        double v11 = *(double *)(v10 + 480);
        double v12 = *(double *)(v10 + 488);
        double v13 = [*(id *)(v10 + 432) objectForKey:v8];
        [v13 floatValue];
        double v15 = v14;

        objc_msgSend(v9, "setFrame:", v15, v6, v11, v12);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v4);
  }

  uint64_t v17 = *(void *)(a1 + 32);
  if (*(_WORD *)(v17 + 544))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v17 + 568));
    objc_msgSend(WeakRetained, "movieScrubberTrackView:clampedSizeWidthDelta:actualSizeWidthDelta:originXDelta:minimumVisibleValue:maximumVisibleValue:", (float)-*(float *)(*(void *)(a1 + 32) + 500), (float)-*(float *)(*(void *)(a1 + 32) + 504), (float)-*(float *)(*(void *)(a1 + 32) + 496), 0.0, *(double *)(*(void *)(a1 + 32) + 512));

    uint64_t v17 = *(void *)(a1 + 32);
  }
  *(float *)&double v16 = *(double *)(v17 + 512);
  return [(id)v17 _setOverlayViewIsZoomed:0 minValue:0.0 maxValue:v16];
}

uint64_t __34__UIMovieScrubberTrackView_unzoom__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unzoomAnimationDidFinish];
}

- (void)_zoomAnimationDidFinish
{
  if ((*(_WORD *)&self->_trackFlags & 2) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained movieScrubberTrackViewDidExpand:self];
  }
}

- (void)_unzoomAnimationDidFinish
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [(NSDictionary *)self->_childThumbnailViews allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        [(NSMutableDictionary *)self->_thumbnailViews removeObjectForKey:*(void *)(*((void *)&v13 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  int v8 = [(NSDictionary *)self->_childThumbnailViews allValues];
  [v8 makeObjectsPerformSelector:sel_removeFromSuperview];

  childThumbnailViews = self->_childThumbnailViews;
  self->_childThumbnailViews = 0;

  thumbnailStartXValues = self->_thumbnailStartXValues;
  self->_thumbnailStartXValues = 0;

  double v11 = [(UIView *)self window];
  [v11 endDisablingInterfaceAutorotation];

  if ((*(_WORD *)&self->_trackFlags & 4) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained movieScrubberTrackViewDidCollapse:self];
  }
}

- (UIMovieScrubberTrackViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (UIMovieScrubberTrackViewDataSource *)WeakRetained;
}

- (UIMovieScrubberTrackViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIMovieScrubberTrackViewDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_maskContainerView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_timestamps, 0);
  objc_storeStrong((id *)&self->_thumbnailViews, 0);
  objc_storeStrong((id *)&self->_childThumbnailViews, 0);
  objc_storeStrong((id *)&self->_thumbnailStartXValues, 0);
  objc_storeStrong((id *)&self->_summaryThumbnailChildTimestamps, 0);
  objc_storeStrong((id *)&self->_summaryThumbnailTimestamps, 0);
  objc_storeStrong((id *)&self->_summaryThumbnailViews, 0);
}

@end