@interface NSString
+ (id)bk_localizedStringForDeleteAction:(int64_t)a3 deleteActionProvider:(id)a4;
+ (id)bk_localizedWarningAndTitleStringsForProvider:(id)a3;
+ (id)bk_localizedWarningStringForProvider:(id)a3;
@end

@implementation NSString

+ (id)bk_localizedStringForDeleteAction:(int64_t)a3 deleteActionProvider:(id)a4
{
  id v5 = a4;
  v6 = v5;
  switch(a3)
  {
    case 0:
      v7 = +[NSBundle mainBundle];
      v8 = v7;
      CFStringRef v9 = @"Delete Everywhere";
      goto LABEL_27;
    case 1:
      v7 = +[NSBundle mainBundle];
      v8 = v7;
      CFStringRef v9 = @"Remove Everywhere";
      goto LABEL_27;
    case 2:
      id v10 = [v5 countForActionItem:2];
      v8 = +[NSBundle mainBundle];
      if (v10 == (id)1) {
        CFStringRef v9 = @"Remove Download";
      }
      else {
        CFStringRef v9 = @"Remove Downloads";
      }
      goto LABEL_26;
    case 3:
      v7 = +[NSBundle mainBundle];
      v8 = v7;
      CFStringRef v9 = @"Remove from Collection";
      goto LABEL_27;
    case 4:
      v8 = +[BCCollection titleForDefaultCollectionID:kBKCollectionDefaultIDSamples];
      v11 = +[NSBundle mainBundle];
      v12 = [v11 localizedStringForKey:@"Remove from %@" value:&stru_100A70340 table:0];

      uint64_t v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v8);
      goto LABEL_19;
    case 5:
      v7 = +[NSBundle mainBundle];
      v8 = v7;
      CFStringRef v9 = @"Delete";
      goto LABEL_27;
    case 6:
      v15 = [v5 collection];
      v8 = v15;
      if (v15 && [v15 isDefaultCollection])
      {
        v16 = +[NSBundle mainBundle];
        v12 = [v16 localizedStringForKey:@"Remove from %@" value:&stru_100A70340 table:0];

        v17 = [v8 title];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v17);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = +[NSBundle mainBundle];
        uint64_t v13 = [v12 localizedStringForKey:@"Remove from Collection" value:&stru_100A70340 table:0];
LABEL_19:
        v14 = (__CFString *)v13;
      }

      goto LABEL_28;
    case 7:
      v18 = (char *)[v5 countForActionItem:7];
      v19 = (char *)[v6 localITSAudiobookCount];
      v20 = &v19[(void)[v6 cloudITSAudiobookCount]];
      v8 = +[NSBundle mainBundle];
      if (v20 == v18)
      {
        if (v18 == (char *)1) {
          CFStringRef v9 = @"Hide Audiobook";
        }
        else {
          CFStringRef v9 = @"Hide Audiobooks";
        }
      }
      else if (v18 == (char *)1)
      {
        CFStringRef v9 = @"Hide Book";
      }
      else
      {
        CFStringRef v9 = @"Hide Books";
      }
LABEL_26:
      v7 = v8;
      goto LABEL_27;
    case 8:
      v7 = +[NSBundle mainBundle];
      v8 = v7;
      CFStringRef v9 = @"Remove…";
LABEL_27:
      v14 = [v7 localizedStringForKey:v9 value:&stru_100A70340 table:0];
LABEL_28:

      break;
    default:
      v14 = &stru_100A70340;
      break;
  }

  return v14;
}

+ (id)bk_localizedWarningStringForProvider:(id)a3
{
  v3 = +[NSString bk_localizedWarningAndTitleStringsForProvider:a3];
  v4 = [v3 objectForKeyedSubscript:@"warningString"];

  return v4;
}

