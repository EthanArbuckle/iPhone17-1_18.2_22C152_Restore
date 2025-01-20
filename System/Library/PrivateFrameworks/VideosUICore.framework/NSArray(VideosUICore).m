@interface NSArray(VideosUICore)
- (id)vui_arrayByApplyingChangeSet:()VideosUICore destinationObjects:updateObjectBlock:;
- (id)vui_arrayByApplyingChangeSet:()VideosUICore destinationObjectsBlock:updateObjectBlock:;
- (id)vui_arrayByMappingObjectsUsingBlock:()VideosUICore;
- (id)vui_deepCopy;
- (uint64_t)vui_arrayByApplyingChangeSet:()VideosUICore destinationObjects:;
- (uint64_t)vui_arrayByApplyingChangeSet:()VideosUICore destinationObjectsBlock:;
@end

@implementation NSArray(VideosUICore)

- (uint64_t)vui_arrayByApplyingChangeSet:()VideosUICore destinationObjects:
{
  return objc_msgSend(a1, "vui_arrayByApplyingChangeSet:destinationObjects:updateObjectBlock:", a3, a4, 0);
}

- (id)vui_arrayByApplyingChangeSet:()VideosUICore destinationObjects:updateObjectBlock:
{
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__NSArray_VideosUICore__vui_arrayByApplyingChangeSet_destinationObjects_updateObjectBlock___block_invoke;
  v12[3] = &unk_1E6DDD0B0;
  id v13 = v8;
  id v9 = v8;
  v10 = objc_msgSend(a1, "vui_arrayByApplyingChangeSet:destinationObjectsBlock:updateObjectBlock:", a3, v12, a5);

  return v10;
}

- (uint64_t)vui_arrayByApplyingChangeSet:()VideosUICore destinationObjectsBlock:
{
  return objc_msgSend(a1, "vui_arrayByApplyingChangeSet:destinationObjectsBlock:updateObjectBlock:", a3, a4, 0);
}

- (id)vui_arrayByApplyingChangeSet:()VideosUICore destinationObjectsBlock:updateObjectBlock:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[a1 mutableCopy];
  objc_msgSend(v11, "vui_applyChangeSet:destinationObjectsBlock:updateObjectBlock:", v10, v9, v8);

  return v11;
}

- (id)vui_deepCopy
{
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:a1 copyItems:1];
  return v1;
}

- (id)vui_arrayByMappingObjectsUsingBlock:()VideosUICore
{
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __61__NSArray_VideosUICore__vui_arrayByMappingObjectsUsingBlock___block_invoke;
  id v13 = &unk_1E6DDD0D8;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:&v10];
  id v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", v6, v10, v11, v12, v13);

  return v8;
}

@end