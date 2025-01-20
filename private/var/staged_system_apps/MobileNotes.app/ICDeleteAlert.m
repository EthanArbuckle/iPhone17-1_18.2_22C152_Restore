@interface ICDeleteAlert
+ (BOOL)canCancelAlertType:(unint64_t)a3;
+ (BOOL)shouldShowAsAlertWithSender:(id)a3 canCancel:(BOOL)a4;
+ (BOOL)suppressesAlerts;
+ (id)confirmationForAlertType:(unint64_t)a3 count:(unint64_t)a4 sender:(id)a5;
+ (id)messageForAlertType:(unint64_t)a3 count:(unint64_t)a4;
+ (id)titleForAlertType:(unint64_t)a3 count:(unint64_t)a4;
+ (void)setSuppressesAlerts:(BOOL)a3;
+ (void)showAlertForDeletingObjectsWithType:(unint64_t)a3 count:(unint64_t)a4 window:(id)a5 sender:(id)a6 completion:(id)a7;
+ (void)showDeleteAlertWithTitle:(id)a3 message:(id)a4 confirmation:(id)a5 canCancel:(BOOL)a6 window:(id)a7 sender:(id)a8 completion:(id)a9;
@end

@implementation ICDeleteAlert

+ (BOOL)suppressesAlerts
{
  return byte_1006AA138;
}

+ (void)setSuppressesAlerts:(BOOL)a3
{
  byte_1006AA138 = a3;
}

+ (void)showAlertForDeletingObjectsWithType:(unint64_t)a3 count:(unint64_t)a4 window:(id)a5 sender:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v17 = [a1 titleForAlertType:a3 count:a4];
  v15 = [a1 messageForAlertType:a3 count:a4];
  v16 = [a1 confirmationForAlertType:a3 count:a4 sender:v13];
  [a1 showDeleteAlertWithTitle:v17 message:v15 confirmation:v16 canCancel:[self canCancelAlertType:a3] window:v14 sender:v13 completion:v12];
}

+ (void)showDeleteAlertWithTitle:(id)a3 message:(id)a4 confirmation:(id)a5 canCancel:(BOOL)a6 window:(id)a7 sender:(id)a8 completion:(id)a9
{
  BOOL v11 = a6;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  v20 = (void (**)(id, uint64_t))a9;
  if ([(id)objc_opt_class() suppressesAlerts])
  {
    if (v20) {
      v20[2](v20, 1);
    }
  }
  else
  {
    id v35 = v17;
    v21 = +[NSBundle mainBundle];
    v22 = [v21 localizedStringForKey:@"Cancel" value:&stru_10063F3D8 table:0];

    id v36 = v15;
    if ([a1 shouldShowAsAlertWithSender:v19 canCancel:v11])
    {
      v23 = +[ICAlertController alertControllerWithTitle:v15 message:v16 preferredStyle:1];
    }
    else
    {
      v23 = +[ICAlertController alertControllerWithTitle:v16 message:0 preferredStyle:0];
      objc_opt_class();
      v24 = ICDynamicCast();
      objc_opt_class();
      v25 = ICDynamicCast();
      v26 = [v23 popoverPresentationController];
      [v26 setSourceView:v24];

      v27 = [v23 popoverPresentationController];
      [v27 setBarButtonItem:v25];
    }
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_10008AAA8;
    v43[3] = &unk_100625988;
    v28 = v20;
    v44 = v28;
    [v23 setDismissWithoutActionBlock:v43];
    if (v11)
    {
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_10008AABC;
      v40[3] = &unk_1006264F0;
      id v29 = v23;
      id v41 = v29;
      v42 = v28;
      v30 = +[UIAlertAction actionWithTitle:v22 style:1 handler:v40];
      [v29 addAction:v30];

      uint64_t v31 = 2;
    }
    else
    {
      uint64_t v31 = 0;
    }
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10008AB08;
    v37[3] = &unk_1006264F0;
    id v38 = v23;
    v39 = v28;
    id v32 = v23;
    v33 = +[UIAlertAction actionWithTitle:v35 style:v31 handler:v37];
    [v32 addAction:v33];
    v34 = [v18 rootViewController];
    [v34 presentViewController:v32 animated:1 completion:0];

    id v17 = v35;
    id v15 = v36;
  }
}

+ (BOOL)canCancelAlertType:(unint64_t)a3
{
  return a3 != 15;
}

