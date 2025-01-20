@interface SFHighlightBanner
- (CGSize)sizeThatFits:(CGSize)a3;
- (SFHighlightBanner)initWithHighlight:(id)a3;
- (SLHighlight)highlight;
- (id)closeActionHandler;
- (void)_close;
- (void)setCloseActionHandler:(id)a3;
- (void)themeDidChange;
@end

@implementation SFHighlightBanner

- (SFHighlightBanner)initWithHighlight:(id)a3
{
  v51[6] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v50.receiver = self;
  v50.super_class = (Class)SFHighlightBanner;
  v6 = [(SFHighlightBanner *)&v50 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_highlight, a3);
    v8 = [SFThemeColorEffectView alloc];
    v9 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
    uint64_t v10 = [(SFThemeColorEffectView *)v8 initWithEffect:v9];
    backdrop = v7->_backdrop;
    v7->_backdrop = (SFThemeColorEffectView *)v10;

    [(SFHighlightBanner *)v7 bounds];
    -[SFThemeColorEffectView setFrame:](v7->_backdrop, "setFrame:");
    [(SFThemeColorEffectView *)v7->_backdrop setAutoresizingMask:18];
    [(SFHighlightBanner *)v7 addSubview:v7->_backdrop];
    [(SFHighlightBanner *)v7 sendSubviewToBack:v7->_backdrop];
    v12 = (SWAttributionView *)objc_alloc_init(MEMORY[0x1E4F3BD60]);
    attributionView = v7->_attributionView;
    v7->_attributionView = v12;

    v14 = (void *)[objc_alloc(MEMORY[0x1E4F3BD78]) initWithSLHighlight:v5];
    [(SWAttributionView *)v7->_attributionView setHighlight:v14];

    [(SWAttributionView *)v7->_attributionView useBannerLayout];
    [(SWAttributionView *)v7->_attributionView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFHighlightBanner *)v7 addSubview:v7->_attributionView];
    v15 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    id v49 = v5;
    v16 = [MEMORY[0x1E4FB1618] clearColor];
    v17 = [v15 background];
    [v17 setBackgroundColor:v16];

    v18 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.circle.fill"];
    v19 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    v20 = [v18 imageWithTintColor:v19 renderingMode:1];
    [v15 setImage:v20];

    v21 = [MEMORY[0x1E4FB1830] configurationWithPointSize:6 weight:2 scale:15.0];
    v48 = v15;
    [v15 setPreferredSymbolConfigurationForImage:v21];

    objc_msgSend(v15, "setContentInsets:", 6.0, 6.0, 6.0, 6.0);
    v22 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v15 primaryAction:0];
    [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v22 addTarget:v7 action:sel__close forControlEvents:64];
    objc_msgSend(v22, "_sf_setMatchesIntrinsicContentSize");
    [(SFHighlightBanner *)v7 addSubview:v22];
    v39 = (void *)MEMORY[0x1E4F28DC8];
    v47 = [(SFHighlightBanner *)v7 heightAnchor];
    v46 = [(SWAttributionView *)v7->_attributionView heightAnchor];
    v45 = [v47 constraintEqualToAnchor:v46 constant:16.0];
    v51[0] = v45;
    v43 = [(SWAttributionView *)v7->_attributionView leadingAnchor];
    v44 = [(SFHighlightBanner *)v7 layoutMarginsGuide];
    v42 = [v44 leadingAnchor];
    v41 = [v43 constraintEqualToAnchor:v42 constant:4.0];
    v51[1] = v41;
    v40 = [(SWAttributionView *)v7->_attributionView centerYAnchor];
    v38 = [(SFHighlightBanner *)v7 centerYAnchor];
    v37 = [v40 constraintEqualToAnchor:v38];
    v51[2] = v37;
    v36 = [(SWAttributionView *)v7->_attributionView trailingAnchor];
    v35 = [v22 leadingAnchor];
    v34 = [v36 constraintEqualToAnchor:v35 constant:-8.0];
    v51[3] = v34;
    v33 = [v22 imageView];
    v23 = [v33 trailingAnchor];
    v24 = [(SFHighlightBanner *)v7 layoutMarginsGuide];
    v25 = [v24 trailingAnchor];
    v26 = [v23 constraintEqualToAnchor:v25 constant:-4.0];
    v51[4] = v26;
    v27 = [v22 centerYAnchor];
    v28 = [(SFHighlightBanner *)v7 centerYAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    v51[5] = v29;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:6];
    [v39 activateConstraints:v30];

    v31 = v7;
    id v5 = v49;
  }
  return v7;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1112014848;
  -[SFHighlightBanner systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height, v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)themeDidChange
{
  id v3 = [(SFPinnableBanner *)self theme];
  [(SFThemeColorEffectView *)self->_backdrop setTheme:v3];
}

- (void)_close
{
  closeActionHandler = (void (**)(id, SFHighlightBanner *))self->_closeActionHandler;
  if (closeActionHandler) {
    closeActionHandler[2](closeActionHandler, self);
  }
}

- (SLHighlight)highlight
{
  return self->_highlight;
}

- (id)closeActionHandler
{
  return self->_closeActionHandler;
}

- (void)setCloseActionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_closeActionHandler, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_attributionView, 0);

  objc_storeStrong((id *)&self->_backdrop, 0);
}

@end