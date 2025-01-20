@interface _UITextItemActionSheet
- (BOOL)_hasAlertActions;
- (CGRect)initialPresentationRectInHostViewForSheet:(id)a3;
- (CGRect)presentationRectInHostViewForSheet:(id)a3;
- (_UITextItemActionSheet)initWithTitle:(id)a3 dataDetectorActions:(id)a4 fromRect:(CGRect)a5 inView:(id)a6;
- (id)_alertActionsWithController:(id)a3;
- (id)hostViewForSheet:(id)a3;
- (void)dealloc;
- (void)present;
@end

@implementation _UITextItemActionSheet

- (_UITextItemActionSheet)initWithTitle:(id)a3 dataDetectorActions:(id)a4 fromRect:(CGRect)a5 inView:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  v27.receiver = self;
  v27.super_class = (Class)_UITextItemActionSheet;
  v17 = [(_UITextItemActionSheet *)&v27 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_title, a3);
    uint64_t v19 = [v15 copy];
    ddActions = v18->_ddActions;
    v18->_ddActions = (NSArray *)v19;

    objc_storeWeak((id *)&v18->_view, v16);
    v21 = [v16 _screen];
    [v21 scale];
    v18->_rect.origin.double x = UIRectIntegralWithScale(x, y, width, height, v22);
    v18->_rect.origin.double y = v23;
    v18->_rect.size.double width = v24;
    v18->_rect.size.double height = v25;
  }
  return v18;
}

- (void)dealloc
{
  [(UIWindow *)self->_alertWindow setHidden:1];
  alertWindow = self->_alertWindow;
  self->_alertWindow = 0;

  v4.receiver = self;
  v4.super_class = (Class)_UITextItemActionSheet;
  [(_UITextItemActionSheet *)&v4 dealloc];
}

- (void)present
{
  p_alertController = &self->_alertController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertController);

  if (!WeakRetained && [(_UITextItemActionSheet *)self _hasAlertActions])
  {
    id obj = (id)objc_opt_new();
    [obj setRotatingSheetDelegate:self];
    [obj setTitle:self->_title];
    v5 = [(_UITextItemActionSheet *)self _alertActionsWithController:obj];
    [obj _setActions:v5];

    if ([obj presentSheet])
    {
      objc_storeWeak((id *)p_alertController, obj);
      objc_setAssociatedObject(obj, &present_keepalive_key, self, (void *)1);
    }
  }
}

- (BOOL)_hasAlertActions
{
  return [(NSArray *)self->_ddActions count] != 0;
}

- (id)_alertActionsWithController:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id val = a3;
  id v18 = [MEMORY[0x1E4F1CA48] array];
  objc_initWeak(&location, val);
  objc_copyWeak(&to, (id *)&self->_view);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = self->_ddActions;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v4)
  {
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __54___UITextItemActionSheet__alertActionsWithController___block_invoke;
        aBlock[3] = &unk_1E52EE918;
        aBlock[4] = v6;
        objc_copyWeak(&v21, &to);
        objc_copyWeak(&v22, &location);
        v7 = _Block_copy(aBlock);
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __54___UITextItemActionSheet__alertActionsWithController___block_invoke_2;
        v19[3] = &unk_1E52DA6B0;
        v19[4] = v6;
        v8 = _Block_copy(v19);
        v9 = [v6 localizedName];
        v10 = [v6 icon];
        v11 = +[UIAlertAction _actionWithTitle:v9 image:v10 style:0 handler:v7 shouldDismissHandler:v8];

        [v18 addObject:v11];
        objc_destroyWeak(&v22);
        objc_destroyWeak(&v21);
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v4);
  }

  if ([v18 count])
  {
    v12 = _UINSLocalizedStringWithDefaultValue(@"Cancel", @"Cancel");
    v13 = +[UIAlertAction actionWithTitle:v12 style:1 handler:&__block_literal_global_217];

    [v18 addObject:v13];
  }
  objc_destroyWeak(&to);
  objc_destroyWeak(&location);

  return v18;
}

- (id)hostViewForSheet:(id)a3
{
  id v4 = a3;
  v5 = [v4 popoverPresentationController];
  if (v5
    && ([v4 presentationController],
        v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 presentationStyle],
        v6,
        v7 == 7)
    || (dyld_program_sdk_at_least() & 1) != 0)
  {
    id WeakRetained = (UIWindow *)objc_loadWeakRetained((id *)&self->_view);
  }
  else
  {
    alertWindow = self->_alertWindow;
    if (!alertWindow)
    {
      v10 = [_UIAlertControllerShimPresenterWindow alloc];
      id v11 = objc_loadWeakRetained((id *)&self->_view);
      v12 = [v11 window];
      v13 = [v12 windowScene];
      id v14 = [(_UIAlertControllerShimPresenterWindow *)v10 initWithWindowScene:v13];
      id v15 = self->_alertWindow;
      self->_alertWindow = v14;

      [(UIWindow *)self->_alertWindow setHidden:0];
      alertWindow = self->_alertWindow;
    }
    [(UIWindow *)alertWindow setWindowLevel:10000002.0];
    id WeakRetained = self->_alertWindow;
  }
  id v16 = WeakRetained;

  return v16;
}

- (CGRect)initialPresentationRectInHostViewForSheet:(id)a3
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)presentationRectInHostViewForSheet:(id)a3
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertWindow, 0);
  objc_destroyWeak((id *)&self->_alertController);
  objc_storeStrong((id *)&self->_ddActions, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_title, 0);
}

@end