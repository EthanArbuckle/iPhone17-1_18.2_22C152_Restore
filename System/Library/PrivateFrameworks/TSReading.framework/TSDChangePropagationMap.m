@interface TSDChangePropagationMap
- (BOOL)hasAnyChangesForPrototypesOfClasses:(id)a3;
- (TSDChangePropagationMap)init;
- (id)prototypeChangeForPrototype:(id)a3;
- (id)prototypePassingTest:(id)a3;
- (void)dealloc;
- (void)p_addClassesForPrototype:(id)a3;
- (void)recordDeleteChangeForPrototype:(id)a3 replacement:(id)a4;
- (void)recordModifyChangeForPrototype:(id)a3 property:(int)a4 oldBoxedValue:(id)a5 newBoxedValue:(id)a6;
- (void)recordNewValueForModifyChangeForPrototype:(id)a3 property:(int)a4 newBoxedValue:(id)a5;
- (void)recordOldValueForModifyChangeForPrototype:(id)a3 property:(int)a4 oldBoxedValue:(id)a5;
- (void)recordReplacementChangeForPrototype:(id)a3 replacement:(id)a4;
@end

@implementation TSDChangePropagationMap

- (TSDChangePropagationMap)init
{
  v4.receiver = self;
  v4.super_class = (Class)TSDChangePropagationMap;
  v2 = [(TSDChangePropagationMap *)&v4 init];
  if (v2)
  {
    v2->mDictionary = (TSUNoCopyDictionary *)objc_alloc_init(MEMORY[0x263F7C880]);
    v2->mClassesOfChangedPrototypes = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDChangePropagationMap;
  [(TSDChangePropagationMap *)&v3 dealloc];
}

- (void)recordReplacementChangeForPrototype:(id)a3 replacement:(id)a4
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSDChangePropagationMap recordReplacementChangeForPrototype:replacement:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDChangePropagationMap.m"), 44, @"invalid nil value for '%s'", "replacement");
    if (!a3) {
      return;
    }
    goto LABEL_7;
  }
  v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v8 = [NSString stringWithUTF8String:"-[TSDChangePropagationMap recordReplacementChangeForPrototype:replacement:]"];
  objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDChangePropagationMap.m"), 43, @"invalid nil value for '%s'", "prototype");
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  if (!a3) {
    return;
  }
LABEL_7:
  [(TSDChangePropagationMap *)self p_addClassesForPrototype:a3];
  v11 = (void *)[(TSUNoCopyDictionary *)self->mDictionary objectForKey:a3];
  if (v11)
  {
    v12 = v11;
    if (![v11 prototypeIsBeingReplaced]
      || ([v12 prototypeIsBeingDeleted] & 1) != 0
      || (id)[v12 replacement] != a4)
    {
      v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v14 = [NSString stringWithUTF8String:"-[TSDChangePropagationMap recordReplacementChangeForPrototype:replacement:]"];
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDChangePropagationMap.m"), 53, @"already have a prototypeChange for %@; can't combine replacement changes with any other changes",
        a3);
    }
  }
  else
  {
    id v15 = [[TSDReplaceDeletePrototypeChange alloc] initReplacePrototypeChangeForPrototype:a3 toReplacement:a4];
    [(TSUNoCopyDictionary *)self->mDictionary setObject:v15 forUncopiedKey:a3];
  }
}

- (void)recordModifyChangeForPrototype:(id)a3 property:(int)a4 oldBoxedValue:(id)a5 newBoxedValue:(id)a6
{
  if (a3)
  {
    uint64_t v7 = *(void *)&a4;
    [(TSDChangePropagationMap *)self recordOldValueForModifyChangeForPrototype:a3 property:*(void *)&a4 oldBoxedValue:a5];
    [(TSDChangePropagationMap *)self recordNewValueForModifyChangeForPrototype:a3 property:v7 newBoxedValue:a6];
  }
  else
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", 0, *(void *)&a4, a5, a6);
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSDChangePropagationMap recordModifyChangeForPrototype:property:oldBoxedValue:newBoxedValue:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDChangePropagationMap.m"), 68, @"invalid nil value for '%s'", "prototype");
  }
}

- (void)recordOldValueForModifyChangeForPrototype:(id)a3 property:(int)a4 oldBoxedValue:(id)a5
{
  if (a3)
  {
    uint64_t v6 = *(void *)&a4;
    -[TSDChangePropagationMap p_addClassesForPrototype:](self, "p_addClassesForPrototype:");
    v9 = (void *)[(TSUNoCopyDictionary *)self->mDictionary objectForKey:a3];
    if (v9)
    {
      id v10 = v9;
      if (([v9 prototypeIsBeingModified] & 1) == 0)
      {
        uint64_t v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v12 = [NSString stringWithUTF8String:"-[TSDChangePropagationMap recordOldValueForModifyChangeForPrototype:property:oldBoxedValue:]"];
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDChangePropagationMap.m"), 100, @"can only combine modification changes");
      }
    }
    else
    {
      id v10 = [[TSDModifyPrototypeChange alloc] initModifyPrototypeChangeForPrototype:a3];
      [(TSUNoCopyDictionary *)self->mDictionary setObject:v10 forUncopiedKey:a3];
    }
    if ((objc_msgSend((id)objc_msgSend(v10, "changedPropertySet"), "containsProperty:", v6) & 1) == 0)
    {
      objc_msgSend((id)objc_msgSend(v10, "changedPropertySet"), "addProperty:", v6);
      objc_msgSend((id)objc_msgSend(v10, "i_propertiesWithOldValuesRecordedButNotNewValues"), "addProperty:", v6);
      if (a5)
      {
        id v15 = (void *)[v10 changedPropertyMapBeforeChange];
        [v15 setBoxedObject:a5 forProperty:v6];
      }
    }
  }
  else
  {
    v13 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", 0, *(void *)&a4, a5);
    uint64_t v14 = [NSString stringWithUTF8String:"-[TSDChangePropagationMap recordOldValueForModifyChangeForPrototype:property:oldBoxedValue:]"];
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDChangePropagationMap.m"), 84, @"invalid nil value for '%s'", "prototype");
  }
}

