@interface BCSheetTransitionCoverController
- (BCSheetTransitioningArtworkSource)observedArtworkSource;
- (UIView)coverView;
- (void)_observeImageChangeForArtworkSource:(id)a3;
- (void)configureCoverViewWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)setObservedArtworkSource:(id)a3;
- (void)setupWithArtworkSource:(id)a3;
- (void)setupWithArtworkSource:(id)a3 cardArtworkSource:(id)a4 isDismiss:(BOOL)a5;
@end

@implementation BCSheetTransitionCoverController

- (void)setupWithArtworkSource:(id)a3 cardArtworkSource:(id)a4 isDismiss:(BOOL)a5
{
  BOOL v5 = a5;
  id v20 = a3;
  id v8 = a4;
  if (v5) {
    v9 = v8;
  }
  else {
    v9 = v20;
  }
  if (v5) {
    v10 = v20;
  }
  else {
    v10 = v8;
  }
  id v11 = v9;
  id v12 = v10;
  v13 = [BCCardStackTransitionCoverView alloc];
  [v11 frame];
  v14 = -[BCCardStackTransitionCoverView initWithFrame:](v13, "initWithFrame:");
  coverView = self->_coverView;
  self->_coverView = v14;

  v16 = [v12 image];
  v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = [v11 image];
  }
  v19 = v18;

  [(BCCardStackTransitionCoverView *)self->_coverView setImage:v19];
  [(BCSheetTransitionCoverController *)self _observeImageChangeForArtworkSource:v12];
}

- (void)setupWithArtworkSource:(id)a3
{
  id v8 = a3;
  v4 = [BCCardStackTransitionCoverView alloc];
  [v8 frame];
  BOOL v5 = -[BCCardStackTransitionCoverView initWithFrame:](v4, "initWithFrame:");
  coverView = self->_coverView;
  self->_coverView = v5;

  v7 = [v8 image];
  [(BCCardStackTransitionCoverView *)self->_coverView setImage:v7];

  [(BCSheetTransitionCoverController *)self _observeImageChangeForArtworkSource:v8];
}

- (UIView)coverView
{
  return (UIView *)self->_coverView;
}

- (void)configureCoverViewWithFrame:(CGRect)a3
{
  -[BCCardStackTransitionCoverView setFrame:](self->_coverView, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  coverView = self->_coverView;

  [(BCCardStackTransitionCoverView *)coverView updateContentFrame];
}

- (void)dealloc
{
  [(BCSheetTransitioningArtworkSource *)self->_observedArtworkSource setImageChangeObserverBlock:0];
  v3.receiver = self;
  v3.super_class = (Class)BCSheetTransitionCoverController;
  [(BCSheetTransitionCoverController *)&v3 dealloc];
}

- (void)_observeImageChangeForArtworkSource:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    [(BCSheetTransitionCoverController *)self setObservedArtworkSource:v4];
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_65E1C;
    v5[3] = &unk_2C5FF8;
    objc_copyWeak(&v6, &location);
    [v4 setImageChangeObserverBlock:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (BCSheetTransitioningArtworkSource)observedArtworkSource
{
  return self->_observedArtworkSource;
}

- (void)setObservedArtworkSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedArtworkSource, 0);

  objc_storeStrong((id *)&self->_coverView, 0);
}

@end