@interface LyonStepUpHelper
- (_TtC10seserviced16LyonStepUpHelper)init;
@end

@implementation LyonStepUpHelper

- (_TtC10seserviced16LyonStepUpHelper)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced16LyonStepUpHelper_endpointId) = xmmword_100378280;
  *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced16LyonStepUpHelper_stepUpSK) = xmmword_100378280;
  id v4 = objc_allocWithZone((Class)STSHelperLibrary);
  v5 = self;
  v6 = (objc_class *)[v4 init];
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC10seserviced16LyonStepUpHelper_stsHelper) = v6;

  v8.receiver = v5;
  v8.super_class = ObjectType;
  return [(LyonStepUpHelper *)&v8 init];
}

- (void).cxx_destruct
{
  sub_100075868(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced16LyonStepUpHelper_endpointId), *(void *)&self->stsHelper[OBJC_IVAR____TtC10seserviced16LyonStepUpHelper_endpointId]);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced16LyonStepUpHelper_stepUpSK);
  unint64_t v4 = *(void *)&self->stsHelper[OBJC_IVAR____TtC10seserviced16LyonStepUpHelper_stepUpSK];

  sub_100075868(v3, v4);
}

@end