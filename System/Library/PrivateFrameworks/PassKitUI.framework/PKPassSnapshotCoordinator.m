@interface PKPassSnapshotCoordinator
- (PKPassSnapshotCoordinator)initWithSEIDs:(id)a3;
- (id)_fallbackImageForCredential:(id)a3;
- (id)cardSnapshotForSource:(id)a3 withSize:(CGSize)a4 completion:(id)a5;
- (void)_createPassSnapshotFromPaymentPass:(id)a3 withSize:(CGSize)a4 completion:(id)a5;
@end

@implementation PKPassSnapshotCoordinator

- (PKPassSnapshotCoordinator)initWithSEIDs:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassSnapshotCoordinator;
  v6 = [(PKPassSnapshotCoordinator *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_secureElementIdentifiers, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.passkitui.snapshotCoordinator", 0);
    backgroundQueue = v7->_backgroundQueue;
    v7->_backgroundQueue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (id)cardSnapshotForSource:(id)a3 withSize:(CGSize)a4 completion:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = a5;
  objc_super v11 = [v9 passSnapshot];
  if (v11)
  {
    id v12 = v11;
    v13 = v12;
    goto LABEL_15;
  }
  v14 = [v9 credential];
  if (![v14 isIssuerProvisioningExtensionCredential])
  {
LABEL_7:
    v21 = [v14 underlyingPaymentPass];
    if (([v9 isSnapshotFetchInProgress] & 1) == 0)
    {
      if (([v21 remoteAssetsDownloadedForSEIDs:self->_secureElementIdentifiers] & 1) != 0
        || [v14 isLocalAppletSubcredentialPassCredential])
      {
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __71__PKPassSnapshotCoordinator_cardSnapshotForSource_withSize_completion___block_invoke;
        v33[3] = &unk_1E59CE618;
        id v22 = v9;
        id v34 = v22;
        id v35 = v10;
        -[PKPassSnapshotCoordinator _createPassSnapshotFromPaymentPass:withSize:completion:](self, "_createPassSnapshotFromPaymentPass:withSize:completion:", v21, v33, width, height);
        [v22 setIsSnapshotFetchInProgress:1];

        v23 = v34;
      }
      else
      {
        v25 = [v14 purchasedProductCredential];
        v23 = v25;
        if (v25)
        {
          v26 = [v25 product];
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __71__PKPassSnapshotCoordinator_cardSnapshotForSource_withSize_completion___block_invoke_2;
          v29[3] = &unk_1E59DC968;
          id v27 = v9;
          id v30 = v27;
          id v31 = 0;
          id v32 = v10;
          v13 = objc_msgSend(v26, "thumbnailCachedImageForSize:completion:", v29, width, height);

          if (v13)
          {
            [v27 setPassSnapshot:v13];
            id v28 = v13;
          }
          else
          {
            [v27 setIsSnapshotFetchInProgress:1];
          }

          if (v13)
          {

            goto LABEL_13;
          }
        }
      }
    }
    v13 = [(PKPassSnapshotCoordinator *)self _fallbackImageForCredential:v14];
LABEL_13:

    id v12 = 0;
    goto LABEL_14;
  }
  v15 = [v14 issuerProvisioningExtensionCredential];
  v16 = [v15 entry];

  id v17 = v16;
  CGImageRef v18 = CGImageRetain((CGImageRef)[v17 art]);
  if (!v18)
  {

    goto LABEL_7;
  }
  v19 = v18;
  v20 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:v18];
  CGImageRelease(v19);
  [v9 setPassSnapshot:v20];
  id v12 = v20;

  v13 = v12;
LABEL_14:

LABEL_15:

  return v13;
}

void __71__PKPassSnapshotCoordinator_cardSnapshotForSource_withSize_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setPassSnapshot:v4];
  [*(id *)(a1 + 32) setIsSnapshotFetchInProgress:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __71__PKPassSnapshotCoordinator_cardSnapshotForSource_withSize_completion___block_invoke_2(uint64_t result, int a2, uint64_t a3)
{
  if (a3 && a2)
  {
    uint64_t v3 = result;
    [*(id *)(result + 32) setPassSnapshot:*(void *)(result + 40)];
    [*(id *)(v3 + 32) setIsSnapshotFetchInProgress:0];
    id v4 = *(uint64_t (**)(void))(*(void *)(v3 + 48) + 16);
    return v4();
  }
  return result;
}

- (void)_createPassSnapshotFromPaymentPass:(id)a3 withSize:(CGSize)a4 completion:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v9 = a3;
  id v10 = a5;
  if (v10)
  {
    if (v9)
    {
      objc_initWeak(location, self);
      backgroundQueue = self->_backgroundQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __84__PKPassSnapshotCoordinator__createPassSnapshotFromPaymentPass_withSize_completion___block_invoke;
      block[3] = &unk_1E59DF0B0;
      id v14 = v9;
      objc_copyWeak(v16, location);
      v16[1] = *(id *)&width;
      v16[2] = *(id *)&height;
      id v15 = v10;
      dispatch_async(backgroundQueue, block);

      objc_destroyWeak(v16);
      objc_destroyWeak(location);
    }
    else
    {
      id v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "No payment pass to generate snapshot", (uint8_t *)location, 2u);
      }

      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

void __84__PKPassSnapshotCoordinator__createPassSnapshotFromPaymentPass_withSize_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __84__PKPassSnapshotCoordinator__createPassSnapshotFromPaymentPass_withSize_completion___block_invoke_2;
  v3[3] = &unk_1E59D71C0;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 32);
  long long v7 = *(_OWORD *)(a1 + 56);
  id v5 = *(id *)(a1 + 40);
  [v2 loadImageSetAsync:0 preheat:1 withCompletion:v3];

  objc_destroyWeak(&v6);
}

void __84__PKPassSnapshotCoordinator__createPassSnapshotFromPaymentPass_withSize_completion___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PKPassSnapshotCoordinator__createPassSnapshotFromPaymentPass_withSize_completion___block_invoke_3;
  block[3] = &unk_1E59D71C0;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  id v3 = *(id *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v5);
}

void __84__PKPassSnapshotCoordinator__createPassSnapshotFromPaymentPass_withSize_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = [[PKPassView alloc] initWithPass:*(void *)(a1 + 32) content:3 suppressedContent:4087];
    id v4 = -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v3, "snapshotOfFrontFaceWithRequestedSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    id WeakRetained = v5;
  }
}

- (id)_fallbackImageForCredential:(id)a3
{
  id v3 = a3;
  if ([v3 isAccountCredential])
  {
    id v4 = [v3 accountCredential];

    id v5 = [v4 account];
    unint64_t v6 = [v5 feature];

    if (v6 < 5)
    {
      long long v7 = off_1E59DF0D0[v6];
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v8 = [v3 credentialType];

    if (v8 == 301)
    {
      long long v7 = @"PendingCarKeyCardArt_Small";
      goto LABEL_7;
    }
  }
  long long v7 = @"PlaceholderCardArt_Small";
LABEL_7:

  return PKUIImageNamed(v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundQueue, 0);

  objc_storeStrong((id *)&self->_secureElementIdentifiers, 0);
}

@end