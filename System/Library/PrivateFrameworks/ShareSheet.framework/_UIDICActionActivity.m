@interface _UIDICActionActivity
+ (id)newLegacyDelegationActionActivityForCopy;
+ (id)newLegacyDelegationActionActivityForPrint;
+ (id)newLegacyDelegationActionActivityForSaveToCameraRoll;
+ (id)newPreviewActionActivity;
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (_UIDICActionActivity)initWithActivityType:(id)a3 activityImageName:(id)a4 localizedTitle:(id)a5;
- (id)_systemImageName;
- (id)activityFinishedPerformingHandler;
- (id)activityPerformingHandler;
- (id)activityTitle;
- (id)activityType;
- (id)description;
- (void)_cleanup;
- (void)performActivity;
- (void)setActivityFinishedPerformingHandler:(id)a3;
- (void)setActivityPerformingHandler:(id)a3;
@end

@implementation _UIDICActionActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_UIDICActionActivity;
  v4 = [(UIActivity *)&v8 description];
  v5 = [(_UIDICActionActivity *)self activityTitle];
  v6 = [v3 stringWithFormat:@"%@ '%@'", v4, v5];

  return v6;
}

+ (id)newPreviewActionActivity
{
  v2 = [_UIDICActionActivity alloc];
  v3 = _ShareSheetBundle();
  v4 = [v3 localizedStringForKey:@"Quick Look" value:@"Quick Look" table:@"Localizable"];
  v5 = [(_UIDICActionActivity *)v2 initWithActivityType:@"com.apple.UIKit.activity.Quicklook" activityImageName:@"eye" localizedTitle:v4];

  return v5;
}

+ (id)newLegacyDelegationActionActivityForPrint
{
  v2 = [_UIDICActionActivity alloc];
  v3 = _ShareSheetBundle();
  v4 = [v3 localizedStringForKey:@"Print[Activity]" value:@"Print" table:@"Localizable"];
  v5 = [(_UIDICActionActivity *)v2 initWithActivityType:@"com.apple.UIKit.activity.DelegatingPrint" activityImageName:@"printer" localizedTitle:v4];

  return v5;
}

+ (id)newLegacyDelegationActionActivityForCopy
{
  v2 = [_UIDICActionActivity alloc];
  v3 = _ShareSheetBundle();
  v4 = [v3 localizedStringForKey:@"Copy[Activity]" value:@"Copy" table:@"Localizable"];
  v5 = [(_UIDICActionActivity *)v2 initWithActivityType:@"com.apple.UIKit.activity.DelegatingCopy" activityImageName:@"doc.on.doc" localizedTitle:v4];

  return v5;
}

+ (id)newLegacyDelegationActionActivityForSaveToCameraRoll
{
  v2 = [_UIDICActionActivity alloc];
  v3 = _ShareSheetBundle();
  v4 = [v3 localizedStringForKey:@"Save to Camera Roll[Activity]" value:@"Save to Camera Roll" table:@"Localizable"];
  v5 = [(_UIDICActionActivity *)v2 initWithActivityType:@"com.apple.UIKit.activity.DelegatingSaveToCameraRoll" activityImageName:@"square.and.arrow.down" localizedTitle:v4];

  return v5;
}

- (_UIDICActionActivity)initWithActivityType:(id)a3 activityImageName:(id)a4 localizedTitle:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_UIDICActionActivity;
  v12 = [(UIActivity *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_actionActivityType, a3);
    objc_storeStrong((id *)&v13->_activityImageName, a4);
    objc_storeStrong((id *)&v13->_localizedTitle, a5);
  }

  return v13;
}

- (id)activityType
{
  return self->_actionActivityType;
}

- (id)activityTitle
{
  return self->_localizedTitle;
}

- (id)_systemImageName
{
  return self->_activityImageName;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  activityPerformingHandler = (uint64_t (**)(id, _UIDICActionActivity *))self->_activityPerformingHandler;
  if (activityPerformingHandler)
  {
    uint64_t v4 = activityPerformingHandler[2](activityPerformingHandler, self);
    id v5 = self->_activityPerformingHandler;
    self->_activityPerformingHandler = 0;
  }
  else
  {
    uint64_t v4 = 1;
  }
  [(UIActivity *)self activityDidFinish:v4];
}

- (void)_cleanup
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDICActionActivity;
  [(UIActivity *)&v5 _cleanup];
  activityFinishedPerformingHandler = (void (**)(id, _UIDICActionActivity *))self->_activityFinishedPerformingHandler;
  if (activityFinishedPerformingHandler)
  {
    activityFinishedPerformingHandler[2](activityFinishedPerformingHandler, self);
    id v4 = self->_activityFinishedPerformingHandler;
    self->_activityFinishedPerformingHandler = 0;
  }
}

- (id)activityPerformingHandler
{
  return self->_activityPerformingHandler;
}

- (void)setActivityPerformingHandler:(id)a3
{
}

- (id)activityFinishedPerformingHandler
{
  return self->_activityFinishedPerformingHandler;
}

- (void)setActivityFinishedPerformingHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activityFinishedPerformingHandler, 0);
  objc_storeStrong(&self->_activityPerformingHandler, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_activityImageName, 0);
  objc_storeStrong((id *)&self->_actionActivityType, 0);
}

@end