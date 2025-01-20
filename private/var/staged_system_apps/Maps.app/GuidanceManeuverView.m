@interface GuidanceManeuverView
- ($84D9B426F26CE1F36C5948DD9DEACC84)arrowMetrics;
- ($84D9B426F26CE1F36C5948DD9DEACC84)junctionArrowMetrics;
- (BOOL)_maneuverIsDrawnByDrawRect;
- (BOOL)_maneuverTypeRequiresDrawingPaths:(int)a3;
- (BOOL)disallowManeuversWithoutArt;
- (BOOL)usesCompactImages;
- (CGAffineTransform)transformForDrawingPathsWithFrame:(SEL)a3 relativeToReferenceSize:(CGRect)a4;
- (CGSize)intrinsicContentSize;
- (GuidanceManeuverArtwork)maneuverArtwork;
- (GuidanceManeuverView)initWithFrame:(CGRect)a3;
- (GuidanceManeuverView)initWithFrame:(CGRect)a3 textureProvider:(id)a4;
- (UIColor)accentColor;
- (UIColor)arrowColor;
- (UIImage)imageRepresentation;
- (id)_imageWithManeuverType:(int)a3 inRect:(CGRect)a4;
- (id)accessibilityIdentifier;
- (int)displayManeuver;
- (int64_t)shieldIdiom;
- (unsigned)framing;
- (void)_drawArrival;
- (void)_drawDefaultPaths;
- (void)_drawManeuverImage;
- (void)_drawProceedToRoute;
- (void)_invalidateDrawingPaths;
- (void)_updateDrawingPaths;
- (void)_updateDrawingPathsForArrival;
- (void)_updateDrawingPathsForProceedToRoute;
- (void)_updateDrawingPathsFromJunction;
- (void)_updateManeuverArtworkImageIfNeeded;
- (void)_updateManeuverImage;
- (void)disallowMutation;
- (void)drawArrow:(id)a3 stroke:(id)a4;
- (void)drawArrow:(id)a3 stroke:(id)a4 withVisibleWidth:(double)a5 intersectionFillPath:(id)a6 intersectionStrokePath:(id)a7 referenceSize:(CGSize)a8;
- (void)drawIntersectionFill:(id)a3;
- (void)drawIntersectionStroke:(id)a3 forFill:(id)a4;
- (void)drawRect:(CGRect)a3;
- (void)setAccentColor:(id)a3;
- (void)setArrowColor:(id)a3;
- (void)setArrowMetrics:(id *)a3;
- (void)setDisallowManeuversWithoutArt:(BOOL)a3;
- (void)setFraming:(unsigned int)a3;
- (void)setJunctionArrowMetrics:(id *)a3;
- (void)setManeuverArtwork:(id)a3;
- (void)setShieldIdiom:(int64_t)a3;
- (void)setUsesCompactImages:(BOOL)a3;
@end

@implementation GuidanceManeuverView

- (GuidanceManeuverView)initWithFrame:(CGRect)a3
{
  return -[GuidanceManeuverView initWithFrame:textureProvider:](self, "initWithFrame:textureProvider:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (GuidanceManeuverView)initWithFrame:(CGRect)a3 textureProvider:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)GuidanceManeuverView;
  v11 = -[GuidanceManeuverView initWithFrame:](&v19, "initWithFrame:", x, y, width, height);
  v12 = v11;
  if (v11)
  {
    v11->_disallowManeuversWithoutArt = 1;
    MKDefaultGuidanceManeuverMetrics();
    memcpy(&v12->_arrowMetrics, v18, sizeof(v12->_arrowMetrics));
    MKDefaultJunctionManeuverMetrics();
    memcpy(&v12->_junctionArrowMetrics, v18, sizeof(v12->_junctionArrowMetrics));
    v13 = +[UIColor labelColor];
    [(GuidanceManeuverView *)v12 setArrowColor:v13];

    v14 = +[UIColor secondaryLabelColor];
    [(GuidanceManeuverView *)v12 setAccentColor:v14];

    [(GuidanceManeuverView *)v12 setClearsContextBeforeDrawing:1];
    v15 = +[UIColor clearColor];
    [(GuidanceManeuverView *)v12 setBackgroundColor:v15];

    [(GuidanceManeuverView *)v12 setOpaque:0];
    v16 = [(GuidanceManeuverView *)v12 layer];
    [v16 setNeedsDisplayOnBoundsChange:1];

    [(GuidanceManeuverView *)v12 setShieldIdiom:0];
    objc_storeStrong((id *)&v12->_textureProvider, a4);
  }

  return v12;
}

- (id)accessibilityIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (BOOL)_maneuverIsDrawnByDrawRect
{
  v3 = [(GuidanceManeuverArtwork *)self->_maneuverArtwork junction];

  if (v3) {
    return 1;
  }
  v4 = [(GuidanceManeuverArtwork *)self->_maneuverArtwork artworkDataSource];

  if (v4) {
    return 1;
  }
  unsigned int v6 = [(GuidanceManeuverArtwork *)self->_maneuverArtwork maneuver] - 1;
  BOOL result = 1;
  switch(v6)
  {
    case 0u:
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 6u:
    case 0xAu:
    case 0xBu:
    case 0xFu:
    case 0x10u:
    case 0x11u:
    case 0x13u:
    case 0x14u:
    case 0x15u:
    case 0x16u:
    case 0x18u:
    case 0x19u:
    case 0x1Au:
    case 0x1Bu:
    case 0x1Cu:
    case 0x1Du:
    case 0x20u:
    case 0x21u:
    case 0x22u:
    case 0x26u:
    case 0x3Bu:
    case 0x3Cu:
    case 0x3Du:
    case 0x3Eu:
    case 0x3Fu:
    case 0x40u:
    case 0x41u:
    case 0x4Fu:
    case 0x50u:
    case 0x51u:
    case 0x52u:
    case 0x53u:
    case 0x54u:
    case 0x55u:
    case 0x57u:
      return result;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

- (void)drawIntersectionFill:(id)a3
{
  id v5 = a3;
  v4 = [(GuidanceManeuverView *)self accentColor];
  [v4 setFill];

  [v5 fillWithBlendMode:0 alpha:1.0];
}

- (void)drawIntersectionStroke:(id)a3 forFill:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(GuidanceManeuverView *)self arrowColor];
  [v8 setStroke];

  [(GuidanceManeuverView *)self arrowMetrics];
  [v7 setLineWidth:v9];
  [v7 setLineCapStyle:0];
  [v7 setLineJoinStyle:1];
  [v6 addClip];

  [v7 stroke];
}

- (void)drawArrow:(id)a3 stroke:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (!v6) {
    id v6 = v9;
  }
  if (![(GuidanceManeuverView *)self framing])
  {
    id v7 = [(GuidanceManeuverView *)self accentColor];
    [v7 setStroke];

    [v6 setLineWidth:2.0];
    [v6 strokeWithBlendMode:0 alpha:1.0];
  }
  v8 = [(GuidanceManeuverView *)self arrowColor];
  [v8 setFill];

  [v9 fill];
}

