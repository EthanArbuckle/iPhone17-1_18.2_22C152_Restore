@interface PELivePortraitBehaviorController
- (BOOL)changingPortraitLightingDisablesLive;
- (BOOL)hasDepth;
- (BOOL)hasLive;
- (BOOL)hasLivePortrait;
- (PEAsset)asset;
- (PELivePortraitBehaviorController)initWithAsset:(id)a3 delegate:(id)a4 hasDepth:(BOOL)a5 hasLive:(BOOL)a6;
- (PELivePortraitBehaviorDelegate)delegate;
- (id)confirmationWarningStringForAction:(unint64_t)a3 compositionController:(id)a4;
- (void)applySideEffectsForAction:(unint64_t)a3 compositionController:(id)a4;
- (void)setAsset:(id)a3;
- (void)setChangingPortraitLightingDisablesLive:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PELivePortraitBehaviorController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PELivePortraitBehaviorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PELivePortraitBehaviorDelegate *)WeakRetained;
}

- (void)setAsset:(id)a3
{
}

- (PEAsset)asset
{
  return self->_asset;
}

- (BOOL)hasLive
{
  return self->_hasLive;
}

- (BOOL)hasDepth
{
  return self->_hasDepth;
}

- (void)setChangingPortraitLightingDisablesLive:(BOOL)a3
{
  self->_changingPortraitLightingDisablesLive = a3;
}

- (BOOL)changingPortraitLightingDisablesLive
{
  return self->_changingPortraitLightingDisablesLive;
}

- (BOOL)hasLivePortrait
{
  BOOL v3 = [(PELivePortraitBehaviorController *)self hasDepth];
  if (v3)
  {
    LOBYTE(v3) = [(PELivePortraitBehaviorController *)self hasLive];
  }
  return v3;
}

