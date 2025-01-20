@interface UISceneRelationshipManagementHostComponent
@end

@implementation UISceneRelationshipManagementHostComponent

void __79___UISceneRelationshipManagementHostComponent__scenePresenterIsMovingToWindow___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2) {
    [WeakRetained notifyObserversOfParentChange:v2];
  }
}

@end