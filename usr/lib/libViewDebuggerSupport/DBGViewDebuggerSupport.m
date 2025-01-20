@interface DBGViewDebuggerSupport
+ (BOOL)_layerShouldSupersedeSnapshot:(id)a3;
+ (BOOL)_shouldEncodeLayers;
+ (BOOL)isHiddenForWindow:(id)a3;
+ (BOOL)isViewSubclass:(id)a3;
+ (BOOL)isWindowSubclass:(id)a3;
+ (double)firstBaselineOffsetFromTopForView:(id)a3;
+ (double)lastBaselineOffsetFromBottomForView:(id)a3;
+ (double)screenBackingScaleForView:(id)a3;
+ (double)screenBackingScaleForWindow:(id)a3;
+ (id)_arrayEncodedIndexPath:(id)a3;
+ (id)_collectSubviewInfoForView:(id)a3 encodeLayers:(BOOL)a4;
+ (id)_layerInfo:(id)a3 view:(id)a4;
+ (id)additionalRootLevelViewsToArchive;
+ (id)appWindows;
+ (id)classMap;
+ (id)collectViewInfo:(id)a3;
+ (id)displayNameForView:(id)a3;
+ (id)fetchViewHierarchy;
+ (id)fetchViewHierarchyWithOptions:(id)a3;
+ (id)layerForView:(id)a3;
+ (id)pathForClass:(Class)a3;
+ (id)primaryWindowFromWindows:(id)a3;
+ (id)snapshotMethodForView:(id)a3;
+ (id)snapshotView:(id)a3 errorString:(id *)a4;
+ (id)subviewsForView:(id)a3;
+ (id)titleForWindow:(id)a3;
+ (id)viewDebuggerEffectViewsToSnapshotAsImage;
+ (id)windowContentViewForWindow:(id)a3;
+ (unint64_t)majorVersion;
+ (unint64_t)minorVersion;
+ (void)_populateConstraintInfosArray:(id)a3 forViewHierarchy:(id)a4;
+ (void)_snapshotView:(id)a3 andAddDataToDictionary:(id)a4;
+ (void)addObjectBasics:(id)a3 toDict:(id)a4;
+ (void)addPathForClass:(Class)a3;
+ (void)addViewLayerInfo:(id)a3 toDict:(id)a4;
+ (void)addViewSubclassSpecificInfoForView:(id)a3 toDict:(id)a4;
+ (void)disableLayersAsSnapshots;
+ (void)enableLayersAsSnapshots;
@end

@implementation DBGViewDebuggerSupport

+ (unint64_t)majorVersion
{
  return 2;
}

+ (unint64_t)minorVersion
{
  return 0;
}

+ (id)classMap
{
  id result = (id)classMap_classMap;
  if (!classMap_classMap)
  {
    id result = +[NSMutableDictionary dictionary];
    classMap_classMap = (uint64_t)result;
  }
  return result;
}

+ (void)addPathForClass:(Class)a3
{
  id v5 = [a1 classMap];
  v6 = NSStringFromClass(a3);
  if (![v5 objectForKey:a3])
  {
    id v7 = [a1 pathForClass:a3];
    if (v7)
    {
      if (v6)
      {
        [v5 setObject:v7 forKey:v6];
      }
    }
  }
}

+ (id)pathForClass:(Class)a3
{
  v4 = NSStringFromClass(a3);
  id v5 = (objc_class *)[(objc_class *)a3 superclass];
  if (v5)
  {
    v6 = v5;
    unint64_t v7 = 0;
    do
    {
      if (v6 == (objc_class *)objc_opt_class()) {
        break;
      }
      if (v7 > 0x3E8) {
        break;
      }
      v4 = [(NSString *)v4 stringByAppendingPathComponent:NSStringFromClass(v6)];
      ++v7;
      v6 = (objc_class *)[(objc_class *)v6 superclass];
    }
    while (v6);
  }
  return v4;
}