- (id)confirmationWarningStringForAction:(unint64_t)a3 compositionController:(id)a4
{
  v14[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = (void *)[v6 copy];
  [(PELivePortraitBehaviorController *)self applySideEffectsForAction:a3 compositionController:v7];
  v8 = [v6 composition];

  v9 = [v7 differingAdjustmentsWithComposition:v8];

  if ([v9 containsObject:*MEMORY[0x263F5D740]])
  {
    v10 = PELocalizedString(@"PELivePortraitBehaviorControllerWarningRemovingInpaintingTitle");
    v14[0] = v10;
    v11 = PELocalizedString(@"PELivePortraitBehaviorControllerWarningRemovingInpainting");
    v14[1] = v11;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)applySideEffectsForAction:(unint64_t)a3 compositionController:(id)a4
{
  id v6 = a4;
  v7 = [(PELivePortraitBehaviorController *)self delegate];
  if (v7)
  {
    v8 = [v6 depthAdjustmentController];
    v34 = v8;
    if (v8) {
      LODWORD(v27) = [v8 enabled];
    }
    else {
      LODWORD(v27) = 0;
    }
    v35 = objc_msgSend(v6, "livePhotoKeyFrameAdjustmentController", v27);
    v9 = [v6 autoLoopAdjustmentController];
    v33 = v9;
    if (v9)
    {
      v10 = [v9 flavor];
      uint64_t v11 = PIAutoLoopFlavorFromString();

      BOOL v29 = v11 != 0;
      int v12 = v11 != 3 && v11 != 0;
    }
    else
    {
      int v12 = 0;
      BOOL v29 = 0;
    }
    int v13 = [v7 isLivePhotoVideoEnabled];
    v14 = [v6 portraitAdjustmentController];
    int v15 = [v14 enabled];
    v32 = v14;
    if (v15)
    {
      v16 = [v14 kind];
      int v17 = [MEMORY[0x263F5D618] isPortraitStageEffect:v16];
    }
    else
    {
      int v17 = 0;
    }
    v31 = [v6 inpaintAdjustmentController];
    uint64_t v18 = [v31 operationCount];
    v30 = [v6 retouchAdjustmentController];
    uint64_t v19 = [v30 retouchStrokeCount];
    uint64_t v20 = v19;
    switch(a3)
    {
      case 0uLL:
        goto LABEL_26;
      case 1uLL:
        if ((v13 & v15) != 1) {
          goto LABEL_25;
        }
        int v12 = [(PELivePortraitBehaviorController *)self changingPortraitLightingDisablesLive] | v17;
        goto LABEL_26;
      case 2uLL:
      case 3uLL:
LABEL_25:
        int v12 = 0;
LABEL_26:
        if (v35)
        {
          v23 = [v6 trimAdjustmentController];
          if (v23)
          {
            memset(&v39, 0, sizeof(v39));
            v24 = [(PELivePortraitBehaviorController *)self delegate];
            v25 = v24;
            if (v24) {
              [v24 unadjustedStillImageTime];
            }
            else {
              memset(&v39, 0, sizeof(v39));
            }

            [v23 startTime];
            CMTime time1 = v39;
            if (CMTimeCompare(&time1, &time2) < 0
              || ([v23 endTime], CMTime time1 = v39, CMTimeCompare(&time1, &v36) >= 1))
            {
              [v6 removeAdjustmentWithKey:*MEMORY[0x263F5D878]];
            }
          }
          [v6 removeAdjustmentWithKey:*MEMORY[0x263F5D750]];
          BOOL v26 = (v18 | v20) != 0;

          if (v29)
          {
LABEL_45:
            [v6 removeAdjustmentWithKey:*MEMORY[0x263F5D6A8]];
            [v6 removeAdjustmentWithKey:*MEMORY[0x263F5D798]];
            [v6 removeAdjustmentWithKey:*MEMORY[0x263F5D790]];
            [v6 removeAdjustmentWithKey:*MEMORY[0x263F5D738]];
            if ((v12 & 1) == 0)
            {
LABEL_33:
              if (v26)
              {
LABEL_34:
                [v6 removeAdjustmentWithKey:*MEMORY[0x263F5D740]];
                [v6 removeAdjustmentWithKey:@"inpaintMasks"];
                [v6 removeAdjustmentWithKey:*MEMORY[0x263F5D798]];
              }
              goto LABEL_35;
            }
LABEL_32:
            [v7 setLivePhotoVideoEnabled:0];
            goto LABEL_33;
          }
        }
        else
        {
          BOOL v26 = 0;
          if (v29) {
            goto LABEL_45;
          }
        }
        if (!v12) {
          goto LABEL_33;
        }
        goto LABEL_32;
      case 4uLL:
        if (v15)
        {
          BOOL v21 = (v18 | v19) != 0;
          if ((([(PELivePortraitBehaviorController *)self changingPortraitLightingDisablesLive] | v17) & 1) == 0)goto LABEL_18; {
          goto LABEL_21;
          }
        }
        if (v18 | v19) {
          goto LABEL_34;
        }
        goto LABEL_35;
      case 5uLL:
      case 6uLL:
        BOOL v21 = (v18 | v19) != 0;
        if (v28
          && ([v6 modifyAdjustmentWithKey:*MEMORY[0x263F5D6F8] modificationBlock:&__block_literal_global_1772], objc_msgSend(v6, "portraitAdjustmentController"), v22 = objc_claimAutoreleasedReturnValue(), v22, v22))
        {
          [v6 modifyAdjustmentWithKey:*MEMORY[0x263F5D768] modificationBlock:&__block_literal_global_35];
          if ((v15 & 1) == 0) {
            goto LABEL_18;
          }
        }
        else if (!v15)
        {
LABEL_18:
          if (v21) {
            goto LABEL_34;
          }
          goto LABEL_35;
        }
LABEL_21:
        [v6 removeAdjustmentWithKey:*MEMORY[0x263F5D768]];
        if (v21) {
          goto LABEL_34;
        }
LABEL_35:

        goto LABEL_36;
      default:
        goto LABEL_35;
    }
  }
  _PFAssertContinueHandler();
LABEL_36:
}

uint64_t __84__PELivePortraitBehaviorController_applySideEffectsForAction_compositionController___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setEnabled:0];
}

uint64_t __84__PELivePortraitBehaviorController_applySideEffectsForAction_compositionController___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setEnabled:0];
}

- (PELivePortraitBehaviorController)initWithAsset:(id)a3 delegate:(id)a4 hasDepth:(BOOL)a5 hasLive:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PELivePortraitBehaviorController;
  int v13 = [(PELivePortraitBehaviorController *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_asset, a3);
    objc_storeWeak((id *)&v14->_delegate, v12);
    v14->_hasDepth = a5;
    v14->_hasLive = a6;
    int v15 = v14;
  }

  return v14;
}

@end