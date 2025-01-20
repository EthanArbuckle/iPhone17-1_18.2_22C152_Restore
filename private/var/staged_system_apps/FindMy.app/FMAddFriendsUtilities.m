@interface FMAddFriendsUtilities
+ (id)alertPresenterViewController;
+ (id)sharedInstance;
+ (void)showGenericErrorAlert;
+ (void)showNotifySelfError;
+ (void)showOfferSuccessForHandles:(id)a3;
+ (void)showOfferToSelfError;
+ (void)showOfferToSelfErrorInViewController:(id)a3 completion:(id)a4;
+ (void)showSimpleAlertWithTitle:(id)a3 message:(id)a4;
+ (void)showSimpleAlertWithTitle:(id)a3 message:(id)a4 handler:(id)a5;
+ (void)showSimpleAlertWithTitle:(id)a3 message:(id)a4 okButtonTitle:(id)a5;
+ (void)showSimpleAlertWithTitle:(id)a3 message:(id)a4 okButtonTitle:(id)a5 sender:(id)a6;
+ (void)showSimpleAlertWithTitle:(id)a3 message:(id)a4 okButtonTitle:(id)a5 sender:(id)a6 handler:(id)a7;
+ (void)showSimpleAlertWithTitle:(id)a3 message:(id)a4 sender:(id)a5;
- (UIAlertController)shareActionsheet;
- (id)showOfferActionSheetInViewController:(id)a3 popoverAnchoredAtView:(id)a4 orAnchoredOnBarButtonItem:(id)a5 fromEmail:(id)a6 withCompletion:(id)a7 cancelHandler:(id)a8 showAlert:(BOOL)a9;
- (id)showOfferAlertInViewController:(id)a3 withTitle:(id)a4 message:(id)a5 popoverAnchoredAtView:(id)a6 orAnchoredOnBarButtonItem:(id)a7 withCompletion:(id)a8 cancelHandler:(id)a9 showAlert:(BOOL)a10;
- (id)showOfferAlertStyleInViewController:(id)a3 withTitle:(id)a4 message:(id)a5 popoverAnchoredAtView:(id)a6 orAnchoredOnBarButtonItem:(id)a7 withCompletion:(id)a8 cancelButtonTitle:(id)a9 cancelHandler:(id)a10 withStyle:(int64_t)a11 showAlert:(BOOL)a12;
- (id)showStopOfferActionSheetInViewController:(id)a3 popoverAnchoredAtView:(id)a4 orAnchoredOnBarButtonItem:(id)a5 completion:(id)a6;
- (void)dismissShareActionSheet;
- (void)setShareActionsheet:(id)a3;
@end

@implementation FMAddFriendsUtilities

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006AC70;
  block[3] = &unk_10061EC30;
  block[4] = a1;
  if (qword_1006C26A8 != -1) {
    dispatch_once(&qword_1006C26A8, block);
  }
  v2 = (void *)qword_1006C26A0;

  return v2;
}

- (id)showOfferAlertInViewController:(id)a3 withTitle:(id)a4 message:(id)a5 popoverAnchoredAtView:(id)a6 orAnchoredOnBarButtonItem:(id)a7 withCompletion:(id)a8 cancelHandler:(id)a9 showAlert:(BOOL)a10
{
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  v24 = sub_10006AB54(@"DONT_SHARE_BUTTON_TITLE");
  LOBYTE(v27) = a10;
  v25 = [(FMAddFriendsUtilities *)self showOfferAlertStyleInViewController:v23 withTitle:v22 message:v21 popoverAnchoredAtView:v20 orAnchoredOnBarButtonItem:v19 withCompletion:v18 cancelButtonTitle:v24 cancelHandler:v17 withStyle:1 showAlert:v27];

  return v25;
}

