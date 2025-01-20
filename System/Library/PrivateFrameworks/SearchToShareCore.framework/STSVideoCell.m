@interface STSVideoCell
- (NSString)duration;
- (NSString)providerName;
- (NSString)subtitle;
- (NSString)title;
- (STSVideoCell)initWithFrame:(CGRect)a3;
- (UIImage)providerIcon;
- (double)imageAspectRatio;
- (id)playButtonAction;
- (void)_didPressPlay;
- (void)_updateHiddenViewsAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDuration:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setImage:(id)a3 animated:(BOOL)a4;
- (void)setPlayButtonAction:(id)a3;
- (void)setProviderIcon:(id)a3;
- (void)setProviderName:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateConstraints;
@end

@implementation STSVideoCell

- (STSVideoCell)initWithFrame:(CGRect)a3
{
  v51.receiver = self;
  v51.super_class = (Class)STSVideoCell;
  v3 = -[STSImageCell initWithFrame:](&v51, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(STSVideoCell *)v3 contentView];
    v6 = [MEMORY[0x263F825C8] whiteColor];
    [v5 setBackgroundColor:v6];

    uint64_t v7 = [MEMORY[0x263EFF980] array];
    constraints = v4->_constraints;
    v4->_constraints = (NSMutableArray *)v7;

    id v9 = objc_alloc(MEMORY[0x263F82E00]);
    double v10 = *MEMORY[0x263F001A8];
    double v11 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v12 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v14 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x263F001A8], v11, v12, v13);
    footerContainer = v4->_footerContainer;
    v4->_footerContainer = (UIView *)v14;

    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", v10, v11, v12, v13);
    providerIconView = v4->_providerIconView;
    v4->_providerIconView = (UIImageView *)v16;

    [(UIImageView *)v4->_providerIconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_providerIconView setContentMode:4];
    v18 = (void *)MEMORY[0x263F827E8];
    v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v50 = [v18 imageNamed:@"play-icon" inBundle:v19];

    uint64_t v20 = [MEMORY[0x263F824E8] buttonWithType:0];
    playButton = v4->_playButton;
    v4->_playButton = (UIButton *)v20;

    [(UIButton *)v4->_playButton setImage:v50 forState:0];
    -[UIButton setImageEdgeInsets:](v4->_playButton, "setImageEdgeInsets:", 10.0, 10.0, 10.0, 10.0);
    [(UIButton *)v4->_playButton addTarget:v4 action:sel__didPressPlay forControlEvents:64];
    uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v10, v11, v12, v13);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v22;

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v24 = v4->_titleLabel;
    v25 = [MEMORY[0x263F81708] boldSystemFontOfSize:14.5];
    [(UILabel *)v24 setFont:v25];

    v26 = v4->_titleLabel;
    v27 = objc_msgSend(MEMORY[0x263F825C8], "sts_primaryResultTextColor");
    [(UILabel *)v26 setTextColor:v27];

    [(UILabel *)v4->_titleLabel setNumberOfLines:2];
    uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v10, v11, v12, v13);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = (UILabel *)v28;

    [(UILabel *)v4->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v30 = v4->_subtitleLabel;
    v31 = [MEMORY[0x263F81708] systemFontOfSize:13.0];
    [(UILabel *)v30 setFont:v31];

    v32 = v4->_subtitleLabel;
    v33 = objc_msgSend(MEMORY[0x263F825C8], "sts_secondaryResultTextColor");
    [(UILabel *)v32 setTextColor:v33];

    [(UILabel *)v4->_subtitleLabel setNumberOfLines:2];
    uint64_t v34 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v10, v11, v12, v13);
    providerLabel = v4->_providerLabel;
    v4->_providerLabel = (UILabel *)v34;

    [(UILabel *)v4->_providerLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v36 = v4->_providerLabel;
    v37 = [MEMORY[0x263F81708] boldSystemFontOfSize:11.0];
    [(UILabel *)v36 setFont:v37];

    v38 = v4->_providerLabel;
    v39 = objc_msgSend(MEMORY[0x263F825C8], "sts_primaryResultTextColor");
    [(UILabel *)v38 setTextColor:v39];

    uint64_t v40 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v10, v11, v12, v13);
    durationLabel = v4->_durationLabel;
    v4->_durationLabel = (UILabel *)v40;

    [(UILabel *)v4->_durationLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v42 = v4->_durationLabel;
    v43 = [MEMORY[0x263F81708] systemFontOfSize:11.0];
    [(UILabel *)v42 setFont:v43];

    v44 = v4->_durationLabel;
    v45 = objc_msgSend(MEMORY[0x263F825C8], "sts_secondaryResultTextColor");
    [(UILabel *)v44 setTextColor:v45];

    LODWORD(v46) = 1148846080;
    [(UILabel *)v4->_durationLabel setContentCompressionResistancePriority:0 forAxis:v46];
    [(UIView *)v4->_footerContainer addSubview:v4->_providerIconView];
    [(UIView *)v4->_footerContainer addSubview:v4->_providerLabel];
    [(UIView *)v4->_footerContainer addSubview:v4->_durationLabel];
    [(UIView *)v4->_footerContainer addSubview:v4->_subtitleLabel];
    [(UIView *)v4->_footerContainer addSubview:v4->_titleLabel];
    v47 = [(STSVideoCell *)v4 contentView];
    [v47 addSubview:v4->_footerContainer];

    v48 = [(STSVideoCell *)v4 contentView];
    [v48 addSubview:v4->_playButton];

    [(STSVideoCell *)v4 _updateHiddenViewsAnimated:0];
    [(STSVideoCell *)v4 updateConstraints];
  }
  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)STSVideoCell;
  [(STSImageCell *)&v3 prepareForReuse];
  [(STSVideoCell *)self setPlayButtonAction:0];
}

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)STSVideoCell;
  [(STSImageCell *)&v31 layoutSubviews];
  [(STSVideoCell *)self bounds];
  CGFloat v29 = v4;
  CGFloat v30 = v3;
  CGFloat v27 = v6;
  CGFloat v28 = v5;
  [(STSImageCell *)self imageFrame];
  CGFloat x = v32.origin.x;
  CGFloat y = v32.origin.y;
  CGFloat width = v32.size.width;
  CGFloat height = v32.size.height;
  double MaxX = CGRectGetMaxX(v32);
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v33);
  double v13 = [(UIButton *)self->_playButton imageForState:0];
  [v13 size];
  double v15 = v14;
  double v17 = v16;

  [(UIButton *)self->_playButton imageEdgeInsets];
  double v20 = v15 + v18 + v19;
  double v23 = v17 + v21 + v22;
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  double v24 = CGRectGetMaxY(v34);
  v35.origin.CGFloat x = v30;
  v35.origin.CGFloat y = v29;
  v35.size.CGFloat width = v28;
  v35.size.CGFloat height = v27;
  CGFloat v25 = CGRectGetHeight(v35) - v24;
  v36.origin.CGFloat x = v30;
  v36.origin.CGFloat y = v29;
  v36.size.CGFloat width = v28;
  v36.size.CGFloat height = v27;
  double v26 = CGRectGetWidth(v36);
  -[UIButton setFrame:](self->_playButton, "setFrame:", MaxX - v20 + 5.0, MaxY - v23 + 5.0, v20, v23);
  -[UIView setFrame:](self->_footerContainer, "setFrame:", 0.0, v24, v26, v25);
}

