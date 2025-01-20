void sub_1000035D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000035F4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Invalidated database-locking operation, error %@", (uint8_t *)&v9, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = (void *)*((void *)WeakRetained + 1);
    *((void *)WeakRetained + 1) = 0;
  }
}

void sub_100003A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003A34(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Invalidated object creation-locking operation, error %@", (uint8_t *)&v9, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = (void *)*((void *)WeakRetained + 2);
    *((void *)WeakRetained + 2) = 0;
  }
}

void sub_100003DB0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_10000428C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000042B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000042C0(uint64_t a1)
{
}

void sub_1000042C8(uint64_t a1)
{
  v2 = +[ICWidget sharedWidget];
  unsigned __int8 v3 = [v2 hidesObject:*(void *)(a1 + 32)];

  if ((v3 & 1) == 0)
  {
    objc_opt_class();
    id v4 = ICDynamicCast();
    v5 = v4;
    if (v4)
    {
      id v15 = v4;
    }
    else
    {
      objc_opt_class();
      v6 = ICDynamicCast();
      id v15 = [v6 account];
    }
    id v7 = *(id *)(a1 + 40);
    v8 = +[ICAppURLUtilities appURLForFolder:v15];
    uint64_t v9 = [v8 absoluteString];
    id v10 = [v15 allItemsFolderLocalizedTitle];
    v11 = +[ICFolder defaultSystemImageName];
    id v12 = [v7 initWithIdentifier:v9 title:v10 depth:0 shareDescription:0 systemImageName:v11];
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

void sub_100004444(uint64_t a1)
{
  v2 = +[ICWidget sharedWidget];
  unsigned __int8 v3 = [v2 hidesObject:*(void *)(a1 + 32)];

  if ((v3 & 1) == 0)
  {
    objc_opt_class();
    ICClassAndProtocolCast();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = *(id *)(a1 + 40);
    v5 = +[ICAppURLUtilities appURLForHTMLFolder:](ICAppURLUtilities, "appURLForHTMLFolder:", v12, &OBJC_PROTOCOL___ICLegacyAccount);
    v6 = [v5 absoluteString];
    id v7 = [v12 allItemsFolderLocalizedTitle];
    v8 = +[ICFolder defaultSystemImageName];
    id v9 = [v4 initWithIdentifier:v6 title:v7 depth:0 shareDescription:0 systemImageName:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

void sub_100004598(uint64_t a1)
{
  v2 = +[ICWidget sharedWidget];
  unsigned __int8 v3 = [v2 hidesObject:*(void *)(a1 + 32)];

  if ((v3 & 1) == 0)
  {
    objc_opt_class();
    ICDynamicCast();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = *(id *)(a1 + 40);
    v5 = +[ICAppURLUtilities appURLForFolder:v14];
    v6 = [v5 absoluteString];
    id v7 = [v14 localizedTitle];
    id v8 = [v14 depth];
    id v9 = [v14 shareDescription];
    uint64_t v10 = [v14 systemImageName];
    id v11 = [v4 initWithIdentifier:v6 title:v7 depth:v8 shareDescription:v9 systemImageName:v10];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

void sub_1000046FC(uint64_t a1)
{
  v2 = +[ICWidget sharedWidget];
  unsigned __int8 v3 = [v2 hidesObject:*(void *)(a1 + 32)];

  if ((v3 & 1) == 0)
  {
    objc_opt_class();
    ICClassAndProtocolCast();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = *(id *)(a1 + 40);
    v5 = +[ICAppURLUtilities appURLForHTMLFolder:](ICAppURLUtilities, "appURLForHTMLFolder:", v13, &OBJC_PROTOCOL___ICLegacyFolder);
    v6 = [v5 absoluteString];
    id v7 = [v13 localizedTitle];
    id v8 = [v13 depth];
    id v9 = +[ICFolder defaultSystemImageName];
    id v10 = [v4 initWithIdentifier:v6 title:v7 depth:v8 shareDescription:0 systemImageName:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

void sub_100005630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005648(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100005658(uint64_t a1)
{
}

void sub_100005660(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) eventReporter];
  [v2 submitNoteCreateEventForSearchIndexableNote:*(void *)(a1 + 40) createApproach:1];

  objc_opt_class();
  ICDynamicCast();
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    unsigned __int8 v3 = *(void **)(a1 + 32);
    id v4 = [v16 folder];
    v5 = [v4 objectID];
    v6 = [*(id *)(a1 + 32) noteContext];
    id v7 = [v6 htmlNoteContext];
    [v3 refreshNotesForCollectionWithId:v5 andContext:v7];
  }
  id v8 = objc_alloc((Class)NSUserActivity);
  id v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  id v11 = [v8 initWithActivityType:v10];

  id v12 = [objc_alloc((Class)INCreateNoteIntentResponse) initWithCode:3 userActivity:v11];
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  id v15 = [*(id *)(a1 + 32) intentNoteForSearchIndexableNote:*(void *)(a1 + 40) includeContent:1];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setCreatedNote:v15];
}

void sub_100005B84(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) recentNotesIndexer];
  id v3 = [v2 newSnapshotFromIndex];

  id v4 = [v3 sectionIdentifiers];
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_100005C90;
  uint64_t v13 = &unk_100020800;
  uint64_t v5 = *(void *)(a1 + 32);
  id v14 = v3;
  uint64_t v15 = v5;
  id v6 = v3;
  id v7 = [v4 ic_compactMap:&v10];

  id v8 = objc_alloc((Class)INObjectCollection);
  id v9 = [v8 initWithSections:v7, v10, v11, v12, v13];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_100005C90(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 itemIdentifiersInSectionWithIdentifier:v4];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005D94;
  v11[3] = &unk_1000207D8;
  v11[4] = *(void *)(a1 + 40);
  id v6 = [v5 ic_compactMap:v11];

  id v7 = objc_alloc((Class)INObjectSection);
  id v8 = [v4 title];

  id v9 = [v7 initWithTitle:v8 items:v6];

  return v9;
}

id sub_100005D94(uint64_t a1, void *a2)
{
  id v3 = a2;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_10000607C;
  v30[4] = sub_10000608C;
  id v31 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_10000607C;
  v28 = sub_10000608C;
  id v29 = 0;
  if (objc_msgSend(v3, "ic_isModernNoteType"))
  {
    id v4 = [*(id *)(a1 + 32) modernContext];
    uint64_t v5 = [v4 managedObjectContext];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100006094;
    v20[3] = &unk_1000207B0;
    uint64_t v6 = *(void *)(a1 + 32);
    v22 = v30;
    v20[4] = v6;
    id v21 = v3;
    v23 = &v24;
    [v5 performBlockAndWait:v20];

    id v7 = v21;
LABEL_5:

    goto LABEL_9;
  }
  if (objc_msgSend(v3, "ic_isLegacyNoteType"))
  {
    id v8 = [*(id *)(a1 + 32) legacyContext];
    id v9 = [v8 managedObjectContext];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000615C;
    v16[3] = &unk_1000207B0;
    uint64_t v10 = *(void *)(a1 + 32);
    v18 = v30;
    v16[4] = v10;
    id v17 = v3;
    v19 = &v24;
    [v9 performBlockAndWait:v16];

    id v7 = v17;
    goto LABEL_5;
  }
  uint64_t v11 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_100013EFC();
  }

LABEL_9:
  id v12 = (void *)v25[5];
  if (v12)
  {
    id v13 = v12;
  }
  else
  {
    id v14 = os_log_create("com.apple.notes", "Intents");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100013E94();
    }
  }
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(v30, 8);

  return v12;
}

void sub_100006058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000607C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000608C(uint64_t a1)
{
}

void sub_100006094(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) modernContext];
  id v3 = [v2 managedObjectContext];
  uint64_t v4 = [v3 ic_existingObjectWithID:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [[ICIntentNote alloc] initWithObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8)+ 40)];
    _objc_release_x1();
  }
}

void sub_10000615C(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) legacyContext];
  id v3 = [v2 managedObjectContext];
  uint64_t v4 = [v3 ic_existingObjectWithID:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [[ICIntentNote alloc] initWithObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8)+ 40)];
    _objc_release_x1();
  }
}

void sub_10000641C(uint64_t a1)
{
  v45 = +[NSMutableDictionary dictionary];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obj = [*(id *)(a1 + 32) results];
  id v2 = [obj countByEnumeratingWithState:&v68 objects:v78 count:16];
  if (v2)
  {
    uint64_t v44 = *(void *)v69;
    *(void *)&long long v3 = 138412546;
    long long v42 = v3;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v69 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v68 + 1) + 8 * (void)v4);
        uint64_t v6 = [*(id *)(a1 + 40) modernContext:v42];
        id v7 = [v6 persistentContainer];
        id v8 = [v7 persistentStoreCoordinator];
        id v9 = [v5 uniqueIdentifier];
        uint64_t v10 = [v8 ic_managedObjectIDForURIString:v9];

        uint64_t v11 = [*(id *)(a1 + 40) legacyContext];
        id v12 = [v11 managedObjectContext];
        id v13 = [v12 persistentStoreCoordinator];
        id v14 = [v5 uniqueIdentifier];
        uint64_t v15 = [v13 ic_managedObjectIDForURIString:v14];

        uint64_t v62 = 0;
        v63 = &v62;
        uint64_t v64 = 0x3032000000;
        v65 = sub_10000607C;
        v66 = sub_10000608C;
        id v67 = 0;
        uint64_t v56 = 0;
        v57 = &v56;
        uint64_t v58 = 0x3032000000;
        v59 = sub_10000607C;
        v60 = sub_10000608C;
        id v61 = 0;
        if (objc_msgSend(v10, "ic_isModernNoteType"))
        {
          id v16 = [*(id *)(a1 + 40) modernContext];
          uint64_t v17 = [v16 managedObjectContext];
          v52[0] = _NSConcreteStackBlock;
          v52[1] = 3221225472;
          v52[2] = sub_100006B8C;
          v52[3] = &unk_1000207B0;
          uint64_t v18 = *(void *)(a1 + 40);
          v54 = &v62;
          v52[4] = v18;
          id v53 = v10;
          v55 = &v56;
          [v17 performBlockAndWait:v52];
        }
        else if (objc_msgSend(v15, "ic_isLegacyNoteType"))
        {
          v19 = [*(id *)(a1 + 40) legacyContext];
          v20 = [v19 managedObjectContext];
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_100006C54;
          v48[3] = &unk_1000207B0;
          uint64_t v21 = *(void *)(a1 + 40);
          v50 = &v62;
          v48[4] = v21;
          id v49 = v15;
          v51 = &v56;
          [v20 performBlockAndWait:v48];
        }
        else
        {
          v22 = os_log_create("com.apple.notes", "Intents");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v42;
            v75 = v10;
            __int16 v76 = 2112;
            v77 = v15;
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Unknown object type — skipping {modernObjectID: %@, legacyObjectID: %@}", buf, 0x16u);
          }
        }
        if (v63[5])
        {
          id v23 = objc_alloc((Class)ICFolderListSectionIdentifier);
          uint64_t v24 = [v23 initWithObject:v63[5]];
          if (!v24)
          {
            v32 = os_log_create("com.apple.notes", "Intents");
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              v33 = [(id)v63[5] objectID];
              sub_100013F64(v33, v72, &v73, v32);
            }

            goto LABEL_24;
          }
          v25 = [v45 objectForKeyedSubscript:v24];
          BOOL v26 = v25 == 0;

          if (v26)
          {
            v27 = +[NSMutableArray array];
            [v45 setObject:v27 forKeyedSubscript:v24];
          }
          v28 = [v45 objectForKeyedSubscript:v24];
          id v29 = [v28 count];
          v30 = [*(id *)(a1 + 40) recentNotesIndexer];
          BOOL v31 = v29 < [v30 maximumNumberOfNotesPerAccount];

          if (v31)
          {
            v32 = [v45 objectForKeyedSubscript:v24];
            [v32 ic_addNonNilObject:v57[5]];
LABEL_24:
          }
        }
        else
        {
          uint64_t v24 = os_log_create("com.apple.notes", "Intents");
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v42;
            v75 = v10;
            __int16 v76 = 2112;
            v77 = v15;
            _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Note does not exist — skipping {modernObjectID: %@, legacyObjectID: %@}", buf, 0x16u);
          }
        }

        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(&v62, 8);

        uint64_t v4 = (char *)v4 + 1;
      }
      while (v2 != v4);
      id v2 = [obj countByEnumeratingWithState:&v68 objects:v78 count:16];
    }
    while (v2);
  }

  v34 = [v45 allKeys];
  v35 = +[ICFolderListSectionIdentifier sortDescriptors];
  v36 = [v34 sortedArrayUsingDescriptors:v35];

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100006D1C;
  v46[3] = &unk_100020850;
  id v47 = v45;
  id v37 = v45;
  v38 = [v36 ic_map:v46];
  id v39 = [objc_alloc((Class)INObjectCollection) initWithSections:v38];
  uint64_t v40 = *(void *)(a1 + 48);
  v41 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *))(v40 + 16))(v40, v39, v41);
}

