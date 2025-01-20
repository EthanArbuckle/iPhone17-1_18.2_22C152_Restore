@interface ATAOpenURLController
- (id)completionHandler;
- (void)prepareParsedOpenURL:(id)a3 withCompletionHandler:(id)a4;
- (void)setCompletionHandler:(id)a3;
@end

@implementation ATAOpenURLController

- (void)prepareParsedOpenURL:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (v6)
  {
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    +[NSException raise:NSInvalidArgumentException, @"The %@ parameter must not be nil.", @"parsedOpenURL" format];
    if (v5) {
      goto LABEL_3;
    }
  }
  +[NSException raise:NSInvalidArgumentException, @"The %@ parameter must not be nil.", @"completionHandler" format];
LABEL_3:
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end