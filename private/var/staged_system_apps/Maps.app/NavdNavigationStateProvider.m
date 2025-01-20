@interface NavdNavigationStateProvider
- (MNNavigationService)navigationService;
- (MNStartNavigationDetails)startNavigationDetails;
- (NavdNavigationStateProvider)initWithNavigationService:(id)a3 startNavigationDetails:(id)a4;
- (NavigationStateProviderDelegate)delegate;
- (unint64_t)_navigationStateForServiceState:(unint64_t)a3;
- (unint64_t)navigationState;
- (void)dealloc;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)setDelegate:(id)a3;
- (void)setNavigationService:(id)a3;
- (void)setNavigationState:(unint64_t)a3;
@end

@implementation NavdNavigationStateProvider

- (NavdNavigationStateProvider)initWithNavigationService:(id)a3 startNavigationDetails:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NavdNavigationStateProvider;
  v9 = [(NavdNavigationStateProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startNavigationDetails, a4);
    objc_storeStrong((id *)&v10->_navigationService, a3);
    [(MNNavigationService *)v10->_navigationService registerObserver:v10];
    [(MNNavigationService *)v10->_navigationService openForClient:v10];
  }

  return v10;
}

- (void)dealloc
{
  v3 = [(NavdNavigationStateProvider *)self navigationService];
  [v3 unregisterObserver:self];

  v4 = [(NavdNavigationStateProvider *)self navigationService];
  [v4 closeForClient:self];

  v5.receiver = self;
  v5.super_class = (Class)NavdNavigationStateProvider;
  [(NavdNavigationStateProvider *)&v5 dealloc];
}

- (void)setNavigationState:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v9 = [(NavdNavigationStateProvider *)self navigationService];
    [v9 stopNavigationWithReason:2];
  }
  else if (a3 == 2)
  {
    v4 = [(NavdNavigationStateProvider *)self navigationService];
    objc_super v5 = [(NavdNavigationStateProvider *)self startNavigationDetails];
    v6 = dispatch_get_global_queue(33, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1009A3118;
    block[3] = &unk_1012E5D58;
    id v11 = v4;
    id v12 = v5;
    id v7 = v5;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

- (unint64_t)navigationState
{
  v3 = [(NavdNavigationStateProvider *)self navigationService];

  if (!v3) {
    return 0;
  }
  v4 = [(NavdNavigationStateProvider *)self navigationService];
  unint64_t v5 = -[NavdNavigationStateProvider _navigationStateForServiceState:](self, "_navigationStateForServiceState:", [v4 state]);

  return v5;
}

- (unint64_t)_navigationStateForServiceState:(unint64_t)a3
{
  int IsNavigating = MNNavigationServiceStateIsNavigating();
  if (a3 == 3) {
    int v5 = 1;
  }
  else {
    int v5 = IsNavigating;
  }
  if (v5) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  unint64_t v7 = [(NavdNavigationStateProvider *)self _navigationStateForServiceState:a4];
  unint64_t v8 = [(NavdNavigationStateProvider *)self _navigationStateForServiceState:a5];
  if (v7 != v8)
  {
    unint64_t v9 = v8;
    id v10 = [(NavdNavigationStateProvider *)self delegate];
    [v10 navigationStateProvider:self didChangeNavigationState:v9];
  }
}

- (NavigationStateProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NavigationStateProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MNStartNavigationDetails)startNavigationDetails
{
  return self->_startNavigationDetails;
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void)setNavigationService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationService, 0);
  objc_storeStrong((id *)&self->_startNavigationDetails, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end