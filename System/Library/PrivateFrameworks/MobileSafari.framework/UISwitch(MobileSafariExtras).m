@interface UISwitch(MobileSafariExtras)
- (void)sf_initWithOn:()MobileSafariExtras valueChangeHandler:;
@end

@implementation UISwitch(MobileSafariExtras)

- (void)sf_initWithOn:()MobileSafariExtras valueChangeHandler:
{
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4FB13F0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__UISwitch_MobileSafariExtras__sf_initWithOn_valueChangeHandler___block_invoke;
  v14[3] = &unk_1E54EA5B8;
  id v15 = v6;
  id v8 = v6;
  v9 = [v7 actionWithHandler:v14];
  v10 = objc_msgSend(a1, "initWithFrame:primaryAction:", v9, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v11 = v10;
  if (v10)
  {
    [v10 setOn:a3];
    id v12 = v11;
  }

  return v11;
}

@end