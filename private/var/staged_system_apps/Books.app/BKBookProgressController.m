@interface BKBookProgressController
+ (void)preWarmWithAnnotationProvider:(id)a3;
+ (void)progressStringForLibraryAsset:(id)a3 annotationMOC:(id)a4 completion:(id)a5;
+ (void)progressStringForLibraryAsset:(id)a3 completion:(id)a4;
- (AEAnnotationProvider)annotationProvider;
- (double)_progressForAssetID:(id)a3 moc:(id)a4;
- (void)_progressStringForLibraryAsset:(id)a3 annotationMOC:(id)a4 completion:(id)a5;
- (void)setAnnotationProvider:(id)a3;
@end

@implementation BKBookProgressController

+ (void)preWarmWithAnnotationProvider:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100129608;
  block[3] = &unk_100A43D60;
  id v6 = a3;
  uint64_t v3 = qword_100B4A3B8;
  id v4 = v6;
  if (v3 != -1) {
    dispatch_once(&qword_100B4A3B8, block);
  }
}

- (double)_progressForAssetID:(id)a3 moc:(id)a4
{
  id v5 = a4;
  id v6 = +[AEAnnotation predicateForGlobalAnnotationWithAssetID:a3];
  v7 = +[NSEntityDescription entityForName:@"AEAnnotation" inManagedObjectContext:v5];
  id v8 = objc_alloc_init((Class)NSFetchRequest);
  [v8 setEntity:v7];
  uint64_t v9 = kAEAnnotationReadingProgressHighWaterMark;
  uint64_t v10 = kAEAnnotationReadingProgress;
  v26[0] = kAEAnnotationReadingProgressHighWaterMark;
  v26[1] = kAEAnnotationReadingProgress;
  v11 = +[NSArray arrayWithObjects:v26 count:2];
  [v8 setPropertiesToFetch:v11];

  [v8 setResultType:2];
  [v8 setPredicate:v6];
  id v25 = 0;
  v12 = [v5 executeFetchRequest:v8 error:&v25];

  id v13 = v25;
  v14 = v13;
  if (v13) {
    [v13 logRecursively];
  }
  double v15 = 0.0;
  if ([v12 count] == (id)1)
  {
    objc_opt_class();
    v16 = [v12 objectAtIndex:0];
    v17 = BUDynamicCast();

    objc_opt_class();
    v18 = [v17 objectForKeyedSubscript:v10];
    v19 = BUDynamicCast();

    if (v19
      || (objc_opt_class(),
          [v17 objectForKeyedSubscript:v9],
          v20 = objc_claimAutoreleasedReturnValue(),
          BUDynamicCast(),
          v19 = objc_claimAutoreleasedReturnValue(),
          v20,
          v19))
    {
      [v19 floatValue];
      double v22 = fmin(v21, 1.0);
      if (v22 < 0.0) {
        double v22 = 0.0;
      }
      float v23 = v22;
      double v15 = v23;
    }
    else
    {
      double v15 = 1.79769313e308;
    }
  }
  return v15;
}

- (void)_progressStringForLibraryAsset:(id)a3 annotationMOC:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = [v8 isNew];
  if ([v8 isSample])
  {
    v12 = (void (**)(id, void *))objc_retainBlock(v10);
    if (v12)
    {
      id v13 = +[NSBundle mainBundle];
      v14 = [v13 localizedStringForKey:@"Sample" value:&stru_100A70340 table:0];
      v12[2](v12, v14);
    }
    goto LABEL_19;
  }
  if ([v8 isAudiobook])
  {
    uint64_t v15 = [v8 isCloud];
    v16 = +[BKMediaLibraryCache sharedCache];
    v17 = [v8 assetID];
    v35 = v17;
    v18 = +[NSArray arrayWithObjects:&v35 count:1];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100129CE0;
    v32[3] = &unk_100A479B0;
    char v34 = v11;
    id v33 = v10;
    [v16 fetchAssetsWithIDs:v18 type:v15 completion:v32];

    goto LABEL_19;
  }
  v19 = objc_opt_new();
  [v19 setNumberStyle:3];
  [v19 setMaximumFractionDigits:0];
  v20 = [v8 assetID];
  [(BKBookProgressController *)self _progressForAssetID:v20 moc:v9];
  double v22 = v21;

  if (v11)
  {
    float v23 = +[NSBundle mainBundle];
    v24 = v23;
    CFStringRef v25 = @"New";
  }
  else
  {
    v26 = &stru_100A70340;
    if (v22 < 0.0 || v22 > 1.0) {
      goto LABEL_16;
    }
    if (v22 >= 0.01 && fabs(v22 + -0.01) >= 0.005)
    {
      float v23 = +[NSBundle mainBundle];
      v24 = v23;
      if (fabs(v22 + -1.0) >= 0.005)
      {
        uint64_t v29 = [v23 localizedStringForKey:@"%@ read" value:&stru_100A70340 table:0];

        v30 = +[NSNumber numberWithDouble:v22];
        v31 = [v19 stringFromNumber:v30];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v29, v31);
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v24 = (void *)v29;
        goto LABEL_15;
      }
      CFStringRef v25 = @"Finished";
    }
    else
    {
      float v23 = +[NSBundle mainBundle];
      v24 = v23;
      CFStringRef v25 = @"Just started";
    }
  }
  v26 = [v23 localizedStringForKey:v25 value:&stru_100A70340 table:0];
LABEL_15:

LABEL_16:
  id v27 = objc_retainBlock(v10);
  v28 = v27;
  if (v27) {
    (*((void (**)(id, __CFString *))v27 + 2))(v27, v26);
  }

LABEL_19:
}

+ (void)progressStringForLibraryAsset:(id)a3 completion:(id)a4
{
  id v5 = (void *)qword_100B4A3B0;
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 annotationProvider];
  id v9 = [v8 newManagedObjectContext];

  [(id)qword_100B4A3B0 _progressStringForLibraryAsset:v7 annotationMOC:v9 completion:v6];
}

+ (void)progressStringForLibraryAsset:(id)a3 annotationMOC:(id)a4 completion:(id)a5
{
}

- (AEAnnotationProvider)annotationProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_annotationProvider);

  return (AEAnnotationProvider *)WeakRetained;
}

- (void)setAnnotationProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end