@interface TIAutofillDataHandler
- (void)reportSelectedAutofillCredential:(id)a3 completionHandler:(id)a4;
@end

@implementation TIAutofillDataHandler

- (void)reportSelectedAutofillCredential:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v8;
  id v6 = v7;
  TIDispatchAsync();
}

@end