+ (id)fetchViewHierarchyWithOptions:(id)a3
{
  DBGViewDebuggerUseLayersAsSnapshots = 1;
  if ([a3 objectForKey:@"DBGViewDebuggerUseLayersAsSnapshots"]) {
    DBGViewDebuggerUseLayersAsSnapshots = [[objc_msgSend(a3, "objectForKeyedSubscript:", @"DBGViewDebuggerUseLayersAsSnapshots") BOOLValue];
  }
  DBGViewDebuggerAlwaysEncodeLayers = 0;
  if ([a3 objectForKey:@"DBGViewDebuggerAlwaysEncodeLayers"]) {
    DBGViewDebuggerAlwaysEncodeLayers = [[a3 objectForKeyedSubscript:@"DBGViewDebuggerAlwaysEncodeLayers"] BOOLValue];
  }
  if ([a3 objectForKeyedSubscript:@"DBGViewDebuggerEffectViewsToSnapshotAsImage"]) {
    DBGViewDebuggerEffectViewsToSnapshotAsImage = (uint64_t)[a3 objectForKeyedSubscript:@"DBGViewDebuggerEffectViewsToSnapshotAsImage"];
  }
  if ([a3 objectForKeyedSubscript:@"DBGViewDebuggerEnableSceneDebugging"]) {
    DBGViewDebuggerEnableSceneDebugging = [[a3 objectForKeyedSubscript:@"DBGViewDebuggerEnableSceneDebugging"] BOOLValue];
  }

  return [a1 fetchViewHierarchy];
}

+ (id)viewDebuggerEffectViewsToSnapshotAsImage
{
  return (id)DBGViewDebuggerEffectViewsToSnapshotAsImage;
}

+ (void)enableLayersAsSnapshots
{
  DBGViewDebuggerUseLayersAsSnapshots = 1;
}

+ (void)disableLayersAsSnapshots
{
  DBGViewDebuggerUseLayersAsSnapshots = 0;
}

+ (id)fetchViewHierarchy
{
  id v3 = +[NSMutableArray array];
  id v4 = [a1 appWindows];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v29 objects:v38 count:16];
  id obj = v4;
  if (v5)
  {
    uint64_t v6 = *(void *)v30;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(id *)(*((void *)&v29 + 1) + 8 * i);
        id v9 = [a1 windowContentViewForWindow:v8];
        if (v8 == v9)
        {
          id v10 = [a1 _collectSubviewInfoForView:v8 encodeLayers:1];
        }
        else
        {
          id v10 = [a1 collectViewInfo:v8];
          id v37 = [a1 _collectSubviewInfoForView:v9 encodeLayers:1];
          [v10 setObject:[+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1) stringByAppendingPathComponent:@"DBCShutdownCookie"];
        }
        [v10 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a1, "isHiddenForWindow:", v8))] forKey:@"hidden"];
        id v11 = +[NSMutableArray array];
        [a1 _populateConstraintInfosArray:v11 forViewHierarchy:v9];
        if ([v11 count]) {
          [v10 setObject:v11 forKey:@"constraints"];
        }
        id v12 = [a1 titleForWindow:v8];
        if ([v12 length]) {
          [v10 setObject:v12 forKey:@"displayName"];
        }
        [a1 screenBackingScaleForWindow:v8];
        [v10 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:")(@"screenBackingScale")] forKey:@"screenBackingScale"];
        [v3 addObject:v10];
      }
      id v5 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v5);
  }
  id v13 = [a1 additionalRootLevelViewsToArchive];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = [v13 countByEnumeratingWithState:&v25 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v26;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * (void)j);
        if ([a1 isViewSubclass:v17])
        {
          id v18 = [a1 _collectSubviewInfoForView:v17 encodeLayers:1];
          id v19 = +[NSMutableArray array];
          [a1 _populateConstraintInfosArray:v19 forViewHierarchy:v17];
          if ([v19 count]) {
            [v18 setObject:v19 forKey:@"constraints"];
          }
          [a1 screenBackingScaleForView:v17];
          [v18 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:")(screenBackingScale)] forKey:@"screenBackingScale"];
          [v3 addObject:v18];
        }
      }
      id v14 = [v13 countByEnumeratingWithState:&v25 objects:v36 count:16];
    }
    while (v14);
  }
  id v20 = +[NSMutableDictionary dictionary];
  [v20 setObject:v3 forKey:@"views"];
  [v20 setObject:[a1 classMap] forKey:@"classmap"];
  id v21 = [a1 primaryWindowFromWindows:obj];
  if (v21) {
    [v20 setObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%p", v21), @"primaryWindow" forKey];
  }
  uint64_t v24 = 0;
  id result = +[NSPropertyListSerialization dataWithPropertyList:v20 format:200 options:0 error:&v24];
  if (v24)
  {
    v33 = +[NSString stringWithFormat:@"Error serializing view hierarchy information: %@", v24];
    v34 = @"exceptions";
    v35 = +[NSArray arrayWithObjects:&v33 count:1];
    return +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1], 200, 0, 0);
  }
  return result;
}

