@interface TSUAssetColorMap
+ (id)assetColorMap;
- (NSDictionary)assetPathToColorMap;
- (TSUAssetColorMap)init;
- (id)TSUColorFromColorArray:(id)a3;
- (void)addChartEntries;
- (void)addEntriesFromPlistBasename:(id)a3 transformKeyBlock:(id)a4;
- (void)addSharedEntries;
@end

@implementation TSUAssetColorMap

+ (id)assetColorMap
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (TSUAssetColorMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)TSUAssetColorMap;
  id v2 = [(TSUAssetColorMap *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mAssetPathToColorMap = v2->mAssetPathToColorMap;
    v2->mAssetPathToColorMap = v3;
  }
  return v2;
}

- (NSDictionary)assetPathToColorMap
{
  [(NSMutableDictionary *)self->mAssetPathToColorMap count];
  v3 = (void *)[(NSMutableDictionary *)self->mAssetPathToColorMap copy];
  return (NSDictionary *)v3;
}

- (id)TSUColorFromColorArray:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 count];
  if (v4 > 4)
  {
    v15 = 0;
  }
  else
  {
    unint64_t v5 = v4;
    objc_super v6 = [v3 objectAtIndexedSubscript:0];
    int v7 = [v6 intValue];

    if (v5 < 3)
    {
      float v14 = 255.0;
      int v11 = v7;
      int v9 = v7;
    }
    else
    {
      v8 = [v3 objectAtIndexedSubscript:1];
      int v9 = [v8 intValue];

      v10 = [v3 objectAtIndexedSubscript:2];
      int v11 = [v10 intValue];

      if (v5 == 4)
      {
        v12 = [v3 objectAtIndexedSubscript:3];
        [v12 floatValue];
        float v14 = v13;
      }
      else
      {
        float v14 = 255.0;
      }
    }
    v15 = +[OITSUColor colorWithRed:(float)((float)v7 / 255.0) green:(float)((float)v9 / 255.0) blue:(float)((float)v11 / 255.0) alpha:(float)(v14 / 255.0)];
  }

  return v15;
}

- (void)addEntriesFromPlistBasename:(id)a3 transformKeyBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (!v9)
  {
    v10 = [NSString stringWithUTF8String:"-[TSUAssetColorMap addEntriesFromPlistBasename:transformKeyBlock:]"];
    int v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUAssetColorMap.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 62, 0, "invalid nil value for '%{public}s'", "bundle");

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  v12 = [v9 pathForResource:v7 ofType:@"plist"];
  if (v12)
  {
    id v32 = v7;
    float v13 = (void *)[objc_alloc(NSDictionary) initWithContentsOfFile:v12];
    id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __66__TSUAssetColorMap_addEntriesFromPlistBasename_transformKeyBlock___block_invoke;
    v33[3] = &unk_264D62118;
    id v31 = v8;
    id v35 = v8;
    v33[4] = self;
    id v15 = v14;
    id v34 = v15;
    SEL v36 = a2;
    [v13 enumerateKeysAndObjectsUsingBlock:v33];
    v16 = objc_msgSend(v15, "tsu_allKeysAsSet");
    v17 = [(NSMutableDictionary *)self->mAssetPathToColorMap tsu_allKeysAsSet];
    int v18 = [v16 intersectsSet:v17];

    if (v18)
    {
      v30 = v13;
      v19 = [NSString stringWithUTF8String:"-[TSUAssetColorMap addEntriesFromPlistBasename:transformKeyBlock:]"];
      v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUAssetColorMap.m"];
      v21 = (void *)MEMORY[0x263EFFA08];
      v22 = objc_msgSend(v15, "tsu_allKeysAsSet");
      v23 = [(NSMutableDictionary *)self->mAssetPathToColorMap tsu_allKeysAsSet];
      v24 = objc_msgSend(v21, "setWithObjects:", v22, v23, 0);
      v25 = objc_msgSend(v21, "tsu_intersectionOfSets:", v24);
      +[OITSUAssertionHandler handleFailureInFunction:v19, v20, 95, 0, "Overwriting duplicated entries %@", v25 file lineNumber isFatal description];

      float v13 = v30;
      +[OITSUAssertionHandler logBacktraceThrottled];
    }
    mAssetPathToColorMap = self->mAssetPathToColorMap;
    if (!mAssetPathToColorMap)
    {
      v27 = [NSString stringWithUTF8String:"-[TSUAssetColorMap addEntriesFromPlistBasename:transformKeyBlock:]"];
      v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUAssetColorMap.m"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 96, 0, "invalid nil value for '%{public}s'", "mAssetPathToColorMap");

      +[OITSUAssertionHandler logBacktraceThrottled];
      mAssetPathToColorMap = self->mAssetPathToColorMap;
    }
    [(NSMutableDictionary *)mAssetPathToColorMap addEntriesFromDictionary:v15];

    id v8 = v31;
    id v7 = v32;
  }
  else
  {
    v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"TSUAssetColorMap.m", 100, @"No plist found for name %@", v7 object file lineNumber description];
  }
}

void __66__TSUAssetColorMap_addEntriesFromPlistBasename_transformKeyBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  objc_super v6 = (objc_class *)objc_opt_class();
  id v7 = TSUCheckedDynamicCast(v6, (uint64_t)v15);
  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8)
    {
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v7);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        v10 = [NSString stringWithUTF8String:"-[TSUAssetColorMap addEntriesFromPlistBasename:transformKeyBlock:]_block_invoke"];
        int v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUAssetColorMap.m"];
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 72, 0, "invalid nil value for '%{public}s'", "convertedKey");

        +[OITSUAssertionHandler logBacktraceThrottled];
        id v9 = 0;
      }
    }
    else
    {
      id v9 = v7;
    }
    v12 = (objc_class *)objc_opt_class();
    float v13 = TSUCheckedDynamicCast(v12, (uint64_t)v5);
    if (v13)
    {
      id v14 = [*(id *)(a1 + 32) TSUColorFromColorArray:v13];
      if (v14) {
        [*(id *)(a1 + 40) setObject:v14 forKeyedSubscript:v9];
      }
      else {
        NSLog((NSString *)@"Failed to map color for: %@ array: %@", v15, v13);
      }
    }
    else
    {
      id v14 = [MEMORY[0x263F08690] currentHandler];
      [v14 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"TSUAssetColorMap.m", 85, @"Expected an NSArray, found %@ : %@", objc_opt_class(), v5 object file lineNumber description];
    }
  }
  else
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"TSUAssetColorMap.m", 90, @"Expected an NSString key, found %@ : %@", objc_opt_class(), v15 object file lineNumber description];
  }
}

- (void)addSharedEntries
{
}

uint64_t __36__TSUAssetColorMap_addSharedEntries__block_invoke(uint64_t a1, void *a2)
{
  return [a2 uppercaseString];
}

- (void)addChartEntries
{
}

- (void).cxx_destruct
{
}

@end