@interface FMPersonAnnotation
@end

@implementation FMPersonAnnotation

- (void).cxx_destruct
{
  sub_100009EF4((uint64_t)self + OBJC_IVAR____TtC26FindMyNotificationsContent18FMPersonAnnotation_person, &qword_10001EA28);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent18FMPersonAnnotation_personImage));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC26FindMyNotificationsContent18FMPersonAnnotation_updateQueue);
}

@end