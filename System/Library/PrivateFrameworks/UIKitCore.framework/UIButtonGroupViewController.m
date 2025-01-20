@interface UIButtonGroupViewController
@end

@implementation UIButtonGroupViewController

void __78___UIButtonGroupViewController_initWithBarButtonItemGroups_overLightKeyboard___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v12 = a3;
  v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = [v12 barButtonItem];
    v9 = [v8 buttonGroup];
    if (v9)
    {
      char v10 = v9[24];

      v11 = v6;
      if ((v10 & 4) != 0)
      {
        v6[2](v6);
        v11 = 0;
      }
    }
    else
    {

      v11 = v6;
    }
    [WeakRetained dismissViewControllerAnimated:1 completion:v11];
  }
}

@end