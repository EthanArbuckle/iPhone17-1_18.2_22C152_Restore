@interface WBSWebProcessPlugIn
- (BOOL)isABTestingEnabled;
- (NSArray)searchEnginesForRedirectToSafeSearch;
- (WBSSearchProvider)defaultSearchProvider;
- (WKWebProcessPlugInController)plugInController;
- (id)pageControllerWithBrowserContextController:(id)a3;
- (unint64_t)abGroupIdentifier;
- (void)webProcessPlugIn:(id)a3 didCreateBrowserContextController:(id)a4;
- (void)webProcessPlugIn:(id)a3 initializeWithObject:(id)a4;
- (void)webProcessPlugIn:(id)a3 willDestroyBrowserContextController:(id)a4;
@end

@implementation WBSWebProcessPlugIn

- (WKWebProcessPlugInController)plugInController
{
  return self->_plugInController;
}

- (void)webProcessPlugIn:(id)a3 initializeWithObject:(id)a4
{
  objc_storeStrong((id *)&self->_plugInController, a3);
  id v8 = a3;
  v6 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  browserContextControllersToWebProcessPlugInPageControllers = self->_browserContextControllersToWebProcessPlugInPageControllers;
  self->_browserContextControllersToWebProcessPlugInPageControllers = v6;
}

- (void)webProcessPlugIn:(id)a3 didCreateBrowserContextController:(id)a4
{
  id v5 = a4;
  id v6 = [(WBSWebProcessPlugIn *)self pageControllerWithBrowserContextController:v5];
  [(NSMapTable *)self->_browserContextControllersToWebProcessPlugInPageControllers setObject:v6 forKey:v5];
  [(WBSWebProcessPlugIn *)self didCreatePageController:v6 forBrowserContextController:v5];
}

- (NSArray)searchEnginesForRedirectToSafeSearch
{
  v2 = [(WKWebProcessPlugInController *)self->_plugInController parameters];
  v3 = [v2 valueForKey:@"searchEnginesForRedirectToSafeSearch"];

  return (NSArray *)v3;
}

- (WBSSearchProvider)defaultSearchProvider
{
  v2 = [(WKWebProcessPlugInController *)self->_plugInController parameters];
  v3 = [v2 valueForKey:@"defaultSearchEngine"];

  return (WBSSearchProvider *)v3;
}

- (BOOL)isABTestingEnabled
{
  v2 = [(WKWebProcessPlugInController *)self->_plugInController parameters];
  v3 = [v2 valueForKey:@"abTestingEnabled"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (unint64_t)abGroupIdentifier
{
  v2 = [(WKWebProcessPlugInController *)self->_plugInController parameters];
  v3 = [v2 valueForKey:@"abGroupIdentifier"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (id)pageControllerWithBrowserContextController:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 _groupIdentifier];
  }
  else
  {
    id v6 = [v4 pageGroup];
    id v5 = [v6 identifier];
  }
  int v7 = [v5 isEqualToString:@"TouchIconExtractor"];
  id v8 = off_1E5E3FD88;
  if (!v7) {
    id v8 = &off_1E5E3FE48;
  }
  v9 = (void *)[objc_alloc(*v8) initWithPlugIn:self contextController:v4];

  return v9;
}

- (void)webProcessPlugIn:(id)a3 willDestroyBrowserContextController:(id)a4
{
  browserContextControllersToWebProcessPlugInPageControllers = self->_browserContextControllersToWebProcessPlugInPageControllers;
  id v6 = a4;
  id v7 = [(NSMapTable *)browserContextControllersToWebProcessPlugInPageControllers objectForKey:v6];
  [v7 willDestroyBrowserContextController:v6];
  [(WBSWebProcessPlugIn *)self willDestroyPageController:v7 forBrowserContextController:v6];
  [(NSMapTable *)self->_browserContextControllersToWebProcessPlugInPageControllers removeObjectForKey:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plugInController, 0);
  objc_storeStrong((id *)&self->_browserContextControllersToWebProcessPlugInPageControllers, 0);
}

@end