@interface BKMusicLibraryUtilities
+ (void)storeIDsWithNonEmptyPurchasedToken:(id)a3 completion:(id)a4;
@end

@implementation BKMusicLibraryUtilities

+ (void)storeIDsWithNonEmptyPurchasedToken:(id)a3 completion:(id)a4
{
  id v17 = a3;
  id v16 = a4;
  v5 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyPurchaseHistoryID value:&off_100A82ED0 comparison:2];
  v6 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyPurchaseHistoryToken value:&off_100A82ED0 comparison:2];
  uint64_t v7 = ML3TrackPropertyStoreItemID;
  v8 = +[ML3ContainsPredicate predicateWithProperty:ML3TrackPropertyStoreItemID valueSet:v17];
  v26[0] = v5;
  v26[1] = v6;
  v26[2] = v8;
  v9 = +[NSArray arrayWithObjects:v26 count:3];
  v10 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v9];
  v11 = +[ML3MusicLibrary autoupdatingSharedLibrary];
  v12 = +[ML3Track queryWithLibrary:v11 predicate:v10];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1000070F0;
  v23 = sub_100007254;
  id v24 = objc_alloc_init((Class)NSMutableSet);
  uint64_t v25 = v7;
  v13 = +[NSArray arrayWithObjects:&v25 count:1];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001BC594;
  v18[3] = &unk_100A4A210;
  v18[4] = &v19;
  [v12 enumeratePersistentIDsAndProperties:v13 ordered:1 usingBlock:v18];

  id v14 = objc_retainBlock(v16);
  v15 = v14;
  if (v14) {
    (*((void (**)(id, uint64_t, uint64_t))v14 + 2))(v14, v20[5], 1);
  }

  _Block_object_dispose(&v19, 8);
}

@end