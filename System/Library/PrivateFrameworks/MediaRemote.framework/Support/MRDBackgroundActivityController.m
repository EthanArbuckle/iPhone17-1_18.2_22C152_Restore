@interface MRDBackgroundActivityController
+ (id)controllerForBackgroundActivityIdentifier:(id)a3;
- (BOOL)isBackgroundActivityActive;
- (BOOL)shouldShowInForeground;
- (MRDBackgroundActivityController)initWithBackgroundActivityIdentifier:(id)a3;
- (NSString)backgroundActivityIdentifier;
- (void)dealloc;
- (void)handleUserInteractionsWithBlock:(id)a3;
- (void)publishNewData;
- (void)setIsBackgroundActivityActive:(BOOL)a3;
- (void)setShouldShowInForeground:(BOOL)a3;
@end

@implementation MRDBackgroundActivityController

+ (id)controllerForBackgroundActivityIdentifier:(id)a3
{
  id v4 = a3;
  if (qword_10047E008 != -1) {
    dispatch_once(&qword_10047E008, &stru_100418FE8);
  }
  uint64_t v5 = [(id)qword_10047E010 objectForKeyedSubscript:v4];
  id v6 = (id)v5;
  if (v4 && !v5)
  {
    id v6 = [objc_alloc((Class)a1) initWithBackgroundActivityIdentifier:v4];
    [(id)qword_10047E010 setObject:v6 forKeyedSubscript:v4];
  }

  return v6;
}

- (MRDBackgroundActivityController)initWithBackgroundActivityIdentifier:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MRDBackgroundActivityController;
  uint64_t v5 = [(MRDBackgroundActivityController *)&v14 init];
  if (v5)
  {
    id v6 = (NSString *)[v4 copy];
    backgroundActivityIdentifier = v5->_backgroundActivityIdentifier;
    v5->_backgroundActivityIdentifier = v6;

    v8 = (STBackgroundActivitiesStatusDomainPublisher *)objc_alloc_init((Class)STBackgroundActivitiesStatusDomainPublisher);
    publisher = v5->_publisher;
    v5->_publisher = v8;

    v5->_shouldShowInForeground = 1;
    v10 = v5->_publisher;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000803FC;
    v12[3] = &unk_100419010;
    v13 = v5;
    [(STBackgroundActivitiesStatusDomainPublisher *)v10 handleUserInteractionsWithBlock:v12];
  }
  return v5;
}

- (void)dealloc
{
  [(STBackgroundActivitiesStatusDomainPublisher *)self->_publisher invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MRDBackgroundActivityController;
  [(MRDBackgroundActivityController *)&v3 dealloc];
}

- (void)setShouldShowInForeground:(BOOL)a3
{
  if (self->_shouldShowInForeground != a3)
  {
    self->_shouldShowInForeground = a3;
    [(MRDBackgroundActivityController *)self publishNewData];
  }
}

- (void)setIsBackgroundActivityActive:(BOOL)a3
{
  if (self->_backgroundActivityActive != a3)
  {
    self->_backgroundActivityActive = a3;
    [(MRDBackgroundActivityController *)self publishNewData];
  }
}

- (void)handleUserInteractionsWithBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  publisher = self->_publisher;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100080658;
  v7[3] = &unk_100419038;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(STBackgroundActivitiesStatusDomainPublisher *)publisher handleUserInteractionsWithBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)publishNewData
{
  objc_super v3 = self->_currentAttribution;
  if (self->_backgroundActivityActive)
  {
    id v4 = +[BSAuditToken tokenForCurrentProcess];
    uint64_t v5 = v4;
    if (v4) {
      [v4 realToken];
    }
    else {
      memset(v19, 0, sizeof(v19));
    }
    v7 = +[STActivityAttribution attributionWithAuditToken:v19];

    id v6 = [objc_alloc((Class)STBackgroundActivitiesStatusDomainBackgroundActivityAttribution) initWithBackgroundActivityIdentifier:self->_backgroundActivityIdentifier activityAttribution:v7 showsWhenForeground:self->_shouldShowInForeground];
  }
  else
  {
    id v6 = 0;
  }
  objc_initWeak(&location, self);
  publisher = self->_publisher;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008098C;
  v15[3] = &unk_100419060;
  id v9 = v3;
  v16 = v9;
  id v10 = v6;
  id v17 = v10;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100080A0C;
  v12[3] = &unk_1004182A8;
  objc_copyWeak(&v14, &location);
  id v11 = v10;
  id v13 = v11;
  [(STBackgroundActivitiesStatusDomainPublisher *)publisher updateVolatileData:v15 completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (NSString)backgroundActivityIdentifier
{
  return self->_backgroundActivityIdentifier;
}

- (BOOL)isBackgroundActivityActive
{
  return self->_backgroundActivityActive;
}

- (BOOL)shouldShowInForeground
{
  return self->_shouldShowInForeground;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_publisher, 0);

  objc_storeStrong((id *)&self->_currentAttribution, 0);
}

@end