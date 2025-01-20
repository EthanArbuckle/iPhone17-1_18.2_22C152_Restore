@interface UITextAutofillSuggestion
+ (id)autofillSuggestionWithUsername:(id)a3 password:(id)a4;
- (NSString)password;
- (NSString)username;
- (UITextAutofillSuggestion)initWithUsername:(id)a3 password:(id)a4;
- (id)_keyboardCandidate;
@end

@implementation UITextAutofillSuggestion

+ (id)autofillSuggestionWithUsername:(id)a3 password:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithUsername:v7 password:v6];

  return v8;
}

- (UITextAutofillSuggestion)initWithUsername:(id)a3 password:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UITextAutofillSuggestion;
  v9 = [(UITextSuggestion *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_username, a3);
    objc_storeStrong((id *)&v10->_password, a4);
  }

  return v10;
}

- (id)_keyboardCandidate
{
  return +[TIKeyboardCandidateSuggestion candidateWithSuggestion:self customInfoType:24];
}

- (NSString)username
{
  return self->_username;
}

- (NSString)password
{
  return self->_password;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end