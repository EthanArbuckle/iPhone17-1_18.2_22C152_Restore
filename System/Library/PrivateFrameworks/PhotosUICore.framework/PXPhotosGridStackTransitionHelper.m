@interface PXPhotosGridStackTransitionHelper
- (uint64_t)prepareForTransitionFromEndpoint:(void *)a3 toEndpoint:(void *)a4 withPrimaryAssetReference:(void *)a5 dataSource:;
- (void)addTransitionAnimationsToAnimator:(void *)a3 inContainerView:;
- (void)addTransitionCompletionsToAnimator:(uint64_t)a1;
- (void)initWithStackItemsCount:(void *)a1;
- (void)setInitialTransitionStateInContainerView:(void *)a3 aboveView:;
@end

@implementation PXPhotosGridStackTransitionHelper

- (void).cxx_destruct
{
}

- (void)initWithStackItemsCount:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v18.receiver = a1;
  v18.super_class = (Class)PXPhotosGridStackTransitionHelper;
  v3 = objc_msgSendSuper2(&v18, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[2] = a2;
    v5 = [PXPhotosGridTransitionAssetMapping alloc];
    if (v5)
    {
      v19.receiver = v5;
      v19.super_class = (Class)PXPhotosGridTransitionAssetMapping;
      v6 = objc_msgSendSuper2(&v19, sel_init);
      if (v6)
      {
        uint64_t v7 = (2 * a2) | 1;
        uint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
        v9 = (void *)v6[1];
        v6[1] = v8;

        uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
        v11 = (void *)v6[2];
        v6[2] = v10;

        uint64_t v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
        v13 = (void *)v6[3];
        v6[3] = v12;

        uint64_t v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
        v15 = (void *)v6[4];
        v6[4] = v14;
      }
    }
    else
    {
      v6 = 0;
    }
    v16 = (void *)v4[1];
    v4[1] = v6;
  }
  return v4;
}

- (uint64_t)prepareForTransitionFromEndpoint:(void *)a3 toEndpoint:(void *)a4 withPrimaryAssetReference:(void *)a5 dataSource:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v43 = v12;
  if (a1)
  {
    v13 = [v12 assetReferenceForAssetReference:v11];
    long long v48 = 0u;
    long long v49 = 0u;
    [v11 indexPath];
    if (v13 && (void)v48 != *(void *)off_1E5DAAED8)
    {
      v42 = v13;
      id v39 = v11;
      id v15 = *(id *)(a1 + 8);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __118__PXPhotosGridStackTransitionHelper_prepareForTransitionFromEndpoint_toEndpoint_withPrimaryAssetReference_dataSource___block_invoke;
      aBlock[3] = &unk_1E5DB2920;
      id v41 = v9;
      id v45 = v9;
      id v40 = v10;
      id v46 = v10;
      uint64_t v14 = v15;
      v47 = v14;
      v16 = (void (**)(void *, void *))_Block_copy(aBlock);
      uint64_t v17 = [v43 numberOfItemsInSection:*((void *)&v48 + 1)];
      uint64_t v18 = [v43 identifier];
      uint64_t v19 = *(void *)(a1 + 16);
      if (v19 >= 1)
      {
        uint64_t v20 = v18;
        uint64_t v21 = -v19;
        do
        {
          uint64_t v22 = v49;
          if (v21 + (uint64_t)v49 >= 0)
          {
            *(void *)&long long buf = v20;
            *((void *)&buf + 1) = *((void *)&v48 + 1);
            uint64_t v55 = v21 + v49;
            uint64_t v56 = 0x7FFFFFFFFFFFFFFFLL;
            v23 = [v43 assetReferenceAtItemIndexPath:&buf];
            v16[2](v16, v23);

            uint64_t v22 = v49;
          }
          uint64_t v24 = v22 + v19;
          if (v24 < v17)
          {
            *(void *)&long long buf = v20;
            *((void *)&buf + 1) = *((void *)&v48 + 1);
            uint64_t v55 = v24;
            uint64_t v56 = 0x7FFFFFFFFFFFFFFFLL;
            v25 = [v43 assetReferenceAtItemIndexPath:&buf];
            v16[2](v16, v25);
          }
          ++v21;
        }
        while (v19-- > 1);
      }
      v13 = v42;
      v16[2](v16, v42);
      if (v14)
      {
        long long v53 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v50 = 0u;
        v27 = v14[2].isa;
        uint64_t v28 = [(objc_class *)v27 countByEnumeratingWithState:&v50 objects:&buf count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          v30 = 0;
          uint64_t v31 = *(void *)v51;
          do
          {
            for (uint64_t i = 0; i != v29; ++i)
            {
              if (*(void *)v51 != v31) {
                objc_enumerationMutation(v27);
              }
              v33 = *(void **)(*((void *)&v50 + 1) + 8 * i);
              v34 = objc_msgSend(v33, "placeholderViewFactory", v39);

              if (v34)
              {
                v35 = [v33 placeholderViewFactory];
                v36 = ((void (**)(void, void *))v35)[2](v35, v33);

                [(objc_class *)v14[4].isa addObject:v36];
                v30 = (objc_class *)((char *)v30 + 1);
              }
              else
              {
                Class isa = v14[4].isa;
                v36 = [MEMORY[0x1E4F1CA98] null];
                [(objc_class *)isa addObject:v36];
              }
            }
            uint64_t v29 = [(objc_class *)v27 countByEnumeratingWithState:&v50 objects:&buf count:16];
          }
          while (v29);
        }
        else
        {
          v30 = 0;
        }

        v14[5].Class isa = v30;
        a1 = v30 != 0;
        v13 = v42;
      }
      else
      {
        a1 = 0;
      }

      id v10 = v40;
      id v9 = v41;
      id v11 = v39;
    }
    else
    {
      uint64_t v14 = PLUIGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_ERROR, "Transition: asset reference %@ cannot be found in the provided dataSource", (uint8_t *)&buf, 0xCu);
      }
      a1 = 0;
    }
  }
  return a1;
}

