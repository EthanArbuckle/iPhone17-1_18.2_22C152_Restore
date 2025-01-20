@interface ManeuverAccessoryView
- (BOOL)isDetached;
- (BOOL)isRerouting;
- (BOOL)usesArrowMetricsReferenceSize;
- (CGSize)intrinsicContentSize;
- (GuidanceManeuverArtwork)maneuverArtwork;
- (GuidanceManeuverView)maneuverView;
- (UIImageView)transportTypeImageView;
- (double)_rightAdditionalInset;
- (double)_sharpRightAdditionalInset;
- (double)preferredLeadingPadding;
- (id)initForDetached:(BOOL)a3;
- (int)transportType;
- (void)layoutSubviews;
- (void)setIsDetached:(BOOL)a3;
- (void)setIsRerouting:(BOOL)a3;
- (void)setManeuverArtwork:(id)a3;
- (void)setManeuverView:(id)a3;
- (void)setTransportType:(int)a3;
- (void)setTransportTypeImageView:(id)a3;
- (void)setUsesArrowMetricsReferenceSize:(BOOL)a3;
@end

@implementation ManeuverAccessoryView

- (id)initForDetached:(BOOL)a3
{
  v24.receiver = self;
  v24.super_class = (Class)ManeuverAccessoryView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = -[ManeuverAccessoryView initWithFrame:](&v24, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v7)
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [(ManeuverAccessoryView *)v7 setAccessibilityIdentifier:v9];

    v7->_isDetached = a3;
    v10 = -[GuidanceManeuverView initWithFrame:textureProvider:]([GuidanceManeuverView alloc], "initWithFrame:textureProvider:", 0, CGRectZero.origin.x, y, width, height);
    maneuverView = v7->_maneuverView;
    v7->_maneuverView = v10;

    MKDefaultCompactManeuverMetrics();
    v12 = v7->_maneuverView;
    memcpy(__dst, __src, sizeof(__dst));
    [(GuidanceManeuverView *)v12 setArrowMetrics:__dst];
    memset(v21, 0, sizeof(v21));
    MKDefaultJunctionManeuverMetrics();
    BYTE2(v21[21]) = 1;
    v13 = v7->_maneuverView;
    memcpy(v20, v21, sizeof(v20));
    [(GuidanceManeuverView *)v13 setJunctionArrowMetrics:v20];
    [(GuidanceManeuverView *)v7->_maneuverView setUsesCompactImages:1];
    [(GuidanceManeuverView *)v7->_maneuverView setFraming:1];
    v14 = +[UIColor clearColor];
    [(GuidanceManeuverView *)v7->_maneuverView setAccentColor:v14];

    [(GuidanceManeuverView *)v7->_maneuverView setContentMode:1];
    [(ManeuverAccessoryView *)v7 addSubview:v7->_maneuverView];
    v15 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
    transportTypeImageView = v7->_transportTypeImageView;
    v7->_transportTypeImageView = v15;

    [(UIImageView *)v7->_transportTypeImageView setAccessibilityIdentifier:@"TransportTypeImageView"];
    [(UIImageView *)v7->_transportTypeImageView setContentMode:1];
    [(UIImageView *)v7->_transportTypeImageView setHidden:1];
    [(ManeuverAccessoryView *)v7 addSubview:v7->_transportTypeImageView];
    v17 = +[MapsTheme apertureKeyColor];
    [(GuidanceManeuverView *)v7->_maneuverView setArrowColor:v17];

    v18 = +[MapsTheme apertureKeyColor];
    [(UIImageView *)v7->_transportTypeImageView setTintColor:v18];

    v7->_usesArrowMetricsReferenceSize = 1;
  }
  return v7;
}