+ (id)bk_localizedWarningAndTitleStringsForProvider:(id)a3
{
  id v3 = a3;
  if ([v3 sampleCount])
  {
    v4 = &stru_100A70340;
    goto LABEL_73;
  }
  if (![v3 nonStoreAudiobookCount])
  {
    if ([v3 localUbiquityCount])
    {
      id v8 = +[BCDevice deviceClass];
      if (v8 == (id)3)
      {
        id v13 = [v3 pdfCount];
        id v14 = [v3 localUbiquityCount];
        v6 = +[NSBundle mainBundle];
        if (v13)
        {
          if ((unint64_t)v14 >= 2) {
            CFStringRef v7 = @"These items were downloaded to this iPad. Delete them from iCloud or remove the downloads from this iPad.";
          }
          else {
            CFStringRef v7 = @"This item was downloaded to this iPad. Delete it from iCloud or remove the download from this iPad.";
          }
        }
        else if ((unint64_t)v14 >= 2)
        {
          CFStringRef v7 = @"These books were downloaded to this iPad. Delete them from iCloud or remove the downloads from this iPad.";
        }
        else
        {
          CFStringRef v7 = @"This book was downloaded to this iPad. Delete it from iCloud or remove the download from this iPad.";
        }
      }
      else if (v8 == (id)2)
      {
        id v15 = [v3 pdfCount];
        id v16 = [v3 localUbiquityCount];
        v6 = +[NSBundle mainBundle];
        if (v15)
        {
          if ((unint64_t)v16 >= 2) {
            CFStringRef v7 = @"These items were downloaded to this iPod touch. Delete them from iCloud or remove the downloads from this iPod touch.";
          }
          else {
            CFStringRef v7 = @"This item was downloaded to this iPod touch. Delete it from iCloud or remove the download from this iPod touch.";
          }
        }
        else if ((unint64_t)v16 >= 2)
        {
          CFStringRef v7 = @"These books were downloaded to this iPod touch. Delete them from iCloud or remove the downloads from this iPod touch.";
        }
        else
        {
          CFStringRef v7 = @"This book was downloaded to this iPod touch. Delete it from iCloud or remove the download from this iPod touch.";
        }
      }
      else if (v8 == (id)1)
      {
        id v9 = [v3 pdfCount];
        id v10 = [v3 localUbiquityCount];
        v6 = +[NSBundle mainBundle];
        if (v9)
        {
          if ((unint64_t)v10 >= 2) {
            CFStringRef v7 = @"These items were downloaded to this iPhone. Delete them from iCloud or remove the downloads from this iPhone.";
          }
          else {
            CFStringRef v7 = @"This item was downloaded to this iPhone. Delete it from iCloud or remove the download from this iPhone.";
          }
        }
        else if ((unint64_t)v10 >= 2)
        {
          CFStringRef v7 = @"These books were downloaded to this iPhone. Delete them from iCloud or remove the downloads from this iPhone.";
        }
        else
        {
          CFStringRef v7 = @"This book was downloaded to this iPhone. Delete it from iCloud or remove the download from this iPhone.";
        }
      }
      else
      {
        id v17 = [v3 pdfCount];
        id v18 = [v3 localUbiquityCount];
        v6 = +[NSBundle mainBundle];
        if (v17)
        {
          if ((unint64_t)v18 >= 2) {
            CFStringRef v7 = @"These items were downloaded to this device. Delete them from iCloud or remove the downloads from this device.";
          }
          else {
            CFStringRef v7 = @"This item was downloaded to this device. Delete it from iCloud or remove the download from this device.";
          }
        }
        else if ((unint64_t)v18 >= 2)
        {
          CFStringRef v7 = @"These books were downloaded to this device. Delete them from iCloud or remove the downloads from this device.";
        }
        else
        {
          CFStringRef v7 = @"This book was downloaded to this device. Delete it from iCloud or remove the download from this device.";
        }
      }
LABEL_70:
      id v5 = v6;
      goto LABEL_71;
    }
    if ([v3 nonlocalUbiquityCount])
    {
      id v11 = [v3 pdfCount];
      id v12 = [v3 nonlocalUbiquityCount];
      v6 = +[NSBundle mainBundle];
      if (v11)
      {
        if ((unint64_t)v12 >= 2) {
          CFStringRef v7 = @"Do you want to delete items from iCloud and all your iCloud devices?";
        }
        else {
          CFStringRef v7 = @"Do you want to delete this item from iCloud and all your iCloud devices?";
        }
      }
      else if ((unint64_t)v12 >= 2)
      {
        CFStringRef v7 = @"Do you want to delete books from iCloud and all your iCloud devices?";
      }
      else
      {
        CFStringRef v7 = @"Do you want to delete this book from iCloud and all your iCloud devices?";
      }
      goto LABEL_70;
    }
    if ([v3 ubiquityErrorCount])
    {
      id v19 = [v3 pdfCount];
      id v20 = [v3 ubiquityErrorCount];
      v6 = +[NSBundle mainBundle];
      if (v19)
      {
        if ((unint64_t)v20 >= 2) {
          CFStringRef v7 = @"These items weren’t uploaded to iCloud. Do you want to delete them?";
        }
        else {
          CFStringRef v7 = @"This item wasn’t uploaded to iCloud. Do you want to delete it?";
        }
      }
      else if ((unint64_t)v20 >= 2)
      {
        CFStringRef v7 = @"These books weren’t uploaded to iCloud. Do you want to delete them?";
      }
      else
      {
        CFStringRef v7 = @"This book wasn’t uploaded to iCloud. Do you want to delete it?";
      }
      goto LABEL_70;
    }
    v6 = [v3 actionItems];
    unsigned int v21 = [v6 containsObject:&off_100A82E10];
    unsigned int v22 = [v6 containsObject:&off_100A82E28];
    if ([v6 containsObject:&off_100A82E40]) {
      unsigned int v23 = 1;
    }
    else {
      unsigned int v23 = [v6 containsObject:&off_100A82E58];
    }
    v24 = [v3 booksToDelete];
    v25 = (char *)[v24 count];

    if (((v21 | v22) & 1) == 0 && !v23)
    {
      v26 = +[NSBundle mainBundle];
      if (v25 == (char *)1) {
        CFStringRef v27 = @"It will be permanently deleted from this device.";
      }
      else {
        CFStringRef v27 = @"They will be permanently deleted from this device.";
      }
LABEL_79:
      v38 = v26;
LABEL_87:
      uint64_t v39 = [v38 localizedStringForKey:v27 value:&stru_100A70340 table:0];
LABEL_88:
      v4 = (__CFString *)v39;

      goto LABEL_72;
    }
    id v28 = [v3 countForActionItem:2];
    id v29 = [v3 countForActionItem:7];
    v30 = (char *)[v3 localITSAudiobookCount];
    v31 = &v30[(void)[v3 cloudITSAudiobookCount]];
    int v32 = v21 ^ 1 | v22;
    if ((v32 | v23))
    {
      int v33 = v21 | v22 ^ 1;
      if (((v33 | v23) & 1) == 0)
      {
        v26 = +[NSBundle mainBundle];
        if (v29 == (id)1)
        {
          if (v25 == v31) {
            CFStringRef v27 = @"Hide this audiobook on devices using this account. To unhide purchases, tap your Account icon in Home, then tap Manage Hidden Purchases.";
          }
          else {
            CFStringRef v27 = @"Hide this book on devices using this account. To unhide purchases, tap your Account icon in Home, then tap Manage Hidden Purchases.";
          }
        }
        else if (v25 == v31)
        {
          CFStringRef v27 = @"Hide these audiobooks on devices using this account. To unhide purchases, tap your Account icon in Home, then tap Manage Hidden Purchases.";
        }
        else
        {
          CFStringRef v27 = @"Hide these books on devices using this account. To unhide purchases, tap your Account icon in Home, then tap Manage Hidden Purchases.";
        }
        goto LABEL_79;
      }
      int v34 = v23 ^ 1;
      if (((v21 | v22 | v23 ^ 1) & 1) == 0)
      {
        v38 = +[NSBundle mainBundle];
        v26 = v38;
        CFStringRef v27 = @"Remove from this collection.";
        goto LABEL_87;
      }
      int v35 = v21 ^ 1 | v22 ^ 1;
      if (((v35 | v23) & 1) == 0)
      {
        v26 = +[NSBundle mainBundle];
        if (v25 == (char *)1) {
          CFStringRef v27 = @"Remove the download or hide it on devices using this account.";
        }
        else {
          CFStringRef v27 = @"Remove the downloads or hide them on devices using this account.";
        }
        goto LABEL_79;
      }
      if (((v32 | v34) & 1) == 0)
      {
        if (v31)
        {
          v40 = +[NSBundle mainBundle];
          v41 = v40;
          CFStringRef v42 = @"REMOVE_DOWNLOAD(S)_MESSAGE_ACCOUNT";
        }
        else
        {
          id v43 = +[BCDevice deviceClass];
          if (v43 == (id)3)
          {
            v40 = +[NSBundle mainBundle];
            v41 = v40;
            CFStringRef v42 = @"REMOVE_DOWNLOAD(S)_MESSAGE_IPAD";
          }
          else if (v43 == (id)2)
          {
            v40 = +[NSBundle mainBundle];
            v41 = v40;
            CFStringRef v42 = @"REMOVE_DOWNLOAD(S)_MESSAGE_IPOD";
          }
          else if (v43 == (id)1)
          {
            v40 = +[NSBundle mainBundle];
            v41 = v40;
            CFStringRef v42 = @"REMOVE_DOWNLOAD(S)_MESSAGE_IPHONE";
          }
          else
          {
            v40 = +[NSBundle mainBundle];
            v41 = v40;
            CFStringRef v42 = @"REMOVE_DOWNLOAD(S)_MESSAGE_DEVICE";
          }
        }
        v26 = [v40 localizedStringForKey:v42 value:&stru_100A70340 table:0];

        uint64_t v39 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v26, v28);
        goto LABEL_88;
      }
      if (((v33 | v34) & 1) == 0)
      {
        v38 = +[NSBundle mainBundle];
        v26 = v38;
        CFStringRef v27 = @"Remove from this collection or hide on devices using this account.";
        goto LABEL_87;
      }
      if (((v35 | v34) & 1) == 0)
      {
        v26 = +[NSBundle mainBundle];
        if (v25 == (char *)1)
        {
          if (v31 == (char *)1) {
            CFStringRef v27 = @"Remove from collection, remove download, or hide on devices using this account.";
          }
          else {
            CFStringRef v27 = @"Remove from this collection, remove the download, or hide this book on devices using this account.";
          }
        }
        else if (v25 == v31)
        {
          CFStringRef v27 = @"Remove from collection, remove downloads, or hide on devices using this account.";
        }
        else
        {
          CFStringRef v27 = @"Remove from this collection, remove the downloads, or hide these books on devices using this account.";
        }
        goto LABEL_79;
      }
    }
    else if (v31)
    {
      v38 = +[NSBundle mainBundle];
      v26 = v38;
      CFStringRef v27 = @"You can redownload audiobooks from your account.";
      goto LABEL_87;
    }
    v4 = &stru_100A70340;
    goto LABEL_72;
  }
  id v5 = +[NSBundle mainBundle];
  v6 = v5;
  CFStringRef v7 = @"Audiobooks not purchased from the Audiobook Store will be permanently deleted.";
LABEL_71:
  v4 = [v5 localizedStringForKey:v7 value:&stru_100A70340 table:0];
LABEL_72:

LABEL_73:
  id v36 = objc_alloc_init((Class)NSMutableDictionary);
  if ([(__CFString *)v4 length]) {
    [v36 setObject:v4 forKey:@"warningString"];
  }

  return v36;
}

@end