void sub_100006B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
}

void sub_100006B8C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modernContext];
  long long v3 = [v2 managedObjectContext];
  uint64_t v4 = [v3 ic_existingObjectWithID:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [[ICIntentNote alloc] initWithObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8)+ 40)];
    _objc_release_x1();
  }
}

void sub_100006C54(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) legacyContext];
  long long v3 = [v2 managedObjectContext];
  uint64_t v4 = [v3 ic_existingObjectWithID:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [[ICIntentNote alloc] initWithObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8)+ 40)];
    _objc_release_x1();
  }
}

id sub_100006D1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)INObjectSection);
  uint64_t v5 = [v3 title];
  uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];

  id v7 = [v4 initWithTitle:v5 items:v6];

  return v7;
}

void sub_100006F0C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = [a2 allItems];
  id v3 = +[ICIntentNoteResolutionResult disambiguationWithIntentNotesToDisambiguate:v4];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void sub_1000073F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100007418(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) modernContext];
  id v3 = [v2 managedObjectContext];
  uint64_t v4 = [v3 ic_existingObjectWithID:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [[ICIntentNote alloc] initWithObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8)+ 40)];
    _objc_release_x1();
  }
}

void sub_1000074E0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) legacyContext];
  id v3 = [v2 managedObjectContext];
  uint64_t v4 = [v3 ic_existingObjectWithID:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [[ICIntentNote alloc] initWithObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8)+ 40)];
    _objc_release_x1();
  }
}

void sub_1000075F8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100007614(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100007A68(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) folderIndexer];
  id v3 = [v2 newSnapshotFromIndex];

  uint64_t v4 = [v3 sectionIdentifiers];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100007B84;
  v10[3] = &unk_100020940;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v11 = v3;
  uint64_t v12 = v5;
  id v13 = v6;
  id v7 = v3;
  id v8 = [v4 ic_compactMap:v10];

  id v9 = [objc_alloc((Class)INObjectCollection) initWithSections:v8];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

id sub_100007B84(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) itemIdentifiersInSectionWithIdentifier:v3];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100007D24;
  v16[3] = &unk_1000208F0;
  v16[4] = *(void *)(a1 + 40);
  uint64_t v5 = [v4 ic_compactMap:v16];

  if ([*(id *)(a1 + 48) length])
  {
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    id v13 = sub_100008270;
    id v14 = &unk_100020918;
    id v15 = *(id *)(a1 + 48);
    uint64_t v6 = [v5 ic_objectsPassingTest:&v11];

    id v7 = [v6 count:v11, v12, v13, v14];
    if (!v7) {
      goto LABEL_6;
    }
    uint64_t v5 = v6;
  }
  else
  {
    uint64_t v6 = v5;
  }
  id v8 = objc_alloc((Class)INObjectSection);
  id v9 = [v3 title];
  id v7 = [v8 initWithTitle:v9 items:v5];

LABEL_6:

  return v7;
}

id sub_100007D24(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_1000080B8;
  v28 = sub_1000080C8;
  objc_opt_class();
  ICDynamicCast();
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  uint64_t v4 = ICDynamicCast();
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_1000080B8;
  v22[4] = sub_1000080C8;
  id v23 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_1000080B8;
  v20 = sub_1000080C8;
  id v21 = 0;
  if (objc_msgSend((id)v25[5], "ic_isModernContainerType"))
  {
    uint64_t v5 = [*(id *)(a1 + 32) modernContext];
    uint64_t v6 = [v5 managedObjectContext];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000080D0;
    v15[3] = &unk_1000208C8;
    v15[4] = *(void *)(a1 + 32);
    v15[5] = v22;
    v15[6] = &v24;
    v15[7] = &v16;
    [v6 performBlockAndWait:v15];
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend((id)v25[5], "ic_isLegacyContainerType"))
  {
    uint64_t v5 = [*(id *)(a1 + 32) legacyContext];
    uint64_t v6 = [v5 managedObjectContext];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000081A0;
    v14[3] = &unk_1000208C8;
    v14[4] = *(void *)(a1 + 32);
    v14[5] = v22;
    v14[6] = &v24;
    v14[7] = &v16;
    [v6 performBlockAndWait:v14];
    goto LABEL_5;
  }
  if (v4)
  {
    id v11 = [[ICIntentNotesFolder alloc] initWithVirtualSmartFolder:v4];
    uint64_t v12 = (void *)v17[5];
    v17[5] = (uint64_t)v11;
  }
  else
  {
    id v13 = os_log_create("com.apple.notes", "Intents");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100014184((uint64_t)v3, v13);
    }
  }
LABEL_6:
  id v7 = (void *)v17[5];
  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v9 = os_log_create("com.apple.notes", "Intents");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10001410C((uint64_t)v3, v9);
    }
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);

  return v7;
}

void sub_100008080(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000080B8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000080C8(uint64_t a1)
{
}

void sub_1000080D0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) modernContext];
  id v3 = [v2 managedObjectContext];
  uint64_t v4 = [v3 ic_existingObjectWithID:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [[ICIntentNotesFolder alloc] initWithObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8)+ 40)];
    _objc_release_x1();
  }
}

void sub_1000081A0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) legacyContext];
  id v3 = [v2 managedObjectContext];
  uint64_t v4 = [v3 ic_existingObjectWithID:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [[ICIntentNotesFolder alloc] initWithObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8)+ 40)];
    _objc_release_x1();
  }
}

id sub_100008270(uint64_t a1, void *a2)
{
  id v3 = [a2 displayString];
  id v4 = [v3 localizedCaseInsensitiveContainsString:*(void *)(a1 + 32)];

  return v4;
}

void sub_100008408(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = [a2 allItems];
  id v3 = +[ICIntentNotesFolderResolutionResult disambiguationWithIntentNotesFoldersToDisambiguate:v4];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void sub_1000085E8(id a1)
{
  qword_100028B08 = objc_alloc_init(ICSharingExtensionAttachmentsManager);

  _objc_release_x1();
}

void sub_100008AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v6 - 96), 8);
  _Unwind_Resume(a1);
}

BOOL sub_100008B24(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 attachment];
  if (v4)
  {

LABEL_4:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    goto LABEL_5;
  }
  uint64_t v5 = [v3 mediaURL];

  if (v5) {
    goto LABEL_4;
  }
LABEL_5:
  uint64_t v6 = [v3 attributedContentText];

  BOOL v7 = [v6 length] != 0;
  return v7;
}

uint64_t sub_100008BBC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 mediaURL];
  if (v4
    && (uint64_t v5 = (void *)v4,
        [v3 mediaUTI],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    BOOL v7 = [v3 mediaUTI];
    id v8 = +[UTType typeWithIdentifier:v7];

    unsigned int v9 = [v8 conformsToType:UTTypePDF];
    if (v9) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }

    uint64_t v10 = v9 ^ 1;
  }
  else
  {
    uint64_t v10 = 1;
  }

  return v10;
}

void sub_100009488(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100014270();
    }

    id v8 = [*(id *)(a1 + 32) appendLock];
    [v8 unlock];
  }
  else if (v5)
  {
    if ([v5 isFileURL])
    {
      id v9 = [objc_alloc((Class)ICAddAttachmentsManagerAttachmentInfo) initWithFileURL:v5];
      [*(id *)(a1 + 40) addObject:v9];
      uint64_t v10 = [*(id *)(a1 + 32) appendLock];
      [v10 unlock];
    }
    else
    {
      id v9 = [*(id *)(a1 + 48) managedObjectContext];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100009628;
      v14[3] = &unk_1000209D0;
      id v15 = *(id *)(a1 + 48);
      id v11 = v5;
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = *(void **)(a1 + 40);
      id v16 = v11;
      uint64_t v17 = v12;
      uint64_t v18 = *(void *)(a1 + 56);
      id v19 = v13;
      [v9 performBlockAndWait:v14];
    }
  }
}

void sub_100009628(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) addURLAttachmentWithURL:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 48) titleFromExtensionItem:*(void *)(a1 + 56)];
  [v6 setTitle:v2];

  id v3 = +[NSDate date];
  [v6 setCreationDate:v3];
  [v6 setModificationDate:v3];
  uint64_t v4 = objc_opt_new();
  [v4 setAttachment:v6];
  [*(id *)(a1 + 64) addObject:v4];
  id v5 = [*(id *)(a1 + 48) appendLock];
  [v5 unlock];
}

