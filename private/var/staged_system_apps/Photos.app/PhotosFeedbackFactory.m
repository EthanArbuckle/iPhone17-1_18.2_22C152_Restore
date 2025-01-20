@interface PhotosFeedbackFactory
+ (id)makeCentralizedFeedbackActionPerformerWithParentViewController:(id)a3;
- (PhotosFeedbackFactory)init;
@end

@implementation PhotosFeedbackFactory

+ (id)makeCentralizedFeedbackActionPerformerWithParentViewController:(id)a3
{
  id v3 = a3;
  id v4 = static PhotosFeedbackFactory.makeCentralizedFeedbackActionPerformer(parentViewController:)(v3);

  return v4;
}

- (PhotosFeedbackFactory)init
{
  return (PhotosFeedbackFactory *)PhotosFeedbackFactory.init()();
}

@end