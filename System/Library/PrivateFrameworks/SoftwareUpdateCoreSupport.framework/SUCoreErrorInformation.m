@interface SUCoreErrorInformation
+ (id)codeNameForDomain:(id)a3 withCode:(int64_t)a4;
+ (id)codeNameForError:(id)a3;
+ (id)nameForSUCoreCode:(int64_t)a3;
+ (id)nameForSUCoreLayer:(int64_t)a3;
+ (id)safeUserInfoValueClasses;
+ (id)setupCoreErrorInformation;
+ (id)sharedErrorInformation;
+ (id)summaryOfIndications:(int64_t)a3;
+ (int64_t)allIndicationsForError:(id)a3;
+ (int64_t)indicationsForError:(id)a3 matchingMask:(int64_t)a4;
+ (int64_t)layerForError:(id)a3;
+ (void)associateLayer:(int64_t)a3 withDomain:(id)a4;
+ (void)associateLayer:(int64_t)a3 withDomain:(id)a4 indicating:(int64_t)a5 ifKeyTrue:(id)a6;
+ (void)associateLayer:(int64_t)a3 withDomain:(id)a4 keyMatchTrueMap:(id)a5;
+ (void)associateLayer:(int64_t)a3 withDomain:(id)a4 minCode:(int64_t)a5 maxCode:(int64_t)a6;
+ (void)associateLayer:(int64_t)a3 withDomain:(id)a4 minCode:(int64_t)a5 maxCode:(int64_t)a6 indicating:(int64_t)a7 ifKeyTrue:(id)a8 keyMatchTrueMap:(id)a9;
+ (void)attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5;
+ (void)attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5 indicating:(int64_t)a6;
+ (void)attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5 indicating:(int64_t)a6 ifKeyTrue:(id)a7;
+ (void)attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5 indicating:(int64_t)a6 ifKeyTrue:(id)a7 keyMatchTrueMap:(id)a8;
+ (void)attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5 keyMatchTrueMap:(id)a6;
+ (void)attributesOfSUCoreErrorCode:(int64_t)a3 indicating:(int64_t)a4;
- (NSArray)safeUserInfoValues;
- (NSMutableDictionary)errorInformation;
- (NSMutableDictionary)layerInformation;
- (OS_dispatch_queue)informationQueue;
- (SUCoreErrorInformation)init;
- (void)_associateLayer:(int64_t)a3 withDomain:(id)a4 minCode:(int64_t)a5 maxCode:(int64_t)a6;
- (void)_associateLayer:(int64_t)a3 withDomain:(id)a4 minCode:(int64_t)a5 maxCode:(int64_t)a6 indicating:(int64_t)a7 ifKeyTrue:(id)a8 keyMatchTrueMap:(id)a9;
- (void)_attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5 indicating:(int64_t)a6 ifKeyTrue:(id)a7 keyMatchTrueMap:(id)a8;
- (void)_defineErrorLayers;
@end

@implementation SUCoreErrorInformation

uint64_t __50__SUCoreErrorInformation_safeUserInfoValueClasses__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) safeUserInfoValues];
  return MEMORY[0x1F41817F8]();
}

- (NSArray)safeUserInfoValues
{
  return self->_safeUserInfoValues;
}

void __51__SUCoreErrorInformation_setupCoreErrorInformation__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) informationQueue];
  dispatch_assert_queue_not_V2(v2);

  v3 = [*(id *)(a1 + 32) informationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SUCoreErrorInformation_setupCoreErrorInformation__block_invoke_2;
  block[3] = &unk_1E60B6300;
  id v5 = *(id *)(a1 + 32);
  dispatch_sync(v3, block);
}

void __40__SUCoreErrorInformation_layerForError___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) layerInformation];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__SUCoreErrorInformation_layerForError___block_invoke_2;
  v5[3] = &unk_1E60B63F0;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
}

+ (int64_t)indicationsForError:(id)a3 matchingMask:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[SUCoreErrorInformation setupCoreErrorInformation];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v7 = [v6 informationQueue];
  dispatch_assert_queue_not_V2(v7);

  v8 = [v6 informationQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__SUCoreErrorInformation_indicationsForError_matchingMask___block_invoke;
  v13[3] = &unk_1E60B64B8;
  id v14 = v6;
  id v15 = v5;
  v16 = &v18;
  int64_t v17 = a4;
  id v9 = v5;
  id v10 = v6;
  dispatch_sync(v8, v13);

  int64_t v11 = v19[3];
  _Block_object_dispose(&v18, 8);
  return v11;
}

