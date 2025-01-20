@interface SelectPeopleIntentResponse
- (SelectPeopleIntentResponse)init;
- (SelectPeopleIntentResponse)initWithBackingStore:(id)a3;
- (SelectPeopleIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (SelectPeopleIntentResponse)initWithCoder:(id)a3;
- (SelectPeopleIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation SelectPeopleIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___SelectPeopleIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___SelectPeopleIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (SelectPeopleIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(SelectPeopleIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___SelectPeopleIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(SelectPeopleIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (SelectPeopleIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___SelectPeopleIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SelectPeopleIntentResponse();
  return [(SelectPeopleIntentResponse *)&v3 init];
}

- (SelectPeopleIntentResponse)initWithCoder:(id)a3
{
  return (SelectPeopleIntentResponse *)sub_1C6DB9F38((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (SelectPeopleIntentResponse)initWithBackingStore:(id)a3
{
  return (SelectPeopleIntentResponse *)sub_1C6DB9F38((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (SelectPeopleIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_1C6DBBC30();
  }
  else {
    uint64_t v3 = 0;
  }
  return (SelectPeopleIntentResponse *)SelectPeopleIntentResponse.init(propertiesByName:)(v3);
}

@end