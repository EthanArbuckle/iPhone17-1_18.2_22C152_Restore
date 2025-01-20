@interface PSWatchOnlyAppCellularUsageSpecifier
+ (id)getGenericRoundIcon;
+ (void)setIconForSpecifier:(id)a3 bundleID:(id)a4;
@end

@implementation PSWatchOnlyAppCellularUsageSpecifier

+ (void)setIconForSpecifier:(id)a3 bundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy_;
  v18[4] = __Block_byref_object_dispose_;
  id v19 = 0;
  v7 = [MEMORY[0x263F1C920] mainScreen];
  v8 = [v7 traitCollection];
  [v8 displayScale];
  if (v9 <= 2.0) {
    uint64_t v10 = 47;
  }
  else {
    uint64_t v10 = 48;
  }

  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v11 = (void *)qword_26AC328A0;
  uint64_t v24 = qword_26AC328A0;
  if (!qword_26AC328A0)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __getNanoResourceGrabberClass_block_invoke;
    v20[3] = &unk_2646DEC48;
    v20[4] = &v21;
    __getNanoResourceGrabberClass_block_invoke((uint64_t)v20);
    v11 = (void *)v22[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v21, 8);
  v13 = [v12 sharedInstance];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__PSWatchOnlyAppCellularUsageSpecifier_setIconForSpecifier_bundleID___block_invoke;
  v15[3] = &unk_2646DEC20;
  v17 = v18;
  id v14 = v5;
  id v16 = v14;
  [v13 getIconForBundleID:v6 iconVariant:v10 block:v15 timeout:-1.0];

  _Block_object_dispose(v18, 8);
}

void __69__PSWatchOnlyAppCellularUsageSpecifier_setIconForSpecifier_bundleID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = v3;
  if (v3)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = v3;
    id v6 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v5;
  }
  else
  {
    uint64_t v7 = +[PSWatchOnlyAppCellularUsageSpecifier getGenericRoundIcon];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }

  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v9) {
    [*(id *)(a1 + 32) setProperty:v9 forKey:*MEMORY[0x263F60140]];
  }
}

+ (id)getGenericRoundIcon
{
  if (_MergedGlobals_5 != -1) {
    dispatch_once(&_MergedGlobals_5, &__block_literal_global_2);
  }
  v2 = (void *)qword_26AC32898;
  return v2;
}

void __59__PSWatchOnlyAppCellularUsageSpecifier_getGenericRoundIcon__block_invoke()
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v0 = (void *)qword_26AC328B0;
  uint64_t v21 = qword_26AC328B0;
  if (!qword_26AC328B0)
  {
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __getISIconClass_block_invoke;
    id v16 = &unk_2646DEC48;
    v17 = &v18;
    __getISIconClass_block_invoke((uint64_t)&v13);
    v0 = (void *)v19[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v18, 8);
  v2 = [v1 genericApplicationIcon];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2050000000;
  id v3 = (void *)qword_26AC328B8;
  uint64_t v21 = qword_26AC328B8;
  if (!qword_26AC328B8)
  {
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __getISImageDescriptorClass_block_invoke;
    id v16 = &unk_2646DEC48;
    v17 = &v18;
    __getISImageDescriptorClass_block_invoke((uint64_t)&v13);
    id v3 = (void *)v19[3];
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v18, 8);
  id v5 = [v4 alloc];
  ScreenScale();
  uint64_t v7 = objc_msgSend(v5, "initWithSize:scale:", 29.0, 29.0, v6);
  [v7 setShape:2];
  uint64_t v8 = [v2 imageForDescriptor:v7];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = (void *)MEMORY[0x263F1C6B0];
    uint64_t v11 = [v8 CGImage];
    [v9 scale];
    uint64_t v8 = objc_msgSend(v10, "imageWithCGImage:scale:orientation:", v11, 0);
  }
  id v12 = (void *)qword_26AC32898;
  qword_26AC32898 = (uint64_t)v8;
}

@end