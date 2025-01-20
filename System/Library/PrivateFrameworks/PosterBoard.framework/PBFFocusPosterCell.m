@interface PBFFocusPosterCell
+ (CGSize)estimatedCellSizeForItemWidth:(double)a3 screen:(id)a4 hasAccessory:(BOOL)a5;
+ (double)cornerRadius;
- (BOOL)isCheckboxOn;
- (CGRect)posterPreviewFrame;
- (NSString)focusSymbolImageName;
- (PBFFocusPosterCell)initWithCoder:(id)a3;
- (PBFFocusPosterCell)initWithFrame:(CGRect)a3;
- (PBFPosterPreview)posterPreview;
- (PBFPosterPreviewGenerator)posterPreviewGenerator;
- (UIImage)posterImage;
- (UIImageView)posterView;
- (id)makeComplicationsPortalView;
- (int64_t)actionType;
- (int64_t)layoutOrientation;
- (void)createCheckboxViewIfNecessary;
- (void)createConstraints;
- (void)createFocusSymbolViewIfNecessary;
- (void)createPosterView;
- (void)createPreviewComplicationContentView;
- (void)createShadowView;
- (void)setActionType:(int64_t)a3;
- (void)setCheckboxAssociatedPosterIdentifier:(id)a3;
- (void)setCheckboxOn:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFocusSymbolImageName:(id)a3;
- (void)setLayoutOrientation:(int64_t)a3;
- (void)setPosterImage:(id)a3;
- (void)setPosterPreview:(id)a3;
- (void)setPosterPreviewGenerator:(id)a3;
@end

@implementation PBFFocusPosterCell

+ (double)cornerRadius
{
  return 16.0;
}

+ (CGSize)estimatedCellSizeForItemWidth:(double)a3 screen:(id)a4 hasAccessory:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a4;
  if (v9)
  {
    v10 = v9;
    [v9 bounds];
    if (v5) {
      double v13 = v12 / v11 * a3 + 54.0;
    }
    else {
      double v13 = v12 / v11 * a3;
    }

    double v14 = a3;
    double v15 = v13;
  }
  else
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"screen != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFFocusPosterCell estimatedCellSizeForItemWidth:screen:hasAccessory:](a2, (uint64_t)a1, (uint64_t)v16);
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  result.height = v15;
  result.width = v14;
  return result;
}

- (PBFFocusPosterCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PBFFocusPosterCell;
  v3 = -[PBFFocusPosterCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PBFFocusPosterCell *)v3 createShadowView];
    [(PBFFocusPosterCell *)v4 createPosterView];
    [(PBFFocusPosterCell *)v4 createPreviewComplicationContentView];
    [(PBFFocusPosterCell *)v4 createConstraints];
  }
  return v4;
}

- (PBFFocusPosterCell)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28B00];
  id v5 = a3;
  objc_super v6 = [v4 currentHandler];
  v7 = [NSString stringWithUTF8String:"-[PBFFocusPosterCell initWithCoder:]"];
  objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PBFFocusPosterCell.m", 72, @"%s: not supported", "-[PBFFocusPosterCell initWithCoder:]");

  v10.receiver = self;
  v10.super_class = (Class)PBFFocusPosterCell;
  v8 = [(PBFFocusPosterCell *)&v10 initWithCoder:v5];

  return v8;
}

- (void)createShadowView
{
  v3 = (UIView *)objc_opt_new();
  shadowView = self->_shadowView;
  self->_shadowView = v3;

  [(UIView *)self->_shadowView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_shadowView _setContinuousCornerRadius:16.0];
  id v5 = [(UIView *)self->_shadowView layer];
  [v5 setShadowPathIsBounds:1];

  objc_super v6 = [(UIView *)self->_shadowView layer];
  id v7 = [MEMORY[0x1E4FB1618] blackColor];
  objc_msgSend(v6, "setShadowColor:", objc_msgSend(v7, "CGColor"));

  v8 = [(UIView *)self->_shadowView layer];
  objc_msgSend(v8, "setShadowOffset:", 0.0, 4.0);

  id v9 = [(UIView *)self->_shadowView layer];
  [v9 setShadowRadius:10.0];

  objc_super v10 = [(UIView *)self->_shadowView layer];
  LODWORD(v11) = 1036831949;
  [v10 setShadowOpacity:v11];

  double v12 = [(PBFFocusPosterCell *)self contentView];
  [v12 addSubview:self->_shadowView];

  id v13 = [(PBFFocusPosterCell *)self contentView];
  [v13 sendSubviewToBack:self->_shadowView];
}

