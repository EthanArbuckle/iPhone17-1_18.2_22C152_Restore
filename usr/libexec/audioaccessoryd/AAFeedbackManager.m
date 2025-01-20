@interface AAFeedbackManager
- (id)_feedbackCampainIdentifierForCampain:(int)a3;
- (id)_feedbackCampainLocalizedTitleForCampain:(int)a3;
- (void)displayFeedbackCampaign:(int)a3 promptStyle:(int64_t)a4 completion:(id)a5;
- (void)displayFeedbackCampaign:(int)a3 promptStyle:(int64_t)a4 localizedPrompt:(id)a5 completion:(id)a6;
@end

@implementation AAFeedbackManager

- (void)displayFeedbackCampaign:(int)a3 promptStyle:(int64_t)a4 completion:(id)a5
{
}

- (void)displayFeedbackCampaign:(int)a3 promptStyle:(int64_t)a4 localizedPrompt:(id)a5 completion:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  id v11 = a6;
  [(AAFeedbackManager *)self _feedbackCampainIdentifierForCampain:v8];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100013D60;
  v15[3] = &unk_100232F40;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v10;
  v18 = self;
  id v19 = v11;
  int v21 = v8;
  int64_t v20 = a4;
  id v12 = v10;
  id v13 = v16;
  id v14 = v11;
  +[FBKSFeedbackCount fetchCountsForFormWithIdentifier:v13 completion:v15];
}

- (id)_feedbackCampainIdentifierForCampain:(int)a3
{
  if (a3 == 1) {
    return @":framework-conversation-awareness";
  }
  else {
    return 0;
  }
}

- (id)_feedbackCampainLocalizedTitleForCampain:(int)a3
{
  if (a3 == 1)
  {
    v3 = +[NSBundle bundleWithPath:@"/System/Library/CoreServices/BluetoothUIService.app/"];
    v4 = [v3 localizedStringForKey:@"FEED_BACK_NOTIFICATION_TITLE_STRING" value:&stru_10023D730 table:@"Localizable"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end