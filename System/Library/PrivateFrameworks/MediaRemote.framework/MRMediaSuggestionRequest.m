@interface MRMediaSuggestionRequest
+ (id)defaultRequest;
+ (id)defaultRequestWithArtwork;
- (BOOL)includeArtwork;
- (BOOL)useDirectAccess;
- (MRMediaSuggestionRequest)initWithBlock:(id)a3;
- (NSString)description;
- (NSUUID)requestIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (uint64_t)_bundleIdentifierIsSystemMediaApplication:(uint64_t)IsSystemPodcastApplication;
- (uint64_t)_intentIsValidSuggestion:(void *)a3 sourceBundleID:;
- (unint64_t)maxResults;
- (void)_artworkForIntent:(void *)a3 completion:;
- (void)performWithCompletion:(id)a3;
- (void)performWithPreferences:(id)a3 completion:(id)a4;
- (void)performWithPreferences:(id)a3 options:(id)a4 completion:(id)a5;
- (void)setIncludeArtwork:(BOOL)a3;
- (void)setMaxResults:(unint64_t)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setUseDirectAccess:(BOOL)a3;
@end

@implementation MRMediaSuggestionRequest

- (MRMediaSuggestionRequest)initWithBlock:(id)a3
{
  v4 = (void (**)(id, MRMediaSuggestionRequest *))a3;
  v9.receiver = self;
  v9.super_class = (Class)MRMediaSuggestionRequest;
  v5 = [(MRMediaSuggestionRequest *)&v9 init];
  if (v5)
  {
    v4[2](v4, v5);
    if (!v5->_requestIdentifier)
    {
      uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
      requestIdentifier = v5->_requestIdentifier;
      v5->_requestIdentifier = (NSUUID *)v6;
    }
  }

  return v5;
}

+ (id)defaultRequest
{
  v2 = [[MRMediaSuggestionRequest alloc] initWithBlock:&__block_literal_global_29];

  return v2;
}

void __42__MRMediaSuggestionRequest_defaultRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setIncludeArtwork:0];
  v2 = +[MRUserSettings currentSettings];
  objc_msgSend(v3, "setMaxResults:", objc_msgSend(v2, "maximumNumberOfMediaSuggestions"));

  [v3 setUseDirectAccess:0];
}

+ (id)defaultRequestWithArtwork
{
  v2 = +[MRMediaSuggestionRequest defaultRequest];
  [v2 setIncludeArtwork:1];

  return v2;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(MRMediaSuggestionRequest *)self requestIdentifier];
  if ([(MRMediaSuggestionRequest *)self includeArtwork]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  v7 = (void *)[v3 initWithFormat:@"<%@: requestIdentifier=%@ includeArtwork=%@ maxResults=%ld>", v4, v5, v6, -[MRMediaSuggestionRequest maxResults](self, "maxResults")];

  return (NSString *)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setIncludeArtwork:", -[MRMediaSuggestionRequest includeArtwork](self, "includeArtwork"));
  objc_msgSend(v4, "setMaxResults:", -[MRMediaSuggestionRequest maxResults](self, "maxResults"));
  v5 = [MEMORY[0x1E4F29128] UUID];
  [v4 setRequestIdentifier:v5];

  objc_msgSend(v4, "setUseDirectAccess:", -[MRMediaSuggestionRequest useDirectAccess](self, "useDirectAccess"));
  objc_msgSend(v4, "setIncludeArtwork:", -[MRMediaSuggestionRequest includeArtwork](self, "includeArtwork"));
  return v4;
}

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__MRMediaSuggestionRequest_performWithCompletion___block_invoke;
  v6[3] = &unk_1E57D1A50;
  id v7 = v4;
  id v5 = v4;
  [(MRMediaSuggestionRequest *)self performWithPreferences:0 completion:v6];
}

void __50__MRMediaSuggestionRequest_performWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 objectForKeyedSubscript:@"HomeScreen"];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)performWithPreferences:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[MRMediaSuggestionRequestOptions defaultOptions];
  [(MRMediaSuggestionRequest *)self performWithPreferences:v7 options:v8 completion:v6];
}

