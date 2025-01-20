@interface MTAWorldClockMapCityView
+ (id)secondaryLabelFont;
- (CGPoint)hotspotOffset;
- (CGPoint)hotspotOffsetForPlacement:(unint64_t)a3;
- (CGRect)dotImageFrameForPlacement:(unint64_t)a3;
- (CGSize)sizeForIntersectionWithCityView:(id)a3 atOrigin:(CGPoint)a4 selfOrigin:(CGPoint)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTAWorldClockMapCityView)initWithCity:(id)a3;
- (NSDateFormatter)timeFormatter;
- (UIImageView)dotImageView;
- (WorldClockCity)city;
- (double)timeLabelWidth;
- (id)labelViews;
- (int64_t)runMode;
- (unint64_t)iconPlacement;
- (void)layoutIfNeeded;
- (void)layoutSubviews;
- (void)setCity:(id)a3;
- (void)setDotImageView:(id)a3;
- (void)setIconPlacement:(unint64_t)a3;
- (void)setTimeFormatter:(id)a3;
- (void)setTimeLabelWidth:(double)a3;
- (void)start;
- (void)stop;
- (void)updateTime;
@end

@implementation MTAWorldClockMapCityView

+ (id)secondaryLabelFont
{
  return +[UIFont systemFontOfSize:13.0];
}

- (MTAWorldClockMapCityView)initWithCity:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MTAWorldClockMapCityView;
  v5 = -[MTAWorldClockMapCityView initWithFrame:](&v28, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v5)
  {
    v6 = +[UIColor clearColor];
    [(MTAWorldClockMapCityView *)v5 setBackgroundColor:v6];

    v7 = (UILabel *)objc_alloc_init((Class)UILabel);
    timeLabel = v5->_timeLabel;
    v5->_timeLabel = v7;

    v9 = v5->_timeLabel;
    v10 = +[UIColor clearColor];
    [(UILabel *)v9 setBackgroundColor:v10];

    v11 = v5->_timeLabel;
    v12 = [(id)objc_opt_class() secondaryLabelFont];
    [(UILabel *)v11 setFont:v12];

    v13 = v5->_timeLabel;
    v14 = +[UIColor whiteColor];
    [(UILabel *)v13 setTextColor:v14];

    [(UILabel *)v5->_timeLabel setAdjustsFontSizeToFitWidth:1];
    [(MTAWorldClockMapCityView *)v5 addSubview:v5->_timeLabel];
    v15 = (UILabel *)objc_alloc_init((Class)UILabel);
    nameLabel = v5->_nameLabel;
    v5->_nameLabel = v15;

    v17 = v5->_nameLabel;
    v18 = +[UIColor clearColor];
    [(UILabel *)v17 setBackgroundColor:v18];

    v19 = v5->_nameLabel;
    v20 = +[UIFont boldSystemFontOfSize:15.0];
    [(UILabel *)v19 setFont:v20];

    v21 = v5->_nameLabel;
    v22 = +[UIColor whiteColor];
    [(UILabel *)v21 setTextColor:v22];

    [(MTAWorldClockMapCityView *)v5 addSubview:v5->_nameLabel];
    id v23 = objc_alloc((Class)UIImageView);
    v24 = sub_10004F6E8();
    id v25 = [v23 initWithImage:v24];
    [(MTAWorldClockMapCityView *)v5 setDotImageView:v25];

    v26 = [(MTAWorldClockMapCityView *)v5 dotImageView];
    [(MTAWorldClockMapCityView *)v5 addSubview:v26];

    [(MTAWorldClockMapCityView *)v5 setIconPlacement:1];
    [(MTAWorldClockMapCityView *)v5 setCity:v4];
  }

  return v5;
}

- (void)setTimeFormatter:(id)a3
{
  if (self->_timeFormatter != a3)
  {
    id v4 = (NSDateFormatter *)[a3 copy];
    timeFormatter = self->_timeFormatter;
    self->_timeFormatter = v4;

    v6 = self->_timeFormatter;
    id v8 = [(WorldClockCity *)self->_city timeZone];
    v7 = +[NSTimeZone timeZoneWithName:v8];
    [(NSDateFormatter *)v6 setTimeZone:v7];
  }
}

