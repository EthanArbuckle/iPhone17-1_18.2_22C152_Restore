@interface BCCardStackInteractiveDismissAnimator
- (BCCardStackInteractiveDismissAnimator)init;
- (BOOL)shouldRetainBackgroundAndTitleState;
- (NSDictionary)displayedCardViewControllers;
- (NSMutableDictionary)txForCardIndex;
- (UIView)backgroundView;
- (UIView)leftArrowButton;
- (UIView)rightArrowButton;
- (UIView)titleLabel;
- (double)_minBackgroundViewAlpha;
- (double)distanceToCoverSource;
- (double)maxSlideDistance;
- (double)maxTitleSlideDistance;
- (double)pauseDismissCancellationAndReset;
- (id)_bounceBackSpringWithVelocity:(double)a3;
- (int64_t)finalAnimationType;
- (int64_t)focusedIndex;
- (unint64_t)dismissState;
- (void)animateDismissCancellationWithVelocity:(double)a3 completion:(id)a4;
- (void)setBackgroundView:(id)a3;
- (void)setDismissState:(unint64_t)a3;
- (void)setDisplayedCardViewControllers:(id)a3;
- (void)setDistanceToCoverSource:(double)a3;
- (void)setFinalAnimationType:(int64_t)a3;
- (void)setFocusedIndex:(int64_t)a3;
- (void)setLeftArrowButton:(id)a3;
- (void)setMaxSlideDistance:(double)a3;
- (void)setMaxTitleSlideDistance:(double)a3;
- (void)setRightArrowButton:(id)a3;
- (void)setShouldRetainBackgroundAndTitleState:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTxForCardIndex:(id)a3;
- (void)setupAnimatorsForCancellation:(BOOL)a3 velocity:(double)a4;
- (void)setupForInteractiveDismiss;
- (void)updateDismissFractionCompleteWithCardOffset:(double)a3;
@end

@implementation BCCardStackInteractiveDismissAnimator

