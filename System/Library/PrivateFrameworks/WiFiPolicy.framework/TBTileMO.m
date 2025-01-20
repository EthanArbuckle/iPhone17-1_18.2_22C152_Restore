@interface TBTileMO
+ (id)entityName;
+ (id)fetchRequest;
+ (id)generateNewTileObjectFromMOC:(id)a3;
+ (void)removeAllTilesInMOC:(id)a3;
+ (void)removeTilesUsingPredicate:(id)a3 moc:(id)a4;
@end

@implementation TBTileMO

+ (id)entityName
{
  return @"Tile";
}

+ (id)generateNewTileObjectFromMOC:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1D9440170]();
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__TBTileMO_generateNewTileObjectFromMOC___block_invoke;
  v8[3] = &unk_1E69BD558;
  v10 = &v11;
  id v5 = v3;
  id v9 = v5;
  [v5 performBlockAndWait:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __41__TBTileMO_generateNewTileObjectFromMOC___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1C0A8];
  id v6 = +[TBTileMO entityName];
  uint64_t v3 = [v2 insertNewObjectForEntityForName:v6 inManagedObjectContext:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (void)removeTilesUsingPredicate:(id)a3 moc:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D9440170]();
  id v9 = [a1 fetchRequest];
  [v9 setPredicate:v6];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v9];
  [v10 setResultType:2];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __42__TBTileMO_removeTilesUsingPredicate_moc___block_invoke;
  v14[3] = &unk_1E69BCEC8;
  id v11 = v7;
  id v15 = v11;
  id v16 = v10;
  id v12 = v6;
  id v17 = v12;
  id v13 = v10;
  [v11 performBlockAndWait:v14];
}

void __42__TBTileMO_removeTilesUsingPredicate_moc___block_invoke(void *a1)
{
  v2 = (void *)MEMORY[0x1D9440170]();
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v9 = 0;
  id v5 = [v3 executeRequest:v4 error:&v9];
  id v6 = v9;
  id v7 = [v5 result];
  uint64_t v8 = [v7 unsignedIntegerValue];

  NSLog(&cfstr_SRemovedLuTile.isa, "+[TBTileMO removeTilesUsingPredicate:moc:]_block_invoke", v8, a1[6]);
}

+ (void)removeAllTilesInMOC:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D9440170]();
  id v5 = objc_alloc(MEMORY[0x1E4F1C018]);
  id v6 = +[TBTileMO fetchRequest];
  id v7 = (void *)[v5 initWithFetchRequest:v6];

  [v7 setResultType:2];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __32__TBTileMO_removeAllTilesInMOC___block_invoke;
  v10[3] = &unk_1E69BC8B0;
  id v8 = v3;
  id v11 = v8;
  id v12 = v7;
  id v9 = v7;
  [v8 performBlockAndWait:v10];
}

void __32__TBTileMO_removeAllTilesInMOC___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D9440170]();
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v10 = 0;
  id v5 = [v3 executeRequest:v4 error:&v10];
  id v6 = v10;
  id v7 = v6;
  if (v6)
  {
    NSLog(&cfstr_SError.isa, "+[TBTileMO removeAllTilesInMOC:]_block_invoke", v6);
  }
  else
  {
    id v8 = [v5 result];
    uint64_t v9 = [v8 unsignedIntegerValue];

    NSLog(&cfstr_SRemovedLuTile_0.isa, "+[TBTileMO removeAllTilesInMOC:]_block_invoke", v9);
  }
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Tile"];
}

@end