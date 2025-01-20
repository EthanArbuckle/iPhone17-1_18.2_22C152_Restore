@interface RouteGeniusSession
- (GEOObserverHashTable)observers;
- (MapsSuggestionsRouteGeniusEntry)routeGeniusEntry;
- (PlatformController)platformController;
- (RouteGeniusSession)init;
- (unint64_t)sessionInitiator;
- (unint64_t)sessionState;
- (void)addObserver:(id)a3;
- (void)cleanupStateReplay;
- (void)prepareToReplayCurrentState;
- (void)removeObserver:(id)a3;
- (void)replayCurrentState;
- (void)resume;
- (void)setObservers:(id)a3;
- (void)setPlatformController:(id)a3;
- (void)setSessionState:(unint64_t)a3;
- (void)suspend;
@end

@implementation RouteGeniusSession

- (RouteGeniusSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)RouteGeniusSession;
  v2 = [(RouteGeniusSession *)&v6 init];
  if (v2)
  {
    v3 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___MapsSessionObserver queue:0];
    observers = v2->_observers;
    v2->_observers = v3;
  }
  return v2;
}

- (void)setSessionState:(unint64_t)a3
{
  if (self->_sessionState != a3)
  {
    self->_sessionState = a3;
    id v4 = [(RouteGeniusSession *)self observers];
    [v4 mapsSession:self didChangeState:[self sessionState]];
  }
}

- (unint64_t)sessionInitiator
{
  return 2;
}

- (MapsSuggestionsRouteGeniusEntry)routeGeniusEntry
{
  v2 = +[CarRouteGeniusService sharedService];
  v3 = [v2 suggestion];

  return (MapsSuggestionsRouteGeniusEntry *)v3;
}

- (void)resume
{
  if ((id)[(RouteGeniusSession *)self sessionState] != (id)1)
  {
    [(RouteGeniusSession *)self setSessionState:1];
  }
}

- (void)suspend
{
  if ((id)[(RouteGeniusSession *)self sessionState] == (id)1)
  {
    [(RouteGeniusSession *)self setSessionState:2];
  }
}

- (void)prepareToReplayCurrentState
{
  id v2 = [(RouteGeniusSession *)self observers];
  [v2 snapshotCurrentObservers];
}

- (void)replayCurrentState
{
  v3 = [(RouteGeniusSession *)self observers];
  [v3 removeSnapshottedObservers];

  id v4 = [(RouteGeniusSession *)self observers];
  [v4 mapsSession:self didChangeState:[self sessionState]];

  id v5 = [(RouteGeniusSession *)self observers];
  [v5 restoreOriginalObservers];
}

- (void)cleanupStateReplay
{
  id v2 = [(RouteGeniusSession *)self observers];
  [v2 clearSnapshottedObservers];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(RouteGeniusSession *)self observers];
  [v5 registerObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(RouteGeniusSession *)self observers];
  [v5 unregisterObserver:v4];
}

- (PlatformController)platformController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);

  return (PlatformController *)WeakRetained;
}

- (void)setPlatformController:(id)a3
{
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_destroyWeak((id *)&self->_platformController);
}

@end