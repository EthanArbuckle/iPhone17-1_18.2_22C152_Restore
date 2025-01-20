@interface MTLabelStackView
+ (double)distanceBetweenLabelFrames;
+ (double)distanceBetweenLabelFramesWithTitleFont:(id)a3 subtitleFont:(id)a4 multilineTitle:(BOOL)a5;
+ (double)maxHeight;
+ (double)maxHeightForTitleNumberOfLines:(unint64_t)a3 subtitleNumberOfLines:(unint64_t)a4;
+ (id)defaultSubtitleFont;
+ (id)defaultSubtitleTextStyle;
+ (id)defaultTitleFont;
+ (id)defaultTitleTextStyle;
+ (unint64_t)defaultSubtitleNumberOfLines;
+ (unint64_t)defaultTitleNumberOfLines;
- (BOOL)isEnabled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTLabelStackView)initWithFrame:(CGRect)a3;
- (MTLabelStackViewDelegate)delegate;
- (NSString)subtitle;
- (NSString)subtitleTextStyle;
- (NSString)title;
- (NSString)titleTextStyle;
- (UIColor)subtitleTextColor;
- (UIColor)titleTextColor;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (double)distanceBetweenLabelFrames;
- (double)heightForWidth:(double)a3;
- (double)subtitleHeightForWidth:(double)a3;
- (double)subtitleMaxWidth;
- (double)titleHeightForWidth:(double)a3;
- (id)sizeCacheKeyForLabel:(id)a3 width:(double)a4;
- (unint64_t)subtitleNumberOfLines;
- (unint64_t)titleNumberOfLines;
- (void)_heightWillChange;
- (void)_notifyDelegateIfHeightChanged;
- (void)_updateSubtitleFont;
- (void)_updateTitleFont;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setSubtitleMaxWidth:(double)a3;
- (void)setSubtitleNumberOfLines:(unint64_t)a3;
- (void)setSubtitleTextColor:(id)a3;
- (void)setSubtitleTextStyle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleNumberOfLines:(unint64_t)a3;
- (void)setTitleTextColor:(id)a3;
- (void)setTitleTextStyle:(id)a3;
- (void)updateFonts;
@end

@implementation MTLabelStackView

+ (double)maxHeight
{
  id v3 = [(id)objc_opt_class() defaultTitleNumberOfLines];
  id v4 = [(id)objc_opt_class() defaultSubtitleNumberOfLines];

  _[a1 maxHeightForTitleNumberOfLines:v3 subtitleNumberOfLines:v4];
  return result;
}

+ (double)maxHeightForTitleNumberOfLines:(unint64_t)a3 subtitleNumberOfLines:(unint64_t)a4
{
  v7 = [(id)objc_opt_class() defaultTitleFont];
  v8 = [(id)objc_opt_class() defaultSubtitleFont];
  [v7 lineHeight];
  double v10 = v9 * (double)a3 + 0.0;
  [a1 distanceBetweenLabelFramesWithTitleFont:v7 subtitleFont:v8 multilineTitle:a3 != 1];
  double v12 = v10 + v11;
  [v8 lineHeight];
  double v14 = v12 + v13 * (double)a4;

  return v14;
}

+ (double)distanceBetweenLabelFrames
{
  id v3 = [(id)objc_opt_class() defaultTitleFont];
  id v4 = [(id)objc_opt_class() defaultSubtitleFont];
  [a1 distanceBetweenLabelFramesWithTitleFont:v3 subtitleFont:v4 multilineTitle:[objc_opt_class() defaultTitleNumberOfLines] != 1];
  double v6 = v5;

  return v6;
}

+ (double)distanceBetweenLabelFramesWithTitleFont:(id)a3 subtitleFont:(id)a4 multilineTitle:(BOOL)a5
{
  if (a5) {
    double v6 = 19.0;
  }
  else {
    double v6 = 16.0;
  }
  id v7 = a4;
  id v8 = a3;
  [v7 _scaledValueForValue:v6];
  double v10 = v9;
  [v8 mt_offsetFromLastBaselineToBottom];
  double v12 = v11;

  double v13 = v10 - v12;
  [v7 mt_offsetFromFirstBaselineToTop];
  double v15 = v14;

  return v13 - v15;
}