void __118__PXPhotosGridStackTransitionHelper_prepareForTransitionFromEndpoint_toEndpoint_withPrimaryAssetReference_dataSource___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  v3 = [*(id *)(a1 + 32) regionOfInterestForTransitioningAssetReference:v11];
  v4 = [*(id *)(a1 + 40) regionOfInterestForTransitioningAssetReference:v11];
  v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      uint64_t v8 = *(void **)(v7 + 8);
      id v9 = v4;
      id v10 = v3;
      [v8 addObject:v11];
      [*(id *)(v7 + 16) addObject:v10];

      [*(id *)(v7 + 24) addObject:v9];
    }
  }
}

- (void)setInitialTransitionStateInContainerView:(void *)a3 aboveView:
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (a1)
  {
    uint64_t v8 = a1[1];
    if (v8 && *(void *)(v8 + 40))
    {
      if (v6) {
        goto LABEL_5;
      }
    }
    else
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:sel_setInitialTransitionStateInContainerView_aboveView_ object:a1 file:@"PXPhotosGridStackTransitionHelper.m" lineNumber:89 description:@"Helper must be successfully prepared"];

      if (v7)
      {
LABEL_5:
        id v9 = v7;
        id v10 = v5;
        do
        {
          id v11 = [v9 superview];

          if (v11 == v10) {
            break;
          }
          uint64_t v12 = [v9 superview];

          id v9 = (id)v12;
        }
        while (v12);

        goto LABEL_11;
      }
    }
    id v9 = 0;
LABEL_11:
    uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
    id v15 = (id *)a1[1];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __88__PXPhotosGridStackTransitionHelper_setInitialTransitionStateInContainerView_aboveView___block_invoke;
    v20[3] = &unk_1E5DB2948;
    id v21 = v5;
    id v22 = v9;
    id v16 = v14;
    id v23 = v16;
    id v17 = v9;
    -[PXPhotosGridTransitionAssetMapping enumerateTransitionAssetsUsingBlock:](v15, v20);
    uint64_t v18 = v23;
    a1 = v16;
  }
  return a1;
}

void __88__PXPhotosGridStackTransitionHelper_setInitialTransitionStateInContainerView_aboveView___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = a5;
  a2;
  [a3 rectInCoordinateSpace:v7];
  PXRectGetCenter();
}

- (void)addTransitionAnimationsToAnimator:(void *)a3 inContainerView:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = *(void *)(a1 + 8);
    if (!v7 || !*(void *)(v7 + 40))
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel_addTransitionAnimationsToAnimator_inContainerView_ object:a1 file:@"PXPhotosGridStackTransitionHelper.m" lineNumber:114 description:@"Helper must be successfully prepared"];
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __87__PXPhotosGridStackTransitionHelper_addTransitionAnimationsToAnimator_inContainerView___block_invoke;
    v9[3] = &unk_1E5DD32A8;
    v9[4] = a1;
    id v10 = v6;
    [v5 addAnimations:v9];
  }
}

void __87__PXPhotosGridStackTransitionHelper_addTransitionAnimationsToAnimator_inContainerView___block_invoke(uint64_t a1)
{
  v1 = *(id **)(*(void *)(a1 + 32) + 8);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __87__PXPhotosGridStackTransitionHelper_addTransitionAnimationsToAnimator_inContainerView___block_invoke_2;
  v2[3] = &unk_1E5DB2970;
  id v3 = *(id *)(a1 + 40);
  -[PXPhotosGridTransitionAssetMapping enumerateTransitionAssetsUsingBlock:](v1, v2);
}

void __87__PXPhotosGridStackTransitionHelper_addTransitionAnimationsToAnimator_inContainerView___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = a5;
  [v7 rectInCoordinateSpace:v8];
  memset(&v15, 0, sizeof(v15));
  id v10 = [v7 imageViewSpec];
  [v10 rotationAngle];
  if (v11 == 0.0)
  {
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v15.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v15.c = v14;
    *(_OWORD *)&v15.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  else
  {
    uint64_t v12 = [v7 imageViewSpec];
    [v12 rotationAngle];
    CGAffineTransformMakeRotation(&v15, v13);
  }
  PXRectGetCenter();
}

- (void)addTransitionCompletionsToAnimator:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 8);
    if (!v4 || !*(void *)(v4 + 40))
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:sel_addTransitionCompletionsToAnimator_ object:a1 file:@"PXPhotosGridStackTransitionHelper.m" lineNumber:129 description:@"Helper must be successfully prepared"];
    }
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__PXPhotosGridStackTransitionHelper_addTransitionCompletionsToAnimator___block_invoke;
    v6[3] = &unk_1E5DCF720;
    v6[4] = a1;
    [v3 addCompletion:v6];
  }
}

void __72__PXPhotosGridStackTransitionHelper_addTransitionCompletionsToAnimator___block_invoke(uint64_t a1)
{
}

uint64_t __72__PXPhotosGridStackTransitionHelper_addTransitionCompletionsToAnimator___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  return [a5 removeFromSuperview];
}

@end