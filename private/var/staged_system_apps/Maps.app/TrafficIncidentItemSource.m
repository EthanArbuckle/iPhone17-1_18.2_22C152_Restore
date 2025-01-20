@interface TrafficIncidentItemSource
- (PlatformController)platformController;
- (TrafficIncidentItemSource)init;
- (id)allItems;
- (void)dealloc;
- (void)incidentsSourceManagerDidUpdate;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)setPlatformController:(id)a3;
@end

@implementation TrafficIncidentItemSource

- (void)dealloc
{
  v3 = +[TrafficIncidentsSourceManager sharedInstance];
  [v3 removeObserver:self];

  [(PlatformController *)self->_platformController removeObserver:self];
  v4.receiver = self;
  v4.super_class = (Class)TrafficIncidentItemSource;
  [(TrafficIncidentItemSource *)&v4 dealloc];
}

- (TrafficIncidentItemSource)init
{
  v10.receiver = self;
  v10.super_class = (Class)TrafficIncidentItemSource;
  v2 = [(TrafficIncidentItemSource *)&v10 init];
  if (v2)
  {
    v3 = +[TrafficIncidentsSourceManager sharedInstance];
    [v3 addObserver:v2];

    objc_super v4 = +[UIApplication sharedMapsDelegate];
    v5 = [v4 appSessionController];
    uint64_t v6 = [v5 primaryPlatformController];
    platformController = v2->_platformController;
    v2->_platformController = (PlatformController *)v6;

    [(PlatformController *)v2->_platformController addObserver:v2];
    v8 = v2;
  }

  return v2;
}

- (id)allItems
{
  v2 = [(PlatformController *)self->_platformController currentSession];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_super v4 = &__NSArray0__struct;
  }
  else
  {
    v5 = +[TrafficIncidentsSourceManager sharedInstance];
    objc_super v4 = [v5 cachedIncidentsPersonalizedItems];
  }

  return v4;
}

- (void).cxx_destruct
{
}

- (void)incidentsSourceManagerDidUpdate
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10080D3B0;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  objc_opt_class();
  char v10 = objc_opt_isKindOfClass();

  if (v10 & 1) != 0 || (isKindOfClass)
  {
    [(TrafficIncidentItemSource *)self incidentsSourceManagerDidUpdate];
  }
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (void)setPlatformController:(id)a3
{
}

@end