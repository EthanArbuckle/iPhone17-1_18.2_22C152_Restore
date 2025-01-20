@interface MTUIGlyphTimeView
- (MTUIGlyphTimeView)initWithFont:(id)a3 textColor:(id)a4 glyphName:(id)a5 style:(unint64_t)a6;
- (NSString)glyphName;
- (UIImageView)glyphImageView;
- (UILabel)timeLabel;
- (unint64_t)style;
- (void)setComponentColor:(id)a3;
- (void)setGlyphImageView:(id)a3;
- (void)setGlyphName:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTimeLabel:(id)a3;
- (void)setupConstraints;
- (void)setupGlyphName:(id)a3 size:(double)a4 glyphColor:(id)a5;
- (void)setupTimeLabelWithFont:(id)a3 textColor:(id)a4 style:(unint64_t)a5;
@end

@implementation MTUIGlyphTimeView

- (MTUIGlyphTimeView)initWithFont:(id)a3 textColor:(id)a4 glyphName:(id)a5 style:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MTUIGlyphTimeView;
  v13 = [(MTUIGlyphTimeView *)&v17 init];
  v14 = v13;
  if (v13)
  {
    [(MTUIGlyphTimeView *)v13 setGlyphName:v12];
    [(MTUIGlyphTimeView *)v14 setStyle:a6];
    [(MTUIGlyphTimeView *)v14 setupTimeLabelWithFont:v10 textColor:v11 style:a6];
    [v10 capHeight];
    [(MTUIGlyphTimeView *)v14 setupGlyphName:v12 size:v11 glyphColor:v15 * 1.2];
    [(MTUIGlyphTimeView *)v14 setupConstraints];
  }

  return v14;
}

- (void)setupTimeLabelWithFont:(id)a3 textColor:(id)a4 style:(unint64_t)a5
{
  v8 = (objc_class *)MEMORY[0x263F1C768];
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(v8);
  [(MTUIGlyphTimeView *)self setTimeLabel:v11];

  id v12 = [(MTUIGlyphTimeView *)self timeLabel];
  [v12 setTextColor:v9];

  v13 = [MEMORY[0x263F1C550] clearColor];
  v14 = [(MTUIGlyphTimeView *)self timeLabel];
  [v14 setBackgroundColor:v13];

  double v15 = [(MTUIGlyphTimeView *)self timeLabel];
  [v15 setOpaque:0];

  v16 = [MEMORY[0x263F1C550] blackColor];
  objc_super v17 = [(MTUIGlyphTimeView *)self timeLabel];
  [v17 setShadowColor:v16];

  v18 = [(MTUIGlyphTimeView *)self timeLabel];
  [v18 setFont:v10];

  v19 = [(MTUIGlyphTimeView *)self timeLabel];
  [v19 setTextAlignment:1];

  v20 = [(MTUIGlyphTimeView *)self timeLabel];
  [v20 setBaselineAdjustment:1];

  v21 = [(MTUIGlyphTimeView *)self timeLabel];
  [v21 setLineBreakMode:2];

  v22 = [(MTUIGlyphTimeView *)self timeLabel];
  [v22 setAdjustsFontSizeToFitWidth:1];

  v23 = [(MTUIGlyphTimeView *)self timeLabel];
  [(MTUIGlyphTimeView *)self addSubview:v23];

  v24 = [(MTUIGlyphTimeView *)self timeLabel];
  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

  v25 = [(MTUIGlyphTimeView *)self timeLabel];
  [v25 setAdjustsFontForContentSizeCategory:1];

  if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    uint64_t v26 = *MEMORY[0x263F1D160];
    id v27 = [(MTUIGlyphTimeView *)self timeLabel];
    [v27 setMaximumContentSizeCategory:v26];
  }
}

- (void)setupGlyphName:(id)a3 size:(double)a4 glyphColor:(id)a5
{
  objc_msgSend(MEMORY[0x263F1C6B0], "mtui_imageWithSymbolName:pointSize:color:", a3, a5, a4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v9];
  [(MTUIGlyphTimeView *)self setGlyphImageView:v6];

  v7 = [(MTUIGlyphTimeView *)self glyphImageView];
  [(MTUIGlyphTimeView *)self addSubview:v7];

  v8 = [(MTUIGlyphTimeView *)self glyphImageView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)setupConstraints
{
  id v30 = (id)objc_opt_new();
  v3 = [(MTUIGlyphTimeView *)self glyphImageView];
  v4 = [v3 leadingAnchor];
  v5 = [(MTUIGlyphTimeView *)self leadingAnchor];
  v6 = [v4 constraintEqualToAnchor:v5];
  [v30 addObject:v6];

  v7 = [(MTUIGlyphTimeView *)self glyphImageView];
  v8 = [v7 centerYAnchor];
  id v9 = [(MTUIGlyphTimeView *)self centerYAnchor];
  id v10 = [v8 constraintEqualToAnchor:v9];
  [v30 addObject:v10];

  id v11 = [(MTUIGlyphTimeView *)self timeLabel];
  id v12 = [v11 leadingAnchor];
  v13 = [(MTUIGlyphTimeView *)self glyphImageView];
  v14 = [v13 trailingAnchor];
  unint64_t v15 = [(MTUIGlyphTimeView *)self style];
  double v16 = 2.0;
  if (v15 == 1) {
    double v16 = 5.0;
  }
  objc_super v17 = [v12 constraintEqualToAnchor:v14 constant:v16];
  [v30 addObject:v17];

  v18 = [(MTUIGlyphTimeView *)self timeLabel];
  v19 = [v18 topAnchor];
  v20 = [(MTUIGlyphTimeView *)self topAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  [v30 addObject:v21];

  v22 = [(MTUIGlyphTimeView *)self timeLabel];
  v23 = [v22 bottomAnchor];
  v24 = [(MTUIGlyphTimeView *)self bottomAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  [v30 addObject:v25];

  uint64_t v26 = [(MTUIGlyphTimeView *)self timeLabel];
  id v27 = [v26 trailingAnchor];
  v28 = [(MTUIGlyphTimeView *)self trailingAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  [v30 addObject:v29];

  [MEMORY[0x263F08938] activateConstraints:v30];
}

- (void)setComponentColor:(id)a3
{
  id v4 = a3;
  v5 = [(MTUIGlyphTimeView *)self timeLabel];
  [v5 setTextColor:v4];

  v6 = (void *)MEMORY[0x263F1C6B0];
  v7 = [(MTUIGlyphTimeView *)self glyphName];
  v8 = [(MTUIGlyphTimeView *)self timeLabel];
  id v9 = [v8 font];
  [v9 capHeight];
  objc_msgSend(v6, "mtui_imageWithSymbolName:pointSize:color:", v7, v4, v10 * 1.2);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  id v11 = [(MTUIGlyphTimeView *)self glyphImageView];
  [v11 setImage:v12];
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
}

- (UIImageView)glyphImageView
{
  return self->_glyphImageView;
}

- (void)setGlyphImageView:(id)a3
{
}

- (NSString)glyphName
{
  return self->_glyphName;
}

- (void)setGlyphName:(id)a3
{
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphName, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);

  objc_storeStrong((id *)&self->_timeLabel, 0);
}

@end