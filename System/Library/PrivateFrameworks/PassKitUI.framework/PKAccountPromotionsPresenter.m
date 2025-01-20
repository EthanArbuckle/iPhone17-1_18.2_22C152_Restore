@interface PKAccountPromotionsPresenter
- (PKAccountPromotionsPresenter)initWithRemoteImagePreparer:(id)a3 delegate:(id)a4;
- (void)configureCell:(id)a3 withPromotion:(id)a4;
- (void)dispatchActionForLink:(id)a3 linkedApplication:(id)a4 promotion:(id)a5;
@end

@implementation PKAccountPromotionsPresenter

- (PKAccountPromotionsPresenter)initWithRemoteImagePreparer:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountPromotionsPresenter;
  v9 = [(PKAccountPromotionsPresenter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_remoteImagePreparer, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)configureCell:(id)a3 withPromotion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  id v20 = v7;
  if (v6 && v7)
  {
    SEL v9 = NSSelectorFromString(&cfstr_Configurewithp.isa);
    v10 = [(id)objc_opt_class() instanceMethodSignatureForSelector:v9];
    v11 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v10];
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__PKAccountPromotionsPresenter_configureCell_withPromotion___block_invoke;
    aBlock[3] = &unk_1E59DACA0;
    objc_copyWeak(&v17, &location);
    id v16 = v8;
    id v18 = _Block_copy(aBlock);
    [v11 setSelector:v9];
    [v11 setArgument:&v20 atIndex:2];
    [v11 setArgument:&self->_remoteImagePreparer atIndex:3];
    [v11 setArgument:&v18 atIndex:4];
    [v11 invokeWithTarget:v6];
    char v14 = 0;
    [v11 getReturnValue:&v14];
    if (!v14)
    {
      objc_super v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v20 programIdentifier];
        *(_DWORD *)buf = 138412290;
        v22 = v13;
        _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Encountered error configuring account promotion view. Suppressing the view for identifier: %@", buf, 0xCu);
      }
    }
    [v6 setNeedsUpdateConfiguration];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

    id v8 = v20;
  }
}

void __60__PKAccountPromotionsPresenter_configureCell_withPromotion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained dispatchActionForLink:v7 linkedApplication:v6 promotion:*(void *)(a1 + 32)];
}