+ (id)codeNameForError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[SUCoreErrorInformation setupCoreErrorInformation];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  id v5 = [v4 informationQueue];
  dispatch_assert_queue_not_V2(v5);

  id v6 = [v4 informationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SUCoreErrorInformation_codeNameForError___block_invoke;
  block[3] = &unk_1E60B6418;
  id v12 = v4;
  id v13 = v3;
  id v14 = &v15;
  id v7 = v3;
  id v8 = v4;
  dispatch_sync(v6, block);

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

+ (int64_t)allIndicationsForError:(id)a3
{
  return +[SUCoreErrorInformation indicationsForError:a3 matchingMask:255];
}

- (void)_defineErrorLayers
{
  id v3 = [(SUCoreErrorInformation *)self informationQueue];
  dispatch_assert_queue_V2(v3);

  [(SUCoreErrorInformation *)self _associateLayer:100 withDomain:@"SUCoreError" minCode:8100 maxCode:8126];
  [(SUCoreErrorInformation *)self _associateLayer:110 withDomain:@"SUCoreError" minCode:8200 maxCode:8206];
  [(SUCoreErrorInformation *)self _associateLayer:130 withDomain:@"SUCoreError" minCode:8250 maxCode:8255];
  [(SUCoreErrorInformation *)self _associateLayer:101 withDomain:@"SUCoreError" minCode:8300 maxCode:8300];
  [(SUCoreErrorInformation *)self _associateLayer:620 withDomain:@"SUCoreError" minCode:8400 maxCode:8411];
  [(SUCoreErrorInformation *)self _associateLayer:102 withDomain:@"SUCoreError" minCode:8500 maxCode:8503];
  [(SUCoreErrorInformation *)self _associateLayer:150 withDomain:@"SUCoreError" minCode:8600 maxCode:8608];
  [(SUCoreErrorInformation *)self _associateLayer:410 withDomain:@"SUCoreError" minCode:8700 maxCode:8707];
  [(SUCoreErrorInformation *)self _associateLayer:500 withDomain:@"SUCoreError" minCode:8800 maxCode:8804];
  [(SUCoreErrorInformation *)self _associateLayer:140 withDomain:@"SUCoreError" minCode:8900 maxCode:8909];
  [(SUCoreErrorInformation *)self _associateLayer:910 withDomain:@"SUCoreError" minCode:9900 maxCode:9900];
  [(SUCoreErrorInformation *)self _associateLayer:920 withDomain:@"SUCoreError" minCode:9000 maxCode:9012];
}

- (void)_associateLayer:(int64_t)a3 withDomain:(id)a4 minCode:(int64_t)a5 maxCode:(int64_t)a6
{
}

- (void)_associateLayer:(int64_t)a3 withDomain:(id)a4 minCode:(int64_t)a5 maxCode:(int64_t)a6 indicating:(int64_t)a7 ifKeyTrue:(id)a8 keyMatchTrueMap:(id)a9
{
  id v13 = a4;
  id v14 = a8;
  id v15 = a9;
  v16 = [(SUCoreErrorInformation *)self informationQueue];
  dispatch_assert_queue_V2(v16);

  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithInt:a3];
  uint64_t v18 = [(SUCoreErrorInformation *)self layerInformation];
  id v19 = [v18 safeObjectForKey:v17 ofClass:objc_opt_class()];

  if (v19)
  {
    id v20 = +[SUCoreLog sharedLogger];
    uint64_t v21 = [v20 oslog];

    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:indicating:ifKeyTrue:keyMatchTrueMap:](a3, v21);
    }
  }
  else
  {
    id v19 = [[SUCoreErrorLayerGroup alloc] initForLayer:a3 withDomain:v13 minCode:a5 maxCode:a6 indicating:a7 ifKeyTrue:v14 keyMatchTrueMap:v15];
    v22 = [(SUCoreErrorInformation *)self layerInformation];
    [v22 setSafeObject:v19 forKey:v17];
  }
}

- (NSMutableDictionary)layerInformation
{
  return self->_layerInformation;
}

+ (int64_t)layerForError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[SUCoreErrorInformation setupCoreErrorInformation];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 10;
  id v5 = [v4 informationQueue];
  dispatch_assert_queue_not_V2(v5);

  id v6 = [v4 informationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SUCoreErrorInformation_layerForError___block_invoke;
  block[3] = &unk_1E60B6418;
  id v12 = v4;
  id v13 = v3;
  id v14 = &v15;
  id v7 = v3;
  id v8 = v4;
  dispatch_sync(v6, block);

  int64_t v9 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v9;
}

