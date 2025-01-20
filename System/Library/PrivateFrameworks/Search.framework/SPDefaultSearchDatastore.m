@interface SPDefaultSearchDatastore
- (id)feedbackListeners;
- (id)performQuery:(id)a3;
- (unsigned)domain;
@end

@implementation SPDefaultSearchDatastore

- (id)performQuery:(id)a3
{
  return 0;
}

- (unsigned)domain
{
  return 5;
}

- (id)feedbackListeners
{
  if (NSClassFromString(@"ATXSearchFeedbackListener"))
  {
    id v2 = objc_alloc_init((Class)ATXSearchFeedbackListener);
    id v5 = v2;
    v3 = +[NSArray arrayWithObjects:&v5 count:1];
  }
  else
  {
    v3 = &__NSArray0__struct;
  }

  return v3;
}

@end