+ (id)titleForAlertType:(unint64_t)a3 count:(unint64_t)a4
{
  v4 = &stru_10063F3D8;
  switch(a3)
  {
    case 0uLL:
    case 4uLL:
    case 8uLL:
      unsigned __int8 v8 = +[ICDeviceSupport deviceIsMac];
      v6 = +[NSBundle mainBundle];
      if (v8) {
        CFStringRef v7 = @"Are you sure you want to delete this shared note?";
      }
      else {
        CFStringRef v7 = @"Delete Shared Note?";
      }
      goto LABEL_27;
    case 1uLL:
    case 2uLL:
    case 5uLL:
    case 6uLL:
    case 9uLL:
      unsigned __int8 v5 = +[ICDeviceSupport deviceIsMac];
      v6 = +[NSBundle mainBundle];
      if (v5) {
        CFStringRef v7 = @"Are you sure you want to delete these shared notes?";
      }
      else {
        CFStringRef v7 = @"Delete Shared Notes?";
      }
      goto LABEL_27;
    case 3uLL:
    case 7uLL:
    case 0xAuLL:
      unsigned __int8 v9 = +[ICDeviceSupport deviceIsMac];
      v6 = +[NSBundle mainBundle];
      if (v9) {
        CFStringRef v7 = @"Are you sure you want to delete this shared folder?";
      }
      else {
        CFStringRef v7 = @"Delete Shared Folder?";
      }
      goto LABEL_27;
    case 0xBuLL:
      unsigned __int8 v10 = +[ICDeviceSupport deviceIsMac];
      v6 = +[NSBundle mainBundle];
      if (v10) {
        CFStringRef v7 = @"Are you sure you want to delete the selected notes?";
      }
      else {
        CFStringRef v7 = @"Delete Notes?";
      }
      goto LABEL_27;
    case 0xCuLL:
      unsigned __int8 v17 = +[ICDeviceSupport deviceIsMac];
      v6 = +[NSBundle mainBundle];
      if (v17) {
        CFStringRef v7 = @"Are you sure you want to delete the selected note?";
      }
      else {
        CFStringRef v7 = @"Delete Note?";
      }
      goto LABEL_27;
    case 0xDuLL:
      unsigned __int8 v11 = +[ICDeviceSupport deviceIsMac];
      v6 = +[NSBundle mainBundle];
      if (v11) {
        CFStringRef v7 = @"Are you sure you want to delete this folder?";
      }
      else {
        CFStringRef v7 = @"Delete Folder?";
      }
LABEL_27:
      id v16 = v6;
      goto LABEL_28;
    case 0xEuLL:
      unsigned __int8 v13 = +[ICDeviceSupport deviceIsMac];
      id v14 = +[NSBundle mainBundle];
      v6 = v14;
      if (v13) {
        CFStringRef v15 = @"Are you sure you want to delete the %lu notes permanently?";
      }
      else {
        CFStringRef v15 = @"Delete %lu Notes?";
      }
      id v18 = [v14 localizedStringForKey:v15 value:&stru_10063F3D8 table:0];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, a4);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_29;
    case 0xFuLL:
      id v16 = +[NSBundle mainBundle];
      v6 = v16;
      CFStringRef v7 = @"Deleted notes are moved to the Recently Deleted folder.";
      goto LABEL_28;
    case 0x11uLL:
      id v16 = +[NSBundle mainBundle];
      v6 = v16;
      CFStringRef v7 = @"Delete Smart Folder?";
LABEL_28:
      v4 = [v16 localizedStringForKey:v7 value:&stru_10063F3D8 table:0];
LABEL_29:

      break;
    default:
      break;
  }

  return v4;
}

+ (id)messageForAlertType:(unint64_t)a3 count:(unint64_t)a4
{
  v4 = 0;
  switch(a3)
  {
    case 0uLL:
    case 8uLL:
      unsigned __int8 v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"If you delete this note, other people will no longer have access to it and it will be deleted from all of their devices.";
      goto LABEL_15;
    case 1uLL:
    case 9uLL:
      unsigned __int8 v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"If you delete these notes, other people will no longer have access to them and they will be deleted from all of their devices.";
      goto LABEL_15;
    case 2uLL:
      unsigned __int8 v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"One or more notes are shared. If you delete these notes, other people will no longer have access to them and they will be deleted from all of their devices.";
      goto LABEL_15;
    case 3uLL:
    case 0xAuLL:
      unsigned __int8 v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"If you delete this folder, other people will no longer have access to it and it will be deleted from all of their devices.";
      goto LABEL_15;
    case 4uLL:
      unsigned __int8 v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"It will be deleted on all of your devices. To reopen the note, click the link you were invited with.";
      goto LABEL_15;
    case 5uLL:
      unsigned __int8 v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"They will be deleted on all of your devices. To reopen the notes, click the links you were invited with.";
      goto LABEL_15;
    case 6uLL:
      unsigned __int8 v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"One or more notes are shared. They will be deleted on all of your devices. To reopen the notes, click the links you were invited with.";
      goto LABEL_15;
    case 7uLL:
      unsigned __int8 v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"It will be deleted from all of your devices. To rejoin this shared folder, click the link you were invited with.";
      goto LABEL_15;
    case 0xDuLL:
      unsigned __int8 v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"All notes and any subfolders will be deleted.";
      goto LABEL_15;
    case 0xEuLL:
      if (+[ICDeviceSupport deviceIsMac])
      {
        unsigned __int8 v5 = +[NSBundle mainBundle];
        v6 = v5;
        CFStringRef v7 = @"You cannot undo this action.";
LABEL_15:
        v4 = [v5 localizedStringForKey:v7 value:&stru_10063F3D8 table:0];
      }
      else
      {
        v6 = +[NSBundle mainBundle];
        unsigned __int8 v10 = [v6 localizedStringForKey:@"These %lu notes will be deleted. This action cannot be undone." value:&stru_10063F3D8 table:0];
        v4 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, a4);
      }
LABEL_17:
      return v4;
    case 0xFuLL:
      unsigned __int8 v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"You can recover or remove from Recently Deleted within 30 days.";
      goto LABEL_15;
    case 0x11uLL:
      unsigned __int8 v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"Deleting this Smart Folder won’t affect its notes, which will remain in their folders.";
      goto LABEL_15;
    default:
      goto LABEL_17;
  }
}

