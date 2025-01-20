@interface NAAddToSafariReadingListActivity
- (id)activityTitle;
- (id)activityType;
@end

@implementation NAAddToSafariReadingListActivity

- (id)activityType
{
  return @"com.apple.news.activity.AddToSafariReadingList";
}

- (id)activityTitle
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 localizedStringForKey:@"Add to Safari Reading List" value:&stru_1F1AD8EC0 table:0];

  return v3;
}

@end