+ (id)collectViewInfo:(id)a3
{
  id v5 = +[NSMutableDictionary dictionary];
  [a1 addObjectBasics:a3 toDict:v5];
  [a1 addFrameBasics:a3 toDict:v5];
  if ([a1 isViewSubclass:a3])
  {
    [a1 addViewBasics:a3 toDict:v5];
    [a1 addViewLayerInfo:a3 toDict:v5];
    [a1 addLayoutInfoForView:a3 toDict:v5];
    [a1 _snapshotView:a3 andAddDataToDictionary:v5];
    [a1 addViewSubclassSpecificInfoForView:a3 toDict:v5];
  }
  return v5;
}

+ (void)addObjectBasics:(id)a3 toDict:(id)a4
{
  unint64_t v7 = (objc_class *)objc_opt_class();
  [a4 setObject:NSStringFromClass(v7) forKey:@"class"];
  [a1 addPathForClass:v7];
  id v8 = +[NSString stringWithFormat:@"%p", a3];

  [a4 setObject:v8 forKey:@"address"];
}

+ (void)addViewSubclassSpecificInfoForView:(id)a3 toDict:(id)a4
{
  if (DBGViewDebuggerEnableSceneDebugging)
  {
    NSClassFromString(&cfstr_Scnview.isa);
    if (objc_opt_isKindOfClass())
    {
      id v7 = [a3 scene];
      if (v7)
      {
        id v8 = v7;
        Class v9 = NSClassFromString(&cfstr_Scnkeyedarchiv.isa);
        if (objc_opt_respondsToSelector())
        {
          [a4 setObject:[objc_class archivedDataWithRootObject:options:](v9, "archivedDataWithRootObject:options:", v8, &off_58238) forKey:@"encodedDocumentData"];
          [a4 setObject:[a1 pathForClass:objc_opt_class()] forKey:@"classPathRepresentedByEncodedDocumentData"];
        }
        if (objc_opt_respondsToSelector())
        {
          id v10 = [a3 valueForKey:@"pointOfView"];
          if (v10)
          {
            id v11 = v10;
            Class v12 = NSClassFromString(&cfstr_Scnscene.isa);
            if (v12)
            {
              Class v13 = v12;
              if (objc_opt_respondsToSelector())
              {
                id v14 = [(objc_class *)v13 _indexPathForNode:v11];
                if (v14)
                {
                  uint64_t v15 = @"pointOfView";
                  id v16 = [a1 _arrayEncodedIndexPath:v14];
                  [a4 setObject:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1) forKey:@"encodedDocumentInfo"];
                }
              }
            }
          }
        }
      }
    }
  }
}

