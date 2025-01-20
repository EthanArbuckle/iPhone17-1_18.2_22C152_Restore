@interface NUErrorMessageFactory
+ (id)errorMessageForArticleViewWithOfflineReason:(int64_t)a3;
+ (id)errorMessageForTitle:(id)a3 subtitle:(id)a4;
- (FCNetworkReachabilityType)networkReachability;
- (NUErrorMessageFactory)initWithNetworkReachability:(id)a3;
- (id)errorMessageForArticleView;
- (id)errorMessageForArticleViewWithOfflineReason:(int64_t)a3;
@end

@implementation NUErrorMessageFactory

- (NUErrorMessageFactory)initWithNetworkReachability:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUErrorMessageFactory;
  v6 = [(NUErrorMessageFactory *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_networkReachability, a3);
  }

  return v7;
}

- (id)errorMessageForArticleView
{
  v3 = [(NUErrorMessageFactory *)self networkReachability];
  v4 = -[NUErrorMessageFactory errorMessageForArticleViewWithOfflineReason:](self, "errorMessageForArticleViewWithOfflineReason:", [v3 offlineReason]);

  return v4;
}

+ (id)errorMessageForArticleViewWithOfflineReason:(int64_t)a3
{
  switch(a3)
  {
    case 1:
    case 2:
      v3 = NUBundle();
      v4 = [v3 localizedStringForKey:@"NUStoryUnavailableAlertTitle" value:&stru_26D495918 table:0];

      id v5 = NUBundle();
      v6 = v5;
      v7 = @"Apple News isn’t connected to the internet.";
      goto LABEL_7;
    case 3:
      v10 = NUBundle();
      v4 = [v10 localizedStringForKey:@"NUStoryUnavailableAlertTitle" value:&stru_26D495918 table:0];

      id v5 = NUBundle();
      v6 = v5;
      v7 = @"Apple News isn’t supported in your current region.";
      goto LABEL_7;
    case 4:
    case 5:
      v8 = NUBundle();
      v4 = [v8 localizedStringForKey:@"NUStoryUnavailableAlertTitle" value:&stru_26D495918 table:0];

      id v5 = NUBundle();
      v6 = v5;
      v7 = @"NUOpenStoryRequiresLatestVersionOS";
      goto LABEL_7;
    case 6:
      v11 = NUBundle();
      v4 = [v11 localizedStringForKey:@"NUStoryUnavailableAlertTitle" value:&stru_26D495918 table:0];

      id v5 = NUBundle();
      v6 = v5;
      v7 = @"Sorry, Apple News is no longer fully supported on older devices.";
LABEL_7:
      objc_super v9 = [v5 localizedStringForKey:v7 value:&stru_26D495918 table:0];

      break;
    default:
      v4 = 0;
      objc_super v9 = 0;
      break;
  }
  v12 = +[NUErrorMessageFactory errorMessageForTitle:v4 subtitle:v9];

  return v12;
}

- (id)errorMessageForArticleViewWithOfflineReason:(int64_t)a3
{
  return +[NUErrorMessageFactory errorMessageForArticleViewWithOfflineReason:a3];
}

+ (id)errorMessageForTitle:(id)a3 subtitle:(id)a4
{
  v4 = 0;
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    v4 = [[NUErrorMessage alloc] initWithTitle:v7 subtitle:v6];
  }

  return v4;
}

- (FCNetworkReachabilityType)networkReachability
{
  return self->_networkReachability;
}

- (void).cxx_destruct
{
}

@end