void sub_100009710(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10001430C();
    }

    goto LABEL_7;
  }
  if (v5)
  {
    BOOL v7 = objc_alloc_init((Class)ICAddAttachmentsManagerAttachmentInfo);
    [v7 setAttributedContentText:v5];
    [*(id *)(a1 + 32) addObject:v7];
LABEL_7:
  }
  id v8 = [*(id *)(a1 + 40) appendLock];
  [v8 unlock];
}

void sub_1000097DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = *(void **)(a1 + 32);
    id v8 = [UTTypePlainText identifier];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100009968;
    v18[3] = &unk_100020A48;
    id v9 = *(void **)(a1 + 48);
    v18[4] = *(void *)(a1 + 40);
    id v10 = v9;
    uint64_t v11 = *(void *)(a1 + 56);
    id v19 = v10;
    uint64_t v20 = v11;
    [v7 loadItemForTypeIdentifier:v8 options:0 completionHandler:v18];
  }
  else if (v5)
  {
    id v13 = [*(id *)(a1 + 40) attributedContentText];
    id v14 = [v13 string];
    unsigned __int8 v15 = [v5 isEqualToString:v14];

    if ((v15 & 1) == 0)
    {
      id v16 = objc_alloc_init((Class)ICAddAttachmentsManagerAttachmentInfo);
      id v17 = [objc_alloc((Class)NSAttributedString) initWithString:v5];
      [v16 setAttributedContentText:v17];

      [*(id *)(a1 + 48) addObject:v16];
    }
  }
  uint64_t v12 = [*(id *)(a1 + 56) appendLock];
  [v12 unlock];
}

void sub_100009968(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000143A8();
    }
  }
  else
  {
    if (!v5) {
      goto LABEL_6;
    }
    BOOL v7 = [objc_alloc((Class)NSString) initWithData:v5 encoding:4];
    id v9 = [a1[4] attributedContentText];
    id v10 = [v9 string];
    unsigned __int8 v11 = [v7 isEqualToString:v10];

    if ((v11 & 1) == 0)
    {
      id v12 = objc_alloc_init((Class)ICAddAttachmentsManagerAttachmentInfo);
      id v13 = [objc_alloc((Class)NSAttributedString) initWithString:v7];
      [v12 setAttributedContentText:v13];

      [a1[5] addObject:v12];
    }
  }

LABEL_6:
  id v8 = [a1[6] appendLock];
  [v8 unlock];
}

void sub_100009ABC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000144AC();
    }
LABEL_12:

    goto LABEL_13;
  }
  if (v5)
  {
    id v17 = 0;
    id v8 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v17];
    BOOL v7 = v17;
    if (v7)
    {
      id v9 = os_log_create("com.apple.notes", "SharingExtension");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100014444();
      }
    }
    id v10 = objc_alloc_init((Class)ICAddAttachmentsManagerAttachmentInfo);
    unsigned __int8 v11 = [v8 objectForKeyedSubscript:@"article-title"];
    [v10 setTitle:v11];

    id v12 = [v8 objectForKeyedSubscript:@"article-summary"];
    id v13 = v12;
    if (!v12)
    {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((summary) != nil)", "-[ICSharingExtensionAttachmentsManager extractAttachmentsFromInputItems:note:]_block_invoke", 1, 0, @"Expected non-nil value for '%s'", "summary");
      id v13 = &stru_100021400;
    }
    id v14 = v13;

    id v15 = [objc_alloc((Class)NSAttributedString) initWithString:v14];
    [v10 setAttributedContentText:v15];

    [*(id *)(a1 + 32) addObject:v10];
    goto LABEL_12;
  }
LABEL_13:
  id v16 = [*(id *)(a1 + 40) appendLock];
  [v16 unlock];
}

void sub_100009CD0(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100014588();
    }
    goto LABEL_19;
  }
  if (v5)
  {
    BOOL v7 = objc_alloc_init((Class)ICAddAttachmentsManagerAttachmentInfo);
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    unsigned __int8 v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
    id v30 = 0;
    id v12 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v11 fromData:v5 error:&v30];
    id v13 = v30;

    if (v13)
    {
      id v14 = os_log_create("com.apple.notes", "SharingExtension");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100014444();
      }
    }
    [v7 setMetadata:v12];
    uint64_t v15 = ICAttachmentMetadataURLKey;
    id v16 = [v12 objectForKeyedSubscript:ICAttachmentMetadataURLKey];
    if (!v16) {
      goto LABEL_18;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = v16;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v22 = os_log_create("com.apple.notes", "SharingExtension");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_100014520();
        }
        goto LABEL_17;
      }
      id v17 = [v16 absoluteString];
      if (!v17)
      {
LABEL_18:
        [a1[5] addObject:v7];

LABEL_19:
        goto LABEL_20;
      }
    }
    id v18 = [v12 mutableCopy];
    [v18 removeObjectForKey:v15];
    id v19 = v13;
    id v20 = [v18 copy];

    uint64_t v24 = [a1[4] managedObjectContext];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000A028;
    v25[3] = &unk_100020AC0;
    id v26 = a1[4];
    id v27 = v17;
    id v21 = v20;
    id v13 = v19;
    id v12 = v21;
    id v28 = v21;
    id v29 = v7;
    v22 = v17;
    [v24 performBlockAndWait:v25];

LABEL_17:
    goto LABEL_18;
  }
LABEL_20:
  id v23 = [a1[6] appendLock];
  [v23 unlock];
}

void sub_10000A028(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = +[NSURL URLWithString:*(void *)(a1 + 40)];
  id v5 = [v2 addURLAttachmentWithURL:v3];

  [v5 setMetadata:*(void *)(a1 + 48)];
  uint64_t v4 = +[NSDate date];
  [v5 setCreationDate:v4];
  [v5 setModificationDate:v4];
  [*(id *)(a1 + 56) setAttachment:v5];
  [*(id *)(a1 + 56) setMetadata:0];
}

void sub_10000A0F0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100014588();
    }
    goto LABEL_6;
  }
  if (v5)
  {
    BOOL v7 = objc_alloc_init((Class)ICAddAttachmentsManagerAttachmentInfo);
    uint64_t v11 = ICAttachmentMetadataMapItemDataKey;
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    id v12 = v8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    [v7 setMetadata:v9];

    [*(id *)(a1 + 32) addObject:v7];
LABEL_6:
  }
  uint64_t v10 = [*(id *)(a1 + 40) appendLock];
  [v10 unlock];
}

void sub_10000A3B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000A3CC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) attachment];
  if ([v2 isURL])
  {
    id v3 = [*(id *)(a1 + 32) attachment];
    if ([v3 isiTunes])
    {
      unsigned int v4 = 0;
    }
    else
    {
      id v5 = [*(id *)(a1 + 32) attachment];
      if ([v5 isAppStore])
      {
        unsigned int v4 = 0;
      }
      else
      {
        id v6 = [*(id *)(a1 + 32) attachment];
        if ([v6 isNews])
        {
          unsigned int v4 = 0;
        }
        else
        {
          BOOL v7 = [*(id *)(a1 + 32) attachment];
          if ([v7 isMap])
          {
            unsigned int v4 = 0;
          }
          else
          {
            uint64_t v8 = [*(id *)(a1 + 32) attachment];
            unsigned int v4 = [v8 isPodcasts] ^ 1;
          }
        }
      }
    }
  }
  else
  {
    unsigned int v4 = 0;
  }

  uint64_t v9 = [*(id *)(a1 + 32) attachment];
  if (([v9 isiTunes] & 1) == 0)
  {
    uint64_t v10 = [*(id *)(a1 + 32) attachment];
    if (([v10 isAppStore] & 1) == 0)
    {
      uint64_t v11 = [*(id *)(a1 + 32) attachment];
      if (([v11 isNews] & 1) == 0)
      {
        id v12 = [*(id *)(a1 + 32) attachment];
        if (([v12 isMap] & 1) == 0)
        {
          id v13 = [*(id *)(a1 + 32) attachment];
          if (([v13 isURL] & 1) == 0)
          {
            id v67 = [*(id *)(a1 + 32) attachment];
            unsigned __int8 v68 = [v67 isPodcasts];

            if ((v68 & 1) == 0) {
              return;
            }
            goto LABEL_26;
          }
        }
      }
    }
  }

