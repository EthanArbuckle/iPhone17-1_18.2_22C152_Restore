@interface RCChronologicalAnnotationView
- ($F24F406B2B787EFB06265DBA3D28CBD5)markerClippingRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)visibleTimeRange;
- (BOOL)isPlayback;
- (BOOL)shouldOnlyRenderOnScreenTimeLabels;
- (CGSize)labelsSize;
- (RCChronologicalAnnotationView)initWithFrame:(CGRect)a3;
- (UIColor)backgroundDebugColor;
- (double)contentDuration;
- (double)timeLabelsMajorInterval;
- (id)_timeLabelAttributes;
- (id)_timeLabelAttributesWithFont:(id)a3;
- (id)description;
- (int64_t)tickMarksForMajorInterval:(double)a3;
- (unint64_t)debugID;
- (void)drawRect:(CGRect)a3;
- (void)setBackgroundDebugColor:(id)a3;
- (void)setContentDuration:(double)a3;
- (void)setDebugID:(unint64_t)a3;
- (void)setIsPlayback:(BOOL)a3;
- (void)setMarkerClippingRange:(id)a3;
- (void)setShouldOnlyRenderOnScreenTimeLabels:(BOOL)a3;
- (void)setVisibleTimeRange:(id)a3;
@end

@implementation RCChronologicalAnnotationView

- (RCChronologicalAnnotationView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RCChronologicalAnnotationView;
  v3 = -[RCChronologicalAnnotationView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (RCChronologicalAnnotationView *)v3;
  if (v3)
  {
    *(_OWORD *)(v3 + 56) = RCTimeRangeZero;
    v5 = +[RCRecorderStyleProvider sharedStyleProvider];
    uint64_t v6 = [v5 timeLineLabelFont];
    timeLabelFont = v4->_timeLabelFont;
    v4->_timeLabelFont = (UIFont *)v6;

    v8 = [(RCChronologicalAnnotationView *)v4 layer];
    [v8 removeAllAnimations];

    [(RCChronologicalAnnotationView *)v4 setOpaque:0];
  }
  return v4;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)RCChronologicalAnnotationView;
  v3 = [(RCChronologicalAnnotationView *)&v8 description];
  v4 = NSStringFromRCTimeRange();
  [(RCChronologicalAnnotationView *)self timeLabelsMajorInterval];
  v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  uint64_t v6 = +[NSString stringWithFormat:@"%@: visibleTimeRange = %@, self.timeLabelsMajorInterval = %@", v3, v4, v5];

  return v6;
}

- (void)setVisibleTimeRange:(id)a3
{
  self->_visibleTimeRange = ($93AB83F55FD8EAABF5C634313E89AB95)a3;
  [(RCChronologicalAnnotationView *)self setNeedsDisplay];
}

- (void)setContentDuration:(double)a3
{
  if (self->_contentDuration != a3) {
    self->_contentDuration = a3;
  }
}

- (void)setMarkerClippingRange:(id)a3
{
  self->_markerClippingRange = ($93AB83F55FD8EAABF5C634313E89AB95)a3;
  [(RCChronologicalAnnotationView *)self setNeedsDisplay];
}

- (void)setBackgroundDebugColor:(id)a3
{
}