- (CGAffineTransform)transformForDrawingPathsWithFrame:(SEL)a3 relativeToReferenceSize:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  [(GuidanceManeuverView *)self bounds];
  double v9 = 1.0;
  CGRect v23 = CGRectInset(v22, 1.0, 1.0);
  CGFloat v10 = v23.origin.x;
  CGFloat v11 = v23.origin.y;
  CGFloat v12 = v23.size.width;
  CGFloat v13 = v23.size.height;
  if (width > v23.size.width || height > v23.size.height)
  {
    if (v23.size.width / width >= v23.size.height / height) {
      double v9 = v23.size.height / height;
    }
    else {
      double v9 = v23.size.width / width;
    }
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransformMakeScale(retstr, v9, v9);
  long long v15 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v20.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v20.c = v15;
  *(_OWORD *)&v20.tdouble x = *(_OWORD *)&retstr->tx;
  CGAffineTransformInvert(&v21, &v20);
  v24.origin.double x = v10;
  v24.origin.double y = v11;
  v24.size.double width = v12;
  v24.size.double height = v13;
  CGRect v25 = CGRectApplyAffineTransform(v24, &v21);
  v25.origin.double y = v25.origin.y + (v25.size.height - height) * 0.5 - y;
  *(_OWORD *)&v25.size.double height = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v19.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v19.c = *(_OWORD *)&v25.size.height;
  *(_OWORD *)&v19.tdouble x = *(_OWORD *)&retstr->tx;
  BOOL result = CGAffineTransformTranslate(&v20, &v19, v25.origin.x + (v25.size.width - width) * 0.5 - x, v25.origin.y);
  long long v17 = *(_OWORD *)&v20.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v20.a;
  *(_OWORD *)&retstr->c = v17;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v20.tx;
  return result;
}