- (void)performWithPreferences:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v57 = a4;
  v54 = (void (**)(id, void *, void))a5;
  v46 = v7;
  v58 = -[MRMediaSuggestionPreferences snapshot](v7);
  id v8 = _MRLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v58;
    *(_WORD *)&buf[22] = 2112;
    id v89 = v57;
    _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "[MRMediaSuggestionRequest] Performing preference-respecting request %{public}@ with preferences %@, options: %@.", buf, 0x20u);
  }

  v53 = [MEMORY[0x1E4F1C9C8] date];
  v52 = objc_opt_new();
  objc_super v9 = objc_opt_new();
  v50 = -[MRMediaSuggestionPreferences globalDisplayPreferencesForContexts](v58);
  v10 = [v57 contexts];
  v11 = v10;
  if (v10)
  {
    id v49 = v10;
  }
  else
  {
    id v49 = +[MRMediaSuggestionPreferences allContexts];
  }

  if (v58)
  {
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke;
    v84[3] = &unk_1E57D2A90;
    id v85 = v50;
    v12 = objc_msgSend(v49, "msv_filter:", v84);
  }
  else
  {
    v87 = @"HomeScreen";
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
  }
  v13 = -[MRMediaSuggestionPreferences disabledBundlesForContexts](v58);
  v14 = v13;
  if (v13)
  {
    id v51 = v13;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4F1CA60];
    v16 = objc_opt_new();
    id v51 = [v15 dictionaryWithObject:v16 forKey:@"HomeScreen"];
  }
  v17 = -[MRMediaSuggestionPreferences bundlesDisabledInAllContexts](v58);
  v18 = v17;
  if (v17) {
    id v56 = v17;
  }
  else {
    id v56 = (id)objc_opt_new();
  }

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v19 = v12;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v80 objects:v86 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v81 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v23 = *(void *)(*((void *)&v80 + 1) + 8 * i);
        v24 = objc_opt_new();
        [v9 setObject:v24 forKeyedSubscript:v23];
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v80 objects:v86 count:16];
    }
    while (v20);
  }

  v25 = [v57 bundleIdentifiers];
  BOOL v26 = v25 == 0;

  if (v26)
  {
    id v30 = 0;
  }
  else
  {
    v27 = (void *)MEMORY[0x1E4F1CAD0];
    v28 = [v57 bundleIdentifiers];
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_2;
    v78[3] = &unk_1E57D2A90;
    id v79 = v56;
    v29 = objc_msgSend(v28, "msv_filter:", v78);
    id v30 = [v27 setWithArray:v29];

    if (![v30 count])
    {
      v54[2](v54, v9, 0);
      id v44 = v79;
      goto LABEL_28;
    }
  }
  v31 = softLinkBiomeLibrary[0]();
  v32 = [v31 App];
  v48 = [v32 Intent];

  v47 = (void *)[objc_alloc((Class)getBMPublisherOptionsClass[0]()) initWithStartDate:0 endDate:0 maxEvents:0 lastN:0 reversed:1];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  id v89 = 0;
  uint64_t v33 = [v19 count];
  unint64_t v34 = [(MRMediaSuggestionRequest *)self maxResults];
  v45 = v31;
  v35 = (Class)getINPlayMediaIntentClass[0]();
  v36 = NSStringFromClass(v35);
  dispatch_group_t v37 = dispatch_group_create();
  v38 = [v48 publisherWithOptions:v47];
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_3;
  v74[3] = &unk_1E57D2AB8;
  id v39 = v36;
  id v75 = v39;
  id v30 = v30;
  id v76 = v30;
  id v77 = v56;
  v40 = [v38 filterWithIsIncluded:v74];
  unint64_t v41 = v34 * v33;
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_4;
  v68[3] = &unk_1E57D2AE0;
  v69 = v37;
  v70 = self;
  id v71 = v53;
  v73 = v54;
  id v72 = v9;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_93;
  v59[3] = &unk_1E57D2B08;
  id v60 = v52;
  v61 = self;
  v42 = v69;
  v62 = v42;
  id v63 = v19;
  id v64 = v51;
  id v65 = v72;
  v66 = buf;
  unint64_t v67 = v41;
  id v43 = (id)[v40 sinkWithCompletion:v68 shouldContinue:v59];

  id v44 = v45;
  _Block_object_dispose(buf, 8);

LABEL_28:
}

uint64_t __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

uint64_t __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

uint64_t __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 eventBody];
  id v5 = [v4 intentClass];
  int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (!v6) {
    goto LABEL_6;
  }
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = [v3 eventBody];
    objc_super v9 = [v8 bundleID];
    int v10 = [v7 containsObject:v9];

    if (!v10) {
      goto LABEL_6;
    }
  }
  if (![*(id *)(a1 + 48) count]) {
    goto LABEL_7;
  }
  v11 = *(void **)(a1 + 48);
  v12 = [v3 eventBody];
  v13 = [v12 bundleID];
  LOBYTE(v11) = [v11 containsObject:v13];

  if (v11) {
LABEL_6:
  }
    uint64_t v14 = 0;
  else {
LABEL_7:
  }
    uint64_t v14 = 1;

  return v14;
}

void __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_4(uint64_t a1)
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v3 = dispatch_queue_create("com.apple.MediaRemote.MRMediaSuggestionRequest.notifyQueue", v2);

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_5;
  v6[3] = &unk_1E57D2340;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(void **)(a1 + 48);
  void v6[4] = *(void *)(a1 + 40);
  id v7 = v5;
  id v9 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 56);
  dispatch_group_notify(v4, v3, v6);
}