- (double)preferredLeadingPadding
{
  double v3 = 0.0;
  if ([(ManeuverAccessoryView *)self usesArrowMetricsReferenceSize]) {
    return v3;
  }
  maneuverView = self->_maneuverView;
  if (maneuverView)
  {
    [(GuidanceManeuverView *)maneuverView arrowMetrics];
    maneuverView = self->_maneuverView;
    double v3 = *((double *)&v21 + 1) * 0.5;
  }
  else
  {
    long long v50 = 0u;
    uint64_t v51 = 0;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v21 = 0u;
  }
  -[GuidanceManeuverView intrinsicContentSize](maneuverView, "intrinsicContentSize", v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37,
    v38,
    v39,
    v40,
    v41,
    v42,
    v43,
    v44,
    v45,
    v46,
    v47,
    v48,
    v49,
    v50,
    v51);
  double v6 = 1.0;
  if (v5 > v3 * 1.75) {
    double v6 = 0.0;
  }
  if (v5 > v3 * 1.5) {
    double v7 = v6;
  }
  else {
    double v7 = 2.0;
  }
  if (v5 > v3 * 1.25) {
    double v8 = v7;
  }
  else {
    double v8 = 3.0;
  }
  if (v5 > v3) {
    double v3 = v8;
  }
  else {
    double v3 = 4.0;
  }
  v9 = [(GuidanceManeuverView *)self->_maneuverView maneuverArtwork];
  v10 = [v9 junction];

  if (!v10)
  {
    v9 = [(GuidanceManeuverView *)self->_maneuverView maneuverArtwork];
    if ([v9 maneuver] == 61)
    {

LABEL_24:
      [(ManeuverAccessoryView *)self _sharpRightAdditionalInset];
      double v3 = v3 + v15;
LABEL_25:
      v9 = [(GuidanceManeuverView *)self->_maneuverView maneuverArtwork];
      if ([v9 maneuver] == 2)
      {

        goto LABEL_29;
      }
      goto LABEL_27;
    }
  }
  v11 = [(GuidanceManeuverView *)self->_maneuverView maneuverArtwork];
  v12 = [v11 junction];
  unsigned int v13 = [v12 willSnapToSharpRight];

  if (!v10)
  {

    if (!v13) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v13)
  {
    [(ManeuverAccessoryView *)self _sharpRightAdditionalInset];
    double v3 = v3 + v14;
  }
LABEL_27:
  v16 = [(GuidanceManeuverView *)self->_maneuverView maneuverArtwork];
  v17 = [v16 junction];
  unsigned int v18 = [v17 willSnapToRightHandTurn];

  if (!v10)
  {

    if ((v18 & 1) == 0) {
      return v3;
    }
    goto LABEL_29;
  }
  if (v18)
  {
LABEL_29:
    [(ManeuverAccessoryView *)self _rightAdditionalInset];
    return v3 + v19;
  }
  return v3;
}

- (double)_sharpRightAdditionalInset
{
  if (qword_10160F3F8 != -1) {
    dispatch_once(&qword_10160F3F8, &stru_1012F3AA8);
  }
  return *(double *)&qword_10160F3F0;
}

- (double)_rightAdditionalInset
{
  if (qword_10160F408 != -1) {
    dispatch_once(&qword_10160F408, &stru_1012F3AC8);
  }
  return *(double *)&qword_10160F400;
}

- (CGSize)intrinsicContentSize
{
  unsigned __int8 v3 = [(ManeuverAccessoryView *)self isRerouting];
  double v4 = 20.0;
  double v5 = 20.0;
  double v6 = 20.0;
  if ((v3 & 1) == 0)
  {
    maneuverView = self->_maneuverView;
    if (maneuverView)
    {
      [(GuidanceManeuverView *)maneuverView arrowMetrics];
      double v6 = *((double *)&v9 + 1);
      double v5 = *(double *)&v10;
    }
    else
    {
      long long v38 = 0u;
      uint64_t v39 = 0;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      double v5 = 0.0;
      long long v9 = 0u;
      double v6 = 0.0;
    }
    if (-[ManeuverAccessoryView usesArrowMetricsReferenceSize](self, "usesArrowMetricsReferenceSize", v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25,
           v26,
           v27,
           v28,
           v29,
           v30,
           v31,
           v32,
           v33,
           v34,
           v35,
           v36,
           v37,
           v38,
           v39))
    {
      double v4 = v6;
    }
    else
    {
      [(GuidanceManeuverView *)self->_maneuverView intrinsicContentSize];
    }
  }
  if (self->_isDetached) {
    double v4 = 45.0;
  }
  if (v4 <= v6 * 0.5) {
    double v4 = v6 * 0.5;
  }
  double v8 = v5;
  result.double height = v8;
  result.double width = v4;
  return result;
}