- (void)createPosterView
{
  v3 = (UIImageView *)objc_opt_new();
  posterView = self->_posterView;
  self->_posterView = v3;

  [(UIImageView *)self->_posterView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = self->_posterView;
  objc_super v6 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [(UIImageView *)v5 setBackgroundColor:v6];

  [(UIImageView *)self->_posterView setClipsToBounds:1];
  [(UIImageView *)self->_posterView _setContinuousCornerRadius:16.0];
  id v7 = [(PBFFocusPosterCell *)self contentView];
  [v7 addSubview:self->_posterView];
}

- (void)createPreviewComplicationContentView
{
  v3 = [PBFPosterGalleryPreviewComplicationContentView alloc];
  v4 = -[PBFPosterGalleryPreviewComplicationContentView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  posterPreviewComplicationContentView = self->_posterPreviewComplicationContentView;
  self->_posterPreviewComplicationContentView = v4;

  [(PBFPosterGalleryPreviewComplicationContentView *)self->_posterPreviewComplicationContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PBFPosterGalleryPreviewComplicationContentView *)self->_posterPreviewComplicationContentView setPreferredCornerRadius:1];
  [(PBFPosterGalleryPreviewComplicationContentView *)self->_posterPreviewComplicationContentView setLayoutOrientation:[(PBFFocusPosterCell *)self layoutOrientation]];
  id v6 = [(PBFFocusPosterCell *)self contentView];
  [v6 addSubview:self->_posterPreviewComplicationContentView];
}

- (void)createCheckboxViewIfNecessary
{
  v18[3] = *MEMORY[0x1E4F143B8];
  if (!self->_checkboxView)
  {
    v3 = (PBFFocusCheckboxView *)objc_opt_new();
    checkboxView = self->_checkboxView;
    self->_checkboxView = v3;

    [(PBFFocusCheckboxView *)self->_checkboxView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PBFFocusCheckboxView *)self->_checkboxView setOn:self->_checkboxOn];
    id v5 = [(PBFFocusPosterCell *)self contentView];
    [v5 addSubview:self->_checkboxView];

    v16 = (void *)MEMORY[0x1E4F28DC8];
    v17 = [(PBFFocusCheckboxView *)self->_checkboxView centerXAnchor];
    id v6 = [(UIImageView *)self->_posterView centerXAnchor];
    id v7 = [v17 constraintEqualToAnchor:v6];
    v18[0] = v7;
    v8 = [(PBFFocusCheckboxView *)self->_checkboxView topAnchor];
    id v9 = [(UIImageView *)self->_posterView bottomAnchor];
    objc_super v10 = [v8 constraintEqualToAnchor:v9 constant:10.0];
    v18[1] = v10;
    double v11 = [(PBFFocusCheckboxView *)self->_checkboxView bottomAnchor];
    double v12 = [(PBFFocusPosterCell *)self contentView];
    id v13 = [v12 bottomAnchor];
    double v14 = [v11 constraintEqualToAnchor:v13];
    v18[2] = v14;
    double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
    [v16 activateConstraints:v15];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PBFFocusPosterCell;
  -[PBFFocusPosterCell setUserInteractionEnabled:](&v8, sel_setUserInteractionEnabled_);
  id v5 = [(PBFFocusPosterCell *)self contentView];
  id v6 = v5;
  double v7 = 0.5;
  if (v3) {
    double v7 = 1.0;
  }
  [v5 setAlpha:v7];
}

- (void)createFocusSymbolViewIfNecessary
{
  v22[2] = *MEMORY[0x1E4F143B8];
  if (!self->_focusSymbolView)
  {
    BOOL v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    focusSymbolView = self->_focusSymbolView;
    self->_focusSymbolView = v3;

    id v5 = self->_focusSymbolView;
    id v6 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIImageView *)v5 setTintColor:v6];

    [(UIImageView *)self->_focusSymbolView setTranslatesAutoresizingMaskIntoConstraints:0];
    double v7 = [(UIImageView *)self->_focusSymbolView layer];
    id v8 = [MEMORY[0x1E4FB1618] blackColor];
    objc_msgSend(v7, "setShadowColor:", objc_msgSend(v8, "CGColor"));

    id v9 = [(UIImageView *)self->_focusSymbolView layer];
    objc_msgSend(v9, "setShadowOffset:", 0.0, 1.0);

    objc_super v10 = [(UIImageView *)self->_focusSymbolView layer];
    [v10 setShadowRadius:4.0];

    double v11 = [(UIImageView *)self->_focusSymbolView layer];
    LODWORD(v12) = 1045220557;
    [v11 setShadowOpacity:v12];

    id v13 = [(PBFFocusPosterCell *)self contentView];
    [v13 addSubview:self->_focusSymbolView];

    double v14 = (void *)MEMORY[0x1E4F28DC8];
    double v15 = [(UIImageView *)self->_focusSymbolView centerXAnchor];
    v16 = [(UIImageView *)self->_posterView centerXAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v22[0] = v17;
    v18 = [(UIImageView *)self->_focusSymbolView bottomAnchor];
    v19 = [(UIImageView *)self->_posterView bottomAnchor];
    v20 = [v18 constraintEqualToAnchor:v19 constant:-12.0];
    v22[1] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    [v14 activateConstraints:v21];
  }
}