- (double)timeLabelWidth
{
  [(UILabel *)self->_timeLabel frame];
  return v2;
}

- (void)setTimeLabelWidth:(double)a3
{
  timeLabel = self->_timeLabel;
  timeFormatter = self->_timeFormatter;
  v6 = +[NSDate date];
  v7 = [(NSDateFormatter *)timeFormatter stringFromDate:v6];
  [(UILabel *)timeLabel setText:v7];

  [(UILabel *)self->_timeLabel sizeToFit];
  [(UILabel *)self->_timeLabel frame];
  id v8 = self->_timeLabel;

  -[UILabel setFrame:](v8, "setFrame:");
}

- (void)setCity:(id)a3
{
  v10 = (WorldClockCity *)a3;
  if (self->_city != v10)
  {
    objc_storeStrong((id *)&self->_city, a3);
    timeFormatter = self->_timeFormatter;
    v6 = [(WorldClockCity *)v10 timeZone];
    v7 = +[NSTimeZone timeZoneWithName:v6];
    [(NSDateFormatter *)timeFormatter setTimeZone:v7];

    [(MTAWorldClockMapCityView *)self updateTime];
    nameLabel = self->_nameLabel;
    v9 = [(WorldClockCity *)v10 name];
    [(UILabel *)nameLabel setText:v9];

    [(UILabel *)self->_nameLabel sizeToFit];
    [(MTAWorldClockMapCityView *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(UILabel *)self->_timeLabel bounds];
  double v5 = v4;
  [(UILabel *)self->_nameLabel bounds];
  double v7 = fmax(v5, v6);
  id v8 = [(MTAWorldClockMapCityView *)self dotImageView];
  [v8 bounds];
  double v10 = v7 + v9 + 4.0;

  double v11 = 48.0;
  double v12 = v10;
  result.height = v11;
  result.width = v12;
  return result;
}

- (CGRect)dotImageFrameForPlacement:(unint64_t)a3
{
  [(MTAWorldClockMapCityView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(MTAWorldClockMapCityView *)self dotImageView];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;

  double v14 = v6 - v11;
  if (a3 == 1) {
    double v14 = 0.0;
  }
  float v15 = (v8 - v13) * 0.5;
  double v16 = floorf(v15);
  double v17 = v11;
  double v18 = v13;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v14;
  return result;
}

- (id)labelViews
{
  nameLabel = self->_nameLabel;
  v5[0] = self->_timeLabel;
  v5[1] = nameLabel;
  v3 = +[NSArray arrayWithObjects:v5 count:2];

  return v3;
}

- (CGSize)sizeForIntersectionWithCityView:(id)a3 atOrigin:(CGPoint)a4 selfOrigin:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  CGFloat v7 = a4.y;
  CGFloat v8 = a4.x;
  id v10 = a3;
  [(MTAWorldClockMapCityView *)self layoutIfNeeded];
  [v10 layoutIfNeeded];
  [(MTAWorldClockMapCityView *)self frame];
  CGRect v94 = CGRectOffset(v93, x, y);
  CGFloat v11 = v94.origin.x;
  CGFloat v12 = v94.origin.y;
  CGFloat width = v94.size.width;
  CGFloat height = v94.size.height;
  [(MTAWorldClockMapCityView *)self frame];
  CGRect v122 = CGRectOffset(v95, v8, v7);
  v96.origin.CGFloat x = v11;
  v96.origin.CGFloat y = v12;
  v96.size.CGFloat width = width;
  v96.size.CGFloat height = height;
  if (CGRectIntersectsRect(v96, v122))
  {
    float v15 = [(MTAWorldClockMapCityView *)self labelViews];
    id v77 = v10;
    double v16 = [v10 labelViews];
    id v17 = [v15 count];
    uint64_t v76 = (uint64_t)&v76;
    double v18 = &v76 - 4 * (void)v17;
    if (v17)
    {
      v19 = 0;
      v20 = v18 + 2;
      v21 = v18 + 2;
      do
      {
        v22 = [v15 objectAtIndexedSubscript:v19];
        [v22 frame];
        CGRect v98 = CGRectOffset(v97, x, y);
        *(CGRect *)(v20 - 2) = CGRectInset(v98, 0.0, 2.0);
        v20 += 4;

        id v23 = [v16 objectAtIndexedSubscript:v19];
        [v23 frame];
        CGRect v100 = CGRectOffset(v99, v8, v7);
        *(CGRect *)(v21 - 2) = CGRectInset(v100, 0.0, 2.0);
        v21 += 4;

        ++v19;
      }
      while (v17 != v19);
    }
    v24 = [(MTAWorldClockMapCityView *)self dotImageView];
    [v24 frame];
    CGRect v102 = CGRectOffset(v101, x, y);
    CGRect v103 = CGRectInset(v102, 1.0, 2.0);
    CGFloat v25 = v103.origin.x;
    CGFloat v84 = v103.origin.y;
    CGFloat v85 = v103.origin.x;
    CGFloat v26 = v103.origin.y;
    CGFloat v27 = v103.size.width;
    CGFloat v28 = v103.size.height;

    id v10 = v77;
    v29 = [v77 dotImageView];
    [v29 frame];
    CGRect v105 = CGRectOffset(v104, v8, v7);
    CGRect v106 = CGRectInset(v105, 1.0, 2.0);
    CGFloat v30 = v106.origin.x;
    CGFloat v82 = v106.origin.y;
    CGFloat v83 = v106.origin.x;
    CGFloat v31 = v106.origin.y;
    CGFloat v80 = v106.size.height;
    CGFloat v81 = v106.size.width;

    CGFloat v32 = CGSizeZero.height;
    double v90 = CGSizeZero.width;
    double v91 = v32;
    v107.origin.CGFloat x = v25;
    v107.origin.CGFloat y = v26;
    v107.size.CGFloat width = v27;
    v107.size.CGFloat height = v28;
    CGRect v108 = CGRectInset(v107, 1.0, 2.0);
    CGFloat v33 = v108.origin.x;
    CGFloat v34 = v108.origin.y;
    CGFloat v35 = v108.size.width;
    CGFloat v36 = v108.size.height;
    v108.origin.CGFloat x = v30;
    v108.origin.CGFloat y = v31;
    CGFloat v38 = v80;
    CGFloat v37 = v81;
    v108.size.CGFloat width = v81;
    v108.size.CGFloat height = v80;
    CGRect v123 = CGRectInset(v108, 1.0, 2.0);
    v109.origin.CGFloat x = v33;
    v109.origin.CGFloat y = v34;
    v109.size.CGFloat width = v35;
    v109.size.CGFloat height = v36;
    CGRect v110 = CGRectIntersection(v109, v123);
    double v39 = v90 + v110.size.width;
    v110.origin.CGFloat y = v84;
    v110.origin.CGFloat x = v85;
    CGFloat v79 = v27;
    v110.size.CGFloat width = v27;
    CGFloat v78 = v28;
    v110.size.CGFloat height = v28;
    CGRect v111 = CGRectInset(v110, 1.0, 2.0);
    CGFloat v40 = v111.origin.x;
    CGFloat v41 = v111.origin.y;
    CGFloat v42 = v111.size.width;
    CGFloat v43 = v111.size.height;
    v111.origin.CGFloat y = v82;
    v111.origin.CGFloat x = v83;
    v111.size.CGFloat width = v37;
    v111.size.CGFloat height = v38;
    CGRect v124 = CGRectInset(v111, 1.0, 2.0);
    v112.origin.CGFloat x = v40;
    v112.origin.CGFloat y = v41;
    v112.size.CGFloat width = v42;
    v112.size.CGFloat height = v43;
    CGRect v113 = CGRectIntersection(v112, v124);
    double v44 = v91 + v113.size.height;
    if (v17)
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        double v91 = v44;
        v46 = (double *)&v18[4 * (void)i];
        double v47 = *v46;
        CGFloat v87 = v46[1];
        CGFloat v88 = v47;
        CGFloat v89 = v46[2];
        CGFloat v86 = v46[3];
        v48 = (CGFloat *)(v18 + 2);
        v49 = (char *)v17;
        double v50 = v39;
        do
        {
          CGFloat v51 = *(v48 - 2);
          CGFloat v52 = *(v48 - 1);
          v125.size.CGFloat width = *v48;
          CGFloat v53 = v48[1];
          v48 += 4;
          double v90 = v125.size.width;
          CGFloat v54 = v87;
          CGFloat v55 = v88;
          v114.origin.CGFloat x = v88;
          v114.origin.CGFloat y = v87;
          CGFloat v56 = v89;
          v114.size.CGFloat width = v89;
          CGFloat v57 = v86;
          v114.size.CGFloat height = v86;
          v125.origin.CGFloat x = v51;
          v125.origin.CGFloat y = v52;
          v125.size.CGFloat height = v53;
          CGRect v115 = CGRectIntersection(v114, v125);
          double v50 = v50 + v115.size.width;
          v115.origin.CGFloat x = v55;
          v115.origin.CGFloat y = v54;
          v115.size.CGFloat width = v56;
          v115.size.CGFloat height = v57;
          v126.origin.CGFloat x = v51;
          v126.origin.CGFloat y = v52;
          v126.size.CGFloat width = v90;
          v126.size.CGFloat height = v53;
          CGRect v116 = CGRectIntersection(v115, v126);
          double v91 = v91 + v116.size.height;
          --v49;
        }
        while (v49);
        CGFloat v59 = v87;
        CGFloat v58 = v88;
        v117.origin.CGFloat x = v88;
        v117.origin.CGFloat y = v87;
        v117.size.CGFloat width = v89;
        CGFloat v60 = v86;
        v117.size.CGFloat height = v86;
        CGFloat v62 = v82;
        CGFloat v61 = v83;
        v127.origin.CGFloat x = v83;
        v127.origin.CGFloat y = v82;
        CGFloat v64 = v80;
        CGFloat v63 = v81;
        v127.size.CGFloat width = v81;
        v127.size.CGFloat height = v80;
        CGRect v118 = CGRectIntersection(v117, v127);
        double v90 = v50 + v118.size.width;
        v118.origin.CGFloat x = v58;
        v118.origin.CGFloat y = v59;
        v118.size.CGFloat width = v89;
        v118.size.CGFloat height = v60;
        v128.origin.CGFloat x = v61;
        v128.origin.CGFloat y = v62;
        v128.size.CGFloat width = v63;
        v128.size.CGFloat height = v64;
        CGRect v119 = CGRectIntersection(v118, v128);
        double v91 = v91 + v119.size.height;
        v65 = (CGFloat *)&v18[4 * (void)i];
        CGFloat v67 = *v65;
        CGFloat v66 = v65[1];
        CGFloat v68 = v65[2];
        CGFloat v69 = v65[3];
        v119.origin.CGFloat x = *v65;
        v119.origin.CGFloat y = v66;
        v119.size.CGFloat width = v68;
        v119.size.CGFloat height = v69;
        CGFloat v71 = v84;
        CGFloat v70 = v85;
        v129.origin.CGFloat x = v85;
        v129.origin.CGFloat y = v84;
        CGFloat v72 = v79;
        v129.size.CGFloat width = v79;
        CGFloat v73 = v78;
        v129.size.CGFloat height = v78;
        CGRect v120 = CGRectIntersection(v119, v129);
        v120.origin.CGFloat x = v67;
        double v39 = v90 + v120.size.width;
        v120.origin.CGFloat y = v66;
        v120.size.CGFloat width = v68;
        v120.size.CGFloat height = v69;
        v130.origin.CGFloat x = v70;
        v130.origin.CGFloat y = v71;
        v130.size.CGFloat width = v72;
        v130.size.CGFloat height = v73;
        CGRect v121 = CGRectIntersection(v120, v130);
        double v44 = v91 + v121.size.height;
      }
    }
  }
  else
  {
    double v39 = CGSizeZero.width;
    double v44 = CGSizeZero.height;
  }

  double v74 = v39;
  double v75 = v44;
  result.CGFloat height = v75;
  result.CGFloat width = v74;
  return result;
}

