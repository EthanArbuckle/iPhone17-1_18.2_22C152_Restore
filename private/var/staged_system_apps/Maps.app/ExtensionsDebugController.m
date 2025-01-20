@interface ExtensionsDebugController
+ (id)navigationDestinationTitle;
- (NSDictionary)extensions;
- (_MXExtensionManager)extManager;
- (void)_addSectionWithMapsExtensionPointName:(id)a3;
- (void)prepareContent;
- (void)setExtManager:(id)a3;
- (void)setExtensions:(id)a3;
@end

@implementation ExtensionsDebugController

- (void)prepareContent
{
  id v3 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Restaurant Reservations" content:&stru_101316800];
  id v4 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Car Extension" content:&stru_101316820];
  if (!self->_extManager)
  {
    objc_initWeak(&location, self);
    v5 = +[_MXExtensionManager _lookupPolicyForAllExtensions];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100AB9CE8;
    v10[3] = &unk_1012E6E78;
    objc_copyWeak(&v11, &location);
    v6 = +[_MXExtensionManager managerWithExtensionLookupPolicy:v5 updateHandler:v10];
    extManager = self->_extManager;
    self->_extManager = v6;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  if (self->_extensions)
  {
    v13[0] = kMapsExtensionPointNameServices;
    v13[1] = kMapsExtensionPointNameServicesUI;
    v8 = +[NSArray arrayWithObjects:v13 count:2];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100AB9F60;
    v9[3] = &unk_101316870;
    v9[4] = self;
    [v8 enumerateObjectsUsingBlock:v9];
  }
}

- (void)_addSectionWithMapsExtensionPointName:(id)a3
{
  id v4 = a3;
  v5 = [(NSDictionary *)self->_extensions objectForKeyedSubscript:v4];

  if (v5)
  {
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100ABA080;
    v7[3] = &unk_1012EE3E8;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    id v6 = [(MapsDebugValuesViewController *)self addSectionWithTitle:v8 content:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)setExtensions:(id)a3
{
  objc_storeStrong((id *)&self->_extensions, a3);

  [(MapsDebugValuesViewController *)self rebuildSections];
}

+ (id)navigationDestinationTitle
{
  return @"Maps Extensions";
}

- (NSDictionary)extensions
{
  return self->_extensions;
}

- (_MXExtensionManager)extManager
{
  return self->_extManager;
}

- (void)setExtManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extManager, 0);

  objc_storeStrong((id *)&self->_extensions, 0);
}

@end