+ (id)defaultTitleTextStyle
{
  return UIFontTextStyleBody;
}

+ (id)defaultSubtitleTextStyle
{
  return UIFontTextStyleSubheadline;
}

+ (id)defaultTitleFont
{
  v2 = [a1 defaultTitleTextStyle];
  id v3 = +[UIFont mt_preferredFontForTextStyle:v2];

  return v3;
}

+ (id)defaultSubtitleFont
{
  v2 = [a1 defaultSubtitleTextStyle];
  id v3 = +[UIFont mt_preferredFontForTextStyle:v2];

  return v3;
}

+ (unint64_t)defaultTitleNumberOfLines
{
  return 1;
}

+ (unint64_t)defaultSubtitleNumberOfLines
{
  return 1;
}

- (MTLabelStackView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MTLabelStackView;
  id v3 = -[MTLabelStackView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    textSizeCache = v3->_textSizeCache;
    v3->_textSizeCache = (NSCache *)v4;

    v3->_subtitleMaxWidth = 1.79769313e308;
    v3->_enabled = 1;
    double v6 = [(MTLabelStackView *)v3 titleLabel];
    [(MTLabelStackView *)v3 addSubview:v6];

    id v7 = [(MTLabelStackView *)v3 subtitleLabel];
    [(MTLabelStackView *)v3 addSubview:v7];

    [(MTLabelStackView *)v3 _updateTitleFont];
    [(MTLabelStackView *)v3 _updateSubtitleFont];
  }
  return v3;
}

- (void)updateFonts
{
  [(MTLabelStackView *)self _updateTitleFont];

  [(MTLabelStackView *)self _updateSubtitleFont];
}