- (void)drawArrow:(id)a3 stroke:(id)a4 withVisibleWidth:(double)a5 intersectionFillPath:(id)a6 intersectionStrokePath:(id)a7 referenceSize:(CGSize)a8
{
  double height = a8.height;
  double width = a8.width;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  [v15 pathBounds];
  CGRect v56 = CGRectIntegral(v55);
  double x = v56.origin.x;
  double y = v56.origin.y;
  double v21 = v56.size.height;
  if (a5 <= 0.0) {
    a5 = v56.size.width;
  }
  [v17 pathBounds];
  if (v17)
  {
    v59.origin.double x = v22;
    v59.origin.double y = v23;
    v59.size.double width = v24;
    v59.size.double height = v25;
    v57.origin.double x = x;
    v57.origin.double y = y;
    v57.size.double width = a5;
    v57.size.double height = v21;
    CGRect v58 = CGRectUnion(v57, v59);
    double x = v58.origin.x;
    double y = v58.origin.y;
    a5 = v58.size.width;
    double v21 = v58.size.height;
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v52 = 0u;
  -[GuidanceManeuverView transformForDrawingPathsWithFrame:relativeToReferenceSize:](self, "transformForDrawingPathsWithFrame:relativeToReferenceSize:", x, y, a5, v21, width, height);
  if (v17)
  {
    v26 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", x, y, a5, v21);
    [v26 appendPath:v15];
    [v26 setUsesEvenOddFillRule:1];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    long long v49 = v52;
    v45[2] = sub_10074FFA8;
    v45[3] = &unk_1012F7620;
    long long v50 = v53;
    long long v51 = v54;
    id v27 = v26;
    id v46 = v27;
    v47 = self;
    id v28 = v17;
    id v48 = v28;
    sub_10074FF44(v45);
    if (v18)
    {
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100750004;
      v37[3] = &unk_1012F7648;
      long long v42 = v52;
      long long v43 = v53;
      long long v44 = v54;
      id v38 = v27;
      v39 = self;
      id v40 = v18;
      id v41 = v28;
      sub_10074FF44(v37);
    }
  }
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  long long v34 = v52;
  v31[2] = sub_100750060;
  v31[3] = &unk_1012F7620;
  long long v35 = v53;
  long long v36 = v54;
  v31[4] = self;
  id v32 = v15;
  id v33 = v16;
  id v29 = v16;
  id v30 = v15;
  sub_10074FF44(v31);
}

- (void)_updateManeuverImage
{
  maneuverImage = self->_maneuverImage;
  self->_maneuverImage = 0;

  [(GuidanceManeuverView *)self _updateManeuverArtworkImageIfNeeded];
  v4 = [(GuidanceManeuverArtwork *)self->_maneuverArtwork artworkDataSource];

  if (!v4)
  {
    [(GuidanceManeuverView *)self arrowMetrics];
    double y = CGPointZero.y;
    id v6 = [(GuidanceManeuverView *)self maneuverArtwork];
    -[GuidanceManeuverView _imageWithManeuverType:inRect:](self, "_imageWithManeuverType:inRect:", [v6 maneuver], CGPointZero.x, y, v9, v10);
    id v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v8 = self->_maneuverImage;
    self->_maneuverImage = v7;
  }
}

- (void)_updateManeuverArtworkImageIfNeeded
{
  v3 = [(GuidanceManeuverArtwork *)self->_maneuverArtwork artworkDataSource];
  if (v3)
  {
    if ([(GuidanceManeuverView *)self usesCompactImages])
    {
      CGFloat v4 = 20.0;
      CGFloat v5 = 0.0;
      CGFloat v6 = 0.0;
      CGFloat v7 = 20.0;
    }
    else
    {
      [(GuidanceManeuverView *)self bounds];
      CGFloat v5 = v9;
      CGFloat v6 = v10;
      CGFloat v4 = v11;
      CGFloat v7 = v12;
    }
    v34.origin.double x = v5;
    v34.origin.double y = v6;
    v34.size.double width = v4;
    v34.size.double height = v7;
    double Width = CGRectGetWidth(v34);
    v35.origin.double x = v5;
    v35.origin.double y = v6;
    v35.size.double width = v4;
    v35.size.double height = v7;
    double Height = CGRectGetHeight(v35);
    if (Width <= 2.22044605e-16 || Height <= 2.22044605e-16)
    {
      [(GuidanceManeuverView *)self layoutIfNeeded];
      [(GuidanceManeuverView *)self frame];
      double Width = CGRectGetWidth(v36);
      [(GuidanceManeuverView *)self frame];
      double Height = CGRectGetHeight(v37);
    }
    if (!self->_maneuverArtworkImageView)
    {
      id v16 = [objc_alloc((Class)MKArtworkImageView) initWithFrame:0.0, 0.0, Width, Height];
      maneuverArtworkImageView = self->_maneuverArtworkImageView;
      self->_maneuverArtworkImageView = v16;

      [(MKArtworkImageView *)self->_maneuverArtworkImageView setContentMode:1];
      id v18 = [(GuidanceManeuverView *)self arrowColor];
      [(MKArtworkImageView *)self->_maneuverArtworkImageView setTintColor:v18];

      [(MKArtworkImageView *)self->_maneuverArtworkImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    }
    id v19 = [objc_alloc((Class)MKSizedTransitArtwork) initWithArtwork:v3 shieldSize:8 artworkCache:0];
    [(MKArtworkImageView *)self->_maneuverArtworkImageView setImageSource:v19];
    CGAffineTransform v20 = [(MKArtworkImageView *)self->_maneuverArtworkImageView superview];

    if (v20 != self)
    {
      [(GuidanceManeuverView *)self addSubview:self->_maneuverArtworkImageView];
      id v32 = [(MKArtworkImageView *)self->_maneuverArtworkImageView widthAnchor];
      v38.origin.double x = 0.0;
      v38.origin.double y = 0.0;
      v38.size.double width = Width;
      v38.size.double height = Height;
      v31 = [v32 constraintEqualToConstant:CGRectGetWidth(v38)];
      v33[0] = v31;
      id v30 = [(MKArtworkImageView *)self->_maneuverArtworkImageView heightAnchor];
      v39.origin.double x = 0.0;
      v39.origin.double y = 0.0;
      v39.size.double width = Width;
      v39.size.double height = Height;
      id v29 = [v30 constraintEqualToConstant:CGRectGetHeight(v39)];
      v33[1] = v29;
      double v21 = [(MKArtworkImageView *)self->_maneuverArtworkImageView centerXAnchor];
      CGFloat v22 = [(GuidanceManeuverView *)self centerXAnchor];
      CGFloat v23 = [v21 constraintEqualToAnchor:v22];
      v33[2] = v23;
      CGFloat v24 = [(MKArtworkImageView *)self->_maneuverArtworkImageView centerYAnchor];
      [(GuidanceManeuverView *)self centerYAnchor];
      v26 = CGFloat v25 = v3;
      id v27 = [v24 constraintEqualToAnchor:v26];
      v33[3] = v27;
      id v28 = +[NSArray arrayWithObjects:v33 count:4];
      +[NSLayoutConstraint activateConstraints:v28];

      v3 = v25;
      [(GuidanceManeuverView *)self invalidateIntrinsicContentSize];
    }
  }
  else
  {
    v8 = [(MKArtworkImageView *)self->_maneuverArtworkImageView superview];

    if (v8 == self) {
      [(MKArtworkImageView *)self->_maneuverArtworkImageView removeFromSuperview];
    }
  }
}

- (void)_updateDrawingPaths
{
  arrowPath = self->_arrowPath;
  self->_arrowPath = 0;

  arrowStrokePath = self->_arrowStrokePath;
  self->_arrowStrokePath = 0;

  intersectionFillPath = self->_intersectionFillPath;
  self->_intersectionFillPath = 0;

  intersectionStrokePath = self->_intersectionStrokePath;
  self->_intersectionStrokePath = 0;

  arrivalCircles = self->_arrivalCircles;
  self->_arrivalCircles = 0;

  maneuverImage = self->_maneuverImage;
  self->_maneuverImage = 0;

  [(MKArtworkImageView *)self->_maneuverArtworkImageView setImageSource:0];
  [(GuidanceManeuverView *)self _updateManeuverImage];
  if (!self->_maneuverImage)
  {
    double v9 = [(MKArtworkImageView *)self->_maneuverArtworkImageView imageSource];

    if (!v9)
    {
      [(GuidanceManeuverView *)self arrowMetrics];
      uint64_t v10 = [(GuidanceManeuverView *)self displayManeuver];
      if ([(GuidanceManeuverView *)self _maneuverTypeRequiresDrawingPaths:v10])
      {
        double v11 = [(GuidanceManeuverView *)self maneuverArtwork];
        uint64_t v12 = [v11 junction];
        if (!v12)
        {
LABEL_7:

          goto LABEL_8;
        }
        CGFloat v13 = (void *)v12;
        v14 = [(GuidanceManeuverView *)self maneuverArtwork];
        id v15 = [v14 junction];
        if ([v15 rightOrLeftTurnWillSnapToNinetyDegrees])
        {

          goto LABEL_7;
        }
        if ([(GuidanceManeuverView *)self usesCompactImages])
        {
          id v18 = [(GuidanceManeuverView *)self maneuverArtwork];
          unsigned __int8 v19 = [v18 isRoundaboutManeuver];

          if ((v19 & 1) == 0)
          {
LABEL_8:
            id v16 = +[UIBezierPath bezierPath];
            id v17 = self->_arrowPath;
            self->_arrowPath = v16;

            if ((int)v10 > 84)
            {
              if (v10 == 88 || v10 == 86)
              {
LABEL_21:
                CGAffineTransform v20 = [(GuidanceManeuverView *)self maneuverArtwork];
                [v20 drivingSide];
                [(GuidanceManeuverView *)self arrowMetrics];
                MKArrowAppendUTurnToPathInRect();
              }
              else if (v10 == 85)
              {
LABEL_20:
                [(GuidanceManeuverView *)self _updateDrawingPathsForProceedToRoute];
              }
            }
            else
            {
              switch((int)v10)
              {
                case 1:
                case 27:
                case 60:
                  [(GuidanceManeuverView *)self arrowMetrics];
                  MKArrowAppendLeftTurnToPathInRect();
                  goto LABEL_30;
                case 2:
                case 28:
                case 61:
                  [(GuidanceManeuverView *)self arrowMetrics];
                  MKArrowAppendRightTurnToPathInRect();
                  goto LABEL_30;
                case 3:
                case 5:
                case 6:
                case 7:
                case 12:
                case 23:
                case 64:
                  [(GuidanceManeuverView *)self arrowMetrics];
                  MKArrowAppendStraightArrowToPathInRect();
                  goto LABEL_30;
                case 4:
                case 25:
                case 26:
                case 35:
                  goto LABEL_21;
                case 11:
                  double v21 = [(GuidanceManeuverView *)self maneuverArtwork];
                  unsigned int v22 = [v21 drivingSide];

                  if (v22) {
                    goto LABEL_24;
                  }
                  goto LABEL_25;
                case 16:
                case 18:
                case 33:
                case 34:
                case 39:
                  [(GuidanceManeuverView *)self _updateDrawingPathsForArrival];
                  goto LABEL_30;
                case 17:
                  goto LABEL_20;
                case 20:
                case 62:
                case 65:
LABEL_24:
                  [(GuidanceManeuverView *)self arrowMetrics];
                  MKArrowAppendMergeLeftToPathInRect();
                  break;
                case 21:
                case 63:
                case 66:
LABEL_25:
                  [(GuidanceManeuverView *)self arrowMetrics];
                  MKArrowAppendMergeRightToPathInRect();
                  break;
                case 29:
                  CGFloat v23 = +[UIBezierPath bezierPath];
                  CGFloat v24 = self->_intersectionFillPath;
                  self->_intersectionFillPath = v23;

                  [(GuidanceManeuverView *)self arrowMetrics];
                  MKArrowAppendExitRoadLeftToPathInRect();
                  break;
                case 30:
                  CGFloat v25 = +[UIBezierPath bezierPath];
                  v26 = self->_intersectionFillPath;
                  self->_intersectionFillPath = v25;

                  [(GuidanceManeuverView *)self arrowMetrics];
                  MKArrowAppendExitRoadRightToPathInRect();
                  break;
                default:
                  goto LABEL_30;
              }
            }
            goto LABEL_30;
          }
        }
        else
        {
        }
        [(GuidanceManeuverView *)self _updateDrawingPathsFromJunction];
      }
LABEL_30:
      [(GuidanceManeuverView *)self invalidateIntrinsicContentSize];
    }
  }
}

- (BOOL)_maneuverTypeRequiresDrawingPaths:(int)a3
{
  if ((a3 - 80) > 7) {
    return a3 != 22;
  }
  BOOL result = 0;
  if (((1 << (a3 - 80)) & 0x9F) == 0) {
    return a3 != 22;
  }
  return result;
}

- (void)_updateDrawingPathsForArrival
{
  v3 = [(GuidanceManeuverView *)self maneuverArtwork];
  unsigned int v4 = [v3 maneuver];

  uint64_t v31 = 0;
  uint64_t v32 = 0;
  [(GuidanceManeuverView *)self arrowMetrics];
  [(GuidanceManeuverView *)self arrowMetrics];
  MKArrowCreateBezierPathsForArrivalWithSize();
  CGFloat v5 = (NSArray *)0;
  CGFloat v6 = (UIBezierPath *)0;
  long long v7 = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v30.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v30.c = v8;
  long long v9 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&v30.tdouble x = v9;
  if (v4 == 33)
  {
    long long v21 = v9;
    long long v22 = v8;
    long long v23 = v7;
    CGFloat v10 = -1.57079633;
  }
  else
  {
    if (v4 != 34) {
      goto LABEL_6;
    }
    long long v21 = v9;
    long long v22 = v8;
    long long v23 = v7;
    CGFloat v10 = 1.57079633;
  }
  CGAffineTransformMakeRotation(&v30, v10);
  long long v8 = v22;
  long long v7 = v23;
  long long v9 = v21;
LABEL_6:
  CGAffineTransform t1 = v30;
  *(_OWORD *)&t2.a = v7;
  *(_OWORD *)&t2.c = v8;
  *(_OWORD *)&t2.tdouble x = v9;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    double v11 = v5;
    id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          CGAffineTransform t1 = v30;
          [v16 applyTransform:&t1 v21, v22, v23, v24];
        }
        id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v13);
    }

    CGAffineTransform t1 = v30;
    [(UIBezierPath *)v6 applyTransform:&t1];
  }
  arrowPath = self->_arrowPath;
  self->_arrowPath = v6;
  id v18 = v6;

  arrivalCircles = self->_arrivalCircles;
  self->_arrivalCircles = v5;
  CGAffineTransform v20 = v5;
}

