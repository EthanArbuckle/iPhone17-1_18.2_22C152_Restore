@interface MFWorkspaceURLRoute
- (BOOL)canRouteRequest:(id)a3;
- (LSApplicationWorkspace)workspace;
- (MFWorkspaceURLRoute)init;
- (MFWorkspaceURLRoute)initWithWorkspace:(id)a3;
- (NSString)ef_publicDescription;
- (id)routeRequest:(id)a3;
- (int64_t)priority;
- (void)setWorkspace:(id)a3;
@end

@implementation MFWorkspaceURLRoute

- (MFWorkspaceURLRoute)init
{
  v3 = +[LSApplicationWorkspace defaultWorkspace];
  v4 = [(MFWorkspaceURLRoute *)self initWithWorkspace:v3];

  return v4;
}

- (MFWorkspaceURLRoute)initWithWorkspace:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFWorkspaceURLRoute;
  v6 = [(MFWorkspaceURLRoute *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_priority = -1;
    objc_storeStrong((id *)&v6->_workspace, a3);
  }

  return v7;
}

- (BOOL)canRouteRequest:(id)a3
{
  return [a3 isExternal] ^ 1;
}

- (id)routeRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(MFWorkspaceURLRoute *)self workspace];
  v6 = [v4 URL];
  id v12 = 0;
  unsigned int v7 = [v5 openSensitiveURL:v6 withOptions:0 error:&v12];
  id v8 = v12;

  if (v7)
  {
    objc_super v9 = +[EFFuture nullFuture];
  }
  else
  {
    if (!v8)
    {
      id v8 = +[NSError ef_notSupportedError];
    }
    v10 = +[NSError mf_routingErrorWithUnderlyingError:v8 request:v4 allowFallbackRouting:0];
    objc_super v9 = +[EFFuture futureWithError:v10];
  }

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

- (LSApplicationWorkspace)workspace
{
  return self->_workspace;
}

- (void)setWorkspace:(id)a3
{
}

- (void).cxx_destruct
{
}

@end