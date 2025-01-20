@interface _MKQuickRouteManager
- (BOOL)_Car_isPrimaryRefreshQueue;
- (BOOL)_Car_isVisible;
- (BOOL)_Car_shouldDelayOperation;
- (CarQuickRouteRefreshOperation)_Car_refreshOperation;
- (double)_Car_etaAge;
- (void)_Car_cancelUpdateETA;
- (void)_Car_queueUpdateETA;
- (void)set_Car_isVisible:(BOOL)a3;
- (void)set_Car_refreshOperation:(id)a3;
@end

@implementation _MKQuickRouteManager

- (void)set_Car_isVisible:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, "_Car_isVisible", v4, (void *)0x301);
}

- (BOOL)_Car_isVisible
{
  v2 = objc_getAssociatedObject(self, "_Car_isVisible");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)set_Car_refreshOperation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    value = [[WeakWrapper alloc] initWithWeakObject:v4];
  }
  else
  {
    value = 0;
  }
  objc_setAssociatedObject(self, "_Car_refreshOperation", value, (void *)0x301);
}

- (CarQuickRouteRefreshOperation)_Car_refreshOperation
{
  unsigned __int8 v3 = objc_getAssociatedObject(self, "_Car_refreshOperation");
  id v4 = [v3 weakObject];

  if (!v4) {
    objc_setAssociatedObject(self, "_Car_refreshOperation", 0, (void *)0x301);
  }
  v5 = [v3 weakObject];

  return (CarQuickRouteRefreshOperation *)v5;
}

- (BOOL)_Car_isPrimaryRefreshQueue
{
  v2 = [(_MKQuickRouteManager *)self _Car_refreshOperation];
  unsigned __int8 v3 = [v2 operationQueue];
  BOOL v4 = v3 == (void *)qword_10160EC38;

  return v4;
}

- (double)_Car_etaAge
{
  v2 = [(_MKQuickRouteManager *)self routeETAForTransportType:1];
  if (v2)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [v2 responseTime];
    double v5 = Current - v4;
  }
  else
  {
    double v5 = -1.0;
  }

  return v5;
}

- (BOOL)_Car_shouldDelayOperation
{
  if (![(_MKQuickRouteManager *)self _Car_isVisible]) {
    return 1;
  }
  [(_MKQuickRouteManager *)self _Car_etaAge];
  if (v3 >= 60.0) {
    return 0;
  }
  [(_MKQuickRouteManager *)self _Car_etaAge];
  return v4 >= 0.0;
}

- (void)_Car_queueUpdateETA
{
  unsigned int v3 = [(_MKQuickRouteManager *)self _Car_shouldDelayOperation];
  double v4 = [(_MKQuickRouteManager *)self _Car_refreshOperation];

  if (v4)
  {
    unsigned __int8 v5 = [(_MKQuickRouteManager *)self _Car_isPrimaryRefreshQueue];
    if (v3)
    {
      if ((v5 & 1) == 0) {
        return;
      }
    }
    else if (v5)
    {
      return;
    }
    [(_MKQuickRouteManager *)self _Car_cancelUpdateETA];
  }
  v6 = [[CarQuickRouteRefreshOperation alloc] initWithQuickRoute:self];
  v9 = v6;
  uint64_t v7 = 8;
  if (v3) {
    uint64_t v7 = 16;
  }
  [(CarQuickRouteRefreshOperation *)v6 setOperationQueue:*(void *)&byte_10160EC30[v7]];
  [(_MKQuickRouteManager *)self set_Car_refreshOperation:v9];
  v8 = [(CarQuickRouteRefreshOperation *)v9 operationQueue];
  [v8 addOperation:v9];
}

- (void)_Car_cancelUpdateETA
{
  unsigned int v3 = [(_MKQuickRouteManager *)self _Car_refreshOperation];
  [v3 cancel];

  [(_MKQuickRouteManager *)self set_Car_refreshOperation:0];
}

@end