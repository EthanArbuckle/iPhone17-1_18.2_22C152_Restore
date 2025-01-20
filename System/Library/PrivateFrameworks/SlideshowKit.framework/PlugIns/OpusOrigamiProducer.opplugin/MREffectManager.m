@interface MREffectManager
+ (id)sharedManager;
+ (void)initialize;
- (BOOL)hasCustomTimingForEffectID:(id)a3;
- (BOOL)hasMultiImageInputForEffectID:(id)a3;
- (BOOL)isOpaqueForEffectID:(id)a3;
- (Class)classForEffectID:(id)a3;
- (MREffectManager)init;
- (double)defaultMainDurationForEffectID:(id)a3;
- (double)defaultPhaseInDurationForEffectID:(id)a3;
- (double)defaultPhaseOutDurationForEffectID:(id)a3;
- (double)lineSpacingFactorForTextInEffectID:(id)a3 presetID:(id)a4 atIndex:(int64_t)a5;
- (id)attributeDescriptionForEffectID:(id)a3 andKey:(id)a4;
- (id)customTimingWithEffectID:(id)a3 effectAttributes:(id)a4 slideInformation:(id)a5 textInformation:(id)a6 inAspectRatio:(double)a7;
- (id)defaultEffectAttributesWithEffectID:(id)a3 andSlideInformation:(id)a4;
- (id)descriptionForEffectID:(id)a3;
- (id)effectWithEffectID:(id)a3;
- (id)imageInputInfosForEffectID:(id)a3;
- (id)imageProviderInfosForEffectID:(id)a3;
- (id)resourcePathForEffectID:(id)a3 andResource:(id)a4;
- (id)sizeScriptForEffectID:(id)a3 andKey:(id)a4;
- (void)cleanup;
- (void)dealloc;
- (void)recycleEffect:(id)a3;
- (void)releaseResources;
@end

@implementation MREffectManager

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MREffectManager;
  objc_msgSendSuper2(&v2, "initialize");
  if (!qword_1F1420) {
    qword_1F1420 = objc_alloc_init(MREffectManager);
  }
}

+ (id)sharedManager
{
  return (id)qword_1F1420;
}

- (MREffectManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)MREffectManager;
  objc_super v2 = [(MREffectManager *)&v4 init];
  if (v2)
  {
    v2->mEffectSets = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->mEffectPools = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v2;
}

- (void)dealloc
{
  [(MREffectManager *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)MREffectManager;
  [(MREffectManager *)&v3 dealloc];
}

- (void)cleanup
{
  self->mEffectSets = 0;
  self->mEffectPools = 0;
}

- (void)releaseResources
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obj = self->mEffectSets;
  id v3 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v8 = [(NSMutableDictionary *)self->mEffectSets objectForKey:v7];
        id v9 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v16;
          do
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v16 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v15 + 1) + 8 * (void)j);
              if ([v13 isRetainedByEffectLayer]) {
                NSLog(@"[MREffectManager releaseResources] called while resources still in use. May leak.");
              }
              else {
                [v13 cleanup];
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v10);
        }
      }
      id v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v4);
  }
  [(NSMutableDictionary *)self->mEffectSets removeAllObjects];
  [(NSMutableDictionary *)self->mEffectPools removeAllObjects];
}

- (Class)classForEffectID:(id)a3
{
  id v3 = (objc_class *)a3;
  if (!a3) {
    return v3;
  }
  id v4 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "descriptionForEffectID:", a3);
  uint64_t v5 = (objc_class *)[v4 objectForKey:@"className"];
  v6 = v5 ? v5 : v3;
  Class v7 = NSClassFromString((NSString *)[@"MREffect" stringByAppendingString:v6]);
  if (v7)
  {
    id v3 = v7;
    id v8 = +[NSBundle bundleForClass:v7];
    if (v8 == +[NSBundle bundleForClass:objc_opt_class()]) {
      return v3;
    }
  }
  if (!objc_msgSend(objc_msgSend(v4, "objectForKey:", @"imageInputInfo"), "count")) {
    return 0;
  }
  return (Class)objc_opt_class();
}

- (id)effectWithEffectID:(id)a3
{
  if (!a3 || ([a3 isEqualToString:@"Undefined"] & 1) != 0) {
    return 0;
  }
  objc_sync_enter(self);
  id v6 = [(NSMutableDictionary *)self->mEffectPools objectForKey:a3];
  Class v7 = v6;
  if (v6 && [v6 count])
  {
    id v5 = [v7 anyObject];
    [v7 removeObject:v5];
  }
  else
  {
    id v5 = objc_msgSend(objc_alloc(-[MREffectManager classForEffectID:](self, "classForEffectID:", a3)), "initWithEffectID:", a3);
    if (v5)
    {
      id v8 = [(NSMutableDictionary *)self->mEffectSets objectForKey:a3];
      if (v8) {
        [v8 addObject:v5];
      }
      else {
        [(NSMutableDictionary *)self->mEffectSets setObject:+[NSMutableSet setWithObject:v5] forKey:a3];
      }
    }
  }
  objc_sync_exit(self);
  return v5;
}