- (void)recordNewValueForModifyChangeForPrototype:(id)a3 property:(int)a4 newBoxedValue:(id)a5
{
  if (a3)
  {
    uint64_t v6 = *(void *)&a4;
    uint64_t v7 = (void *)-[TSUNoCopyDictionary objectForKey:](self->mDictionary, "objectForKey:");
    uint64_t v8 = v7;
    if (!v7 || (objc_msgSend((id)objc_msgSend(v7, "changedPropertySet"), "containsProperty:", v6) & 1) == 0)
    {
      v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v10 = [NSString stringWithUTF8String:"-[TSDChangePropagationMap recordNewValueForModifyChangeForPrototype:property:newBoxedValue:]"];
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDChangePropagationMap.m"), 125, @"must record an old value before recording a new value");
    }
    objc_msgSend((id)objc_msgSend(v8, "i_propertiesWithOldValuesRecordedButNotNewValues"), "removeProperty:", v6);
    if (a5)
    {
      uint64_t v11 = (void *)[v8 changedPropertyMapAfterChange];
      [v11 setBoxedObject:a5 forProperty:v6];
    }
  }
  else
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", 0, *(void *)&a4, a5);
    uint64_t v13 = [NSString stringWithUTF8String:"-[TSDChangePropagationMap recordNewValueForModifyChangeForPrototype:property:newBoxedValue:]"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDChangePropagationMap.m"), 117, @"invalid nil value for '%s'", "prototype");
  }
}

- (void)recordDeleteChangeForPrototype:(id)a3 replacement:(id)a4
{
  if (a3)
  {
    uint64_t v7 = (void *)-[TSUNoCopyDictionary objectForKey:](self->mDictionary, "objectForKey:");
    if (v7)
    {
      uint64_t v8 = v7;
      if (![v7 prototypeIsBeingDeleted] || (id)objc_msgSend(v8, "replacement") != a4)
      {
        v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v10 = [NSString stringWithUTF8String:"-[TSDChangePropagationMap recordDeleteChangeForPrototype:replacement:]"];
        objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDChangePropagationMap.m"), 144, @"already have a prototypeChange for %@; can't combine delete changes with any other changes",
          a3);
      }
    }
    else
    {
      [(TSDChangePropagationMap *)self p_addClassesForPrototype:a3];
      id v13 = [[TSDReplaceDeletePrototypeChange alloc] initDeletePrototypeChangeForPrototype:a3 replacement:a4];
      [(TSUNoCopyDictionary *)self->mDictionary setObject:v13 forUncopiedKey:a3];
    }
  }
  else
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", 0, a4);
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSDChangePropagationMap recordDeleteChangeForPrototype:replacement:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDChangePropagationMap.m"), 136, @"invalid nil value for '%s'", "prototype");
  }
}

- (BOOL)hasAnyChangesForPrototypesOfClasses:(id)a3
{
  mClassesOfChangedPrototypes = self->mClassesOfChangedPrototypes;
  uint64_t v4 = [MEMORY[0x263EFFA08] setWithArray:a3];

  return [(NSMutableSet *)mClassesOfChangedPrototypes intersectsSet:v4];
}

- (void)p_addClassesForPrototype:(id)a3
{
  for (i = objc_opt_class(); i != objc_opt_class(); i = (void *)[i superclass])
    [(NSMutableSet *)self->mClassesOfChangedPrototypes addObject:i];
}

- (id)prototypeChangeForPrototype:(id)a3
{
  objc_super v3 = (void *)[(TSUNoCopyDictionary *)self->mDictionary objectForKey:a3];
  objc_opt_class();
  uint64_t v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    v5 = v4;
    if (objc_msgSend((id)objc_msgSend(v4, "i_propertiesWithOldValuesRecordedButNotNewValues"), "count"))
    {
      uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[TSDChangePropagationMap prototypeChangeForPrototype:]"];
      [v6 handleFailureInFunction:v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDChangePropagationMap.m"), 180, @"PrototypeChange for prototype %@ was accessed before new values were recorded for these properties with old values recorded: %@", objc_msgSend(v3, "prototype"), objc_msgSend(v5, "i_propertiesWithOldValuesRecordedButNotNewValues") file lineNumber description];
    }
  }
  return v3;
}

- (id)prototypePassingTest:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = (void *)[(TSUNoCopyDictionary *)self->mDictionary keyEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ((*((uint64_t (**)(id, void *))a3 + 2))(a3, v9)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

@end