@interface MFOAuthRedirectURLRoute
- (BOOL)canRouteRequest:(id)a3;
- (MFOAuthRedirectURLRoute)init;
- (MFOAuthRedirectURLRoute)initWithRedirectController:(id)a3;
- (NSString)ef_publicDescription;
- (PSOAuthAccountRedirectURLController)redirectController;
- (id)routeRequest:(id)a3;
- (int64_t)priority;
- (void)setRedirectController:(id)a3;
@end

@implementation MFOAuthRedirectURLRoute

- (MFOAuthRedirectURLRoute)init
{
  v3 = +[PSOAuthAccountRedirectURLController sharedInstance];
  v4 = [(MFOAuthRedirectURLRoute *)self initWithRedirectController:v3];

  return v4;
}

- (MFOAuthRedirectURLRoute)initWithRedirectController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFOAuthRedirectURLRoute;
  v6 = [(MFOAuthRedirectURLRoute *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_priority = 1;
    objc_storeStrong((id *)&v6->_redirectController, a3);
  }

  return v7;
}

- (BOOL)canRouteRequest:(id)a3
{
  v3 = [a3 URL];
  unsigned __int8 v4 = [v3 mf_isOAuthRedirectURL];

  return v4;
}

- (id)routeRequest:(id)a3
{
  id v4 = a3;
  id v5 = +[EFPromise promise];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001D425C;
  v11[3] = &unk_100604668;
  v11[4] = self;
  id v6 = v4;
  id v12 = v6;
  id v7 = v5;
  id v13 = v7;
  v8 = +[EFScheduler mainThreadScheduler];
  [v8 performBlock:v11];

  objc_super v9 = [v7 future];

  return v9;
}

- (NSString)ef_publicDescription
{
  return +[NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
}

- (int64_t)priority
{
  return self->_priority;
}

- (PSOAuthAccountRedirectURLController)redirectController
{
  return self->_redirectController;
}

- (void)setRedirectController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end