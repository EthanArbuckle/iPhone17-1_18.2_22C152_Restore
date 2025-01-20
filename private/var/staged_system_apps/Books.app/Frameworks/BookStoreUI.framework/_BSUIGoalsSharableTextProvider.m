@interface _BSUIGoalsSharableTextProvider
- (_BSUIGoalsSharableTextProvider)initWithSharableImage:(id)a3 kind:(unint64_t)a4 year:(unint64_t)a5 title:(id)a6 sharingUrls:(id)a7;
- (id)_baseMessageForGoalKind;
- (id)_buildMailHTML;
- (id)_escapeHTMLCharactersInString:(id)a3;
- (id)_generateFacebookMessage;
- (id)_generateLinkMetaData;
- (id)_generateLocalizedYear;
- (id)_generateMessageWithURLForActivityType:(id)a3;
- (id)_generateTwitterMessage;
- (id)_mailMessageForGoalKind;
- (id)_mailSubjectForGoalKind;
- (id)_messageForGoalKind;
- (id)_readingGoalsURLForActivityType:(id)a3;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)activityViewControllerLinkPresentationMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation _BSUIGoalsSharableTextProvider

- (_BSUIGoalsSharableTextProvider)initWithSharableImage:(id)a3 kind:(unint64_t)a4 year:(unint64_t)a5 title:(id)a6 sharingUrls:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)_BSUIGoalsSharableTextProvider;
  v16 = [(_BSUIGoalsSharableTextProvider *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_kind = a4;
    objc_storeStrong((id *)&v16->_sharedImage, a3);
    v17->_year = a5;
    objc_storeStrong((id *)&v17->_title, a6);
    objc_storeStrong((id *)&v17->_sharingUrls, a7);
  }

  return v17;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5 = a4;
  if ([v5 isEqualToString:UIActivityTypePostToFacebook])
  {
    uint64_t v6 = [(_BSUIGoalsSharableTextProvider *)self _generateFacebookMessage];
  }
  else if ([v5 isEqualToString:UIActivityTypePostToTwitter])
  {
    uint64_t v6 = [(_BSUIGoalsSharableTextProvider *)self _generateTwitterMessage];
  }
  else if ([v5 isEqualToString:UIActivityTypeMail])
  {
    uint64_t v6 = [(_BSUIGoalsSharableTextProvider *)self _buildMailHTML];
  }
  else
  {
    if ([v5 isEqualToString:@"com.burbn.instagram.shareextension"])
    {
      v7 = 0;
      goto LABEL_11;
    }
    uint64_t v6 = [(_BSUIGoalsSharableTextProvider *)self _generateMessageWithURLForActivityType:v5];
  }
  v7 = (void *)v6;
LABEL_11:

  return v7;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return 0;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  return [(_BSUIGoalsSharableTextProvider *)self _generateLinkMetaData];
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  return [(_BSUIGoalsSharableTextProvider *)self _generateLinkMetaData];
}

- (id)_generateLinkMetaData
{
  if (self->_sharedImage)
  {
    id v3 = objc_alloc_init((Class)LPLinkMetadata);
    [v3 setTitle:self->_title];
    v4 = [(_BSUIGoalsSharableTextProvider *)self _generateMessageWithURLForActivityType:UIActivityTypeMessage];
    [v3 setSummary:v4];

    id v5 = +[UIScreen mainScreen];
    [v5 scale];
    double v7 = v6;

    v15.width = v7 * 40.0;
    v15.height = v7 * 40.0;
    UIGraphicsBeginImageContext(v15);
    sharedImage = self->_sharedImage;
    CGRectMakeWithOriginSize();
    -[UIImage drawInRect:](sharedImage, "drawInRect:");
    UIGraphicsGetImageFromCurrentImageContext();
    v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    id v10 = objc_alloc((Class)LPImage);
    v11 = UIImagePNGRepresentation(v9);
    id v12 = [v10 initWithData:v11 MIMEType:@"image/png"];

    [v3 setImage:v12];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  id v5 = [(_BSUIGoalsSharableTextProvider *)self _mailSubjectForGoalKind];
  if (self->_kind == 8)
  {
    double v6 = [(_BSUIGoalsSharableTextProvider *)self _generateLocalizedYear];
    uint64_t v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v6);

    id v5 = (void *)v7;
  }

  return v5;
}

