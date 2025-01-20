@interface WGWidgetPinningTeachingAnimationView
- (CALayer)materialsLayer;
- (CALayer)page1Layer;
- (CALayer)pagesLayer;
- (NSTimer)timerToNextState;
- (UILabel)debugLabel;
- (WGWidgetPinningTeachingAnimationView)init;
- (double)_durationForState:(unint64_t)a3;
- (unint64_t)_stateFollowingState:(unint64_t)a3;
- (unint64_t)state;
- (void)_setState:(unint64_t)a3;
- (void)_setTimerToNextState:(id)a3;
- (void)_updateMaterials;
- (void)setDebugLabel:(id)a3;
- (void)setMaterialsLayer:(id)a3;
- (void)setPage1Layer:(id)a3;
- (void)setPagesLayer:(id)a3;
- (void)startAnimating;
- (void)stopAnimating;
@end

@implementation WGWidgetPinningTeachingAnimationView

- (WGWidgetPinningTeachingAnimationView)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11.receiver = self;
  v11.super_class = (Class)WGWidgetPinningTeachingAnimationView;
  v4 = [(BSUICAPackageView *)&v11 initWithPackageName:@"widgets-pinning-teaching" inBundle:v3];

  if (v4)
  {
    v5 = [(BSUICAPackageView *)v4 publishedObjectWithName:@"materials"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v4->_materialsLayer, v5);
    }
    v6 = [(BSUICAPackageView *)v4 publishedObjectWithName:@"pages"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v4->_pagesLayer, v6);
    }
    v7 = [(BSUICAPackageView *)v4 publishedObjectWithName:@"page 1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v4->_page1Layer, v7);
    }
    if ([(WGWidgetPinningTeachingAnimationView *)v4 _shouldReverseLayoutDirection])
    {
      memset(&v10, 0, sizeof(v10));
      CGAffineTransformMakeScale(&v10, -1.0, 1.0);
      CGAffineTransform v9 = v10;
      [(WGWidgetPinningTeachingAnimationView *)v4 setTransform:&v9];
    }
  }
  return v4;
}

- (void)startAnimating
{
}

- (void)stopAnimating
{
}

- (void)_setState:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (self->_state != a3)
  {
    v5 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v6 = self->_state - 1;
      if (v6 > 5) {
        v7 = @"none";
      }
      else {
        v7 = off_2646764B8[v6];
      }
      *(_DWORD *)buf = 138412290;
      v26 = v7;
      v8 = v5;
      _os_log_impl(&dword_222E49000, v8, OS_LOG_TYPE_DEFAULT, "WGWidgetPinningTeachingAnimationView setState: %@", buf, 0xCu);
    }
    unint64_t state = self->_state;
    self->_unint64_t state = a3;
    char v10 = 0;
    objc_super v11 = @"page 1";
    v12 = @"unsquished";
    switch(a3)
    {
      case 0uLL:
      case 1uLL:
        goto LABEL_12;
      case 2uLL:
        BOOL v13 = state != 0;
        v12 = @"squished";
        goto LABEL_19;
      case 3uLL:
      case 5uLL:
        v12 = 0;
        objc_super v11 = @"page 2";
        goto LABEL_11;
      case 4uLL:
        v12 = 0;
LABEL_11:
        char v10 = 1;
LABEL_12:
        BOOL v13 = a3 != 1 && state != 0;
        [(BSUICAPackageView *)self setState:v11 onLayer:self->_pagesLayer animated:v13 transitionSpeed:0 completion:1.0];
        if ((v10 & 1) == 0) {
LABEL_19:
        }
          [(BSUICAPackageView *)self setState:v12 onLayer:self->_page1Layer animated:v13 transitionSpeed:0 completion:1.0];
        break;
      default:
        break;
    }
    [(WGWidgetPinningTeachingAnimationView *)self _durationForState:self->_state];
    double v16 = v15;
    v17 = [(WGWidgetPinningTeachingAnimationView *)self _stateFollowingState:self->_state];
    objc_initWeak((id *)buf, self);
    v18 = (void *)MEMORY[0x263EFFA20];
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __50__WGWidgetPinningTeachingAnimationView__setState___block_invoke;
    v23 = &unk_264676498;
    objc_copyWeak(v24, (id *)buf);
    v24[1] = v17;
    v19 = [v18 scheduledTimerWithTimeInterval:0 repeats:&v20 block:v16];
    -[WGWidgetPinningTeachingAnimationView _setTimerToNextState:](self, "_setTimerToNextState:", v19, v20, v21, v22, v23);

    objc_destroyWeak(v24);
    objc_destroyWeak((id *)buf);
  }
}

void __50__WGWidgetPinningTeachingAnimationView__setState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setState:*(void *)(a1 + 40)];
}

- (void)_setTimerToNextState:(id)a3
{
  id v5 = a3;
  p_timerToNextState = (id *)&self->_timerToNextState;
  id v7 = *p_timerToNextState;
  if (*p_timerToNextState != v5)
  {
    if (v7) {
      [v7 invalidate];
    }
    objc_storeStrong(p_timerToNextState, a3);
  }
  MEMORY[0x270F9A758]();
}

- (void)_updateMaterials
{
  v3 = [(WGWidgetPinningTeachingAnimationView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  if (v4 == 2) {
    id v5 = @"dark";
  }
  else {
    id v5 = @"light";
  }
  materialsLayer = self->_materialsLayer;
  [(BSUICAPackageView *)self setState:v5 onLayer:materialsLayer animated:1 transitionSpeed:0 completion:1.0];
}

- (double)_durationForState:(unint64_t)a3
{
  double result = 0.0;
  if (a3 - 1 <= 4) {
    return dbl_222E98780[a3 - 1];
  }
  return result;
}

- (unint64_t)_stateFollowingState:(unint64_t)a3
{
  if ((self->_state + 1) % 6 <= 1) {
    return 1;
  }
  else {
    return (self->_state + 1) % 6;
  }
}

- (unint64_t)state
{
  return self->_state;
}

- (CALayer)materialsLayer
{
  return self->_materialsLayer;
}

- (void)setMaterialsLayer:(id)a3
{
}

- (CALayer)pagesLayer
{
  return self->_pagesLayer;
}

- (void)setPagesLayer:(id)a3
{
}

- (CALayer)page1Layer
{
  return self->_page1Layer;
}

- (void)setPage1Layer:(id)a3
{
}

- (NSTimer)timerToNextState
{
  return self->_timerToNextState;
}

- (UILabel)debugLabel
{
  return self->_debugLabel;
}

- (void)setDebugLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_timerToNextState, 0);
  objc_storeStrong((id *)&self->_page1Layer, 0);
  objc_storeStrong((id *)&self->_pagesLayer, 0);
  objc_storeStrong((id *)&self->_materialsLayer, 0);
}

@end