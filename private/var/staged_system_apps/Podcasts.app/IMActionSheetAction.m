@interface IMActionSheetAction
- (NSArray)actions;
- (NSAttributedString)attributedMessageForAlertController;
- (NSString)messageForAlertController;
- (NSString)titleForAlertController;
- (UIAlertController)alertController;
- (UIBarButtonItem)buttonItem;
- (UIButton)button;
- (id)titleForAlertControllerBlock;
- (id)titleForCancelAction;
- (void)dealloc;
- (void)dismissActionSheet;
- (void)setAlertController:(id)a3;
- (void)setAttributedMessageForAlertController:(id)a3;
- (void)setButton:(id)a3;
- (void)setButtonItem:(id)a3;
- (void)setMessageForAlertController:(id)a3;
- (void)setTitleForAlertController:(id)a3;
- (void)setTitleForAlertControllerBlock:(id)a3;
- (void)showActionSheetWithActions:(id)a3 fromButton:(id)a4;
- (void)updateActionSheet;
@end

@implementation IMActionSheetAction

- (void)dealloc
{
  [(IMActionSheetAction *)self dismissActionSheet];
  v3.receiver = self;
  v3.super_class = (Class)IMActionSheetAction;
  [(IMActionSheetAction *)&v3 dealloc];
}

- (UIButton)button
{
  button = self->_button;
  if (!button)
  {
    v7.receiver = self;
    v7.super_class = (Class)IMActionSheetAction;
    v4 = [(IMAction *)&v7 button];
    v5 = self->_button;
    self->_button = v4;

    button = self->_button;
  }

  return button;
}

- (void)setButton:(id)a3
{
  v5 = (UIButton *)a3;
  button = self->_button;
  if (button != v5)
  {
    v10 = v5;
    if (button)
    {
      buttonItem = self->_buttonItem;
      if (buttonItem)
      {
        v8 = [(UIBarButtonItem *)buttonItem customView];
        v9 = self->_button;

        if (v8 == v9) {
          [(IMActionSheetAction *)self setButtonItem:0];
        }
      }
    }
    objc_storeStrong((id *)&self->_button, a3);
    v5 = v10;
  }
}

- (UIBarButtonItem)buttonItem
{
  buttonItem = self->_buttonItem;
  if (!buttonItem)
  {
    v7.receiver = self;
    v7.super_class = (Class)IMActionSheetAction;
    v4 = [(IMAction *)&v7 buttonItem];
    v5 = self->_buttonItem;
    self->_buttonItem = v4;

    buttonItem = self->_buttonItem;
  }

  return buttonItem;
}

- (void)setAlertController:(id)a3
{
  v5 = (UIAlertController *)a3;
  alertController = self->_alertController;
  if (alertController != v5)
  {
    objc_super v7 = alertController;
    v8 = [(UIAlertController *)v7 popoverPresentationController];
    [v8 setDelegate:0];

    v9 = [(UIAlertController *)v7 presentingViewController];

    if (v9)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100094560;
      block[3] = &unk_10054D570;
      v12 = v7;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    objc_storeStrong((id *)&self->_alertController, a3);
    v10 = [(UIAlertController *)self->_alertController popoverPresentationController];
    [v10 setDelegate:self];
  }
}

- (void)showActionSheetWithActions:(id)a3 fromButton:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_actions, a3);
  uint64_t v9 = [(IMActionSheetAction *)self titleForAlertController];
  v29 = self;
  [(IMActionSheetAction *)self messageForAlertController];
  v28 = v30 = (void *)v9;
  v10 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v9);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v7;
  id v11 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v16 = [v15 title];
        id v17 = [v16 length];

        if (v17)
        {
          if ([v15 isDestructive]) {
            uint64_t v18 = 2;
          }
          else {
            uint64_t v18 = 0;
          }
          v19 = [v15 title];
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472;
          v32[2] = sub_100094948;
          v32[3] = &unk_10054F290;
          v32[4] = v15;
          id v33 = v8;
          v20 = +[UIAlertAction actionWithTitle:v19 style:v18 handler:v32];

          [v10 addAction:v20];
        }
      }
      id v12 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v12);
  }

  v21 = [(IMActionSheetAction *)v29 attributedMessageForAlertController];
  if (v21) {
    [v10 _setAttributedMessage:v21];
  }
  v22 = [(IMActionSheetAction *)v29 titleForCancelAction];
  v23 = +[UIAlertAction actionWithTitle:v22 style:1 handler:0];
  [v10 addAction:v23];

  [(IMPopoverPresentationAction *)v29 setPresentingButton:v8];
  [(IMActionSheetAction *)v29 setAlertController:v10];
  v24 = [(IMAction *)v29 controller];
  v25 = [v24 delegate];

  [v25 presentViewController:v10 animated:1 completion:0];
  v26 = [v10 popoverPresentationController];
  [v26 setDelegate:v29];

  v27 = [v10 popoverPresentationController];
  [(IMPopoverPresentationAction *)v29 prepareForPopoverPresentation:v27];
}

- (void)dismissActionSheet
{
}

- (void)updateActionSheet
{
  objc_super v3 = [(IMActionSheetAction *)self alertController];
  uint64_t v4 = [v3 presentingViewController];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [v3 presentationController];
    if ([v6 presentationStyle] == (id)7)
    {
      id v7 = [v3 transitionCoordinator];

      if (!v7)
      {
        objc_initWeak(&location, self);
        id v8 = [v3 presentingViewController];
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_100094B80;
        v9[3] = &unk_10054E8E0;
        objc_copyWeak(&v10, &location);
        [v8 dismissViewControllerAnimated:0 completion:v9];

        objc_destroyWeak(&v10);
        objc_destroyWeak(&location);
      }
    }
    else
    {
    }
  }
}

- (NSString)titleForAlertController
{
  objc_super v3 = self->_titleForAlertController;
  uint64_t v4 = [(IMActionSheetAction *)self titleForAlertControllerBlock];

  if (v4)
  {
    v5 = [(IMActionSheetAction *)self titleForAlertControllerBlock];
    uint64_t v6 = ((void (**)(void, IMActionSheetAction *))v5)[2](v5, self);

    objc_super v3 = (NSString *)v6;
  }

  return v3;
}

- (id)titleForCancelAction
{
  v2 = +[NSBundle mainBundle];
  objc_super v3 = [v2 localizedStringForKey:@"Cancel" value:&stru_10056A8A0 table:0];

  return v3;
}

- (void)setButtonItem:(id)a3
{
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setTitleForAlertController:(id)a3
{
}

- (id)titleForAlertControllerBlock
{
  return self->_titleForAlertControllerBlock;
}

- (void)setTitleForAlertControllerBlock:(id)a3
{
}

- (NSString)messageForAlertController
{
  return self->_messageForAlertController;
}

- (void)setMessageForAlertController:(id)a3
{
}

- (NSAttributedString)attributedMessageForAlertController
{
  return self->_attributedMessageForAlertController;
}

- (void)setAttributedMessageForAlertController:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_attributedMessageForAlertController, 0);
  objc_storeStrong((id *)&self->_messageForAlertController, 0);
  objc_storeStrong(&self->_titleForAlertControllerBlock, 0);
  objc_storeStrong((id *)&self->_titleForAlertController, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_buttonItem, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

@end