LABEL_26:
  if (![*(id *)(a1 + 40) count]) {
    return;
  }
  uint64_t v14 = 0;
  char v15 = 0;
  while (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == v14)
  {
LABEL_61:
    if (++v14 >= (unint64_t)[*(id *)(a1 + 40) count]) {
      goto LABEL_82;
    }
  }
  id v16 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v14];
  id v17 = [v16 image];
  if (v17) {
    char v18 = v4;
  }
  else {
    char v18 = 1;
  }

  if ((v18 & 1) == 0)
  {
    v32 = [v16 image];
    [v32 size];
    double v34 = v33;
    double v36 = v35;
    [v32 scale];
    double v38 = v37;
    if (v34 * v37 <= 800.0 && v36 * v37 <= 800.0)
    {
      [v32 ic_cropRectZeroAlpha];
      double x = v79.origin.x;
      double y = v79.origin.y;
      double width = v79.size.width;
      double height = v79.size.height;
      if (!CGRectIsEmpty(v79))
      {
        [v32 size];
        if (width < v44 || ([v32 size], height < v45))
        {
          uint64_t v46 = [v32 ic_imageFromRect:x, y, width, height];

          v32 = (void *)v46;
        }
      }
    }
    [v32 size];
    double v49 = v38 * v48;
    if (v38 * v47 > 384.0 && v49 > 384.0)
    {
      uint64_t v51 = [v32 ic_scaledImageMinDimension:384.0 scale:v38];

      v32 = (void *)v51;
    }
    v52 = [*(id *)(a1 + 32) attachment];
    char v15 = 1;
    id v53 = [v52 updateAttachmentPreviewImageWithImage:v32 scale:1 scaleWhenDrawing:0 metadata:1 sendNotification:0.0];
    goto LABEL_56;
  }
  id v19 = [v16 metadata];
  if (v19) {
    char v20 = v4;
  }
  else {
    char v20 = 1;
  }

  if ((v20 & 1) == 0)
  {
    v32 = [v16 metadata];
    v52 = [*(id *)(a1 + 32) attachment];
    [v52 setMetadata:v32];
    goto LABEL_56;
  }
  uint64_t v21 = [*(id *)(a1 + 32) attachment];
  if (!v21
    || (v22 = (void *)v21,
        [v16 attachment],
        id v23 = objc_claimAutoreleasedReturnValue(),
        v23,
        v22,
        !v23))
  {
    uint64_t v56 = [*(id *)(a1 + 32) attachment];
    unsigned int v57 = [v56 isNews];

    if (!v57) {
      goto LABEL_60;
    }
    uint64_t v58 = [*(id *)(a1 + 32) attachment];
    uint64_t v59 = [v58 title];
    BOOL v60 = v59 == 0;
    if (v59)
    {
      id v61 = (void *)v59;
    }
    else
    {
      uint64_t v62 = [v16 title];

      if (!v62)
      {
        BOOL v60 = 0;
        goto LABEL_69;
      }
      uint64_t v58 = [v16 title];
      id v61 = [*(id *)(a1 + 32) attachment];
      [v61 setTitle:v58];
    }

LABEL_69:
    v63 = [*(id *)(a1 + 32) attachment];
    uint64_t v64 = [v63 summary];
    if (v64)
    {

      if (!v60) {
        goto LABEL_60;
      }
      goto LABEL_71;
    }
    v65 = [v16 attributedContentText];

    if (!v65)
    {
      if (!v60) {
        goto LABEL_60;
      }
LABEL_71:
      char v15 = 1;
      goto LABEL_57;
    }
    v32 = [v16 attributedContentText];
    v52 = [v32 string];
    v66 = [*(id *)(a1 + 32) attachment];
    [v66 setSummary:v52];

    char v15 = 1;
LABEL_56:

LABEL_57:
    [*(id *)(a1 + 40) removeObjectAtIndex:v14];
    uint64_t v54 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v55 = *(void *)(v54 + 24);
    if (v55 >= v14) {
      *(void *)(v54 + 24) = v55 - 1;
    }
    --v14;
    goto LABEL_60;
  }
  uint64_t v24 = *(void **)(a1 + 48);
  v25 = [*(id *)(a1 + 32) attachment];
  id v26 = [v25 URL];
  id v27 = [v24 getURLWithoutQueryAndFragmentFromURL:v26];

  id v28 = *(void **)(a1 + 48);
  id v29 = [v16 attachment];
  id v30 = [v29 URL];
  BOOL v31 = [v28 getURLWithoutQueryAndFragmentFromURL:v30];

  if ((([v27 isEqual:v31] | v4) & 1) == 0)
  {

LABEL_60:
    goto LABEL_61;
  }
  long long v69 = [*(id *)(a1 + 32) attachment];
  long long v70 = [v69 title];

  if (!v70)
  {
    long long v71 = [v16 attachment];
    v72 = [v71 title];
    uint64_t v73 = [*(id *)(a1 + 32) attachment];
    [v73 setTitle:v72];
  }
  v74 = [v16 attachment];
  +[ICAttachment deleteAttachment:v74];

  [*(id *)(a1 + 40) removeObjectAtIndex:v14];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 40) count];

LABEL_82:
  if (v15)
  {
    v75 = [*(id *)(a1 + 32) attachment];
    __int16 v76 = [v75 managedObjectContext];
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472;
    v77[2] = sub_10000AB14;
    v77[3] = &unk_100020AE8;
    id v78 = *(id *)(a1 + 32);
    [v76 performBlockAndWait:v77];
  }
}

void sub_10000AB14(uint64_t a1)
{
  uint64_t v2 = +[NSDate date];
  id v3 = [*(id *)(a1 + 32) attachment];
  [v3 setPreviewUpdateDate:v2];

  id v4 = [*(id *)(a1 + 32) attachment];
  [v4 updateChangeCountWithReason:@"Consolidated duplicate attachment"];
}

void sub_10000AD2C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) metadata];
  if (v2)
  {
    id v11 = v2;
    id v3 = [*(id *)(a1 + 32) title];

    if (!v3)
    {
      uint64_t v4 = ICAttachmentMetadataTitleKey;
      id v5 = [v11 objectForKeyedSubscript:ICAttachmentMetadataTitleKey];

      if (v5)
      {
        id v6 = [v11 objectForKeyedSubscript:v4];
        [*(id *)(a1 + 32) setTitle:v6];
      }
    }
    BOOL v7 = [*(id *)(a1 + 32) summary];

    uint64_t v2 = v11;
    if (!v7)
    {
      uint64_t v8 = ICAttachmentMetadataDescriptionKey;
      uint64_t v9 = [v11 objectForKeyedSubscript:ICAttachmentMetadataDescriptionKey];

      uint64_t v2 = v11;
      if (v9)
      {
        uint64_t v10 = [v11 objectForKeyedSubscript:v8];
        [*(id *)(a1 + 32) setSummary:v10];

        uint64_t v2 = v11;
      }
    }
  }
}

intptr_t sub_10000B5A8(intptr_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(result + 32));
  }
  return result;
}

intptr_t sub_10000B5BC(intptr_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(result + 32));
  }
  return result;
}

void sub_10000B88C(id a1)
{
  uint64_t v1 = [UTTypeImage identifier];
  uint64_t v2 = [UTTypePDF identifier];
  v6[1] = v2;
  id v3 = [UTTypeAudiovisualContent identifier];
  v6[2] = v3;
  uint64_t v4 = +[NSArray arrayWithObjects:v6 count:3];
  id v5 = (void *)qword_100028B10;
  qword_100028B10 = v4;
}

id sub_10000BD5C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_10000BD68(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) addObject:a2];
  }
  id v3 = [*(id *)(a1 + 40) appendLock];
  [v3 unlock];

  uint64_t v4 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v4);
}

void sub_10000BDC4(uint64_t a1, uint64_t a2)
{
  if (a2) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  id v3 = [*(id *)(a1 + 32) appendLock];
  [v3 unlock];

  uint64_t v4 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v4);
}

void sub_10000BE24(uint64_t a1, uint64_t a2)
{
  if (a2) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  id v3 = [*(id *)(a1 + 32) appendLock];
  [v3 unlock];

  uint64_t v4 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v4);
}

void sub_10000C1B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v14 = a1;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v10 = os_log_create("com.apple.notes", "SharingExtension");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v22 = v9;
            _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error pushing cloud objects, but trying again: %@", buf, 0xCu);
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v6);
    }
    id v11 = +[ICCloudContext sharedContext];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000C3E4;
    v15[3] = &unk_100020BF8;
    id v16 = *(id *)(v14 + 32);
    [v11 processAllCloudObjectsWithCompletionHandler:v15];
  }
  else
  {
    id v12 = +[ICNoteContext sharedContext];
    [v12 save];

    uint64_t v13 = *(void *)(a1 + 32);
    if (v13) {
      (*(void (**)(void))(v13 + 16))();
    }
  }
}

uint64_t sub_10000C3E4(uint64_t a1)
{
  uint64_t v2 = +[ICNoteContext sharedContext];
  [v2 save];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void sub_10000C890(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10000C8B0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10000CEDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

uint64_t sub_10000CF24(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000CF34(uint64_t a1)
{
}

void sub_10000CF3C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) title];
  id v3 = [v2 localizedCaseInsensitiveCompare:*(void *)(a1 + 40)];

  if (!v3)
  {
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v5 = *(void *)(a1 + 32);
    [v4 addObject:v5];
  }
}

void sub_10000D5E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D620(uint64_t a1)
{
  if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) hasPrefix:@"\n"] & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 32) noteAsPlainText];
    unsigned __int8 v3 = [v2 hasSuffix:@"\n"];

    if ((v3 & 1) == 0)
    {
      uint64_t v4 = [@"\n" stringByAppendingString:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;
    }
  }
  if ([*(id *)(a1 + 32) isPasswordProtected])
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = +[NSError errorWithDomain:ICErrorDomain code:206 userInfo:0];
    _objc_release_x1();
  }
  else
  {
    uint64_t v7 = +[ICSharingExtensionAttachmentsManager sharedManager];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v10 + 40);
    [v7 addString:v9 toNote:v8 error:&obj];
    objc_storeStrong((id *)(v10 + 40), obj);
  }
}

void sub_10000DA18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000DA4C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) content];
  unsigned __int8 v3 = (char *)[v2 length];
  if (([*(id *)(a1 + 32) isPlainText] & 1) == 0)
  {
    unsigned __int8 v3 = (char *)[v2 ic_HTMLInsertionPoint];
    uint64_t v4 = ICNoteHTMLFromPlainText();
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  if (v3)
  {
    if ([*(id *)(a1 + 32) isPlainText])
    {
      id v7 = [v2 characterAtIndex:v3 - 1];
      uint64_t v8 = +[NSCharacterSet newlineCharacterSet];
      LOBYTE(v7) = [v8 characterIsMember:v7];

      if (v7) {
        goto LABEL_9;
      }
      +[NSString localizedStringWithFormat:@"\n%@", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    }
    else
    {
      +[NSString localizedStringWithFormat:@"<div>%@</div>", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    uint64_t v9 = };
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
LABEL_9:
  id v12 = [v2 mutableCopy];
  [v12 insertString:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) atIndex:v3];
  uint64_t v13 = +[NSDate date];
  [*(id *)(a1 + 32) setModificationDate:v13];

  id v14 = [v12 copy];
  [*(id *)(a1 + 32) setContent:v14];

  char v15 = [*(id *)(a1 + 32) title];
  id v16 = [v15 length];

  if (!v16)
  {
    long long v17 = [*(id *)(a1 + 40) text];
    long long v18 = ICNoteTitleFromPlainText();
    [*(id *)(a1 + 32) setTitle:v18];
  }
  objc_opt_class();
  long long v19 = [*(id *)(a1 + 48) noteContext];
  long long v20 = [v19 htmlNoteContext];
  uint64_t v21 = ICCheckedDynamicCast();
  uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v22 + 40);
  unsigned int v23 = [v21 save:&obj];
  objc_storeStrong((id *)(v22 + 40), obj);

  if (v23)
  {
    uint64_t v24 = *(void **)(a1 + 48);
    v25 = [*(id *)(a1 + 32) store];
    id v26 = [v25 objectID];
    id v27 = [*(id *)(a1 + 48) noteContext];
    id v28 = [v27 htmlNoteContext];
    [v24 refreshNotesForCollectionWithId:v26 andContext:v28];
  }
}

void sub_10000E034(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000E054(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000E064(uint64_t a1)
{
}

id sub_10000E06C(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)SANoteObject);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) title];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setTitle:v5];

  id v6 = [*(id *)(a1 + 32) modificationDate];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLastModifiedDate:v6];

  id v7 = [*(id *)(a1 + 32) creationDate];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setCreatedDate:v7];

  uint64_t v8 = +[ICAppURLUtilities appURLForNote:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setIdentifier:v8];

  id v9 = [*(id *)(a1 + 32) isPasswordProtected];
  uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return [v10 setRestricted:v9];
}