+ (id)_arrayEncodedIndexPath:(id)a3
{
  id v4 = (char *)[a3 length];
  off_3C480();
  uint64_t v6 = (uint64_t *)((char *)&v10 - v5);
  [a3 getIndexes:&v10 range:0, v4];
  for (id i = &__NSArray0__struct; v4; --v4)
  {
    uint64_t v8 = *v6++;
    id i = [i arrayByAddingObject:[NSNumber numberWithUnsignedInteger:v8]];
  }
  return i;
}

+ (BOOL)_shouldEncodeLayers
{
  return (DBGViewDebuggerUseLayersAsSnapshots | DBGViewDebuggerAlwaysEncodeLayers) != 0;
}

+ (BOOL)_layerShouldSupersedeSnapshot:(id)a3
{
  id v5 = [a1 layerForView:x0];
  if (v5)
  {
    if ([a1 snapshotMethodForView:a3])
    {
LABEL_3:
      LOBYTE(v5) = 0;
      return (char)v5;
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = (void *)DBGViewDebuggerEffectViewsToSnapshotAsImage;
    id v7 = [(id)DBGViewDebuggerEffectViewsToSnapshotAsImage countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
LABEL_7:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        Class v12 = (objc_class *)objc_opt_class();
        if ([v11 isEqualToString:NSStringFromClass(v12)]) {
          goto LABEL_3;
        }
        if (v8 == (id)++v10)
        {
          id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
          LOBYTE(v5) = 1;
          if (v8) {
            goto LABEL_7;
          }
          return (char)v5;
        }
      }
    }
    LOBYTE(v5) = 1;
  }
  return (char)v5;
}

+ (void)_snapshotView:(id)a3 andAddDataToDictionary:(id)a4
{
  if (!DBGViewDebuggerUseLayersAsSnapshots
    || ([a1 _layerShouldSupersedeSnapshot:a3] & 1) == 0)
  {
    uint64_t v8 = 0;
    id v7 = [a1 snapshotView:a3 errorString:&v8];
    if (v7) {
      [a4 setObject:v7 forKey:@"imageData"];
    }
    if (v8) {
      [a4 setObject:v8 forKey:@"snapshottingError"];
    }
  }
}