uint64_t __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_5(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = _MRLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    [v4 timeIntervalSinceDate:a1[5]];
    int v7 = 138543618;
    uint64_t v8 = v3;
    __int16 v9 = 2048;
    uint64_t v10 = v5;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRMediaSuggestionRequest] Request %{public}@ finished in %lf seconds.", (uint8_t *)&v7, 0x16u);
  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

BOOL __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_93(uint64_t a1, void *a2)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x199718E70]();
  uint64_t v5 = [v3 eventBody];
  int v6 = [v5 interaction];

  id v56 = 0;
  int v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:getINInteractionClass_0[0]() fromData:v6 error:&v56];
  id v8 = v56;
  if (v8)
  {
    int v9 = 1;
    goto LABEL_28;
  }
  uint64_t v10 = [v7 intent];
  getINPlayMediaIntentClass[0]();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    v12 = *(void **)(a1 + 32);
    v48 = [v11 mediaContainer];
    v13 = [(MRMediaSuggestion *)v48 identifier];
    if ([v12 containsObject:v13])
    {
    }
    else
    {
      uint64_t v14 = *(void *)(a1 + 40);
      [v3 eventBody];
      v45 = v4;
      v15 = v46 = v11;
      v16 = [v15 bundleID];
      LODWORD(v14) = -[MRMediaSuggestionRequest _intentIsValidSuggestion:sourceBundleID:](v14, v46, v16);

      uint64_t v4 = v45;
      id v11 = v46;

      if (!v14)
      {
LABEL_26:

        int v9 = 0;
        goto LABEL_27;
      }
      id v44 = v10;
      v17 = [[MRMediaSuggestion alloc] initWithIntent:v46];
      v18 = [v3 eventBody];
      id v19 = [v18 bundleID];
      v48 = v17;
      -[MRMediaSuggestion setBundleID:]((uint64_t)v17, v19);

      if ([*(id *)(a1 + 40) includeArtwork])
      {
        uint64_t v20 = [v46 mediaContainer];
        uint64_t v21 = [v20 artwork];

        if (v21)
        {
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
          uint64_t v22 = *(void *)(a1 + 40);
          v53[0] = MEMORY[0x1E4F143A8];
          v53[1] = 3221225472;
          v53[2] = __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_2_96;
          v53[3] = &unk_1E57D22A0;
          v54 = v17;
          id v55 = *(id *)(a1 + 48);
          -[MRMediaSuggestionRequest _artworkForIntent:completion:](v22, v46, v53);
        }
      }
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v47 = *(id *)(a1 + 56);
      uint64_t v23 = [v47 countByEnumeratingWithState:&v49 objects:v57 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        unint64_t v41 = v7;
        v42 = v6;
        id v43 = v3;
        uint64_t v25 = *(void *)v50;
        BOOL v26 = v47;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v50 != v25) {
              objc_enumerationMutation(v26);
            }
            uint64_t v28 = *(void *)(*((void *)&v49 + 1) + 8 * i);
            v29 = [*(id *)(a1 + 64) objectForKeyedSubscript:v28];
            id v30 = [(MRMediaSuggestion *)v17 bundleID];
            if ([v29 containsObject:v30])
            {
            }
            else
            {
              v31 = [*(id *)(a1 + 72) objectForKeyedSubscript:v28];
              unint64_t v32 = [v31 count];
              unint64_t v33 = [*(id *)(a1 + 40) maxResults];

              BOOL v34 = v32 >= v33;
              BOOL v26 = v47;
              v17 = v48;
              if (!v34)
              {
                v35 = *(void **)(a1 + 32);
                v36 = [v46 mediaContainer];
                dispatch_group_t v37 = [v36 identifier];
                [v35 addObject:v37];

                v38 = [*(id *)(a1 + 72) objectForKeyedSubscript:v28];
                [v38 addObject:v48];

                ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
              }
            }
          }
          uint64_t v24 = [v26 countByEnumeratingWithState:&v49 objects:v57 count:16];
        }
        while (v24);
        int v6 = v42;
        id v3 = v43;
        uint64_t v10 = v44;
        uint64_t v4 = v45;
        id v8 = 0;
        int v7 = v41;
      }
      else
      {
        uint64_t v4 = v45;
      }
      id v11 = v46;
    }
    goto LABEL_26;
  }
  int v9 = 1;
LABEL_27:

LABEL_28:
  if (v9) {
    BOOL v39 = 1;
  }
  else {
    BOOL v39 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) < *(void *)(a1 + 88);
  }

  return v39;
}

