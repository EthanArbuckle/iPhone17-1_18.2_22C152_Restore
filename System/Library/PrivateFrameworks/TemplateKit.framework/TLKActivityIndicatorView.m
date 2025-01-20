@interface TLKActivityIndicatorView
- (BOOL)usesDefaultLayoutMargins;
- (TLKLabel)subtitleLabel;
- (TLKMultilineText)subtitle;
- (UIActivityIndicatorView)activityIndicator;
- (id)setupContentView;
- (id)subtitleLabelText;
- (void)didMoveToWindow;
- (void)observedPropertiesChanged;
- (void)setActivityIndicator:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TLKActivityIndicatorView

- (id)setupContentView
{
  v3 = objc_opt_new();
  [v3 setAxis:1];
  [v3 setAlignment:3];
  [v3 setSpacing:12.0];
  +[TLKLayoutUtilities deviceScaledRoundedInsets:forView:](TLKLayoutUtilities, "deviceScaledRoundedInsets:forView:", self, 40.0, 40.0, 40.0, 40.0);
  objc_msgSend(v3, "setLayoutMargins:");
  v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:101];
  [v4 setHidesWhenStopped:0];
  [v3 addArrangedSubview:v4];
  [(TLKActivityIndicatorView *)self setActivityIndicator:v4];
  v5 = +[TLKLabel secondaryLabel];
  [v3 addArrangedSubview:v5];
  v6 = +[TLKFontUtilities subheadFont];
  [v5 setFont:v6];

  [(TLKActivityIndicatorView *)self setSubtitleLabel:v5];
  return v3;
}

- (BOOL)usesDefaultLayoutMargins
{
  return 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLKActivityIndicatorView;
  [(TLKActivityIndicatorView *)&v9 traitCollectionDidChange:v4];
  v5 = [(TLKActivityIndicatorView *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(UIView *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  v6 = [(TLKActivityIndicatorView *)self traitCollection];
  uint64_t v7 = [v6 _vibrancy];
  uint64_t v8 = [v4 _vibrancy];

  if (v7 != v8) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)TLKActivityIndicatorView;
  [(TLKActivityIndicatorView *)&v3 didMoveToWindow];
  [(UIView *)self tlk_updateWithCurrentAppearance];
}

- (void)tlk_updateForAppearance:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TLKActivityIndicatorView;
  id v4 = a3;
  [(UIView *)&v8 tlk_updateForAppearance:v4];
  v5 = objc_msgSend(v4, "secondaryColor", v8.receiver, v8.super_class);
  v6 = [(TLKActivityIndicatorView *)self activityIndicator];
  [v6 setColor:v5];

  uint64_t v7 = [(TLKActivityIndicatorView *)self activityIndicator];
  [v4 enableAppearanceForView:v7];
}

- (void)setSubtitle:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_subtitle = &self->_subtitle;
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_subtitle setObserver:0];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = v5;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v7 = *p_subtitle;
      uint64_t v8 = [(TLKMultilineText *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v30;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v30 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
            if (objc_opt_respondsToSelector()) {
              [v12 setObserver:0];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [(TLKMultilineText *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v9);
      }

      id v5 = v24;
    }
  }
  objc_storeStrong((id *)&self->_subtitle, a3);
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_subtitle setObserver:self];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v13 = *p_subtitle;
      uint64_t v14 = [(TLKMultilineText *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v26;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
            if (objc_opt_respondsToSelector()) {
              [v18 setObserver:self];
            }
            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [(TLKMultilineText *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v15);
      }
    }
  }
  uint64_t v19 = [(TLKView *)self observer];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(TLKView *)self observer];
    uint64_t v22 = [v21 batchUpdateCount];

    if (!v22)
    {
      v23 = [(TLKView *)self observer];
      [v23 propertiesDidChange];
    }
  }
}

- (void)observedPropertiesChanged
{
  objc_super v3 = [(TLKActivityIndicatorView *)self subtitle];
  id v4 = [v3 text];
  id v5 = [(TLKActivityIndicatorView *)self subtitleLabel];
  [v5 setText:v4];

  id v6 = [(TLKActivityIndicatorView *)self activityIndicator];
  [v6 startAnimating];
}

- (id)subtitleLabelText
{
  v2 = [(TLKActivityIndicatorView *)self subtitleLabel];
  objc_super v3 = [v2 text];

  return v3;
}

- (TLKMultilineText)subtitle
{
  return self->_subtitle;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (TLKLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
}

@end