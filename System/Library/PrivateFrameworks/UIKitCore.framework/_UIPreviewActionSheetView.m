@interface _UIPreviewActionSheetView
- (NSArray)actions;
- (NSString)title;
- (UIEdgeInsets)contentInsets;
- (UILongPressGestureRecognizer)captureTouchesRecognizer;
- (_UIPreviewActionSheetView)initWithCoder:(id)a3;
- (_UIPreviewActionSheetView)initWithFrame:(CGRect)a3;
- (_UIPreviewActionSheetView)initWithFrame:(CGRect)a3 title:(id)a4 items:(id)a5 contentInsets:(UIEdgeInsets)a6;
- (_UIPreviewActionSheetViewDelegate)delegate;
- (id)completionHandler;
- (void)_performActionForPreviewAction:(id)a3 interfaceAction:(id)a4;
- (void)_setupViewHierarchy;
- (void)setActions:(id)a3;
- (void)setCaptureTouchesRecognizer:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _UIPreviewActionSheetView

- (_UIPreviewActionSheetView)initWithFrame:(CGRect)a3 title:(id)a4 items:(id)a5 contentInsets:(UIEdgeInsets)a6
{
  CGFloat right = a6.right;
  CGFloat bottom = a6.bottom;
  CGFloat left = a6.left;
  CGFloat top = a6.top;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v17 = a4;
  id v18 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_UIPreviewActionSheetView;
  v19 = -[UIView initWithFrame:](&v22, sel_initWithFrame_, x, y, width, height);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_actions, a5);
    objc_storeStrong((id *)&v20->_title, a4);
    v20->_contentInsets.CGFloat top = top;
    v20->_contentInsets.CGFloat left = left;
    v20->_contentInsets.CGFloat bottom = bottom;
    v20->_contentInsets.CGFloat right = right;
    [(_UIPreviewActionSheetView *)v20 _setupViewHierarchy];
  }

  return v20;
}

- (_UIPreviewActionSheetView)initWithFrame:(CGRect)a3
{
  return -[_UIPreviewActionSheetView initWithFrame:title:items:contentInsets:](self, "initWithFrame:title:items:contentInsets:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0, 0.0, 0.0, 0.0);
}

- (_UIPreviewActionSheetView)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewActionSheetView;
  return [(UIView *)&v4 initWithCoder:a3];
}

- (void)_setupViewHierarchy
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v2 = [(_UIPreviewActionSheetView *)self actions];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    [(UIView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_initWeak(&location, self);
    objc_super v4 = (void *)MEMORY[0x1E4F1CA48];
    v5 = [(_UIPreviewActionSheetView *)self actions];
    v54 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v6 = [(_UIPreviewActionSheetView *)self actions];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v57 objects:v66 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v58 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          uint64_t v11 = [v10 style];
          v12 = [v10 title];
          v55[0] = MEMORY[0x1E4F143A8];
          v55[1] = 3221225472;
          v55[2] = __48___UIPreviewActionSheetView__setupViewHierarchy__block_invoke;
          v55[3] = &unk_1E53001C8;
          objc_copyWeak(&v56, &location);
          v55[4] = v10;
          v13 = +[UIInterfaceAction actionWithTitle:v12 type:2 * (v11 == 2) handler:v55];

          if ([v10 style] == 1) {
            +[UIPreviewAction _checkmarkImage];
          }
          else {
          v14 = [v10 image];
          }
          [v13 setTrailingImage:v14];
          v15 = [v10 _color];
          [v13 _setTitleTextColor:v15];

          v16 = [v10 _color];
          [v13 _setImageTintColor:v16];

          [v54 addObject:v13];
          objc_destroyWeak(&v56);
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v57 objects:v66 count:16];
      }
      while (v7);
    }

    id v17 = +[UIInterfaceActionGroup actionGroupWithActions:v54];
    id v18 = [[UIInterfaceActionGroupView alloc] initWithActionGroup:v17 actionHandlerInvocationDelegate:0];
    [(UIInterfaceActionGroupView *)v18 setPresentationStyle:1];
    [(UIView *)v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self bounds];
    -[UIInterfaceActionGroupView setFrame:](v18, "setFrame:");
    [(UIView *)self addSubview:v18];
    LODWORD(v19) = 1148846080;
    LODWORD(v20) = 1132068864;
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v18, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", 0.0, 0.0, v19, v20);
    double v22 = v21;
    [(UIView *)self bounds];
    double Width = CGRectGetWidth(v68);
    [(_UIPreviewActionSheetView *)self contentInsets];
    double v25 = v24;
    [(_UIPreviewActionSheetView *)self contentInsets];
    double v27 = v26;
    [(UIView *)self bounds];
    double Height = CGRectGetHeight(v69);
    [(_UIPreviewActionSheetView *)self contentInsets];
    double v30 = v29;
    [(_UIPreviewActionSheetView *)self contentInsets];
    double v32 = Height - (v30 + v31);
    double v33 = fabs(v22);
    if (v22 < v32 && v33 > 2.22044605e-16) {
      double v32 = v22;
    }
    v64[0] = @"height";
    v35 = objc_msgSend(NSNumber, "numberWithDouble:", v32, v33);
    v65[0] = v35;
    v64[1] = @"width";
    v36 = [NSNumber numberWithDouble:Width - (v25 + v27)];
    v65[1] = v36;
    v64[2] = @"left";
    v37 = NSNumber;
    [(_UIPreviewActionSheetView *)self contentInsets];
    v39 = [v37 numberWithDouble:v38];
    v65[2] = v39;
    v64[3] = @"right";
    v40 = NSNumber;
    [(_UIPreviewActionSheetView *)self contentInsets];
    v42 = [v40 numberWithDouble:v41];
    v65[3] = v42;
    v64[4] = @"top";
    v43 = NSNumber;
    [(_UIPreviewActionSheetView *)self contentInsets];
    v44 = objc_msgSend(v43, "numberWithDouble:");
    v65[4] = v44;
    v64[5] = @"bottom";
    v45 = NSNumber;
    [(_UIPreviewActionSheetView *)self contentInsets];
    v47 = [v45 numberWithDouble:v46];
    v65[5] = v47;
    v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:6];

    v62 = @"groupView";
    v63 = v18;
    v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v51 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"H:|-(left)-[groupView(==width)]-(right)-|" options:0 metrics:v48 views:v49];
    [v50 addObjectsFromArray:v51];

    v52 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"V:|-(top)-[groupView(==height)]-(bottom)-|" options:0 metrics:v48 views:v49];
    [v50 addObjectsFromArray:v52];

    [MEMORY[0x1E4F5B268] activateConstraints:v50];
    objc_destroyWeak(&location);
  }
}

- (void)_performActionForPreviewAction:(id)a3 interfaceAction:(id)a4
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || [WeakRetained previewActionSheetCanSelectItem:self])
  {
    v6 = [(_UIPreviewActionSheetView *)self completionHandler];

    if (v6)
    {
      uint64_t v7 = [(_UIPreviewActionSheetView *)self completionHandler];
      ((void (**)(void, id))v7)[2](v7, v8);
    }
  }
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (_UIPreviewActionSheetViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIPreviewActionSheetViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UILongPressGestureRecognizer)captureTouchesRecognizer
{
  return self->_captureTouchesRecognizer;
}

- (void)setCaptureTouchesRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureTouchesRecognizer, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end