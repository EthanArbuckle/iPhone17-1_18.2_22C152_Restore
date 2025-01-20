@interface APPCTapAction
+ (id)actionFor:(id)a3;
- (APPCTapAction)init;
- (APPCTapAction)initWithActionType:(int64_t)a3 confirmedClickInterval:(double)a4;
- (double)confirmedClickInterval;
- (int64_t)actionType;
- (void)performActionWithCompletion:(id)a3;
@end

@implementation APPCTapAction

- (int64_t)actionType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___APPCTapAction_actionType);
}

- (double)confirmedClickInterval
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___APPCTapAction_confirmedClickInterval);
}

- (APPCTapAction)initWithActionType:(int64_t)a3 confirmedClickInterval:(double)a4
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCTapAction_actionType) = (Class)a3;
  *(double *)((char *)&self->super.isa + OBJC_IVAR___APPCTapAction_confirmedClickInterval) = a4;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TapAction();
  return [(APPCTapAction *)&v5 init];
}

- (void)performActionWithCompletion:(id)a3
{
  v3 = _Block_copy(a3);
  _Block_release(v3);
}

+ (id)actionFor:(id)a3
{
  id v4 = a3;
  id v5 = _s15PromotedContent9TapActionC6action3forACSgSo05APTapD0CSg_tFZ_0(a3);

  return v5;
}

- (APPCTapAction)init
{
  result = (APPCTapAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end