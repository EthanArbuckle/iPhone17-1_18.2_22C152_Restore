@interface PXStoryAsyncPlayerDiagnosticsService
- (BOOL)canPerformAction;
- (NSString)title;
- (PXStoryAsyncPlayerDiagnosticsService)initWithItemProviders:(id)a3;
- (void)performAction;
@end

@implementation PXStoryAsyncPlayerDiagnosticsService

- (PXStoryAsyncPlayerDiagnosticsService)initWithItemProviders:(id)a3
{
  sub_1A9B21070(0, &qword_1E983A088);
  unint64_t v3 = sub_1AB23AADC();
  StoryAsyncPlayerDiagnosticsService.init(itemProviders:)(v3);
}

- (NSString)title
{
  v2 = (void *)sub_1AB23A72C();
  return (NSString *)v2;
}

- (BOOL)canPerformAction
{
  return 1;
}

- (void)performAction
{
  v2 = self;
  sub_1AA7BB908();
}

- (void).cxx_destruct
{
}

@end