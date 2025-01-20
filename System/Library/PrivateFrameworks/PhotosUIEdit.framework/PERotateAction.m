@interface PERotateAction
- (int64_t)actionType;
- (int64_t)rotateDirection;
- (void)applyToLoadResult:(id)a3 completion:(id)a4;
- (void)setRotateDirection:(int64_t)a3;
@end

@implementation PERotateAction

- (void)setRotateDirection:(int64_t)a3
{
  self->_rotateDirection = a3;
}

- (int64_t)rotateDirection
{
  return self->_rotateDirection;
}

- (int64_t)actionType
{
  return 6;
}

- (void)applyToLoadResult:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 asset];
    v10 = [v9 uuid];
    *(_DWORD *)buf = 138543362;
    v16 = v10;
    _os_log_impl(&dword_217B65000, v8, OS_LOG_TYPE_DEFAULT, "PERotateAction: applyToLoadResult on asset: %{public}@", buf, 0xCu);
  }
  v11 = [v6 compositionController];
  v12 = [v11 adjustmentConstants];
  v13 = [v12 PIOrientationAdjustmentKey];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__PERotateAction_applyToLoadResult_completion___block_invoke;
  v14[3] = &unk_2642BE7B8;
  v14[4] = self;
  [v11 modifyAdjustmentWithKey:v13 modificationBlock:v14];

  v7[2](v7, 1);
}

void __47__PERotateAction_applyToLoadResult_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 orientation];
  [*(id *)(a1 + 32) rotateDirection];
  [v3 setOrientation:NUOrientationConcat()];
}

@end