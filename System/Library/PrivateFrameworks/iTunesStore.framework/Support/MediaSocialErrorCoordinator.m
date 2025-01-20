@interface MediaSocialErrorCoordinator
- (BOOL)addDialogForPost:(id)a3;
- (BOOL)addDialogForPost:(id)a3 errorMessage:(id)a4 canRetry:(BOOL)a5;
- (BOOL)addDialogForUpload:(id)a3;
- (BOOL)addDialogForUploadIdentifiers:(id)a3;
- (MediaSocialErrorCoordinator)initWithDispatchQueue:(id)a3;
- (MediaSocialErrorDelegate)delegate;
- (NSArray)postIdentifiers;
- (NSArray)uploadIdentifiers;
- (id)_newErrorDialogWithServerMessageWithPost:(id)a3 erroMessage:(id)a4 canRetry:(BOOL)a5;
- (id)_newPluralErrorDialogWithCount:(int64_t)a3 formatString:(id)a4;
- (id)_newPluralErrorDialogWithPostCount:(int64_t)a3;
- (id)_newPluralErrorDialogWithPostCount:(int64_t)a3 uploadCount:(int64_t)a4;
- (id)_newPluralErrorDialogWithUploadCount:(int64_t)a3;
- (id)_newSingleErrorDialogWithPost:(id)a3;
- (id)_newSingleErrorDialogWithUpload:(id)a3;
- (void)_sendDidFinishWithResponseFlags:(unint64_t)a3;
- (void)_showDialog:(id)a3;
- (void)dismissAllDialogs;
- (void)setDelegate:(id)a3;
@end

@implementation MediaSocialErrorCoordinator

- (MediaSocialErrorCoordinator)initWithDispatchQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MediaSocialErrorCoordinator;
  v6 = [(MediaSocialErrorCoordinator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
  }

  return v7;
}

- (BOOL)addDialogForPost:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", objc_msgSend(v4, "persistentID"));
  postIDs = self->_postIDs;
  if (!postIDs)
  {
    v7 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    v8 = self->_postIDs;
    self->_postIDs = v7;

    postIDs = self->_postIDs;
  }
  [(NSMutableOrderedSet *)postIDs addObject:v5];
  id v9 = [(NSMutableOrderedSet *)self->_uploadIDs count];
  id v10 = [(NSMutableOrderedSet *)self->_postIDs count];
  if (v9)
  {
    id v11 = [(MediaSocialErrorCoordinator *)self _newPluralErrorDialogWithPostCount:v10 uploadCount:[(NSMutableOrderedSet *)self->_uploadIDs count]];
  }
  else if ((unint64_t)v10 < 2)
  {
    id v11 = [(MediaSocialErrorCoordinator *)self _newSingleErrorDialogWithPost:v4];
  }
  else
  {
    id v11 = [(MediaSocialErrorCoordinator *)self _newPluralErrorDialogWithPostCount:[(NSMutableOrderedSet *)self->_postIDs count]];
  }
  v12 = v11;
  if (v11) {
    [(MediaSocialErrorCoordinator *)self _showDialog:v11];
  }

  return v12 != 0;
}

- (BOOL)addDialogForPost:(id)a3 errorMessage:(id)a4 canRetry:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", objc_msgSend(v8, "persistentID"));
  postIDs = self->_postIDs;
  if (!postIDs)
  {
    v12 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    v13 = self->_postIDs;
    self->_postIDs = v12;

    postIDs = self->_postIDs;
  }
  [(NSMutableOrderedSet *)postIDs addObject:v10];
  id v14 = [(MediaSocialErrorCoordinator *)self _newErrorDialogWithServerMessageWithPost:v8 erroMessage:v9 canRetry:v5];

  if (v14) {
    [(MediaSocialErrorCoordinator *)self _showDialog:v14];
  }

  return v14 != 0;
}

