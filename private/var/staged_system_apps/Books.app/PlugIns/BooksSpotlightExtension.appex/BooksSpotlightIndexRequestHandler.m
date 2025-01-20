@interface BooksSpotlightIndexRequestHandler
- (id)searchableIndexProvideDataForIndex:(id)a3 identifier:(id)a4 type:(id)a5 error:(id *)a6;
- (id)searchableIndexProvideFileURLForIndex:(id)a3 identifier:(id)a4 type:(id)a5 error:(id *)a6;
- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4;
- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5;
@end

@implementation BooksSpotlightIndexRequestHandler

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(void))a4;
  v7 = sub_100002A40();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100002DFC((uint64_t)v5, v7);
  }

  v6[2](v6);
}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(void))a5;
  v10 = sub_100002A40();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100002E74();
  }

  v9[2](v9);
}

- (id)searchableIndexProvideDataForIndex:(id)a3 identifier:(id)a4 type:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_100002A40();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100002F20();
  }

  v13 = sub_10000261C(v8, v9);
  v14 = [UTTypeURL identifier];
  unsigned int v15 = [v10 isEqualToString:v14];

  if (!v15)
  {
    v26 = [UTTypeUTF8PlainText identifier];
    unsigned int v27 = [v10 isEqualToString:v26];

    if (!v27)
    {
      id v37 = 0;
      goto LABEL_29;
    }
    id v28 = v13;
    id v29 = objc_alloc_init((Class)NSMutableArray);
    v30 = [v28 title];
    if ([v30 length]) {
      [v29 addObject:v30];
    }
    v47 = v30;
    v31 = [v28 contentType];
    v32 = [UTTypeEPUB identifier];
    v49 = v12;
    if (([v31 isEqualToString:v32] & 1) != 0
      || ([v31 isEqualToString:@"com.apple.ibooks-container"] & 1) != 0
      || ([v31 isEqualToString:@"com.apple.ibooks"] & 1) != 0
      || ([v31 isEqualToString:@"com.apple.ibooks-folder"] & 1) != 0)
    {
    }
    else
    {
      unsigned __int8 v39 = [v31 isEqualToString:@"com.apple.m4a-audio"];

      if ((v39 & 1) == 0)
      {
        v40 = [UTTypePDF identifier];
        unsigned int v41 = [v31 isEqualToString:v40];

        if (!v41) {
          goto LABEL_20;
        }
        v42 = [v28 contributors];
        v34 = [v42 componentsJoinedByString:@", "];

        if ([v34 length]) {
          [v29 addObject:v34];
        }
        v35 = [UTTypePDF preferredFilenameExtension];
        if ([v35 length])
        {
          v43 = [v35 uppercaseString];
          [v29 addObject:v43];
        }
        v44 = [v28 fileSize];
        uint64_t v46 = (uint64_t)[v44 longLongValue];

        if (v46 >= 1)
        {
          v45 = +[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:");
          [v29 addObject:v45];
        }
LABEL_19:

LABEL_20:
        if ([v29 count])
        {
          v36 = [v29 componentsJoinedByString:@"\n"];
        }
        else
        {
          v36 = &stru_1000044C0;
        }
        v12 = v49;

        id v37 = [(__CFString *)v36 dataUsingEncoding:4];

        goto LABEL_29;
      }
    }
    v33 = [v28 contributors];
    v34 = [v33 componentsJoinedByString:@", "];

    if ([v34 length]) {
      [v29 addObject:v34];
    }
    v35 = [v28 si_stringAttributeForKey:@"com_apple_iBooks_storeURL"];
    if ([v35 length]) {
      [v29 addObject:v35];
    }
    goto LABEL_19;
  }
  id v16 = v13;
  v17 = [v16 si_stringAttributeForKey:@"com_apple_iBooks_storeURL"];
  if ([v17 length]
    && (+[NSURL URLWithString:v17],
        (uint64_t v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v19 = (void *)v18;
    v48 = v12;
    v20 = dispatch_group_create();
    dispatch_group_enter(v20);
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x3032000000;
    v56 = sub_100002AD8;
    v57 = sub_100002AE8;
    id v58 = 0;
    v21 = [UTTypeURL identifier];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_100002D64;
    v50[3] = &unk_1000042C0;
    v52 = &v53;
    v22 = v20;
    v51 = v22;
    id v23 = [v19 loadDataWithTypeIdentifier:v21 forItemProviderCompletionHandler:v50];

    dispatch_time_t v24 = dispatch_time(0, 20000000000);
    dispatch_group_wait(v22, v24);
    id v25 = (id)v54[5];

    _Block_object_dispose(&v53, 8);
    v12 = v48;
  }
  else
  {
    v22 = sub_100002A40();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100002EDC(v22);
    }
    v19 = 0;
    id v25 = 0;
  }

  id v37 = v25;
LABEL_29:

  return v37;
}

- (id)searchableIndexProvideFileURLForIndex:(id)a3 identifier:(id)a4 type:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_100002A40();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100002F88();
  }

  v13 = sub_10000261C(v8, v9);
  v14 = [v13 si_stringAttributeForKey:@"com_apple_iBooks_localFileURL"];
  if ([v14 length])
  {
    unsigned int v15 = +[NSURL URLWithString:v14];
  }
  else
  {
    unsigned int v15 = 0;
  }

  return v15;
}

@end