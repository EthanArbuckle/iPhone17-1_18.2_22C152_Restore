@interface MFSearchSuggestionsTableViewCell
+ (BOOL)requiresConstraintBasedLayout;
+ (id)_defaultLabelAttributesWithFont:(id)a3;
- (MFSearchSuggestionsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MUISearchAtomSuggestion)suggestion;
- (NSArray)defaultConstraints;
- (NSArray)subtitleConstraints;
- (NSArray)titleOnlyConstraints;
- (NSLayoutConstraint)glyphCenterXConstraint;
- (NSLayoutConstraint)glyphVerticalConstraint;
- (NSLayoutConstraint)interLabelBaselineConstraint;
- (NSLayoutConstraint)titleLeadingConstraint;
- (double)_glyphCenterXConstant;
- (double)_interLabelBaselineConstant;
- (double)_titleLeadingConstant;
- (id)_subtitleFont;
- (id)_titleFont;
- (void)_preferredContentSizeCategoryDidChange:(id)a3;
- (void)setDefaultConstraints:(id)a3;
- (void)setGlyphCenterXConstraint:(id)a3;
- (void)setGlyphVerticalConstraint:(id)a3;
- (void)setInterLabelBaselineConstraint:(id)a3;
- (void)setSubtitleConstraints:(id)a3;
- (void)setSuggestion:(id)a3;
- (void)setTitleLeadingConstraint:(id)a3;
- (void)setTitleOnlyConstraints:(id)a3;
- (void)updateConfigurationUsingState:(id)a3;
- (void)updateConstraints;
@end

@implementation MFSearchSuggestionsTableViewCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