- (BOOL)addDialogForUpload:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", objc_msgSend(v4, "persistentID"));
  uploadIDs = self->_uploadIDs;
  if (!uploadIDs)
  {
    v7 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    id v8 = self->_uploadIDs;
    self->_uploadIDs = v7;

    uploadIDs = self->_uploadIDs;
  }
  [(NSMutableOrderedSet *)uploadIDs addObject:v5];
  if ([(NSMutableOrderedSet *)self->_postIDs count])
  {
    id v9 = [(MediaSocialErrorCoordinator *)self _newPluralErrorDialogWithPostCount:[(NSMutableOrderedSet *)self->_postIDs count] uploadCount:[(NSMutableOrderedSet *)self->_uploadIDs count]];
  }
  else if ((unint64_t)[(NSMutableOrderedSet *)self->_uploadIDs count] < 2)
  {
    id v9 = [(MediaSocialErrorCoordinator *)self _newSingleErrorDialogWithUpload:v4];
  }
  else
  {
    id v9 = [(MediaSocialErrorCoordinator *)self _newPluralErrorDialogWithUploadCount:[(NSMutableOrderedSet *)self->_uploadIDs count]];
  }
  id v10 = v9;
  if (v9) {
    [(MediaSocialErrorCoordinator *)self _showDialog:v9];
  }

  return v10 != 0;
}

- (BOOL)addDialogForUploadIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = (char *)[(NSMutableOrderedSet *)self->_postIDs count];
  v6 = &v5[(void)[(NSMutableOrderedSet *)self->_uploadIDs count]];
  if ((char *)[v4 count] + (unint64_t)v6 < (char *)2)
  {
    BOOL v11 = 0;
  }
  else
  {
    uploadIDs = self->_uploadIDs;
    if (!uploadIDs)
    {
      id v8 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
      id v9 = self->_uploadIDs;
      self->_uploadIDs = v8;

      uploadIDs = self->_uploadIDs;
    }
    [(NSMutableOrderedSet *)uploadIDs addObjectsFromArray:v4];
    if ([(NSMutableOrderedSet *)self->_postIDs count]) {
      id v10 = [(MediaSocialErrorCoordinator *)self _newPluralErrorDialogWithPostCount:[(NSMutableOrderedSet *)self->_postIDs count] uploadCount:[(NSMutableOrderedSet *)self->_uploadIDs count]];
    }
    else {
      id v10 = [(MediaSocialErrorCoordinator *)self _newPluralErrorDialogWithUploadCount:[(NSMutableOrderedSet *)self->_uploadIDs count]];
    }
    v12 = v10;
    BOOL v11 = v10 != 0;
    if (v10) {
      [(MediaSocialErrorCoordinator *)self _showDialog:v10];
    }
  }
  return v11;
}

- (void)dismissAllDialogs
{
  if (self->_notification)
  {
    v3 = +[UserNotificationCenter defaultCenter];
    [v3 cancelUserNotification:self->_notification];

    id notification = self->_notification;
    self->_id notification = 0;
  }
  postIDs = self->_postIDs;
  self->_postIDs = 0;

  temporaryPostIDs = self->_temporaryPostIDs;
  self->_temporaryPostIDs = 0;

  temporaryUploadIDs = self->_temporaryUploadIDs;
  self->_temporaryUploadIDs = 0;

  uploadIDs = self->_uploadIDs;
  self->_uploadIDs = 0;
}

- (NSArray)postIdentifiers
{
  temporaryPostIDs = self->_temporaryPostIDs;
  if (temporaryPostIDs)
  {
    id v4 = [(NSArray *)temporaryPostIDs copy];
  }
  else
  {
    id v4 = [(NSMutableOrderedSet *)self->_postIDs array];
  }

  return (NSArray *)v4;
}

- (NSArray)uploadIdentifiers
{
  temporaryUploadIDs = self->_temporaryUploadIDs;
  if (temporaryUploadIDs)
  {
    id v4 = [(NSArray *)temporaryUploadIDs copy];
  }
  else
  {
    id v4 = [(NSMutableOrderedSet *)self->_uploadIDs array];
  }

  return (NSArray *)v4;
}

