@interface MCDForYouGroupContentManager
- (id)_modelRequest;
- (id)itemAtIndexPath:(id)a3;
- (id)transformedResponse:(id)a3;
- (int64_t)allowedNumberOfItemsForDisplayWithResponse:(id)a3 inSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
@end

@implementation MCDForYouGroupContentManager

- (id)_modelRequest
{
  id v3 = objc_alloc_init((Class)MPModelForYouRecommendationsRequest);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  v4 = (void *)qword_1010D6C40;
  uint64_t v20 = qword_1010D6C40;
  if (!qword_1010D6C40)
  {
    v5 = (void *)sub_100029170();
    v18[3] = (uint64_t)dlsym(v5, "MCDMusicCarPlayBundleIdentifier");
    qword_1010D6C40 = v18[3];
    v4 = (void *)v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v4)
  {
    sub_100D691B8();
LABEL_16:
    sub_100D691B8();
    goto LABEL_17;
  }
  [v3 setClientIdentifier:*v4];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  v6 = (void *)qword_1010D6C50;
  uint64_t v20 = qword_1010D6C50;
  if (!qword_1010D6C50)
  {
    v7 = (void *)sub_100029170();
    v18[3] = (uint64_t)dlsym(v7, "MCDMusicCarPlayVersion");
    qword_1010D6C50 = v18[3];
    v6 = (void *)v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v6) {
    goto LABEL_16;
  }
  [v3 setClientVersion:*v6];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  v8 = (void *)qword_1010D6C58;
  uint64_t v20 = qword_1010D6C58;
  if (!qword_1010D6C58)
  {
    v9 = (void *)sub_100029170();
    v18[3] = (uint64_t)dlsym(v9, "MCDMusicCarPlayPlatformIdentifier");
    qword_1010D6C58 = v18[3];
    v8 = (void *)v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v8)
  {
LABEL_17:
    v16 = (_Unwind_Exception *)sub_100D691B8();
    _Block_object_dispose(&v17, 8);
    _Unwind_Resume(v16);
  }
  [v3 setClientPlatformIdentifier:*v8];
  [v3 setFilteringPolicy:1];
  [v3 setRequestEndpoint:1];
  [v3 setAuthenticationOptions:3];
  v10 = [(MCDFuseContentManager *)self dataSource];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v12 = [(MCDFuseContentManager *)self dataSource];
    v13 = [v12 recommendationGroup];
    v14 = [v13 loadAdditionalContentURL];
    [v3 setCustomForYouURL:v14];
  }

  return v3;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(MCDFuseContentManager *)self dataSource];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MCDFuseContentManager *)self dataSource];
    v8 = [v7 recommendationGroup];
    v9 = [v8 itemAtIndex:[v4 row]];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)allowedNumberOfItemsForDisplayWithResponse:(id)a3 inSection:(int64_t)a4
{
  v5 = [(MCDFuseContentManager *)self dataSource];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MCDFuseContentManager *)self dataSource];
    v8 = [v7 recommendationGroup];
    int64_t v9 = (int64_t)[v8 numberOfItems];
  }
  else
  {
    int64_t v9 = 0;
  }
  unsigned int v10 = [(MCDFuseContentManager *)self limitedUI];
  int64_t v11 = 12;
  if (v9 < 12) {
    int64_t v11 = v9;
  }
  if (v10) {
    return v11;
  }
  else {
    return v9;
  }
}

- (id)transformedResponse:(id)a3
{
  id v3 = a3;

  return v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

@end