id sub_10000E17C(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)SANoteObject);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) title];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setTitle:v5];

  id v6 = [*(id *)(a1 + 32) modificationDate];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLastModifiedDate:v6];

  id v7 = [*(id *)(a1 + 32) creationDate];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setCreatedDate:v7];

  uint64_t v8 = +[ICAppURLUtilities appURLForHTMLNote:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setIdentifier:v8];

  id v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return [v9 setRestricted:0];
}

void sub_10000E554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000E57C(void *a1)
{
  id v6 = +[ICNote notesMatchingPredicate:a1[4] context:a1[5]];
  id v2 = [v6 firstObject];
  uint64_t v3 = ICProtocolCast();
  uint64_t v4 = *(void *)(a1[6] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10000E614(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) existingObjectWithID:*(void *)(a1 + 40) error:0];
  uint64_t v2 = ICProtocolCast();
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10000E800(uint64_t a1)
{
  [*(id *)(a1 + 32) setStalenessInterval:0.0];
  id v1 = +[ICNoteContext sharedContext];
  [v1 refreshAll];
}

void sub_10000E928(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = +[ICAccount accountUtilities];
    id v9 = [*(id *)(a1 + 40) accountId];
    uint64_t v10 = [v8 temporaryDirectoryURLForAccountIdentifier:v9];

    if (!v10) {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((tempDirectoryURL) != nil)", "-[ICSharingExtensionItemExtractor extractMediaFileURLWithProvider:contentType:completion:]_block_invoke_2", 1, 0, @"Expected non-nil value for '%s'", "tempDirectoryURL");
    }
    id v11 = +[NSUUID UUID];
    uint64_t v12 = [v11 UUIDString];
    uint64_t v13 = [v10 URLByAppendingPathComponent:v12 isDirectory:1];

    id v14 = +[NSFileManager defaultManager];
    [v14 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:0 error:0];

    char v15 = [v6 lastPathComponent];
    id v16 = [v13 URLByAppendingPathComponent:v15];

    long long v17 = +[NSFileManager defaultManager];
    LOBYTE(v12) = [v17 linkItemAtURL:v6 toURL:v16 error:0];

    if ((v12 & 1) == 0)
    {
      long long v18 = +[NSFileManager defaultManager];
      v25[0] = 0;
      unsigned __int8 v19 = [v18 copyItemAtURL:v6 toURL:v16 error:v25];
      id v20 = v25[0];

      if ((v19 & 1) == 0) {
        +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[[NSFileManager defaultManager] copyItemAtURL:url toURL:tempFileURL error:&copyError]", "-[ICSharingExtensionItemExtractor extractMediaFileURLWithProvider:contentType:completion:]_block_invoke_2", 1, 0, @"Extracting media file: Failed to create temporary file copy: %@", v20);
      }
    }
    id v21 = [objc_alloc((Class)ICAddAttachmentsManagerAttachmentInfo) initWithFileURL:v16];
    [v21 setUsesTemporaryFile:1];
    id v24 = *(id *)(a1 + 48);
    id v22 = v21;
    performBlockOnMainThread();
  }
  else
  {
    unsigned int v23 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_1000145FC(a1, (uint64_t)v7, v23);
    }

    v25[1] = _NSConcreteStackBlock;
    v25[2] = (id)3221225472;
    v25[3] = sub_10000EC70;
    void v25[4] = &unk_100020CC0;
    id v26 = *(id *)(a1 + 48);
    performBlockOnMainThread();
    uint64_t v13 = v26;
  }
}

uint64_t sub_10000EC70(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000EC84(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10000EDD8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = a3;
  id v9 = *(id *)(a1 + 32);
  id v6 = v8;
  id v7 = v5;
  performBlockOnMainThreadAndWait();
}

void sub_10000EEA8(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v3 = [objc_alloc((Class)ICAddAttachmentsManagerAttachmentInfo) initWithFileURL:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v2 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_100014688(a1, v2);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_10000F094(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = a3;
  id v11 = a1[7];
  id v9 = a1[5];
  id v10 = a1[6];
  id v6 = v5;
  id v7 = v8;
  performBlockOnMainThreadAndWait();
}

void sub_10000F198(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id v3 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100014828(v2, v3);
    }

LABEL_5:
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    return;
  }
  if (!*(void *)(a1 + 40))
  {
    id v7 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100014748(v7);
    }

    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [*(id *)(a1 + 40) isFileURL])
  {
    id v22 = [objc_alloc((Class)ICAddAttachmentsManagerAttachmentInfo) initWithFileURL:*(void *)(a1 + 40)];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_12:

    return;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = *(void **)(a1 + 48);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 80);
    id v6 = *(id *)(a1 + 40);
    id v22 = [v4 getAttachmentInfoWithImage:v6 useTempFile:v5];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();

    goto LABEL_12;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = [*(id *)(a1 + 56) registeredTypeIdentifiers];
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
LABEL_20:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v24 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * v12);
      id v14 = +[ICUTType typeWithIdentifier:v13];
      char v15 = +[ICUTType typeWithIdentifier:*(void *)(a1 + 64)];
      unsigned __int8 v16 = [v14 conformsToType:v15];

      if (v16) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v10) {
          goto LABEL_20;
        }
        goto LABEL_26;
      }
    }
    long long v18 = +[ICUTType typeWithIdentifier:v13];
    unsigned __int8 v19 = [v18 preferredFilenameExtension];

    id v17 = v13;
    if (!v19) {
      goto LABEL_29;
    }
    id v20 = objc_opt_new();
    [v20 setMediaUTI:v17];
    [v20 setMediaData:*(void *)(a1 + 40)];
    [v20 setMediaFilenameExtension:v19];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
LABEL_26:

    id v17 = 0;
LABEL_29:
    id v21 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10001478C((id *)(a1 + 56), v21);
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void sub_10000F88C(id a1)
{
  qword_100028B20 = objc_alloc_init(ICAnalyticsObserver);

  _objc_release_x1();
}

void sub_1000106DC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100010708(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100010718(uint64_t a1)
{
}

void sub_100010720(uint64_t a1)
{
  uint64_t v2 = +[ICWidget sharedWidget];
  unsigned __int8 v3 = [v2 hidesObject:*(void *)(a1 + 32)];

  if ((v3 & 1) == 0)
  {
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = +[ICAppURLUtilities appURLForNote:*(void *)(a1 + 32)];
    id v6 = [v5 absoluteString];
    id v7 = [*(id *)(a1 + 32) title];
    id v8 = +[ICNoteListSortUtilities dateForCurrentSortTypeForNote:*(void *)(a1 + 32) folderNoteSortType:*(void *)(a1 + 48)];
    id v9 = [*(id *)(a1 + 32) contentInfoText];
    id v10 = [*(id *)(a1 + 32) isPasswordProtected];
    id v11 = [*(id *)(a1 + 32) isSharedViaICloud];
    unsigned int v12 = [*(id *)(a1 + 32) isSharedViaICloud];
    if (v12) {
      LOBYTE(v12) = [*(id *)(a1 + 32) hasUnreadChanges];
    }
    LOBYTE(v17) = v12;
    id v13 = [v4 initWithIdentifier:v6 title:v7 date:v8 contentInfo:v9 isLocked:v10 isShared:v11 isUnread:v17];
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    char v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    unsigned __int8 v16 = *(void **)(a1 + 32);
    [v16 turnAttachmentsIntoFaults];
  }
}

void sub_1000108A8(uint64_t a1)
{
  uint64_t v2 = +[ICWidget sharedWidget];
  unsigned __int8 v3 = [v2 hidesObject:*(void *)(a1 + 32)];

  if ((v3 & 1) == 0)
  {
    id v4 = *(id *)(a1 + 40);
    id v13 = +[ICAppURLUtilities appURLForHTMLNote:*(void *)(a1 + 32)];
    uint64_t v5 = [v13 absoluteString];
    id v6 = [*(id *)(a1 + 32) title];
    id v7 = +[ICNoteListSortUtilities dateForCurrentSortTypeForNote:*(void *)(a1 + 32) folderNoteSortType:*(void *)(a1 + 48)];
    id v8 = [*(id *)(a1 + 32) contentInfoText];
    LOBYTE(v12) = 0;
    id v9 = [v4 initWithIdentifier:v5 title:v6 date:v7 contentInfo:v8 isLocked:0 isShared:0 isUnread:v12];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

void sub_100011A38(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100011A90(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100011AA0(uint64_t a1)
{
}

void sub_100011AA8(uint64_t a1)
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  unsigned __int8 v3 = (char *)[v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_opt_class();
        id v7 = ICDynamicCast();
        id v9 = ICProtocolCast();
        if (v7 && (unsigned __int8 v10 = objc_msgSend(v7, "isVisible", v12), v8 = v7, (v10 & 1) != 0)
          || v9
          && (objc_msgSend(v9, "isMarkedForDeletion", v8) & 1) == 0
          && (v11 = objc_opt_respondsToSelector(), id v8 = v9, (v11 & 1) != 0))
        {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v8, v12];
        }

        ++v6;
      }
      while (v4 != v6);
      id v4 = (char *)[v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

void sub_100011C30(uint64_t a1)
{
  id v2 = +[ICNote newFetchRequestForNotes];
  unsigned __int8 v3 = +[ICNoteListSortUtilities sortDescriptorsForCurrentType];
  [v2 setSortDescriptors:v3];

  if (*(void *)(a1 + 32))
  {
    objc_opt_class();
    id v4 = [*(id *)(a1 + 40) ic_existingObjectWithID:*(void *)(a1 + 32)];
    uint64_t v5 = ICDynamicCast();

    id v6 = [v5 predicateForVisibleNotesInFolder];
  }
  else
  {
    id v6 = +[ICNote predicateForVisibleNotesInContext:*(void *)(a1 + 40)];
  }
  if (*(void *)(a1 + 48))
  {
    v14[0] = *(void *)(a1 + 48);
    v14[1] = v6;
    id v7 = +[NSArray arrayWithObjects:v14 count:2];
    id v8 = +[NSCompoundPredicate andPredicateWithSubpredicates:v7];
    [v2 setPredicate:v8];
  }
  else
  {
    [v2 setPredicate:v6];
  }
  [v2 setFetchLimit:kICMaximumSiriNoteCount + 1];
  id v9 = *(void **)(a1 + 40);
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v10 + 40);
  char v11 = [v9 executeFetchRequest:v2 error:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    long long v12 = os_log_create("com.apple.notes", "Intents");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100014960();
    }
  }
  if ([v11 count]) {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObjectsFromArray:v11];
  }
}

void sub_100011E60(void *a1)
{
  id v2 = +[NoteObject fetchRequest];
  unsigned __int8 v3 = +[ICNoteListSortUtilities sortDescriptorsForCurrentType];
  [v2 setSortDescriptors:v3];

  if (a1[4])
  {
    v27[0] = a1[4];
    id v4 = +[NoteContext visibleNotesPredicate];
    v27[1] = v4;
    uint64_t v5 = +[NSArray arrayWithObjects:v27 count:2];
    id v6 = +[NSCompoundPredicate andPredicateWithSubpredicates:v5];
    [v2 setPredicate:v6];
  }
  else
  {
    id v7 = +[NoteContext visibleNotesPredicate];
    [v2 setPredicate:v7];
  }
  [v2 setFetchLimit:kICMaximumSiriNoteCount + 1];
  id v8 = (void *)a1[5];
  uint64_t v9 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v9 + 40);
  uint64_t v10 = [v8 executeFetchRequest:v2 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    char v11 = os_log_create("com.apple.notes", "Intents");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000149D8();
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v18 = [v17 store:v21];
        unsigned __int8 v19 = [v18 account];
        unsigned __int8 v20 = [v19 didChooseToMigrate];

        if ((v20 & 1) == 0) {
          [*(id *)(*(void *)(a1[7] + 8) + 40) addObject:v17];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v14);
  }
}

void sub_100012110(void *a1)
{
  if (a1[4])
  {
    id v2 = [*(id *)(*(void *)(a1[7] + 8) + 40) filteredArrayUsingPredicate:];
    id v3 = [v2 mutableCopy];
    uint64_t v4 = *(void *)(a1[7] + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  if (a1[5] || a1[6])
  {
    id v6 = +[NSMutableArray array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = *(id *)(*(void *)(a1[7] + 8) + 40);
    id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        char v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v11);
          if (a1[5])
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v13 = [v12 folder];
              id v14 = [v13 objectID];
              unsigned int v15 = [v14 isEqual:a1[5]];

              if (v15) {
                [v6 addObject:v12];
              }
            }
          }
          if (a1[6])
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              unsigned __int8 v16 = [v12 store];
              uint64_t v17 = [v16 objectID];
              unsigned int v18 = [v17 isEqual:a1[6]];

              if (v18) {
                [v6 addObject:v12];
              }
            }
          }
          objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v6);
          char v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }
  }
  unsigned __int8 v19 = *(void **)(*(void *)(a1[7] + 8) + 40);
  unsigned __int8 v20 = +[ICNoteListSortUtilities sortDescriptorsForCurrentType];
  [v19 sortUsingDescriptors:v20];
}

