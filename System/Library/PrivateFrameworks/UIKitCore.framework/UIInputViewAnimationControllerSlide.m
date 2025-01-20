@interface UIInputViewAnimationControllerSlide
- (UIInputViewAnimationControllerSlide)initWithSlide:(int)a3;
- (id)placementForSlideStart:(BOOL)a3;
- (id)prepareAnimationWithHost:(id)a3 startPlacement:(id)a4 endPlacement:(id)a5;
- (void)completeAnimationWithHost:(id)a3 context:(id)a4;
- (void)performAnimationWithHost:(id)a3 context:(id)a4;
@end

@implementation UIInputViewAnimationControllerSlide

- (UIInputViewAnimationControllerSlide)initWithSlide:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIInputViewAnimationControllerSlide;
  result = [(UIInputViewAnimationControllerSlide *)&v5 init];
  if (result) {
    result->_slide = a3;
  }
  return result;
}

- (id)placementForSlideStart:(BOOL)a3
{
  int slide = self->_slide;
  if (slide == 5 || slide == 4) {
    v4 = objc_opt_class();
  }
  else {
    v4 = 0;
  }
  return (id)[v4 placement];
}

- (id)prepareAnimationWithHost:(id)a3 startPlacement:(id)a4 endPlacement:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(UIInputViewAnimationControllerSlideContext);
  [v10 updateToPlacement:v9 withNormalAnimationsAndNotifications:0];

  v12 = [v10 transitioningView];
  v13 = [v12 snapshotViewAfterScreenUpdates:0];
  [(UIInputViewAnimationControllerSlideContext *)v11 setSnapshot:v13];

  [v10 transitioningFrame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v22 = [(UIInputViewAnimationControllerSlide *)self placementForSlideStart:0];
  [v10 updateToPlacement:v22 withNormalAnimationsAndNotifications:0];

  [v10 transitioningFrame];
  -[UIInputViewAnimationControllerSlideContext setSnapshotEndFrame:](v11, "setSnapshotEndFrame:");
  v23 = [(UIInputViewAnimationControllerSlide *)self placementForSlideStart:1];
  [v10 updateToPlacement:v23 withNormalAnimationsAndNotifications:0];

  v24 = [(UIInputViewAnimationControllerSlideContext *)v11 snapshot];
  objc_msgSend(v24, "setFrame:", v15, v17, v19, v21);

  [(UIInputViewAnimationControllerSlideContext *)v11 setEndPlacement:v8];
  return v11;
}

- (void)performAnimationWithHost:(id)a3 context:(id)a4
{
  id v16 = a4;
  id v5 = a3;
  [v16 snapshotEndFrame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [v16 snapshot];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  double v15 = [v16 endPlacement];
  [v5 updateToPlacement:v15 withNormalAnimationsAndNotifications:1];
}

- (void)completeAnimationWithHost:(id)a3 context:(id)a4
{
  objc_msgSend(a4, "snapshot", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 removeFromSuperview];
}

@end