+ (id)safeUserInfoValueClasses
{
  v2 = +[SUCoreErrorInformation setupCoreErrorInformation];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  id v3 = [v2 informationQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v4 = [v2 informationQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__SUCoreErrorInformation_safeUserInfoValueClasses__block_invoke;
  v8[3] = &unk_1E60B6328;
  id v9 = v2;
  id v10 = &v11;
  id v5 = v2;
  dispatch_sync(v4, v8);

  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (OS_dispatch_queue)informationQueue
{
  return self->_informationQueue;
}

+ (id)setupCoreErrorInformation
{
  v2 = +[SUCoreErrorInformation sharedErrorInformation];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SUCoreErrorInformation_setupCoreErrorInformation__block_invoke;
  block[3] = &unk_1E60B6300;
  id v3 = v2;
  id v6 = v3;
  if (setupCoreErrorInformation_coreErrorInfoOnce != -1) {
    dispatch_once(&setupCoreErrorInformation_coreErrorInfoOnce, block);
  }

  return v3;
}

+ (id)sharedErrorInformation
{
  if (sharedErrorInformation_errorInfoOnce != -1) {
    dispatch_once(&sharedErrorInformation_errorInfoOnce, &__block_literal_global_0);
  }
  v2 = (void *)sharedErrorInformation_errorInfo;
  return v2;
}

void __59__SUCoreErrorInformation_indicationsForError_matchingMask___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) errorInformation];
  id v3 = [*(id *)(a1 + 40) domain];
  uint64_t v4 = [v2 safeDictionaryForKey:v3 fromBase:@"SUCoreErrorInformation{isIndication} errorInformation" withKeyDescription:@"errorInStack domain"];

  if (v4)
  {
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2020000000;
    uint64_t v46 = 0;
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__0;
    v41 = __Block_byref_object_dispose__0;
    id v42 = 0;
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__0;
    v35 = __Block_byref_object_dispose__0;
    id v36 = 0;
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28ED0]), "initWithInteger:", objc_msgSend(*(id *)(a1 + 40), "code"));
    id v6 = [v4 safeObjectForKey:v5 ofClass:objc_opt_class()];
    id v7 = v6;
    if (v6
      && ([v6 indications]
       || ([v7 keyMatchTrueMap], id v8 = objc_claimAutoreleasedReturnValue(), v8, v8)))
    {
      uint64_t v9 = [v7 indications];
      v44[3] = v9;
      uint64_t v10 = [v7 keyMatchTrue];
      uint64_t v11 = (void *)v38[5];
      v38[5] = v10;

      uint64_t v12 = [v7 keyMatchTrueMap];
      uint64_t v13 = (void *)v32[5];
      v32[5] = v12;
    }
    else
    {
      id v14 = [*(id *)(a1 + 32) layerInformation];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __59__SUCoreErrorInformation_indicationsForError_matchingMask___block_invoke_2;
      v26[3] = &unk_1E60B6468;
      id v27 = *(id *)(a1 + 40);
      v28 = &v43;
      v29 = &v37;
      v30 = &v31;
      [v14 enumerateKeysAndObjectsUsingBlock:v26];

      uint64_t v13 = v27;
    }

    uint64_t v15 = v44[3];
    if (!v15 && !v32[5]) {
      goto LABEL_15;
    }
    if (v38[5])
    {
      id v16 = [*(id *)(a1 + 40) userInfo];
      int v17 = [v16 safeBooleanForKey:v38[5]];

      if (v17)
      {
        uint64_t v15 = v44[3];
LABEL_14:
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= *(void *)(a1 + 56) & v15;
      }
    }
    else
    {
      uint64_t v18 = (void *)v32[5];
      if (!v18) {
        goto LABEL_14;
      }
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __59__SUCoreErrorInformation_indicationsForError_matchingMask___block_invoke_3;
      v22[3] = &unk_1E60B6490;
      id v19 = *(id *)(a1 + 40);
      uint64_t v20 = *(void *)(a1 + 48);
      uint64_t v21 = *(void *)(a1 + 56);
      id v23 = v19;
      uint64_t v24 = v20;
      uint64_t v25 = v21;
      [v18 enumerateKeysAndObjectsUsingBlock:v22];
    }
LABEL_15:

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v37, 8);

    _Block_object_dispose(&v43, 8);
  }
}

void __43__SUCoreErrorInformation_codeNameForError___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) errorInformation];
  id v3 = [*(id *)(a1 + 40) domain];
  id v25 = [v2 safeDictionaryForKey:v3 fromBase:@"SUCoreErrorInformation{codeNameForError} errorInformation" withKeyDescription:@"errorInStack domain"];

  if (v25)
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28ED0]), "initWithInteger:", objc_msgSend(*(id *)(a1 + 40), "code"));
    id v5 = [v25 safeObjectForKey:v4 ofClass:objc_opt_class()];
    id v6 = v5;
    if (v5)
    {
      id v7 = NSString;
      uint64_t v8 = [v5 codeName];
    }
    else
    {
      uint64_t v15 = [*(id *)(a1 + 40) domain];
      BOOL v16 = +[SUCore stringIsEqual:v15 to:@"SUCoreError"];

      id v7 = NSString;
      if (!v16)
      {
        uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(*(id *)(a1 + 40), "code"));
        uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
        int v17 = *(void **)(v24 + 40);
        *(void *)(v24 + 40) = v23;
        goto LABEL_11;
      }
      uint64_t v8 = +[SUCoreErrorInformation nameForSUCoreCode:](SUCoreErrorInformation, "nameForSUCoreCode:", [*(id *)(a1 + 40) code]);
    }
    int v17 = (void *)v8;
    uint64_t v18 = [v7 stringWithFormat:@"%@(%d)", v8, objc_msgSend(*(id *)(a1 + 40), "code")];
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

LABEL_11:
    goto LABEL_12;
  }
  uint64_t v9 = [*(id *)(a1 + 40) domain];
  BOOL v10 = +[SUCore stringIsEqual:v9 to:@"SUCoreError"];

  uint64_t v11 = NSString;
  if (v10)
  {
    uint64_t v4 = +[SUCoreErrorInformation nameForSUCoreCode:](SUCoreErrorInformation, "nameForSUCoreCode:", [*(id *)(a1 + 40) code]);
    uint64_t v12 = [v11 stringWithFormat:@"%@(%d)", v4, objc_msgSend(*(id *)(a1 + 40), "code")];
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  else
  {
    uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(*(id *)(a1 + 40), "code"));
    uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v4 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;
  }
LABEL_12:
}

void __40__SUCoreErrorInformation_layerForError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v11 = a3;
  id v6 = [*(id *)(a1 + 32) domain];
  id v7 = [v11 domain];
  if (!+[SUCore stringIsEqual:v6 to:v7]) {
    goto LABEL_4;
  }
  if ([v11 minCode] == -1)
  {

LABEL_7:
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v11 errorLayer];
    *a4 = 1;
    goto LABEL_8;
  }
  uint64_t v8 = [*(id *)(a1 + 32) code];
  if (v8 < [v11 minCode])
  {
LABEL_4:

    goto LABEL_8;
  }
  uint64_t v9 = [*(id *)(a1 + 32) code];
  uint64_t v10 = [v11 maxCode];

  if (v9 <= v10) {
    goto LABEL_7;
  }
LABEL_8:
}

- (NSMutableDictionary)errorInformation
{
  return self->_errorInformation;
}

