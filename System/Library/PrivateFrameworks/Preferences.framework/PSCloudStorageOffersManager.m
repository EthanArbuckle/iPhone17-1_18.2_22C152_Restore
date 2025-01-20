@interface PSCloudStorageOffersManager
- (BOOL)shouldOfferDeviceOffers;
- (BOOL)shouldOfferFamilySharePlansOnly;
- (BOOL)skipCompletionAlert;
- (BOOL)skipRetryWithoutToken;
- (BOOL)supportsModernAlerts;
- (PSCloudStorageOffersManagerDelegate)delegate;
- (unint64_t)requiredStorageThreshold;
- (void)_setupFlowWithNavigationController:(id)a3 modally:(BOOL)a4;
- (void)beginFlowWithNavigationController:(id)a3 modally:(BOOL)a4;
- (void)beginFlowWithNavigationController:(id)a3 purchaseToken:(id)a4 buyParameters:(id)a5 requestHeaders:(id)a6 modally:(BOOL)a7;
- (void)cancelLoad;
- (void)commerceDelegate:(id)a3 didCompleteWithError:(id)a4;
- (void)commerceDelegate:(id)a3 loadDidFailWithError:(id)a4;
- (void)commerceDelegate:(id)a3 willPresentObjectModel:(id)a4 page:(id)a5;
- (void)commerceDelegateDidCancel:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setRequiredStorageThreshold:(unint64_t)a3;
- (void)setShouldOfferDeviceOffers:(BOOL)a3;
- (void)setShouldOfferFamilySharePlansOnly:(BOOL)a3;
- (void)setSkipCompletionAlert:(BOOL)a3;
- (void)setSkipRetryWithoutToken:(BOOL)a3;
- (void)setSupportsModernAlerts:(BOOL)a3;
@end

@implementation PSCloudStorageOffersManager

- (void)_setupFlowWithNavigationController:(id)a3 modally:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(PSCloudStorageOffersManager *)self cancelLoad];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v7 = (void *)getCommerceRemoteUIDelegateClass_softClass;
  uint64_t v15 = getCommerceRemoteUIDelegateClass_softClass;
  if (!getCommerceRemoteUIDelegateClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getCommerceRemoteUIDelegateClass_block_invoke;
    v11[3] = &unk_1E5C5D4D8;
    v11[4] = &v12;
    __getCommerceRemoteUIDelegateClass_block_invoke((uint64_t)v11);
    v7 = (void *)v13[3];
  }
  v8 = v7;
  _Block_object_dispose(&v12, 8);
  v9 = (CommerceRemoteUIDelegate *)[[v8 alloc] initWithNavigationController:v6 needsModalPresentation:v4];
  commerceDelegate = self->_commerceDelegate;
  self->_commerceDelegate = v9;

  [(CommerceRemoteUIDelegate *)self->_commerceDelegate setDelegate:self];
  [(CommerceRemoteUIDelegate *)self->_commerceDelegate setShouldOfferFamilySharePlansOnly:[(PSCloudStorageOffersManager *)self shouldOfferFamilySharePlansOnly]];
  [(CommerceRemoteUIDelegate *)self->_commerceDelegate setShouldOfferDeviceOffers:[(PSCloudStorageOffersManager *)self shouldOfferDeviceOffers]];
  [(CommerceRemoteUIDelegate *)self->_commerceDelegate setSkipRetryWithoutToken:[(PSCloudStorageOffersManager *)self skipRetryWithoutToken]];
  [(CommerceRemoteUIDelegate *)self->_commerceDelegate setSkipCompletionAlert:[(PSCloudStorageOffersManager *)self skipCompletionAlert]];
  [(CommerceRemoteUIDelegate *)self->_commerceDelegate setSupportsModernAlerts:[(PSCloudStorageOffersManager *)self supportsModernAlerts]];
}

- (void)beginFlowWithNavigationController:(id)a3 modally:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(PSCloudStorageOffersManager *)self _setupFlowWithNavigationController:v6 modally:v4];
  commerceDelegate = self->_commerceDelegate;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  v8 = (void *)getCommerceOffersSymbolLoc_ptr;
  uint64_t v14 = getCommerceOffersSymbolLoc_ptr;
  if (!getCommerceOffersSymbolLoc_ptr)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getCommerceOffersSymbolLoc_block_invoke;
    v10[3] = &unk_1E5C5D4D8;
    v10[4] = &v11;
    __getCommerceOffersSymbolLoc_block_invoke((uint64_t)v10);
    v8 = (void *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v8)
  {
    v9 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v11, 8);
    _Unwind_Resume(v9);
  }
  [(CommerceRemoteUIDelegate *)commerceDelegate loadURLforKey:*v8];
}

- (void)beginFlowWithNavigationController:(id)a3 purchaseToken:(id)a4 buyParameters:(id)a5 requestHeaders:(id)a6 modally:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  [(PSCloudStorageOffersManager *)self _setupFlowWithNavigationController:a3 modally:v7];
  [(CommerceRemoteUIDelegate *)self->_commerceDelegate purchaseWithToken:v14 buyParameters:v13 requestHeaders:v12];
}

- (void)cancelLoad
{
  [(CommerceRemoteUIDelegate *)self->_commerceDelegate cancelRemoteUI];
  commerceDelegate = self->_commerceDelegate;
  self->_commerceDelegate = 0;
}

- (void)dealloc
{
  [(CommerceRemoteUIDelegate *)self->_commerceDelegate cancelRemoteUI];
  v3.receiver = self;
  v3.super_class = (Class)PSCloudStorageOffersManager;
  [(PSCloudStorageOffersManager *)&v3 dealloc];
}