- (void)dispatchActionForLink:(id)a3 linkedApplication:(id)a4 promotion:(id)a5
{
  v80[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    objc_super v12 = [v8 name];
    v13 = [v8 url];
    id v14 = (id)*MEMORY[0x1E4F85BB0];
    id v15 = v12;
    id v16 = v15;
    if (v15 == v14)
    {
      int v17 = 1;
    }
    else
    {
      if (!v15 || !v14)
      {

        goto LABEL_13;
      }
      int v17 = [v15 isEqualToString:v14];
    }

    if (v9 && v17)
    {
      int v18 = [v9 isInstalled];
      v19 = (id *)MEMORY[0x1E4F866E0];
      if (!v18) {
        v19 = (id *)MEMORY[0x1E4F86508];
      }
      id v20 = *v19;
      uint64_t v21 = *MEMORY[0x1E4F86380];
      uint64_t v22 = *MEMORY[0x1E4F86120];
      v79[0] = *MEMORY[0x1E4F86308];
      v79[1] = v22;
      v80[0] = v21;
      v80[1] = v20;
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:2];
      [WeakRetained reportEventIfNecessary:v23];

      [WeakRetained openLinkedApplication:v9];
      goto LABEL_79;
    }
LABEL_13:
    v24 = (void *)*MEMORY[0x1E4F85BB8];
    id v25 = v16;
    id v26 = v24;
    if (v25 == v26)
    {
    }
    else
    {
      v27 = v26;
      if (!v25 || !v26)
      {

        goto LABEL_25;
      }
      int v28 = [v25 isEqualToString:v26];

      if (!v28)
      {
LABEL_25:
        id v37 = v25;
        id v38 = v14;
        if (v16 == v14)
        {
          v41 = (id *)MEMORY[0x1E4F86508];
        }
        else
        {
          v39 = v38;
          if (v25 && v38)
          {
            char v40 = [v37 isEqualToString:v38];

            if (v40)
            {
              v41 = (id *)MEMORY[0x1E4F86508];
              goto LABEL_47;
            }
          }
          else
          {
          }
          v47 = (void *)*MEMORY[0x1E4F85BA8];
          id v48 = v37;
          id v49 = v47;
          if (v48 != v49)
          {
            v50 = v49;
            if (v25 && v49)
            {
              char v51 = [v48 isEqualToString:v49];

              if (v51)
              {
                v41 = (id *)MEMORY[0x1E4F866F8];
                goto LABEL_47;
              }
            }
            else
            {
            }
            id v20 = 0;
LABEL_57:
            uint64_t v61 = 0;
LABEL_78:
            [WeakRetained openURL:v13 sensitive:0 preferInApp:v61];
LABEL_79:

            goto LABEL_80;
          }
          v41 = (id *)MEMORY[0x1E4F866F8];
        }

LABEL_47:
        id v52 = *v41;
        id v20 = v52;
        if (v52)
        {
          uint64_t v53 = *MEMORY[0x1E4F86380];
          uint64_t v54 = *MEMORY[0x1E4F86120];
          v77[0] = *MEMORY[0x1E4F86308];
          v77[1] = v54;
          v78[0] = v53;
          v78[1] = v52;
          v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:2];
          [WeakRetained reportEventIfNecessary:v55];
        }
        goto LABEL_57;
      }
    }
    v29 = [v10 layout];
    v30 = [v29 templateIdentifier];

    v31 = (void *)*MEMORY[0x1E4F85BF0];
    id v32 = v30;
    id v33 = v31;
    if (v32 == v33)
    {
      v36 = (id *)MEMORY[0x1E4F860C0];
    }
    else
    {
      v34 = v33;
      if (v32 && v33)
      {
        char v35 = [v32 isEqualToString:v33];

        if (v35)
        {
          v36 = (id *)MEMORY[0x1E4F860C0];
          goto LABEL_74;
        }
      }
      else
      {
      }
      v42 = (void *)*MEMORY[0x1E4F85BD0];
      id v43 = v32;
      id v44 = v42;
      if (v43 == v44)
      {
        v36 = (id *)MEMORY[0x1E4F860A8];
      }
      else
      {
        v45 = v44;
        if (v32 && v44)
        {
          char v46 = [v43 isEqualToString:v44];

          if (v46)
          {
            v36 = (id *)MEMORY[0x1E4F860A8];
            goto LABEL_74;
          }
        }
        else
        {
        }
        v56 = (void *)*MEMORY[0x1E4F85BE8];
        id v57 = v43;
        id v58 = v56;
        if (v57 == v58)
        {
          v36 = (id *)MEMORY[0x1E4F860C8];
        }
        else
        {
          v59 = v58;
          if (v32 && v58)
          {
            char v60 = [v57 isEqualToString:v58];

            if (v60)
            {
              v36 = (id *)MEMORY[0x1E4F860C8];
              goto LABEL_74;
            }
          }
          else
          {
          }
          v62 = (void *)*MEMORY[0x1E4F85BE0];
          id v63 = v57;
          id v64 = v62;
          if (v63 == v64)
          {
            v36 = (id *)MEMORY[0x1E4F860B8];
          }
          else
          {
            v65 = v64;
            if (v32 && v64)
            {
              char v66 = [v63 isEqualToString:v64];

              if (v66)
              {
                v36 = (id *)MEMORY[0x1E4F860B8];
                goto LABEL_74;
              }
            }
            else
            {
            }
            v67 = (void *)*MEMORY[0x1E4F85BD8];
            id v68 = v63;
            id v69 = v67;
            if (v68 != v69)
            {
              v70 = v69;
              if (!v32 || !v69)
              {

                goto LABEL_76;
              }
              char v71 = [v68 isEqualToString:v69];

              if ((v71 & 1) == 0)
              {
LABEL_76:

                goto LABEL_77;
              }
              v36 = (id *)MEMORY[0x1E4F860B0];
LABEL_74:
              id v68 = *v36;

              if (!v68)
              {
LABEL_77:
                id v20 = 0;
                uint64_t v61 = 1;
                goto LABEL_78;
              }
              uint64_t v72 = *MEMORY[0x1E4F86468];
              uint64_t v73 = *MEMORY[0x1E4F86BB0];
              v75[0] = *MEMORY[0x1E4F86308];
              v75[1] = v73;
              v76[0] = v72;
              v76[1] = v68;
              v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:2];
              [WeakRetained reportEventIfNecessary:v74];

              goto LABEL_76;
            }
            v36 = (id *)MEMORY[0x1E4F860B0];
          }
        }
      }
    }

    goto LABEL_74;
  }
LABEL_80:
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_remoteImagePreparer, 0);
}

@end