uint64_t __51__SUCoreErrorInformation_setupCoreErrorInformation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _defineErrorLayers];
}

uint64_t __48__SUCoreErrorInformation_sharedErrorInformation__block_invoke()
{
  sharedErrorInformation_errorInfo = objc_alloc_init(SUCoreErrorInformation);
  return MEMORY[0x1F41817F8]();
}

- (SUCoreErrorInformation)init
{
  v15[5] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)SUCoreErrorInformation;
  v2 = [(SUCoreErrorInformation *)&v14 init];
  if (v2)
  {
    id v3 = (const char *)[@"com.apple.su.core.error.info" UTF8String];
    uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create(v3, v4);
    informationQueue = v2->_informationQueue;
    v2->_informationQueue = (OS_dispatch_queue *)v5;

    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    layerInformation = v2->_layerInformation;
    v2->_layerInformation = v7;

    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    errorInformation = v2->_errorInformation;
    v2->_errorInformation = v9;

    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v15[4] = objc_opt_class();
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:5];
    safeUserInfoValues = v2->_safeUserInfoValues;
    v2->_safeUserInfoValues = (NSArray *)v11;
  }
  return v2;
}

- (void)_attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5 indicating:(int64_t)a6 ifKeyTrue:(id)a7 keyMatchTrueMap:(id)a8
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  uint64_t v18 = [(SUCoreErrorInformation *)self informationQueue];
  dispatch_assert_queue_V2(v18);

  uint64_t v19 = [(SUCoreErrorInformation *)self errorInformation];
  id v20 = [v19 safeDictionaryForKey:v14 fromBase:@"SUCoreErrorInformation{_attributesOfErrorForDomain} errorInformation" withKeyDescription:@"error domain"];

  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithInteger:a4];
  if (!v20)
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v22 = [(SUCoreErrorInformation *)self errorInformation];
    [v22 setSafeObject:v20 forKey:v14];
  }
  uint64_t v23 = [v20 safeObjectForKey:v21 ofClass:objc_opt_class()];
  if (!v23)
  {
    id v24 = [[SUCoreErrorAttributes alloc] initForDomain:v14 withCode:a4 ofCodeName:v15 indicating:a6 ifKeyTrue:v16 keyMatchTrueMap:v17];
    [v20 setSafeObject:v24 forKey:v21];
    goto LABEL_13;
  }
  id v24 = v23;
  id v33 = v16;
  int64_t v25 = a6;
  v26 = [v23 domain];
  if (+[SUCore stringIsEqual:v14 to:v26]
    && [v24 code] == a4)
  {
    id v27 = [v24 codeName];

    if (v27 == v15)
    {
      [v24 setIndications:v25];
      id v16 = v33;
      [v24 setKeyMatchTrue:v33];
      [v24 setKeyMatchTrueMap:v17];
      goto LABEL_13;
    }
  }
  else
  {
  }
  v28 = +[SUCoreLog sharedLogger];
  v29 = [v28 oslog];

  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    v30 = [v24 domain];
    int v32 = [v24 code];
    uint64_t v31 = [v24 codeName];
    *(_DWORD *)buf = 138544642;
    id v35 = v14;
    __int16 v36 = 1024;
    int v37 = a4;
    __int16 v38 = 2114;
    id v39 = v15;
    __int16 v40 = 2114;
    v41 = v30;
    __int16 v42 = 1024;
    int v43 = v32;
    __int16 v44 = 2114;
    uint64_t v45 = v31;
    _os_log_error_impl(&dword_1B4EC2000, v29, OS_LOG_TYPE_ERROR, "[ERROR_INFORMATION] changing attributes of error [%{public}@:%d(%{public}@)] when already have attributes for error [%{public}@:%d(%{public}@)] | new attributes ignored", buf, 0x36u);
  }
  id v16 = v33;
LABEL_13:
}

+ (void)associateLayer:(int64_t)a3 withDomain:(id)a4
{
}

+ (void)associateLayer:(int64_t)a3 withDomain:(id)a4 minCode:(int64_t)a5 maxCode:(int64_t)a6
{
}

+ (void)associateLayer:(int64_t)a3 withDomain:(id)a4 indicating:(int64_t)a5 ifKeyTrue:(id)a6
{
}

+ (void)associateLayer:(int64_t)a3 withDomain:(id)a4 keyMatchTrueMap:(id)a5
{
}

+ (void)associateLayer:(int64_t)a3 withDomain:(id)a4 minCode:(int64_t)a5 maxCode:(int64_t)a6 indicating:(int64_t)a7 ifKeyTrue:(id)a8 keyMatchTrueMap:(id)a9
{
  id v14 = a4;
  id v15 = a8;
  id v16 = a9;
  id v17 = +[SUCoreErrorInformation setupCoreErrorInformation];
  uint64_t v18 = [v17 informationQueue];
  dispatch_assert_queue_not_V2(v18);

  uint64_t v19 = [v17 informationQueue];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __105__SUCoreErrorInformation_associateLayer_withDomain_minCode_maxCode_indicating_ifKeyTrue_keyMatchTrueMap___block_invoke;
  v24[3] = &unk_1E60B63A0;
  id v25 = v17;
  id v26 = v14;
  int64_t v29 = a3;
  int64_t v30 = a5;
  int64_t v31 = a6;
  int64_t v32 = a7;
  id v27 = v15;
  id v28 = v16;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  id v23 = v17;
  dispatch_sync(v19, v24);
}

