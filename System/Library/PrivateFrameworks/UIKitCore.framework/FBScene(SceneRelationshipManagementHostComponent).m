@interface FBScene(SceneRelationshipManagementHostComponent)
- (id)_relationshipManagementHostComponent;
@end

@implementation FBScene(SceneRelationshipManagementHostComponent)

- (id)_relationshipManagementHostComponent
{
  uint64_t v2 = objc_opt_class();
  v3 = [a1 componentForExtension:v2 ofClass:objc_opt_class()];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

@end