- (double)imageAspectRatio
{
  return 0.5625;
}

- (void)updateConstraints
{
  [(STSVideoCell *)self removeConstraints:self->_constraints];
  [(NSMutableArray *)self->_constraints removeAllObjects];
  v11.receiver = self;
  v11.super_class = (Class)STSVideoCell;
  [(STSVideoCell *)&v11 updateConstraints];
  double v3 = _NSDictionaryOfVariableBindings(&cfstr_TitlelabelSubt.isa, self->_titleLabel, self->_subtitleLabel, self->_providerIconView, self->_providerLabel, self->_durationLabel, 0);
  double v4 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-9-[_titleLabel]-(>=5)-|" options:0 metrics:0 views:v3];
  double v5 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-9-[_subtitleLabel]-(>=9)-|" options:0 metrics:0 views:v3];
  double v6 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-(8.5)-[_titleLabel]-0-[_subtitleLabel]-(>=5)-|" options:0 metrics:0 views:v3];
  uint64_t v7 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-9-[_providerIconView(20)]-5-[_providerLabel]-(>=10)-[_durationLabel]-9-|" options:0 metrics:0 views:v3];
  v8 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-(>=5)-[_providerIconView(20)]-(4.5)-|" options:0 metrics:0 views:v3];
  id v9 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-(>=5)-[_providerLabel]-7-|" options:0 metrics:0 views:v3];
  double v10 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-(>=5)-[_durationLabel]-7-|" options:0 metrics:0 views:v3];
  [(NSMutableArray *)self->_constraints addObjectsFromArray:v4];
  [(NSMutableArray *)self->_constraints addObjectsFromArray:v5];
  [(NSMutableArray *)self->_constraints addObjectsFromArray:v6];
  [(NSMutableArray *)self->_constraints addObjectsFromArray:v7];
  [(NSMutableArray *)self->_constraints addObjectsFromArray:v8];
  [(NSMutableArray *)self->_constraints addObjectsFromArray:v9];
  [(NSMutableArray *)self->_constraints addObjectsFromArray:v10];
  [MEMORY[0x263F08938] activateConstraints:self->_constraints];
}

