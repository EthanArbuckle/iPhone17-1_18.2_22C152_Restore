@interface PLSearchQueryExecutor
+ (id)_querySearchIndex:(id)a3 lookupIdentifier:(id)a4 searchResultTypes:(unint64_t)a5;
+ (id)searchResultForLookupIdentifier:(id)a3 searchResultTypes:(unint64_t)a4 plPhotoLibrary:(id)a5 searchIndex:(id)a6;
@end

@implementation PLSearchQueryExecutor

+ (id)searchResultForLookupIdentifier:(id)a3 searchResultTypes:(unint64_t)a4 plPhotoLibrary:(id)a5 searchIndex:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (v12)
  {
    if (!v11)
    {
      v30 = [MEMORY[0x1E4F28B00] currentHandler];
      [v30 handleFailureInMethod:a2, a1, @"PLSearchQueryExecutor.m", 32, @"Invalid parameter not satisfying: %@", @"lookupIdentifier" object file lineNumber description];
    }
    v14 = PLBackendGetLog();
    os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, a1);
    v16 = v14;
    v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v32 = (uint64_t)v11;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PLSearchBackendLookupIdentifierQuery", "LookupIdentifier=%@", buf, 0xCu);
    }

    if (v13)
    {
      v18 = [a1 _querySearchIndex:v13 lookupIdentifier:v11 searchResultTypes:a4];
    }
    else
    {
      v21 = PLSearchBackendPhotoKitAPIGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Unable to execute query, failure to connect to search index.", buf, 2u);
      }

      v22 = [v12 assetsdClient];
      v23 = [v22 libraryInternalClient];
      [v23 waitForSearchIndexExistenceWithError:0];

      v18 = 0;
    }
    v24 = v17;
    v25 = v24;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      v26 = [v18 assetUUIDs];
      uint64_t v27 = [v26 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v32 = v27;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v25, OS_SIGNPOST_INTERVAL_END, v15, "PLSearchBackendLookupIdentifierQuery", "Count=%lu", buf, 0xCu);
    }
    if (v18) {
      v28 = v18;
    }
    else {
      v28 = objc_alloc_init(PLSearchResultV2);
    }
    v20 = v28;
  }
  else
  {
    v19 = PLSearchBackendPhotoKitAPIGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Unable to execute query, photolibrary is nil.", buf, 2u);
    }

    v20 = objc_alloc_init(PLSearchResultV2);
  }

  return v20;
}

+ (id)_querySearchIndex:(id)a3 lookupIdentifier:(id)a4 searchResultTypes:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [[PLSearchProcessor alloc] initWithDatabase:v8];
  v10 = [(PLSearchProcessor *)v9 performQueryForLookupIdentifier:v7 searchResultTypes:a5 searchIndex:v8];

  return v10;
}

@end