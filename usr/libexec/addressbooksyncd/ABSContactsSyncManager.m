@interface ABSContactsSyncManager
- (id)addressingGrammarsFromContactWrapper:(id)a3;
- (id)reality;
- (void)_addContactFromContactWrapper_LOCKED:(id)a3 toContainerWithIdentifier:(id)a4;
- (void)_applyPronounsToContact:(id)a3 contactWrapper:(id)a4;
- (void)_applySensitiveContentConfigurationIfPossible:(id)a3 wrapper:(id)a4;
- (void)_applyWallpaperArchiveToContactIfPossible:(id)a3 wrapper:(id)a4;
- (void)_applyWatchWallpaperToContactIfPossible:(id)a3 wrapper:(id)a4;
- (void)_bindLinks:(id)a3 contact:(id)a4 guid:(id)a5 store:(id)a6;
- (void)_deleteContactForGUID_LOCKED:(id)a3;
- (void)_modifyContactFromContactWrapper_LOCKED:(id)a3 toContact:(id)a4;
- (void)_processSpecialRulesFieldsForContact:(id)a3 wrapper:(id)a4;
- (void)addBatch:(id)a3 forSession:(id)a4;
- (void)addOrUpdateContactIn:(id)a3 forSession:(id)a4;
- (void)clearShadowMarks;
- (void)deleteShadow;
- (void)deleteUnmarked;
- (void)remove:(id)a3;
@end

@implementation ABSContactsSyncManager

- (id)reality
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_reality)
  {
    v3 = objc_alloc_init(ABSContactsReality);
    reality = v2->_reality;
    v2->_reality = v3;
  }
  objc_sync_exit(v2);

  v5 = v2->_reality;

  return v5;
}

- (void)_bindLinks:(id)a3 contact:(id)a4 guid:(id)a5 store:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v11 && [v11 length])
  {
    v13 = [[ABSContactsLinkCluster alloc] initWithPBStuff:v9 contact:v10];
    v14 = +[ABSContactsReclusterizer sharedInstance];
    [v14 stashCluster:v13 forGuid:v11];
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR))
  {
    sub_1000379FC();
  }
}

- (void)_applyWatchWallpaperToContactIfPossible:(id)a3 wrapper:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Checking SNAP shared preference before applying avatar and poster", v9, 2u);
  }
  if ([v6 hasWallpaperDataRepresentation])
  {
    v8 = [v6 wallpaperImageData];
    [v5 setWatchWallpaperImageData:v8];
  }
}

- (void)_applyWallpaperArchiveToContactIfPossible:(id)a3 wrapper:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 wallpaperDataRepresentation];

  if (v7)
  {
    id v8 = objc_alloc((Class)CNWallpaper);
    id v9 = [v6 wallpaperDataRepresentation];
    id v10 = [v8 initWithDataRepresentation:v9];
    [v5 setWallpaper:v10];

    id v11 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      v14 = "-[ABSContactsSyncManager _applyWallpaperArchiveToContactIfPossible:wrapper:]";
      id v12 = "%s: applying wallpaperDataRepresentation";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    id v11 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      v14 = "-[ABSContactsSyncManager _applyWallpaperArchiveToContactIfPossible:wrapper:]";
      id v12 = "%s: No wallpaperDataRepresentation, guessing this contact wasn't TTM shared?";
      goto LABEL_6;
    }
  }
}

- (void)_applySensitiveContentConfigurationIfPossible:(id)a3 wrapper:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc((Class)CNSensitiveContentConfiguration);
  id v8 = [v6 sensitiveContentConfiguration];
  id v9 = [v7 initWithDataRepresentation:v8];

  id v10 = [v6 sensitiveContentConfiguration];

  if (!v10 || v9)
  {
    [v5 setSensitiveContentConfiguration:v9];
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR))
  {
    sub_100037A30();
  }
}

- (void)_addContactFromContactWrapper_LOCKED:(id)a3 toContainerWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_addContactFromContactWrapper_LOCKED:container:", buf, 2u);
  }
  id v9 = +[ABSContactsInterface sharedInstance];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001DD50;
  v14[3] = &unk_1000553F8;
  id v15 = v6;
  v16 = self;
  id v17 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 mutateAssert:v14];

  id v12 = +[ABSContactsShadow instance];
  int v13 = [v11 guid];
  [v12 insert:v13];
}

