@interface PRUISPosterAppearanceObservingAttachmentProvider
+ (int64_t)obscurableContentAttachmentLevel;
+ (int64_t)overlayContentAttachmentLevel;
- (BSUIVibrancyView)obscurableContentVibrancyView;
- (CGRect)primaryContentTightFrame;
- (PRUISPosterAppearanceObservingAttachmentProvider)initWithPRSConfiguration:(id)a3;
- (PRUISPosterAppearanceObservingAttachmentProvider)initWithPoster:(id)a3;
- (PRUISPosterAttachment)obscurableContentAttachment;
- (PRUISPosterAttachment)overlayContentAttachment;
- (UIView)obscurableContentView;
- (UIView)obscurableOverlayView;
- (UIView)overlayContentView;
- (UIView)vibrantObscurableContentView;
- (id)_currentAppearance;
- (id)_updateContentStyleWithTitleStyleConfiguration:(id)a3 initialAppearance:(id)a4;
- (void)_currentAppearance;
- (void)_loadTitleStyleConfigurationIfNeeded;
- (void)applyPosterAppearanceToObserver:(id)a3;
- (void)setObscurableContentVibrancyView:(id)a3;
- (void)setPrimaryContentTightFrame:(CGRect)a3;
- (void)updateLayoutForChangedObscuredSubviewBounds;
@end

@implementation PRUISPosterAppearanceObservingAttachmentProvider

+ (int64_t)obscurableContentAttachmentLevel
{
  return *MEMORY[0x263F5F550] - 1;
}

+ (int64_t)overlayContentAttachmentLevel
{
  return *MEMORY[0x263F5F548] + 1;
}

- (PRUISPosterAppearanceObservingAttachmentProvider)initWithPRSConfiguration:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F5F4D8];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [v5 _path];

  v8 = (void *)[v6 _initWithPath:v7];
  v9 = [(PRUISPosterAppearanceObservingAttachmentProvider *)self initWithPoster:v8];

  return v9;
}