- (id)_readingGoalsURLForActivityType:(id)a3
{
  id v5 = a3;
  uint64_t v19 = 0;
  v20 = (id *)&v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_A420;
  v23 = sub_A430;
  id v24 = 0;
  if (self->_sharingUrls)
  {
    objc_opt_class();
    double v6 = [(NSDictionary *)self->_sharingUrls objectForKeyedSubscript:v5];
    uint64_t v7 = BUDynamicCast();
    v8 = v7;
    if (!v7)
    {
      objc_opt_class();
      id v3 = [(NSDictionary *)self->_sharingUrls objectForKeyedSubscript:@"default"];
      v8 = BUDynamicCast();
    }
    objc_storeStrong(v20 + 5, v8);
    if (!v7)
    {
    }
  }
  else
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    id v10 = +[BUBag defaultBag];
    v11 = [v10 readingGoalShareURL];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_A438;
    v16[3] = &unk_38E248;
    v18 = &v19;
    double v6 = v9;
    v17 = v6;
    [v11 valueWithCompletion:v16];

    dispatch_time_t v12 = dispatch_time(0, 300000000);
    if (!dispatch_semaphore_wait(v6, v12))
    {
      id v13 = BSUIGoalsSharableImageRendererLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_2DCD14(v13);
      }
    }
    uint64_t v7 = v17;
  }

  id v14 = v20[5];
  _Block_object_dispose(&v19, 8);

  return v14;
}

- (id)_buildMailHTML
{
  id v3 = BSUIBundle();
  v4 = [v3 localizedStringForKey:@"Set your own reading goals on %@Apple Books%@." value:&stru_39B8B0 table:@"BookStoreUILocalizable"];

  id v5 = [(_BSUIGoalsSharableTextProvider *)self _mailMessageForGoalKind];
  double v6 = [(_BSUIGoalsSharableTextProvider *)self _readingGoalsURLForActivityType:UIActivityTypeMail];
  uint64_t v7 = [(_BSUIGoalsSharableTextProvider *)self _escapeHTMLCharactersInString:v4];

  v8 = [(_BSUIGoalsSharableTextProvider *)self _escapeHTMLCharactersInString:v5];

  if (self->_kind == 8)
  {
    dispatch_semaphore_t v9 = [(_BSUIGoalsSharableTextProvider *)self _generateLocalizedYear];
    uint64_t v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v9);

    v8 = (void *)v10;
  }
  v11 = UIImagePNGRepresentation(self->_sharedImage);
  dispatch_time_t v12 = [v11 base64EncodedStringWithOptions:0];
  id v13 = +[NSString stringWithFormat:@"data:image/png;base64,%@", v12];
  id v14 = +[NSString stringWithFormat:@"<img width='100%%' src='%@'/>", v13];
  CGSize v15 = +[NSString stringWithFormat:@"<a href='%@'>", v6];
  +[NSString localizedStringWithFormat:v7, v15, @"</a>"];
  v16 = v20 = (void *)v7;
  v17 = +[NSString stringWithFormat:@"<p>%@<br/>%@<br/>%@</p>", v8, v14, v16];
  v18 = +[NSString stringWithFormat:@"<html><body>%@</body></html>", v17];

  return v18;
}

