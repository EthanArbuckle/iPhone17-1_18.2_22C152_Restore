@interface ICMovieCollectionViewCell
- (CAGradientLayer)bottomGradient;
- (ICMovieCollectionViewCell)initWithFrame:(CGRect)a3;
- (UILabel)timeLabel;
- (UIView)bottomView;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (void)layoutSubviews;
- (void)setAttachment:(id)a3;
- (void)setBottomGradient:(id)a3;
- (void)setBottomView:(id)a3;
- (void)setTimeLabel:(id)a3;
- (void)updateConstraints;
@end

@implementation ICMovieCollectionViewCell

- (ICMovieCollectionViewCell)initWithFrame:(CGRect)a3
{
  v63.receiver = self;
  v63.super_class = (Class)ICMovieCollectionViewCell;
  v3 = -[ICImageCollectionViewCell initWithFrame:](&v63, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)UIView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    id v8 = [v4 initWithFrame:CGRectZero.origin.x, y, width, height];
    [(ICMovieCollectionViewCell *)v3 setBottomView:v8];

    v9 = [(ICMovieCollectionViewCell *)v3 bottomView];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    v10 = [(ICMovieCollectionViewCell *)v3 bottomView];
    [(ICMovieCollectionViewCell *)v3 addSubview:v10];

    v11 = +[CAGradientLayer layer];
    [(ICMovieCollectionViewCell *)v3 setBottomGradient:v11];

    id v12 = +[UIColor blackColor];
    v66[0] = [v12 CGColor];
    id v13 = +[UIColor clearColor];
    v66[1] = [v13 CGColor];
    v14 = +[NSArray arrayWithObjects:v66 count:2];
    v15 = [(ICMovieCollectionViewCell *)v3 bottomGradient];
    [v15 setColors:v14];

    v16 = [(ICMovieCollectionViewCell *)v3 bottomGradient];
    [v16 setStartPoint:0.0, 1.0];

    v17 = [(ICMovieCollectionViewCell *)v3 bottomGradient];
    [v17 setEndPoint:0.0, 0.0];

    v18 = [(ICMovieCollectionViewCell *)v3 bottomView];
    v19 = [v18 layer];
    [v19 bounds];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    v28 = [(ICMovieCollectionViewCell *)v3 bottomGradient];
    [v28 setFrame:v21, v23, v25, v27];

    v29 = [(ICMovieCollectionViewCell *)v3 bottomView];
    v30 = [v29 layer];
    v31 = [(ICMovieCollectionViewCell *)v3 bottomGradient];
    [v30 addSublayer:v31];

    id v32 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
    [v32 setTranslatesAutoresizingMaskIntoConstraints:0];
    v33 = +[UIImage imageNamed:@"VideoCamera"];
    [v32 setImage:v33];

    v34 = [(ICMovieCollectionViewCell *)v3 bottomView];
    [v34 addSubview:v32];

    id v35 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    [(ICMovieCollectionViewCell *)v3 setTimeLabel:v35];

    v36 = [(ICMovieCollectionViewCell *)v3 timeLabel];
    [v36 setTranslatesAutoresizingMaskIntoConstraints:0];

    v37 = +[UIFont boldSystemFontOfSize:10.0];
    v38 = [v37 ic_fontWithSingleLineA];
    v39 = [(ICMovieCollectionViewCell *)v3 timeLabel];
    [v39 setFont:v38];

    v40 = +[UIColor whiteColor];
    v41 = [(ICMovieCollectionViewCell *)v3 timeLabel];
    [v41 setTextColor:v40];

    v42 = [(ICMovieCollectionViewCell *)v3 bottomView];
    v43 = [(ICMovieCollectionViewCell *)v3 timeLabel];
    [v42 addSubview:v43];

    v44 = +[NSMutableArray array];
    v64[0] = @"bottomView";
    v45 = [(ICMovieCollectionViewCell *)v3 bottomView];
    v65[0] = v45;
    v65[1] = v32;
    v64[1] = @"cameraIcon";
    v64[2] = @"timeLabel";
    v46 = [(ICMovieCollectionViewCell *)v3 timeLabel];
    v65[2] = v46;
    v47 = +[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:3];

    v48 = [(ICMovieCollectionViewCell *)v3 bottomView];
    v49 = +[NSLayoutConstraint constraintWithItem:v48 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:30.0];
    [v44 addObject:v49];

    v50 = [(ICMovieCollectionViewCell *)v3 bottomView];
    v51 = +[NSLayoutConstraint constraintWithItem:v3 attribute:4 relatedBy:0 toItem:v50 attribute:4 multiplier:1.0 constant:0.0];
    [v44 addObject:v51];

    v52 = [(ICImagesAndMoviesBaseCell *)v3 thumbnailView];
    v53 = [(ICMovieCollectionViewCell *)v3 bottomView];
    v54 = +[NSLayoutConstraint constraintWithItem:v52 attribute:5 relatedBy:0 toItem:v53 attribute:5 multiplier:1.0 constant:0.0];
    [v44 addObject:v54];

    v55 = [(ICImagesAndMoviesBaseCell *)v3 thumbnailView];
    v56 = [(ICMovieCollectionViewCell *)v3 bottomView];
    v57 = +[NSLayoutConstraint constraintWithItem:v55 attribute:6 relatedBy:0 toItem:v56 attribute:6 multiplier:1.0 constant:0.0];
    [v44 addObject:v57];

    v58 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-8-[cameraIcon(18)]", 0, 0, v47);
    [v44 addObjectsFromArray:v58];

    v59 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:[cameraIcon(11)]-9-|" options:0 metrics:0 views:v47];
    [v44 addObjectsFromArray:v59];

    v60 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:[timeLabel]-10-|" options:0 metrics:0 views:v47];
    [v44 addObjectsFromArray:v60];

    v61 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:[timeLabel]-8-|" options:0 metrics:0 views:v47];
    [v44 addObjectsFromArray:v61];

    +[NSLayoutConstraint activateConstraints:v44];
  }
  return v3;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)ICMovieCollectionViewCell;
  [(ICImageCollectionViewCell *)&v13 layoutSubviews];
  v3 = [(ICMovieCollectionViewCell *)self bottomView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(ICMovieCollectionViewCell *)self bottomGradient];
  [v12 setFrame:v5, v7, v9, v11];
}

