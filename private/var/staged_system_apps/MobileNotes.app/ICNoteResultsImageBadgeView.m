@interface ICNoteResultsImageBadgeView
- (ICNoteResultsImageBadgeView)initWithCoder:(id)a3;
- (ICNoteResultsImageBadgeView)initWithFrame:(CGRect)a3;
- (NSLayoutConstraint)widthConstraint;
- (NSString)systemImageName;
- (UIImageView)imageView;
- (void)commonInit;
- (void)setImageView:(id)a3;
- (void)setSystemImageName:(id)a3;
- (void)setWidthConstraint:(id)a3;
- (void)updateForTraitCollection;
- (void)updateImage;
@end

@implementation ICNoteResultsImageBadgeView

- (ICNoteResultsImageBadgeView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICNoteResultsImageBadgeView;
  v3 = [(ICNoteResultsImageBadgeView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(ICNoteResultsImageBadgeView *)v3 commonInit];
  }
  return v4;
}

- (ICNoteResultsImageBadgeView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICNoteResultsImageBadgeView;
  v3 = -[ICNoteResultsImageBadgeView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(ICNoteResultsImageBadgeView *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  if (+[UIDevice ic_isVision]) {
    [(ICNoteResultsImageBadgeView *)self setOverrideUserInterfaceStyle:1];
  }
  if (+[UIDevice ic_isVision]) {
    uint64_t v3 = 11;
  }
  else {
    uint64_t v3 = 8;
  }
  v4 = +[UIBlurEffect effectWithStyle:v3];
  id v5 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:v4];
  [(ICNoteResultsImageBadgeView *)self addSubview:v5];
  [v5 ic_addAnchorsToFillSuperview];
  id v6 = objc_alloc_init((Class)UIImageView);
  [(ICNoteResultsImageBadgeView *)self setImageView:v6];

  v7 = [(ICNoteResultsImageBadgeView *)self imageView];
  [v7 setContentMode:4];

  v8 = +[UIColor secondaryLabelColor];
  v9 = [(ICNoteResultsImageBadgeView *)self imageView];
  [v9 setTintColor:v8];

  v10 = +[UIColor clearColor];
  v11 = [(ICNoteResultsImageBadgeView *)self imageView];
  [v11 setBackgroundColor:v10];

  v12 = [v5 contentView];
  v13 = [(ICNoteResultsImageBadgeView *)self imageView];
  [v12 addSubview:v13];

  v14 = [(ICNoteResultsImageBadgeView *)self imageView];
  [v14 ic_addAnchorsToFillSuperview];

  [(ICNoteResultsImageBadgeView *)self setSystemImageName:@"pin.fill"];
  v15 = [(ICNoteResultsImageBadgeView *)self widthAnchor];
  v16 = [v15 constraintEqualToConstant:24.0];
  widthConstraint = self->_widthConstraint;
  self->_widthConstraint = v16;

  [(NSLayoutConstraint *)self->_widthConstraint setActive:1];
  [(ICNoteResultsImageBadgeView *)self updateForTraitCollection];
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  v18 = +[NSArray arrayWithObjects:v20 count:2];
  id v19 = [(ICNoteResultsImageBadgeView *)self registerForTraitChanges:v18 withAction:"updateForTraitCollection"];
}

- (void)setSystemImageName:(id)a3
{
  objc_storeStrong((id *)&self->_systemImageName, a3);

  [(ICNoteResultsImageBadgeView *)self updateImage];
}

- (void)updateImage
{
  uint64_t v3 = [(ICNoteResultsImageBadgeView *)self traitCollection];
  unsigned int v4 = [v3 ic_hasCompactSize];

  id v5 = (id *)&UIFontTextStyleCaption1;
  if (!v4) {
    id v5 = (id *)&UIFontTextStyleSubheadline;
  }
  id v6 = *v5;
  id v9 = [(ICNoteResultsImageBadgeView *)self systemImageName];
  v7 = +[UIImage ic_systemImageNamed:v9 textStyle:v6];

  v8 = [(ICNoteResultsImageBadgeView *)self imageView];
  [v8 setImage:v7];
}

- (void)updateForTraitCollection
{
  uint64_t v3 = [(ICNoteResultsImageBadgeView *)self traitCollection];
  unsigned int v4 = [v3 ic_hasCompactSize];

  double v5 = 8.0;
  if (v4)
  {
    double v5 = 4.0;
    double v6 = 24.0;
  }
  else
  {
    double v6 = 32.0;
  }
  [(ICNoteResultsImageBadgeView *)self ic_applyRoundedCornersWithRadius:v5];
  v7 = [(ICNoteResultsImageBadgeView *)self widthConstraint];
  [v7 setConstant:v6];

  [(ICNoteResultsImageBadgeView *)self updateImage];
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);

  objc_storeStrong((id *)&self->_systemImageName, 0);
}

@end