- (CGSize)labelsSize
{
  v3 = RCLocalizedDuration();
  v4 = [(RCChronologicalAnnotationView *)self _timeLabelAttributes];
  [v3 sizeWithAttributes:v4];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (double)timeLabelsMajorInterval
{
  [(RCChronologicalAnnotationView *)self frame];
  double v3 = v2;
  RCTimeRangeDeltaWithExactPrecision();
  double v5 = 100.0 / (v3 / v4);
  if (v5 >= 1.0)
  {
    double v8 = 60.0;
    if (v5 < 60.0)
    {
      double v8 = 30.0;
      if (v5 < 30.0)
      {
        double v8 = 15.0;
        if (v5 < 9.0)
        {
          double v8 = 5.0;
          if (v5 < 2.0)
          {
            double v8 = v5;
            if (v5 >= 1.0) {
              return 1.0;
            }
          }
        }
      }
    }
    return v8;
  }
  else
  {
    double v6 = round(log2(v5));
    return exp2(v6);
  }
}

- (int64_t)tickMarksForMajorInterval:(double)a3
{
  if (a3 == 60.0 || a3 == 1.0) {
    return 4;
  }
  else {
    return 5;
  }
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = [(RCChronologicalAnnotationView *)self superview];
  unsigned __int8 v9 = [v8 isHidden];

  if ((v9 & 1) == 0)
  {
    RCTimeRangeDeltaWithExactPrecision();
    double v11 = v10;
    if (v10 >= 2.22044605e-16)
    {
      RCTimeRangeIntersectTimeRange();
      if ((RCTimeRangeEqualToTimeRange() & 1) == 0)
      {
        [(RCChronologicalAnnotationView *)self timeLabelsMajorInterval];
        double v13 = v12;
        uint64_t v14 = -[RCChronologicalAnnotationView tickMarksForMajorInterval:](self, "tickMarksForMajorInterval:");
        v15 = &OBJC_IVAR___RCUndoTarget__shouldEnableSave;
        id v75 = +[RCRecorderStyleProvider sharedStyleProvider];
        unsigned __int8 v72 = +[UIApplication shouldMakeUIForDefaultPNG];
        v78.origin.CGFloat x = x;
        v78.origin.CGFloat y = y;
        v78.size.CGFloat width = width;
        v78.size.CGFloat height = height;
        double v73 = CGRectGetWidth(v78);
        [v75 timeLineTickWidth];
        CGFloat v17 = v16;
        double v67 = v11 / v13;
        double v69 = v13;
        double v18 = v11 / v13 * (double)v14;
        double v19 = v13 / (double)v14;
        double beginTime = self->_visibleTimeRange.beginTime;
        __y[0] = 0.0;
        double v21 = modf(fabs(beginTime / v19), __y);
        if (beginTime < 0.0)
        {
          double v22 = -__y[0];
        }
        else
        {
          double v21 = -v21;
          double v22 = __y[0];
        }
        v71 = [(RCChronologicalAnnotationView *)self _timeLabelAttributes];
        CurrentContext = UIGraphicsGetCurrentContext();
        v79.origin.CGFloat x = x;
        CGFloat v24 = v17;
        v79.origin.CGFloat y = y;
        v79.size.CGFloat width = width;
        v79.size.CGFloat height = height;
        CGContextClearRect(CurrentContext, v79);
        CGContextSetLineWidth(CurrentContext, v17);
        uint64_t v25 = (uint64_t)(v18 + 1.0);
        if (v25 >= -1)
        {
          uint64_t v26 = 0;
          double v27 = v73 / v18;
          double v63 = v73 / v67;
          double v64 = v17 + v17;
          uint64_t v28 = (uint64_t)v22;
          double v29 = v17 * 0.5;
          double v74 = v73 / v18 * v61;
          uint64_t v30 = v25 + 2;
          uint64_t v31 = v28 - 1;
          double v62 = 1.0 / v69;
          double v65 = v17 * 0.5;
          double v66 = v17;
          double v70 = v27;
          do
          {
            double v32 = v19 * (double)(v31 + v26);
            if (v32 >= -0.0001 && v32 >= self->_markerClippingRange.beginTime + -0.0001)
            {
              if (v32 >= self->_markerClippingRange.endTime + -0.0001) {
                break;
              }
              double v34 = v74 + v27 * (double)(v26 - 1);
              double v35 = RCRoundCoord(v34 - v29);
              if ((v31 + v26) % v14)
              {
                v36 = [v75 timeLineMinorPlaybackMarkerColor];
                [v75 timeLineMinorTickHeight];
                CGFloat v38 = v37;
                id v39 = v36;
                CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v39 CGColor]);
                v80.origin.CGFloat y = 0.0;
                v80.origin.CGFloat x = v35;
                v80.size.CGFloat width = v24;
                v80.size.CGFloat height = v38;
                CGContextFillRect(CurrentContext, v80);
              }
              else
              {
                v40 = [v75 timeLineMajorPlaybackMarkerColor];
                v41 = [v15 + 498 sharedStyleProvider];
                [v41 timeLineMajorTickHeight];
                CGFloat v43 = v42;

                id v39 = v40;
                CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v39 CGColor]);
                v81.origin.CGFloat y = 0.0;
                v81.origin.CGFloat x = v35;
                v81.size.CGFloat width = v24;
                v81.size.CGFloat height = v43;
                CGContextFillRect(CurrentContext, v81);
                char v44 = v72;
                if (v32 < 0.0) {
                  char v44 = 1;
                }
                if ((v44 & 1) == 0)
                {
                  double v45 = RCRoundCoord(v34 - v64);
                  v46 = [v15 + 498 sharedStyleProvider];
                  [v46 timeLineMajorTickHeight];
                  double v48 = v47;

                  v49 = [(RCChronologicalAnnotationView *)self window];
                  double v68 = v45;
                  -[RCChronologicalAnnotationView convertRect:toView:](self, "convertRect:toView:", v49, v45, v48, v63, 1.0);
                  CGFloat v51 = v50;
                  CGFloat v53 = v52;
                  double v54 = v19;
                  CGFloat v56 = v55;
                  CGFloat v58 = v57;
                  [v49 bounds];
                  v83.origin.CGFloat x = v51;
                  v83.origin.CGFloat y = v53;
                  v83.size.CGFloat width = v56;
                  double v19 = v54;
                  v83.size.CGFloat height = v58;
                  BOOL v59 = CGRectIntersectsRect(v82, v83);
                  if (![(RCChronologicalAnnotationView *)self shouldOnlyRenderOnScreenTimeLabels]|| [(RCChronologicalAnnotationView *)self shouldOnlyRenderOnScreenTimeLabels]&& v59)
                  {
                    if (v69 < 1.0) {
                      RCLocalizedPlaybackTimeWithMinimumComponents();
                    }
                    else {
                    v60 = RCLocalizedDuration();
                    }
                    [v60 drawAtPoint:v71 withAttributes:v68];
                  }
                  v15 = &OBJC_IVAR___RCUndoTarget__shouldEnableSave;
                  double v29 = v65;
                  CGFloat v24 = v66;
                }
                double v27 = v70;
              }
            }
            ++v26;
          }
          while (v30 != v26);
        }
      }
    }
  }
}