- (void)setAttachment:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ICMovieCollectionViewCell;
  id v4 = a3;
  [(ICImageCollectionViewCell *)&v10 setAttachment:v4];
  double v5 = +[ICMediaTimeFormatter timecodeFormatter];
  [v4 duration];
  double v7 = v6;

  double v8 = [v5 stringFromTimeInterval:v7];
  double v9 = [(ICMovieCollectionViewCell *)self timeLabel];
  [v9 setText:v8];
}

- (void)updateConstraints
{
  v2.receiver = self;
  v2.super_class = (Class)ICMovieCollectionViewCell;
  [(ICImagesAndMoviesBaseCell *)&v2 updateConstraints];
}

- (UIView)bottomView
{
  return self->_bottomView;
}

- (void)setBottomView:(id)a3
{
}

- (CAGradientLayer)bottomGradient
{
  return self->_bottomGradient;
}

- (void)setBottomGradient:(id)a3
{
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_bottomGradient, 0);

  objc_storeStrong((id *)&self->_bottomView, 0);
}

- (id)accessibilityLabel
{
  v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"movie" value:&stru_10063F3D8 table:0];

  double v7 = [(ICBrowseAttachmentsBaseCell *)self itemNumberAccessibilityString];
  double v5 = __ICAccessibilityStringForVariables();

  return v5;
}

- (id)accessibilityValue
{
  v3 = [(ICBrowseAttachmentsBaseCell *)self attachment];
  id v4 = [v3 title];
  id v5 = [v4 length];

  double v6 = [(ICBrowseAttachmentsBaseCell *)self attachment];
  double v7 = v6;
  if (v5)
  {
    double v8 = [v6 title];
    double v9 = [(ICBrowseAttachmentsBaseCell *)self attachment];
    [v9 movieDurationForSpeaking];
  }
  else
  {
    double v8 = [v6 movieDurationForSpeaking];
    double v9 = [(ICBrowseAttachmentsBaseCell *)self attachment];
    [v9 modificationDateForSpeaking];
  id v12 = };
  objc_super v10 = __ICAccessibilityStringForVariables();

  return v10;
}

@end