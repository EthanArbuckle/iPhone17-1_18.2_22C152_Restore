@interface SBSceneManagerSceneHandleWeakRegistry
- (id)existingSceneHandleForSceneIdentity:(id)a3;
- (void)addSceneHandle:(id)a3 forSceneIdentity:(id)a4;
@end

@implementation SBSceneManagerSceneHandleWeakRegistry

- (void)addSceneHandle:(id)a3 forSceneIdentity:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v6)
  {
    sceneHandlesBySceneIdentity = self->_sceneHandlesBySceneIdentity;
    if (!sceneHandlesBySceneIdentity)
    {
      v8 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
      v9 = self->_sceneHandlesBySceneIdentity;
      self->_sceneHandlesBySceneIdentity = v8;

      sceneHandlesBySceneIdentity = self->_sceneHandlesBySceneIdentity;
    }
    [(NSMapTable *)sceneHandlesBySceneIdentity setObject:v10 forKey:v6];
  }
}

- (id)existingSceneHandleForSceneIdentity:(id)a3
{
  return [(NSMapTable *)self->_sceneHandlesBySceneIdentity objectForKey:a3];
}

- (void).cxx_destruct
{
}

@end