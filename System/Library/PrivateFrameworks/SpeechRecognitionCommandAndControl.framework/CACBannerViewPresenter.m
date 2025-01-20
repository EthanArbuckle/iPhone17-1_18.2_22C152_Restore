@interface CACBannerViewPresenter
+ (double)durationToDisplayMessageString:(id)a3;
- (CACBannerView)bannerView;
- (CACBannerViewPresenter)initWithContainingView:(id)a3;
- (UIView)containingView;
- (void)_hideBannerView;
- (void)dismissBannerView;
- (void)presentBannerViewWithText:(id)a3 type:(int64_t)a4 avoidingSystemAperature:(CGRect)a5;
- (void)presentBannerViewWithText:(id)a3 type:(int64_t)a4 avoidingSystemAperature:(CGRect)a5 duration:(double)a6;
- (void)setBannerView:(id)a3;
@end

@implementation CACBannerViewPresenter

+ (double)durationToDisplayMessageString:(id)a3
{
  return (double)(unint64_t)[a3 length] * 0.05 + 1.0;
}

- (CACBannerViewPresenter)initWithContainingView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CACBannerViewPresenter;
  v6 = [(CACBannerViewPresenter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_containingView, a3);
  }

  return v7;
}

- (void)_hideBannerView
{
  v3 = [(CACBannerViewPresenter *)self bannerView];
  [(CACBannerViewPresenter *)self setBannerView:0];
  if (v3)
  {
    v4 = (void *)MEMORY[0x263F82E00];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __41__CACBannerViewPresenter__hideBannerView__block_invoke;
    v7[3] = &unk_264D115D0;
    id v8 = v3;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __41__CACBannerViewPresenter__hideBannerView__block_invoke_2;
    v5[3] = &unk_264D11AD8;
    id v6 = v8;
    [v4 animateWithDuration:v7 animations:v5 completion:0.3];
  }
}

uint64_t __41__CACBannerViewPresenter__hideBannerView__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __41__CACBannerViewPresenter__hideBannerView__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)presentBannerViewWithText:(id)a3 type:(int64_t)a4 avoidingSystemAperature:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v12 = a3;
  [(id)objc_opt_class() durationToDisplayMessageString:v12];
  -[CACBannerViewPresenter presentBannerViewWithText:type:avoidingSystemAperature:duration:](self, "presentBannerViewWithText:type:avoidingSystemAperature:duration:", v12, a4, x, y, width, height, v11);
}