- (void)_updateDrawingPathsForProceedToRoute
{
  id v21 = 0;
  id v22 = 0;
  [(GuidanceManeuverView *)self arrowMetrics];
  [(GuidanceManeuverView *)self arrowMetrics];
  MKArrowCreateBezierPathsForProceedToRouteWithSize();
  id v3 = v22;
  unsigned int v4 = (UIBezierPath *)v21;
  memset(&v20, 0, sizeof(v20));
  CGAffineTransformMakeRotation(&v20, -1.57079633);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  CGFloat v5 = (NSArray *)v3;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        CGFloat v10 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v9);
        CGAffineTransform v15 = v20;
        [v10 applyTransform:&v15];
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v23 count:16];
    }
    while (v7);
  }

  CGAffineTransform v15 = v20;
  [(UIBezierPath *)v4 applyTransform:&v15];
  arrowPath = self->_arrowPath;
  self->_arrowPath = v4;
  id v12 = v4;

  arrivalCircles = self->_arrivalCircles;
  self->_arrivalCircles = v5;
  uint64_t v14 = v5;
}

- (void)_updateDrawingPathsFromJunction
{
  memset(__src, 0, sizeof(__src));
  [(GuidanceManeuverView *)self junctionArrowMetrics];
  id v3 = [(GuidanceManeuverView *)self maneuverArtwork];
  unsigned int v4 = [v3 junction];
  id v20 = 0;
  id v19 = 0;
  id v18 = 0;
  CGFloat v5 = [(GuidanceManeuverView *)self maneuverArtwork];
  id v6 = [v5 drivingSide];
  memcpy(__dst, __src, sizeof(__dst));
  [v4 getArrowPath:&v20 arrowStrokePath:&v19 intersectionBackgroundPath:&v18 strokePath:0 withSize:__dst metrics:v6 drivingSide:*((double *)__src + 1) visualCenter:*(double *)&__src[1]];
  id v7 = (UIBezierPath *)v20;
  uint64_t v8 = (UIBezierPath *)v19;
  long long v9 = (UIBezierPath *)v18;

  arrowPath = self->_arrowPath;
  self->_arrowPath = v7;
  double v11 = v7;

  arrowStrokePath = self->_arrowStrokePath;
  self->_arrowStrokePath = v8;
  id v13 = v8;

  intersectionFillPath = self->_intersectionFillPath;
  self->_intersectionFillPath = v9;
  CGAffineTransform v15 = v9;

  intersectionStrokePath = self->_intersectionStrokePath;
  self->_intersectionStrokePath = 0;
}

