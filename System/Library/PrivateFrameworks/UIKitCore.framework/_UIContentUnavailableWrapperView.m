@interface _UIContentUnavailableWrapperView
- (BOOL)_canApplyConfigurationToExistingContentView:(id)a3;
- (UIContentConfiguration)configuration;
- (UIEdgeInsets)_concreteDefaultLayoutMargins;
- (UIView)contentView;
- (UIViewController)viewController;
- (_UIContentUnavailableWrapperView)initWithViewController:(id)a3;
- (id)_contentScrollViewForView:(id)a3;
- (void)_replaceContentViewWithViewForConfiguration:(id)a3;
- (void)_updateBackgroundView;
- (void)_updateBackgroundViewHandlersForPreviousContentView:(id)a3 newContentView:(id)a4;
- (void)reconfigureContentScrollView;
- (void)setConfiguration:(id)a3;
@end

@implementation _UIContentUnavailableWrapperView

- (UIEdgeInsets)_concreteDefaultLayoutMargins
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIContentConfiguration)configuration
{
  return (UIContentConfiguration *)[(_UIContentViewInternal *)self->_viewForConfiguration configuration];
}

- (void)setConfiguration:(id)a3
{
  if (-[_UIContentUnavailableWrapperView _canApplyConfigurationToExistingContentView:](self, "_canApplyConfigurationToExistingContentView:"))
  {
    [(_UIContentViewInternal *)self->_viewForConfiguration setConfiguration:a3];
    [(_UIContentUnavailableWrapperView *)self reconfigureContentScrollView];
  }
  else if (a3)
  {
    id v5 = [a3 makeContentView];
    [(_UIContentUnavailableWrapperView *)self _replaceContentViewWithViewForConfiguration:v5];
  }
  else
  {
    [(_UIContentUnavailableWrapperView *)self _replaceContentViewWithViewForConfiguration:0];
  }
}

- (BOOL)_canApplyConfigurationToExistingContentView:(id)a3
{
  uint64_t v5 = [(_UIContentViewInternal *)self->_viewForConfiguration configuration];
  v6 = (void *)v5;
  BOOL v7 = 0;
  if (!a3 || !v5) {
    goto LABEL_21;
  }
  viewForConfiguration = self->_viewForConfiguration;
  id v9 = a3;
  v10 = viewForConfiguration;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v13 = [(_UIContentViewInternal *)v10 configuration];

    id v14 = v13;
    if (v14)
    {
      if (objc_opt_respondsToSelector())
      {
        [v14 _wrappedConfigurationIdentifier];
      }
      else
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
      v15 = };
    }
    else
    {
      v15 = 0;
    }

    id v17 = v9;
    if (objc_opt_respondsToSelector())
    {
      [v17 _wrappedConfigurationIdentifier];
    }
    else
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
    v19 = };

    char v20 = [v15 isEqualToString:v19];
    if (v20) {
      goto LABEL_5;
    }
LABEL_20:
    BOOL v7 = 0;
    goto LABEL_21;
  }
  int v11 = [(_UIContentViewInternal *)v10 supportsConfiguration:v9];

  if (!v11) {
    goto LABEL_20;
  }
LABEL_5:
  if (+[UIView _isInAnimationBlockWithAnimationsEnabled]&& (objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v9;
    BOOL v7 = v6[7] == v12[7];
  }
  else
  {
    BOOL v7 = 1;
  }
LABEL_21:

  return v7;
}

- (_UIContentUnavailableWrapperView)initWithViewController:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UIContentUnavailableWrapperView;
  double v4 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_viewController, a3);
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    parentScrollViews = v5->_parentScrollViews;
    v5->_parentScrollViews = (NSMutableDictionary *)v6;
  }
  return v5;
}

