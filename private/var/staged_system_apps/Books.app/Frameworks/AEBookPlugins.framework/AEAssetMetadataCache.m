@interface AEAssetMetadataCache
- (id)coverWritingModeLanguageAndPageProgressionDirectionFromAssetID:(id)a3;
- (void)saveTitle:(id)a3 author:(id)a4 genre:(id)a5 language:(id)a6 pageProgressionDirection:(id)a7 forAssetID:(id)a8;
@end

@implementation AEAssetMetadataCache

- (id)coverWritingModeLanguageAndPageProgressionDirectionFromAssetID:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableDictionary dictionary];
  v5 = +[AEEpubInfoSource sharedInstance];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_8BAA4;
  v8[3] = &unk_1DCBD8;
  id v6 = v4;
  id v9 = v6;
  [v5 readableBookInfoForDatabaseKey_sync:v3 block:v8];

  return v6;
}

- (void)saveTitle:(id)a3 author:(id)a4 genre:(id)a5 language:(id)a6 pageProgressionDirection:(id)a7 forAssetID:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = +[AEEpubInfoSource sharedInstance];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_8BCD8;
  v25[3] = &unk_1DCC00;
  id v26 = v13;
  id v27 = v14;
  id v28 = v15;
  id v29 = v17;
  id v30 = v16;
  id v20 = v16;
  id v21 = v17;
  id v22 = v15;
  id v23 = v14;
  id v24 = v13;
  [v19 writableBookInfoForDatabaseKey_sync:v18 block:v25];
}

@end