uint64_t __105__SUCoreErrorInformation_associateLayer_withDomain_minCode_maxCode_indicating_ifKeyTrue_keyMatchTrueMap___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _associateLayer:*(void *)(a1 + 64) withDomain:*(void *)(a1 + 40) minCode:*(void *)(a1 + 72) maxCode:*(void *)(a1 + 80) indicating:*(void *)(a1 + 88) ifKeyTrue:*(void *)(a1 + 48) keyMatchTrueMap:*(void *)(a1 + 56)];
}

+ (void)attributesOfSUCoreErrorCode:(int64_t)a3 indicating:(int64_t)a4
{
  +[SUCoreErrorInformation nameForSUCoreCode:](SUCoreErrorInformation, "nameForSUCoreCode:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  +[SUCoreErrorInformation attributesOfErrorForDomain:@"SUCoreError" withCode:a3 codeName:v6 indicating:a4 ifKeyTrue:0 keyMatchTrueMap:0];
}

+ (void)attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5
{
}

+ (void)attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5 indicating:(int64_t)a6
{
}

+ (void)attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5 indicating:(int64_t)a6 ifKeyTrue:(id)a7
{
}

+ (void)attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5 keyMatchTrueMap:(id)a6
{
}

+ (void)attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5 indicating:(int64_t)a6 ifKeyTrue:(id)a7 keyMatchTrueMap:(id)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  id v17 = +[SUCoreErrorInformation setupCoreErrorInformation];
  uint64_t v18 = [v17 informationQueue];
  dispatch_assert_queue_not_V2(v18);

  uint64_t v19 = [v17 informationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __108__SUCoreErrorInformation_attributesOfErrorForDomain_withCode_codeName_indicating_ifKeyTrue_keyMatchTrueMap___block_invoke;
  block[3] = &unk_1E60B63C8;
  id v26 = v17;
  id v27 = v13;
  int64_t v31 = a4;
  int64_t v32 = a6;
  id v28 = v14;
  id v29 = v15;
  id v30 = v16;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  id v23 = v13;
  id v24 = v17;
  dispatch_sync(v19, block);
}

uint64_t __108__SUCoreErrorInformation_attributesOfErrorForDomain_withCode_codeName_indicating_ifKeyTrue_keyMatchTrueMap___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _attributesOfErrorForDomain:*(void *)(a1 + 40) withCode:*(void *)(a1 + 72) codeName:*(void *)(a1 + 48) indicating:*(void *)(a1 + 80) ifKeyTrue:*(void *)(a1 + 56) keyMatchTrueMap:*(void *)(a1 + 64)];
}

+ (id)nameForSUCoreLayer:(int64_t)a3
{
  if (a3 <= 399)
  {
    if (a3 <= 139)
    {
      if (a3 > 101)
      {
        if (a3 > 119)
        {
          if (a3 == 120) {
            return @"Scheduler";
          }
          if (a3 == 130) {
            return @"PersistedState";
          }
        }
        else
        {
          if (a3 == 102) {
            return @"FSM";
          }
          if (a3 == 110) {
            return @"EventReporter";
          }
        }
      }
      else
      {
        if (a3 > 99)
        {
          if (a3 == 100) {
            return @"SUCore";
          }
          else {
            return @"Diag";
          }
        }
        if (!a3) {
          return &stru_1F0D92C90;
        }
        if (a3 == 10) {
          return @"?";
        }
      }
    }
    else if (a3 <= 160)
    {
      if (a3 > 150)
      {
        if (a3 == 151) {
          return @"CacheDelete";
        }
        if (a3 == 160) {
          return @"Power";
        }
      }
      else
      {
        if (a3 == 140) {
          return @"Connect";
        }
        if (a3 == 150) {
          return @"Space";
        }
      }
    }
    else if (a3 <= 209)
    {
      if (a3 == 161) {
        return @"PowerManagement";
      }
      if (a3 == 200) {
        return @"OperatingSystem";
      }
    }
    else
    {
      switch(a3)
      {
        case 210:
          return @"OSFilesystem";
        case 300:
          return @"Network";
        case 310:
          return @"NetworkServer";
      }
    }
    return @"!";
  }
  if (a3 > 599)
  {
    if (a3 > 709)
    {
      if (a3 <= 899)
      {
        if (a3 == 710) {
          return @"BridgeOS";
        }
        if (a3 == 711) {
          return @"BridgeOSAMAuthInstall";
        }
      }
      else
      {
        switch(a3)
        {
          case 900:
            return @"Test";
          case 910:
            return @"Simulate";
          case 920:
            return @"DocManager";
        }
      }
    }
    else if (a3 <= 619)
    {
      if (a3 == 600) {
        return @"Facility";
      }
      if (a3 == 610) {
        return @"Policy";
      }
    }
    else
    {
      switch(a3)
      {
        case 620:
          return @"Scan";
        case 630:
          return @"Update";
        case 700:
          return @"Extended";
      }
    }
    return @"!";
  }
  if (a3 > 499)
  {
    if (a3 > 510)
    {
      if (a3 == 511) {
        return @"Personalization";
      }
      if (a3 == 512) {
        return @"Preflight";
      }
    }
    else
    {
      if (a3 == 500) {
        return @"SoftwareUpdate";
      }
      if (a3 == 510) {
        return @"MSU";
      }
    }
    return @"!";
  }
  switch(a3)
  {
    case 400:
      id result = @"Asset";
      break;
    case 410:
      id result = @"MobileAsset";
      break;
    case 411:
      id result = @"MobileAssetDownload";
      break;
    case 412:
      id result = @"MobileAssetQuery";
      break;
    case 413:
      id result = @"MobileAssetPurge";
      break;
    case 414:
      id result = @"MobileAssetXPC";
      break;
    default:
      return @"!";
  }
  return result;
}

