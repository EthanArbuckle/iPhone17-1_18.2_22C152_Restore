@interface PKBannerPresentationManager
+ (id)_managerForDestination:(int64_t)a3 withProvider:(id)a4;
- (PKBannerPresentationManager)init;
- (id)_createPresentableWithConfiguration:(id)a3;
- (id)_currentRequest;
- (id)_source;
- (id)provider;
- (void)_displayBanner;
- (void)bannerSourceDidInvalidate:(id)a3;
@end

@implementation PKBannerPresentationManager

- (id)_source
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F4F5B8] bannerSourceForDestination:*(void *)(a1 + 8) forRequesterIdentifier:*(void *)(a1 + 24)];
    v4 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v3;

    [*(id *)(a1 + 32) setDelegate:a1];
    v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 8);
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 134218240;
      uint64_t v10 = v6;
      __int16 v11 = 2048;
      uint64_t v12 = v7;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKBannerPresentationManager (%lld): source created %p.", (uint8_t *)&v9, 0x16u);
    }

    v2 = *(void **)(a1 + 32);
  }

  return v2;
}

+ (id)_managerForDestination:(int64_t)a3 withProvider:(id)a4
{
  id v5 = a4;
  if (a3 || !v5)
  {
    __break(1u);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__PKBannerPresentationManager__managerForDestination_withProvider___block_invoke;
    block[3] = &unk_1E59CB460;
    uint64_t v19 = 0;
    a3 = (int64_t)v5;
    id v18 = (id)a3;
    if (_MergedGlobals_689 == -1) {
      goto LABEL_4;
    }
  }
  dispatch_once(&_MergedGlobals_689, block);
LABEL_4:
  if (!qword_1EB545CF8)
  {
    uint64_t v7 = 0;
    goto LABEL_8;
  }
  uint64_t v6 = [(id)qword_1EB545CF8 provider];

  if (v6 == (void *)a3)
  {
    uint64_t v7 = (void *)qword_1EB545CF8;
LABEL_8:
    id v8 = v7;

    return v8;
  }
  uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v11 = *MEMORY[0x1E4F1C3B8];
  uint64_t v12 = (objc_class *)objc_opt_class();
  uint64_t v13 = NSStringFromClass(v12);
  v14 = [(id)qword_1EB545CF8 provider];
  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  [v10 raise:v11, @"PKBannerPresentationManager: cannot register provider %@ for destination %ld - already registered provider %@ previously.", v13, 0, v16 format];

  __break(1u);
  return result;
}

void __67__PKBannerPresentationManager__managerForDestination_withProvider___block_invoke(uint64_t a1)
{
  v2 = [PKBannerPresentationManager alloc];
  uint64_t v3 = *(void **)(a1 + 32);
  int64_t v4 = *(void *)(a1 + 40);
  id v5 = v3;
  if (v2)
  {
    v12.receiver = v2;
    v12.super_class = (Class)PKBannerPresentationManager;
    uint64_t v6 = (PKBannerPresentationManager *)objc_msgSendSuper2(&v12, sel_init);
    v2 = v6;
    if (v6)
    {
      v6->_destination = v4;
      objc_storeStrong((id *)&v6->_provider, v3);
      uint64_t v7 = [MEMORY[0x1E4F28B50] mainBundle];
      id v8 = [v7 bundleIdentifier];
      uint64_t v9 = [v8 copy];
      requesterIdentifier = v2->_requesterIdentifier;
      v2->_requesterIdentifier = (NSString *)v9;
    }
  }

  uint64_t v11 = (void *)qword_1EB545CF8;
  qword_1EB545CF8 = (uint64_t)v2;
}

- (PKBannerPresentationManager)init
{
  return 0;
}

- (id)_createPresentableWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [PKBannerPresentable alloc];
  uint64_t v6 = self;
  id result = v4;
  id v8 = result;
  if (!v5) {
    goto LABEL_5;
  }
  if (v6)
  {
    v20.receiver = v5;
    v20.super_class = (Class)PKBannerPresentable;
    uint64_t v9 = [(PKBannerPresentationManager *)&v20 init];
    id v5 = (PKBannerPresentable *)v9;
    if (v9)
    {
      v9->_destination = (int64_t)v6;
      uint64_t v10 = [v8 factory];
      id factory = v5->_factory;
      v5->_id factory = (id)v10;

      uint64_t v12 = [v8 didStartHandler];
      id didStartHandler = v5->_didStartHandler;
      v5->_id didStartHandler = (id)v12;

      uint64_t v14 = [v8 didFinishHandler];
      id didFinishHandler = v5->_didFinishHandler;
      v5->_id didFinishHandler = (id)v14;

      v16 = [MEMORY[0x1E4F29128] UUID];
      v17 = [v16 UUIDString];
      uint64_t v18 = [v17 copy];
      requestIdentifier = v5->_requestIdentifier;
      v5->_requestIdentifier = (NSString *)v18;
    }
LABEL_5:

    return v5;
  }
  __break(1u);
  return result;
}