- (void)setFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)STSVideoCell;
  -[STSVideoCell setFrame:](&v21, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = [(STSVideoCell *)self contentView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(STSVideoCell *)self contentView];
  [v13 layoutMargins];
  CGFloat v15 = v8 + v14;
  CGFloat v18 = v10 - (v16 + v17);
  v22.size.CGFloat height = v12 - (v14 + v19);
  v22.origin.CGFloat x = v6 + v16;
  v22.origin.CGFloat y = v15;
  v22.size.CGFloat width = v18;
  double Width = CGRectGetWidth(v22);

  [(UILabel *)self->_titleLabel setPreferredMaxLayoutWidth:Width];
  [(UILabel *)self->_subtitleLabel setPreferredMaxLayoutWidth:Width];
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)STSVideoCell;
  -[STSImageCell setImage:animated:](&v6, sel_setImage_animated_, a3);
  [(STSVideoCell *)self _updateHiddenViewsAnimated:v4];
}

- (UIImage)providerIcon
{
  return [(UIImageView *)self->_providerIconView image];
}

- (void)setProviderIcon:(id)a3
{
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return [(UILabel *)self->_subtitleLabel text];
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)providerName
{
  return [(UILabel *)self->_providerLabel text];
}

- (void)setProviderName:(id)a3
{
}

- (NSString)duration
{
  return [(UILabel *)self->_durationLabel text];
}

- (void)setDuration:(id)a3
{
}

- (void)_didPressPlay
{
  double v3 = [(STSVideoCell *)self playButtonAction];

  if (v3)
  {
    BOOL v4 = [(STSVideoCell *)self playButtonAction];
    v4[2]();
  }
}

- (void)_updateHiddenViewsAnimated:(BOOL)a3
{
  BOOL v4 = [(STSImageCell *)self image];
  if (v4) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }

  playButton = self->_playButton;

  [(UIButton *)playButton setAlpha:v5];
}

uint64_t __43__STSVideoCell__updateHiddenViewsAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 736) setAlpha:*(double *)(a1 + 40)];
}

- (id)playButtonAction
{
  return self->_playButtonAction;
}

- (void)setPlayButtonAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_playButtonAction, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_durationLabel, 0);
  objc_storeStrong((id *)&self->_providerLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_providerIconView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_footerContainer, 0);

  objc_storeStrong((id *)&self->_playButton, 0);
}

@end