- (void)drawRect:(CGRect)a3
{
  if (![(GuidanceManeuverView *)self _maneuverIsDrawnByDrawRect])return; {
  if (self->_maneuverImage)
  }
  {
    [(GuidanceManeuverView *)self _drawManeuverImage];
    return;
  }
  unsigned int v4 = [(GuidanceManeuverView *)self maneuverArtwork];
  unsigned int v5 = [v4 maneuver];

  if (v5 <= 0x27)
  {
    if (((1 << v5) & 0x8600050000) != 0)
    {
      [(GuidanceManeuverView *)self _drawArrival];
      return;
    }
    if (v5 == 17) {
      goto LABEL_14;
    }
  }
  if (v5 == 85)
  {
LABEL_14:
    [(GuidanceManeuverView *)self _drawProceedToRoute];
  }
  else
  {
    [(GuidanceManeuverView *)self _drawDefaultPaths];
  }
}

- (void)_drawManeuverImage
{
  maneuverImage = self->_maneuverImage;
  if (maneuverImage)
  {
    [(GuidanceManeuverView *)self bounds];
    MKCGRectFittingImageWithinSize();
    -[UIImage drawInRect:](maneuverImage, "drawInRect:");
  }
}

- (void)_drawDefaultPaths
{
  arrowPath = self->_arrowPath;
  if (arrowPath)
  {
    arrowStrokePath = self->_arrowStrokePath;
    visibledouble Width = self->_visibleWidth;
    intersectionFillPath = self->_intersectionFillPath;
    intersectionStrokePath = self->_intersectionStrokePath;
    [(GuidanceManeuverView *)self arrowMetrics];
    -[GuidanceManeuverView drawArrow:stroke:withVisibleWidth:intersectionFillPath:intersectionStrokePath:referenceSize:](self, "drawArrow:stroke:withVisibleWidth:intersectionFillPath:intersectionStrokePath:referenceSize:", arrowPath, arrowStrokePath, intersectionFillPath, intersectionStrokePath, visibleWidth, v8, v9);
  }
}

