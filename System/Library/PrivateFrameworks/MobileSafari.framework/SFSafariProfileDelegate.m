@interface SFSafariProfileDelegate
- (SFSafariProfileDelegate)initWithDataSource:(id)a3;
- (id)sfWebExtensionsController:(id)a3 forProfileServerID:(id)a4;
- (id)sfWebExtensionsControllerAllProfileExtensionsControllers:(id)a3;
- (id)sfWebExtensionsControllerContentBlockerManager:(id)a3 forProfileServerID:(id)a4;
- (id)sfWebExtensionsControllerTabGroupManager:(id)a3;
- (id)sfWebExtensionsControllersContentBlockerManagersForAllProfiles:(id)a3;
- (id)sfWebExtensionsControllersForAllProfiles:(id)a3;
- (void)enumerateContentBlockerManagersUsingBlock:(id)a3;
@end

@implementation SFSafariProfileDelegate

- (SFSafariProfileDelegate)initWithDataSource:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFSafariProfileDelegate;
  v6 = [(SFSafariProfileDelegate *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    v8 = v7;
  }

  return v7;
}

- (id)sfWebExtensionsControllerTabGroupManager:(id)a3
{
  v3 = [(SFExtensionsProfilesDataSource *)self->_dataSource tabGroupManager];

  return v3;
}

- (id)sfWebExtensionsControllerAllProfileExtensionsControllers:(id)a3
{
  v3 = [(SFExtensionsProfilesDataSource *)self->_dataSource profileServerIDToWebExtensionsControllers];
  v4 = [v3 allValues];

  return v4;
}

- (id)sfWebExtensionsController:(id)a3 forProfileServerID:(id)a4
{
  id v5 = a4;
  v6 = [(SFExtensionsProfilesDataSource *)self->_dataSource profileServerIDToWebExtensionsControllers];
  v7 = [v6 objectForKeyedSubscript:v5];

  return v7;
}

- (id)sfWebExtensionsControllerContentBlockerManager:(id)a3 forProfileServerID:(id)a4
{
  id v5 = a4;
  v6 = [(SFExtensionsProfilesDataSource *)self->_dataSource profileServerIDToContentBlockerManagers];
  v7 = [v6 objectForKeyedSubscript:v5];

  return v7;
}

- (id)sfWebExtensionsControllersForAllProfiles:(id)a3
{
  v3 = [(SFExtensionsProfilesDataSource *)self->_dataSource profileServerIDToWebExtensionsControllers];
  v4 = [v3 allValues];

  return v4;
}

- (id)sfWebExtensionsControllersContentBlockerManagersForAllProfiles:(id)a3
{
  v3 = [(SFExtensionsProfilesDataSource *)self->_dataSource profileServerIDToContentBlockerManagers];
  v4 = [v3 allValues];

  return v4;
}

- (void)enumerateContentBlockerManagersUsingBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void, char *))a3;
  char v14 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(SFExtensionsProfilesDataSource *)self->_dataSource profileServerIDToContentBlockerManagers];
  v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v6);
      }
      v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9), &v14);
      if (v14) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end