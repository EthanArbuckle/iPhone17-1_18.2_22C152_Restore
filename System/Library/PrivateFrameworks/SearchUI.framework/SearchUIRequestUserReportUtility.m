@interface SearchUIRequestUserReportUtility
+ (id)createUserReportViewControllerWith:(id)a3 rowModel:(id)a4 environment:(id)a5;
- (SearchUIRequestUserReportUtility)init;
@end

@implementation SearchUIRequestUserReportUtility

+ (id)createUserReportViewControllerWith:(id)a3 rowModel:(id)a4 environment:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)sub_1E4684CB0(v7, v8, v9);

  return v10;
}

- (SearchUIRequestUserReportUtility)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RequestUserReportUtility();
  return [(SearchUIRequestUserReportUtility *)&v3 init];
}

@end