- (void)layoutSubviews
{
  maneuverView = self->_maneuverView;
  if (maneuverView)
  {
    [(GuidanceManeuverView *)maneuverView arrowMetrics];
    double v5 = *((double *)&v13 + 1);
    double v4 = *(double *)&v14;
  }
  else
  {
    long long v42 = 0u;
    uint64_t v43 = 0;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    double v4 = 0.0;
    long long v13 = 0u;
    double v5 = 0.0;
  }
  unsigned __int8 v6 = -[ManeuverAccessoryView isRerouting](self, "isRerouting", v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29,
         v30,
         v31,
         v32,
         v33,
         v34,
         v35,
         v36,
         v37,
         v38,
         v39,
         v40,
         v41,
         v42,
         v43);
  double v7 = 20.0;
  if ((v6 & 1) == 0)
  {
    unsigned __int8 v8 = [(ManeuverAccessoryView *)self usesArrowMetricsReferenceSize];
    double v7 = v5;
    if ((v8 & 1) == 0) {
      [(GuidanceManeuverView *)self->_maneuverView intrinsicContentSize];
    }
  }
  if (self->_isDetached) {
    double v7 = 45.0;
  }
  double v9 = (v5 - v7) * -0.5;
  double v10 = (20.0 - v7) * -0.5;
  long long v11 = [(ManeuverAccessoryView *)self maneuverView];
  [v11 setFrame:v9, 0.0, v5, v4];

  long long v12 = [(ManeuverAccessoryView *)self transportTypeImageView];
  [v12 setFrame:v10, 0.0, 20.0, 20.0];
}

- (void)setManeuverArtwork:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_maneuverArtwork, a3);
  if ([v8 isRoundaboutManeuver]) {
    +[MapsTheme apertureKeyColor];
  }
  else {
  double v5 = +[UIColor clearColor];
  }
  [(GuidanceManeuverView *)self->_maneuverView setAccentColor:v5];

  maneuverArtwork = self->_maneuverArtwork;
  double v7 = [(ManeuverAccessoryView *)self maneuverView];
  [v7 setManeuverArtwork:maneuverArtwork];

  [(ManeuverAccessoryView *)self invalidateIntrinsicContentSize];
  [(ManeuverAccessoryView *)self setNeedsLayout];
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
  if (a3 > 3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = +[UIImage systemImageNamed:*(&off_1012F3AE8 + a3)];
  }
  id v5 = (id)v4;
  [(UIImageView *)self->_transportTypeImageView setImage:v4];
  [(ManeuverAccessoryView *)self invalidateIntrinsicContentSize];
  [(ManeuverAccessoryView *)self setNeedsLayout];
}

- (void)setIsRerouting:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isRerouting = a3;
  id v5 = [(ManeuverAccessoryView *)self maneuverView];
  [v5 setHidden:v3];

  unsigned __int8 v6 = [(ManeuverAccessoryView *)self transportTypeImageView];
  [v6 setHidden:v3 ^ 1];

  [(ManeuverAccessoryView *)self invalidateIntrinsicContentSize];

  [(ManeuverAccessoryView *)self setNeedsLayout];
}

- (GuidanceManeuverArtwork)maneuverArtwork
{
  return self->_maneuverArtwork;
}

- (int)transportType
{
  return self->_transportType;
}

- (BOOL)isRerouting
{
  return self->_isRerouting;
}

- (BOOL)usesArrowMetricsReferenceSize
{
  return self->_usesArrowMetricsReferenceSize;
}

- (void)setUsesArrowMetricsReferenceSize:(BOOL)a3
{
  self->_usesArrowMetricsReferenceSize = a3;
}

- (GuidanceManeuverView)maneuverView
{
  return self->_maneuverView;
}

- (void)setManeuverView:(id)a3
{
}

- (BOOL)isDetached
{
  return self->_isDetached;
}

- (void)setIsDetached:(BOOL)a3
{
  self->_isDetached = a3;
}

- (UIImageView)transportTypeImageView
{
  return self->_transportTypeImageView;
}

- (void)setTransportTypeImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportTypeImageView, 0);
  objc_storeStrong((id *)&self->_maneuverView, 0);

  objc_storeStrong((id *)&self->_maneuverArtwork, 0);
}

@end