void sub_100012658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100012684(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    id v2 = [*(id *)(a1 + 32) noteAsPlainTextWithoutTitle];
    if ([v2 length])
    {
      id v3 = [objc_alloc((Class)INTextNoteContent) initWithText:v2];
      id v31 = v3;
      uint64_t v4 = +[NSArray arrayWithObjects:&v31 count:1];
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;
    }
  }
  id v7 = objc_alloc((Class)INNote);
  id v8 = objc_alloc((Class)INSpeakableString);
  id v30 = [*(id *)(a1 + 32) title];
  id v9 = [v8 initWithSpokenPhrase:v30];
  uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v10 = objc_alloc((Class)INSpeakableString);
  id v29 = [*(id *)(a1 + 32) folderName];
  id v23 = [v10 initWithSpokenPhrase:v29];
  id v28 = +[NSCalendar currentCalendar];
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v27 = [*(id *)(a1 + 32) creationDate];
  long long v22 = [v28 components:v11 fromDate:v27];
  long long v25 = +[NSCalendar currentCalendar];
  uint64_t v12 = *(void *)(a1 + 56);
  long long v24 = [*(id *)(a1 + 32) modificationDate];
  id v13 = [v25 components:v12 fromDate:v24];
  id v14 = +[ICAppURLUtilities appURLForNote:*(void *)(a1 + 32)];
  unsigned int v15 = [v14 absoluteString];
  unsigned __int8 v16 = [*(id *)(a1 + 32) folder];
  uint64_t v17 = [v16 account];
  unsigned int v18 = [v17 identifier];
  id v19 = [v7 initWithTitle:v9 contents:v26 groupName:v23 createdDateComponents:v22 modifiedDateComponents:v13 identifier:v15 accountIdentifier:v18];
  uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;
}

void sub_100012948(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    id v2 = [*(id *)(a1 + 32) noteAsPlainTextWithoutTitle];
    if ([v2 length])
    {
      id v3 = [objc_alloc((Class)INTextNoteContent) initWithText:v2];
      id v31 = v3;
      uint64_t v4 = +[NSArray arrayWithObjects:&v31 count:1];
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;
    }
  }
  id v7 = objc_alloc((Class)INNote);
  id v8 = objc_alloc((Class)INSpeakableString);
  id v30 = [*(id *)(a1 + 32) title];
  id v9 = [v8 initWithSpokenPhrase:v30];
  uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v10 = objc_alloc((Class)INSpeakableString);
  id v29 = [*(id *)(a1 + 32) folderName];
  id v23 = [v10 initWithSpokenPhrase:v29];
  id v28 = +[NSCalendar currentCalendar];
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v27 = [*(id *)(a1 + 32) creationDate];
  long long v22 = [v28 components:v11 fromDate:v27];
  long long v25 = +[NSCalendar currentCalendar];
  uint64_t v12 = *(void *)(a1 + 56);
  long long v24 = [*(id *)(a1 + 32) modificationDate];
  id v13 = [v25 components:v12 fromDate:v24];
  id v14 = +[ICAppURLUtilities appURLForHTMLNote:*(void *)(a1 + 32)];
  unsigned int v15 = [v14 absoluteString];
  unsigned __int8 v16 = [*(id *)(a1 + 32) store];
  uint64_t v17 = [v16 account];
  unsigned int v18 = [v17 accountIdentifier];
  id v19 = [v7 initWithTitle:v9 contents:v26 groupName:v23 createdDateComponents:v22 modifiedDateComponents:v13 identifier:v15 accountIdentifier:v18];
  uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;
}

void sub_100012FD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, long long a10, uint64_t a11)
{
  if (a2 == 1)
  {
    id v12 = objc_begin_catch(exception_object);
    id v13 = os_log_create("com.apple.notes", "Intents");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v11 externalIdentifier];
      a9 = 138412802;
      WORD2(a10) = 2112;
      *(void *)((char *)&a10 + 6) = v14;
      HIWORD(a10) = 2112;
      a11 = (uint64_t)v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Exception raised when attempting to refresh notes for %@ with store %@: %@", (uint8_t *)&a9, 0x20u);
    }
    objc_end_catch();
    JUMPOUT(0x100012F80);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000130D4(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t sub_1000134DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t a5, uint64_t a6)
{
  uint64_t v11 = a3;
  uint64_t v12 = a4();
  v9[0] = a5;
  v9[1] = a6;
  char v10 = 2;
  LOBYTE(a6) = sub_100014B30();
  sub_10001362C(v9);
  return a6 & 1;
}

id sub_10001357C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t type metadata accessor for ICFeatureFlags()
{
  return self;
}

unint64_t sub_1000135D8()
{
  unint64_t result = qword_100028A18;
  if (!qword_100028A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A18);
  }
  return result;
}

uint64_t sub_10001362C(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return _swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_10001367C()
{
  unint64_t result = qword_100028A20;
  if (!qword_100028A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A20);
  }
  return result;
}

unint64_t sub_1000136D0()
{
  unint64_t result = qword_100028A28;
  if (!qword_100028A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A28);
  }
  return result;
}

unint64_t sub_100013724()
{
  unint64_t result = qword_100028A30;
  if (!qword_100028A30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A30);
  }
  return result;
}

unint64_t sub_100013778()
{
  unint64_t result = qword_100028A38;
  if (!qword_100028A38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A38);
  }
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for TelephonyUtilitiesFeature(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for TelephonyUtilitiesFeature()
{
  return &type metadata for TelephonyUtilitiesFeature;
}

ValueMetadata *type metadata accessor for GreyParrotFeature()
{
  return &type metadata for GreyParrotFeature;
}

ValueMetadata *type metadata accessor for SiriSMARTFeature()
{
  return &type metadata for SiriSMARTFeature;
}

ValueMetadata *type metadata accessor for UniquelyiPadFeature()
{
  return &type metadata for UniquelyiPadFeature;
}

uint64_t getEnumTagSinglePayload for NotesFeature(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for NotesFeature(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 17) = v3;
  return result;
}

ValueMetadata *type metadata accessor for NotesFeature()
{
  return &type metadata for NotesFeature;
}

const char *sub_100013880()
{
  return "Notes";
}

uint64_t sub_100013894()
{
  return *(void *)v0;
}

uint64_t sub_1000138A0()
{
  return sub_1000139C0();
}

uint64_t sub_1000138B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100013BEC(a1, a2, a3, (uint64_t (*)(void))sub_1000135D8, (uint64_t (*)(void))sub_1000138DC);
}

unint64_t sub_1000138DC()
{
  unint64_t result = qword_100028A40;
  if (!qword_100028A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A40);
  }
  return result;
}

const char *sub_100013930()
{
  return "TelephonyUtilities";
}

uint64_t sub_100013944()
{
  return sub_1000139C0();
}

const char *sub_100013954()
{
  return "GreyParrot";
}

uint64_t sub_100013968()
{
  return sub_1000139C0();
}

const char *sub_100013978()
{
  return "ResponseFramework";
}

uint64_t sub_10001398C()
{
  return sub_1000139C0();
}

const char *sub_10001399C()
{
  return "UIKit";
}

uint64_t sub_1000139B0()
{
  return sub_1000139C0();
}

uint64_t sub_1000139C0()
{
  uint64_t v1 = sub_100014B50();
  v2._countAndFlagsBits = 47;
  v2._object = (void *)0xE100000000000000;
  sub_100014B40(v2);
  v3._countAndFlagsBits = sub_100014B50();
  sub_100014B40(v3);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_100013A40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100013BEC(a1, a2, a3, (uint64_t (*)(void))sub_10001367C, (uint64_t (*)(void))sub_100013A6C);
}

unint64_t sub_100013A6C()
{
  unint64_t result = qword_100028A48;
  if (!qword_100028A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A48);
  }
  return result;
}

uint64_t sub_100013AC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100013BEC(a1, a2, a3, (uint64_t (*)(void))sub_1000136D0, (uint64_t (*)(void))sub_100013AEC);
}