- (PRUISPosterAppearanceObservingAttachmentProvider)initWithPoster:(id)a3
{
  id v5 = a3;
  id v6 = [v5 _path];
  if ([v6 isServerPosterPath])
  {
    v11.receiver = self;
    v11.super_class = (Class)PRUISPosterAppearanceObservingAttachmentProvider;
    v7 = [(PRUISPosterAppearanceObservingAttachmentProvider *)&v11 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_path, v6);
    }

    return v8;
  }
  else
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[path isServerPosterPath]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      [(PRUISPosterAppearanceObservingAttachmentProvider *)a2 initWithPoster:(uint64_t)v10];
    }
    [v10 UTF8String];
    result = (PRUISPosterAppearanceObservingAttachmentProvider *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (UIView)obscurableContentView
{
  obscurableContentContainerView = self->_obscurableContentContainerView;
  if (!obscurableContentContainerView)
  {
    id v4 = objc_alloc(MEMORY[0x263F1CB60]);
    id v5 = [MEMORY[0x263F1C920] mainScreen];
    [v5 bounds];
    id v6 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    v7 = self->_obscurableContentContainerView;
    self->_obscurableContentContainerView = v6;

    obscurableContentContainerView = self->_obscurableContentContainerView;
  }

  return obscurableContentContainerView;
}

- (PRUISPosterAttachment)obscurableContentAttachment
{
  obscurableContentContainerView = self->_obscurableContentContainerView;
  if (obscurableContentContainerView)
  {
    v3 = +[PRUISPosterAttachment attachmentWithView:level:](PRUISPosterAttachment, "attachmentWithView:level:", obscurableContentContainerView, [(id)objc_opt_class() obscurableContentAttachmentLevel]);
  }
  else
  {
    v3 = 0;
  }

  return (PRUISPosterAttachment *)v3;
}

- (UIView)vibrantObscurableContentView
{
  if (!self->_obscurableContentVibrancyView)
  {
    id v3 = objc_alloc(MEMORY[0x263F29D68]);
    id v4 = [MEMORY[0x263F1C920] mainScreen];
    [v4 bounds];
    id v5 = (BSUIVibrancyEffectView *)objc_msgSend(v3, "initWithFrame:");
    obscurableContentVibrancyView = self->_obscurableContentVibrancyView;
    self->_obscurableContentVibrancyView = v5;

    v7 = [(PRUISPosterAppearanceObservingAttachmentProvider *)self obscurableContentView];
    [v7 addSubview:self->_obscurableContentVibrancyView];

    [(BSUIVibrancyEffectView *)self->_obscurableContentVibrancyView setAutoresizingMask:18];
  }
  [(PRUISPosterAppearanceObservingAttachmentProvider *)self _loadTitleStyleConfigurationIfNeeded];
  titleStyleConfiguration = self->_titleStyleConfiguration;
  v9 = [(PRUISPosterAppearanceObservingAttachmentProvider *)self _currentAppearance];
  id v10 = [(PRUISPosterAppearanceObservingAttachmentProvider *)self _updateContentStyleWithTitleStyleConfiguration:titleStyleConfiguration initialAppearance:v9];

  objc_super v11 = self->_obscurableContentVibrancyView;

  return (UIView *)[(BSUIVibrancyEffectView *)v11 contentView];
}

- (UIView)overlayContentView
{
  overlayContentView = self->_overlayContentView;
  if (!overlayContentView)
  {
    id v4 = objc_alloc(MEMORY[0x263F1CB60]);
    id v5 = [MEMORY[0x263F1C920] mainScreen];
    [v5 bounds];
    id v6 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    v7 = self->_overlayContentView;
    self->_overlayContentView = v6;

    overlayContentView = self->_overlayContentView;
  }

  return overlayContentView;
}

- (UIView)obscurableOverlayView
{
  v23[4] = *MEMORY[0x263EF8340];
  obscurableOverlayView = self->_obscurableOverlayView;
  if (!obscurableOverlayView)
  {
    id v4 = objc_alloc(MEMORY[0x263F1CB60]);
    id v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    id v6 = self->_obscurableOverlayView;
    self->_obscurableOverlayView = v5;

    v7 = [(PRUISPosterAppearanceObservingAttachmentProvider *)self obscurableContentView];
    [v7 addSubview:self->_obscurableOverlayView];

    v18 = (void *)MEMORY[0x263F08938];
    v22 = [(UIView *)self->_obscurableOverlayView widthAnchor];
    v21 = [(BSUIVibrancyEffectView *)self->_obscurableContentVibrancyView widthAnchor];
    v20 = [v22 constraintEqualToAnchor:v21];
    v23[0] = v20;
    v19 = [(UIView *)self->_obscurableOverlayView heightAnchor];
    v8 = [(BSUIVibrancyEffectView *)self->_obscurableContentVibrancyView heightAnchor];
    v9 = [v19 constraintEqualToAnchor:v8];
    v23[1] = v9;
    id v10 = [(UIView *)self->_obscurableOverlayView centerXAnchor];
    objc_super v11 = [(BSUIVibrancyEffectView *)self->_obscurableContentVibrancyView centerXAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v23[2] = v12;
    v13 = [(UIView *)self->_obscurableOverlayView centerYAnchor];
    v14 = [(BSUIVibrancyEffectView *)self->_obscurableContentVibrancyView centerYAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v23[3] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];
    [v18 activateConstraints:v16];

    obscurableOverlayView = self->_obscurableOverlayView;
  }

  return obscurableOverlayView;
}

- (PRUISPosterAttachment)overlayContentAttachment
{
  overlayContentView = self->_overlayContentView;
  if (overlayContentView)
  {
    id v3 = +[PRUISPosterAttachment attachmentWithView:level:](PRUISPosterAttachment, "attachmentWithView:level:", overlayContentView, [(id)objc_opt_class() overlayContentAttachmentLevel]);
  }
  else
  {
    id v3 = 0;
  }

  return (PRUISPosterAttachment *)v3;
}

- (void)updateLayoutForChangedObscuredSubviewBounds
{
  titleStyleConfiguration = self->_titleStyleConfiguration;
  id v5 = [(PRUISPosterAppearanceObservingAttachmentProvider *)self _currentAppearance];
  id v4 = [(PRUISPosterAppearanceObservingAttachmentProvider *)self _updateContentStyleWithTitleStyleConfiguration:titleStyleConfiguration initialAppearance:v5];
}

- (id)_currentAppearance
{
  currentAppearance = self->_currentAppearance;
  if (currentAppearance)
  {
    id v3 = currentAppearance;
    goto LABEL_18;
  }
  [(PRUISPosterAppearanceObservingAttachmentProvider *)self _loadTitleStyleConfigurationIfNeeded];
  id v5 = [(PFServerPosterPath *)self->_path serverIdentity];
  id v6 = [v5 role];

  if (!self->_titleStyleConfiguration) {
    goto LABEL_14;
  }
  v7 = [(PFServerPosterPath *)self->_path serverIdentity];
  v8 = [v7 provider];

  if (!v8)
  {
    v12 = PRUISLogRendering();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      [(PRUISPosterAppearanceObservingAttachmentProvider *)(uint64_t)&self->_path _currentAppearance];
    }

    goto LABEL_11;
  }
  v9 = (void *)[objc_alloc(MEMORY[0x263F01858]) initWithBundleIdentifier:v8 error:0];
  id v10 = [v9 URL];

  if (!v10)
  {
LABEL_11:
    v19 = PRUISLogRendering();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      [(PRUISPosterAppearanceObservingAttachmentProvider *)(uint64_t)&self->_path _currentAppearance];
    }

    goto LABEL_14;
  }
  objc_super v11 = [(PRPosterTitleStyleConfiguration *)self->_titleStyleConfiguration effectiveTimeFontWithExtensionBundleURL:v10 forRole:v6];

  if (!v11)
  {
LABEL_14:
    v26 = PRUISLogAttachments();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[PRUISPosterAppearanceObservingAttachmentProvider _currentAppearance](v26);
    }

    objc_super v11 = [MEMORY[0x263F5F520] defaultTitleFontForRole:v6];
  }
  v27 = [v11 fontWithSize:84.0];

  id v28 = objc_alloc(MEMORY[0x263F5F4C0]);
  id v29 = objc_alloc(MEMORY[0x263F5F4C8]);
  v30 = [MEMORY[0x263F1C550] whiteColor];
  v31 = (void *)[v29 initWithColor:v30];
  v32 = (PRPosterAppearance *)objc_msgSend(v28, "initWithFont:labelColor:preferredTitleAlignment:preferredTitleLayout:", v27, v31, -[PRPosterTitleStyleConfiguration preferredTitleAlignment](self->_titleStyleConfiguration, "preferredTitleAlignment"), -[PRPosterTitleStyleConfiguration preferredTitleLayout](self->_titleStyleConfiguration, "preferredTitleLayout"));

  v33 = self->_currentAppearance;
  self->_currentAppearance = v32;
  v34 = v32;

  id v3 = self->_currentAppearance;