+ (id)codeNameForDomain:(id)a3 withCode:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[SUCoreErrorInformation setupCoreErrorInformation];
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__0;
  id v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  id v7 = [v6 informationQueue];
  dispatch_assert_queue_not_V2(v7);

  uint64_t v8 = [v6 informationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SUCoreErrorInformation_codeNameForDomain_withCode___block_invoke;
  block[3] = &unk_1E60B6440;
  id v9 = v5;
  id v17 = v9;
  uint64_t v19 = &v21;
  int64_t v20 = a4;
  id v10 = v6;
  id v18 = v10;
  dispatch_sync(v8, block);

  uint64_t v11 = (void *)v22[5];
  if (!v11)
  {
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%d", a4);
    id v13 = (void *)v22[5];
    v22[5] = v12;

    uint64_t v11 = (void *)v22[5];
  }
  id v14 = v11;

  _Block_object_dispose(&v21, 8);
  return v14;
}

uint64_t __53__SUCoreErrorInformation_codeNameForDomain_withCode___block_invoke(uint64_t a1)
{
  if (+[SUCore stringIsEqual:*(void *)(a1 + 32) to:@"SUCoreError"])
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = +[SUCoreErrorInformation nameForSUCoreCode:*(void *)(a1 + 56)];
  }
  else
  {
    v2 = [*(id *)(a1 + 40) errorInformation];
    id v10 = [v2 safeDictionaryForKey:*(void *)(a1 + 32) fromBase:@"SUCoreErrorInformation{codeNameForDomain} errorInformation" withKeyDescription:@"error domain"];

    if (v10)
    {
      id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithInteger:*(void *)(a1 + 56)];
      uint64_t v4 = [v10 safeObjectForKey:v3 ofClass:objc_opt_class()];
      id v5 = v4;
      if (v4)
      {
        uint64_t v6 = [v4 codeName];
        uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v8 = *(void **)(v7 + 40);
        *(void *)(v7 + 40) = v6;
      }
    }
  }
  return MEMORY[0x1F41817F8]();
}