- (uint64_t)_intentIsValidSuggestion:(void *)a3 sourceBundleID:
{
  id v5 = a2;
  id v6 = a3;
  if (a1
    && ([v5 mediaContainer],
        int v7 = objc_claimAutoreleasedReturnValue(),
        [v7 identifier],
        id v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 length],
        v8,
        v7,
        v9))
  {
    uint64_t v10 = [v5 mediaContainer];
    unint64_t v11 = [v10 type];

    uint64_t v12 = 0;
    if (v11 <= 0x13 && ((1 << v11) & 0xF87FE) != 0)
    {
      if (-[MRMediaSuggestionRequest _bundleIdentifierIsSystemMediaApplication:](a1, v6))
      {
        uint64_t v12 = 1;
      }
      else
      {
        id v20 = 0;
        v13 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v6 allowPlaceholder:0 error:&v20];
        id v14 = v20;
        uint64_t v12 = 0;
        if (v14 || !v13)
        {
          v15 = v13;
          v13 = v14;
        }
        else
        {
          v15 = [(objc_class *)getINSchemaClass() schemaWithBundleRecord:v13 fallbackToSystemSchema:0];
          if (v15)
          {
            v16 = [v5 _validParameterCombinationsWithSchema:v15];
            v17 = [v16 allKeys];
            v18 = [MEMORY[0x1E4F1CAD0] setWithObject:@"mediaContainer"];
            uint64_t v12 = [v17 containsObject:v18];
          }
          else
          {
            uint64_t v12 = 0;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

void __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_2_96(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = _MRLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_2_96_cold_1(a1, (uint64_t)v5, v6);
    }
  }
  else
  {
    -[MRMediaSuggestion setArtwork:](*(void *)(a1 + 32), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_artworkForIntent:(void *)a3 completion:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    int v7 = [v5 mediaContainer];
    id v8 = [v7 artwork];
    int v9 = [v8 _requiresRetrieval];

    uint64_t v10 = [v5 mediaContainer];
    unint64_t v11 = [v10 artwork];
    uint64_t v12 = v11;
    if (v9)
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __57__MRMediaSuggestionRequest__artworkForIntent_completion___block_invoke;
      v27[3] = &unk_1E57D2B30;
      id v28 = v6;
      [v12 _retrieveImageDataWithReply:v27];
    }
    else
    {
      v13 = [v11 _imageData];

      if (v13)
      {
        BOOL v26 = [MRArtwork alloc];
        id v14 = [v5 mediaContainer];
        v15 = [v14 artwork];
        v16 = [v15 _imageData];
        v17 = [v5 mediaContainer];
        v18 = [v17 artwork];
        [v18 _imageSize];
        uint64_t v20 = (uint64_t)v19;
        uint64_t v21 = [v5 mediaContainer];
        uint64_t v22 = [v21 artwork];
        [v22 _imageSize];
        uint64_t v24 = [(MRArtwork *)v26 initWithImageData:v16 height:v20 width:(uint64_t)v23];

        (*((void (**)(id, MRArtwork *, void))v6 + 2))(v6, v24, 0);
      }
      else
      {
        uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:1 description:@"Intent artwork does not require retrieval but has no data."];
        (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v25);
      }
    }
  }
}

- (uint64_t)_bundleIdentifierIsSystemMediaApplication:(uint64_t)IsSystemPodcastApplication
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (IsSystemPodcastApplication)
  {
    if (MRMediaRemoteApplicationIsSystemMediaApplication((uint64_t)v3)) {
      IsSystemPodcastApplication = 1;
    }
    else {
      IsSystemPodcastApplication = MRMediaRemoteApplicationIsSystemPodcastApplication((uint64_t)v4);
    }
  }

  return IsSystemPodcastApplication;
}

void __57__MRMediaSuggestionRequest__artworkForIntent_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a3;
  if (v13)
  {
    id v5 = 0;
  }
  else
  {
    id v6 = a2;
    int v7 = [MRArtwork alloc];
    id v8 = [v6 _imageData];
    [v6 _imageSize];
    uint64_t v10 = (uint64_t)v9;
    [v6 _imageSize];
    double v12 = v11;

    id v5 = [(MRArtwork *)v7 initWithImageData:v8 height:v10 width:(uint64_t)v12];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)maxResults
{
  return self->_maxResults;
}

- (void)setMaxResults:(unint64_t)a3
{
  self->_maxResults = a3;
}

- (BOOL)includeArtwork
{
  return self->_includeArtwork;
}

- (void)setIncludeArtwork:(BOOL)a3
{
  self->_includeArtwork = a3;
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (BOOL)useDirectAccess
{
  return self->_useDirectAccess;
}

- (void)setUseDirectAccess:(BOOL)a3
{
  self->_useDirectAccess = a3;
}

- (void).cxx_destruct
{
}

void __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_2_96_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_194F3C000, log, OS_LOG_TYPE_ERROR, "[MRMediaSuggestionRequest] %@ failed to retrieve artwork with error %@", (uint8_t *)&v4, 0x16u);
}

@end