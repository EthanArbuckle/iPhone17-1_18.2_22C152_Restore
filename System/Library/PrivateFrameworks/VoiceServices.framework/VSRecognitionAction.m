@interface VSRecognitionAction
- (BOOL)_hasDeferredStartCallback;
- (BOOL)sensitiveActionsEnabled;
- (id)_session;
- (id)cancel;
- (id)perform;
- (id)resultDisplayString;
- (id)spokenFeedbackAttributedString;
- (id)spokenFeedbackString;
- (id)statusDisplayString;
- (int)completionType;
- (void)_setSession:(id)a3;
- (void)completeWithNextAction:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)setResultDisplayString:(id)a3;
- (void)setSpokenFeedbackAttributedString:(id)a3;
- (void)setSpokenFeedbackString:(id)a3;
- (void)setStatusDisplayString:(id)a3;
@end

@implementation VSRecognitionAction

- (BOOL)sensitiveActionsEnabled
{
  return [(VSRecognitionSession *)self->_session sensitiveActionsEnabled];
}

- (BOOL)_hasDeferredStartCallback
{
  return 0;
}

- (void)completeWithNextAction:(id)a3 error:(id)a4
{
}

- (id)cancel
{
  return 0;
}

- (id)perform
{
  userInfoKeys[1] = *(void **)MEMORY[0x263EF8340];
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  v3 = (void *)*MEMORY[0x263EFFC48];
  userInfoValues = @"recognition action not implemented";
  userInfoKeys[0] = v3;
  CFErrorRef v4 = CFErrorCreateWithUserInfoKeysAndValues(v2, @"VSErrorDomain", -4009, (const void *const *)userInfoKeys, (const void *const *)&userInfoValues, 1);
  return v4;
}

- (int)completionType
{
  return 0;
}

- (void)setSpokenFeedbackAttributedString:(id)a3
{
  stringValue = self->_spokenString.stringValue;
  if ((*((unsigned char *)self + 40) & 1) == 0 || stringValue != a3)
  {

    self->_spokenString.stringValue = (NSString *)a3;
    *((unsigned char *)self + 40) |= 1u;
  }
}

- (id)spokenFeedbackAttributedString
{
  if (*((unsigned char *)self + 40)) {
    return self->_spokenString.stringValue;
  }
  else {
    return 0;
  }
}

- (void)setSpokenFeedbackString:(id)a3
{
  stringValue = self->_spokenString.stringValue;
  if ((*((unsigned char *)self + 40) & 1) != 0 || stringValue != a3)
  {

    self->_spokenString.stringValue = (NSString *)a3;
    *((unsigned char *)self + 40) &= ~1u;
  }
}

- (id)spokenFeedbackString
{
  char v2 = *((unsigned char *)self + 40);
  id result = self->_spokenString.stringValue;
  if (v2) {
    return (id)[result string];
  }
  return result;
}

- (void)setStatusDisplayString:(id)a3
{
  statusString = self->_statusString;
  if (statusString != a3)
  {

    self->_statusString = (NSString *)a3;
  }
}

- (id)statusDisplayString
{
  return self->_statusString;
}

- (void)setResultDisplayString:(id)a3
{
  resultString = self->_resultString;
  if (resultString != a3)
  {

    self->_resultString = (NSString *)a3;
  }
}

- (id)resultDisplayString
{
  return self->_resultString;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VSRecognitionAction;
  [(VSRecognitionAction *)&v3 dealloc];
}

- (void)_setSession:(id)a3
{
  self->_session = (VSRecognitionSession *)a3;
}

- (id)_session
{
  return self->_session;
}

@end