- (void)_drawArrival
{
  id v3 = self->_arrivalCircles;
  unsigned int v4 = self->_arrowPath;
  [(UIBezierPath *)v4 pathBounds];
  CGFloat x = v5;
  CGFloat y = v7;
  CGFloat width = v9;
  CGFloat height = v11;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v13 = v3;
  id v14 = [(NSArray *)v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v41;
    do
    {
      long long v17 = 0;
      do
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v40 + 1) + 8 * (void)v17) pathBounds];
        v49.origin.CGFloat x = v18;
        v49.origin.CGFloat y = v19;
        v49.size.CGFloat width = v20;
        v49.size.CGFloat height = v21;
        v45.origin.CGFloat x = x;
        v45.origin.CGFloat y = y;
        v45.size.CGFloat width = width;
        v45.size.CGFloat height = height;
        CGRect v46 = CGRectUnion(v45, v49);
        CGFloat x = v46.origin.x;
        CGFloat y = v46.origin.y;
        CGFloat width = v46.size.width;
        CGFloat height = v46.size.height;
        long long v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [(NSArray *)v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v15);
  }

  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  CGRect v48 = CGRectIntegral(v47);
  double v22 = v48.origin.x;
  double v23 = v48.origin.y;
  double v24 = v48.size.width;
  double v25 = v48.size.height;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v37 = 0u;
  [(GuidanceManeuverView *)self arrowMetrics];
  -[GuidanceManeuverView transformForDrawingPathsWithFrame:relativeToReferenceSize:](self, "transformForDrawingPathsWithFrame:relativeToReferenceSize:", v22, v23, v24, v25, v35, v36);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  long long v32 = v37;
  long long v33 = v38;
  v28[2] = sub_100751654;
  v28[3] = &unk_1012F7620;
  long long v34 = v39;
  id v29 = v13;
  CGAffineTransform v30 = self;
  uint64_t v31 = v4;
  long long v26 = v4;
  long long v27 = v13;
  sub_10074FF44(v28);
}

- (void)_drawProceedToRoute
{
  id v3 = self->_arrivalCircles;
  unsigned int v4 = self->_arrowPath;
  [(UIBezierPath *)v4 pathBounds];
  CGFloat x = v5;
  CGFloat y = v7;
  CGFloat width = v9;
  CGFloat height = v11;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v13 = v3;
  id v14 = [(NSArray *)v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v41;
    do
    {
      long long v17 = 0;
      do
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v40 + 1) + 8 * (void)v17) pathBounds];
        v49.origin.CGFloat x = v18;
        v49.origin.CGFloat y = v19;
        v49.size.CGFloat width = v20;
        v49.size.CGFloat height = v21;
        v45.origin.CGFloat x = x;
        v45.origin.CGFloat y = y;
        v45.size.CGFloat width = width;
        v45.size.CGFloat height = height;
        CGRect v46 = CGRectUnion(v45, v49);
        CGFloat x = v46.origin.x;
        CGFloat y = v46.origin.y;
        CGFloat width = v46.size.width;
        CGFloat height = v46.size.height;
        long long v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [(NSArray *)v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v15);
  }

  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  CGRect v48 = CGRectIntegral(v47);
  double v22 = v48.origin.x;
  double v23 = v48.origin.y;
  double v24 = v48.size.width;
  double v25 = v48.size.height;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v37 = 0u;
  [(GuidanceManeuverView *)self arrowMetrics];
  -[GuidanceManeuverView transformForDrawingPathsWithFrame:relativeToReferenceSize:](self, "transformForDrawingPathsWithFrame:relativeToReferenceSize:", v22, v23, v24, v25, v35, v36);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  long long v32 = v37;
  long long v33 = v38;
  v28[2] = sub_100751A68;
  v28[3] = &unk_1012F7620;
  long long v34 = v39;
  id v29 = v13;
  CGAffineTransform v30 = self;
  uint64_t v31 = v4;
  long long v26 = v4;
  long long v27 = v13;
  sub_10074FF44(v28);
}