- (id)showOfferActionSheetInViewController:(id)a3 popoverAnchoredAtView:(id)a4 orAnchoredOnBarButtonItem:(id)a5 fromEmail:(id)a6 withCompletion:(id)a7 cancelHandler:(id)a8 showAlert:(BOOL)a9
{
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = sub_10006AB54(@"SHARING_FROM");
  id v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v17);

  id v23 = sub_10006AB54(@"CANCEL_BUTTON_TITLE");
  LOBYTE(v26) = a9;
  v24 = [(FMAddFriendsUtilities *)self showOfferAlertStyleInViewController:v20 withTitle:0 message:v22 popoverAnchoredAtView:v19 orAnchoredOnBarButtonItem:v18 withCompletion:v16 cancelButtonTitle:v23 cancelHandler:v15 withStyle:0 showAlert:v26];

  return v24;
}

- (id)showOfferAlertStyleInViewController:(id)a3 withTitle:(id)a4 message:(id)a5 popoverAnchoredAtView:(id)a6 orAnchoredOnBarButtonItem:(id)a7 withCompletion:(id)a8 cancelButtonTitle:(id)a9 cancelHandler:(id)a10 withStyle:(int64_t)a11 showAlert:(BOOL)a12
{
  id v40 = a3;
  unint64_t v38 = (unint64_t)a6;
  unint64_t v36 = (unint64_t)a7;
  id v17 = a8;
  id v18 = a10;
  id v37 = a9;
  id v19 = +[UIAlertController alertControllerWithTitle:a4 message:a5 preferredStyle:a11];
  id v20 = sub_10006AB54(@"SHARE_ONE_HOUR_BUTTON_TITLE");
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10006B2F4;
  v47[3] = &unk_10061EC58;
  id v21 = v17;
  id v48 = v21;
  uint64_t v22 = +[UIAlertAction actionWithTitle:v20 style:0 handler:v47];

  id v23 = sub_10006AB54(@"SHARE_EOD_BUTTON_TITLE");
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_10006B310;
  v45[3] = &unk_10061EC58;
  id v24 = v21;
  id v46 = v24;
  v25 = +[UIAlertAction actionWithTitle:v23 style:0 handler:v45];

  uint64_t v26 = sub_10006AB54(@"SHARE_FOREVER_BUTTON_TITLE");
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10006B32C;
  v43[3] = &unk_10061EC58;
  id v27 = v24;
  id v44 = v27;
  v28 = +[UIAlertAction actionWithTitle:v26 style:0 handler:v43];

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10006B348;
  v41[3] = &unk_10061EC58;
  id v42 = v18;
  id v29 = v18;
  v30 = +[UIAlertAction actionWithTitle:v37 style:1 handler:v41];

  v31 = (void *)v22;
  [v19 addAction:v22];
  [v19 addAction:v25];
  [v19 addAction:v28];
  [v19 addAction:v30];
  if (!(v38 | v36))
  {
    [(FMAddFriendsUtilities *)self setShareActionsheet:0];
    goto LABEL_9;
  }
  v32 = [v19 popoverPresentationController];
  v33 = v32;
  if (v36)
  {
    [v32 setBarButtonItem:v36];
    uint64_t v34 = 1;
LABEL_7:
    [v33 setPermittedArrowDirections:v34];
    goto LABEL_8;
  }
  if (v38)
  {
    [v32 setSourceView:v38];
    [(id)v38 bounds];
    [v33 setSourceRect:];
    uint64_t v34 = 15;
    goto LABEL_7;
  }
LABEL_8:
  [(FMAddFriendsUtilities *)self setShareActionsheet:v19];

LABEL_9:
  if (a12) {
    [v40 presentViewController:v19 animated:1 completion:0];
  }

  return v19;
}