+ (id)nameForSUCoreCode:(int64_t)a3
{
  if (a3 > 8499)
  {
    if (a3 > 8899)
    {
      if (a3 <= 9099)
      {
        switch(a3)
        {
          case 9000:
            id result = @"kSUCoreErrorDocManagerAllocationFailure";
            break;
          case 9001:
            id result = @"kSUCoreErrorDocManagerDirectoryDeleteFailure";
            break;
          case 9002:
            id result = @"kSUCoreErrorDocManagerDirectoryCopyFailure";
            break;
          case 9003:
            id result = @"kSUCoreErrorDocManagerDirectoryReadFailure";
            break;
          case 9004:
            id result = @"kSUCoreErrorDocManagerPathCreateFailure";
            break;
          case 9005:
            id result = @"kSUCoreErrorDocManagerInstalledBuildCreateFailure";
            break;
          case 9006:
            id result = @"kSUCoreErrorDocManagerDetermineOSBuildFailure";
            break;
          case 9007:
            return @"Unknown Error Code";
          case 9008:
            id result = @"kSUCoreErrorDocManagerCreateInstalledStashedDataDictFailed";
            break;
          case 9009:
            id result = @"kSUCoreErrorDocManagerStashedBuildVersionNotFound";
            break;
          case 9010:
            id result = @"kSUCoreErrorDocDataCreateFailed";
            break;
          case 9011:
            id result = @"kSUCoreErrorDocDataAssetRefreshFailed";
            break;
          case 9012:
            id result = @"kSUCoreErrorDocDataAssetNotLocal";
            break;
          default:
            switch(a3)
            {
              case 8900:
                id result = @"kSUCoreErrorConnectClientDoesNotRespond";
                break;
              case 8902:
                id result = @"kSUCoreErrorConnectClientDecodeFailure";
                break;
              case 8903:
                id result = @"kSUCoreErrorConnectClientDecodeException";
                break;
              case 8904:
                id result = @"kSUCoreErrorConnectServerDecodeFailure";
                break;
              case 8905:
                id result = @"kSUCoreErrorConnectServerDecodeException";
                break;
              case 8906:
                id result = @"kSUCoreErrorConnectClientIsObserverOnly";
                break;
              case 8907:
                id result = @"kSUCoreErrorConnectClientIDMismatch";
                break;
              case 8908:
                id result = @"kSUCoreErrorConnectMessagedIDMismatch";
                break;
              case 8909:
                id result = @"kSUCoreErrorConnectNoServerConnection";
                break;
              default:
                return @"Unknown Error Code";
            }
            break;
        }
      }
      else
      {
        if (a3 > 9899)
        {
          if (a3 == 9900) {
            return @"kSUCoreErrorSimulatedFailure";
          }
          if (a3 == 90007) {
            return @"kSUCoreErrorDocManagerFileEvictionFailure";
          }
        }
        else
        {
          if (a3 == 9100) {
            return @"kSUCoreErrorDDMInvalidDeclarationFailure";
          }
          if (a3 == 9101) {
            return @"kSUCoreErrorDDMNoControllerFailure";
          }
        }
        return @"Unknown Error Code";
      }
    }
    else if (a3 > 8699)
    {
      switch(a3)
      {
        case 8700:
          id result = @"kSUCoreErrorAssetDownloadFailed";
          break;
        case 8701:
          id result = @"kSUCoreErrorAssetPurgeFailed";
          break;
        case 8702:
          id result = @"kSUCoreErrorCancelingDownload";
          break;
        case 8703:
          id result = @"kSUCoreErrorConfiguringDownload";
          break;
        case 8704:
          id result = @"kSUCoreErrorAssetReloadFailed";
          break;
        case 8705:
          id result = @"kSUCoreErrorAssetReloadNotFound";
          break;
        case 8706:
          id result = @"kSUCoreErrorAssetRefreshFailed";
          break;
        case 8707:
          id result = @"kSUCoreErrorAssetNotLocal";
          break;
        default:
          switch(a3)
          {
            case 8800:
              id result = @"kSUCoreErrorMSUPreflightSUDownloadFailed";
              break;
            case 8801:
              id result = @"kSUCoreErrorMSUPurgeFailed";
              break;
            case 8802:
              id result = @"kSUCoreErrorMSUPreviousUpdateStateFailed";
              break;
            case 8803:
              id result = @"kSUCoreErrorMSUMissingDescriptor";
              break;
            case 8804:
              id result = @"kSUCoreErrorMSUPrepareFailed";
              break;
            default:
              return @"Unknown Error Code";
          }
          break;
      }
    }
    else
    {
      switch(a3)
      {
        case 8600:
          id result = @"kSUCoreErrorSpaceInsufficient";
          break;
        case 8601:
          id result = @"kSUCoreErrorSpaceNoPurgeResults";
          break;
        case 8602:
          id result = @"kSUCoreErrorSpaceCheckFailed";
          break;
        case 8603:
          id result = @"kSUCoreErrorSpaceNoCacheDeletePurgeableResults";
          break;
        case 8604:
          id result = @"kSUCoreErrorSpaceCacheDeletePurgeableFailed";
          break;
        case 8605:
          id result = @"kSUCoreErrorSpaceNoAppOffloadPurgeableResults";
          break;
        case 8606:
          id result = @"kSUCoreErrorSpaceAppOffloadPurgeableFailed";
          break;
        case 8607:
          id result = @"kSUCoreErrorSpaceNoAppOffloadPurgeResults";
          break;
        case 8608:
          id result = @"kSUCoreErrorSpaceAppOffloadFailed";
          break;
        default:
          switch(a3)
          {
            case 8500:
              id result = @"kSUCoreErrorFSMStateInvalidForTable";
              break;
            case 8501:
              id result = @"kSUCoreErrorFSMEventInvalidForState";
              break;
            case 8502:
              id result = @"kSUCoreErrorFSMAlreadyActive";
              break;
            case 8503:
              id result = @"kSUCoreErrorFSMInvalidTable";
              break;
            default:
              return @"Unknown Error Code";
          }
          break;
      }
    }
  }
  else if (a3 > 8249)
  {
    switch(a3)
    {
      case 8400:
        id result = @"kSUCoreErrorScanCatalogDownloadFailed";
        break;
      case 8401:
        id result = @"kSUCoreErrorScanQueryMetadataFailed";
        break;
      case 8402:
        id result = @"kSUCoreErrorScanFailed";
        break;
      case 8403:
        id result = @"kSUCoreErrorScanCanceled";
        break;
      case 8404:
        id result = @"kSUCoreErrorScanFailCanceling";
        break;
      case 8405:
        id result = @"kSUCoreErrorScanNotCanceling";
        break;
      case 8406:
        id result = @"kSUCoreErrorScanNoUpdateFound";
        break;
      case 8407:
        id result = @"kSUCoreErrorScanNoDocFound";
        break;
      case 8408:
        id result = @"kSUCoreErrorScanFoundDifferent";
        break;
      case 8409:
        id result = @"kSUCoreErrorScanFoundMultiple";
        break;
      case 8410:
        id result = @"kSUCoreErrorScanAbortedStale";
        break;
      case 8411:
        id result = @"kSUCoreErrorScanFailedToDeterminePSUSAssets";
        break;
      default:
        switch(a3)
        {
          case 8250:
            id result = @"kSUCoreErrorPersistedStateNotLoaded";
            break;
          case 8251:
            id result = @"kSUCoreErrorPersistedStateLoadFailed";
            break;
          case 8252:
            id result = @"kSUCoreErrorPersistedStateMissingContents";
            break;
          case 8253:
            id result = @"kSUCoreErrorPersistedStateInvalidType";
            break;
          case 8254:
            id result = @"kSUCoreErrorPersistedStateArchiverError";
            break;
          case 8255:
            id result = @"kSUCoreErrorPersistedStateClassMismatch";
            break;
          default:
            if (a3 != 8300) {
              return @"Unknown Error Code";
            }
            id result = @"kSUCoreErrorDiagDecoded";
            break;
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 8100:
        id result = @"kSUCoreErrorCreateFailed";
        break;
      case 8101:
        id result = @"kSUCoreErrorMissingRequired";
        break;
      case 8102:
        id result = @"kSUCoreErrorInvalidParam";
        break;
      case 8103:
        id result = @"kSUCoreErrorUnknownFormat";
        break;
      case 8104:
        id result = @"kSUCoreErrorReadFailure";
        break;
      case 8105:
        id result = @"kSUCoreErrorCopyFailed";
        break;
      case 8106:
        id result = @"kSUCoreErrorSerializedFailed";
        break;
      case 8107:
        id result = @"kSUCoreErrorInvalidPayload";
        break;
      case 8108:
        id result = @"kSUCoreErrorTooManyQueued";
        break;
      case 8109:
        id result = @"kSUCoreErrorWriteFailure";
        break;
      case 8110:
        id result = @"kSUCoreErrorRemoveFailed";
        break;
      case 8111:
        id result = @"kSUCoreErrorAlreadyAssigned";
        break;
      case 8112:
        id result = @"kSUCoreErrorTypeMismatch";
        break;
      case 8113:
        id result = @"kSUCoreErrorNotSupported";
        break;
      case 8114:
        id result = @"kSUCoreErrorIgnoredParam";
        break;
      case 8115:
        id result = @"kSUCoreErrorInvalidState";
        break;
      case 8116:
        id result = @"kSUCoreErrorUnexpectedValue";
        break;
      case 8117:
        id result = @"kSUCoreErrorInconsistencyDetected";
        break;
      case 8118:
        id result = @"kSUCoreErrorInvalidPolicyAssetType";
        break;
      case 8119:
        id result = @"kSUCoreErrorOperationTimedOut";
        break;
      case 8120:
        id result = @"kSUCoreErrorExistingTransaction";
        break;
      case 8121:
        id result = @"kSUCoreErrorLoadfailed";
        break;
      case 8122:
        id result = @"kSUCoreErrorMethodNotAvailable";
        break;
      case 8123:
        id result = @"kSUCoreErrorDeprecated";
        break;
      case 8124:
        id result = @"kSUCoreErrorOperationCanceled";
        break;
      case 8125:
        id result = @"kSUCoreErrorFileNotFound";
        break;
      case 8126:
        id result = @"kSUCoreErrorMissingAuthentication";
        break;
      default:
        switch(a3)
        {
          case 8200:
            id result = @"kSUCoreErrorEventReporterInvalidTask";
            break;
          case 8201:
            id result = @"kSUCoreErrorEventReporterInvalidTaskDescriptor";
            break;
          case 8202:
            id result = @"kSUCoreErrorEventReporterSendFailed";
            break;
          case 8203:
            id result = @"kSUCoreErrorEventReporterInvalidResponse";
            break;
          case 8204:
            id result = @"kSUCoreErrorEventReporterInvalidFileUUID";
            break;
          case 8205:
            id result = @"kSUCoreErrorEventReporterNoResponse";
            break;
          case 8206:
            id result = @"kSUCoreErrorEventReporterResponseNotHTTP";
            break;
          default:
            if (a3) {
              return @"Unknown Error Code";
            }
            id result = @"kSUCoreErrorNone";
            break;
        }
        break;
    }
  }
  return result;
}

+ (id)summaryOfIndications:(int64_t)a3
{
  int v3 = a3;
  uint64_t v4 = 0;
  id v5 = &stru_1F0D92C90;
  do
  {
    if (((1 << v4) & v3) != 0)
    {
      uint64_t v6 = NSString;
      uint64_t v7 = +[SUCoreErrorAttributes nameForIndication:](SUCoreErrorAttributes, "nameForIndication:");
      uint64_t v8 = [v6 stringWithFormat:@"|%@", v7];
      uint64_t v9 = [(__CFString *)v5 stringByAppendingString:v8];

      id v5 = (__CFString *)v9;
    }
    ++v4;
  }
  while (v4 != 5);
  if ([(__CFString *)v5 isEqualToString:&stru_1F0D92C90])
  {
    id v10 = 0;
  }
  else
  {
    uint64_t v11 = [(__CFString *)v5 stringByAppendingString:@"|"];

    id v10 = v11;
    id v5 = v10;
  }

  return v10;
}

void __59__SUCoreErrorInformation_indicationsForError_matchingMask___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v17 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) domain];
  uint64_t v7 = [v17 domain];
  if (!+[SUCore stringIsEqual:v6 to:v7]) {
    goto LABEL_4;
  }
  if ([v17 minCode] == -1)
  {

LABEL_7:
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v17 indications];
    uint64_t v11 = [v17 keyMatchTrue];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    uint64_t v14 = [v17 keyMatchTrueMap];
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    *a4 = 1;
    goto LABEL_8;
  }
  uint64_t v8 = [*(id *)(a1 + 32) code];
  if (v8 < [v17 minCode])
  {
LABEL_4:

    goto LABEL_8;
  }
  uint64_t v9 = [*(id *)(a1 + 32) code];
  uint64_t v10 = [v17 maxCode];

  if (v9 <= v10) {
    goto LABEL_7;
  }
LABEL_8:
}

void __59__SUCoreErrorInformation_indicationsForError_matchingMask___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v5 unsignedLongLongValue];
      uint64_t v7 = [*(id *)(a1 + 32) userInfo];
      int v8 = [v7 safeBooleanForKey:v9];

      if (v8) {
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= *(void *)(a1 + 48) & v6;
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safeUserInfoValues, 0);
  objc_storeStrong((id *)&self->_errorInformation, 0);
  objc_storeStrong((id *)&self->_layerInformation, 0);
  objc_storeStrong((id *)&self->_informationQueue, 0);
}

- (void)_associateLayer:(uint64_t)a1 withDomain:(NSObject *)a2 minCode:maxCode:indicating:ifKeyTrue:keyMatchTrueMap:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = +[SUCoreErrorInformation nameForSUCoreLayer:a1];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_1B4EC2000, a2, OS_LOG_TYPE_ERROR, "[ERROR_INFORMATION] layer group(%{public}@) already defined", (uint8_t *)&v4, 0xCu);
}

@end