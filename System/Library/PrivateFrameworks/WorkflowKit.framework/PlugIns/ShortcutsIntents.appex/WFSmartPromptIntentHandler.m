@interface WFSmartPromptIntentHandler
- (void)handleSmartPrompt:(id)a3 completion:(id)a4;
- (void)provideSelectedButtonOptionsCollectionForSmartPrompt:(id)a3 withCompletion:(id)a4;
- (void)resolveSelectedButtonForSmartPrompt:(id)a3 withCompletion:(id)a4;
@end

@implementation WFSmartPromptIntentHandler

- (void)resolveSelectedButtonForSmartPrompt:(id)a3 withCompletion:(id)a4
{
  v5 = (void (**)(id, void *))a4;
  id v6 = a3;
  v7 = [v6 selectedButton];

  if (v7)
  {
    id v9 = [v6 selectedButton];

    +[WFSmartPromptButtonResolutionResult successWithResolvedSmartPromptButton:v9];
  }
  else
  {
    id v9 = [v6 buttons];

    +[WFSmartPromptButtonResolutionResult disambiguationWithSmartPromptButtonsToDisambiguate:v9];
  v8 = };
  v5[2](v5, v8);
}

- (void)provideSelectedButtonOptionsCollectionForSmartPrompt:(id)a3 withCompletion:(id)a4
{
  v5 = (void (**)(id, id, void))a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)INObjectCollection);
  v8 = [v6 buttons];

  id v9 = [v7 initWithItems:v8];
  v5[2](v5, v9, 0);
}

- (void)handleSmartPrompt:(id)a3 completion:(id)a4
{
  v5 = (void (**)(id, WFSmartPromptIntentResponse *))a4;
  id v6 = a3;
  v11 = [[WFSmartPromptIntentResponse alloc] initWithCode:4 userActivity:0];
  id v7 = [v6 selectedButton];

  v8 = [v7 identifier];

  if ([v8 isEqualToString:WFSmartPromptButtonIdentifierHandoff])
  {
    uint64_t v9 = 3;
  }
  else if ([v8 isEqualToString:WFSmartPromptButtonIdentifierAllowOnce])
  {
    uint64_t v9 = 2;
  }
  else if ([v8 isEqualToString:WFSmartPromptButtonIdentifierAllowAlways])
  {
    uint64_t v9 = 1;
  }
  else if ([v8 isEqualToString:WFSmartPromptButtonIdentifierDontDelete])
  {
    uint64_t v9 = 5;
  }
  else
  {
    uint64_t v9 = 0;
  }
  v10 = +[NSNumber numberWithUnsignedInteger:v9];
  [(WFSmartPromptIntentResponse *)v11 setAuthorizationResult:v10];

  v5[2](v5, v11);
}

@end