- (void)recycleEffect:(id)a3
{
  objc_sync_enter(self);
  id v5 = -[NSMutableDictionary objectForKey:](self->mEffectPools, "objectForKey:", [a3 effectID]);
  if (v5) {
    [v5 addObject:a3];
  }
  else {
    -[NSMutableDictionary setObject:forKey:](self->mEffectPools, "setObject:forKey:", +[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", a3), [a3 effectID]);
  }
  objc_sync_exit(self);
}

- (id)descriptionForEffectID:(id)a3
{
  id v4 = +[MPEffectManager sharedManager];
  return [v4 descriptionForEffectID:a3];
}

- (id)resourcePathForEffectID:(id)a3 andResource:(id)a4
{
  id v5 = objc_msgSend(objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "descriptionForEffectID:", a3), "objectForKey:", @"resourceFolderPath");
  if (!v5) {
    return a4;
  }
  return [v5 stringByAppendingPathComponent:a4];
}

- (id)sizeScriptForEffectID:(id)a3 andKey:(id)a4
{
  id v5 = [(MREffectManager *)self descriptionForEffectID:a3];
  id v6 = [a4 stringByAppendingString:@"SizeScript"];
  return [v5 objectForKey:v6];
}

- (BOOL)hasMultiImageInputForEffectID:(id)a3
{
  id v3 = objc_msgSend(-[MREffectManager descriptionForEffectID:](self, "descriptionForEffectID:", a3), "objectForKey:", @"hasMultiImageInput");
  return [v3 BOOLValue];
}

- (id)imageInputInfosForEffectID:(id)a3
{
  id v3 = [(MREffectManager *)self descriptionForEffectID:a3];
  return [v3 objectForKey:@"imageInputInfo"];
}

- (id)imageProviderInfosForEffectID:(id)a3
{
  id v3 = [(MREffectManager *)self descriptionForEffectID:a3];
  return [v3 objectForKey:@"imageProviderInfo"];
}

- (BOOL)isOpaqueForEffectID:(id)a3
{
  if (!objc_msgSend(-[MREffectManager descriptionForEffectID:](self, "descriptionForEffectID:"), "objectForKey:", @"isOpaque"))return 1; {
  id v5 = objc_msgSend(-[MREffectManager descriptionForEffectID:](self, "descriptionForEffectID:", a3), "objectForKey:", @"isOpaque");
  }
  return [v5 BOOLValue];
}

- (double)defaultPhaseInDurationForEffectID:(id)a3
{
  id v3 = objc_msgSend(-[MREffectManager descriptionForEffectID:](self, "descriptionForEffectID:", a3), "objectForKey:", @"phaseInDuration");
  [v3 doubleValue];
  return result;
}

- (double)defaultMainDurationForEffectID:(id)a3
{
  id v3 = objc_msgSend(-[MREffectManager descriptionForEffectID:](self, "descriptionForEffectID:", a3), "objectForKey:", @"mainDuration");
  [v3 doubleValue];
  return result;
}

- (double)defaultPhaseOutDurationForEffectID:(id)a3
{
  id v3 = objc_msgSend(-[MREffectManager descriptionForEffectID:](self, "descriptionForEffectID:", a3), "objectForKey:", @"phaseOutDuration");
  [v3 doubleValue];
  return result;
}

- (BOOL)hasCustomTimingForEffectID:(id)a3
{
  id v3 = [(MREffectManager *)self classForEffectID:a3];
  return [(objc_class *)v3 hasCustomTiming];
}

- (id)customTimingWithEffectID:(id)a3 effectAttributes:(id)a4 slideInformation:(id)a5 textInformation:(id)a6 inAspectRatio:(double)a7
{
  v12 = -[MREffectManager classForEffectID:](self, "classForEffectID:");
  return [(objc_class *)v12 customTimingWithEffectID:a3 effectAttributes:a4 slideInformation:a5 textInformation:a6 inAspectRatio:a7];
}

- (id)defaultEffectAttributesWithEffectID:(id)a3 andSlideInformation:(id)a4
{
  id v6 = -[MREffectManager classForEffectID:](self, "classForEffectID:");
  return [(objc_class *)v6 defaultEffectAttributesWithEffectID:a3 andSlideInformation:a4];
}

- (id)attributeDescriptionForEffectID:(id)a3 andKey:(id)a4
{
  id v5 = objc_msgSend(-[MREffectManager descriptionForEffectID:](self, "descriptionForEffectID:", a3), "objectForKey:", @"attributes");
  return [v5 objectForKey:a4];
}

- (double)lineSpacingFactorForTextInEffectID:(id)a3 presetID:(id)a4 atIndex:(int64_t)a5
{
  if (a4) {
    CFStringRef v6 = (const __CFString *)a4;
  }
  else {
    CFStringRef v6 = @"Default";
  }
  id v7 = objc_msgSend(objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "attributesForEffectID:andPresetID:", a3, v6), "objectForKey:", @"textSettings");
  if ((unint64_t)[v7 count] <= a5) {
    id v8 = 0;
  }
  else {
    id v8 = [v7 objectAtIndex:a5];
  }
  id v9 = [v8 objectForKey:@"lineSpacing"];
  if (!v9) {
    return 1.0;
  }
  [v9 floatValue];
  return v10;
}

@end