+ (void)_populateConstraintInfosArray:(id)a3 forViewHierarchy:(id)a4
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = [a4 constraints];
  id v6 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = +[NSMutableDictionary dictionary];
          [v11 setObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%p", v10), @"address" forKey];
          [v11 setObject:+[NSString stringWithFormat:](NSString, @"%p", objc_msgSend(v10, "firstItem")), @"firstItem" forKey];
          [v11 setObject:[+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", objc_msgSend(v10, "firstAttribute"))] forKey:@"firstAttribute"];
          [v11 setObject:+[NSString stringWithFormat:](NSString, @"%p", objc_msgSend(v10, "secondItem")), @"secondItem" forKey];
          [v11 setObject:[+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", objc_msgSend(v10, "secondAttribute"))] forKey:@"secondAttribute"];
          [v11 setObject:[+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", a4)] forKey:@"container"];
          [v11 setObject:[+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", objc_msgSend(v10, "relation"))] forKey:@"relation"];
          [v10 constant];
          [v11 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:")] forKey:@"constant"];
          [v10 multiplier];
          [v11 setObject:[NSNumber numberWithDouble:] forKey:@"multiplier"];
          [v10 priority];
          [v11 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12)] forKey:@"priority"];
          Class v13 = (objc_class *)objc_opt_class();
          [v11 setObject:NSStringFromClass(v13) forKey:@"class"];
          long long v14 = (__CFString *)[v10 identifier];
          if (v14) {
            long long v15 = v14;
          }
          else {
            long long v15 = &stru_3C770;
          }
          [v11 setObject:v15 forKey:@"identifier"];
          [a3 addObject:v11];
          [a1 addPathForClass:objc_opt_class()];
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = [a4 subviews];
  id v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      id v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        [a1 _populateConstraintInfosArray:a3 forViewHierarchy:*(void *)(*((void *)&v23 + 1) + 8 * (void)v20)];
        id v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }
}

+ (id)_collectSubviewInfoForView:(id)a3 encodeLayers:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [a1 collectViewInfo:];
  id v8 = +[NSMutableArray array];
  id v9 = [a3 layer];
  uint64_t v10 = v9;
  if (v4 && v9 && [a1 _shouldEncodeLayers])
  {
    id v11 = (const void *)CAEncodeLayerTree();
    [v7 setObject:v11 forKeyedSubscript:@"layerRoot"];
    CFTypeRef v12 = (id)CFMakeCollectable(v11);
  }
  if (objc_msgSend(objc_msgSend(a1, "subviewsForView:", a3), "count"))
  {
    uint64_t v13 = 0;
    if (v10) {
      int v14 = 1;
    }
    else {
      int v14 = !v4;
    }
    unsigned int v15 = 1;
    do
    {
      id v16 = [objc_msgSend(a1, "subviewsForView:", a3) objectAtIndexedSubscript:v13];
      if (v16)
      {
        id v17 = v16;
        if (v14)
        {
          id v18 = [v16 layer];
          uint64_t v19 = 0;
          if (v4 && v18) {
            uint64_t v19 = [objc_msgSend(objc_msgSend(v10, "sublayers"), "containsObject:", v18) ^ 1];
          }
        }
        else
        {
          uint64_t v19 = 1;
        }
        [v8 addObject:[a1 _collectSubviewInfoForView:v17 encodeLayers:v19]];
      }
      uint64_t v13 = v15;
    }
    while (((unint64_t)objc_msgSend(objc_msgSend(a1, "subviewsForView:", a3), "count")) > v15++);
  }
  [v7 setObject:v8 forKey:@"subviews"];
  return v7;
}

+ (id)_layerInfo:(id)a3 view:(id)a4
{
  if (!a3) {
    return 0;
  }
  id v7 = (objc_class *)objc_opt_class();
  [a1 addPathForClass:v7];
  id v8 = +[NSString stringWithFormat:@"%p", a3];
  v10[0] = @"layerDelegate";
  v11[0] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%p", [a3 delegate]);
  v10[1] = @"viewIdentifier";
  v11[1] = +[NSString stringWithFormat:@"%p", a4];
  v10[2] = @"class";
  v10[3] = @"address";
  v11[2] = NSStringFromClass(v7);
  v11[3] = v8;
  return +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
}

+ (id)appWindows
{
  return 0;
}

+ (id)windowContentViewForWindow:(id)a3
{
  return 0;
}

+ (id)additionalRootLevelViewsToArchive
{
  return 0;
}

+ (BOOL)isHiddenForWindow:(id)a3
{
  return 0;
}

+ (id)titleForWindow:(id)a3
{
  return &stru_3C770;
}

+ (double)screenBackingScaleForWindow:(id)a3
{
  return 1.0;
}

+ (double)screenBackingScaleForView:(id)a3
{
  return 1.0;
}

+ (id)snapshotView:(id)a3 errorString:(id *)a4
{
  return 0;
}

+ (id)snapshotMethodForView:(id)a3
{
  return 0;
}

+ (id)layerForView:(id)a3
{
  return 0;
}

+ (id)subviewsForView:(id)a3
{
  return 0;
}

+ (BOOL)isWindowSubclass:(id)a3
{
  return 0;
}

+ (BOOL)isViewSubclass:(id)a3
{
  return 0;
}

+ (id)displayNameForView:(id)a3
{
  return 0;
}

+ (id)primaryWindowFromWindows:(id)a3
{
  return 0;
}

+ (void)addViewLayerInfo:(id)a3 toDict:(id)a4
{
  id v7 = [a1 layerForView:x0];
  if (v7)
  {
    id v8 = v7;
    id v9 = [a1 _layerInfo:v7 view:a3];
    if (v9) {
      [a4 setObject:v9 forKey:@"layer"];
    }
    [a4 setObject:[+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(objc_msgSend(objc_msgSend(v8, "superlayer"), "sublayers"), "indexOfObject:", v8))] forKey:@"layerIndex"];
    uint64_t v10 = (objc_class *)objc_opt_class();
    [a4 setObject:NSStringFromClass(v10) forKey:@"layerClass"];
    [a4 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "masksToBounds")) forKey:@"masksToBounds"];
    [a4 setObject:__50__DBGViewDebuggerSupport_addViewLayerInfo_toDict___block_invoke((uint64_t)objc_msgSend(v8, "transform"), v16) forKey:@"transform"];
    [a4 setObject:__50__DBGViewDebuggerSupport_addViewLayerInfo_toDict___block_invoke((uint64_t)objc_msgSend(v8, "sublayerTransform"), v15) forKey:@"sublayerTransform"];
    [v8 position];
    double v12 = v11;
    id v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    id v18 = +[NSNumber numberWithDouble:v12];
    [a4 setObject:[+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 2) objectAtIndex:0] forKey:@"position"];
    [v8 zPosition];
    [a4 setObject:[NSNumber numberWithDouble:] forKey:@"zPosition"];
    [v8 anchorPoint];
    double v14 = v13;
    id v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    id v18 = +[NSNumber numberWithDouble:v14];
    [a4 setObject:[+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 2) objectAtIndex:0] forKey:@"anchorPoint"];
    [v8 anchorPointZ];
    [a4 setObject:[NSNumber numberWithDouble:]:@"anchorPointZ"];
    [a4 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "isDoubleSided")) forKey:@"isDoubleSided"];
  }
}

