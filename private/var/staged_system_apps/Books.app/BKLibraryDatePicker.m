@interface BKLibraryDatePicker
+ (void)pickDate:(id)a3 title:(id)a4 presentingViewController:(id)a5 sourceRect:(CGRect)a6 completion:(id)a7;
@end

@implementation BKLibraryDatePicker

+ (void)pickDate:(id)a3 title:(id)a4 presentingViewController:(id)a5 sourceRect:(CGRect)a6 completion:(id)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v22 = objc_alloc_init((Class)UIViewController);
  v16 = [[BKLibraryDatePickerView alloc] initWithTitle:v15];

  [(BKLibraryDatePickerView *)v16 setPresentingViewController:v14];
  [(BKLibraryDatePickerView *)v16 setCompletionBlock:v13];

  [v22 setView:v16];
  [(BKLibraryDatePickerView *)v16 bounds];
  [v22 setPreferredContentSize:v17, v18];
  [v22 setModalPresentationStyle:7];
  v19 = [v14 view];
  v20 = [v22 popoverPresentationController];
  [v20 setSourceView:v19];

  v21 = [v22 popoverPresentationController];
  [v21 setSourceRect:x, y, width, height];

  [v14 presentViewController:v22 animated:1 completion:0];
}

@end