- (void)_invalidateDrawingPaths
{
  [(GuidanceManeuverView *)self setNeedsDisplay];

  [(GuidanceManeuverView *)self _updateDrawingPaths];
}

- (id)_imageWithManeuverType:(int)a3 inRect:(CGRect)a4
{
  if ((a3 - 80) < 5 || a3 == 22)
  {
    id v6 = [(GuidanceManeuverView *)self maneuverArtwork];
    [v6 drivingSide];
    [(GuidanceManeuverView *)self arrowMetrics];
    double v7 = [(GuidanceManeuverView *)self _screen];
    [v7 scale];
    double v8 = [(GuidanceManeuverView *)self arrowColor];
    CGFloat v10 = MKManeuverArrowImage();

    [v10 setAccessibilityIdentifier:@"ManeuverImage"];
    objc_storeStrong((id *)&self->_maneuverImage, v10);
  }
  else
  {
    CGFloat v10 = 0;
  }

  return v10;
}

- (void)setManeuverArtwork:(id)a3
{
  double v5 = (GuidanceManeuverArtwork *)a3;
  maneuverArtwork = self->_maneuverArtwork;
  if (maneuverArtwork != v5)
  {
    double v8 = v5;
    unsigned __int8 v7 = [(GuidanceManeuverArtwork *)maneuverArtwork isEqual:v5];
    double v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_maneuverArtwork, a3);
      [(GuidanceManeuverView *)self _invalidateDrawingPaths];
      double v5 = v8;
    }
  }
}

- (void)setArrowColor:(id)a3
{
  unsigned int v4 = (UIColor *)a3;
  if (!v4)
  {
    unsigned int v4 = +[UIColor labelColor];
  }
  if (v4 != self->_arrowColor)
  {
    double v5 = v4;
    objc_storeStrong((id *)&self->_arrowColor, v4);
    [(MKArtworkImageView *)self->_maneuverArtworkImageView setTintColor:self->_arrowColor];
    [(GuidanceManeuverView *)self _updateManeuverImage];
    [(GuidanceManeuverView *)self setNeedsDisplay];
    unsigned int v4 = v5;
  }
}

- (void)setAccentColor:(id)a3
{
  unsigned int v4 = (UIColor *)a3;
  if (!v4)
  {
    unsigned int v4 = +[UIColor secondaryLabelColor];
  }
  if (v4 != self->_accentColor)
  {
    double v5 = v4;
    objc_storeStrong((id *)&self->_accentColor, v4);
    [(GuidanceManeuverView *)self setNeedsDisplay];
    unsigned int v4 = v5;
  }
}

- (int)displayManeuver
{
  if (![(GuidanceManeuverView *)self disallowManeuversWithoutArt]
    || (int result = [(GuidanceManeuverView *)self _maneuverIsDrawnByDrawRect]) != 0)
  {
    maneuverArtwork = self->_maneuverArtwork;
    return [(GuidanceManeuverArtwork *)maneuverArtwork maneuver];
  }
  return result;
}

- (void)disallowMutation
{
  self->_disallowMutation = 1;
}

- (void)setFraming:(unsigned int)a3
{
  if (self->_framing != a3)
  {
    self->_framing = a3;
    [(GuidanceManeuverView *)self setNeedsDisplay];
  }
}

- (void)setArrowMetrics:(id *)a3
{
  p_arrowMetrics = &self->_arrowMetrics;
  memcpy(__dst, a3, sizeof(__dst));
  memcpy(v6, p_arrowMetrics, sizeof(v6));
  if ((MKGuidanceManeuverArrowMetricsEqualToArrowMetrics() & 1) == 0)
  {
    memcpy(p_arrowMetrics, a3, sizeof($4F77D22549FC7EC57EA30EF6B1A3F121));
    [(GuidanceManeuverView *)self _invalidateDrawingPaths];
  }
}

- (void)setJunctionArrowMetrics:(id *)a3
{
  p_junctionArrowMetrics = &self->_junctionArrowMetrics;
  memcpy(__dst, a3, sizeof(__dst));
  memcpy(v6, p_junctionArrowMetrics, sizeof(v6));
  if ((MKGuidanceManeuverArrowMetricsEqualToArrowMetrics() & 1) == 0)
  {
    memcpy(p_junctionArrowMetrics, a3, sizeof($4F77D22549FC7EC57EA30EF6B1A3F121));
    [(GuidanceManeuverView *)self _invalidateDrawingPaths];
  }
}

