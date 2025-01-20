@interface TagIntentResponse
- (TagIntentResponse)init;
- (TagIntentResponse)initWithBackingStore:(id)a3;
- (TagIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (TagIntentResponse)initWithCoder:(id)a3;
- (TagIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation TagIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___TagIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___TagIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (TagIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(TagIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___TagIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(TagIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (TagIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___TagIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TagIntentResponse();
  return [(TagIntentResponse *)&v3 init];
}

- (TagIntentResponse)initWithCoder:(id)a3
{
  return (TagIntentResponse *)sub_10000DF10((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (TagIntentResponse)initWithBackingStore:(id)a3
{
  return (TagIntentResponse *)sub_10000DF10((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (TagIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_10000FCF0();
  }
  else {
    uint64_t v3 = 0;
  }
  return (TagIntentResponse *)TagIntentResponse.init(propertiesByName:)(v3);
}

@end