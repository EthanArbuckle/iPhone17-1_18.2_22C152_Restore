@interface WFUIKitAlertPresenter
+ (void)presentAlert:(id)a3 withUserInterface:(id)a4;
@end

@implementation WFUIKitAlertPresenter

+ (void)presentAlert:(id)a3 withUserInterface:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__WFUIKitAlertPresenter_presentAlert_withUserInterface___block_invoke;
  v9[3] = &unk_264C50DE8;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

uint64_t __56__WFUIKitAlertPresenter_presentAlert_withUserInterface___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentationSource];

  if (!v2)
  {
    v3 = [*(id *)(a1 + 40) view];
    v4 = +[WFAlertPresentationSource sourceWithView:v3];
    [*(id *)(a1 + 32) setPresentationSource:v4];
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  return +[WFUIAlertControllerAlertPresenter presentAlert:v5 withUserInterface:v6];
}

@end