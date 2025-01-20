@interface STCAPackageView
+ (id)keyPathsForValuesAffectingPackageRootLayer;
- (BOOL)isInitialState;
- (CALayer)packageRootLayer;
- (CAStateController)stateController;
- (NSMutableArray)completionHandlers;
- (NSString)stateName;
- (STCAPackageView)initWithCoder:(id)a3;
- (STCAPackageView)initWithFrame:(CGRect)a3;
- (id)_getStateWithName:(id)a3;
- (id)_newStateControllerWithSuperlayer:(id)a3;
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

@implementation STCAPackageView

- (STCAPackageView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STCAPackageView;
  v3 = -[STCAPackageView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(STCAPackageView *)v3 _stcaPackageViewCommonInit];
  return v3;
}

- (STCAPackageView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STCAPackageView;
  v3 = [(STCAPackageView *)&v5 initWithCoder:a3];
  [(STCAPackageView *)v3 _stcaPackageViewCommonInit];
  return v3;
}

- (void)_stcaPackageViewCommonInit
{
  v3 = (NSMutableArray *)objc_opt_new();
  completionHandlers = self->_completionHandlers;
  self->_completionHandlers = v3;

  objc_super v5 = [(STCAPackageView *)self layer];
  v6 = [(STCAPackageView *)self _newStateControllerWithSuperlayer:v5];
  stateController = self->_stateController;
  self->_stateController = v6;

  [(STCAPackageView *)self setUserInteractionEnabled:0];
}

- (id)_newStateControllerWithSuperlayer:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(STCAPackageView *)self makeCAPackage];
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
  v8.super_class = (Class)STCAPackageView;
  [(STCAPackageView *)&v8 traitCollectionDidChange:v4];
  if (!v4
    || (uint64_t v5 = [v4 userInterfaceStyle],
        [(STCAPackageView *)self traitCollection],
        v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 userInterfaceStyle],
        v6,
        v5 != v7))
  {
    [(STCAPackageView *)self _changeAppearance];
  }
}

- (void)_changeAppearance
{
  id v8 = [(STCAPackageView *)self packageRootLayer];
  v3 = [(STCAPackageView *)self stateController];
  id v4 = [v3 stateOfLayer:v8];
  uint64_t v5 = [v4 name];

  [v8 removeFromSuperlayer];
  v6 = [(STCAPackageView *)self layer];
  id v7 = [(STCAPackageView *)self _newStateControllerWithSuperlayer:v6];
  [(STCAPackageView *)self setStateController:v7];

  if (v5) {
    [(STCAPackageView *)self setStateName:v5];
  }
}

+ (id)keyPathsForValuesAffectingPackageRootLayer
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"stateController.layer"];
}

- (CALayer)packageRootLayer
{
  v2 = [(STCAPackageView *)self stateController];
  v3 = [v2 layer];

  return (CALayer *)v3;
}

- (BOOL)isInitialState
{
  v3 = [(STCAPackageView *)self packageRootLayer];
  id v4 = [(STCAPackageView *)self stateController];
  uint64_t v5 = [v4 stateOfLayer:v3];

  v6 = [v3 states];
  uint64_t v7 = [v6 indexOfObjectPassingTest:&__block_literal_global_6];
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

uint64_t __33__STCAPackageView_isInitialState__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isInitial];
}

- (void)setInitialState
{
  id v4 = [(STCAPackageView *)self stateController];
  v3 = [(STCAPackageView *)self packageRootLayer];
  [v4 setInitialStatesOfLayer:v3];
}

- (void)animateToInitialStateWithCompletionHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(void))a3;
  if ([(STCAPackageView *)self isInitialState])
  {
    uint64_t v5 = [MEMORY[0x263F671D8] coreAnimation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STCAPackageView animateToInitialStateWithCompletionHandler:]((uint64_t)self, v5);
    }

    v4[2](v4);
  }
  else
  {
    v6 = [(STCAPackageView *)self completionHandlers];
    uint64_t v7 = (void *)MEMORY[0x223C21E30](v4);

    [v6 addObject:v7];
    id v8 = [MEMORY[0x263F671D8] coreAnimation];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      char v9 = [(STCAPackageView *)self stateName];
      int v12 = 138543618;
      v13 = self;
      __int16 v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_21E199000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ starting transition(s) from state %{public}@ to initial state", (uint8_t *)&v12, 0x16u);
    }
    id v4 = [(STCAPackageView *)self stateController];
    v10 = [(STCAPackageView *)self packageRootLayer];
    LODWORD(v11) = 1.0;
    [v4 setInitialStatesOfLayer:v10 transitionSpeed:v11];
  }
}

