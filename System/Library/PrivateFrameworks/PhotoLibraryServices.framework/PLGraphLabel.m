@interface PLGraphLabel
+ (BOOL)_needsLabelUpdateCheckFromGlobalValues:(id)a3;
+ (id)_insertLabelWithCode:(unsigned int)a3 inManagedObjectContext:(id)a4;
+ (id)entityName;
+ (id)fetchLabelWithCode:(unsigned int)a3 inContext:(id)a4;
+ (id)labelNameFromCode:(unsigned int)a3;
+ (void)ensureLabelsAreUpdatedInContext:(id)a3;
- (NSString)plsClassName;
@end

@implementation PLGraphLabel

- (NSString)plsClassName
{
  v2 = objc_msgSend((id)objc_opt_class(), "labelNameFromCode:", -[PLGraphLabel code](self, "code"));
  v3 = [NSString stringWithFormat:@"PL%@", v2];

  return (NSString *)v3;
}

+ (id)fetchLabelWithCode:(unsigned int)a3 inContext:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PLGraphLabel.m", 146, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  v8 = +[PLGraphLabel fetchRequest];
  [v8 setIncludesPendingChanges:0];
  v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"code", v4);
  [v8 setPredicate:v9];

  id v16 = 0;
  v10 = [v7 executeFetchRequest:v8 error:&v16];
  id v11 = v16;
  if (v10)
  {
    v12 = [v10 firstObject];
  }
  else
  {
    v13 = PLBackendGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v11;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Error fetching labels: %@", buf, 0xCu);
    }

    v12 = 0;
  }

  return v12;
}

+ (id)labelNameFromCode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ((int)a3 <= 1099)
  {
    id result = @"SocialGroup";
    switch(a3)
    {
      case 0x3E8u:
        return result;
      case 0x3E9u:
        id result = @"SocialGroupKeyAsset";
        break;
      case 0x3EBu:
        id result = @"SocialGroupKeyAssetUserPicked";
        break;
      case 0x3ECu:
        id result = @"SocialGroupExclusiveAsset";
        break;
      default:
        goto LABEL_18;
    }
  }
  else if ((int)a3 > 1199)
  {
    switch(a3)
    {
      case 0x4B0u:
        return @"SmallDetectedFace";
      case 0x4B1u:
        return @"LargeDetectedFace";
      case 0x514u:
        return @"GeneratedAssetDescription";
      default:
LABEL_18:
        id v7 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PLGraphLabel.m", 141, @"Unexpected label code: %u", v3);

        return 0;
    }
  }
  else
  {
    switch(a3)
    {
      case 0x44Cu:
        id result = @"SearchEntity";
        break;
      case 0x44Du:
        id result = @"SearchEntityPersonRelation";
        break;
      case 0x44Eu:
        id result = @"SearchEntityPersonRelationMe";
        break;
      case 0x44Fu:
        id result = @"SearchEntityPersonRelationSelf";
        break;
      default:
        goto LABEL_18;
    }
  }
  return result;
}

+ (void)ensureLabelsAreUpdatedInContext:(id)a3
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"PLGraphLabel.m", 77, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  v6 = [[PLGlobalValues alloc] initWithManagedObjectContext:v5];
  if ([a1 _needsLabelUpdateCheckFromGlobalValues:v6])
  {
    v30 = v6;
    id v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Checking existing GraphLabel set...", buf, 2u);
    }

    v8 = +[PLGraphLabel fetchRequest];
    [v8 setResultType:2];
    v39[0] = @"code";
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
    [v8 setPropertiesToFetch:v9];

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    id v35 = 0;
    id v11 = [v5 executeFetchRequest:v8 error:&v35];
    id v12 = v35;
    v13 = objc_msgSend(v11, "_pl_map:", &__block_literal_global_105599);
    v14 = [v10 setWithArray:v13];

    if (v14)
    {
      id v28 = v12;
      v29 = v8;
      v15 = [MEMORY[0x1E4F1CA80] setWithArray:PLBuiltInGraphLabelCodes];
      [v15 minusSet:v14];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v16 = v15;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v38 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v32 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            v22 = PLBackendGetLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v23 = [v21 integerValue];
              *(_DWORD *)buf = 134217984;
              uint64_t v37 = v23;
              _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "Adding missing GraphLabel with code %ld", buf, 0xCu);
            }

            id v24 = (id)objc_msgSend(a1, "_insertLabelWithCode:inManagedObjectContext:", objc_msgSend(v21, "integerValue"), v5);
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v31 objects:v38 count:16];
        }
        while (v18);
      }

      v25 = PLPhotoLibraryServicesBinaryImageUUID();
      v26 = [v25 UUIDString];
      v6 = v30;
      [(PLGlobalValues *)v30 setLastUpdatedGraphLabelsAgainstPLSImageUUID:v26];

      id v12 = v28;
      v8 = v29;
    }
    else
    {
      id v16 = PLBackendGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v37 = (uint64_t)v12;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_FAULT, "Unable to update existing GraphLabel set due to fetch error: %@", buf, 0xCu);
      }
    }
  }
}

uint64_t __48__PLGraphLabel_ensureLabelsAreUpdatedInContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"code"];
}

+ (id)entityName
{
  return @"GraphLabel";
}

+ (id)_insertLabelWithCode:(unsigned int)a3 inManagedObjectContext:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  if (!v7)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"PLGraphLabel.m", 60, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  v8 = [a1 insertInManagedObjectContext:v7];
  [v8 setCode:v4];

  return v8;
}

+ (BOOL)_needsLabelUpdateCheckFromGlobalValues:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"PLGraphLabel.m", 48, @"Invalid parameter not satisfying: %@", @"globalValues" object file lineNumber description];
  }
  v6 = PLPhotoLibraryServicesBinaryImageUUID();
  id v7 = [v6 UUIDString];

  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:a1 file:@"PLGraphLabel.m" lineNumber:52 description:@"can't read PLS image UUID"];
  }
  v8 = [v5 lastUpdatedGraphLabelsAgainstPLSImageUUID];
  char v9 = PLObjectIsEqual() ^ 1;

  return v9;
}

@end