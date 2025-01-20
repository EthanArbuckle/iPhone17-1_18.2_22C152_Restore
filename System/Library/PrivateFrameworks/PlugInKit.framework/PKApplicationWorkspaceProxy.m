@interface PKApplicationWorkspaceProxy
+ (id)defaultWorkspace;
- (BOOL)registerPlugin:(id)a3;
- (BOOL)unregisterPlugin:(id)a3;
- (LSApplicationWorkspace)lsObject;
- (PKApplicationWorkspaceProxy)init;
- (id)installedPlugins;
- (id)pluginsMatchingQuery:(id)a3 applyFilter:(id)a4;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation PKApplicationWorkspaceProxy

- (PKApplicationWorkspaceProxy)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKApplicationWorkspaceProxy;
  v2 = [(PKApplicationWorkspaceProxy *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    lsObject = v2->_lsObject;
    v2->_lsObject = (LSApplicationWorkspace *)v3;
  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v6 = a3;
  v4 = (void *)MEMORY[0x1B3EBB4E0]();
  v5 = [(PKApplicationWorkspaceProxy *)self lsObject];
  [v5 addObserver:v6];
}

- (LSApplicationWorkspace)lsObject
{
  return self->_lsObject;
}

+ (id)defaultWorkspace
{
  if (qword_1EB2BE100 != -1) {
    dispatch_once(&qword_1EB2BE100, &unk_1F0C154F0);
  }
  v2 = (void *)qword_1EB2BE0F8;
  return v2;
}

- (id)installedPlugins
{
  v2 = [(PKApplicationWorkspaceProxy *)self lsObject];
  uint64_t v3 = [v2 installedPlugins];

  return v3;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PKApplicationWorkspaceProxy *)self lsObject];
  [v5 removeObserver:v4];
}

- (id)pluginsMatchingQuery:(id)a3 applyFilter:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PKApplicationWorkspaceProxy *)self lsObject];
  v9 = [v8 pluginsMatchingQuery:v7 applyFilter:v6];

  return v9;
}

- (BOOL)registerPlugin:(id)a3
{
  id v4 = a3;
  id v5 = [(PKApplicationWorkspaceProxy *)self lsObject];
  char v6 = [v5 registerPlugin:v4];

  return v6;
}

- (BOOL)unregisterPlugin:(id)a3
{
  id v4 = a3;
  id v5 = [(PKApplicationWorkspaceProxy *)self lsObject];
  char v6 = [v5 unregisterPlugin:v4];

  return v6;
}

- (void).cxx_destruct
{
}

@end