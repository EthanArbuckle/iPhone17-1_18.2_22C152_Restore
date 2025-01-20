@interface _BCCardStackTransitionCoverController
- (BCCardStackTransitionCoverView)coverView;
- (BCCardStackTransitioningCoverSource)observedCoverSource;
- (BCViewPropertyAnimatorCounter)counter;
- (void)_observeImageChangeForCoverSource:(id)a3;
- (void)dealloc;
- (void)setCounter:(id)a3;
- (void)setCoverView:(id)a3;
- (void)setObservedCoverSource:(id)a3;
- (void)setupWithCoverSource:(id)a3 cardCoverSource:(id)a4 coverView:(id)a5 isDismiss:(BOOL)a6;
- (void)setupWithCoverSource:(id)a3 coverView:(id)a4;
@end

@implementation _BCCardStackTransitionCoverController

- (void)setupWithCoverSource:(id)a3 cardCoverSource:(id)a4 coverView:(id)a5 isDismiss:(BOOL)a6
{
  BOOL v6 = a6;
  id v20 = a3;
  id v10 = a4;
  objc_storeStrong((id *)&self->_coverView, a5);
  id v11 = a5;
  if (v6) {
    v12 = v10;
  }
  else {
    v12 = v20;
  }
  if (v6) {
    v13 = v20;
  }
  else {
    v13 = v10;
  }
  id v14 = v12;
  id v15 = v13;
  v16 = [v15 cardStackTransitioningCoverSourceImage];
  v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = [v14 cardStackTransitioningCoverSourceImage];
  }
  v19 = v18;

  [v11 setImage:v19];
  [(_BCCardStackTransitionCoverController *)self _observeImageChangeForCoverSource:v15];
}

- (void)setupWithCoverSource:(id)a3 coverView:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  objc_storeStrong((id *)&self->_coverView, a4);
  v7 = [v8 cardStackTransitioningCoverSourceImage];
  if (!v7) {
    [(_BCCardStackTransitionCoverController *)self _observeImageChangeForCoverSource:v8];
  }
  [v6 setImage:v7];
}

- (void)dealloc
{
  [(BCCardStackTransitioningCoverSource *)self->_observedCoverSource setCardStackTransitioningCoverSourceImageChangeObserverBlock:0];
  v3.receiver = self;
  v3.super_class = (Class)_BCCardStackTransitionCoverController;
  [(_BCCardStackTransitionCoverController *)&v3 dealloc];
}

- (void)_observeImageChangeForCoverSource:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    [(_BCCardStackTransitionCoverController *)self setObservedCoverSource:v4];
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_B27D0;
    v5[3] = &unk_2C5FF8;
    objc_copyWeak(&v6, &location);
    [v4 setCardStackTransitioningCoverSourceImageChangeObserverBlock:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (BCCardStackTransitionCoverView)coverView
{
  return self->_coverView;
}

- (void)setCoverView:(id)a3
{
}

- (BCViewPropertyAnimatorCounter)counter
{
  return self->_counter;
}

- (void)setCounter:(id)a3
{
}

- (BCCardStackTransitioningCoverSource)observedCoverSource
{
  return self->_observedCoverSource;
}

- (void)setObservedCoverSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedCoverSource, 0);
  objc_storeStrong((id *)&self->_counter, 0);

  objc_storeStrong((id *)&self->_coverView, 0);
}

@end