- (void)commerceDelegate:(id)a3 willPresentObjectModel:(id)a4 page:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v39 = a5;
  if ([(PSCloudStorageOffersManager *)self requiredStorageThreshold])
  {
    v40 = self;
    id v33 = v9;
    id v34 = v8;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v10 = [v39 tableViewOM];
    uint64_t v11 = [v10 sections];

    id obj = v11;
    uint64_t v37 = [v11 countByEnumeratingWithState:&v45 objects:v50 count:16];
    id v12 = 0;
    if (v37)
    {
      uint64_t v36 = *(void *)v46;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v46 != v36) {
            objc_enumerationMutation(obj);
          }
          uint64_t v38 = v13;
          id v14 = *(void **)(*((void *)&v45 + 1) + 8 * v13);
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          uint64_t v15 = [v14 rows];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v49 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v42;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v42 != v18) {
                  objc_enumerationMutation(v15);
                }
                v20 = *(void **)(*((void *)&v41 + 1) + 8 * i);
                v21 = [v20 attributes];
                v22 = [v21 objectForKeyedSubscript:@"totalStorage"];

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && (unint64_t v23 = strtoull((const char *)[v22 UTF8String], 0, 0),
                      v23 < [(PSCloudStorageOffersManager *)v40 requiredStorageThreshold]))
                {
                  [v20 setEnabled:0];
                  if ([v20 isSelected])
                  {
                    v24 = [v20 attributes];
                    uint64_t v25 = [v24 objectForKeyedSubscript:@"radioGroup"];

                    [v20 setSelected:0];
                    id v12 = (void *)v25;
                  }
                }
                else
                {
                  v26 = [v20 attributes];
                  v27 = [v26 objectForKeyedSubscript:@"radioGroup"];
                  int v28 = [v27 isEqualToString:v12];

                  if (v28)
                  {
                    v29 = [v39 tableViewOM];
                    [v29 setSelectedRadioGroupRow:v20];

                    id v12 = 0;
                  }
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v41 objects:v49 count:16];
            }
            while (v17);
          }

          uint64_t v13 = v38 + 1;
        }
        while (v38 + 1 != v37);
        uint64_t v37 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v37);
    }

    id v9 = v33;
    id v8 = v34;
    self = v40;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v31 = objc_opt_respondsToSelector();

  if (v31)
  {
    id v32 = objc_loadWeakRetained((id *)&self->_delegate);
    [v32 manager:self willPresentViewController:v39];
  }
}

- (void)commerceDelegate:(id)a3 loadDidFailWithError:(id)a4
{
  id v8 = a4;
  NSLog(&cfstr_ErrorLoadingCo.isa, v8);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 manager:self loadDidFailWithError:v8];
  }
}

- (void)commerceDelegateDidCancel:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  id v7 = _PSLoggingFacility();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_DEFAULT, "calling delegate managerDidCancel:", buf, 2u);
    }

    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 managerDidCancel:self];
  }
  else if (v8)
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_DEFAULT, "client did not implement managerDidCancel: -- will not be notified", v9, 2u);
  }
}

- (void)commerceDelegate:(id)a3 didCompleteWithError:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  v10 = _PSLoggingFacility();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      int v13 = 138543362;
      id v14 = v7;
      _os_log_impl(&dword_1A6597000, v10, OS_LOG_TYPE_DEFAULT, "calling delegate manager:didCompleteWithError:%{public}@", (uint8_t *)&v13, 0xCu);
    }

    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    [v12 manager:self didCompleteWithError:v7];
  }
  else
  {
    if (v11)
    {
      int v13 = 138543362;
      id v14 = v7;
      _os_log_impl(&dword_1A6597000, v10, OS_LOG_TYPE_DEFAULT, "client did not implement manager:didCompleteWithError: (error:%{public}@)", (uint8_t *)&v13, 0xCu);
    }

    [(PSCloudStorageOffersManager *)self commerceDelegateDidCancel:v6];
  }
}

- (PSCloudStorageOffersManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PSCloudStorageOffersManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)requiredStorageThreshold
{
  return self->_requiredStorageThreshold;
}

- (void)setRequiredStorageThreshold:(unint64_t)a3
{
  self->_requiredStorageThreshold = a3;
}

- (BOOL)shouldOfferFamilySharePlansOnly
{
  return self->_shouldOfferFamilySharePlansOnly;
}

- (void)setShouldOfferFamilySharePlansOnly:(BOOL)a3
{
  self->_shouldOfferFamilySharePlansOnly = a3;
}

- (BOOL)shouldOfferDeviceOffers
{
  return self->_shouldOfferDeviceOffers;
}

- (void)setShouldOfferDeviceOffers:(BOOL)a3
{
  self->_shouldOfferDeviceOffers = a3;
}

- (BOOL)skipRetryWithoutToken
{
  return self->_skipRetryWithoutToken;
}

- (void)setSkipRetryWithoutToken:(BOOL)a3
{
  self->_skipRetryWithoutToken = a3;
}

- (BOOL)skipCompletionAlert
{
  return self->_skipCompletionAlert;
}

- (void)setSkipCompletionAlert:(BOOL)a3
{
  self->_skipCompletionAlert = a3;
}

- (BOOL)supportsModernAlerts
{
  return self->_supportsModernAlerts;
}

- (void)setSupportsModernAlerts:(BOOL)a3
{
  self->_supportsModernAlerts = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_commerceDelegate, 0);
}

@end