LABEL_18:

  return v3;
}

- (void)applyPosterAppearanceToObserver:(id)a3
{
  id v4 = a3;
  id v7 = [(PRUISPosterAppearanceObservingAttachmentProvider *)self _currentAppearance];
  id v5 = [(PRUISPosterAppearanceObservingAttachmentProvider *)self _updateContentStyleWithTitleStyleConfiguration:self->_titleStyleConfiguration initialAppearance:v7];
  [v4 posterAppearanceDidChange:v5];

  currentAppearance = self->_currentAppearance;
  self->_currentAppearance = v5;
}

- (void)_loadTitleStyleConfigurationIfNeeded
{
}

- (id)_updateContentStyleWithTitleStyleConfiguration:(id)a3 initialAppearance:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  obscurableContentVibrancyView = self->_obscurableContentVibrancyView;
  if (obscurableContentVibrancyView)
  {
    v9 = [(BSUIVibrancyEffectView *)obscurableContentVibrancyView contentView];
    [v9 setNeedsLayout];

    id v10 = [(BSUIVibrancyEffectView *)self->_obscurableContentVibrancyView contentView];
    [v10 layoutIfNeeded];

    [(PRPosterContentStyleVibrantContentRenderer *)self->_vibrantContentRenderer clearAllStyles];
    objc_super v11 = [(BSUIVibrancyEffectView *)self->_obscurableContentVibrancyView contentView];
    v12 = [v11 subviews];

    CGFloat v13 = *MEMORY[0x263F001A8];
    CGFloat v14 = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat v15 = *(double *)(MEMORY[0x263F001A8] + 16);
    CGFloat v16 = *(double *)(MEMORY[0x263F001A8] + 24);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v17 = v12;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v46;
      double v21 = v16;
      double v22 = v15;
      double v23 = v14;
      double v24 = v13;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v46 != v20) {
            objc_enumerationMutation(v17);
          }
          v26 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          v52.origin.x = v24;
          v52.origin.y = v23;
          v52.size.width = v22;
          v52.size.height = v21;
          v54.origin.x = v13;
          v54.origin.y = v14;
          v54.size.width = v15;
          v54.size.height = v16;
          BOOL v27 = CGRectEqualToRect(v52, v54);
          objc_msgSend(v26, "frame", (void)v45);
          double v32 = v28;
          double v33 = v29;
          double v34 = v30;
          double v35 = v31;
          if (!v27)
          {
            v53.origin.x = v24;
            v53.origin.y = v23;
            v53.size.width = v22;
            v53.size.height = v21;
            *(CGRect *)&double v28 = CGRectUnion(v53, *(CGRect *)&v32);
          }
          double v24 = v28;
          double v23 = v29;
          double v22 = v30;
          double v21 = v31;
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v19);
    }
    else
    {
      double v21 = v16;
      double v22 = v15;
      double v23 = v14;
      double v24 = v13;
    }

    if (CGRectIsEmpty(self->_primaryContentTightFrame))
    {
      self->_primaryContentTightFrame.origin.x = v24;
      self->_primaryContentTightFrame.origin.y = v23;
      self->_primaryContentTightFrame.size.width = v22;
      self->_primaryContentTightFrame.size.height = v21;
    }
    vibrantContentRenderer = self->_vibrantContentRenderer;
    if (vibrantContentRenderer)
    {
      -[PRPosterContentStyleVibrantContentRenderer setContentBoundingRect:](vibrantContentRenderer, "setContentBoundingRect:", v24, v23, v22, v21);
      -[PRPosterContentStyleVibrantContentRenderer setStyleBoundingRect:](self->_vibrantContentRenderer, "setStyleBoundingRect:", self->_primaryContentTightFrame.origin.x, self->_primaryContentTightFrame.origin.y, self->_primaryContentTightFrame.size.width, self->_primaryContentTightFrame.size.height);
    }
    else
    {
      id v38 = objc_alloc(MEMORY[0x263F5F4E0]);
      v39 = self->_obscurableContentVibrancyView;
      v40 = [(BSUIVibrancyEffectView *)v39 contentView];
      v41 = (PRPosterContentStyleVibrantContentRenderer *)objc_msgSend(v38, "initWithVibrancyView:contentView:contentBoundingRect:styleBoundingRect:initialAppearance:", v39, v40, v7, v24, v23, v22, v21, self->_primaryContentTightFrame.origin.x, self->_primaryContentTightFrame.origin.y, self->_primaryContentTightFrame.size.width, self->_primaryContentTightFrame.size.height);
      v42 = self->_vibrantContentRenderer;
      self->_vibrantContentRenderer = v41;
    }
    v43 = objc_msgSend(v6, "effectiveTitleContentStyle", (void)v45);
    [v43 applyStyleWithRenderer:self->_vibrantContentRenderer];

    id v36 = [(PRPosterContentStyleVibrantContentRenderer *)self->_vibrantContentRenderer currentAppearance];
  }
  else
  {
    id v36 = v7;
  }

  return v36;
}

