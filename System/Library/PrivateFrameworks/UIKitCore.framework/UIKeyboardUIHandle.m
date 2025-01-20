@interface UIKeyboardUIHandle
- (UIKeyboardUIHandle)initWithService:(id)a3 connection:(id)a4;
- (id)snapshotForOptions:(id)a3;
- (id)snapshotForView:(id)a3;
- (void)setKeyboardAlpha:(id)a3 force:(id)a4 processId:(id)a5;
@end

@implementation UIKeyboardUIHandle

- (UIKeyboardUIHandle)initWithService:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UIKeyboardUIHandle;
  v8 = [(UIKeyboardUIHandle *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_service, v6);
    objc_storeStrong((id *)&v9->_connection, a4);
  }

  return v9;
}

- (id)snapshotForView:(id)a3
{
  v44[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v5 = [v4 _window];
  id v6 = [v5 screen];

  if (v6)
  {
    [v6 scale];
    double v8 = v7;
    [v4 frame];
    double v10 = v9;
    double v12 = v11;
    v13 = objc_alloc_init(UIKeyboardUISnapshot);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
    -[UIKeyboardUISnapshot setSlotID:](v13, "setSlotID:", objc_msgSend(WeakRetained, "createSlot:", v8 * v10, v8 * v12));

    -[UIKeyboardUISnapshot setSize:](v13, "setSize:", v10, v12);
    uint64_t v15 = *MEMORY[0x1E4F3A538];
    v44[0] = *MEMORY[0x1E4F3A558];
    uint64_t v16 = *MEMORY[0x1E4F3A4F8];
    v43[0] = v15;
    v43[1] = v16;
    v40 = v6;
    v39 = [v6 displayConfiguration];
    v38 = [v39 name];
    v44[1] = v38;
    v43[2] = *MEMORY[0x1E4F3A4E0];
    v17 = NSNumber;
    v37 = [v4 layer];
    v18 = [v37 context];
    v19 = objc_msgSend(v17, "numberWithUnsignedInt:", objc_msgSend(v18, "contextId"));
    v44[2] = v19;
    v43[3] = *MEMORY[0x1E4F3A530];
    v20 = NSNumber;
    v21 = [v4 layer];
    v22 = [v20 numberWithUnsignedLongLong:v21];
    v44[3] = v22;
    v43[4] = *MEMORY[0x1E4F3A4F0];
    v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[UIKeyboardUISnapshot slotID](v13, "slotID"));
    v44[4] = v23;
    v43[5] = *MEMORY[0x1E4F3A588];
    v24 = (void *)MEMORY[0x1E4F29238];
    long long v25 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    *(_OWORD *)&v41.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    *(_OWORD *)&v41.m33 = v25;
    long long v26 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    *(_OWORD *)&v41.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    *(_OWORD *)&v41.m43 = v26;
    long long v27 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    *(_OWORD *)&v41.m11 = *MEMORY[0x1E4F39B10];
    *(_OWORD *)&v41.m13 = v27;
    long long v28 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    *(_OWORD *)&v41.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    *(_OWORD *)&v41.m23 = v28;
    CATransform3DScale(&v42, &v41, v8, v8, 1.0);
    v29 = [v24 valueWithCATransform3D:&v42];
    uint64_t v30 = *MEMORY[0x1E4F3A578];
    v44[5] = v29;
    v44[6] = MEMORY[0x1E4F1CC38];
    uint64_t v31 = *MEMORY[0x1E4F3A528];
    v43[6] = v30;
    v43[7] = v31;
    v44[7] = MEMORY[0x1E4F1CC38];
    v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:8];
    v33 = -[UIView _appendSnapshotDisplaySystemIdentifierToOptionsIfNeeded:](v4, v32);

    if (CARenderServerSnapshot())
    {
      v34 = v13;
    }
    else
    {
      v35 = KeyboardUIServiceLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v41.m11) = 0;
        _os_log_error_impl(&dword_1853B0000, v35, OS_LOG_TYPE_ERROR, "Failed to snapshot", (uint8_t *)&v41, 2u);
      }

      v34 = 0;
    }
    id v6 = v40;
  }
  else
  {
    KeyboardUIServiceLog();
    v13 = (UIKeyboardUISnapshot *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v41.m11) = 0;
      _os_log_error_impl(&dword_1853B0000, &v13->super, OS_LOG_TYPE_ERROR, "Snapshot view does not have a screen", (uint8_t *)&v41, 2u);
    }
    v34 = 0;
  }

  return v34;
}

- (id)snapshotForOptions:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 unsignedIntegerValue];
    uint64_t v8 = 0;
    double v9 = &v8;
    uint64_t v10 = 0x3032000000;
    double v11 = __Block_byref_object_copy__189;
    double v12 = __Block_byref_object_dispose__189;
    id v13 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__UIKeyboardUIHandle_snapshotForOptions___block_invoke;
    block[3] = &unk_1E5301058;
    block[5] = &v8;
    block[6] = v4;
    block[4] = self;
    dispatch_sync(MEMORY[0x1E4F14428], block);
    id v5 = (id)v9[5];
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

void __41__UIKeyboardUIHandle_snapshotForOptions___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (([(id)UIApp isSuspended] & 1) == 0)
  {
    uint64_t v2 = *(void *)(a1 + 48);
    if (v2 == 1)
    {
      uint64_t v4 = +[UIKeyboard activeKeyboard];
      v3 = [v4 window];

      if (!v3) {
        goto LABEL_11;
      }
    }
    else
    {
      if (v2 != 2)
      {
        uint64_t v8 = KeyboardUIServiceLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          uint64_t v9 = *(void *)(a1 + 48);
          v10[0] = 67109120;
          v10[1] = v9;
          _os_log_error_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Unsupported snapshot options %d", (uint8_t *)v10, 8u);
        }

        goto LABEL_11;
      }
      v3 = +[UIKeyboard snapshotViewForPredictionViewTransition];
      if (!v3)
      {
LABEL_11:
        v3 = KeyboardUIServiceLog();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v10[0]) = 0;
          _os_log_error_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "Snapshot target is nil", (uint8_t *)v10, 2u);
        }
        goto LABEL_13;
      }
    }
    uint64_t v5 = [*(id *)(a1 + 32) snapshotForView:v3];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    double v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

LABEL_13:
  }
}

- (void)setKeyboardAlpha:(id)a3 force:(id)a4 processId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(BSServiceConnectionHost *)self->_connection remoteProcess];
  double v12 = [v11 bundleIdentifier];
  int v13 = [v12 hasPrefix:@"com.apple."];

  if (v8 && v13)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__UIKeyboardUIHandle_setKeyboardAlpha_force_processId___block_invoke;
    block[3] = &unk_1E52DCB30;
    id v15 = v8;
    id v16 = v9;
    id v17 = v10;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __55__UIKeyboardUIHandle_setKeyboardAlpha_force_processId___block_invoke(id *a1)
{
  [a1[4] doubleValue];
  double v3 = v2;
  uint64_t v4 = [a1[5] BOOLValue];
  uint64_t v5 = [a1[6] intValue];
  if ((v4 & 1) != 0
    || v3 > 0.0
    || (uint64_t result = +[UIKeyboard keyboardProcessId],
        v5 == result))
  {
    return +[UIKeyboard setKeyboardAlpha:1 remote:v4 force:v5 processId:v3];
  }
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end