@interface SFCAPackageView
+ (id)keyPathsForValuesAffectingPackageRootLayer;
- (BOOL)isInitialState;
- (CALayer)packageRootLayer;
- (CAStateController)stateController;
- (NSMutableArray)completionHandlers;
- (NSString)stateName;
- (SFCAPackageView)initWithCoder:(id)a3;
- (SFCAPackageView)initWithFrame:(CGRect)a3;
- (float)duration;
- (id)_getStateWithName:(id)a3;
- (id)_newStateControllerWithSuperlayer:(id)a3;
- (unint64_t)statesCount;
- (void)_changeAppearance;
- (void)_stcaPackageViewCommonInit;
- (void)animateToInitialStateWithCompletionHandler:(id)a3;
- (void)animateToStateName:(id)a3 completionHandler:(id)a4;
- (void)setInitialState;
- (void)setStateController:(id)a3;
- (void)setStateName:(id)a3;
- (void)stateController:(id)a3 transitionDidStop:(id)a4 completed:(BOOL)a5;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SFCAPackageView

- (SFCAPackageView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFCAPackageView;
  v3 = -[SFCAPackageView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SFCAPackageView *)v3 _stcaPackageViewCommonInit];
  return v3;
}

- (SFCAPackageView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFCAPackageView;
  v3 = [(SFCAPackageView *)&v5 initWithCoder:a3];
  [(SFCAPackageView *)v3 _stcaPackageViewCommonInit];
  return v3;
}

- (void)_stcaPackageViewCommonInit
{
  v3 = (NSMutableArray *)objc_opt_new();
  completionHandlers = self->_completionHandlers;
  self->_completionHandlers = v3;

  objc_super v5 = [(SFCAPackageView *)self layer];
  v6 = [(SFCAPackageView *)self _newStateControllerWithSuperlayer:v5];
  stateController = self->_stateController;
  self->_stateController = v6;

  [(SFCAPackageView *)self setUserInteractionEnabled:0];
}

- (id)_newStateControllerWithSuperlayer:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SFCAPackageView *)self makeCAPackage];
  v6 = [v5 rootLayer];
  [v4 addSublayer:v6];
  objc_msgSend(v4, "setGeometryFlipped:", objc_msgSend(v5, "isGeometryFlipped"));

  v7 = (void *)[objc_alloc(MEMORY[0x263F158B0]) initWithLayer:v6];
  [v7 setDelegate:self];

  return v7;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFCAPackageView;
  [(SFCAPackageView *)&v8 traitCollectionDidChange:v4];
  if (!v4
    || (uint64_t v5 = [v4 userInterfaceStyle],
        [(SFCAPackageView *)self traitCollection],
        v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 userInterfaceStyle],
        v6,
        v5 != v7))
  {
    [(SFCAPackageView *)self _changeAppearance];
  }
}

- (void)_changeAppearance
{
  id v8 = [(SFCAPackageView *)self packageRootLayer];
  v3 = [(SFCAPackageView *)self stateController];
  id v4 = [v3 stateOfLayer:v8];
  uint64_t v5 = [v4 name];

  [v8 removeFromSuperlayer];
  v6 = [(SFCAPackageView *)self layer];
  id v7 = [(SFCAPackageView *)self _newStateControllerWithSuperlayer:v6];
  [(SFCAPackageView *)self setStateController:v7];

  if (v5) {
    [(SFCAPackageView *)self setStateName:v5];
  }
}

+ (id)keyPathsForValuesAffectingPackageRootLayer
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"stateController.layer"];
}

- (CALayer)packageRootLayer
{
  v2 = [(SFCAPackageView *)self stateController];
  v3 = [v2 layer];

  return (CALayer *)v3;
}

- (unint64_t)statesCount
{
  v2 = [(SFCAPackageView *)self packageRootLayer];
  v3 = [v2 states];
  unint64_t v4 = [v3 count];

  return v4;
}

- (BOOL)isInitialState
{
  v3 = [(SFCAPackageView *)self packageRootLayer];
  unint64_t v4 = [(SFCAPackageView *)self stateController];
  uint64_t v5 = [v4 stateOfLayer:v3];

  v6 = [v3 states];
  uint64_t v7 = [v6 indexOfObjectPassingTest:&__block_literal_global_4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [v6 objectAtIndexedSubscript:v7];
  }
  if (v5 == v8) {
    char v9 = 1;
  }
  else {
    char v9 = [v5 isEqual:v8];
  }

  return v9;
}

uint64_t __33__SFCAPackageView_isInitialState__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isInitial];
}

- (void)setInitialState
{
  id v4 = [(SFCAPackageView *)self stateController];
  v3 = [(SFCAPackageView *)self packageRootLayer];
  [v4 setInitialStatesOfLayer:v3];
}

