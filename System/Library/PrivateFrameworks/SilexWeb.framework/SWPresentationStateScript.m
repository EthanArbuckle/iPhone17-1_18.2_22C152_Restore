@interface SWPresentationStateScript
- (BOOL)queueable;
- (NSString)executableScript;
- (NSString)identifier;
- (SWPresentationStateScript)initWithPresentationState:(unint64_t)a3;
- (WKUserScript)userScript;
- (unint64_t)presentationState;
@end

@implementation SWPresentationStateScript

- (SWPresentationStateScript)initWithPresentationState:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SWPresentationStateScript;
  result = [(SWPresentationStateScript *)&v5 init];
  if (result) {
    result->_presentationState = a3;
  }
  return result;
}

- (NSString)identifier
{
  return (NSString *)@"presentationState";
}

- (BOOL)queueable
{
  return 0;
}

- (NSString)executableScript
{
  unint64_t v2 = [(SWPresentationStateScript *)self presentationState];
  v3 = @"unknown";
  if (v2 == 1) {
    v3 = @"presented";
  }
  if (v2 == 2) {
    v3 = @"notpresented";
  }
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"var oldPresentationState = applenews.presentationState; applenews.presentationState = '%@'; var event = new CustomEvent('ANPresentationStateChanged', {detail: {newPresentationState:applenews.presentationState, oldPresentationState: oldPresentationState}}); document.dispatchEvent(event);",
                       v3);
}

- (WKUserScript)userScript
{
  return self->userScript;
}

- (unint64_t)presentationState
{
  return self->_presentationState;
}

- (void).cxx_destruct
{
}

@end