- (NSString)stateName
{
  v3 = [(STCAPackageView *)self stateController];
  id v4 = [(STCAPackageView *)self packageRootLayer];
  uint64_t v5 = [v3 stateOfLayer:v4];
  v6 = [v5 name];

  return (NSString *)v6;
}

- (void)setStateName:(id)a3
{
  id v4 = a3;
  id v7 = [(STCAPackageView *)self stateController];
  uint64_t v5 = [(STCAPackageView *)self _getStateWithName:v4];

  v6 = [(STCAPackageView *)self packageRootLayer];
  [v7 setState:v5 ofLayer:v6];
}

- (void)animateToStateName:(id)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v6 = (STCAPackageView *)a3;
  id v7 = (void (**)(void))a4;
  id v8 = [(STCAPackageView *)self stateController];
  char v9 = [(STCAPackageView *)self packageRootLayer];
  v10 = [v8 stateOfLayer:v9];
  double v11 = [(STCAPackageView *)self _getStateWithName:v6];
  if (v10 == v11 || ([v10 isEqual:v11] & 1) != 0)
  {
    int v12 = [MEMORY[0x263F671D8] coreAnimation];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543618;
      v21 = v6;
      __int16 v22 = 2114;
      id v23 = (id)objc_opt_class();
      id v13 = v23;
      _os_log_impl(&dword_21E199000, v12, OS_LOG_TYPE_DEFAULT, "Trying to animate to %{public}@ of %{public}@ when already there", (uint8_t *)&v20, 0x16u);
    }
    if (v7) {
      v7[2](v7);
    }
  }
  else
  {
    if (v7)
    {
      __int16 v14 = [(STCAPackageView *)self completionHandlers];
      v15 = (void *)MEMORY[0x223C21E30](v7);
      [v14 addObject:v15];
    }
    uint64_t v16 = [MEMORY[0x263F671D8] coreAnimation];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [v10 name];
      int v20 = 138543874;
      v21 = self;
      __int16 v22 = 2114;
      id v23 = v17;
      __int16 v24 = 2114;
      v25 = v6;
      _os_log_impl(&dword_21E199000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ starting transition(s) from state %{public}@ to state %{public}@", (uint8_t *)&v20, 0x20u);
    }
    v18 = [(STCAPackageView *)self packageRootLayer];
    LODWORD(v19) = 1.0;
    [v8 setState:v11 ofLayer:v18 transitionSpeed:v19];
  }
}

- (id)_getStateWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STCAPackageView *)self packageRootLayer];
  v6 = [v5 stateWithName:v4];

  if (!v6)
  {
    id v7 = [MEMORY[0x263F671D8] coreAnimation];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      [(STCAPackageView *)(uint64_t)v4 _getStateWithName:v7];
    }
  }

  return v6;
}

- (void)stateController:(id)a3 transitionDidStop:(id)a4 completed:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = [MEMORY[0x263F671D8] coreAnimation];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    char v9 = [v7 fromState];
    v10 = [v7 toState];
    *(_DWORD *)buf = 138544130;
    __int16 v22 = self;
    __int16 v23 = 2114;
    __int16 v24 = v9;
    __int16 v25 = 2114;
    uint64_t v26 = v10;
    __int16 v27 = 1024;
    BOOL v28 = v5;
    _os_log_impl(&dword_21E199000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ stopped transition <fromState=%{public}@ toState=%{public}@> completed:%d", buf, 0x26u);
  }
  double v11 = [(STCAPackageView *)self completionHandlers];
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

- (CAStateController)stateController
{
  return (CAStateController *)objc_getProperty(self, a2, 408, 1);
}

- (void)setStateController:(id)a3
{
}

- (NSMutableArray)completionHandlers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 416, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);

  objc_storeStrong((id *)&self->_stateController, 0);
}

- (void)animateToInitialStateWithCompletionHandler:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v4 = 138543362;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_fault_impl(&dword_21E199000, a2, OS_LOG_TYPE_FAULT, "Trying to animate to the initial state of %{public}@ when already there", (uint8_t *)&v4, 0xCu);
}

- (void)_getStateWithName:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = 138543618;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  id v8 = (id)objc_opt_class();
  id v4 = v8;
  _os_log_fault_impl(&dword_21E199000, a3, OS_LOG_TYPE_FAULT, "Invalid state name %{public}@ for %{public}@", (uint8_t *)&v5, 0x16u);
}

@end