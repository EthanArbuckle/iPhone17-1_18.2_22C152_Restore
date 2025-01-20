@interface SBBannerCustomTransitioningDelegate
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForDismissedController:(id)a3 userInfo:(id)a4;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5 userInfo:(id)a6;
- (id)animatorForDismissalTransitionWithStyle:(int64_t)a3;
- (id)animatorForPresentationTransitionWithStyle:(int64_t)a3;
- (int64_t)style;
- (void)setStyle:(int64_t)a3;
@end

@implementation SBBannerCustomTransitioningDelegate

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return [(SBBannerCustomTransitioningDelegate *)self animationControllerForPresentedController:a3 presentingController:a4 sourceController:a5 userInfo:0];
}

- (id)animationControllerForDismissedController:(id)a3
{
  return [(SBBannerCustomTransitioningDelegate *)self animationControllerForDismissedController:a3 userInfo:0];
}

- (id)animationControllerForDismissedController:(id)a3 userInfo:(id)a4
{
  v5 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4FA7F98]];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = v8;

  if (v9) {
    -[SBBannerCustomTransitioningDelegate setStyle:](self, "setStyle:", [v9 integerValue]);
  }
  v10 = [(SBBannerCustomTransitioningDelegate *)self animatorForDismissalTransitionWithStyle:[(SBBannerCustomTransitioningDelegate *)self style]];

  return v10;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5 userInfo:(id)a6
{
  id v7 = objc_msgSend(a6, "objectForKeyedSubscript:", *MEMORY[0x1E4FA7F98], a4, a5);
  uint64_t v8 = objc_opt_class();
  id v9 = v7;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  id v11 = v10;

  if (v11) {
    -[SBBannerCustomTransitioningDelegate setStyle:](self, "setStyle:", [v11 integerValue]);
  }
  v12 = [(SBBannerCustomTransitioningDelegate *)self animatorForPresentationTransitionWithStyle:[(SBBannerCustomTransitioningDelegate *)self style]];

  return v12;
}

- (id)animatorForPresentationTransitionWithStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(objc_alloc(**((Class **)&unk_1E6B083D8 + a3)), "initForPresenting:", 1, v3);
  }
  return v5;
}

- (id)animatorForDismissalTransitionWithStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(objc_alloc(**((Class **)&unk_1E6B083D8 + a3)), "initForPresenting:", 0, v3);
  }
  return v5;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

@end