- (void)setSubtitleMaxWidth:(double)a3
{
  if (self->_subtitleMaxWidth != a3)
  {
    self->_subtitleMaxWidth = a3;
    [(MTLabelStackView *)self setNeedsLayout];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_enabled = a3;
  double v5 = [(MTLabelStackView *)self titleLabel];
  [v5 setEnabled:v3];

  id v6 = [(MTLabelStackView *)self subtitleLabel];
  [v6 setEnabled:v3];
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)MTLabelStackView;
  [(MTLabelStackView *)&v17 layoutSubviews];
  [(MTLabelStackView *)self bounds];
  double v4 = v3;
  [(MTLabelStackView *)self titleHeightForWidth:v3];
  double v6 = v5;
  id v7 = [(MTLabelStackView *)self titleLabel];
  [v7 setFrame:0.0, 0.0, v4, v6];

  [(MTLabelStackView *)self distanceBetweenLabelFrames];
  double v9 = v8;
  [(MTLabelStackView *)self subtitleMaxWidth];
  if (v4 >= v10) {
    double v11 = v10;
  }
  else {
    double v11 = v4;
  }
  [(MTLabelStackView *)self subtitleHeightForWidth:v11];
  double v13 = v12;
  double v14 = 0.0;
  if ([(MTLabelStackView *)self mt_isRTL])
  {
    v18.origin.x = 0.0;
    v18.origin.y = 0.0;
    v18.size.width = v4;
    v18.size.height = v6;
    double v14 = CGRectGetMaxX(v18) - v11;
  }
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = v4;
  v19.size.height = v6;
  double v15 = v9 + CGRectGetMaxY(v19);
  v16 = [(MTLabelStackView *)self subtitleLabel];
  [v16 setFrame:v14, v15, v11, v13];

  [(MTLabelStackView *)self _notifyDelegateIfHeightChanged];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[MTLabelStackView heightForWidth:](self, "heightForWidth:", a3.width, a3.height);
  double v5 = v4;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (double)heightForWidth:(double)a3
{
  -[MTLabelStackView titleHeightForWidth:](self, "titleHeightForWidth:");
  double v6 = v5;
  [(MTLabelStackView *)self distanceBetweenLabelFrames];
  double v8 = v7;
  [(MTLabelStackView *)self subtitleMaxWidth];
  if (v9 > a3) {
    double v9 = a3;
  }
  [(MTLabelStackView *)self subtitleHeightForWidth:v9];
  return v6 + v8 + v10;
}

- (double)distanceBetweenLabelFrames
{
  double v3 = [(MTLabelStackView *)self title];
  if ([v3 length])
  {
    double v4 = [(MTLabelStackView *)self subtitle];
    id v5 = [v4 length];

    if (!v5) {
      return 0.0;
    }
    double v6 = [(MTLabelStackView *)self titleLabel];
    double v3 = [v6 font];

    double v7 = [(MTLabelStackView *)self subtitleLabel];
    double v8 = [v7 font];

    [objc_opt_class() distanceBetweenLabelFramesWithTitleFont:v3 subtitleFont:v8 multilineTitle:(id)-[MTLabelStackView titleNumberOfLines](self, "titleNumberOfLines") != (id)1];
    double v10 = v9;
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (double)titleHeightForWidth:(double)a3
{
  id v5 = -[MTLabelStackView sizeCacheKeyForLabel:width:](self, "sizeCacheKeyForLabel:width:", @"title");
  double v6 = [(NSCache *)self->_textSizeCache objectForKey:v5];
  if (!v6)
  {
    double v7 = [(MTLabelStackView *)self titleLabel];
    [v7 sizeThatFits:a3, 1.79769313e308];
    double v6 = +[NSNumber numberWithDouble:v8];

    [(NSCache *)self->_textSizeCache setObject:v6 forKey:v5];
  }
  [v6 floatValue];
  double v10 = v9;

  return v10;
}

- (double)subtitleHeightForWidth:(double)a3
{
  id v5 = -[MTLabelStackView sizeCacheKeyForLabel:width:](self, "sizeCacheKeyForLabel:width:", @"subtitle");
  double v6 = [(NSCache *)self->_textSizeCache objectForKey:v5];
  if (!v6)
  {
    double v7 = [(MTLabelStackView *)self subtitleLabel];
    [v7 sizeThatFits:a3];
    double v6 = +[NSNumber numberWithDouble:v8];

    [(NSCache *)self->_textSizeCache setObject:v6 forKey:v5];
  }
  [v6 floatValue];
  double v10 = v9;

  return v10;
}

- (id)sizeCacheKeyForLabel:(id)a3 width:(double)a4
{
  return +[NSString stringWithFormat:@"%@-%f", a3, *(void *)&a4];
}

- (void)_updateTitleFont
{
  double v3 = [(MTLabelStackView *)self titleTextStyle];
  id v5 = +[UIFont mt_preferredFontForTextStyle:v3];

  double v4 = [(MTLabelStackView *)self titleLabel];
  [v4 setFont:v5];

  [(MTLabelStackView *)self _heightWillChange];
}

- (void)_updateSubtitleFont
{
  double v3 = [(MTLabelStackView *)self subtitleTextStyle];
  id v5 = +[UIFont mt_preferredFontForTextStyle:v3];

  double v4 = [(MTLabelStackView *)self subtitleLabel];
  [v4 setFont:v5];

  [(MTLabelStackView *)self _heightWillChange];
}

- (void)_heightWillChange
{
  self->_heightWillChange = 1;
  [(MTLabelStackView *)self setNeedsLayout];
}

- (void)_notifyDelegateIfHeightChanged
{
  if (self->_heightWillChange)
  {
    self->_heightWillChange = 0;
    id v3 = [(MTLabelStackView *)self delegate];
    [v3 labelStackViewDidChangeHeight:self];
  }
}

- (void)setTitle:(id)a3
{
  id v10 = a3;
  id v4 = [(MTLabelStackView *)self title];
  id v5 = v10;
  if (v4 != v10)
  {
    double v6 = [(MTLabelStackView *)self title];
    unsigned __int8 v7 = [v6 isEqualToString:v10];

    if (v7) {
      goto LABEL_5;
    }
    double v8 = [(MTLabelStackView *)self titleLabel];
    [v8 setText:v10];

    [(MTLabelStackView *)self bounds];
    id v5 = [(MTLabelStackView *)self sizeCacheKeyForLabel:@"title" width:v9];
    [(NSCache *)self->_textSizeCache removeObjectForKey:v5];
    [(MTLabelStackView *)self _heightWillChange];
  }

LABEL_5:
}

- (NSString)title
{
  v2 = [(MTLabelStackView *)self titleLabel];
  id v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setSubtitle:(id)a3
{
  id v10 = a3;
  id v4 = [(MTLabelStackView *)self subtitle];
  id v5 = v10;
  if (v4 != v10)
  {
    double v6 = [(MTLabelStackView *)self subtitle];
    unsigned __int8 v7 = [v6 isEqualToString:v10];

    if (v7) {
      goto LABEL_5;
    }
    double v8 = [(MTLabelStackView *)self subtitleLabel];
    [v8 setText:v10];

    [(MTLabelStackView *)self bounds];
    id v5 = [(MTLabelStackView *)self sizeCacheKeyForLabel:@"subtitle" width:v9];
    [(NSCache *)self->_textSizeCache removeObjectForKey:v5];
    [(MTLabelStackView *)self _heightWillChange];
  }

LABEL_5:
}

- (NSString)subtitle
{
  v2 = [(MTLabelStackView *)self subtitleLabel];
  id v3 = [v2 text];

  return (NSString *)v3;
}

- (NSString)titleTextStyle
{
  titleTextStyle = self->_titleTextStyle;
  if (titleTextStyle)
  {
    id v3 = titleTextStyle;
  }
  else
  {
    id v3 = [(id)objc_opt_class() defaultTitleTextStyle];
  }

  return v3;
}

- (void)setTitleTextStyle:(id)a3
{
  id v5 = (NSString *)a3;
  titleTextStyle = self->_titleTextStyle;
  if (titleTextStyle != v5)
  {
    unsigned __int8 v7 = v5;
    titleTextStyle = (NSString *)[(NSString *)titleTextStyle isEqualToString:v5];
    id v5 = v7;
    if ((titleTextStyle & 1) == 0)
    {
      objc_storeStrong((id *)&self->_titleTextStyle, a3);
      titleTextStyle = (NSString *)[(MTLabelStackView *)self _updateTitleFont];
      id v5 = v7;
    }
  }

  _objc_release_x1(titleTextStyle, v5);
}

- (NSString)subtitleTextStyle
{
  subtitleTextStyle = self->_subtitleTextStyle;
  if (subtitleTextStyle)
  {
    id v3 = subtitleTextStyle;
  }
  else
  {
    id v3 = [(id)objc_opt_class() defaultSubtitleTextStyle];
  }

  return v3;
}

- (void)setSubtitleTextStyle:(id)a3
{
  id v5 = (NSString *)a3;
  subtitleTextStyle = self->_subtitleTextStyle;
  if (subtitleTextStyle != v5)
  {
    unsigned __int8 v7 = v5;
    subtitleTextStyle = (NSString *)[(NSString *)subtitleTextStyle isEqualToString:v5];
    id v5 = v7;
    if ((subtitleTextStyle & 1) == 0)
    {
      objc_storeStrong((id *)&self->_subtitleTextStyle, a3);
      subtitleTextStyle = (NSString *)[(MTLabelStackView *)self _updateSubtitleFont];
      id v5 = v7;
    }
  }

  _objc_release_x1(subtitleTextStyle, v5);
}

- (UIColor)titleTextColor
{
  titleTextColor = self->_titleTextColor;
  if (titleTextColor)
  {
    id v3 = titleTextColor;
  }
  else
  {
    id v3 = +[UIColor cellTextColor];
  }

  return v3;
}

- (void)setTitleTextColor:(id)a3
{
  id v5 = (UIColor *)a3;
  titleTextColor = self->_titleTextColor;
  if (titleTextColor != v5)
  {
    double v9 = v5;
    titleTextColor = (UIColor *)[(UIColor *)titleTextColor isEqual:v5];
    id v5 = v9;
    if ((titleTextColor & 1) == 0)
    {
      objc_storeStrong((id *)&self->_titleTextColor, a3);
      unsigned __int8 v7 = [(MTLabelStackView *)self titleTextColor];
      double v8 = [(MTLabelStackView *)self titleLabel];
      [v8 setTextColor:v7];

      id v5 = v9;
    }
  }

  _objc_release_x1(titleTextColor, v5);
}

- (UIColor)subtitleTextColor
{
  subtitleTextColor = self->_subtitleTextColor;
  if (subtitleTextColor)
  {
    id v3 = subtitleTextColor;
  }
  else
  {
    id v3 = +[UIColor cellSecondaryTextColor];
  }

  return v3;
}

- (void)setSubtitleTextColor:(id)a3
{
  id v5 = (UIColor *)a3;
  subtitleTextColor = self->_subtitleTextColor;
  if (subtitleTextColor != v5)
  {
    double v9 = v5;
    subtitleTextColor = (UIColor *)[(UIColor *)subtitleTextColor isEqual:v5];
    id v5 = v9;
    if ((subtitleTextColor & 1) == 0)
    {
      objc_storeStrong((id *)&self->_subtitleTextColor, a3);
      unsigned __int8 v7 = [(MTLabelStackView *)self subtitleTextColor];
      double v8 = [(MTLabelStackView *)self subtitleLabel];
      [v8 setTextColor:v7];

      id v5 = v9;
    }
  }

  _objc_release_x1(subtitleTextColor, v5);
}

- (unint64_t)titleNumberOfLines
{
  v2 = [(MTLabelStackView *)self titleLabel];
  id v3 = [v2 numberOfLines];

  return (unint64_t)v3;
}

- (void)setTitleNumberOfLines:(unint64_t)a3
{
  if ([(MTLabelStackView *)self titleNumberOfLines] != a3)
  {
    id v5 = [(MTLabelStackView *)self titleLabel];
    [v5 setNumberOfLines:a3];

    [(MTLabelStackView *)self _heightWillChange];
  }
}

- (unint64_t)subtitleNumberOfLines
{
  v2 = [(MTLabelStackView *)self subtitleLabel];
  id v3 = [v2 numberOfLines];

  return (unint64_t)v3;
}

- (void)setSubtitleNumberOfLines:(unint64_t)a3
{
  if ([(MTLabelStackView *)self subtitleNumberOfLines] != a3)
  {
    id v5 = [(MTLabelStackView *)self subtitleLabel];
    [v5 setNumberOfLines:a3];

    [(MTLabelStackView *)self _heightWillChange];
  }
}

- (UILabel)titleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    id v4 = (UILabel *)objc_opt_new();
    id v5 = self->_titleLabel;
    self->_titleLabel = v4;

    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", [(id)objc_opt_class() defaultTitleNumberOfLines]);
    double v6 = [(MTLabelStackView *)self titleTextColor];
    [(UILabel *)self->_titleLabel setTextColor:v6];

    unsigned __int8 v7 = [(MTLabelStackView *)self titleTextStyle];
    double v8 = +[UIFont mt_preferredFontForTextStyle:v7];
    [(UILabel *)self->_titleLabel setFont:v8];

    titleLabel = self->_titleLabel;
  }

  return titleLabel;
}

- (UILabel)subtitleLabel
{
  subtitleLabel = self->_subtitleLabel;
  if (!subtitleLabel)
  {
    id v4 = (UILabel *)objc_opt_new();
    id v5 = self->_subtitleLabel;
    self->_subtitleLabel = v4;

    -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", [(id)objc_opt_class() defaultSubtitleNumberOfLines]);
    double v6 = [(MTLabelStackView *)self subtitleTextColor];
    [(UILabel *)self->_subtitleLabel setTextColor:v6];

    unsigned __int8 v7 = [(MTLabelStackView *)self subtitleTextStyle];
    double v8 = +[UIFont mt_preferredFontForTextStyle:v7];
    [(UILabel *)self->_subtitleLabel setFont:v8];

    subtitleLabel = self->_subtitleLabel;
  }

  return subtitleLabel;
}

- (MTLabelStackViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTLabelStackViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)subtitleMaxWidth
{
  return self->_subtitleMaxWidth;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setTitleLabel:(id)a3
{
}

- (void)setSubtitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_subtitleTextColor, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_subtitleTextStyle, 0);
  objc_storeStrong((id *)&self->_titleTextStyle, 0);

  objc_storeStrong((id *)&self->_textSizeCache, 0);
}

@end