@interface MCDBrowseItemsMusicKitContentManager
- (id)_modelRequest;
@end

@implementation MCDBrowseItemsMusicKitContentManager

- (id)_modelRequest
{
  id v3 = objc_alloc_init((Class)MPModelStoreBrowseRoomRequest);
  v4 = [(MCDFuseContentManager *)self dataSource];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(MCDFuseContentManager *)self dataSource];
    v7 = [v6 parentSection];
    [v3 configureWithParentSection:v7];
  }
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  v8 = (void *)qword_1010D7028;
  uint64_t v19 = qword_1010D7028;
  if (!qword_1010D7028)
  {
    v9 = (void *)sub_10002A170();
    v17[3] = (uint64_t)dlsym(v9, "MCDMusicCarPlayBundleIdentifier");
    qword_1010D7028 = v17[3];
    v8 = (void *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v8)
  {
    sub_100D691B8();
LABEL_16:
    sub_100D691B8();
    goto LABEL_17;
  }
  [v3 setClientIdentifier:*v8];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  v10 = (void *)qword_1010D7038;
  uint64_t v19 = qword_1010D7038;
  if (!qword_1010D7038)
  {
    v11 = (void *)sub_10002A170();
    v17[3] = (uint64_t)dlsym(v11, "MCDMusicCarPlayVersion");
    qword_1010D7038 = v17[3];
    v10 = (void *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v10) {
    goto LABEL_16;
  }
  [v3 setClientVersion:*v10];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  v12 = (void *)qword_1010D7040;
  uint64_t v19 = qword_1010D7040;
  if (!qword_1010D7040)
  {
    v13 = (void *)sub_10002A170();
    v17[3] = (uint64_t)dlsym(v13, "MCDMusicCarPlayPlatformIdentifier");
    qword_1010D7040 = v17[3];
    v12 = (void *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v12)
  {
LABEL_17:
    v15 = (_Unwind_Exception *)sub_100D691B8();
    _Block_object_dispose(&v16, 8);
    _Unwind_Resume(v15);
  }
  [v3 setClientPlatformIdentifier:*v12];
  [v3 setAuthenticationOptions:1];

  return v3;
}

@end