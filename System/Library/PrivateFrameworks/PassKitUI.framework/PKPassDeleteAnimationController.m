@interface PKPassDeleteAnimationController
+ (void)performPassbookDeleteWithView:(id)a3 inSuperview:(id)a4 completion:(id)a5;
- (PKPassDeleteAnimationController)initWithPassView:(id)a3 groupView:(id)a4;
- (PKPassDeleteAnimationControllerDelegate)delegate;
- (PKPassGroupView)groupView;
- (PKPassView)passView;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_registerForEnterBackgroundNotification;
- (void)_startAnimationWithCompletion:(id)a3;
- (void)_unregisterForEnterBackgroundNotification;
- (void)dealloc;
- (void)finished:(BOOL)a3;
- (void)forceDeleteAnimation;
- (void)setDelegate:(id)a3;
- (void)showInViewController:(id)a3;
@end

@implementation PKPassDeleteAnimationController

+ (void)performPassbookDeleteWithView:(id)a3 inSuperview:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v86 = a5;
  id v8 = a4;
  [v7 frame];
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v9, v10, v11, v12);
  [v13 setClipsToBounds:1];
  [v8 addSubview:v13];

  [v13 bounds];
  double v15 = v14;
  double v17 = v16;
  v87 = v7;
  objc_msgSend(v7, "setFrame:");
  [v13 addSubview:v7];
  v18 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v18 scale];
  double v20 = 1.0 / v19;

  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, v15, v20);
  v22 = [MEMORY[0x1E4FB1618] redColor];
  [v21 setBackgroundColor:v22];

  [v21 setAlpha:0.83];
  v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, v17, v15, v20);
  v24 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.07 blue:0.07 alpha:1.0];
  [v23 setBackgroundColor:v24];

  [v23 setAlpha:0.83];
  [v13 addSubview:v21];
  [v13 addSubview:v23];
  id v25 = objc_alloc(MEMORY[0x1E4F39C10]);
  LODWORD(v26) = 1046809695;
  LODWORD(v27) = 990250344;
  LODWORD(v28) = 1057860847;
  LODWORD(v29) = 1064564184;
  uint64_t v30 = [v25 initWithControlPoints:v26 :v27 :v28 :v29];
  v31 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"bounds"];
  [MEMORY[0x1E4FB1EB0] _setAnimationAttributes:v31];
  [v31 setMass:2.0];
  [v31 setStiffness:300.0];
  [v31 setDamping:400.0];
  v85 = v31;
  [v31 setTimingFunction:v30];
  v32 = [v13 layer];
  v33 = [v32 valueForKey:@"bounds"];
  [v31 setFromValue:v33];

  uint64_t v34 = *MEMORY[0x1E4F39F98];
  uint64_t v80 = *MEMORY[0x1E4F39F98];
  [v31 setFillMode:*MEMORY[0x1E4F39F98]];
  [v31 setDuration:0.91];
  LODWORD(v35) = 1068708659;
  [v31 setSpeed:v35];
  v81 = v13;
  v36 = [v13 layer];
  [v36 addAnimation:v31 forKey:@"bounds"];

  v37 = [v13 layer];
  objc_msgSend(v37, "setBounds:", 0.0, 0.0, v15, 0.5);

  double v38 = v15 * 0.5;
  v39 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position"];
  [MEMORY[0x1E4FB1EB0] _setAnimationAttributes:v39];
  [v39 setMass:2.0];
  [v39 setStiffness:300.0];
  [v39 setDamping:400.0];
  v40 = (void *)v30;
  [v39 setTimingFunction:v30];
  [v39 setFillMode:v34];
  [v39 setDuration:0.91];
  LODWORD(v41) = 1068708659;
  [v39 setSpeed:v41];
  v42 = (void *)[v39 copy];
  [MEMORY[0x1E4FB1EB0] _setAnimationAttributes:v42];
  v43 = [v87 valueForKey:@"position"];
  v84 = v42;
  [v42 setFromValue:v43];

  v44 = [v87 layer];
  [v44 addAnimation:v42 forKey:@"position"];

  v45 = [v87 layer];
  objc_msgSend(v45, "setPosition:", v38, 0.0);

  v46 = (void *)[v39 copy];
  [MEMORY[0x1E4FB1EB0] _setAnimationAttributes:v46];
  v47 = [v21 valueForKey:@"position"];
  v83 = v46;
  [v46 setFromValue:v47];

  v48 = [v21 layer];
  [v48 addAnimation:v46 forKey:@"position"];

  v49 = (void *)[v39 copy];
  objc_msgSend(MEMORY[0x1E4FB1EB0], "_setAnimationAttributes:");
  v50 = v23;
  v51 = [v23 valueForKey:@"position"];
  v82 = v49;
  [v49 setFromValue:v51];

  v52 = [v23 layer];
  [v52 addAnimation:v49 forKey:@"position"];

  v53 = [v21 layer];
  objc_msgSend(v53, "setPosition:", v38, 0.0);

  v54 = [v23 layer];
  objc_msgSend(v54, "setPosition:", v38, 0.0);

  id v55 = objc_alloc(MEMORY[0x1E4F39C10]);
  LODWORD(v56) = 1036831949;
  LODWORD(v57) = 0.25;
  LODWORD(v58) = 0.25;
  LODWORD(v59) = 1.0;
  uint64_t v60 = [v55 initWithControlPoints:v57 :v56 :v58 :v59];

  v61 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  [MEMORY[0x1E4FB1EB0] _setAnimationAttributes:v61];
  [v61 setDuration:0.41];
  v62 = [v21 layer];
  v63 = [v62 valueForKey:@"opacity"];
  [v61 setFromValue:v63];

  [v61 setFillMode:v80];
  [v61 setBeginTime:CACurrentMediaTime() + 0.5];
  v79 = (void *)v60;
  [v61 setTimingFunction:v60];
  v64 = [v21 layer];
  [v64 addAnimation:v61 forKey:@"opacity"];

  v65 = [v50 layer];
  [v65 addAnimation:v61 forKey:@"opacity"];

  v66 = [v21 layer];
  [v66 setOpacity:0.0];

  v67 = [v50 layer];
  [v67 setOpacity:0.0];

  v68 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  [MEMORY[0x1E4FB1EB0] _setAnimationAttributes:v68];
  [v68 setDuration:0.115];
  v69 = [v87 layer];
  v70 = [v69 valueForKey:@"opacity"];
  [v68 setFromValue:v70];

  [v68 setFillMode:v80];
  [v68 setBeginTime:CACurrentMediaTime() + 0.28];
  [v68 setTimingFunction:v60];
  v71 = [v87 layer];
  [v71 addAnimation:v68 forKey:@"opacity"];

  v72 = [v87 layer];
  [v72 setOpacity:0.0];

  dispatch_time_t v73 = dispatch_time(0, 740000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__PKPassDeleteAnimationController_performPassbookDeleteWithView_inSuperview_completion___block_invoke;
  block[3] = &unk_1E59CF3E0;
  id v89 = v87;
  id v90 = v21;
  id v91 = v50;
  id v92 = v81;
  id v93 = v86;
  id v74 = v86;
  id v75 = v81;
  id v76 = v91;
  id v77 = v21;
  id v78 = v87;
  dispatch_after(v73, MEMORY[0x1E4F14428], block);
}