- (id)_newPluralErrorDialogWithCount:(int64_t)a3 formatString:(id)a4
{
  id v5 = a4;
  v6 = +[LSApplicationProxy applicationProxyForIdentifier:@"com.apple.Music"];
  if (v6)
  {
    v7 = +[NSBundle bundleWithIdentifier:@"com.apple.storeservices"];
    if (v7)
    {
      id v8 = objc_alloc_init((Class)ISDialog);
      id v9 = [v7 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_BUTTON_TRY_LATER" value:&stru_1003B9B00 table:@"MediaSocial"];
      v18[0] = v9;
      id v10 = [v7 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_BUTTON_DELETE" value:&stru_1003B9B00 table:@"MediaSocial"];
      v18[1] = v10;
      BOOL v11 = +[NSArray arrayWithObjects:v18 count:2];
      [v8 setButtonsWithTitles:v11];

      v12 = [v6 localizedShortName];
      [v8 setTitle:v12];

      id v13 = objc_alloc_init((Class)NSNumberFormatter);
      [v13 setNumberStyle:1];
      id v14 = +[NSNumber numberWithInteger:a3];
      v15 = [v13 stringFromNumber:v14];
      v16 = +[NSString stringWithValidatedFormat:v5, @"%@", 0, v15 validFormatSpecifiers error];
      [v8 setMessage:v16];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_newPluralErrorDialogWithPostCount:(int64_t)a3
{
  id v5 = +[NSBundle bundleWithIdentifier:@"com.apple.storeservices"];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_MESSAGE_FORMAT_PLURAL_%@" value:&stru_1003B9B00 table:@"MediaSocial"];
    id v8 = [(MediaSocialErrorCoordinator *)self _newPluralErrorDialogWithCount:a3 formatString:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_newPluralErrorDialogWithPostCount:(int64_t)a3 uploadCount:(int64_t)a4
{
  v6 = +[LSApplicationProxy applicationProxyForIdentifier:@"com.apple.Music"];
  v7 = +[NSBundle bundleWithIdentifier:@"com.apple.storeservices"];
  id v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    id v10 = 0;
  }
  else
  {
    CFStringRef v11 = @"MEDIA_SOCIAL_COMBINED_ERROR_%@_POST_%@_UPLOADS";
    if (a4 == 1) {
      CFStringRef v11 = @"MEDIA_SOCIAL_COMBINED_ERROR_%@_POST_%@_UPLOAD";
    }
    CFStringRef v12 = @"MEDIA_SOCIAL_COMBINED_ERROR_%@_POSTS_%@_UPLOAD";
    if (a4 != 1) {
      CFStringRef v12 = @"MEDIA_SOCIAL_COMBINED_ERROR_%@_POSTS_%@_UPLOADS";
    }
    if (a3 == 1) {
      CFStringRef v13 = v11;
    }
    else {
      CFStringRef v13 = v12;
    }
    id v14 = [v7 localizedStringForKey:v13 value:&stru_1003B9B00 table:@"MediaSocial"];
    id v15 = objc_alloc_init((Class)NSNumberFormatter);
    [v15 setNumberStyle:1];
    v16 = +[NSNumber numberWithInteger:a3];
    v17 = [v15 stringFromNumber:v16];

    v18 = +[NSNumber numberWithInteger:a4];
    v19 = [v15 stringFromNumber:v18];

    id v10 = objc_alloc_init((Class)ISDialog);
    v20 = [v8 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_BUTTON_TRY_LATER" value:&stru_1003B9B00 table:@"MediaSocial"];
    v26[0] = v20;
    v21 = [v8 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_BUTTON_DELETE" value:&stru_1003B9B00 table:@"MediaSocial"];
    v26[1] = v21;
    v22 = +[NSArray arrayWithObjects:v26 count:2];
    [v10 setButtonsWithTitles:v22];

    v23 = +[NSString stringWithValidatedFormat:v14, @"%@%@", 0, v17, v19 validFormatSpecifiers error];
    [v10 setMessage:v23];

    v24 = [v6 localizedShortName];
    [v10 setTitle:v24];
  }
  return v10;
}

- (id)_newPluralErrorDialogWithUploadCount:(int64_t)a3
{
  id v5 = +[NSBundle bundleWithIdentifier:@"com.apple.storeservices"];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 localizedStringForKey:@"UPLOAD_ERROR_MESSAGE_FORMAT_PLURAL_%@" value:&stru_1003B9B00 table:@"MediaSocial"];
    id v8 = [(MediaSocialErrorCoordinator *)self _newPluralErrorDialogWithCount:a3 formatString:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_newSingleErrorDialogWithPost:(id)a3
{
  id v3 = a3;
  id v4 = +[LSApplicationProxy applicationProxyForIdentifier:@"com.apple.Music"];
  id v5 = [v3 valueForProperty:@"message"];

  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v8 = +[NSBundle bundleWithIdentifier:@"com.apple.storeservices"];
    BOOL v9 = (void *)v8;
    if (v8)
    {
      id v7 = objc_alloc_init((Class)ISDialog);
      id v10 = [v9 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_BUTTON_TRY_LATER" value:&stru_1003B9B00 table:@"MediaSocial"];
      v24[0] = v10;
      CFStringRef v11 = [v9 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_BUTTON_DELETE" value:&stru_1003B9B00 table:@"MediaSocial"];
      v24[1] = v11;
      CFStringRef v12 = +[NSArray arrayWithObjects:v24 count:2];
      [v7 setButtonsWithTitles:v12];

      CFStringRef v13 = [v4 localizedShortName];
      [v7 setTitle:v13];

      id v14 = [v5 length];
      if ((unint64_t)v14 >= 0x29)
      {
        uint64_t v15 = [v5 substringToIndex:40];

        id v5 = (void *)v15;
      }
      v16 = +[NSCharacterSet newlineCharacterSet];
      v17 = [v5 componentsSeparatedByCharactersInSet:v16];
      v18 = [v17 componentsJoinedByString:@" "];

      v19 = +[NSCharacterSet whitespaceCharacterSet];
      id v5 = [v18 stringByTrimmingCharactersInSet:v19];

      if ((unint64_t)v14 >= 0x29)
      {
        uint64_t v20 = [v5 stringByAppendingString:@"…"];

        id v5 = (void *)v20;
      }
      v21 = [v9 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_MESSAGE_FORMAT_%@" value:&stru_1003B9B00 table:@"MediaSocial"];
      v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v5);
      [v7 setMessage:v22];
    }
    else
    {
      id v7 = 0;
    }
  }
  return v7;
}

- (id)_newSingleErrorDialogWithUpload:(id)a3
{
  id v3 = a3;
  id v4 = +[NSBundle bundleWithIdentifier:@"com.apple.storeservices"];
  if (!v4)
  {
    id v5 = 0;
    goto LABEL_20;
  }
  v18[0] = @"title";
  v18[1] = @"uti";
  long long v17 = 0uLL;
  [v3 getValues:&v17 forProperties:v18 count:2];
  id v5 = 0;
  if (v17 != 0)
  {
    if ((void)v17)
    {
      BOOL v6 = [v4 localizedStringForKey:@"UPLOAD_ERROR_MESSAGE_FORMAT_%@" value:&stru_1003B9B00 table:@"MediaSocial"];
      id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, (void)v17);

      if (!v7)
      {
LABEL_15:
        id v5 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      switch(SSVMediaSocialAttachmentTypeForTypeIdentifier())
      {
        case 1:
          CFStringRef v8 = @"UPLOAD_ERROR_MESSAGE_AUDIO";
          break;
        case 2:
          CFStringRef v8 = @"UPLOAD_ERROR_MESSAGE_IMAGE";
          break;
        case 3:
          CFStringRef v8 = @"UPLOAD_ERROR_MESSAGE_SOUND_BITE";
          break;
        case 4:
          CFStringRef v8 = @"UPLOAD_ERROR_MESSAGE_VIDEO";
          break;
        default:
          goto LABEL_15;
      }
      id v7 = [v4 localizedStringForKey:v8 value:&stru_1003B9B00 table:@"MediaSocial"];
      if (!v7) {
        goto LABEL_15;
      }
    }
    BOOL v9 = +[LSApplicationProxy applicationProxyForIdentifier:@"com.apple.Music"];
    if (v9)
    {
      id v5 = objc_alloc_init((Class)ISDialog);
      id v10 = [v4 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_BUTTON_TRY_LATER" value:&stru_1003B9B00 table:@"MediaSocial"];
      v16[0] = v10;
      CFStringRef v11 = [v4 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_BUTTON_DELETE" value:&stru_1003B9B00 table:@"MediaSocial"];
      v16[1] = v11;
      CFStringRef v12 = +[NSArray arrayWithObjects:v16 count:2];
      [v5 setButtonsWithTitles:v12];

      [v5 setMessage:v7];
      CFStringRef v13 = [v9 localizedShortName];
      [v5 setTitle:v13];
    }
    else
    {
      id v5 = 0;
    }
  }
LABEL_18:
  for (uint64_t i = 1; i != -1; --i)

LABEL_20:
  return v5;
}

- (id)_newErrorDialogWithServerMessageWithPost:(id)a3 erroMessage:(id)a4 canRetry:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  BOOL v9 = +[LSApplicationProxy applicationProxyForIdentifier:@"com.apple.Music"];
  id v10 = [v8 valueForProperty:@"message"];

  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    id v12 = 0;
  }
  else
  {
    uint64_t v13 = +[NSBundle bundleWithIdentifier:@"com.apple.storeservices"];
    id v14 = (void *)v13;
    if (v13)
    {
      id v12 = objc_alloc_init((Class)ISDialog);
      if (v5)
      {
        uint64_t v15 = [v14 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_BUTTON_TRY_LATER" value:&stru_1003B9B00 table:@"MediaSocial"];
        v30[0] = v15;
        v16 = [v14 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_BUTTON_DELETE" value:&stru_1003B9B00 table:@"MediaSocial"];
        v30[1] = v16;
        long long v17 = +[NSArray arrayWithObjects:v30 count:2];
        [v12 setButtonsWithTitles:v17];
      }
      else
      {
        uint64_t v15 = [v14 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_BUTTON_OK" value:&stru_1003B9B00 table:@"MediaSocial"];
        v29 = v15;
        v16 = +[NSArray arrayWithObjects:&v29 count:1];
        [v12 setButtonsWithTitles:v16];
      }

      v18 = [v9 localizedShortName];
      [v12 setTitle:v18];

      id v19 = [v10 length];
      if ((unint64_t)v19 >= 0x29)
      {
        uint64_t v20 = [v10 substringToIndex:40];

        id v10 = (void *)v20;
      }
      v21 = +[NSCharacterSet newlineCharacterSet];
      v22 = [v10 componentsSeparatedByCharactersInSet:v21];
      v23 = [v22 componentsJoinedByString:@" "];

      v24 = +[NSCharacterSet whitespaceCharacterSet];
      id v10 = [v23 stringByTrimmingCharactersInSet:v24];

      if ((unint64_t)v19 >= 0x29)
      {
        uint64_t v25 = [v10 stringByAppendingString:@"…"];

        id v10 = (void *)v25;
      }
      v26 = [v14 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_MESSAGE_FORMAT_%@_DUE_TO_ERROR_%@" value:&stru_1003B9B00 table:@"MediaSocial"];
      v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v26, v10, v7);
      [v12 setMessage:v27];
    }
    else
    {
      id v12 = 0;
    }
  }
  return v12;
}

- (void)_sendDidFinishWithResponseFlags:(unint64_t)a3
{
  BOOL v5 = [(NSMutableOrderedSet *)self->_postIDs array];
  temporaryPostIDs = self->_temporaryPostIDs;
  self->_temporaryPostIDs = v5;

  id v7 = [(NSMutableOrderedSet *)self->_uploadIDs array];
  temporaryUploadIDs = self->_temporaryUploadIDs;
  self->_temporaryUploadIDs = v7;

  postIDs = self->_postIDs;
  self->_postIDs = 0;

  uploadIDs = self->_uploadIDs;
  self->_uploadIDs = 0;

  id v13 = [(MediaSocialErrorCoordinator *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v13 mediaSocialErrorCoordinator:self didFinishWithResult:a3 != 0];
  }
  BOOL v11 = self->_temporaryPostIDs;
  self->_temporaryPostIDs = 0;

  id v12 = self->_temporaryUploadIDs;
  self->_temporaryUploadIDs = 0;
}

- (void)_showDialog:(id)a3
{
  id notification = self->_notification;
  id v5 = a3;
  BOOL v6 = +[UserNotificationCenter defaultCenter];
  id v9 = v6;
  if (notification)
  {
    [v6 updateUserNotification:self->_notification withDialog:v5];
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001000BC;
    v10[3] = &unk_1003A50D8;
    v10[4] = self;
    id v7 = [v6 showDialog:v5 withCompletionBlock:v10];

    id v8 = self->_notification;
    self->_id notification = v7;
  }
}

- (MediaSocialErrorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MediaSocialErrorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadIDs, 0);
  objc_storeStrong((id *)&self->_temporaryUploadIDs, 0);
  objc_storeStrong((id *)&self->_temporaryPostIDs, 0);
  objc_storeStrong((id *)&self->_postIDs, 0);
  objc_storeStrong(&self->_notification, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end