- (id)_escapeHTMLCharactersInString:(id)a3
{
  id v3 = [a3 stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"];
  v4 = [v3 stringByReplacingOccurrencesOfString:@"<" withString:@"&lt;"];

  id v5 = [v4 stringByReplacingOccurrencesOfString:@">" withString:@"&gt;"];

  double v6 = [v5 stringByReplacingOccurrencesOfString:@"\" withString:@"&quot;""];

  uint64_t v7 = [v6 stringByReplacingOccurrencesOfString:@"'" withString:@"&#39;"];

  return v7;
}

- (id)_baseMessageForGoalKind
{
  switch(self->_kind)
  {
    case 1uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"Here’s my reading progress for today.";
      goto LABEL_11;
    case 2uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"I’ve reached my daily reading goal!";
      goto LABEL_11;
    case 3uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"Here’s my reading progress so far this year.";
      goto LABEL_11;
    case 4uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"I’ve reached my yearly reading goal!";
      goto LABEL_11;
    case 5uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"Here’s my current reading streak.";
      goto LABEL_11;
    case 6uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"I’ve achieved my longest reading streak.";
      goto LABEL_11;
    case 7uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"Here’s my longest reading streak.";
      goto LABEL_11;
    case 8uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"Here’s what I read in %@.";
LABEL_11:
      id v5 = [v2 localizedStringForKey:v4 value:&stru_39B8B0 table:@"BookStoreUILocalizable"];

      break;
    default:
      id v5 = &stru_39B8B0;
      break;
  }

  return v5;
}

- (id)_messageForGoalKind
{
  switch(self->_kind)
  {
    case 1uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"Here’s my reading progress for today. Set your own reading goals on Apple Books: ";
      goto LABEL_11;
    case 2uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"I’ve reached my daily reading goal. Set your own reading goals on Apple Books: ";
      goto LABEL_11;
    case 3uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"Here’s my reading progress so far this year. Set your own reading goals on Apple Books: ";
      goto LABEL_11;
    case 4uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"I’ve reached my yearly reading goal! Set your own reading goals on Apple Books: ";
      goto LABEL_11;
    case 5uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"Here’s my current reading streak. Set your own reading goals on Apple Books: ";
      goto LABEL_11;
    case 6uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"I’ve achieved my longest reading streak. Set your own reading goals on Apple Books: ";
      goto LABEL_11;
    case 7uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"Here’s my longest reading streak. Set your own reading goals on Apple Books: ";
      goto LABEL_11;
    case 8uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"Here’s what I read in %@. Set your own reading goals on Apple Books: ";
LABEL_11:
      id v5 = [v2 localizedStringForKey:v4 value:&stru_39B8B0 table:@"BookStoreUILocalizable"];

      break;
    default:
      id v5 = &stru_39B8B0;
      break;
  }

  return v5;
}

- (id)_mailMessageForGoalKind
{
  switch(self->_kind)
  {
    case 1uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"Here’s my reading progress for today:";
      goto LABEL_11;
    case 2uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"I’ve reached my daily reading goal.";
      goto LABEL_11;
    case 3uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"Here’s my reading progress so far this year:";
      goto LABEL_11;
    case 4uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"I’ve reached my yearly reading goal!";
      goto LABEL_11;
    case 5uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"Here’s my current reading streak:";
      goto LABEL_11;
    case 6uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"I’ve achieved my longest reading streak.";
      goto LABEL_11;
    case 7uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"Here’s my longest reading streak:";
      goto LABEL_11;
    case 8uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"Here’s what I read in %@:";
LABEL_11:
      id v5 = [v2 localizedStringForKey:v4 value:&stru_39B8B0 table:@"BookStoreUILocalizable"];

      break;
    default:
      id v5 = &stru_39B8B0;
      break;
  }

  return v5;
}

- (id)_mailSubjectForGoalKind
{
  switch(self->_kind)
  {
    case 1uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"My Daily Reading Progress";
      goto LABEL_10;
    case 2uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"My Daily Reading Goal Achieved";
      goto LABEL_10;
    case 3uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"My Yearly Reading Goal";
      goto LABEL_10;
    case 4uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"My Yearly Reading Goal Achieved";
      goto LABEL_10;
    case 5uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"My Reading Streak";
      goto LABEL_10;
    case 6uLL:
    case 7uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"My Reading Streak Record";
      goto LABEL_10;
    case 8uLL:
      v2 = BSUIBundle();
      id v3 = v2;
      CFStringRef v4 = @"Books Read in %@";
LABEL_10:
      id v5 = [v2 localizedStringForKey:v4 value:&stru_39B8B0 table:@"BookStoreUILocalizable"];

      break;
    default:
      id v5 = &stru_39B8B0;
      break;
  }

  return v5;
}

- (id)_generateFacebookMessage
{
  return @"#AppleBooks";
}

- (id)_generateTwitterMessage
{
  v2 = [(_BSUIGoalsSharableTextProvider *)self _baseMessageForGoalKind];
  id v3 = BSUIBundle();
  CFStringRef v4 = [v3 localizedStringForKey:@"Set your own #ReadingGoals on @AppleBooks. apple.co/ReadingGoals" value:&stru_39B8B0 table:@"BookStoreUILocalizable"];

  id v5 = [v2 stringByAppendingFormat:@" %@", v4];

  return v5;
}

- (id)_generateMessageWithURLForActivityType:(id)a3
{
  id v4 = a3;
  id v5 = [(_BSUIGoalsSharableTextProvider *)self _messageForGoalKind];
  double v6 = [(_BSUIGoalsSharableTextProvider *)self _readingGoalsURLForActivityType:v4];

  if (self->_kind == 8)
  {
    uint64_t v7 = [(_BSUIGoalsSharableTextProvider *)self _generateLocalizedYear];
    uint64_t v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v7);

    id v5 = (void *)v8;
  }
  dispatch_semaphore_t v9 = +[NSString stringWithFormat:@"%@%@", v5, v6];

  return v9;
}

- (id)_generateLocalizedYear
{
  id v3 = objc_alloc_init((Class)NSDateComponents);
  [v3 setDay:31];
  [v3 setMonth:12];
  [v3 setYear:self->_year];
  id v4 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  id v5 = [v4 dateFromComponents:v3];
  id v6 = objc_alloc_init((Class)NSDateFormatter);
  [v6 setDateStyle:2];
  [v6 setLocalizedDateFormatFromTemplate:@"y"];
  uint64_t v7 = [v6 stringFromDate:v5];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingUrls, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_sharedImage, 0);
}

@end