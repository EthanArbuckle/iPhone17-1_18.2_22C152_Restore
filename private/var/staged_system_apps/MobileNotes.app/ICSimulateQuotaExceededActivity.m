@interface ICSimulateQuotaExceededActivity
- (ICNote)note;
- (ICSimulateQuotaExceededActivity)init;
- (ICSimulateQuotaExceededActivity)initWithNote:(id)a3;
- (ICSimulateQuotaExceededActivity)initWithPerformActivity:(id)a3;
- (NSString)activityTitle;
- (NSString)activityType;
- (UIImage)activityImage;
- (void)performActivityWithCompletion:(id)a3;
@end

@implementation ICSimulateQuotaExceededActivity

- (ICNote)note
{
  return (ICNote *)*(id *)&self->ICActivity_opaque[OBJC_IVAR___ICSimulateQuotaExceededActivity_note];
}

- (ICSimulateQuotaExceededActivity)initWithNote:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->ICActivity_opaque[OBJC_IVAR___ICSimulateQuotaExceededActivity_note] = a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = a3;
  return [(ICSimulateQuotaExceededActivity *)&v8 init];
}

- (NSString)activityTitle
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (UIImage)activityImage
{
  NSString v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [self systemImageNamed:v3];

  return (UIImage *)v4;
}

- (NSString)activityType
{
  NSString v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();

  return (NSString *)v3;
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    *(void *)(swift_allocObject() + 16) = v4;
    v5 = sub_100262970;
  }
  else
  {
    v5 = 0;
  }
  id v6 = self;
  sub_1003C0090();
  sub_10002E70C((uint64_t)v5);
}

- (ICSimulateQuotaExceededActivity)initWithPerformActivity:(id)a3
{
  _Block_copy(a3);
  result = (ICSimulateQuotaExceededActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (ICSimulateQuotaExceededActivity)init
{
  result = (ICSimulateQuotaExceededActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end