- (id)showStopOfferActionSheetInViewController:(id)a3 popoverAnchoredAtView:(id)a4 orAnchoredOnBarButtonItem:(id)a5 completion:(id)a6
{
  id v9 = a3;
  unint64_t v10 = (unint64_t)a4;
  unint64_t v11 = (unint64_t)a5;
  id v12 = a6;
  v13 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
  v14 = sub_10006AB54(@"CANCEL_BUTTON_TITLE");
  id v15 = +[UIAlertAction actionWithTitle:v14 style:1 handler:0];
  [v13 addAction:v15];

  id v16 = sub_10006AB54(@"STOP_SHARE_LOCATION_BUTTON_TITLE");
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10006B574;
  v22[3] = &unk_10061EC58;
  id v23 = v12;
  id v17 = v12;
  id v18 = +[UIAlertAction actionWithTitle:v16 style:2 handler:v22];
  [v13 addAction:v18];

  if (v10 | v11)
  {
    id v19 = [v13 popoverPresentationController];
    id v20 = v19;
    if (v11)
    {
      [v19 setBarButtonItem:v11];
      [v20 setPermittedArrowDirections:1];
    }
    else if (v10)
    {
      [v19 setSourceView:v10];
      [(id)v10 bounds];
      [v20 setSourceRect:];
    }
    [v20 setPermittedArrowDirections:2];
  }
  [v9 presentViewController:v13 animated:1 completion:0];

  return v13;
}

- (void)dismissShareActionSheet
{
  id v2 = [(FMAddFriendsUtilities *)self shareActionsheet];
  [v2 dismissViewControllerAnimated:0 completion:0];
}

+ (id)alertPresenterViewController
{
  id v2 = +[UIApplication sharedApplication];
  v3 = [v2 keyWindow];
  v4 = [v3 rootViewController];

  v5 = [v4 presentedViewController];

  if (v5)
  {
    do
    {
      v6 = [v4 presentedViewController];

      v7 = [v6 presentedViewController];

      v4 = v6;
    }
    while (v7);
  }
  else
  {
    v6 = v4;
  }

  return v6;
}

+ (void)showOfferToSelfErrorInViewController:(id)a3 completion:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  v7 = sub_10006AB54(@"OFFER_TO_SELF_TITLE");
  v8 = sub_10006AB54(@"OFFER_TO_SELF_MESSAGE");
  id v9 = +[UIAlertController alertControllerWithTitle:v7 message:v8 preferredStyle:1];

  unint64_t v10 = sub_10006AB54(@"OK_BUTTON_TITLE");
  unint64_t v11 = +[UIAlertAction actionWithTitle:v10 style:0 handler:0];
  [v9 addAction:v11];

  if (v13)
  {
    [v13 presentViewController:v9 animated:1 completion:v6];
  }
  else
  {
    id v12 = [a1 alertPresenterViewController];
    [v12 presentViewController:v9 animated:1 completion:v6];
  }
}

+ (void)showOfferToSelfError
{
}

+ (void)showNotifySelfError
{
  v3 = sub_10006AB54(@"NOTIFY_SELF_TITLE");
  v4 = sub_10006AB54(@"NOTIFY_SELF_MESSAGE");
  id v8 = +[UIAlertController alertControllerWithTitle:v3 message:v4 preferredStyle:1];

  v5 = sub_10006AB54(@"OK_BUTTON_TITLE");
  id v6 = +[UIAlertAction actionWithTitle:v5 style:0 handler:0];
  [v8 addAction:v6];

  v7 = [a1 alertPresenterViewController];
  [v7 presentViewController:v8 animated:1 completion:0];
}

+ (void)showGenericErrorAlert
{
  v3 = sub_10006AB54(@"GENERIC_ERROR_ALERT_TITLE");
  v4 = sub_10006AB54(@"GENERIC_ERROR_ALERT_TEXT");
  id v8 = +[UIAlertController alertControllerWithTitle:v3 message:v4 preferredStyle:1];

  v5 = sub_10006AB54(@"OK_BUTTON_TITLE");
  id v6 = +[UIAlertAction actionWithTitle:v5 style:0 handler:0];
  [v8 addAction:v6];

  v7 = [a1 alertPresenterViewController];
  [v7 presentViewController:v8 animated:1 completion:0];
}

