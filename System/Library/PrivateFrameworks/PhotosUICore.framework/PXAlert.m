@interface PXAlert
+ (id)show:(id)a3;
+ (id)showForError:(id)a3;
+ (id)showWithConfiguration:(id)a3;
- (PXAlert)init;
- (PXAlert)initWithConfiguration:(id)a3;
- (PXAlertConfiguration)configuration;
- (UIAlertController)alertController;
- (void)_loadIfNeeded;
- (void)_present;
- (void)dismissWithCompletionHandler:(id)a3;
@end

@implementation PXAlert

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
}

- (PXAlertConfiguration)configuration
{
  return self->_configuration;
}

- (UIAlertController)alertController
{
  [(PXAlert *)self _loadIfNeeded];
  alertController = self->_alertController;
  return alertController;
}

- (void)dismissWithCompletionHandler:(id)a3
{
  v6 = (void (**)(void))a3;
  v4 = [(PXAlert *)self alertController];
  v5 = v4;
  if (v4)
  {
    [v4 dismissViewControllerAnimated:1 completion:v6];
  }
  else if (v6)
  {
    v6[2]();
  }
}

- (void)_present
{
  v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  v4 = objc_msgSend(v3, "px_firstKeyWindow");

  v5 = [v4 rootViewController];
  if (!v5)
  {
    v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_FAULT, "PXAlert should avoid using UIApplication.sharedApplication and pass in the presenting view controller directly", v8, 2u);
    }
  }
  v7 = [(PXAlert *)self alertController];
  objc_msgSend(v5, "px_presentOverTopmostPresentedViewController:animated:completion:", v7, 1, 0);
}

- (void)_loadIfNeeded
{
  v48[1] = *MEMORY[0x1E4F143B8];
  if (!self->_didLoad)
  {
    v2 = self;
    self->_didLoad = 1;
    v3 = [(PXAlert *)self configuration];
    v4 = [v3 actions];
    v5 = [v3 completionHandler];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __24__PXAlert__loadIfNeeded__block_invoke;
    aBlock[3] = &unk_1E5DC1918;
    id v6 = v5;
    id v46 = v6;
    v38 = _Block_copy(aBlock);
    v7 = (void *)MEMORY[0x1E4FB1418];
    v8 = [v3 title];
    v9 = [v3 message];
    uint64_t v10 = objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v8, v9, objc_msgSend(v3, "style"));
    alertController = v2->_alertController;
    v2->_alertController = (UIAlertController *)v10;

    v12 = [v3 contentViewController];
    [(UIAlertController *)v2->_alertController setContentViewController:v12];

    v13 = [v3 headerContentViewController];
    [(UIAlertController *)v2->_alertController _setHeaderContentViewController:v13];

    v35 = v6;
    v36 = v3;
    if (![v4 count])
    {
      v14 = [PXAlertAction alloc];
      v15 = PXLocalizedStringFromTable(@"PXOK", @"PhotosUICore");
      v16 = -[PXAlertAction initWithTitle:style:action:](v14, "initWithTitle:style:action:", v15, 1, 0, v6);
      v48[0] = v16;
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];

      v4 = (void *)v17;
    }
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v4;
    uint64_t v18 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v42 != v20) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          v23 = v2;
          v24 = v2->_alertController;
          v25 = (void *)MEMORY[0x1E4FB1410];
          v26 = objc_msgSend(v22, "title", v35);
          unint64_t v27 = [v22 style];
          if (v27 >= 3)
          {
            v33 = [MEMORY[0x1E4F28B00] currentHandler];
            v34 = [NSString stringWithUTF8String:"UIAlertActionStyle UIAlertActionStyleFromPXAlertActionStyle(PXAlertActionStyle)"];
            [v33 handleFailureInFunction:v34 file:@"PXAlertActionStyle.h" lineNumber:43 description:@"Code which should be unreachable has been reached"];

            abort();
          }
          unint64_t v28 = v27;
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __24__PXAlert__loadIfNeeded__block_invoke_2;
          v39[3] = &unk_1E5DC7010;
          id v29 = v38;
          v39[4] = v22;
          id v40 = v29;
          v30 = [v25 actionWithTitle:v26 style:v28 handler:v39];
          [(UIAlertController *)v24 addAction:v30];

          v2 = v23;
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v19);
    }

    v31 = [v36 sourceItem];
    if (v31)
    {
      [(UIAlertController *)v2->_alertController setModalPresentationStyle:7];
      v32 = [(UIAlertController *)v2->_alertController popoverPresentationController];
      [v32 setSourceItem:v31];
    }
  }
}

void __24__PXAlert__loadIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  uint64_t v4 = [v6 action];
  v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
}

uint64_t __24__PXAlert__loadIfNeeded__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (PXAlert)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXAlert;
  v5 = [(PXAlert *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (PXAlertConfiguration *)v6;
  }
  return v5;
}

- (PXAlert)init
{
  uint64_t v3 = objc_alloc_init(PXAlertConfiguration);
  id v4 = [(PXAlert *)self initWithConfiguration:v3];

  return v4;
}

+ (id)showWithConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"PXAlert.m", 53, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];
  }
  uint64_t v6 = (void *)[objc_alloc((Class)a1) initWithConfiguration:v5];
  [v6 _present];

  return v6;
}

+ (id)showForError:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"PXAlert.m", 46, @"Invalid parameter not satisfying: %@", @"error != nil" object file lineNumber description];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __24__PXAlert_showForError___block_invoke;
  v10[3] = &unk_1E5DC7038;
  id v11 = v5;
  id v6 = v5;
  v7 = [a1 show:v10];

  return v7;
}

uint64_t __24__PXAlert_showForError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 configureForError:*(void *)(a1 + 32)];
}

+ (id)show:(id)a3
{
  id v4 = (void (**)(id, PXAlertConfiguration *))a3;
  id v5 = objc_alloc_init(PXAlertConfiguration);
  v4[2](v4, v5);

  id v6 = [a1 showWithConfiguration:v5];

  return v6;
}

@end