- (void)_replaceContentViewWithViewForConfiguration:(id)a3
{
  if (a3)
  {
    if (objc_opt_respondsToSelector())
    {
      id v6 = [a3 _wrappedContentView];
      if (!v6)
      {
        BOOL v7 = [MEMORY[0x1E4F28B00] currentHandler];
        v8 = [a3 configuration];
        [v7 handleFailureInMethod:a2, self, @"_UIContentUnavailableWrapperView.m", 67, @"Configuration returned a nil content view: %@", v8 object file lineNumber description];

        id v6 = 0;
      }
    }
    else
    {
      id v6 = a3;
    }
    if (([v6 translatesAutoresizingMaskIntoConstraints] & 1) == 0)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, self, @"_UIContentUnavailableWrapperView.m", 68, @"The content view returned from the content unavailable configuration must have translatesAutoresizingMaskIntoConstraints enabled: %@", v6 object file lineNumber description];
    }
    [(UIView *)self bounds];
    objc_msgSend(v6, "setFrame:");
    [v6 setAutoresizingMask:18];
    [(UIView *)self addSubview:v6];
  }
  else
  {
    id v6 = 0;
  }
  objc_super v9 = self->_viewForConfiguration;
  v10 = self->_contentView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_viewForConfiguration, a3);
  objc_storeStrong((id *)&self->_contentView, v6);
  BOOL v12 = +[UIView _isInAnimationBlockWithAnimationsEnabled];
  BOOL v13 = v12;
  if (v6 && v12)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __80___UIContentUnavailableWrapperView__replaceContentViewWithViewForConfiguration___block_invoke;
    v21[3] = &unk_1E52D9F98;
    id v14 = v6;
    id v22 = v14;
    v23 = self;
    +[UIView performWithoutAnimation:v21];
    [v14 setAlpha:1.0];
  }
  if (v13)
  {
    [(UIView *)v10 setAlpha:0.0];
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __80___UIContentUnavailableWrapperView__replaceContentViewWithViewForConfiguration___block_invoke_2;
    v16[3] = &unk_1E52DF3C8;
    id v17 = v10;
    objc_copyWeak(&v19, &location);
    v18 = v9;
    +[UIView _addCompletionWithPosition:v16];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    [(UIView *)v10 removeFromSuperview];
  }
  [(_UIContentUnavailableWrapperView *)self _updateBackgroundViewHandlersForPreviousContentView:v10 newContentView:v6];
  [(_UIContentUnavailableWrapperView *)self reconfigureContentScrollView];
}

- (void)reconfigureContentScrollView
{
  if (!self->_isConfiguringContentScrollView)
  {
    self->_isConfiguringContentScrollView = 1;
    double v4 = [(_UIContentUnavailableWrapperView *)self contentView];
    uint64_t v5 = [(_UIContentUnavailableWrapperView *)self viewController];
    id v6 = self->_contentScrollView;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      id v8 = v4;
      objc_super v9 = [v8 _scrollView];
      if (!v9)
      {
        id v19 = [MEMORY[0x1E4F28B00] currentHandler];
        [v19 handleFailureInMethod:a2 object:self file:@"_UIContentUnavailableWrapperView.m" lineNumber:225 description:@"Expected UIContentUnavailableView to return a scroll view for its _UIContentUnavailableWrapperView"];
      }
      char v18 = [v8 shouldReparentScrollViewPanGestureRecognizer];
    }
    else
    {
      objc_super v9 = [(_UIContentUnavailableWrapperView *)self _contentScrollViewForView:v4];
      char v18 = 0;
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v10 = __64___UIContentUnavailableWrapperView_reconfigureContentScrollView__block_invoke;
    v21 = __64___UIContentUnavailableWrapperView_reconfigureContentScrollView__block_invoke;
    id v22 = &unk_1E52DF418;
    v23 = self;
    id v11 = v5;
    id v24 = v11;
    BOOL v12 = v6;
    BOOL v13 = v12;
    v25 = v12;
    char v26 = isKindOfClass & 1;
    if (v12 != v9)
    {
      __64___UIContentUnavailableWrapperView_reconfigureContentScrollView__block_invoke_2(v12, v12);
      v10 = v21;
    }
    int v14 = v10((uint64_t)v20, v9, 1);
    if ((v14 & v21((uint64_t)v20, v9, 4)) != 0) {
      v15 = 0;
    }
    else {
      v15 = v9;
    }
    [v11 _setInternalContentScrollView:v15];
    objc_storeStrong((id *)&self->_contentScrollView, v9);
    if (v9)
    {
      if (v18)
      {
        v16 = [v11 view];
      }
      else
      {
        v16 = v9;
      }
      id v17 = v16;
      __64___UIContentUnavailableWrapperView_reconfigureContentScrollView__block_invoke_2(v9, v16);
    }
    self->_isConfiguringContentScrollView = 0;
  }
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  return (UIViewController *)WeakRetained;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)_updateBackgroundViewHandlersForPreviousContentView:(id)a3 newContentView:(id)a4
{
  if (objc_opt_respondsToSelector()) {
    [a3 _setContainerBackgroundViewDidChangeHandler:0];
  }
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    objc_super v9 = __103___UIContentUnavailableWrapperView__updateBackgroundViewHandlersForPreviousContentView_newContentView___block_invoke;
    v10 = &unk_1E52DC308;
    objc_copyWeak(&v11, &location);
    [a4 _setContainerBackgroundViewDidChangeHandler:&v7];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  [(_UIContentUnavailableWrapperView *)self _updateBackgroundView];
}

