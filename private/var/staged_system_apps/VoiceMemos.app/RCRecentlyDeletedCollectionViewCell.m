@interface RCRecentlyDeletedCollectionViewCell
- (id)accessibilityCustomActions;
- (void)_createShuttleBarIfNeeded;
- (void)performRecoverAXAction;
@end

@implementation RCRecentlyDeletedCollectionViewCell

- (id)accessibilityCustomActions
{
  id v3 = objc_alloc((Class)UIAccessibilityCustomAction);
  v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"AX_ACTION_RECOVER" value:&stru_100228BC8 table:0];
  id v6 = [v3 initWithName:v5 target:self selector:"performRecoverAXAction"];

  id v9 = v6;
  v7 = +[NSArray arrayWithObjects:&v9 count:1];

  return v7;
}

- (void)performRecoverAXAction
{
}

- (void)_createShuttleBarIfNeeded
{
  v4.receiver = self;
  v4.super_class = (Class)RCRecentlyDeletedCollectionViewCell;
  [(RCRecordingCollectionViewCell *)&v4 _createShuttleBarIfNeeded];
  id v3 = [(RCRecordingCollectionViewCell *)self shuttleBar];
  [v3 setRecentlyDeleted:1];
}

@end