@interface UISceneLayerTargetFactory
+ (id)targetForContextID:(unsigned int)a3;
+ (id)targetForUIWindow:(id)a3;
@end

@implementation UISceneLayerTargetFactory

+ (id)targetForContextID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!a3)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:a1 file:@"UISceneLayerTarget.m" lineNumber:18 description:@"ContextID cannot be 0."];
  }
  v4 = [_UISceneLayerTargetWithContext alloc];
  v5 = [NSNumber numberWithUnsignedInt:v3];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__UISceneLayerTargetFactory_targetForContextID___block_invoke;
  v11[3] = &__block_descriptor_36_e25_B24__0_8__FBSceneLayer_16l;
  int v12 = v3;
  v6 = [(_UISceneLayerTargetWithContext *)v4 initWithContext:v5 equalityType:1 matchingBlock:v11];

  return v6;
}

BOOL __48__UISceneLayerTargetFactory_targetForContextID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  int v3 = *(_DWORD *)(a1 + 32);
  return v3 == [a3 contextID];
}

+ (id)targetForUIWindow:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"UISceneLayerTarget.m", 28, @"Invalid parameter not satisfying: %@", @"window" object file lineNumber description];
  }
  v6 = [_UISceneLayerTargetWithContext alloc];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__UISceneLayerTargetFactory_targetForUIWindow___block_invoke;
  v11[3] = &unk_1E52EFA38;
  id v12 = v5;
  id v7 = v5;
  v8 = [(_UISceneLayerTargetWithContext *)v6 initWithContext:v7 equalityType:0 matchingBlock:v11];

  return v8;
}

BOOL __47__UISceneLayerTargetFactory_targetForUIWindow___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 type] == 1
    && ([*(id *)(a1 + 32) _contextId] || objc_msgSend(v4, "contextID")))
  {
    int v5 = [*(id *)(a1 + 32) _contextId];
    BOOL v6 = v5 == [v4 contextID];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

@end