- (void)_updateBackgroundView
{
  p_backgroundView = &self->_backgroundView;
  double v4 = self->_backgroundView;
  uint64_t v5 = self->_contentView;
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v6 = [(UIView *)v5 _containerBackgroundView];
  }
  else
  {
    id v6 = 0;
  }

  objc_storeStrong((id *)p_backgroundView, v6);
  if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
  {
    if (v6)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __57___UIContentUnavailableWrapperView__updateBackgroundView__block_invoke;
      v17[3] = &unk_1E52D9F98;
      id v18 = v6;
      id v19 = self;
      +[UIView performWithoutAnimation:v17];
    }
    objc_initWeak(&location, self);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __57___UIContentUnavailableWrapperView__updateBackgroundView__block_invoke_2;
    BOOL v12 = &unk_1E52DF3F0;
    objc_copyWeak(&v15, &location);
    id v7 = v6;
    id v13 = v7;
    uint64_t v8 = v4;
    int v14 = v8;
    +[UIView _addCompletionWithPosition:&v9];
    -[UIView setAlpha:](v8, "setAlpha:", 0.0, v9, v10, v11, v12);
    [v7 setAlpha:1.0];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    [(UIView *)v4 removeFromSuperview];
    if (v6)
    {
      [(UIView *)self bounds];
      objc_msgSend(v6, "setFrame:");
      [v6 setAutoresizingMask:18];
      [(UIView *)self insertSubview:v6 atIndex:0];
    }
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_contentScrollView, 0);
  objc_storeStrong((id *)&self->_parentScrollViews, 0);
  objc_storeStrong((id *)&self->_viewForConfiguration, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (id)_contentScrollViewForView:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    [a3 frame];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [(UIView *)self bounds];
    v33.origin.x = v13;
    v33.origin.y = v14;
    v33.size.width = v15;
    v33.size.height = v16;
    v32.origin.x = v6;
    v32.origin.y = v8;
    v32.size.width = v10;
    v32.size.height = v12;
    if (CGRectEqualToRect(v32, v33))
    {
      if ([a3 _canHostViewControllerContentScrollView])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = a3;
          goto LABEL_16;
        }
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v18 = objc_msgSend(a3, "subviews", 0);
        uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v26;
          while (2)
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v26 != v21) {
                objc_enumerationMutation(v18);
              }
              uint64_t v23 = [(_UIContentUnavailableWrapperView *)self _contentScrollViewForView:*(void *)(*((void *)&v25 + 1) + 8 * i)];
              if (v23)
              {
                id v17 = (id)v23;

                goto LABEL_16;
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }
      }
    }
  }
  id v17 = 0;
LABEL_16:
  return v17;
}

@end