@interface ResumeMediaIntentResponse
- (ResumeMediaIntentResponse)init;
- (ResumeMediaIntentResponse)initWithBackingStore:(id)a3;
- (ResumeMediaIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (ResumeMediaIntentResponse)initWithCoder:(id)a3;
- (ResumeMediaIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation ResumeMediaIntentResponse

- (ResumeMediaIntentResponse)init
{
  return (ResumeMediaIntentResponse *)ResumeMediaIntentResponse.init()();
}

- (void)setCode:(int64_t)a3
{
}

- (int64_t)code
{
  return sub_23283074C();
}

- (ResumeMediaIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (ResumeMediaIntentResponse *)ResumeMediaIntentResponse.init(backingStore:)(a3);
}

- (ResumeMediaIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (ResumeMediaIntentResponse *)ResumeMediaIntentResponse.init(code:userActivity:)(a3, a4);
}

- (ResumeMediaIntentResponse)initWithCoder:(id)a3
{
  return (ResumeMediaIntentResponse *)ResumeMediaIntentResponse.init(coder:)(a3);
}

- (ResumeMediaIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_232A684F8();
  }
  else {
    uint64_t v3 = 0;
  }
  return (ResumeMediaIntentResponse *)ResumeMediaIntentResponse.init(propertiesByName:)(v3);
}

@end