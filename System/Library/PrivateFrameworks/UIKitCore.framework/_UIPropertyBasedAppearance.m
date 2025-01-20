@interface _UIPropertyBasedAppearance
+ (id)_appearanceMatchingProperties:(id)a3 forClass:(Class)a4 withContainerList:(id)a5;
+ (id)_appearanceObjectKeyForProperties:(id)a3;
- (BOOL)_isRecordingInvocations;
- (BOOL)_isValidAppearanceForCustomizableObject:(id)a3;
- (NSDictionary)_propertiesToMatch;
- (void)_setPropertiesToMatch:(id)a3;
- (void)dealloc;
@end

@implementation _UIPropertyBasedAppearance

- (BOOL)_isRecordingInvocations
{
  return 0;
}

- (BOOL)_isValidAppearanceForCustomizableObject:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(_UIPropertyBasedAppearance *)self _propertiesToMatch];
  uint64_t v6 = [(NSDictionary *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      int v10 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", *(void *)(*((void *)&v12 + 1) + 8 * v9)), "isEqual:", -[NSDictionary objectForKey:](-[_UIPropertyBasedAppearance _propertiesToMatch](self, "_propertiesToMatch"), "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * v9)));
      if (!v10) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSDictionary *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v10) = 1;
  }
  return v10;
}

- (NSDictionary)_propertiesToMatch
{
  return self->_propertiesToMatch;
}

+ (id)_appearanceMatchingProperties:(id)a3 forClass:(Class)a4 withContainerList:(id)a5
{
  id v8 = +[_UIAppearanceCustomizableClassInfo _customizableClassInfoForViewClass:a4 withGuideClass:0];
  uint64_t v9 = (void *)[a1 _appearanceNodeForClassInfo:v8 containerList:a5];
  uint64_t v10 = [a1 _appearanceObjectKeyForProperties:a3];
  v11 = (void *)[v9 objectForKey:v10];
  if (!v11)
  {
    v11 = (void *)[a1 _newAppearanceWithClassInfo:v8 containerList:a5];
    v11[5] = a3;
    [v9 setObject:v11 forKey:v10];
    [v9 setObject:MEMORY[0x1E4F1CC38] forKey:@"_UIAppearanceHasExtendedAppearancesKey"];
  }
  return v11;
}

+ (id)_appearanceObjectKeyForProperties:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return @"_UIAppearanceKey";
  }
  v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        [v4 addObject:v9];
        objc_msgSend(v4, "addObject:", objc_msgSend(a3, "objectForKey:", v9));
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return (id)[v4 componentsJoinedByString:@":"];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_UIPropertyBasedAppearance;
  [(_UIAppearance *)&v3 dealloc];
}

- (void)_setPropertiesToMatch:(id)a3
{
}

@end