uint64_t __88__PKPassDeleteAnimationController_performPassbookDeleteWithView_inSuperview_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  [*(id *)(a1 + 40) removeFromSuperview];
  [*(id *)(a1 + 48) removeFromSuperview];
  [*(id *)(a1 + 56) removeFromSuperview];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);

  return v2();
}

- (PKPassDeleteAnimationController)initWithPassView:(id)a3 groupView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPassDeleteAnimationController;
  double v9 = [(PKPassDeleteAnimationController *)&v12 init];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_passView, a3);
    objc_storeStrong((id *)&v10->_groupView, a4);
  }

  return v10;
}

- (void)dealloc
{
  [(PKPassDeleteAnimationController *)self _unregisterForEnterBackgroundNotification];
  v3.receiver = self;
  v3.super_class = (Class)PKPassDeleteAnimationController;
  [(PKPassDeleteAnimationController *)&v3 dealloc];
}

- (void)showInViewController:(id)a3
{
  id v4 = a3;
  v5 = [(PKPassView *)self->_passView pass];
  double v26 = v5;
  if ([v5 passType] == 1)
  {
    v6 = [v5 paymentPass];
    if ([v6 isAccessPass])
    {
      id v7 = [v6 localizedDescription];
      id v8 = PKLocalizedPaymentString(&cfstr_DeleteCardShee_0.isa, &stru_1EF1B4C70.isa, v7);
LABEL_19:
      double v9 = v4;

      double v10 = PKLocalizedPaymentString(&cfstr_DeleteCardShee_2.isa);
      uint64_t v11 = PKLocalizedPaymentString(&cfstr_DeleteCardShee.isa);
      goto LABEL_20;
    }
    if ([v6 supportsBarcodePayment])
    {
      uint64_t v12 = PKLocalizedAquamanString(&cfstr_DeleteAccountS.isa);
    }
    else
    {
      if ([v6 isIdentityPass])
      {
        unint64_t v13 = [v6 identityType];
        if (v13 < 2)
        {
          double v14 = @"DELETE_DL_SHEET_MESSAGE";
        }
        else if (v13 == 3)
        {
          double v14 = @"DELETE_NID_SHEET_MESSAGE";
        }
        else
        {
          if (v13 != 2)
          {
            id v7 = 0;
            goto LABEL_18;
          }
          double v14 = @"DELETE_STATE_ID_SHEET_MESSAGE";
        }
        PKDeviceSpecificLocalizedStringKeyForKey(v14, 0);
        double v15 = (NSString *)objc_claimAutoreleasedReturnValue();
        id v7 = PKLocalizedIdentityString(v15);

LABEL_18:
        id v25 = [v6 localizedDescription];
        id v8 = PKStringWithValidatedFormat();

        goto LABEL_19;
      }
      uint64_t v12 = PKLocalizedPaymentString(&cfstr_DeleteCardShee_1.isa);
    }
    id v7 = (void *)v12;
    goto LABEL_18;
  }
  double v9 = v4;
  id v8 = PKLocalizedString(&cfstr_RemoveSheetTit.isa);
  double v10 = PKLocalizedString(&cfstr_RemoveSheetCan.isa);
  uint64_t v11 = PKLocalizedString(&cfstr_RemoveSheetCon.isa);
LABEL_20:
  double v16 = (void *)v11;
  objc_msgSend(MEMORY[0x1E4FB1418], "alertControllerWithTitle:message:preferredStyle:", v8, 0, 0, v25);
  double v17 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
  alertController = self->_alertController;
  self->_alertController = v17;

  objc_initWeak(&location, self);
  double v19 = self->_alertController;
  double v20 = (void *)MEMORY[0x1E4FB1410];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __56__PKPassDeleteAnimationController_showInViewController___block_invoke;
  v29[3] = &unk_1E59CCFF0;
  objc_copyWeak(&v30, &location);
  v21 = [v20 actionWithTitle:v10 style:1 handler:v29];
  [(UIAlertController *)v19 addAction:v21];

  v22 = self->_alertController;
  v23 = (void *)MEMORY[0x1E4FB1410];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __56__PKPassDeleteAnimationController_showInViewController___block_invoke_2;
  v27[3] = &unk_1E59CCFF0;
  objc_copyWeak(&v28, &location);
  v24 = [v23 actionWithTitle:v16 style:2 handler:v27];
  [(UIAlertController *)v22 addAction:v24];

  [v9 presentViewController:self->_alertController animated:1 completion:0];
  [(PKPassDeleteAnimationController *)self _registerForEnterBackgroundNotification];
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

void __56__PKPassDeleteAnimationController_showInViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _unregisterForEnterBackgroundNotification];
    [v2 finished:0];
    id WeakRetained = v2;
  }
}

