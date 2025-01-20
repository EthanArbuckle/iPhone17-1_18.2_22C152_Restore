@interface SBSystemActionSimpleControlPreviewElement
- (BOOL)isProvidedViewConcentric:(id)a3 inLayoutMode:(int64_t)a4;
- (SBSystemActionSimpleControlPreviewElement)initWithSystemAction:(id)a3;
- (void)_updateContentWithProperties:(void *)a3 previousProperties:;
- (void)controlSystemAction:(id)a3 propertiesDidChange:(id)a4;
- (void)dealloc;
- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4;
@end

@implementation SBSystemActionSimpleControlPreviewElement

- (SBSystemActionSimpleControlPreviewElement)initWithSystemAction:(id)a3
{
  v4 = (id *)a3;
  v5 = -[SBControlSystemAction iconView](v4);
  v6 = +[SBSystemActionSimplePreviewElement defaultSymbolFont]();
  [v5 setFont:v6];

  [v5 setStyle:1];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4FA7D50]) initWithView:v5];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4FA7DB0]) initWithText:&stru_1F3084718 style:4];
  id v9 = objc_alloc_init(MEMORY[0x1E4FA7D70]);
  [v9 setLeadingContentViewProvider:v7];
  [v9 setTrailingContentViewProvider:v8];
  v10 = -[SBControlSystemAction properties]((uint64_t)v4);
  v11 = -[SBHomeScreenConfigurationServer queue]((uint64_t)v10);
  v14.receiver = self;
  v14.super_class = (Class)SBSystemActionSimpleControlPreviewElement;
  v12 = [(SBSystemActionSimplePreviewElement *)&v14 initWithSystemAction:v4 contentProvider:v9 keyColor:v11];

  if (v12)
  {
    objc_storeStrong((id *)&v12->_leadingIconView, v5);
    objc_storeStrong((id *)&v12->_trailingTextContentProvider, v8);
    -[SBSystemActionSimpleControlPreviewElement _updateContentWithProperties:previousProperties:]((uint64_t)v12, v10, 0);
    -[SBControlSystemAction addObserver:]((uint64_t)v4, v12);
  }

  return v12;
}

- (void)_updateContentWithProperties:(void *)a3 previousProperties:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = a3;
    char v7 = -[SBCameraHardwareButton foregroundCameraShutterButtonPIDs]((uint64_t)v5);
    v8 = (uint64_t *)MEMORY[0x1E4F43520];
    double v9 = 0.5;
    if ((v7 & 1) == 0) {
      double v9 = 1.0;
    }
    if ((v7 & 2) != 0) {
      v8 = (uint64_t *)MEMORY[0x1E4F43528];
    }
    uint64_t v25 = *v8;
    if ((v7 & 2) != 0) {
      double v10 = 0.25;
    }
    else {
      double v10 = v9;
    }
    id v11 = *(id *)(a1 + 184);
    v12 = (void *)MEMORY[0x1E4F42FF0];
    if (a3) {
      double v13 = 0.2;
    }
    else {
      double v13 = 0.0;
    }
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __93__SBSystemActionSimpleControlPreviewElement__updateContentWithProperties_previousProperties___block_invoke;
    v26[3] = &unk_1E6AF4A70;
    id v14 = v11;
    id v27 = v14;
    double v28 = v10;
    [v12 animateWithDuration:v26 animations:v13];
    v15 = -[SBHomeScreenConfigurationServer authenticator]((uint64_t)v5);
    v16 = [v15 colorWithAlphaComponent:v10];

    v17 = -[SBHomeScreenConfigurationServer listener]((uint64_t)v5);
    id v18 = *(id *)(a1 + 192);
    v19 = -[SBHomeScreenConfigurationServer listener]((uint64_t)v6);

    v20 = -[SBHomeScreenConfigurationServer listener]((uint64_t)v5);
    char v21 = BSEqualStrings();

    if ((v21 & 1) == 0)
    {
      if (a3)
      {
        [v18 swapInText:v17 textColor:v16];
LABEL_17:
        v22 = -[SBCameraHardwareButton foregroundPendingRemovalCameraShutterButtonPIDs]((uint64_t)v5);
        [v14 setAccessibilityIdentifier:v22];

        [v14 setAccessibilityTraits:v25];
        v23 = [v18 providedView];
        [v23 setAccessibilityTraits:v25];

        v24 = -[SBHomeScreenConfigurationServer queue]((uint64_t)v5);
        -[SBSystemActionSimplePreviewElement setKeyColor:](a1, v24);

        goto LABEL_18;
      }
      [v18 setText:v17];
    }
    [v18 setContentColor:v16];
    goto LABEL_17;
  }
LABEL_18:
}

- (void)dealloc
{
  v3 = -[SBSystemActionSimplePreviewElement systemAction]((uint64_t)self);
  -[SBControlSystemAction removeObserver:]((uint64_t)v3, (uint64_t)self);

  v4.receiver = self;
  v4.super_class = (Class)SBSystemActionSimpleControlPreviewElement;
  [(SBSystemActionSimpleControlPreviewElement *)&v4 dealloc];
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)SBSystemActionSimpleControlPreviewElement;
  if ([(SBSystemApertureProvidedContentElement *)&v12 layoutMode] != a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)SBSystemActionSimpleControlPreviewElement;
    [(SBSystemApertureProvidedContentElement *)&v11 setLayoutMode:a3 reason:a4];
    contentVisibilityAssertion = self->_contentVisibilityAssertion;
    if (a3 < 1)
    {
      if (!contentVisibilityAssertion) {
        return;
      }
      [(BSInvalidatable *)contentVisibilityAssertion invalidate];
      v8 = self->_contentVisibilityAssertion;
      self->_contentVisibilityAssertion = 0;
    }
    else
    {
      if (contentVisibilityAssertion) {
        return;
      }
      v8 = -[SBSystemActionSimplePreviewElement systemAction]((uint64_t)self);
      -[SBControlSystemAction acquireContentVisibilityAssertionForReason:]((uint64_t)v8, @"Preview element");
      double v9 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      double v10 = self->_contentVisibilityAssertion;
      self->_contentVisibilityAssertion = v9;
    }
  }
}

- (BOOL)isProvidedViewConcentric:(id)a3 inLayoutMode:(int64_t)a4
{
  trailingTextContentProvider = self->_trailingTextContentProvider;
  id v5 = a3;
  id v6 = [(SBUISystemApertureTextContentProvider *)trailingTextContentProvider providedView];

  return v6 != v5;
}

- (void)controlSystemAction:(id)a3 propertiesDidChange:(id)a4
{
  id v6 = a4;
  -[SBControlSystemAction properties]((uint64_t)a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSystemActionSimpleControlPreviewElement _updateContentWithProperties:previousProperties:]((uint64_t)self, v7, v6);
}

uint64_t __93__SBSystemActionSimpleControlPreviewElement__updateContentWithProperties_previousProperties___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentVisibilityAssertion, 0);
  objc_storeStrong((id *)&self->_trailingTextContentProvider, 0);
  objc_storeStrong((id *)&self->_leadingIconView, 0);
}

@end