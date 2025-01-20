@interface NUAddToSafariReadingListActivity
- (id)activityTitle;
- (id)activityType;
@end

@implementation NUAddToSafariReadingListActivity

- (id)activityType
{
  return @"com.apple.news.activity.AddToSafariReadingList";
}

- (id)activityTitle
{
  v2 = NUBundle();
  v3 = [v2 localizedStringForKey:@"Add to Safari Reading List" value:&stru_26D495918 table:0];

  return v3;
}

@end