- (void)presentBannerViewWithText:(id)a3 type:(int64_t)a4 avoidingSystemAperature:(CGRect)a5 duration:(double)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  v84[3] = *MEMORY[0x263EF8340];
  id v13 = a3;
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__hideBannerView object:0];
  v14 = [(CACBannerViewPresenter *)self containingView];
  v15 = [v14 traitCollection];
  uint64_t v16 = [v15 userInterfaceIdiom];

  if (v16 != 3)
  {
    v17 = [(CACBannerViewPresenter *)self bannerView];

    if (!v17)
    {
      v18 = objc_alloc_init(CACBannerView);
      [(CACBannerView *)v18 setTranslatesAutoresizingMaskIntoConstraints:0];
      v19 = [(CACBannerViewPresenter *)self containingView];
      [v19 addSubview:v18];

      v73 = v18;
      [(CACBannerViewPresenter *)self setBannerView:v18];
      v85.origin.CGFloat x = x;
      v85.origin.CGFloat y = y;
      v85.size.CGFloat width = width;
      v85.size.CGFloat height = height;
      id v76 = v13;
      int64_t v74 = a4;
      if (CGRectIsEmpty(v85))
      {
        v20 = [(CACBannerViewPresenter *)self containingView];
        [v20 safeAreaInsets];
        double v22 = v21;

        if (v22 == 0.0
          || ([MEMORY[0x263F82670] currentDevice],
              v23 = objc_claimAutoreleasedReturnValue(),
              uint64_t v24 = [v23 userInterfaceIdiom],
              v23,
              double v25 = 0.0,
              v24 == 1))
        {
          double v25 = 10.0;
        }
        v26 = [(CACBannerViewPresenter *)self bannerView];
        v27 = [v26 topAnchor];
        v28 = [(CACBannerViewPresenter *)self containingView];
        v29 = [v28 safeAreaLayoutGuide];
        v30 = [v29 topAnchor];
        uint64_t v31 = [v27 constraintEqualToAnchor:v30 constant:v25];
      }
      else
      {
        v26 = [(CACBannerViewPresenter *)self bannerView];
        v27 = [v26 topAnchor];
        v28 = [(CACBannerViewPresenter *)self containingView];
        v29 = [v28 topAnchor];
        v86.origin.CGFloat x = x;
        v86.origin.CGFloat y = y;
        v86.size.CGFloat width = width;
        v86.size.CGFloat height = height;
        uint64_t v31 = [v27 constraintEqualToAnchor:v29 constant:CGRectGetMaxY(v86) + 10.0];
      }
      v68 = (void *)v31;

      v67 = (void *)MEMORY[0x263F08938];
      v84[0] = v31;
      v72 = [(CACBannerViewPresenter *)self containingView];
      v71 = [v72 safeAreaLayoutGuide];
      v69 = [v71 leadingAnchor];
      v70 = [(CACBannerViewPresenter *)self bannerView];
      v32 = [v70 leadingAnchor];
      v33 = [v69 constraintEqualToAnchor:v32];
      v84[1] = v33;
      v34 = [(CACBannerViewPresenter *)self containingView];
      v35 = [v34 safeAreaLayoutGuide];
      v36 = [v35 trailingAnchor];
      v37 = [(CACBannerViewPresenter *)self bannerView];
      v38 = [v37 trailingAnchor];
      v39 = [v36 constraintEqualToAnchor:v38];
      v84[2] = v39;
      v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:3];
      [v67 activateConstraints:v40];

      id v13 = v76;
      v17 = 0;
      a4 = v74;
    }
    v41 = +[CACPreferences sharedPreferences];
    int v42 = [v41 additionalLoggingForCommands];

    switch(a4)
    {
      case 0:
      case 4:
        v43 = [(CACBannerViewPresenter *)self bannerView];
        [v43 setText:v13];

        v44 = [(CACBannerViewPresenter *)self bannerView];
        [v44 setSymbolImage:@"info.circle.fill"];

        if (v42)
        {
          v45 = CACLogAdditionalLogging();
          if (!os_log_type_enabled(v45, OS_LOG_TYPE_INFO)) {
            goto LABEL_27;
          }
          *(_DWORD *)buf = 138543362;
          id v83 = v13;
          v46 = "Banner - Hint: %{public}@";
          goto LABEL_20;
        }
        break;
      case 1:
        v47 = [(CACBannerViewPresenter *)self bannerView];
        [v47 setText:v13];

        v48 = [(CACBannerViewPresenter *)self bannerView];
        [v48 setSymbolImage:@"exclamationmark.triangle.fill"];

        if (v42)
        {
          v45 = CACLogAdditionalLogging();
          if (!os_log_type_enabled(v45, OS_LOG_TYPE_INFO)) {
            goto LABEL_27;
          }
          *(_DWORD *)buf = 138543362;
          id v83 = v13;
          v46 = "Banner - Error: %{public}@";
          goto LABEL_20;
        }
        break;
      case 2:
        v49 = [(CACBannerViewPresenter *)self bannerView];
        [v49 setText:v13];

        v50 = [(CACBannerViewPresenter *)self bannerView];
        [v50 setSymbolImage:0];

        if (v42)
        {
          v45 = CACLogAdditionalLogging();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            id v83 = v13;
            v46 = "Banner - Command: %{public}@";
LABEL_20:
            _os_log_impl(&dword_238377000, v45, OS_LOG_TYPE_INFO, v46, buf, 0xCu);
          }
          goto LABEL_27;
        }
        break;
      case 3:
        v51 = [(CACBannerViewPresenter *)self bannerView];
        [v51 setText:v13];

        v52 = [(CACBannerViewPresenter *)self bannerView];
        [v52 setSymbolImage:0];

        if (v42)
        {
          v53 = CACLogAdditionalLogging();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            id v83 = v13;
            _os_log_impl(&dword_238377000, v53, OS_LOG_TYPE_INFO, "Banner - Title: %{public}@", buf, 0xCu);
          }
        }
        v45 = [v13 componentsSeparatedByString:@"\n"];
        if ((unint64_t)[v45 count] >= 2)
        {
          v54 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v13];
          v55 = [v45 firstObject];
          uint64_t v56 = [v55 length];

          v57 = [v45 firstObject];
          uint64_t v75 = [v57 length];
          v77 = v17;
          uint64_t v58 = [v13 length];
          v59 = [v45 firstObject];
          uint64_t v60 = v58 - [v59 length];

          id v61 = objc_alloc_init(MEMORY[0x263F82368]);
          [v61 setAlignment:1];
          v62 = [MEMORY[0x263F82770] defaultMetrics];
          [v62 scaledValueForValue:4.0];
          objc_msgSend(v61, "setLineSpacing:");

          objc_msgSend(v54, "addAttribute:value:range:", *MEMORY[0x263F822A8], v61, 0, objc_msgSend(v13, "length"));
          uint64_t v80 = *MEMORY[0x263F822C0];
          v81 = &unk_26EB4CFB0;
          v63 = [NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
          objc_msgSend(v54, "addAttributes:range:", v63, 0, v56);

          v64 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F83590]];
          objc_msgSend(v54, "addAttribute:value:range:", *MEMORY[0x263F82270], v64, v75, v60);
          v65 = [(CACBannerViewPresenter *)self bannerView];
          [v65 setAttributedText:v54];

          v17 = v77;
        }
