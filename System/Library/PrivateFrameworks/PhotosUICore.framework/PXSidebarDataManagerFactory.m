@interface PXSidebarDataManagerFactory
+ (id)makeTopCollectionsDataSectionManagerWithLibrary:(id)a3;
+ (id)makeUtilityTypesDataSectionManagerWithLibrary:(id)a3 forPicker:(BOOL)a4;
- (PXSidebarDataManagerFactory)init;
@end

@implementation PXSidebarDataManagerFactory

+ (id)makeUtilityTypesDataSectionManagerWithLibrary:(id)a3 forPicker:(BOOL)a4
{
}

+ (id)makeTopCollectionsDataSectionManagerWithLibrary:(id)a3
{
}

- (PXSidebarDataManagerFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXSidebarDataManagerFactory;
  return [(PXSidebarDataManagerFactory *)&v3 init];
}

@end