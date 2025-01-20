@interface MRDStatusItemController
+ (id)controllerForStatusItemIdentifier:(id)a3;
- (BOOL)isStatusItemActive;
- (MRDStatusItemController)initWithStatusItemIdentifier:(id)a3;
- (NSString)statusItemIdentifier;
- (void)dealloc;
- (void)publishNewData;
- (void)setIsStatusItemActive:(BOOL)a3;
@end

@implementation MRDStatusItemController

+ (id)controllerForStatusItemIdentifier:(id)a3
{
  id v4 = a3;
  if (qword_10047E218 != -1) {
    dispatch_once(&qword_10047E218, &stru_10041D498);
  }
  uint64_t v5 = [(id)qword_10047E220 objectForKeyedSubscript:v4];
  id v6 = (id)v5;
  if (v4 && !v5)
  {
    id v6 = [objc_alloc((Class)a1) initWithStatusItemIdentifier:v4];
    [(id)qword_10047E220 setObject:v6 forKeyedSubscript:v4];
  }

  return v6;
}

- (MRDStatusItemController)initWithStatusItemIdentifier:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MRDStatusItemController;
  uint64_t v5 = [(MRDStatusItemController *)&v14 init];
  if (v5)
  {
    id v6 = (NSString *)[v4 copy];
    statusItemIdentifier = v5->_statusItemIdentifier;
    v5->_statusItemIdentifier = v6;

    v8 = (STStatusItemsStatusDomainPublisher *)objc_alloc_init((Class)STStatusItemsStatusDomainPublisher);
    publisher = v5->_publisher;
    v5->_publisher = v8;

    v10 = v5->_publisher;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100114CA0;
    v12[3] = &unk_10041D4C0;
    id v13 = v4;
    [(STStatusItemsStatusDomainPublisher *)v10 handleUserInteractionsWithBlock:v12];
  }
  return v5;
}

- (void)dealloc
{
  [(STStatusItemsStatusDomainPublisher *)self->_publisher invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MRDStatusItemController;
  [(MRDStatusItemController *)&v3 dealloc];
}

- (void)setIsStatusItemActive:(BOOL)a3
{
  if (self->_statusItemActive != a3)
  {
    self->_statusItemActive = a3;
    [(MRDStatusItemController *)self publishNewData];
  }
}

- (void)publishNewData
{
  objc_super v3 = self->_currentAttribution;
  if (self->_statusItemActive)
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

    id v6 = [objc_alloc((Class)STStatusItemsStatusDomainStatusItemAttribution) initWithStatusItemIdentifier:self->_statusItemIdentifier activityAttribution:v7];
  }
  else
  {
    id v6 = 0;
  }
  objc_initWeak(&location, self);
  publisher = self->_publisher;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100114FF8;
  v15[3] = &unk_10041D4E8;
  v9 = v3;
  v16 = v9;
  id v10 = v6;
  id v17 = v10;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100115078;
  v12[3] = &unk_1004182A8;
  objc_copyWeak(&v14, &location);
  id v11 = v10;
  id v13 = v11;
  [(STStatusItemsStatusDomainPublisher *)publisher updateVolatileData:v15 completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (BOOL)isStatusItemActive
{
  return self->_statusItemActive;
}

- (NSString)statusItemIdentifier
{
  return self->_statusItemIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusItemIdentifier, 0);
  objc_storeStrong((id *)&self->_publisher, 0);

  objc_storeStrong((id *)&self->_currentAttribution, 0);
}

@end