- (id)_timeLabelAttributesWithFont:(id)a3
{
  id v3 = a3;
  double v4 = +[RCRecorderStyleProvider sharedStyleProvider];
  double v5 = [v4 timelinePlaybackTimeColor];
  double v6 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v3, NSFontAttributeName, v5, NSForegroundColorAttributeName, 0);

  return v6;
}

- (id)_timeLabelAttributes
{
  return [(RCChronologicalAnnotationView *)self _timeLabelAttributesWithFont:self->_timeLabelFont];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)visibleTimeRange
{
  double beginTime = self->_visibleTimeRange.beginTime;
  double endTime = self->_visibleTimeRange.endTime;
  result.var1 = endTime;
  result.var0 = beginTime;
  return result;
}

- (double)contentDuration
{
  return self->_contentDuration;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)markerClippingRange
{
  double beginTime = self->_markerClippingRange.beginTime;
  double endTime = self->_markerClippingRange.endTime;
  result.var1 = endTime;
  result.var0 = beginTime;
  return result;
}

- (BOOL)isPlayback
{
  return self->_isPlayback;
}

- (void)setIsPlayback:(BOOL)a3
{
  self->_isPlayback = a3;
}

- (BOOL)shouldOnlyRenderOnScreenTimeLabels
{
  return self->_shouldOnlyRenderOnScreenTimeLabels;
}

- (void)setShouldOnlyRenderOnScreenTimeLabels:(BOOL)a3
{
  self->_shouldOnlyRenderOnScreenTimeLabels = a3;
}

- (UIColor)backgroundDebugColor
{
  return self->_backgroundDebugColor;
}

- (unint64_t)debugID
{
  return self->_debugID;
}

- (void)setDebugID:(unint64_t)a3
{
  self->_debugID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundDebugColor, 0);

  objc_storeStrong((id *)&self->_timeLabelFont, 0);
}

@end