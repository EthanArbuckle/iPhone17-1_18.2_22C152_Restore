@interface AENoteEditorViewController
- (AENoteEditorViewControllerDelegate)delegate;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (CGSize)preferredContentSize;
- (UITextView)textView;
- (void)beginEditing;
- (void)endEditing;
- (void)setDelegate:(id)a3;
- (void)setTextView:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
- (void)viewDidLoad;
@end

@implementation AENoteEditorViewController

- (void)beginEditing
{
  id v2 = [(AENoteEditorViewController *)self textView];
  [v2 becomeFirstResponder];
}

- (void)endEditing
{
  id v2 = [(AENoteEditorViewController *)self textView];
  [v2 endEditing:1];
}

- (CGSize)preferredContentSize
{
  double v2 = 310.0;
  double v3 = 205.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)viewDidLoad
{
  v27.receiver = self;
  v27.super_class = (Class)AENoteEditorViewController;
  [(AENoteEditorViewController *)&v27 viewDidLoad];
  double v3 = [(AENoteEditorViewController *)self textView];
  v23 = [(AENoteEditorViewController *)self view];
  [v23 addSubview:v3];
  v4 = [v23 safeAreaLayoutGuide];
  v25 = [v3 leadingAnchor];
  v24 = [v4 leadingAnchor];
  v22 = [v25 constraintEqualToAnchor:v24 constant:14.0];
  v28[0] = v22;
  v21 = [v3 trailingAnchor];
  v20 = [v4 trailingAnchor];
  v5 = [v21 constraintEqualToAnchor:v20 constant:-14.0];
  v28[1] = v5;
  v6 = [v3 topAnchor];
  v7 = [v4 topAnchor];
  v8 = [v6 constraintEqualToAnchor:v7 constant:10.0];
  v28[2] = v8;
  v9 = [v3 bottomAnchor];
  v26 = v4;
  v10 = [v4 bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10 constant:-10.0];
  v28[3] = v11;
  v12 = +[NSArray arrayWithObjects:v28 count:4];
  +[NSLayoutConstraint activateConstraints:v12];

  v13 = [(AENoteEditorViewController *)self delegate];
  v14 = [v13 noteEditorViewControllerAnnotationToEdit:self];
  v15 = [v14 annotationNote];
  [v3 setText:v15];

  [v3 setTextDragOptions:1];
  v16 = [v13 themeForNoteEditorViewController:self];
  v17 = v16;
  if (v16)
  {
    v18 = [v16 noteTextColor];
    [v3 setTextColor:v18];

    v19 = [v17 noteBorderColor];
    [v23 setBackgroundColor:v19];
  }
}

- (UITextView)textView
{
  textView = self->_textView;
  if (!textView)
  {
    v4 = (UITextView *)objc_alloc_init((Class)UITextView);
    v5 = self->_textView;
    self->_textView = v4;

    [(UITextView *)self->_textView setDelegate:self];
    [(UITextView *)self->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextView *)self->_textView setAlwaysBounceVertical:1];
    [(UITextView *)self->_textView setShowsHorizontalScrollIndicator:0];
    [(UITextView *)self->_textView setDelaysContentTouches:0];
    [(UITextView *)self->_textView setCanCancelContentTouches:0];
    [(UITextView *)self->_textView setBouncesZoom:0];
    [(UITextView *)self->_textView setAutocapitalizationType:2];
    v6 = +[UIFont fontWithName:@"Avenir-Roman" size:17.0];
    [(UITextView *)self->_textView setFont:v6];

    [(UITextView *)self->_textView setTextAlignment:4];
    v7 = +[UIColor clearColor];
    [(UITextView *)self->_textView setBackgroundColor:v7];

    textView = self->_textView;
  }

  return textView;
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v16 = a3;
  [v16 selectedRange];
  if (!v3)
  {
    v4 = [v16 layoutManager];
    v5 = [v16 textContainer];
    [v4 ensureLayoutForTextContainer:v5];

    [v16 layoutIfNeeded];
    v6 = [v16 selectedTextRange];
    v7 = [v6 start];
    [v16 caretRectForPosition:v7];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    [v16 scrollRectToVisible:1, v9, v11, v13, v15];
  }
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  id v7 = a5;
  double v8 = [a3 text];
  double v9 = (char *)[v8 length] - length;
  double v10 = (char *)[v7 length];

  return &v10[(void)v9] < (unsigned char *)&loc_186A0 + 1;
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = [(AENoteEditorViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 noteEditorViewControllerDidEndEditing:self];
  }
}

- (void)setTextView:(id)a3
{
}

- (AENoteEditorViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AENoteEditorViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end