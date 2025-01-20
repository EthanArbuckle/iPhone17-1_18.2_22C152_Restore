@interface SUICProgressIndicatorViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldAcceptEventsFromStateMachine:(id)a3;
- (SUICProgressIndicatorView)_progressIndicatorView;
- (SUICProgressIndicatorViewControllerDataSource)dataSource;
- (id)_stateMachine;
- (void)_setProgressIndicatorView:(id)a3;
- (void)loadView;
- (void)progressStateMachine:(id)a3 didTransitionToState:(unint64_t)a4 fromState:(unint64_t)a5 forEvent:(unint64_t)a6;
- (void)progressStateMachine:(id)a3 ignoredEvent:(unint64_t)a4;
- (void)setDataSource:(id)a3;
@end

@implementation SUICProgressIndicatorViewController

- (id)_stateMachine
{
  v3 = [(SUICProgressIndicatorViewController *)self dataSource];
  v4 = [v3 stateMachineForProgressIndicatorViewController:self];

  return v4;
}

- (BOOL)_shouldAcceptEventsFromStateMachine:(id)a3
{
  id v4 = a3;
  v5 = [(SUICProgressIndicatorViewController *)self dataSource];
  if (v5)
  {
    id v6 = [(SUICProgressIndicatorViewController *)self _stateMachine];
    BOOL v7 = v6 == v4;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (void)loadView
{
  v3 = objc_alloc_init(SUICProgressIndicatorView);
  progressIndicatorView = self->_progressIndicatorView;
  self->_progressIndicatorView = v3;

  if (self->_progressIndicatorView)
  {
    -[SUICProgressIndicatorViewController setView:](self, "setView:");
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(SUICProgressIndicatorViewController *)self setView:v5];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)progressStateMachine:(id)a3 didTransitionToState:(unint64_t)a4 fromState:(unint64_t)a5 forEvent:(unint64_t)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if ([(SUICProgressIndicatorViewController *)self _shouldAcceptEventsFromStateMachine:v10])
  {
    v11 = [(SUICProgressIndicatorViewController *)self dataSource];
    if (objc_opt_respondsToSelector()) {
      uint64_t v12 = [v11 shouldAnimateTransitionToState:a4 fromState:a5 forProgressIndicatorViewController:self];
    }
    else {
      uint64_t v12 = 1;
    }
    switch(a4)
    {
      case 0uLL:
        [(SUICProgressIndicatorView *)self->_progressIndicatorView setProgressValue:v12 animated:0 completion:1.0];
        [(SUICProgressIndicatorView *)self->_progressIndicatorView setSpinning:0];
        objc_initWeak((id *)buf, self);
        progressIndicatorView = self->_progressIndicatorView;
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __100__SUICProgressIndicatorViewController_progressStateMachine_didTransitionToState_fromState_forEvent___block_invoke;
        v32[3] = &unk_1E5C596C8;
        objc_copyWeak(&v33, (id *)buf);
        char v34 = v12;
        [(SUICProgressIndicatorView *)progressIndicatorView setDarkened:0 animated:v12 completion:v32];
        [(SUICProgressIndicatorView *)self->_progressIndicatorView setCheckmarkVisible:0 animated:v12 completion:0];
        objc_destroyWeak(&v33);
        objc_destroyWeak((id *)buf);
        break;
      case 1uLL:
        [(SUICProgressIndicatorView *)self->_progressIndicatorView setArrowVisible:0 delay:v12 animated:0 completion:0.0];
        objc_initWeak((id *)buf, self);
        v18 = self->_progressIndicatorView;
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __100__SUICProgressIndicatorViewController_progressStateMachine_didTransitionToState_fromState_forEvent___block_invoke_2;
        v30[3] = &unk_1E5C596F0;
        objc_copyWeak(&v31, (id *)buf);
        [(SUICProgressIndicatorView *)v18 setProgressValue:v12 animated:v30 completion:0.8];
        objc_destroyWeak(&v31);
        objc_destroyWeak((id *)buf);
        break;
      case 2uLL:
        v19 = [(SUICProgressIndicatorViewController *)self dataSource];
        v20 = [v19 progress];

        [(SUICProgressIndicatorView *)self->_progressIndicatorView setSpinning:0];
        [(SUICProgressIndicatorView *)self->_progressIndicatorView setDarkened:0 animated:v12 completion:0];
        [(SUICProgressIndicatorView *)self->_progressIndicatorView setCheckmarkVisible:0 animated:v12 completion:0];
        -[SUICProgressIndicatorView setProgressValue:animated:completion:](self->_progressIndicatorView, "setProgressValue:animated:completion:", v12, 0, (double)[v20 completedUnitCount] / (double)objc_msgSend(v20, "totalUnitCount"));

        break;
      case 3uLL:
        objc_initWeak((id *)buf, self);
        v21 = self->_progressIndicatorView;
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __100__SUICProgressIndicatorViewController_progressStateMachine_didTransitionToState_fromState_forEvent___block_invoke_3;
        v27[3] = &unk_1E5C596C8;
        objc_copyWeak(&v28, (id *)buf);
        char v29 = v12;
        [(SUICProgressIndicatorView *)v21 setArrowVisible:0 delay:v12 animated:v27 completion:0.0];
        [(SUICProgressIndicatorView *)self->_progressIndicatorView setSpinning:0];
        objc_destroyWeak(&v28);
        objc_destroyWeak((id *)buf);
        break;
      default:
        break;
    }
    v22 = (void *)*MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_INFO))
    {
      v23 = v22;
      v24 = SUICProgressStateNameForState(a4);
      v25 = SUICProgressStateNameForState(a5);
      v26 = SUICProgressEventNameForEvent(a6);
      *(_DWORD *)buf = 136316162;
      v36 = "-[SUICProgressIndicatorViewController progressStateMachine:didTransitionToState:fromState:forEvent:]";
      __int16 v37 = 2112;
      id v38 = v10;
      __int16 v39 = 2112;
      v40 = v24;
      __int16 v41 = 2112;
      v42 = v25;
      __int16 v43 = 2112;
      v44 = v26;
      _os_log_impl(&dword_1A64CC000, v23, OS_LOG_TYPE_INFO, "%s State machine %@ transitioned to state %@ from state %@ for event %@", buf, 0x34u);
    }
  }
  else
  {
    v13 = (void *)*MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      v15 = [(SUICProgressIndicatorViewController *)self _stateMachine];
      v16 = SUICProgressEventNameForEvent(a6);
      *(_DWORD *)buf = 136315906;
      v36 = "-[SUICProgressIndicatorViewController progressStateMachine:didTransitionToState:fromState:forEvent:]";
      __int16 v37 = 2112;
      id v38 = v10;
      __int16 v39 = 2112;
      v40 = v15;
      __int16 v41 = 2112;
      v42 = v16;
      _os_log_error_impl(&dword_1A64CC000, v14, OS_LOG_TYPE_ERROR, "%s State machine %@ doesn't match data source state machine %@, not listening to event %@", buf, 0x2Au);
    }
  }
}

