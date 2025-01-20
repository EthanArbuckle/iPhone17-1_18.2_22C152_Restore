@interface SUScriptComposeReviewViewController
+ (id)webScriptNameForKey:(const char *)a3;
- (SUScriptComposeReviewViewController)init;
- (SUScriptComposeReviewViewController)initWithScriptReview:(id)a3 clientInterface:(id)a4;
- (SUScriptReview)review;
- (id)_className;
- (id)newNativeViewController;
- (id)scriptAttributeKeys;
- (void)setReview:(id)a3;
@end

@implementation SUScriptComposeReviewViewController

- (SUScriptComposeReviewViewController)init
{
  return [(SUScriptComposeReviewViewController *)self initWithScriptReview:0 clientInterface:0];
}

- (SUScriptComposeReviewViewController)initWithScriptReview:(id)a3 clientInterface:(id)a4
{
  [a3 infoURL];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7.receiver = self;
    v7.super_class = (Class)SUScriptComposeReviewViewController;
    v5 = [(SUScriptObject *)&v7 init];
    if (v5) {
      WebThreadRunOnMainThread();
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

void __76__SUScriptComposeReviewViewController_initWithScriptReview_clientInterface___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSURL URLWithString:*(void *)(a1 + 32)];
  v3 = (SUComposeReviewViewController *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "viewControllerFactory"), "newComposeReviewViewControllerWithCompositionURL:", v2);
  if (!v3) {
    v3 = [[SUComposeReviewViewController alloc] initWithCompositionURL:v2];
  }
  v4 = v3;
  [(SUViewController *)v3 setClientInterface:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) setNativeViewController:v4];
}

- (id)newNativeViewController
{
  uint64_t v2 = [(SUScriptObject *)self clientInterface];
  v3 = [(SUViewControllerFactory *)[(SUClientInterface *)v2 viewControllerFactory] newComposeReviewViewControllerWithCompositionURL:0];
  if (!v3) {
    v3 = [[SUComposeReviewViewController alloc] initWithCompositionURL:0];
  }
  [(SUViewController *)v3 setClientInterface:v2];
  return v3;
}

- (id)_className
{
  return @"iTunesComposeReviewViewController";
}

- (SUScriptReview)review
{
  return 0;
}

- (void)setReview:(id)a3
{
  v3 = (void *)MEMORY[0x263F1FA90];
  uint64_t v4 = [NSString stringWithFormat:@"%@ is readonly", @"review"];

  [v3 throwException:v4];
}

+ (id)webScriptNameForKey:(const char *)a3
{
  id result = (id)SUWebScriptNameForKey((char *)a3, (uint64_t)&__KeyMapping, 1);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptComposeReviewViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKey_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptComposeReviewViewController;
  id v2 = [(SUScriptViewController *)&v4 scriptAttributeKeys];
  SUWebScriptAddPropertyKeysToArray((uint64_t)v2, (uint64_t)&__KeyMapping, 1);
  return v2;
}

@end