- (void)animateToInitialStateWithCompletionHandler:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(void))a3;
  if ([(SFCAPackageView *)self statesCount])
  {
    if ([(SFCAPackageView *)self isInitialState])
    {
      uint64_t v5 = framework_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[SFCAPackageView animateToInitialStateWithCompletionHandler:]((uint64_t)self, v5);
      }

      v4[2](v4);
    }
    else
    {
      v10 = [(SFCAPackageView *)self completionHandlers];
      v11 = _Block_copy(v4);
      [v10 addObject:v11];

      v12 = framework_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [(SFCAPackageView *)self stateName];
        *(_DWORD *)buf = 138412546;
        v20 = self;
        __int16 v21 = 2112;
        v22 = v13;
        _os_log_impl(&dword_21DB23000, v12, OS_LOG_TYPE_DEFAULT, "%@ starting transition(s) from state %@ to initial state", buf, 0x16u);
      }
      v14 = [(SFCAPackageView *)self stateController];
      v15 = [(SFCAPackageView *)self packageRootLayer];
      LODWORD(v16) = 1.0;
      [v14 setInitialStatesOfLayer:v15 transitionSpeed:v16];
    }
  }
  else
  {
    double v6 = CACurrentMediaTime();
    uint64_t v7 = [(SFCAPackageView *)self packageRootLayer];
    [v7 setBeginTime:v6];

    [(SFCAPackageView *)self duration];
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(float)(v8 * 1000000000.0));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__SFCAPackageView_animateToInitialStateWithCompletionHandler___block_invoke;
    block[3] = &unk_264472440;
    v18 = v4;
    dispatch_after(v9, MEMORY[0x263EF83A0], block);
  }
}

uint64_t __62__SFCAPackageView_animateToInitialStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)stateName
{
  v3 = [(SFCAPackageView *)self stateController];
  id v4 = [(SFCAPackageView *)self packageRootLayer];
  uint64_t v5 = [v3 stateOfLayer:v4];
  double v6 = [v5 name];

  return (NSString *)v6;
}

- (void)setStateName:(id)a3
{
  id v4 = a3;
  id v7 = [(SFCAPackageView *)self stateController];
  uint64_t v5 = [(SFCAPackageView *)self _getStateWithName:v4];

  double v6 = [(SFCAPackageView *)self packageRootLayer];
  [v7 setState:v5 ofLayer:v6];
}

- (void)animateToStateName:(id)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  float v8 = [(SFCAPackageView *)self stateController];
  dispatch_time_t v9 = [(SFCAPackageView *)self packageRootLayer];
  v10 = [v8 stateOfLayer:v9];
  v11 = [(SFCAPackageView *)self _getStateWithName:v6];
  if (v10 == v11 || ([v10 isEqual:v11] & 1) != 0)
  {
    v12 = framework_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[SFCAPackageView animateToStateName:completionHandler:]();
    }

    v7[2](v7);
  }
  else
  {
    v13 = [(SFCAPackageView *)self completionHandlers];
    v14 = _Block_copy(v7);
    [v13 addObject:v14];

    v15 = framework_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      double v16 = [v10 name];
      int v19 = 138412802;
      v20 = self;
      __int16 v21 = 2112;
      v22 = v16;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_21DB23000, v15, OS_LOG_TYPE_DEFAULT, "%@ starting transition(s) from state %@ to state %@", (uint8_t *)&v19, 0x20u);
    }
    v17 = [(SFCAPackageView *)self packageRootLayer];
    LODWORD(v18) = 1.0;
    [v8 setState:v11 ofLayer:v17 transitionSpeed:v18];
  }
}

- (id)_getStateWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCAPackageView *)self packageRootLayer];
  id v6 = [v5 stateWithName:v4];

  if (!v6)
  {
    id v7 = framework_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[SFCAPackageView _getStateWithName:]();
    }
  }
  return v6;
}

- (void)stateController:(id)a3 transitionDidStop:(id)a4 completed:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a4;
  float v8 = framework_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_time_t v9 = [v7 fromState];
    v10 = [v7 toState];
    *(_DWORD *)buf = 138413058;
    v22 = self;
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    v26 = v10;
    __int16 v27 = 1024;
    BOOL v28 = v5;
    _os_log_impl(&dword_21DB23000, v8, OS_LOG_TYPE_DEFAULT, "%@ stopped transition <fromState=%@ toState=%@> completed:%d", buf, 0x26u);
  }
  v11 = [(SFCAPackageView *)self completionHandlers];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * v15++) + 16))();
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
  [v11 removeAllObjects];
}

- (float)duration
{
  return self->_duration;
}

- (CAStateController)stateController
{
  return (CAStateController *)objc_getProperty(self, a2, 416, 1);
}

- (void)setStateController:(id)a3
{
}

- (NSMutableArray)completionHandlers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 424, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
}

- (void)animateToInitialStateWithCompletionHandler:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v4 = 138412290;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_fault_impl(&dword_21DB23000, a2, OS_LOG_TYPE_FAULT, "Trying to animate to the initial state of %@ when already there", (uint8_t *)&v4, 0xCu);
}

- (void)animateToStateName:completionHandler:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0(v0);
  OUTLINED_FUNCTION_1(&dword_21DB23000, v2, v3, "Trying to animate to %@ of %@ when already there", v4, v5, v6, v7, v8);
}

- (void)_getStateWithName:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0(v0);
  OUTLINED_FUNCTION_1(&dword_21DB23000, v2, v3, "Invalid state name %@ for %@", v4, v5, v6, v7, v8);
}

@end