- (CGSize)intrinsicContentSize
{
  id v3 = [(MKArtworkImageView *)self->_maneuverArtworkImageView superview];

  if (v3 == self)
  {
    CGFloat v7 = 20.0;
    CGFloat v8 = 20.0;
    if (![(GuidanceManeuverView *)self usesCompactImages])
    {
      [(MKArtworkImageView *)self->_maneuverArtworkImageView intrinsicContentSize];
      goto LABEL_6;
    }
  }
  else
  {
    maneuverImage = self->_maneuverImage;
    if (maneuverImage)
    {
      [(UIImage *)maneuverImage size];
LABEL_6:
      CGFloat v7 = v5;
      CGFloat v8 = v6;
      goto LABEL_21;
    }
    double v9 = [(GuidanceManeuverView *)self maneuverArtwork];
    CGFloat v10 = [v9 artworkDataSource];
    if (v10)
    {

LABEL_20:
      [(GuidanceManeuverView *)self arrowMetrics];
      CGFloat v7 = v45;
      CGFloat v8 = v46;
      goto LABEL_21;
    }
    double v11 = [(GuidanceManeuverView *)self maneuverArtwork];
    unsigned __int8 v12 = -[GuidanceManeuverView _maneuverTypeRequiresDrawingPaths:](self, "_maneuverTypeRequiresDrawingPaths:", [v11 maneuver]);

    if ((v12 & 1) == 0) {
      goto LABEL_20;
    }
    CGFloat v13 = sub_100752340(self->_arrowPath, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
    CGFloat v17 = sub_100752340(self->_arrowStrokePath, v13, v14, v15, v16);
    CGFloat v21 = sub_100752340(self->_intersectionFillPath, v17, v18, v19, v20);
    CGFloat v25 = sub_100752340(self->_intersectionStrokePath, v21, v22, v23, v24);
    CGFloat v27 = v26;
    CGFloat v7 = v28;
    CGFloat v8 = v29;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    arrivalCircles = self->_arrivalCircles;
    if (!arrivalCircles) {
      arrivalCircles = (NSArray *)&__NSArray0__struct;
    }
    uint64_t v31 = arrivalCircles;
    id v32 = [(NSArray *)v31 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v42;
      do
      {
        for (i = 0; i != v33; i = (char *)i + 1)
        {
          if (*(void *)v42 != v34) {
            objc_enumerationMutation(v31);
          }
          CGFloat v25 = sub_100752340(*(void **)(*((void *)&v41 + 1) + 8 * i), v25, v27, v7, v8);
          CGFloat v27 = v36;
          CGFloat v7 = v37;
          CGFloat v8 = v38;
        }
        id v33 = [(NSArray *)v31 countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v33);
    }
  }
LABEL_21:
  double v39 = v7;
  double v40 = v8;
  result.CGFloat height = v40;
  result.CGFloat width = v39;
  return result;
}

- (UIImage)imageRepresentation
{
  [(GuidanceManeuverView *)self bounds];
  v8.CGFloat width = v3;
  v8.CGFloat height = v4;
  UIGraphicsBeginImageContextWithOptions(v8, 0, 0.0);
  [(GuidanceManeuverView *)self bounds];
  -[GuidanceManeuverView drawRect:](self, "drawRect:");
  double v5 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return (UIImage *)v5;
}

- (GuidanceManeuverArtwork)maneuverArtwork
{
  return self->_maneuverArtwork;
}

- ($84D9B426F26CE1F36C5948DD9DEACC84)arrowMetrics
{
  return ($84D9B426F26CE1F36C5948DD9DEACC84 *)memcpy(retstr, &self->_arrowMetrics, sizeof($84D9B426F26CE1F36C5948DD9DEACC84));
}

- ($84D9B426F26CE1F36C5948DD9DEACC84)junctionArrowMetrics
{
  return ($84D9B426F26CE1F36C5948DD9DEACC84 *)memcpy(retstr, &self->_junctionArrowMetrics, sizeof($84D9B426F26CE1F36C5948DD9DEACC84));
}

- (unsigned)framing
{
  return self->_framing;
}

- (UIColor)arrowColor
{
  return self->_arrowColor;
}

- (UIColor)accentColor
{
  return self->_accentColor;
}

- (int64_t)shieldIdiom
{
  return self->_shieldIdiom;
}

- (void)setShieldIdiom:(int64_t)a3
{
  self->_shieldIdiom = a3;
}

- (BOOL)usesCompactImages
{
  return self->_usesCompactImages;
}

- (void)setUsesCompactImages:(BOOL)a3
{
  self->_usesCompactImages = a3;
}

- (BOOL)disallowManeuversWithoutArt
{
  return self->_disallowManeuversWithoutArt;
}

- (void)setDisallowManeuversWithoutArt:(BOOL)a3
{
  self->_disallowManeuversWithoutArt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maneuverArtwork, 0);
  objc_storeStrong((id *)&self->_maneuverArtworkImageView, 0);
  objc_storeStrong((id *)&self->_maneuverImage, 0);
  objc_storeStrong((id *)&self->_arrivalCircles, 0);
  objc_storeStrong((id *)&self->_intersectionStrokePath, 0);
  objc_storeStrong((id *)&self->_intersectionFillPath, 0);
  objc_storeStrong((id *)&self->_arrowStrokePath, 0);
  objc_storeStrong((id *)&self->_arrowPath, 0);
  objc_storeStrong((id *)&self->_accentColor, 0);
  objc_storeStrong((id *)&self->_arrowColor, 0);

  objc_storeStrong((id *)&self->_textureProvider, 0);
}

@end