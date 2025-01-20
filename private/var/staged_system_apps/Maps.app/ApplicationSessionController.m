@interface ApplicationSessionController
- (ApplicationSessionController)init;
- (CoverSheetSceneAssociation)currentlyNavigatingCoverSheetSceneAssociation;
- (NSMapTable)activeiOSPlatformControllersToCoverSheetSceneAssociation;
- (PlatformController)currentlyNavigatingPlatformController;
- (PlatformController)primaryPlatformController;
- (id)addActiveiOSPlatformControllerForScene:(id)a3;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)removeiOSPlatformController:(id)a3;
- (void)setActiveiOSPlatformControllersToCoverSheetSceneAssociation:(id)a3;
- (void)setCurrentlyNavigatingPlatformController:(id)a3;
@end

@implementation ApplicationSessionController

- (ApplicationSessionController)init
{
  v8.receiver = self;
  v8.super_class = (Class)ApplicationSessionController;
  v2 = [(ApplicationSessionController *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMapTable strongToStrongObjectsMapTable];
    activeiOSPlatformControllersToCoverSheetSceneAssociation = v2->_activeiOSPlatformControllersToCoverSheetSceneAssociation;
    v2->_activeiOSPlatformControllersToCoverSheetSceneAssociation = (NSMapTable *)v3;

    v5 = objc_alloc_init(PlatformController);
    primaryPlatformController = v2->_primaryPlatformController;
    v2->_primaryPlatformController = v5;

    [v2->_primaryPlatformController setIsPrimary:1];
    [v2->_primaryPlatformController addObserver:v2];
  }
  return v2;
}

- (id)addActiveiOSPlatformControllerForScene:(id)a3
{
  id v4 = a3;
  v5 = [(ApplicationSessionController *)self activeiOSPlatformControllersToCoverSheetSceneAssociation];
  id v6 = [v5 count];

  if (v6)
  {
    v7 = objc_alloc_init(PlatformController);
    [(PlatformController *)v7 addObserver:self];
  }
  else
  {
    v7 = [(ApplicationSessionController *)self primaryPlatformController];
  }
  objc_super v8 = [[CoverSheetSceneAssociation alloc] initWithMapsScene:v4];

  v9 = [(ApplicationSessionController *)self activeiOSPlatformControllersToCoverSheetSceneAssociation];
  [v9 setObject:v8 forKey:v7];

  return v7;
}

- (NSMapTable)activeiOSPlatformControllersToCoverSheetSceneAssociation
{
  return self->_activeiOSPlatformControllersToCoverSheetSceneAssociation;
}

- (PlatformController)primaryPlatformController
{
  return self->_primaryPlatformController;
}

- (PlatformController)currentlyNavigatingPlatformController
{
  return self->_currentlyNavigatingPlatformController;
}

- (CoverSheetSceneAssociation)currentlyNavigatingCoverSheetSceneAssociation
{
  uint64_t v3 = [(ApplicationSessionController *)self activeiOSPlatformControllersToCoverSheetSceneAssociation];
  id v4 = [(ApplicationSessionController *)self currentlyNavigatingPlatformController];
  v5 = [v3 objectForKey:v4];

  return (CoverSheetSceneAssociation *)v5;
}

- (void)setCurrentlyNavigatingPlatformController:(id)a3
{
  v5 = (PlatformController *)a3;
  currentlyNavigatingPlatformController = self->_currentlyNavigatingPlatformController;
  p_currentlyNavigatingPlatformController = &self->_currentlyNavigatingPlatformController;
  if (currentlyNavigatingPlatformController != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)p_currentlyNavigatingPlatformController, a3);
    objc_super v8 = +[UIApplication sharedMapsDelegate];
    [v8 acquireSecureAppAssertionIfNeeded];

    v5 = v9;
  }
}

- (void)removeiOSPlatformController:(id)a3
{
  id v7 = a3;
  id v4 = [(ApplicationSessionController *)self activeiOSPlatformControllersToCoverSheetSceneAssociation];
  [v4 removeObjectForKey:v7];

  id v5 = [(ApplicationSessionController *)self primaryPlatformController];

  id v6 = v7;
  if (v5 != v7)
  {
    [v7 removeObserver:self];
    id v6 = v7;
  }
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v9)
  {
    id v11 = v14;
    if (isKindOfClass) {
      goto LABEL_6;
    }
  }
  id v12 = v8;
  objc_opt_class();
  char v13 = objc_opt_isKindOfClass();

  if (v12 && (v13 & 1) != 0)
  {
    id v11 = 0;
LABEL_6:
    [(ApplicationSessionController *)self setCurrentlyNavigatingPlatformController:v11];
  }
}

- (void)setActiveiOSPlatformControllersToCoverSheetSceneAssociation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeiOSPlatformControllersToCoverSheetSceneAssociation, 0);
  objc_storeStrong((id *)&self->_currentlyNavigatingPlatformController, 0);

  objc_storeStrong((id *)&self->_primaryPlatformController, 0);
}

@end