LABEL_27:

        break;
      default:
        break;
    }
    if (v17)
    {
      [(CACBannerViewPresenter *)self performSelector:sel__hideBannerView withObject:0 afterDelay:a6];
    }
    else
    {
      v66 = [(CACBannerViewPresenter *)self bannerView];
      [v66 setAlpha:0.0];

      v79[0] = MEMORY[0x263EF8330];
      v79[1] = 3221225472;
      v79[2] = __90__CACBannerViewPresenter_presentBannerViewWithText_type_avoidingSystemAperature_duration___block_invoke;
      v79[3] = &unk_264D115D0;
      v79[4] = self;
      v78[0] = MEMORY[0x263EF8330];
      v78[1] = 3221225472;
      v78[2] = __90__CACBannerViewPresenter_presentBannerViewWithText_type_avoidingSystemAperature_duration___block_invoke_2;
      v78[3] = &unk_264D11B00;
      v78[4] = self;
      *(double *)&v78[5] = a6;
      [MEMORY[0x263F82E00] animateWithDuration:v79 animations:v78 completion:0.3];
    }
  }
}

void __90__CACBannerViewPresenter_presentBannerViewWithText_type_avoidingSystemAperature_duration___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) bannerView];
  [v1 setAlpha:1.0];
}

uint64_t __90__CACBannerViewPresenter_presentBannerViewWithText_type_avoidingSystemAperature_duration___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:sel__hideBannerView withObject:0 afterDelay:*(double *)(a1 + 40)];
}

- (void)dismissBannerView
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__hideBannerView object:0];
  [(CACBannerViewPresenter *)self _hideBannerView];
}

- (UIView)containingView
{
  return self->_containingView;
}

- (CACBannerView)bannerView
{
  return self->_bannerView;
}

- (void)setBannerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_containingView, 0);
}

@end