+ (id)_defaultLabelAttributesWithFont:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableParagraphStyle);
  v5 = [UIApp preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  if (IsAccessibilityCategory)
  {
    [v4 setLineBreakMode:0];
    LODWORD(v7) = 1.0;
    [v4 setHyphenationFactor:v7];
  }
  else
  {
    [v4 setLineBreakMode:4];
  }
  v10[0] = NSParagraphStyleAttributeName;
  v10[1] = NSFontAttributeName;
  v11[0] = v4;
  v11[1] = v3;
  v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

- (MFSearchSuggestionsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v77.receiver = self;
  v77.super_class = (Class)MFSearchSuggestionsTableViewCell;
  id v74 = a4;
  v5 = -[MFSearchSuggestionsTableViewCell initWithStyle:reuseIdentifier:](&v77, "initWithStyle:reuseIdentifier:", a3);
  if (v5)
  {
    id v6 = objc_alloc((Class)UIImageView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v10 = [v6 initWithFrame:CGRectZero.origin.x, y, width, height];
    glyph = v5->_glyph;
    v5->_glyph = v10;

    v12 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    title = v5->_title;
    v5->_title = v12;

    v14 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    subtitle = v5->_subtitle;
    v5->_subtitle = v14;

    v16 = [(MFSearchSuggestionsTableViewCell *)v5 _titleFont];
    [(UILabel *)v5->_title setFont:v16];

    [(UILabel *)v5->_title setTextAlignment:4];
    v17 = [(MFSearchSuggestionsTableViewCell *)v5 _subtitleFont];
    [(UILabel *)v5->_subtitle setFont:v17];

    [(UILabel *)v5->_subtitle setLineBreakMode:5];
    [(UILabel *)v5->_subtitle setTextAlignment:4];
    v18 = [UIApp preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v18);

    v20 = v5->_title;
    if (IsAccessibilityCategory)
    {
      [(UILabel *)v20 setNumberOfLines:0];
      [(UILabel *)v5->_title setLineBreakMode:0];
      [(UILabel *)v5->_subtitle setLineBreakMode:0];
      uint64_t v21 = 0;
    }
    else
    {
      [(UILabel *)v20 setNumberOfLines:1];
      [(UILabel *)v5->_title setLineBreakMode:5];
      [(UILabel *)v5->_subtitle setLineBreakMode:5];
      uint64_t v21 = 1;
    }
    [(UILabel *)v5->_subtitle setNumberOfLines:v21];
    [(UIImageView *)v5->_glyph setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v5->_title setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v5->_subtitle setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v22) = 1148846080;
    [(UIImageView *)v5->_glyph setContentCompressionResistancePriority:0 forAxis:v22];
    LODWORD(v23) = 1148846080;
    [(UIImageView *)v5->_glyph setContentCompressionResistancePriority:1 forAxis:v23];
    LODWORD(v24) = 1148846080;
    [(UIImageView *)v5->_glyph setContentHuggingPriority:0 forAxis:v24];
    LODWORD(v25) = 1148846080;
    [(UIImageView *)v5->_glyph setContentHuggingPriority:1 forAxis:v25];
    v26 = +[UIColor labelColor];
    [(UIImageView *)v5->_glyph setTintColor:v26];

    v76 = [(MFSearchSuggestionsTableViewCell *)v5 contentView];
    [v76 addSubview:v5->_glyph];
    [v76 addSubview:v5->_title];
    [v76 addSubview:v5->_subtitle];
    v75 = [v76 layoutMarginsGuide];
    v27 = [(UIImageView *)v5->_glyph centerXAnchor];
    v28 = [v75 leadingAnchor];
    [(MFSearchSuggestionsTableViewCell *)v5 _glyphCenterXConstant];
    v29 = [v27 constraintEqualToAnchor:v28];
    [(MFSearchSuggestionsTableViewCell *)v5 setGlyphCenterXConstraint:v29];

    v30 = [(UILabel *)v5->_title leadingAnchor];
    v31 = [v75 leadingAnchor];
    [(MFSearchSuggestionsTableViewCell *)v5 _titleLeadingConstant];
    v32 = [v30 constraintEqualToAnchor:v31];
    [(MFSearchSuggestionsTableViewCell *)v5 setTitleLeadingConstraint:v32];

    v70 = [(MFSearchSuggestionsTableViewCell *)v5 glyphCenterXConstraint];
    v80[0] = v70;
    v69 = [(MFSearchSuggestionsTableViewCell *)v5 titleLeadingConstraint];
    v80[1] = v69;
    v72 = [(UILabel *)v5->_title trailingAnchor];
    v68 = [v75 trailingAnchor];
    v67 = [v72 constraintEqualToAnchor:];
    v80[2] = v67;
    v33 = [(UILabel *)v5->_subtitle leadingAnchor];
    v34 = [(UILabel *)v5->_title leadingAnchor];
    v35 = [v33 constraintEqualToAnchor:v34];
    v80[3] = v35;
    v36 = [(UILabel *)v5->_subtitle trailingAnchor];
    v37 = [(UILabel *)v5->_title trailingAnchor];
    v38 = [v36 constraintEqualToAnchor:v37];
    v80[4] = v38;
    v39 = +[NSArray arrayWithObjects:v80 count:5];
    [(MFSearchSuggestionsTableViewCell *)v5 setDefaultConstraints:v39];

    v40 = [(UIImageView *)v5->_glyph centerYAnchor];
    v41 = [(UILabel *)v5->_title firstBaselineAnchor];
    v42 = [(UILabel *)v5->_title font];
    [v42 capHeight];
    v44 = [v40 constraintEqualToAnchor:v41 constant:v43 * -0.5];
    [(MFSearchSuggestionsTableViewCell *)v5 setGlyphVerticalConstraint:v44];

    v45 = [(MFSearchSuggestionsTableViewCell *)v5 glyphVerticalConstraint];
    [v45 setActive:1];

    v73 = [(UILabel *)v5->_title topAnchor];
    v71 = [v76 topAnchor];
    v46 = [v73 constraintEqualToAnchor:10.0];
    v79[0] = v46;
    v47 = [v76 bottomAnchor];
    v48 = [(UILabel *)v5->_title bottomAnchor];
    v49 = [v47 constraintEqualToAnchor:v48 constant:10.0];
    v79[1] = v49;
    v50 = [(UILabel *)v5->_subtitle centerYAnchor];
    v51 = [(UILabel *)v5->_title centerYAnchor];
    v52 = [v50 constraintEqualToAnchor:v51];
    v79[2] = v52;
    v53 = +[NSArray arrayWithObjects:v79 count:3];
    [(MFSearchSuggestionsTableViewCell *)v5 setTitleOnlyConstraints:v53];

    v54 = [(UILabel *)v5->_subtitle firstBaselineAnchor];
    v55 = [(UILabel *)v5->_title lastBaselineAnchor];
    [(MFSearchSuggestionsTableViewCell *)v5 _interLabelBaselineConstant];
    v56 = [v54 constraintEqualToAnchor:v55];
    [(MFSearchSuggestionsTableViewCell *)v5 setInterLabelBaselineConstraint:v56];

    v57 = [(UILabel *)v5->_title topAnchor];
    v58 = [v76 topAnchor];
    v59 = [v57 constraintEqualToAnchor:v58 constant:10.0];
    v78[0] = v59;
    v60 = [(MFSearchSuggestionsTableViewCell *)v5 interLabelBaselineConstraint];
    v78[1] = v60;
    v61 = [v76 bottomAnchor];
    v62 = [(UILabel *)v5->_subtitle bottomAnchor];
    v63 = [v61 constraintEqualToAnchor:v62 constant:10.0];
    v78[2] = v63;
    v64 = +[NSArray arrayWithObjects:v78 count:3];
    [(MFSearchSuggestionsTableViewCell *)v5 setSubtitleConstraints:v64];

    v65 = +[NSNotificationCenter defaultCenter];
    [v65 addObserver:v5 selector:"_preferredContentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v5;
}

- (void)updateConfigurationUsingState:(id)a3
{
  if ([a3 isFocused])
  {
    id v5 = +[UIColor systemWhiteColor];
    -[UILabel setTextColor:](self->_title, "setTextColor:");
    [(UILabel *)self->_subtitle setTextColor:v5];
    [(MUISearchAtomSuggestion *)self->_suggestion focusedTintColor];
  }
  else
  {
    id v5 = +[UIColor labelColor];
    -[UILabel setTextColor:](self->_title, "setTextColor:");
    [(UILabel *)self->_subtitle setTextColor:v5];
    [(MUISearchAtomSuggestion *)self->_suggestion tintColor];
  id v4 = };
  [(UIImageView *)self->_glyph setTintColor:v4];
}

- (id)_titleFont
{
  v2 = +[MFFontMetricCache sharedFontMetricCache];
  id v3 = [v2 cachedFont:&stru_10060CEE8 forKey:@"MFSearchSuggestionsCell.titleFont"];

  return v3;
}

- (id)_subtitleFont
{
  v2 = +[MFFontMetricCache sharedFontMetricCache];
  id v3 = [v2 cachedFont:&stru_10060CF08 forKey:@"MFSearchSuggestionsCell.subtitleFont"];

  return v3;
}

- (double)_glyphCenterXConstant
{
  v2 = +[MFFontMetricCache sharedFontMetricCache];
  [v2 cachedFloat:&stru_10060CF28 forKey:@"MFSearchSuggestionCell.glyphCenterX"];
  double v4 = v3;

  return v4;
}

- (double)_titleLeadingConstant
{
  v2 = +[MFFontMetricCache sharedFontMetricCache];
  [v2 cachedFloat:&stru_10060CF48 forKey:@"MFSearchSuggestionCell.titleLeading"];
  double v4 = v3;

  return v4;
}

- (double)_interLabelBaselineConstant
{
  double v3 = +[MFFontMetricCache sharedFontMetricCache];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001DFC1C;
  v7[3] = &unk_10060C590;
  v7[4] = self;
  [v3 cachedFloat:v7 forKey:@"MFSearchSuggestionCell.twoLineInterLabelBaseline"];
  double v5 = v4;

  return v5;
}

- (void)updateConstraints
{
  v13.receiver = self;
  v13.super_class = (Class)MFSearchSuggestionsTableViewCell;
  [(MFSearchSuggestionsTableViewCell *)&v13 updateConstraints];
  double v3 = [(UILabel *)self->_subtitle text];
  BOOL v4 = [v3 length] == 0;

  if (v4)
  {
    titleOnlyConstraints = self->_titleOnlyConstraints;
    v15[0] = self->_defaultConstraints;
    v15[1] = titleOnlyConstraints;
    uint64_t v6 = +[NSArray arrayWithObjects:v15 count:2];
    double v7 = &OBJC_IVAR___MFSearchSuggestionsTableViewCell__subtitleConstraints;
  }
  else
  {
    subtitleConstraints = self->_subtitleConstraints;
    v14[0] = self->_defaultConstraints;
    v14[1] = subtitleConstraints;
    uint64_t v6 = +[NSArray arrayWithObjects:v14 count:2];
    double v7 = &OBJC_IVAR___MFSearchSuggestionsTableViewCell__titleOnlyConstraints;
  }
  v9 = (void *)v6;
  id v10 = *(id *)((char *)&self->super.super.super.super.isa + *v7);
  v11 = [v10 ef_flatten];
  +[NSLayoutConstraint deactivateConstraints:v11];

  v12 = [v9 ef_flatten];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)_preferredContentSizeCategoryDidChange:(id)a3
{
  id v16 = +[MFFontMetricCache sharedFontMetricCache];
  [v16 ensureCacheIsValid];

  id v17 = [(MFSearchSuggestionsTableViewCell *)self _titleFont];
  -[UILabel setFont:](self->_title, "setFont:");

  id v18 = [(MFSearchSuggestionsTableViewCell *)self _subtitleFont];
  -[UILabel setFont:](self->_subtitle, "setFont:");

  v19 = [UIApp preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v19);

  BOOL v5 = !IsAccessibilityCategory;
  if (IsAccessibilityCategory) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = 5;
  }
  [(UILabel *)self->_title setNumberOfLines:v5];
  [(UILabel *)self->_title setLineBreakMode:v6];
  [(UILabel *)self->_subtitle setLineBreakMode:v6];
  [(UILabel *)self->_subtitle setNumberOfLines:v5];
  id v20 = [(UILabel *)self->_title font];
  [v20 capHeight];
  double v8 = v7;
  v9 = [(MFSearchSuggestionsTableViewCell *)self glyphVerticalConstraint];
  [v9 setConstant:v8 * -0.5];

  [(MFSearchSuggestionsTableViewCell *)self _glyphCenterXConstant];
  double v11 = v10;
  id v21 = [(MFSearchSuggestionsTableViewCell *)self glyphCenterXConstraint];
  [v21 setConstant:v11];

  [(MFSearchSuggestionsTableViewCell *)self _titleLeadingConstant];
  double v13 = v12;
  id v22 = [(MFSearchSuggestionsTableViewCell *)self titleLeadingConstraint];
  [v22 setConstant:v13];

  [(MFSearchSuggestionsTableViewCell *)self _interLabelBaselineConstant];
  double v15 = v14;
  id v23 = [(MFSearchSuggestionsTableViewCell *)self interLabelBaselineConstraint];
  [v23 setConstant:v15];
}

- (void)setSuggestion:(id)a3
{
  uint64_t v6 = (MUISearchAtomSuggestion *)a3;
  if (self->_suggestion != v6)
  {
    v19 = v6;
    objc_storeStrong((id *)&self->_suggestion, a3);
    double v7 = [(MUISearchAtomSuggestion *)v19 image];
    [(UIImageView *)self->_glyph setImage:v7];

    double v8 = [(MUISearchAtomSuggestion *)v19 tintColor];
    [(UIImageView *)self->_glyph setTintColor:v8];

    v9 = [(MFSearchSuggestionsTableViewCell *)self _titleFont];
    double v10 = +[MFSearchSuggestionsTableViewCell _defaultLabelAttributesWithFont:v9];

    double v11 = [(MUISearchAtomSuggestion *)v19 title];
    if (v11)
    {
      id v12 = objc_alloc((Class)NSAttributedString);
      double v3 = [(MUISearchAtomSuggestion *)v19 title];
      id v13 = [v12 initWithString:v3 attributes:v10];
    }
    else
    {
      id v13 = 0;
    }
    [(UILabel *)self->_title setAttributedText:v13];
    if (v11)
    {
    }
    double v14 = [(MFSearchSuggestionsTableViewCell *)self _subtitleFont];
    double v15 = +[MFSearchSuggestionsTableViewCell _defaultLabelAttributesWithFont:v14];

    id v16 = [(MUISearchAtomSuggestion *)v19 subtitle];
    if (v16)
    {
      id v17 = objc_alloc((Class)NSAttributedString);
      id v13 = [(MUISearchAtomSuggestion *)v19 subtitle];
      id v18 = [v17 initWithString:v13 attributes:v15];
    }
    else
    {
      id v18 = 0;
    }
    [(UILabel *)self->_subtitle setAttributedText:v18];
    if (v16)
    {
    }
    [(MFSearchSuggestionsTableViewCell *)self setNeedsUpdateConstraints];

    uint64_t v6 = v19;
  }
}

- (MUISearchAtomSuggestion)suggestion
{
  return self->_suggestion;
}

- (NSArray)defaultConstraints
{
  return self->_defaultConstraints;
}

- (void)setDefaultConstraints:(id)a3
{
}

- (NSArray)titleOnlyConstraints
{
  return self->_titleOnlyConstraints;
}

- (void)setTitleOnlyConstraints:(id)a3
{
}

- (NSArray)subtitleConstraints
{
  return self->_subtitleConstraints;
}

- (void)setSubtitleConstraints:(id)a3
{
}

- (NSLayoutConstraint)glyphCenterXConstraint
{
  return self->_glyphCenterXConstraint;
}

- (void)setGlyphCenterXConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleLeadingConstraint
{
  return self->_titleLeadingConstraint;
}

- (void)setTitleLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)interLabelBaselineConstraint
{
  return self->_interLabelBaselineConstraint;
}

- (void)setInterLabelBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)glyphVerticalConstraint
{
  return self->_glyphVerticalConstraint;
}

- (void)setGlyphVerticalConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_interLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_titleLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_glyphCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleConstraints, 0);
  objc_storeStrong((id *)&self->_titleOnlyConstraints, 0);
  objc_storeStrong((id *)&self->_defaultConstraints, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_glyph, 0);
}

@end