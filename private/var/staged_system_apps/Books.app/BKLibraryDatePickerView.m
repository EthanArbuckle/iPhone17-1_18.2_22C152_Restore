@interface BKLibraryDatePickerView
- (BKLibraryDatePickerView)initWithTitle:(id)a3;
- (SEL)action;
- (UIDatePicker)picker;
- (UIViewController)presentingViewController;
- (id)completionBlock;
- (void)cancelPressed;
- (void)donePressed;
- (void)setAction:(SEL)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setPicker:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation BKLibraryDatePickerView

- (BKLibraryDatePickerView)initWithTitle:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)UIToolbar);
  [v5 setBarStyle:0];
  v6 = +[UIColor blackColor];
  [v5 setTintColor:v6];

  [v5 setAutoresizingMask:2];
  id v7 = objc_alloc_init((Class)UILabel);
  [v7 setText:v4];

  [v7 sizeToFit];
  id v8 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"cancelPressed"];
  id v9 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"donePressed"];
  id v10 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
  id v11 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
  id v12 = objc_alloc_init((Class)UIBarButtonItem);
  [v12 setCustomView:v7];
  v13 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v8, v10, v12, v11, v9, 0);
  [v5 setItems:v13];

  [v5 sizeToFit];
  id v14 = objc_alloc_init((Class)UIDatePicker);
  [v14 setAutoresizingMask:58];
  [v14 setDatePickerMode:1];
  [v14 sizeToFit];
  [v5 frame];
  double v16 = v15;
  double v18 = v17;
  CGFloat v20 = v19;
  double v22 = v21;
  [v14 frame];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  v34.origin.x = v16;
  v34.origin.y = v18;
  v34.size.width = v20;
  v34.size.height = v22;
  double Height = CGRectGetHeight(v34);
  [v5 setFrame:v16, v18, v26, v22];
  [v14 setFrame:v24 Height:v26 v28];
  v35.origin.x = v16;
  v35.origin.y = v18;
  v35.size.width = v26;
  v35.size.height = v22;
  v37.origin.x = v24;
  v37.origin.y = Height;
  v37.size.width = v26;
  v37.size.height = v28;
  CGRect v36 = CGRectUnion(v35, v37);
  v33.receiver = self;
  v33.super_class = (Class)BKLibraryDatePickerView;
  v30 = -[BKLibraryDatePickerView initWithFrame:](&v33, "initWithFrame:", v36.origin.x, v36.origin.y, v36.size.width, v36.size.height);
  if (v30)
  {
    v31 = +[UIColor clearColor];
    [(BKLibraryDatePickerView *)v30 setBackgroundColor:v31];

    objc_storeStrong((id *)&v30->_picker, v14);
    [(BKLibraryDatePickerView *)v30 addSubview:v30->_picker];
    [(BKLibraryDatePickerView *)v30 addSubview:v5];
    [(BKLibraryDatePickerView *)v30 setAutoresizesSubviews:1];
    [(BKLibraryDatePickerView *)v30 setAutoresizingMask:58];
  }

  return v30;
}

- (void)donePressed
{
  v3 = [(BKLibraryDatePickerView *)self completionBlock];

  if (v3)
  {
    id v4 = [(BKLibraryDatePickerView *)self completionBlock];
    id v5 = [(BKLibraryDatePickerView *)self picker];
    v6 = [v5 date];
    ((void (**)(void, void *))v4)[2](v4, v6);
  }
  id v7 = [(BKLibraryDatePickerView *)self presentingViewController];
  [v7 dismissViewControllerAnimated:1 completion:0];
}

- (void)cancelPressed
{
  id v2 = [(BKLibraryDatePickerView *)self presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (UIDatePicker)picker
{
  return self->_picker;
}

- (void)setPicker:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void)setAction:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_action = v3;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  self->_presentingViewController = (UIViewController *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);

  objc_storeStrong((id *)&self->_picker, 0);
}

@end