@interface _UISceneConnectionOptionsContext
- (NSDictionary)launchOptionsDictionary;
- (NSSet)unprocessedActions;
- (uint64_t)definitionPayloadStorage;
- (void)_addCleanupBlock:(uint64_t)a1;
- (void)setLaunchOptionsDictionary:(id)a3;
- (void)setUnprocessedActions:(id)a3;
@end

@implementation _UISceneConnectionOptionsContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definitionPayloadStorage, 0);
  objc_storeStrong((id *)&self->_cleanupBlocks, 0);
  objc_storeStrong((id *)&self->_unprocessedActions, 0);
  objc_storeStrong((id *)&self->_launchOptionsDictionary, 0);
}

- (void)setUnprocessedActions:(id)a3
{
}

- (void)setLaunchOptionsDictionary:(id)a3
{
}

- (NSSet)unprocessedActions
{
  return self->_unprocessedActions;
}

- (NSDictionary)launchOptionsDictionary
{
  return self->_launchOptionsDictionary;
}

- (void)_addCleanupBlock:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    id v9 = v3;
    if (v4)
    {
      v5 = _Block_copy(v3);
      [v4 setByAddingObject:v5];
    }
    else
    {
      v7 = (void *)MEMORY[0x1E4F1CAD0];
      v5 = _Block_copy(v3);
      [v7 setWithObject:v5];
    uint64_t v6 = };
    v8 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v6;

    id v3 = v9;
  }
}

- (uint64_t)definitionPayloadStorage
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

@end