NSArray *__50__DBGViewDebuggerSupport_addViewLayerInfo_toDict___block_invoke(uint64_t a1, double *a2)
{
  v4[0] = +[NSNumber numberWithDouble:*a2];
  v4[1] = +[NSNumber numberWithDouble:a2[1]];
  v4[2] = +[NSNumber numberWithDouble:a2[2]];
  v4[3] = +[NSNumber numberWithDouble:a2[3]];
  v4[4] = +[NSNumber numberWithDouble:a2[4]];
  v4[5] = +[NSNumber numberWithDouble:a2[5]];
  v4[6] = +[NSNumber numberWithDouble:a2[6]];
  v4[7] = +[NSNumber numberWithDouble:a2[7]];
  v4[8] = +[NSNumber numberWithDouble:a2[8]];
  v4[9] = +[NSNumber numberWithDouble:a2[9]];
  v4[10] = +[NSNumber numberWithDouble:a2[10]];
  v4[11] = +[NSNumber numberWithDouble:a2[11]];
  v4[12] = +[NSNumber numberWithDouble:a2[12]];
  v4[13] = +[NSNumber numberWithDouble:a2[13]];
  v4[14] = +[NSNumber numberWithDouble:a2[14]];
  v4[15] = +[NSNumber numberWithDouble:a2[15]];
  return +[NSArray arrayWithObjects:v4 count:16];
}

+ (double)firstBaselineOffsetFromTopForView:(id)a3
{
  return 0.0;
}

+ (double)lastBaselineOffsetFromBottomForView:(id)a3
{
  return 0.0;
}

id __52__DBGViewDebuggerSupport_iOS_addFrameBasics_toDict___block_invoke(double a1, double a2, double a3, double a4)
{
  id v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v13[0] = v7;
  id v8 = +[NSNumber numberWithDouble:a2];
  v13[1] = v8;
  id v9 = +[NSNumber numberWithDouble:a3];
  v13[2] = v9;
  uint64_t v10 = +[NSNumber numberWithDouble:a4];
  v13[3] = v10;
  double v11 = +[NSArray arrayWithObjects:v13 count:4];

  return v11;
}

@end