+ (id)confirmationForAlertType:(unint64_t)a3 count:(unint64_t)a4 sender:(id)a5
{
  id v8 = a5;
  id v9 = [a1 canCancelAlertType:a3];
  unsigned __int8 v10 = +[NSBundle mainBundle];
  unsigned __int8 v11 = v10;
  if (v9) {
    CFStringRef v12 = @"Delete";
  }
  else {
    CFStringRef v12 = @"OK";
  }
  unsigned __int8 v13 = [v10 localizedStringForKey:v12 value:&stru_10063F3D8 table:0];

  unsigned int v14 = [a1 shouldShowAsAlertWithSender:v8 canCancel:v9];
  if (v14 && (+[UIDevice ic_isVision] & 1) == 0)
  {
    a4 = v13;
  }
  else
  {
    switch(a3)
    {
      case 0uLL:
      case 4uLL:
      case 8uLL:
        CFStringRef v15 = +[NSBundle mainBundle];
        id v16 = v15;
        CFStringRef v17 = @"Delete Shared Note";
        goto LABEL_18;
      case 1uLL:
      case 2uLL:
      case 5uLL:
      case 6uLL:
      case 9uLL:
        CFStringRef v15 = +[NSBundle mainBundle];
        id v16 = v15;
        CFStringRef v17 = @"Delete Shared Notes";
        goto LABEL_18;
      case 3uLL:
      case 7uLL:
      case 0xAuLL:
        CFStringRef v15 = +[NSBundle mainBundle];
        id v16 = v15;
        CFStringRef v17 = @"Delete Shared Folder";
        goto LABEL_18;
      case 0xBuLL:
        CFStringRef v15 = +[NSBundle mainBundle];
        id v16 = v15;
        CFStringRef v17 = @"Delete Notes";
        goto LABEL_18;
      case 0xCuLL:
        CFStringRef v15 = +[NSBundle mainBundle];
        id v16 = v15;
        CFStringRef v17 = @"Delete Note";
        goto LABEL_18;
      case 0xDuLL:
        CFStringRef v15 = +[NSBundle mainBundle];
        id v16 = v15;
        CFStringRef v17 = @"Delete Folder";
        goto LABEL_18;
      case 0xEuLL:
        id v18 = +[NSBundle mainBundle];
        id v19 = [v18 localizedStringForKey:@"Delete %lu Notes" value:&stru_10063F3D8 table:0];
        a4 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v19, a4);

        break;
      case 0xFuLL:
        CFStringRef v15 = +[NSBundle mainBundle];
        id v16 = v15;
        CFStringRef v17 = @"OK";
        goto LABEL_18;
      case 0x10uLL:
        CFStringRef v15 = +[NSBundle mainBundle];
        id v16 = v15;
        CFStringRef v17 = @"Delete All";
        goto LABEL_18;
      case 0x11uLL:
        CFStringRef v15 = +[NSBundle mainBundle];
        id v16 = v15;
        CFStringRef v17 = @"Delete Smart Folder";
LABEL_18:
        a4 = [v15 localizedStringForKey:v17 value:&stru_10063F3D8 table:0];

        break;
      default:
        break;
    }
  }

  return (id)a4;
}

+ (BOOL)shouldShowAsAlertWithSender:(id)a3 canCancel:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    if (!v4)
    {
      unsigned __int8 v6 = 1;
      goto LABEL_8;
    }
LABEL_7:
    unsigned __int8 v6 = +[UIDevice ic_isVision];
    goto LABEL_8;
  }
  unsigned __int8 v6 = 1;
  if ((+[UIDevice ic_isiPad] & 1) == 0 && v4) {
    goto LABEL_7;
  }
LABEL_8:

  return v6;
}

@end