void __100__SUICProgressIndicatorViewController_progressStateMachine_didTransitionToState_fromState_forEvent___block_invoke(uint64_t a1, int a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (a2 && WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained[122] setArrowVisible:1 delay:*(unsigned __int8 *)(a1 + 40) animated:0 completion:0.25];
    WeakRetained = v5;
  }
}

void __100__SUICProgressIndicatorViewController_progressStateMachine_didTransitionToState_fromState_forEvent___block_invoke_2(uint64_t a1, int a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (a2 && WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained[122] setSpinning:1];
    WeakRetained = v4;
  }
}

void __100__SUICProgressIndicatorViewController_progressStateMachine_didTransitionToState_fromState_forEvent___block_invoke_3(uint64_t a1, int a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (a2 && WeakRetained)
  {
    objc_initWeak(&location, WeakRetained);
    id v6 = (void *)v5[122];
    uint64_t v7 = *(unsigned __int8 *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __100__SUICProgressIndicatorViewController_progressStateMachine_didTransitionToState_fromState_forEvent___block_invoke_4;
    v8[3] = &unk_1E5C596C8;
    objc_copyWeak(&v9, &location);
    char v10 = *(unsigned char *)(a1 + 40);
    [v6 setProgressValue:v7 animated:v8 completion:1.0];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __100__SUICProgressIndicatorViewController_progressStateMachine_didTransitionToState_fromState_forEvent___block_invoke_4(uint64_t a1, int a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (a2 && WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained[122] setDarkened:1 animated:*(unsigned __int8 *)(a1 + 40) completion:0];
    [v5[122] setCheckmarkVisible:1 animated:*(unsigned __int8 *)(a1 + 40) completion:0];
    WeakRetained = v5;
  }
}

- (void)progressStateMachine:(id)a3 ignoredEvent:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(SUICProgressIndicatorViewController *)self _shouldAcceptEventsFromStateMachine:v6];
  v8 = (void *)*MEMORY[0x1E4F4E360];
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_INFO))
    {
      id v9 = v8;
      char v10 = SUICProgressEventNameForEvent(a4);
      int v11 = 136315650;
      uint64_t v12 = "-[SUICProgressIndicatorViewController progressStateMachine:ignoredEvent:]";
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1A64CC000, v9, OS_LOG_TYPE_INFO, "%s State machine %@ ignored event %@", (uint8_t *)&v11, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR))
  {
    -[SUICProgressIndicatorViewController progressStateMachine:ignoredEvent:]((uint64_t)v6, v8, self);
  }
}

- (SUICProgressIndicatorView)_progressIndicatorView
{
  return self->_progressIndicatorView;
}

- (void)_setProgressIndicatorView:(id)a3
{
}

- (SUICProgressIndicatorViewControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (SUICProgressIndicatorViewControllerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);

  objc_storeStrong((id *)&self->_progressIndicatorView, 0);
}

- (void)progressStateMachine:(void *)a3 ignoredEvent:.cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [a3 _stateMachine];
  int v7 = 136315650;
  v8 = "-[SUICProgressIndicatorViewController progressStateMachine:ignoredEvent:]";
  __int16 v9 = 2112;
  uint64_t v10 = a1;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_error_impl(&dword_1A64CC000, v5, OS_LOG_TYPE_ERROR, "%s State machine %@ doesn't match data source state machine %@, not listening to event", (uint8_t *)&v7, 0x20u);
}

@end