- (void)_displayBanner
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = a1[5];
    uint64_t v3 = (void *)a1[2];
    if (v2)
    {
      if (![v3 shouldRevokeCurrentRequestForManager:a1]) {
        return;
      }
      uint64_t v4 = a1[5];
      if (v4) {
        id v5 = *(id *)(v4 + 8);
      }
      else {
        id v5 = 0;
      }
      uint64_t v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = a1[1];
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v7;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v5;
        _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKBannerPresentationManager (%lld): revoking current presentable %p as requested by provider.", buf, 0x16u);
      }

      [v5 revoke];
      goto LABEL_18;
    }
    uint64_t v8 = [v3 nextRequestForManager:a1];
    uint64_t v9 = (void *)a1[5];
    a1[5] = v8;

    uint64_t v10 = a1[5];
    if (!v10) {
      return;
    }
    id v11 = *(id *)(v10 + 8);
    if (!v11 || (id v5 = v11, *((void **)v11 + 1) != a1)) {
      __break(1u);
    }
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v56 = __45__PKBannerPresentationManager__displayBanner__block_invoke;
    v57 = &unk_1E59DD920;
    v58 = a1;
    uint64_t v12 = v55;
    if (*((unsigned char *)v5 + 24) || *((unsigned char *)v5 + 25))
    {
      uint64_t v13 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v5;
        _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "PKBannerPresentable (%p): error - reused presentable.", buf, 0xCu);
      }

      ((void (*)(void *, id, void))v56)(v12, v5, 0);
      goto LABEL_17;
    }
    *((unsigned char *)v5 + 24) = 1;
    uint64_t v14 = _Block_copy(*((const void **)v5 + 7));
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __43__PKBannerPresentable__postWithCompletion___block_invoke;
    v68 = &unk_1E59DD8F8;
    id v15 = v14;
    id v69 = v15;
    v70 = v12;
    v16 = _Block_copy(buf);
    v17 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v16;

    id v18 = -[PKBannerPresentationManager _source](*((void *)v5 + 1));
    uint64_t v19 = (const void *)*((void *)v5 + 4);
    if (!v19)
    {
      uint64_t v20 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v63 = 134217984;
        id v64 = v5;
        _os_log_impl(&dword_19F450000, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "PKBannerPresentable (%p): error - missing view controller factory.", v63, 0xCu);
      }
      v22 = 0;