unint64_t sub_100013AEC()
{
  unint64_t result = qword_100028A50;
  if (!qword_100028A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A50);
  }
  return result;
}

uint64_t sub_100013B40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100013BEC(a1, a2, a3, (uint64_t (*)(void))sub_100013724, (uint64_t (*)(void))sub_100013B6C);
}

unint64_t sub_100013B6C()
{
  unint64_t result = qword_100028A58;
  if (!qword_100028A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A58);
  }
  return result;
}

uint64_t sub_100013BC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100013BEC(a1, a2, a3, (uint64_t (*)(void))sub_100013778, (uint64_t (*)(void))sub_100013C28);
}

uint64_t sub_100013BEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  *(void *)(a1 + 8) = a4();
  uint64_t result = a5();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_100013C28()
{
  unint64_t result = qword_100028A60;
  if (!qword_100028A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A60);
  }
  return result;
}

uint64_t sub_100013C88()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_100013CBC()
{
  sub_100003DCC();
  sub_100003DB0((void *)&_mh_execute_header, v0, v1, "Releasing object creation locking background assertion", v2, v3, v4, v5, v6);
}

void sub_100013CF0()
{
  sub_100003DCC();
  sub_100003DB0((void *)&_mh_execute_header, v0, v1, "Releasing database locking background assertion", v2, v3, v4, v5, v6);
}

void sub_100013D24()
{
  sub_100003DCC();
  sub_100003DB0((void *)&_mh_execute_header, v0, v1, "Finishing database-locking operation", v2, v3, v4, v5, v6);
}

void sub_100013D58()
{
  sub_100003DCC();
  sub_100003DB0((void *)&_mh_execute_header, v0, v1, "Finishing object creation-locking operation", v2, v3, v4, v5, v6);
}

void sub_100013D8C(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unknown object type — returning nil {objectID: %@}", buf, 0xCu);
}

void sub_100013DE4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to create note: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100013E5C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007614((void *)&_mh_execute_header, a1, a3, "No managed object context — returning no items", a5, a6, a7, a8, 0);
}

void sub_100013E94()
{
  sub_100007630();
  sub_1000075F8((void *)&_mh_execute_header, v0, v1, "Note does not exist — skipping {objectID: %@}", v2, v3, v4, v5, v6);
}

void sub_100013EFC()
{
  sub_100007630();
  sub_1000075F8((void *)&_mh_execute_header, v0, v1, "Unknown object type — skipping {objectID: %@}", v2, v3, v4, v5, v6);
}

void sub_100013F64(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot create folder list section identifier — skipping {objectID: %@}", buf, 0xCu);
}

void sub_100013FC0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007614((void *)&_mh_execute_header, a1, a3, "No managed object context — returning nil default note", a5, a6, a7, a8, 0);
}

void sub_100013FF8()
{
  sub_100007630();
  sub_1000075F8((void *)&_mh_execute_header, v0, v1, "Note does not exist — returning nil default note {objectID: %@}", v2, v3, v4, v5, v6);
}

void sub_100014060()
{
  sub_100007630();
  sub_1000075F8((void *)&_mh_execute_header, v0, v1, "Unknown object type — returning nil default note {objectID: %@}", v2, v3, v4, v5, v6);
}

void sub_1000140C8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No managed object context — returning no items", v1, 2u);
}

void sub_10001410C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Container does not exist — skipping {itemID: %@}", (uint8_t *)&v2, 0xCu);
}

void sub_100014184(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown item identifier type — skipping {itemID: %@}", (uint8_t *)&v2, 0xCu);
}

void sub_1000141FC()
{
  sub_100007630();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Extracting attachments from input items: %@", v1, 0xCu);
}

void sub_100014270()
{
  os_log_t v0 = [UTTypeURL identifier];
  sub_10000C864();
  sub_10000C890((void *)&_mh_execute_header, v1, v2, "Can't load item for type identifier %@: %@", v3, v4, v5, v6, v7);
}

void sub_10001430C()
{
  os_log_t v0 = [UTTypeRTF identifier];
  sub_10000C864();
  sub_10000C890((void *)&_mh_execute_header, v1, v2, "Can't load item for type identifier %@: %@", v3, v4, v5, v6, v7);
}

void sub_1000143A8()
{
  os_log_t v0 = [UTTypePlainText identifier];
  sub_10000C864();
  sub_10000C890((void *)&_mh_execute_header, v1, v2, "Can't load item for type identifier %@: %@", v3, v4, v5, v6, v7);
}

void sub_100014444()
{
  sub_100007630();
  sub_1000075F8((void *)&_mh_execute_header, v0, v1, "Error unarchiving data: %@", v2, v3, v4, v5, v6);
}

void sub_1000144AC()
{
  sub_10000C87C();
  sub_10000C8B0((void *)&_mh_execute_header, v0, v1, "Can't load item for type identifier %@: %@", v2, v3, v4, v5, 2u);
}

void sub_100014520()
{
  sub_100007630();
  sub_1000075F8((void *)&_mh_execute_header, v0, v1, "Can't determine how to handle url that is not a string or a URL %@", v2, v3, v4, v5, v6);
}

void sub_100014588()
{
  sub_10000C87C();
  sub_10000C8B0((void *)&_mh_execute_header, v0, v1, "Can't load item for type identifier %@: %@", v2, v3, v4, v5, 2u);
}

void sub_1000145FC(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Extracting media file: Error loading file representation for content type %@ - error: %@", (uint8_t *)&v4, 0x16u);
}

void sub_100014688(uint64_t a1, NSObject *a2)
{
  int v4 = [UTTypeFileURL identifier];
  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Extracting URL: Error loading item for type identifier %@ - error: %@", (uint8_t *)&v6, 0x16u);
}

void sub_100014748(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Provided item is nil.", v1, 2u);
}

void sub_10001478C(id *a1, NSObject *a2)
{
  uint64_t v3 = [*a1 registeredTypeIdentifiers];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error: could not find extension in %@", (uint8_t *)&v4, 0xCu);
}

void sub_100014828(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error loading item: %@", (uint8_t *)&v3, 0xCu);
}

void sub_1000148A4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Cannot save temporary file to disk: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001491C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "notesWithText:... completed", v1, 2u);
}

void sub_100014960()
{
  sub_1000130D4(__stack_chk_guard);
  int v2 = 138412290;
  uint64_t v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Error fetching all modern notes %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000149D8()
{
  sub_1000130D4(__stack_chk_guard);
  int v2 = 138412290;
  uint64_t v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Error fetching all HTML notes %@", (uint8_t *)&v2, 0xCu);
}

void sub_100014A50(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = objc_begin_catch(a1);
  uint64_t v5 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    uint64_t v7 = a3;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Exception raised when attempting to refresh notes for %@: %@", (uint8_t *)&v6, 0x16u);
  }

  objc_end_catch();
}

uint64_t sub_100014B30()
{
  return isFeatureEnabled(_:)();
}

void sub_100014B40(Swift::String a1)
{
}

