@interface FMPersonAnnotation
@end

@implementation FMPersonAnnotation

- (void).cxx_destruct
{
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy18FMPersonAnnotation_person, &qword_1006AF740);

  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6FindMy18FMPersonAnnotation_updateQueue);
}

@end