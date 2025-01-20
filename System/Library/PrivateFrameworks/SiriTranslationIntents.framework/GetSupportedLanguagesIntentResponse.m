@interface GetSupportedLanguagesIntentResponse
- (GetSupportedLanguagesIntentResponse)init;
- (GetSupportedLanguagesIntentResponse)initWithBackingStore:(id)a3;
- (GetSupportedLanguagesIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (GetSupportedLanguagesIntentResponse)initWithCoder:(id)a3;
- (GetSupportedLanguagesIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation GetSupportedLanguagesIntentResponse

- (int64_t)code
{
  return GetSupportedLanguagesIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
}

- (GetSupportedLanguagesIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (GetSupportedLanguagesIntentResponse *)GetSupportedLanguagesIntentResponse.init(code:userActivity:)(a3, a4);
}

- (GetSupportedLanguagesIntentResponse)init
{
  return (GetSupportedLanguagesIntentResponse *)GetSupportedLanguagesIntentResponse.init()();
}

- (GetSupportedLanguagesIntentResponse)initWithCoder:(id)a3
{
  return (GetSupportedLanguagesIntentResponse *)GetSupportedLanguagesIntentResponse.init(coder:)(a3);
}

- (GetSupportedLanguagesIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (GetSupportedLanguagesIntentResponse *)GetSupportedLanguagesIntentResponse.init(backingStore:)(a3);
}

- (GetSupportedLanguagesIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_236FB28E0();
  }
  else {
    uint64_t v3 = 0;
  }
  return (GetSupportedLanguagesIntentResponse *)GetSupportedLanguagesIntentResponse.init(propertiesByName:)(v3);
}

@end