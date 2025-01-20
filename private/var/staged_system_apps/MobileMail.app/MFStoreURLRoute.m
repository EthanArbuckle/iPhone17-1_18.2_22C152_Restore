@interface MFStoreURLRoute
- (BOOL)canRouteRequest:(id)a3;
- (Class)storeClass;
- (MFStoreURLRoute)initWithPresenterProvider:(id)a3;
- (MFStoreURLRoute)initWithPresenterProvider:(id)a3 storeControllerClass:(Class)a4;
- (NSString)ef_publicDescription;
- (id)presenterProvider;
- (id)routeRequest:(id)a3;
- (int64_t)priority;
- (void)setPresenterProvider:(id)a3;
- (void)setStoreClass:(Class)a3;
@end

@implementation MFStoreURLRoute

- (MFStoreURLRoute)initWithPresenterProvider:(id)a3
{
  id v4 = a3;
  v5 = [(MFStoreURLRoute *)self initWithPresenterProvider:v4 storeControllerClass:objc_opt_class()];

  return v5;
}

- (MFStoreURLRoute)initWithPresenterProvider:(id)a3 storeControllerClass:(Class)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFStoreURLRoute;
  v7 = [(MFStoreURLRoute *)&v11 init];
  if (v7)
  {
    id v8 = objc_retainBlock(v6);
    id presenterProvider = v7->_presenterProvider;
    v7->_id presenterProvider = v8;

    v7->_storeClass = a4;
    v7->_priority = 1;
  }

  return v7;
}

- (BOOL)canRouteRequest:(id)a3
{
  return _[a3 isPossibleStoreURL];
}

- (id)routeRequest:(id)a3
{
  id v4 = a3;
  +[EFPromise promise];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001E7108;
  v10[3] = &unk_100604668;
  v10[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v5;
  id v6 = v4;
  id v12 = v6;
  v7 = +[EFScheduler mainThreadScheduler];
  [v7 performBlock:v10];

  id v8 = [v5 future];

  return v8;
}

- (NSString)ef_publicDescription
{
  return +[NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
}

- (int64_t)priority
{
  return self->_priority;
}

- (id)presenterProvider
{
  return self->_presenterProvider;
}

- (void)setPresenterProvider:(id)a3
{
}

- (Class)storeClass
{
  return self->_storeClass;
}

- (void)setStoreClass:(Class)a3
{
  self->_storeClass = a3;
}

- (void).cxx_destruct
{
}

@end