- (id)addressingGrammarsFromContactWrapper:(id)a3
{
  id v3 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v4 = +[NSArray arrayWithObjects:v11 count:2];
  id v5 = +[NSSet setWithArray:v4];
  id v6 = [v3 encryptedPronounData];

  id v10 = 0;
  id v7 = +[NSKeyedUnarchiver unarchivedArrayOfObjectsOfClasses:v5 fromData:v6 error:&v10];
  id v8 = v10;

  if (v8 && os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR)) {
    sub_100037B9C();
  }

  return v7;
}

- (void)_applyPronounsToContact:(id)a3 contactWrapper:(id)a4
{
  id v6 = a3;
  id v7 = [(ABSContactsSyncManager *)self addressingGrammarsFromContactWrapper:a4];
  [v6 setAddressingGrammarsEncrypted:v7];
}

- (void)_processSpecialRulesFieldsForContact:(id)a3 wrapper:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ABSContactsSyncManager *)self _applyWatchWallpaperToContactIfPossible:v7 wrapper:v6];
  [(ABSContactsSyncManager *)self _applyWallpaperArchiveToContactIfPossible:v7 wrapper:v6];
  [(ABSContactsSyncManager *)self _applySensitiveContentConfigurationIfPossible:v7 wrapper:v6];
  [(ABSContactsSyncManager *)self _applyPronounsToContact:v7 contactWrapper:v6];
}

- (void)_modifyContactFromContactWrapper_LOCKED:(id)a3 toContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(NSObject **)(qword_100069D78 + 8);
  if (!v7)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR)) {
      sub_100037BD0();
    }
    id v15 = +[NSError errorWithDomain:@"ModifyWithNoToContact" code:-1 userInfo:0];
    objc_exception_throw(v15);
  }
  id v9 = v7;
  if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_modifyContactFromContactWrapper_LOCKED:toContact:", buf, 2u);
  }
  id v10 = +[ABSContactsInterface sharedInstance];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001E854;
  v16[3] = &unk_1000553F8;
  id v17 = v6;
  id v18 = v9;
  v19 = self;
  id v11 = v9;
  id v12 = v6;
  [v10 mutateAssert:v16];

  int v13 = +[ABSContactsShadow instance];
  v14 = [v11 identifier];
  [v13 insert:v14];
}

- (void)addBatch:(id)a3 forSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)NSMutableSet) initWithCapacity:[v6 count]];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v15 = [v14 pbObject];
        v16 = [v15 contactWrapper];

        if ([v16 hasGuid]) {
          [v8 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v11);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v17 = v8;
  id v18 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        -[ABSContactsSyncManager addOrUpdateContactIn:forSession:](self, "addOrUpdateContactIn:forSession:", *(void *)(*((void *)&v22 + 1) + 8 * (void)j), v7, (void)v22);
      }
      id v19 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v19);
  }
}

- (void)addOrUpdateContactIn:(id)a3 forSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 pbObject];
  id v9 = [v8 contactWrapper];

  id v10 = [v9 guid];
  if (v10)
  {
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = sub_10001F02C;
    v18[4] = sub_10001F03C;
    id v19 = 0;
    id v11 = +[ABSContactsInterface sharedInstance];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001F044;
    v12[3] = &unk_100055420;
    id v13 = v9;
    id v17 = v18;
    id v14 = v10;
    id v15 = self;
    id v16 = v7;
    [v11 accessSync:v12];

    _Block_object_dispose(v18, 8);
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR))
  {
    sub_100037C38();
  }
}

- (void)_deleteContactForGUID_LOCKED:(id)a3
{
  id v3 = a3;
  v4 = +[ABSContactsInterface sharedInstance];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001F43C;
  v7[3] = &unk_100055148;
  id v8 = v3;
  id v5 = v3;
  [v4 mutateAssert:v7];

  id v6 = +[ABSContactsShadow instance];
  [v6 remove:v5];
}

- (void)remove:(id)a3
{
  v4 = [a3 pbObject];
  id v5 = [v4 deleteWrapper];

  id v6 = +[ABSContactsInterface sharedInstance];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001F78C;
  v8[3] = &unk_100055470;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 accessSync:v8];
}

- (void)deleteShadow
{
  id v2 = +[ABSContactsShadow instance];
  [v2 purge];
}

- (void)clearShadowMarks
{
  id v2 = +[ABSContactsShadow instance];
  [v2 purge];
}

- (void)deleteUnmarked
{
  id v2 = +[ABSContactsInterface sharedInstance];
  [v2 mutateSync:&stru_1000554B0];
}

- (void).cxx_destruct
{
}

@end