- (BCCardStackInteractiveDismissAnimator)init
{
  v7.receiver = self;
  v7.super_class = (Class)BCCardStackInteractiveDismissAnimator;
  v2 = [(BCCardStackInteractiveDismissAnimator *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_distanceToCoverSource = NAN;
    v2->_dismissState = 0;
    v2->_finalAnimationType = 2;
    uint64_t v4 = objc_opt_new();
    txForCardIndex = v3->_txForCardIndex;
    v3->_txForCardIndex = (NSMutableDictionary *)v4;
  }
  return v3;
}

- (id)_bounceBackSpringWithVelocity:(double)a3
{
  id v3 = [objc_alloc((Class)UISpringTimingParameters) initWithMass:1.0 stiffness:200.0 damping:28.0 initialVelocity:a3];

  return v3;
}

- (double)_minBackgroundViewAlpha
{
  double v6 = 0.0;
  v2 = [(BCCardStackInteractiveDismissAnimator *)self backgroundView];
  id v3 = [v2 backgroundColor];
  unsigned int v4 = [v3 getWhite:0 alpha:&v6];

  if (!v4) {
    return 0.15;
  }
  double result = 0.15 / v6;
  if (fabs(v6) < 2.22044605e-16) {
    return 0.15;
  }
  return result;
}

- (void)setupAnimatorsForCancellation:(BOOL)a3 velocity:(double)a4
{
  objc_super v7 = [(BCCardStackInteractiveDismissAnimator *)self txForCardIndex];
  id v8 = objc_alloc((Class)UIViewPropertyAnimator);
  v9 = [(BCCardStackInteractiveDismissAnimator *)self _bounceBackSpringWithVelocity:a4];
  id v10 = [v8 initWithDuration:v9 timingParameters:0.0];

  if (!a3)
  {
    v11 = [(BCCardStackInteractiveDismissAnimator *)self displayedCardViewControllers];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_3E05C;
    v32[3] = &unk_2C52B8;
    id v33 = v7;
    [v11 enumerateKeysAndObjectsUsingBlock:v32];

    v12 = [(BCCardStackInteractiveDismissAnimator *)self titleLabel];
    long long v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v31[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v31[1] = v13;
    v31[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v12 setTransform:v31];

    v14 = [(BCCardStackInteractiveDismissAnimator *)self backgroundView];
    [v14 setAlpha:1.0];

    v15 = [(BCCardStackInteractiveDismissAnimator *)self titleLabel];
    [v15 setAlpha:1.0];

    v16 = [(BCCardStackInteractiveDismissAnimator *)self leftArrowButton];
    [v16 setAlpha:1.0];

    v17 = [(BCCardStackInteractiveDismissAnimator *)self rightArrowButton];
    [v17 setAlpha:1.0];
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_3E158;
  v28[3] = &unk_2C40C0;
  BOOL v30 = a3;
  v28[4] = self;
  id v18 = v7;
  id v29 = v18;
  [v10 addAnimations:v28];
  if ([(BCCardStackInteractiveDismissAnimator *)self shouldRetainBackgroundAndTitleState])
  {
    goto LABEL_6;
  }
  [v10 duration];
  double v20 = v19;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_3E2F0;
  v26[3] = &unk_2C5308;
  v26[4] = self;
  BOOL v27 = a3;
  [v10 addAnimations:v26];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_3E5DC;
  v24[3] = &unk_2C5330;
  BOOL v25 = a3;
  v24[4] = self;
  *(double *)&v24[5] = v20;
  id v21 = [objc_alloc((Class)UIViewPropertyAnimator) initWithDuration:3 curve:v24 animations:v20];
  if (!v21)
  {
LABEL_6:
    id v34 = v10;
    v22 = +[NSArray arrayWithObjects:&v34 count:1];
    [(BCViewPropertyAnimatorGroup *)self setAnimators:v22];
  }
  else
  {
    v22 = v21;
    v35[0] = v10;
    v35[1] = v21;
    v23 = +[NSArray arrayWithObjects:v35 count:2];
    [(BCViewPropertyAnimatorGroup *)self setAnimators:v23];
  }
}

- (void)setupForInteractiveDismiss
{
  [(BCCardStackInteractiveDismissAnimator *)self setDismissState:1];
  [(BCCardStackInteractiveDismissAnimator *)self setupAnimatorsForCancellation:0 velocity:0.0];

  [(BCViewPropertyAnimatorGroup *)self pauseAnimation];
}

- (void)updateDismissFractionCompleteWithCardOffset:(double)a3
{
  [(BCCardStackInteractiveDismissAnimator *)self maxSlideDistance];
  double v6 = a3 / v5;

  [(BCViewPropertyAnimatorGroup *)self setFractionComplete:v6];
}

- (void)animateDismissCancellationWithVelocity:(double)a3 completion:(id)a4
{
  id v6 = a4;
  [(BCCardStackInteractiveDismissAnimator *)self setDismissState:2];
  [(BCViewPropertyAnimatorGroup *)self stopAnimation:1];
  [(BCCardStackInteractiveDismissAnimator *)self setupAnimatorsForCancellation:1 velocity:a3];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_3EAE0;
  v8[3] = &unk_2C5358;
  id v9 = v6;
  id v7 = v6;
  [(BCViewPropertyAnimatorGroup *)self addCompletion:v8];
  [(BCViewPropertyAnimatorGroup *)self startAnimation];
}

- (double)pauseDismissCancellationAndReset
{
  [(BCCardStackInteractiveDismissAnimator *)self setDismissState:1];
  [(BCViewPropertyAnimatorGroup *)self stopAnimation:1];
  id v3 = [(BCCardStackInteractiveDismissAnimator *)self displayedCardViewControllers];
  unsigned int v4 = +[NSNumber numberWithInteger:[(BCCardStackInteractiveDismissAnimator *)self focusedIndex]];
  double v5 = [v3 objectForKeyedSubscript:v4];
  id v6 = [v5 view];
  id v7 = v6;
  if (v6)
  {
    [v6 transform];
    double v8 = v12;
  }
  else
  {
    double v8 = 0.0;
  }

  [(BCCardStackInteractiveDismissAnimator *)self maxSlideDistance];
  double v10 = v8 / v9;
  [(BCCardStackInteractiveDismissAnimator *)self setupAnimatorsForCancellation:0 velocity:0.0];
  [(BCViewPropertyAnimatorGroup *)self pauseAnimation];
  [(BCViewPropertyAnimatorGroup *)self setFractionComplete:v10];
  return v8;
}

- (NSDictionary)displayedCardViewControllers
{
  return self->_displayedCardViewControllers;
}

- (void)setDisplayedCardViewControllers:(id)a3
{
}

- (int64_t)focusedIndex
{
  return self->_focusedIndex;
}

- (void)setFocusedIndex:(int64_t)a3
{
  self->_focusedIndex = a3;
}

- (double)maxSlideDistance
{
  return self->_maxSlideDistance;
}

- (void)setMaxSlideDistance:(double)a3
{
  self->_maxSlideDistance = a3;
}

- (double)maxTitleSlideDistance
{
  return self->_maxTitleSlideDistance;
}

- (void)setMaxTitleSlideDistance:(double)a3
{
  self->_maxTitleSlideDistance = a3;
}

- (UIView)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)leftArrowButton
{
  return self->_leftArrowButton;
}

- (void)setLeftArrowButton:(id)a3
{
}

- (UIView)rightArrowButton
{
  return self->_rightArrowButton;
}

- (void)setRightArrowButton:(id)a3
{
}

- (BOOL)shouldRetainBackgroundAndTitleState
{
  return self->_shouldRetainBackgroundAndTitleState;
}

- (void)setShouldRetainBackgroundAndTitleState:(BOOL)a3
{
  self->_shouldRetainBackgroundAndTitleState = a3;
}

- (double)distanceToCoverSource
{
  return self->_distanceToCoverSource;
}

- (void)setDistanceToCoverSource:(double)a3
{
  self->_distanceToCoverSource = a3;
}

- (int64_t)finalAnimationType
{
  return self->_finalAnimationType;
}

- (void)setFinalAnimationType:(int64_t)a3
{
  self->_finalAnimationType = a3;
}

- (unint64_t)dismissState
{
  return self->_dismissState;
}

- (void)setDismissState:(unint64_t)a3
{
  self->_dismissState = a3;
}

- (NSMutableDictionary)txForCardIndex
{
  return self->_txForCardIndex;
}

- (void)setTxForCardIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txForCardIndex, 0);
  objc_storeStrong((id *)&self->_rightArrowButton, 0);
  objc_storeStrong((id *)&self->_leftArrowButton, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_displayedCardViewControllers, 0);
}

@end