LABEL_33:

      v30 = (void *)*((void *)v5 + 5);
      if (v30)
      {
        [v22 presentationSize];
        double v32 = v31;
        double v34 = v33;
        [v22 containerSize];
        objc_msgSend(v30, "preferredContentSizeWithPresentationSize:containerSize:", v32, v34, v35, v36);
        double v38 = v37;
        double v40 = v39;
        [*((id *)v5 + 5) preferredContentSize];
        double v42 = v41;
        double v44 = v43;
        v45 = PKLogFacilityTypeGetObject();
        BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG);
        if (v42 == v38 && v44 == v40)
        {
          if (v46)
          {
            v73.width = v42;
            v73.height = v44;
            v53 = NSStringFromCGSize(v73);
            *(_DWORD *)v63 = 134218242;
            id v64 = v5;
            __int16 v65 = 2112;
            id v66 = v53;
            _os_log_debug_impl(&dword_19F450000, v45, OS_LOG_TYPE_DEBUG, "PKBannerPresentable (%p): using existing preferred content size - %@.", v63, 0x16u);
          }
        }
        else
        {
          if (v46)
          {
            v74.width = v38;
            v74.height = v40;
            v54 = NSStringFromCGSize(v74);
            *(_DWORD *)v63 = 134218242;
            id v64 = v5;
            __int16 v65 = 2112;
            id v66 = v54;
            _os_log_debug_impl(&dword_19F450000, v45, OS_LOG_TYPE_DEBUG, "PKBannerPresentable (%p): overriding preferred content size - %@.", v63, 0x16u);
          }
          objc_msgSend(*((id *)v5 + 5), "setPreferredContentSize:", v38, v40);
        }
        [*((id *)v5 + 5) setPresentable:v5];
        if (*((unsigned char *)v5 + 25))
        {
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v63 = 134217984;
            id v64 = v5;
            _os_log_impl(&dword_19F450000, v45, OS_LOG_TYPE_DEFAULT, "PKBannerPresentable (%p): revoked before posting.", v63, 0xCu);
          }

          goto LABEL_63;
        }
        if (v38 > 0.0 && v40 > 0.0 || (SBSIsSystemApertureAvailable() & 1) != 0)
        {
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            v47 = (void *)*((void *)v5 + 5);
            *(_DWORD *)v63 = 134218240;
            id v64 = v5;
            __int16 v65 = 2048;
            id v66 = v47;
            _os_log_impl(&dword_19F450000, v45, OS_LOG_TYPE_DEFAULT, "PKBannerPresentable (%p): posting with %p...", v63, 0x16u);
          }

          uint64_t v61 = *MEMORY[0x1E4FA7FB8];
          uint64_t v62 = MEMORY[0x1E4F1CC38];
          v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
          id v59 = 0;
          int v49 = [v18 postPresentable:v5 options:1 userInfo:v48 error:&v59];
          id v50 = v59;

          BOOL v51 = os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
          if (v49)
          {
            if (v51)
            {
              *(_DWORD *)v63 = 134217984;
              id v64 = v5;
              _os_log_impl(&dword_19F450000, v45, OS_LOG_TYPE_DEFAULT, "PKBannerPresentable (%p): posted.", v63, 0xCu);
            }

            *((unsigned char *)v5 + 26) = 1;
          }
          else
          {
            if (v51)
            {
              *(_DWORD *)v63 = 134218242;
              id v64 = v5;
              __int16 v65 = 2112;
              id v66 = v50;
              _os_log_impl(&dword_19F450000, v45, OS_LOG_TYPE_DEFAULT, "PKBannerPresentable (%p): failed to post - %@.", v63, 0x16u);
            }

            -[PKBannerPresentable _revoke]((uint64_t)v5);
          }

          goto LABEL_63;
        }
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          v72.width = v38;
          v72.height = v40;
          v52 = NSStringFromCGSize(v72);
          *(_DWORD *)v63 = 134218242;
          id v64 = v5;
          __int16 v65 = 2112;
          id v66 = v52;
          _os_log_impl(&dword_19F450000, v45, OS_LOG_TYPE_DEFAULT, "PKBannerPresentable (%p): invalid size %@ requested.", v63, 0x16u);
        }
      }
      -[PKBannerPresentable _revoke]((uint64_t)v5);
LABEL_63:

LABEL_17:
LABEL_18:

      return;
    }
    uint64_t v20 = (uint64_t)_Block_copy(v19);
    v21 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = 0;

    id v60 = 0;
    v22 = [v18 layoutDescriptionWithError:&v60];
    id v23 = v60;
    if (v22)
    {
      uint64_t v24 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v20 + 16))(v20, [v18 destination], v22);
      v25 = (void *)*((void *)v5 + 5);
      *((void *)v5 + 5) = v24;

      if (*((void *)v5 + 5))
      {
LABEL_32:

        goto LABEL_33;
      }
      v26 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v63 = 134217984;
        id v64 = v5;
        v27 = "PKBannerPresentable (%p): error - missing view controller.";
        v28 = v26;
        uint32_t v29 = 12;
LABEL_30:
        _os_log_impl(&dword_19F450000, v28, OS_LOG_TYPE_DEFAULT, v27, v63, v29);
      }
    }
    else
    {
      v26 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v63 = 134218242;
        id v64 = v5;
        __int16 v65 = 2112;
        id v66 = v23;
        v27 = "PKBannerPresentable (%p): error - missing layout description - %@.";
        v28 = v26;
        uint32_t v29 = 22;
        goto LABEL_30;
      }
    }

    goto LABEL_32;
  }
}

- (id)_currentRequest
{
  return self->_request;
}

uint64_t __45__PKBannerPresentationManager__displayBanner__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(a1 + 32);

  return -[PKBannerPresentationManager _displayBanner](v4);
}

- (void)bannerSourceDidInvalidate:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int64_t destination = self->_destination;
    *(_DWORD *)buf = 134217984;
    int64_t v8 = destination;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "PKBannerPresentationManager (%lld): source invalidated.", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PKBannerPresentationManager_bannerSourceDidInvalidate___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __57__PKBannerPresentationManager_bannerSourceDidInvalidate___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 40);
  if (v4)
  {
    uint64_t v5 = *(void *)(v4 + 8);
    -[PKBannerPresentable _revoke](v5);
  }
}

- (id)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_requesterIdentifier, 0);

  objc_storeStrong((id *)&self->_provider, 0);
}

@end