uint64_t sub_100014B50()
{
  return StaticString.description.getter();
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

uint64_t ICCheckedDynamicCast()
{
  return _ICCheckedDynamicCast();
}

uint64_t ICClassAndProtocolCast()
{
  return _ICClassAndProtocolCast();
}

uint64_t ICDynamicCast()
{
  return _ICDynamicCast();
}

uint64_t ICNoteHTMLFromPlainText()
{
  return _ICNoteHTMLFromPlainText();
}

uint64_t ICNoteTitleFromPlainText()
{
  return _ICNoteTitleFromPlainText();
}

uint64_t ICProtocolCast()
{
  return _ICProtocolCast();
}

uint64_t ICUseCoreDataCoreSpotlightIntegration()
{
  return _ICUseCoreDataCoreSpotlightIntegration();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int close(int a1)
{
  return _close(a1);
}

uint64_t dispatchMainAfterDelay()
{
  return _dispatchMainAfterDelay();
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

int flock(int a1, int a2)
{
  return _flock(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t performBlockOnMainThread()
{
  return _performBlockOnMainThread();
}

uint64_t performBlockOnMainThreadAndWait()
{
  return _performBlockOnMainThreadAndWait();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

id objc_msgSend_ICTintColor(void *a1, const char *a2, ...)
{
  return [a1 ICTintColor];
}

id objc_msgSend_URIRepresentation(void *a1, const char *a2, ...)
{
  return [a1 URIRepresentation];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountId(void *a1, const char *a2, ...)
{
  return [a1 accountId];
}

id objc_msgSend_accountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountIdentifier];
}

id objc_msgSend_accountUtilities(void *a1, const char *a2, ...)
{
  return [a1 accountUtilities];
}

id objc_msgSend_allItems(void *a1, const char *a2, ...)
{
  return [a1 allItems];
}

id objc_msgSend_allItemsFolderLocalizedTitle(void *a1, const char *a2, ...)
{
  return [a1 allItemsFolderLocalizedTitle];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_appSessionDidTerminate(void *a1, const char *a2, ...)
{
  return [a1 appSessionDidTerminate];
}

id objc_msgSend_appURLForDefaultFolder(void *a1, const char *a2, ...)
{
  return [a1 appURLForDefaultFolder];
}

id objc_msgSend_appendLock(void *a1, const char *a2, ...)
{
  return [a1 appendLock];
}

id objc_msgSend_applicationDocumentsURL(void *a1, const char *a2, ...)
{
  return [a1 applicationDocumentsURL];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attachment(void *a1, const char *a2, ...)
{
  return [a1 attachment];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return [a1 attachments];
}

id objc_msgSend_attributedContentText(void *a1, const char *a2, ...)
{
  return [a1 attributedContentText];
}

id objc_msgSend_attributedTitle(void *a1, const char *a2, ...)
{
  return [a1 attributedTitle];
}

id objc_msgSend_basicAccountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 basicAccountIdentifier];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_completeExtensionRequestInBackground(void *a1, const char *a2, ...)
{
  return [a1 completeExtensionRequestInBackground];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_contentInfoText(void *a1, const char *a2, ...)
{
  return [a1 contentInfoText];
}

id objc_msgSend_contextContainsOnlyRawImages(void *a1, const char *a2, ...)
{
  return [a1 contextContainsOnlyRawImages];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentProcess(void *a1, const char *a2, ...)
{
  return [a1 currentProcess];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateSearchType(void *a1, const char *a2, ...)
{
  return [a1 dateSearchType];
}

id objc_msgSend_dateTime(void *a1, const char *a2, ...)
{
  return [a1 dateTime];
}

id objc_msgSend_dbWriteLock(void *a1, const char *a2, ...)
{
  return [a1 dbWriteLock];
}

id objc_msgSend_dbWriteLockfd(void *a1, const char *a2, ...)
{
  return [a1 dbWriteLockfd];
}

id objc_msgSend_dbWriteUnlock(void *a1, const char *a2, ...)
{
  return [a1 dbWriteUnlock];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultSystemImageName(void *a1, const char *a2, ...)
{
  return [a1 defaultSystemImageName];
}

id objc_msgSend_depth(void *a1, const char *a2, ...)
{
  return [a1 depth];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didChooseToMigrate(void *a1, const char *a2, ...)
{
  return [a1 didChooseToMigrate];
}

id objc_msgSend_displayString(void *a1, const char *a2, ...)
{
  return [a1 displayString];
}

id objc_msgSend_enableHTMLContextChangeLogging(void *a1, const char *a2, ...)
{
  return [a1 enableHTMLContextChangeLogging];
}

id objc_msgSend_endDateComponents(void *a1, const char *a2, ...)
{
  return [a1 endDateComponents];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_eventReporter(void *a1, const char *a2, ...)
{
  return [a1 eventReporter];
}

id objc_msgSend_externalIdentifier(void *a1, const char *a2, ...)
{
  return [a1 externalIdentifier];
}

id objc_msgSend_fetchRequest(void *a1, const char *a2, ...)
{
  return [a1 fetchRequest];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_firstRelevantItemIdentifier(void *a1, const char *a2, ...)
{
  return [a1 firstRelevantItemIdentifier];
}

id objc_msgSend_folder(void *a1, const char *a2, ...)
{
  return [a1 folder];
}

id objc_msgSend_folderIndexer(void *a1, const char *a2, ...)
{
  return [a1 folderIndexer];
}

id objc_msgSend_folderName(void *a1, const char *a2, ...)
{
  return [a1 folderName];
}

id objc_msgSend_fullTitle(void *a1, const char *a2, ...)
{
  return [a1 fullTitle];
}

id objc_msgSend_groupName(void *a1, const char *a2, ...)
{
  return [a1 groupName];
}

id objc_msgSend_hasUnreadChanges(void *a1, const char *a2, ...)
{
  return [a1 hasUnreadChanges];
}

id objc_msgSend_htmlManagedObjectContext(void *a1, const char *a2, ...)
{
  return [a1 htmlManagedObjectContext];
}

id objc_msgSend_htmlNoteContext(void *a1, const char *a2, ...)
{
  return [a1 htmlNoteContext];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_includeAllNoteContents(void *a1, const char *a2, ...)
{
  return [a1 includeAllNoteContents];
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return [a1 inputItems];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAppStore(void *a1, const char *a2, ...)
{
  return [a1 isAppStore];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return [a1 isFileURL];
}

id objc_msgSend_isMap(void *a1, const char *a2, ...)
{
  return [a1 isMap];
}

id objc_msgSend_isMarkedForDeletion(void *a1, const char *a2, ...)
{
  return [a1 isMarkedForDeletion];
}

id objc_msgSend_isModernNote(void *a1, const char *a2, ...)
{
  return [a1 isModernNote];
}

id objc_msgSend_isNews(void *a1, const char *a2, ...)
{
  return [a1 isNews];
}

id objc_msgSend_isOptedInForAnalytics(void *a1, const char *a2, ...)
{
  return [a1 isOptedInForAnalytics];
}

id objc_msgSend_isPasswordProtected(void *a1, const char *a2, ...)
{
  return [a1 isPasswordProtected];
}

id objc_msgSend_isPlainText(void *a1, const char *a2, ...)
{
  return [a1 isPlainText];
}

id objc_msgSend_isPodcasts(void *a1, const char *a2, ...)
{
  return [a1 isPodcasts];
}

id objc_msgSend_isSharedViaICloud(void *a1, const char *a2, ...)
{
  return [a1 isSharedViaICloud];
}

id objc_msgSend_isURL(void *a1, const char *a2, ...)
{
  return [a1 isURL];
}

id objc_msgSend_isVisible(void *a1, const char *a2, ...)
{
  return [a1 isVisible];
}

id objc_msgSend_isiTunes(void *a1, const char *a2, ...)
{
  return [a1 isiTunes];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_legacyContext(void *a1, const char *a2, ...)
{
  return [a1 legacyContext];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedTitle];
}

id objc_msgSend_localizedTitleForDefaultFolder(void *a1, const char *a2, ...)
{
  return [a1 localizedTitleForDefaultFolder];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return [a1 managedObjectContext];
}

id objc_msgSend_managedObjectID(void *a1, const char *a2, ...)
{
  return [a1 managedObjectID];
}

id objc_msgSend_maxNoteAttachments(void *a1, const char *a2, ...)
{
  return [a1 maxNoteAttachments];
}

id objc_msgSend_maximumNumberOfNotesPerAccount(void *a1, const char *a2, ...)
{
  return [a1 maximumNumberOfNotesPerAccount];
}

id objc_msgSend_mediaURL(void *a1, const char *a2, ...)
{
  return [a1 mediaURL];
}

id objc_msgSend_mediaUTI(void *a1, const char *a2, ...)
{
  return [a1 mediaUTI];
}

id objc_msgSend_mediaUTIs(void *a1, const char *a2, ...)
{
  return [a1 mediaUTIs];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_modernContext(void *a1, const char *a2, ...)
{
  return [a1 modernContext];
}

id objc_msgSend_modernManagedObjectContext(void *a1, const char *a2, ...)
{
  return [a1 modernManagedObjectContext];
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return [a1 modificationDate];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_needsValue(void *a1, const char *a2, ...)
{
  return [a1 needsValue];
}

id objc_msgSend_newFetchRequestForNotes(void *a1, const char *a2, ...)
{
  return [a1 newFetchRequestForNotes];
}

id objc_msgSend_newSnapshotFromIndex(void *a1, const char *a2, ...)
{
  return [a1 newSnapshotFromIndex];
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 newlineCharacterSet];
}

id objc_msgSend_notRequired(void *a1, const char *a2, ...)
{
  return [a1 notRequired];
}

id objc_msgSend_note(void *a1, const char *a2, ...)
{
  return [a1 note];
}

id objc_msgSend_noteAsPlainText(void *a1, const char *a2, ...)
{
  return [a1 noteAsPlainText];
}

id objc_msgSend_noteAsPlainTextWithoutTitle(void *a1, const char *a2, ...)
{
  return [a1 noteAsPlainTextWithoutTitle];
}

id objc_msgSend_noteContext(void *a1, const char *a2, ...)
{
  return [a1 noteContext];
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return [a1 objectID];
}

id objc_msgSend_parentAttachment(void *a1, const char *a2, ...)
{
  return [a1 parentAttachment];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_persistentContainer(void *a1, const char *a2, ...)
{
  return [a1 persistentContainer];
}

id objc_msgSend_persistentStoreCoordinator(void *a1, const char *a2, ...)
{
  return [a1 persistentStoreCoordinator];
}

id objc_msgSend_predicateForVisibleNotesInFolder(void *a1, const char *a2, ...)
{
  return [a1 predicateForVisibleNotesInFolder];
}

id objc_msgSend_preferSingleLine(void *a1, const char *a2, ...)
{
  return [a1 preferSingleLine];
}

id objc_msgSend_preferredFilenameExtension(void *a1, const char *a2, ...)
{
  return [a1 preferredFilenameExtension];
}

id objc_msgSend_readLock(void *a1, const char *a2, ...)
{
  return [a1 readLock];
}

id objc_msgSend_recentNotesIndexer(void *a1, const char *a2, ...)
{
  return [a1 recentNotesIndexer];
}

id objc_msgSend_refreshAll(void *a1, const char *a2, ...)
{
  return [a1 refreshAll];
}

id objc_msgSend_refreshAllObjects(void *a1, const char *a2, ...)
{
  return [a1 refreshAllObjects];
}

id objc_msgSend_refreshManagedObjects(void *a1, const char *a2, ...)
{
  return [a1 refreshManagedObjects];
}

id objc_msgSend_registeredTypeIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 registeredTypeIdentifiers];
}

id objc_msgSend_reloadDataAndWait(void *a1, const char *a2, ...)
{
  return [a1 reloadDataAndWait];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_save(void *a1, const char *a2, ...)
{
  return [a1 save];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryLabelColor];
}

id objc_msgSend_sectionIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 sectionIdentifiers];
}

id objc_msgSend_shareDescription(void *a1, const char *a2, ...)
{
  return [a1 shareDescription];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedContext(void *a1, const char *a2, ...)
{
  return [a1 sharedContext];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return [a1 sharedController];
}

id objc_msgSend_sharedIndexer(void *a1, const char *a2, ...)
{
  return [a1 sharedIndexer];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedObserver(void *a1, const char *a2, ...)
{
  return [a1 sharedObserver];
}

id objc_msgSend_sharedWidget(void *a1, const char *a2, ...)
{
  return [a1 sharedWidget];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sortDescriptors(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptors];
}

id objc_msgSend_sortDescriptorsForCurrentType(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptorsForCurrentType];
}

id objc_msgSend_spokenPhrase(void *a1, const char *a2, ...)
{
  return [a1 spokenPhrase];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startAppSession(void *a1, const char *a2, ...)
{
  return [a1 startAppSession];
}

id objc_msgSend_startDateComponents(void *a1, const char *a2, ...)
{
  return [a1 startDateComponents];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return [a1 store];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_summary(void *a1, const char *a2, ...)
{
  return [a1 summary];
}

id objc_msgSend_systemImageName(void *a1, const char *a2, ...)
{
  return [a1 systemImageName];
}

id objc_msgSend_targetNote(void *a1, const char *a2, ...)
{
  return [a1 targetNote];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textStorage(void *a1, const char *a2, ...)
{
  return [a1 textStorage];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unsupported(void *a1, const char *a2, ...)
{
  return [a1 unsupported];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_visibleNotesPredicate(void *a1, const char *a2, ...)
{
  return [a1 visibleNotesPredicate];
}

id objc_msgSend_vocabularyIdentifier(void *a1, const char *a2, ...)
{
  return [a1 vocabularyIdentifier];
}

id objc_msgSend_waitUntilAllOperationsAreFinished(void *a1, const char *a2, ...)
{
  return [a1 waitUntilAllOperationsAreFinished];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceCharacterSet];
}

id objc_msgSend_workerManagedObjectContext(void *a1, const char *a2, ...)
{
  return [a1 workerManagedObjectContext];
}

id objc_msgSend_writeLock(void *a1, const char *a2, ...)
{
  return [a1 writeLock];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:options:error:];
}