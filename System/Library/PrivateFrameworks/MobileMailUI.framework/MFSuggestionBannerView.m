@interface MFSuggestionBannerView
- (MFSuggestionBannerView)initWithFrame:(CGRect)a3;
- (MFSuggestionBannerView)initWithFrame:(CGRect)a3 banner:(id)a4;
- (NSArray)bannerConstraints;
- (SGBannerProtocol)banner;
- (double)trailingOffsetToMarginForCloseButtonAlignment;
- (id)_constraintsForEdges:(unint64_t)a3 banner:(id)a4 useLayoutMarginsGuide:(BOOL)a5;
- (void)_configureBannerAppearance;
- (void)commonInitWithBanner:(id)a3;
- (void)setBanner:(id)a3;
- (void)setBannerConstraints:(id)a3;
- (void)setSeparatorDrawsFlushWithLeadingEdge:(BOOL)a3;
- (void)setSeparatorDrawsFlushWithTrailingEdge:(BOOL)a3;
- (void)updateConstraints;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation MFSuggestionBannerView

- (MFSuggestionBannerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F5DFE8]), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v12.receiver = self;
  v12.super_class = (Class)MFSuggestionBannerView;
  v9 = -[MFMessageHeaderViewBlock initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  v10 = v9;
  if (v9) {
    [(MFSuggestionBannerView *)v9 commonInitWithBanner:v8];
  }

  return v10;
}

- (MFSuggestionBannerView)initWithFrame:(CGRect)a3 banner:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MFSuggestionBannerView;
  v10 = -[MFMessageHeaderViewBlock initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10) {
    [(MFSuggestionBannerView *)v10 commonInitWithBanner:v9];
  }
  [(MFSuggestionBannerView *)v11 setAccessibilityIdentifier:*MEMORY[0x1E4F73C10]];

  return v11;
}

- (void)commonInitWithBanner:(id)a3
{
  id v5 = a3;
  [v5 setInsetsLayoutMarginsFromSafeArea:0];
  objc_storeStrong((id *)&self->_banner, a3);
  [(MFSuggestionBannerView *)self addSubview:self->_banner];
  -[MFSuggestionBannerView _configureBannerAppearance]((id *)&self->super.super.super.super.isa);
}

- (void)_configureBannerAppearance
{
  if (a1 && objc_msgSend(a1, "mf_debugModeEnabled"))
  {
    id v3 = [MEMORY[0x1E4FB1618] purpleColor];
    v2 = [v3 colorWithAlphaComponent:0.2];
    [a1[61] setBackgroundColor:v2];
  }
}

- (void)willMoveToSuperview:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = [(MFSuggestionBannerView *)self banner];
    [v5 setCloseButtonXAnchorOffset:0.0];

    v6 = [(MFSuggestionBannerView *)self bannerConstraints];
    if (v6) {
      [MEMORY[0x1E4F28DC8] deactivateConstraints:v6];
    }

    id v4 = 0;
  }
}

- (void)setBanner:(id)a3
{
  id v5 = (SGBannerProtocol *)a3;
  banner = self->_banner;
  v7 = v5;
  if (banner != v5) {
    [(SGBannerProtocol *)banner removeFromSuperview];
  }
  [(MFSuggestionBannerView *)self addSubview:v7];
  objc_storeStrong((id *)&self->_banner, a3);
  -[MFSuggestionBannerView _configureBannerAppearance]((id *)&self->super.super.super.super.isa);
}

- (id)_constraintsForEdges:(unint64_t)a3 banner:(id)a4 useLayoutMarginsGuide:(BOOL)a5
{
  char v5 = a3;
  id v7 = a4;
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [(MFSuggestionBannerView *)self leadingAnchor];
  id v9 = [(MFSuggestionBannerView *)self trailingAnchor];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ((v5 & 2) != 0)
  {
    v11 = [v7 leadingAnchor];
    objc_super v12 = [v11 constraintEqualToAnchor:v8];
    [v10 addObject:v12];
  }
  if ((v5 & 8) != 0)
  {
    objc_super v13 = [v7 trailingAnchor];
    v14 = [v13 constraintEqualToAnchor:v9];
    [v10 addObject:v14];
  }
  if (v5)
  {
    v15 = [v7 topAnchor];
    v16 = [(MFSuggestionBannerView *)self topAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    [v10 addObject:v17];
  }
  if ((v5 & 4) != 0)
  {
    v18 = [v7 bottomAnchor];
    v19 = [(MFSuggestionBannerView *)self bottomAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [v10 addObject:v20];
  }
  return v10;
}

- (void)updateConstraints
{
  id v3 = [(MFSuggestionBannerView *)self bannerConstraints];

  if (!v3)
  {
    id v4 = [(MFSuggestionBannerView *)self banner];
    char v5 = [(MFMessageHeaderViewBlock *)self displayMetrics];
    v6 = -[MFSuggestionBannerView _constraintsForEdges:banner:useLayoutMarginsGuide:](self, "_constraintsForEdges:banner:useLayoutMarginsGuide:", 15, v4, [v5 prefersFlushSeparator]);
    [(MFSuggestionBannerView *)self setBannerConstraints:v6];

    id v7 = [(MFMessageHeaderViewBlock *)self displayMetrics];
    LODWORD(v5) = [v7 prefersFlushSeparator];

    double v8 = 0.0;
    if (v5) {
      [(MFSuggestionBannerView *)self trailingOffsetToMarginForCloseButtonAlignment];
    }
    [(SGBannerProtocol *)self->_banner setCloseButtonXAnchorOffset:v8];
    [(SGBannerProtocol *)self->_banner reload];
    id v9 = (void *)MEMORY[0x1E4F28DC8];
    id v10 = [(MFSuggestionBannerView *)self bannerConstraints];
    [v9 activateConstraints:v10];
  }
  v11.receiver = self;
  v11.super_class = (Class)MFSuggestionBannerView;
  [(MFMessageHeaderViewBlock *)&v11 updateConstraints];
}

- (void)setSeparatorDrawsFlushWithLeadingEdge:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MFSuggestionBannerView;
  [(MFMessageHeaderViewBlock *)&v3 setSeparatorDrawsFlushWithLeadingEdge:1];
}

- (void)setSeparatorDrawsFlushWithTrailingEdge:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MFSuggestionBannerView;
  [(MFMessageHeaderViewBlock *)&v3 setSeparatorDrawsFlushWithTrailingEdge:1];
}

- (double)trailingOffsetToMarginForCloseButtonAlignment
{
  return 6.0;
}

- (SGBannerProtocol)banner
{
  return self->_banner;
}

- (NSArray)bannerConstraints
{
  return self->_bannerConstraints;
}

- (void)setBannerConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerConstraints, 0);
  objc_storeStrong((id *)&self->_banner, 0);
}

@end