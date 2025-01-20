@interface PPXFeedViewController
- (BOOL)runningInExtension;
- (CGSize)_windowSize;
- (PPXFeedViewController)initWithOptions:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation PPXFeedViewController

- (PPXFeedViewController)initWithOptions:(id)a3
{
  if (a3) {
    id v4 = [a3 mutableCopy];
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  v5 = v4;
  objc_opt_class();
  v6 = [v5 objectForKeyedSubscript:@"metadata"];
  v7 = BUDynamicCast();
  v8 = +[JSAFeedMetadata metadataDictionary:v7 variationWithNavigationBarStyle:1];

  [v5 setObject:v8 forKeyedSubscript:@"metadata"];
  v11.receiver = self;
  v11.super_class = (Class)PPXFeedViewController;
  v9 = [(PPXFeedViewController *)&v11 initWithOptions:v5];

  return v9;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PPXFeedViewController;
  [(PPXFeedViewController *)&v4 viewDidDisappear:a3];
  [(PPXFeedViewController *)self suspendAndTeardownForReason:@"PPX disappear"];
}

- (BOOL)runningInExtension
{
  return 1;
}

- (CGSize)_windowSize
{
  v2 = +[PPXJSAWindowProvider sharedProvider];
  v3 = [v2 window];

  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

@end