- (void)createConstraints
{
  v47[12] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIImageView *)self->_posterView bottomAnchor];
  v4 = [(PBFFocusPosterCell *)self contentView];
  id v5 = [v4 bottomAnchor];
  id v6 = [v3 constraintEqualToAnchor:v5];

  LODWORD(v7) = 1144733696;
  v40 = v6;
  [v6 setPriority:v7];
  v30 = (void *)MEMORY[0x1E4F28DC8];
  v45 = [(UIImageView *)self->_posterView leadingAnchor];
  v46 = [(PBFFocusPosterCell *)self contentView];
  v44 = [v46 leadingAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v47[0] = v43;
  v41 = [(UIImageView *)self->_posterView topAnchor];
  v42 = [(PBFFocusPosterCell *)self contentView];
  v39 = [v42 topAnchor];
  v38 = [v41 constraintEqualToAnchor:v39];
  v47[1] = v38;
  v36 = [(UIImageView *)self->_posterView trailingAnchor];
  v37 = [(PBFFocusPosterCell *)self contentView];
  v35 = [v37 trailingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v47[2] = v34;
  v47[3] = v6;
  v33 = [(UIView *)self->_shadowView leadingAnchor];
  v32 = [(UIImageView *)self->_posterView leadingAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v47[4] = v31;
  v29 = [(UIView *)self->_shadowView topAnchor];
  v28 = [(UIImageView *)self->_posterView topAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v47[5] = v27;
  v26 = [(UIView *)self->_shadowView trailingAnchor];
  v25 = [(UIImageView *)self->_posterView trailingAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v47[6] = v24;
  v23 = [(UIView *)self->_shadowView bottomAnchor];
  v22 = [(UIImageView *)self->_posterView bottomAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v47[7] = v21;
  v20 = [(PBFPosterGalleryPreviewComplicationContentView *)self->_posterPreviewComplicationContentView leadingAnchor];
  v19 = [(UIImageView *)self->_posterView leadingAnchor];
  v18 = [v20 constraintEqualToAnchor:v19];
  v47[8] = v18;
  id v8 = [(PBFPosterGalleryPreviewComplicationContentView *)self->_posterPreviewComplicationContentView topAnchor];
  id v9 = [(UIImageView *)self->_posterView topAnchor];
  objc_super v10 = [v8 constraintEqualToAnchor:v9];
  v47[9] = v10;
  double v11 = [(PBFPosterGalleryPreviewComplicationContentView *)self->_posterPreviewComplicationContentView trailingAnchor];
  double v12 = [(UIImageView *)self->_posterView trailingAnchor];
  id v13 = [v11 constraintEqualToAnchor:v12];
  v47[10] = v13;
  double v14 = [(PBFPosterGalleryPreviewComplicationContentView *)self->_posterPreviewComplicationContentView bottomAnchor];
  double v15 = [(UIImageView *)self->_posterView bottomAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  v47[11] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:12];
  [v30 activateConstraints:v17];
}

- (void)setActionType:(int64_t)a3
{
  if (self->_actionType != a3)
  {
    self->_actionType = a3;
    if (a3 == 1)
    {
      [(PBFFocusPosterCell *)self createCheckboxViewIfNecessary];
    }
    else if (!a3)
    {
      [(PBFFocusCheckboxView *)self->_checkboxView removeFromSuperview];
      checkboxView = self->_checkboxView;
      self->_checkboxView = 0;
    }
  }
}

- (void)setPosterPreview:(id)a3
{
  double v7 = (PBFPosterPreview *)a3;
  if (self->_posterPreview != v7)
  {
    objc_storeStrong((id *)&self->_posterPreview, a3);
    [(PBFPosterGalleryPreviewComplicationContentView *)self->_posterPreviewComplicationContentView setLayoutOrientation:[(PBFFocusPosterCell *)self layoutOrientation]];
    [(PBFPosterGalleryPreviewComplicationContentView *)self->_posterPreviewComplicationContentView setPosterPreview:v7];
    posterPreviewComplicationContentView = self->_posterPreviewComplicationContentView;
    id v6 = [(PBFFocusPosterCell *)self posterPreviewGenerator];
    [(PBFPosterGalleryPreviewComplicationContentView *)posterPreviewComplicationContentView prepareComplicationPreviewWithGenerator:v6];
  }
}

- (void)setPosterImage:(id)a3
{
  id v5 = (UIImage *)a3;
  p_posterImage = &self->_posterImage;
  if (self->_posterImage != v5)
  {
    double v15 = v5;
    objc_storeStrong((id *)p_posterImage, a3);
    [(UIImageView *)self->_posterView setImage:v15];
    [(NSLayoutConstraint *)self->_posterViewHeightConstraint setActive:0];
    posterViewHeightConstraint = self->_posterViewHeightConstraint;
    self->_posterViewHeightConstraint = 0;

    if (v15)
    {
      [(UIImage *)v15 size];
      double v10 = v9 / v8;
      double v11 = [(UIImageView *)self->_posterView heightAnchor];
      double v12 = [(UIImageView *)self->_posterView widthAnchor];
      id v13 = [v11 constraintEqualToAnchor:v12 multiplier:v10 constant:0.0];
      double v14 = self->_posterViewHeightConstraint;
      self->_posterViewHeightConstraint = v13;

      [(NSLayoutConstraint *)self->_posterViewHeightConstraint setActive:1];
    }
    p_posterImage = (UIImage **)[(PBFFocusPosterCell *)self setNeedsLayout];
  }
  MEMORY[0x1F4181820](p_posterImage);
}

- (void)setFocusSymbolImageName:(id)a3
{
  id v9 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    v4 = (NSString *)[v9 copy];
    focusSymbolImageName = self->_focusSymbolImageName;
    self->_focusSymbolImageName = v4;

    if (v9)
    {
      [(PBFFocusPosterCell *)self createFocusSymbolViewIfNecessary];
      id v6 = [MEMORY[0x1E4FB1830] configurationWithScale:2];
      focusSymbolView = self->_focusSymbolView;
      double v8 = [MEMORY[0x1E4FB1818] _systemImageNamed:v9 withConfiguration:v6];
      [(UIImageView *)focusSymbolView setImage:v8];
    }
    else
    {
      [(UIImageView *)self->_focusSymbolView removeFromSuperview];
      id v6 = self->_focusSymbolView;
      self->_focusSymbolView = 0;
    }
  }
}

- (void)setCheckboxAssociatedPosterIdentifier:(id)a3
{
}

- (void)setCheckboxOn:(BOOL)a3
{
  if (self->_checkboxOn != a3)
  {
    self->_checkboxOn = a3;
    -[PBFFocusCheckboxView setOn:](self->_checkboxView, "setOn:");
  }
}

- (void)setLayoutOrientation:(int64_t)a3
{
  if (self->_layoutOrientation != a3)
  {
    self->_layoutOrientation = a3;
    [(PBFPosterGalleryPreviewComplicationContentView *)self->_posterPreviewComplicationContentView setLayoutOrientation:"setLayoutOrientation:"];
  }
}

- (CGRect)posterPreviewFrame
{
  [(UIImageView *)self->_posterView frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)makeComplicationsPortalView
{
  double v2 = (void *)[objc_alloc(MEMORY[0x1E4FB2248]) initWithSourceView:self->_posterPreviewComplicationContentView];
  [v2 setHidesSourceView:0];
  [v2 setMatchesPosition:0];
  [v2 setMatchesTransform:0];
  [v2 setAllowsBackdropGroups:1];
  return v2;
}

- (PBFPosterPreviewGenerator)posterPreviewGenerator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_posterPreviewGenerator);
  return (PBFPosterPreviewGenerator *)WeakRetained;
}

- (void)setPosterPreviewGenerator:(id)a3
{
}

- (PBFPosterPreview)posterPreview
{
  return self->_posterPreview;
}

- (UIImage)posterImage
{
  return self->_posterImage;
}

- (UIImageView)posterView
{
  return self->_posterView;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (BOOL)isCheckboxOn
{
  return self->_checkboxOn;
}

- (NSString)focusSymbolImageName
{
  return self->_focusSymbolImageName;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusSymbolImageName, 0);
  objc_storeStrong((id *)&self->_posterImage, 0);
  objc_storeStrong((id *)&self->_posterPreview, 0);
  objc_destroyWeak((id *)&self->_posterPreviewGenerator);
  objc_storeStrong((id *)&self->_posterViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_focusSymbolView, 0);
  objc_storeStrong((id *)&self->_checkboxView, 0);
  objc_storeStrong((id *)&self->_posterPreviewComplicationContentView, 0);
  objc_storeStrong((id *)&self->_posterView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
}

+ (void)estimatedCellSizeForItemWidth:(const char *)a1 screen:(uint64_t)a2 hasAccessory:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  id v9 = v5;
  __int16 v10 = 2114;
  double v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  double v15 = @"PBFFocusPosterCell.m";
  __int16 v16 = 1024;
  int v17 = 46;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end