+ (void)showSimpleAlertWithTitle:(id)a3 message:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  sub_10006AB54(@"OK_BUTTON_TITLE");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [a1 alertPresenterViewController];
  [a1 showSimpleAlertWithTitle:v7 message:v6 okButtonTitle:v9 sender:v8];
}

+ (void)showSimpleAlertWithTitle:(id)a3 message:(id)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  sub_10006AB54(@"OK_BUTTON_TITLE");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v11 = [a1 alertPresenterViewController];
  [a1 showSimpleAlertWithTitle:v10 message:v9 okButtonTitle:v12 sender:v11 handler:v8];
}

+ (void)showSimpleAlertWithTitle:(id)a3 message:(id)a4 okButtonTitle:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [a1 alertPresenterViewController];
  [a1 showSimpleAlertWithTitle:v10 message:v9 okButtonTitle:v8 sender:v11];
}

+ (void)showSimpleAlertWithTitle:(id)a3 message:(id)a4 sender:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  sub_10006AB54(@"OK_BUTTON_TITLE");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [a1 showSimpleAlertWithTitle:v10 message:v9 okButtonTitle:v11 sender:v8];
}

+ (void)showSimpleAlertWithTitle:(id)a3 message:(id)a4 okButtonTitle:(id)a5 sender:(id)a6
{
}

+ (void)showSimpleAlertWithTitle:(id)a3 message:(id)a4 okButtonTitle:(id)a5 sender:(id)a6 handler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v14)
  {
    if ([v14 isBeingDismissed])
    {
      uint64_t v16 = [v14 presentingViewController];

      id v14 = (id)v16;
    }
    if ([v11 length] || objc_msgSend(v12, "length"))
    {
      id v17 = +[UIApplication sharedApplication];
      id v18 = [v17 preferredContentSizeCategory];
      BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v18);

      if (IsAccessibilityCategory)
      {
        uint64_t v20 = [v11 stringByReplacingOccurrencesOfString:@" " withString:@" "];

        uint64_t v21 = [v12 stringByReplacingOccurrencesOfString:@" " withString:@" "];

        id v12 = (id)v21;
        id v11 = (id)v20;
      }
      uint64_t v22 = +[UIAlertController alertControllerWithTitle:v11 message:v12 preferredStyle:1];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10006BE98;
      v24[3] = &unk_10061EC58;
      id v25 = v15;
      id v23 = +[UIAlertAction actionWithTitle:v13 style:0 handler:v24];
      [v22 addAction:v23];

      [v14 presentViewController:v22 animated:1 completion:0];
    }
  }
}

+ (void)showOfferSuccessForHandles:(id)a3
{
  id v12 = a3;
  id v4 = [v12 count];
  v5 = v12;
  if (v4)
  {
    if ([v12 count] == (id)1)
    {
      id v6 = [v12 firstObject];
      id v7 = +[FMContactsUtilities contactFor:v6];
      if (!v7
        || (+[FMCoreBridge displayNameFor:v7],
            (id v8 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        if (+[FMPhoneNumberUtil isEmailValidWithEmail:](_TtC6FindMy17FMPhoneNumberUtil, "isEmailValidWithEmail:", v6)|| !+[FMPhoneNumberUtil isPhoneNumberValidWithPhoneNumber:v6])
        {
          id v9 = v6;
        }
        else
        {
          id v9 = +[FMPhoneNumberUtil formatWithPhoneNumber:v6];
        }
        id v8 = v9;
      }
      id v11 = sub_10006AB54(@"OFFER_SUCCESS");
      id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v8);
    }
    else
    {
      id v6 = sub_10006AB54(@"OFFER_SUCCESS_MULTIPLE_FRIENDS");
      id v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v12 count]);
      id v8 = +[NSNumberFormatter localizedStringFromNumber:v7 numberStyle:0];
      id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v8);
    }

    [a1 showSimpleAlertWithTitle:v10 message:0];
    v5 = v12;
  }
}

- (UIAlertController)shareActionsheet
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shareActionsheet);

  return (UIAlertController *)WeakRetained;
}

- (void)setShareActionsheet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end