void __56__PKPassDeleteAnimationController_showInViewController___block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _unregisterForEnterBackgroundNotification];
    id v4 = [v3[4] beginSuppressingPageControl];
    dispatch_time_t v5 = dispatch_time(0, 710000000);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__PKPassDeleteAnimationController_showInViewController___block_invoke_3;
    v7[3] = &unk_1E59CB128;
    objc_copyWeak(&v9, v1);
    id v8 = v4;
    id v6 = v4;
    dispatch_after(v5, MEMORY[0x1E4F14428], v7);

    objc_destroyWeak(&v9);
  }
}

void __56__PKPassDeleteAnimationController_showInViewController___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained _startAnimationWithCompletion:v3];
  }
  else
  {
    if (!v3) {
      goto LABEL_6;
    }
    id v4 = 0;
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  id WeakRetained = v4;
LABEL_6:
}

- (void)forceDeleteAnimation
{
  id v3 = [(PKPassGroupView *)self->_groupView beginSuppressingPageControl];
  [(PKPassDeleteAnimationController *)self _startAnimationWithCompletion:v3];
}

- (void)finished:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained deleteAnimationController:self didComplete:v3];
  }
}

- (void)_startAnimationWithCompletion:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained deleteAnimationControllerWillBeginDeleteAnimation:self];
  }
  [(PKPassView *)self->_passView sizeToFit];
  id v6 = [(PKPassView *)self->_passView snapshotViewOfVisibleFaceAfterScreenUpdates:0];
  id v7 = [(PKPassView *)self->_passView superview];
  [(PKPassView *)self->_passView removeFromSuperview];
  id v8 = objc_opt_class();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__PKPassDeleteAnimationController__startAnimationWithCompletion___block_invoke;
  v10[3] = &unk_1E59CF408;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 performPassbookDeleteWithView:v6 inSuperview:v7 completion:v10];
}

uint64_t __65__PKPassDeleteAnimationController__startAnimationWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) finished:a2];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)_registerForEnterBackgroundNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__applicationDidEnterBackground_ name:*MEMORY[0x1E4FB2640] object:0];
}

- (void)_unregisterForEnterBackgroundNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2640] object:0];
}

- (void)_applicationDidEnterBackground:(id)a3
{
  [(PKPassDeleteAnimationController *)self _unregisterForEnterBackgroundNotification];
  [(PKPassDeleteAnimationController *)self finished:0];
  alertController = self->_alertController;

  [(UIAlertController *)alertController dismissViewControllerAnimated:0 completion:0];
}

- (PKPassDeleteAnimationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPassDeleteAnimationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPassView)passView
{
  return self->_passView;
}

- (PKPassGroupView)groupView
{
  return self->_groupView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupView, 0);
  objc_storeStrong((id *)&self->_passView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_alertController, 0);
}

@end