- (CGPoint)hotspotOffsetForPlacement:(unint64_t)a3
{
  [(MTAWorldClockMapCityView *)self dotImageFrameForPlacement:a3];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  CGFloat MidX = CGRectGetMidX(v11);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v12);
  double v9 = MidX;
  result.CGFloat y = MidY;
  result.CGFloat x = v9;
  return result;
}

- (CGPoint)hotspotOffset
{
  [(MTAWorldClockMapCityView *)self hotspotOffsetForPlacement:self->_iconPlacement];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (void)layoutIfNeeded
{
  if (!self->_doneFirstLayout) {
    [(MTAWorldClockMapCityView *)self setNeedsLayout];
  }
  v3.receiver = self;
  v3.super_class = (Class)MTAWorldClockMapCityView;
  [(MTAWorldClockMapCityView *)&v3 layoutIfNeeded];
}

- (void)layoutSubviews
{
  self->_doneFirstLayout = 1;
  [(MTAWorldClockMapCityView *)self bounds];
  double v28 = v3;
  [(MTAWorldClockMapCityView *)self dotImageFrameForPlacement:self->_iconPlacement];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  CGRect v12 = [(MTAWorldClockMapCityView *)self dotImageView];
  [v12 setFrame:v5, v7, v9, v11];

  [(UILabel *)self->_timeLabel frame];
  double v14 = v13;
  double v16 = v15;
  [(UILabel *)self->_nameLabel frame];
  double v18 = v17;
  double v20 = v19;
  timeLabel = self->_timeLabel;
  if (self->_iconPlacement == 1)
  {
    [(UILabel *)timeLabel setTextAlignment:0];
    [(UILabel *)self->_nameLabel setTextAlignment:0];
    v30.origin.CGFloat x = v5;
    v30.origin.CGFloat y = v7;
    v30.size.CGFloat width = v9;
    v30.size.CGFloat height = v11;
    double v22 = CGRectGetMaxX(v30) + 4.0;
    double v23 = v22;
  }
  else
  {
    [(UILabel *)timeLabel setTextAlignment:2];
    [(UILabel *)self->_nameLabel setTextAlignment:2];
    v31.origin.CGFloat x = v5;
    v31.origin.CGFloat y = v7;
    v31.size.CGFloat width = v9;
    v31.size.CGFloat height = v11;
    CGFloat v24 = CGRectGetMinX(v31) + -4.0;
    double v22 = v24 - v14;
    double v23 = v24 - v18;
  }
  float v25 = (v28 - v20) * 0.5;
  double v26 = floorf(v25);
  -[UILabel setFrame:](self->_timeLabel, "setFrame:", v22, v28 - v16, v14, v16);
  nameLabel = self->_nameLabel;

  -[UILabel setFrame:](nameLabel, "setFrame:", v23, v26, v18, v20);
}

- (void)setIconPlacement:(unint64_t)a3
{
  if (self->_iconPlacement != a3)
  {
    self->_iconPlacement = a3;
    [(MTAWorldClockMapCityView *)self setNeedsLayout];
  }
}

- (int64_t)runMode
{
  return 0;
}

- (void)updateTime
{
  timeLabel = self->_timeLabel;
  timeFormatter = self->_timeFormatter;
  id v5 = +[NSDate date];
  double v4 = [(NSDateFormatter *)timeFormatter stringFromDate:v5];
  [(UILabel *)timeLabel setText:v4];
}

- (void)start
{
  +[MTUIAnalogClockView registerClock:self];

  [(MTAWorldClockMapCityView *)self updateTime];
}

- (void)stop
{
}

- (WorldClockCity)city
{
  return self->_city;
}

- (NSDateFormatter)timeFormatter
{
  return self->_timeFormatter;
}

- (unint64_t)iconPlacement
{
  return self->_iconPlacement;
}

- (UIImageView)dotImageView
{
  return self->_dotImageView;
}

- (void)setDotImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dotImageView, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);

  objc_storeStrong((id *)&self->_timeLabel, 0);
}

@end