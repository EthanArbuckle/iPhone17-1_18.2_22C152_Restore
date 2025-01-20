@interface VUIStillWatchingAlertPresenter
+ (void)presentWithTitle:(id)a3 presentingController:(id)a4 timeout:(double)a5 responseHandler:(id)a6;
- (double)timeoutInterval;
- (void)setTimeoutInterval:(double)a3;
@end

@implementation VUIStillWatchingAlertPresenter

+ (void)presentWithTitle:(id)a3 presentingController:(id)a4 timeout:(double)a5 responseHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = NSString;
  v13 = +[VUILocalizationManager sharedInstance];
  v14 = [v13 localizedStringForKey:@"NOW_PLAYING_STILL_WATCHING_MESSAGE"];
  v15 = [v12 stringWithValidatedFormat:v14, @"%@", 0, v9 validFormatSpecifiers error];

  v16 = +[VUIAlertController vui_alertControllerWithTitle:v15 message:0 preferredStyle:1];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__31;
  v42 = __Block_byref_object_dispose__31;
  v17 = (void *)MEMORY[0x1E4F1CB00];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __96__VUIStillWatchingAlertPresenter_presentWithTitle_presentingController_timeout_responseHandler___block_invoke;
  v35[3] = &unk_1E6DFC760;
  id v18 = v16;
  id v36 = v18;
  id v19 = v11;
  id v37 = v19;
  id v43 = [v17 timerWithTimeInterval:0 repeats:v35 block:a5];
  v20 = +[VUILocalizationManager sharedInstance];
  v21 = [v20 localizedStringForKey:@"CONTINUE_WATCHING"];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __96__VUIStillWatchingAlertPresenter_presentWithTitle_presentingController_timeout_responseHandler___block_invoke_3;
  v32[3] = &unk_1E6DFC788;
  v34 = &v38;
  id v22 = v19;
  id v33 = v22;
  v23 = +[VUIAlertAction vui_actionWithTitle:v21 style:0 handler:v32];
  objc_msgSend(v18, "vui_addAction:", v23);

  v24 = +[VUILocalizationManager sharedInstance];
  v25 = [v24 localizedStringForKey:@"EXIT"];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __96__VUIStillWatchingAlertPresenter_presentWithTitle_presentingController_timeout_responseHandler___block_invoke_4;
  v29[3] = &unk_1E6DFC788;
  v31 = &v38;
  id v26 = v22;
  id v30 = v26;
  v27 = +[VUIAlertAction vui_actionWithTitle:v25 style:0 handler:v29];
  objc_msgSend(v18, "vui_addAction:", v27);

  objc_msgSend(v18, "vui_presentAlertFromPresentingController:animated:completion:", v10, 1, 0);
  v28 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v28 addTimer:v39[5] forMode:*MEMORY[0x1E4F1C3A0]];

  _Block_object_dispose(&v38, 8);
}

void __96__VUIStillWatchingAlertPresenter_presentWithTitle_presentingController_timeout_responseHandler___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __96__VUIStillWatchingAlertPresenter_presentWithTitle_presentingController_timeout_responseHandler___block_invoke_2;
  v2[3] = &unk_1E6DF3DD0;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "vui_dismissViewControllerAnimated:completion:", 1, v2);
}

uint64_t __96__VUIStillWatchingAlertPresenter_presentWithTitle_presentingController_timeout_responseHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __96__VUIStillWatchingAlertPresenter_presentWithTitle_presentingController_timeout_responseHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

uint64_t __96__VUIStillWatchingAlertPresenter_presentWithTitle_presentingController_timeout_responseHandler___block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

@end