- (void)setPrimaryContentTightFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(self->_primaryContentTightFrame, a3))
  {
    self->_primaryContentTightFrame.origin.CGFloat x = x;
    self->_primaryContentTightFrame.origin.CGFloat y = y;
    self->_primaryContentTightFrame.size.CGFloat width = width;
    self->_primaryContentTightFrame.size.CGFloat height = height;
    titleStyleConfiguration = self->_titleStyleConfiguration;
    if (titleStyleConfiguration)
    {
      vibrantContentRenderer = self->_vibrantContentRenderer;
      if (vibrantContentRenderer)
      {
        id v11 = [(PRPosterContentStyleVibrantContentRenderer *)vibrantContentRenderer currentAppearance];
        id v10 = [(PRUISPosterAppearanceObservingAttachmentProvider *)self _updateContentStyleWithTitleStyleConfiguration:titleStyleConfiguration initialAppearance:v11];
      }
    }
  }
}

- (CGRect)primaryContentTightFrame
{
  double x = self->_primaryContentTightFrame.origin.x;
  double y = self->_primaryContentTightFrame.origin.y;
  double width = self->_primaryContentTightFrame.size.width;
  double height = self->_primaryContentTightFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BSUIVibrancyView)obscurableContentVibrancyView
{
  return self->_obscurableContentVibrancyView;
}

- (void)setObscurableContentVibrancyView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrantContentRenderer, 0);
  objc_storeStrong((id *)&self->_currentAppearance, 0);
  objc_storeStrong((id *)&self->_obscurableOverlayView, 0);
  objc_storeStrong((id *)&self->_overlayContentView, 0);
  objc_storeStrong((id *)&self->_obscurableContentContainerView, 0);
  objc_storeStrong((id *)&self->_obscurableContentVibrancyView, 0);
  objc_storeStrong((id *)&self->_titleStyleConfiguration, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

- (void)initWithPoster:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  CGFloat v15 = @"PRUISPosterAppearanceObservingAttachmentProvider.m";
  __int16 v16 = 1024;
  int v17 = 68;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_25A03F000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (void)_currentAppearance
{
}

@end