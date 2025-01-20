@interface SDAirDropReceiveClassroomHandler
- (SDAirDropAlertManagerDelegate)classroomDelegate;
- (SDAirDropAlertManagerDelegate)delegate;
- (_TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler)init;
- (void)askEventForRecordID:(id)a3 withResults:(id)a4;
- (void)cancelEventForRecordID:(id)a3 withResults:(id)a4;
- (void)errorEventForRecordID:(id)a3 withResults:(id)a4;
- (void)finishedEventForRecordID:(id)a3 withResults:(id)a4;
- (void)setClassroomDelegate:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SDAirDropReceiveClassroomHandler

- (SDAirDropAlertManagerDelegate)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (SDAirDropAlertManagerDelegate *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (SDAirDropAlertManagerDelegate)classroomDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (SDAirDropAlertManagerDelegate *)Strong;
}

- (void)setClassroomDelegate:(id)a3
{
}

- (void)askEventForRecordID:(id)a3 withResults:(id)a4
{
}

- (void)cancelEventForRecordID:(id)a3 withResults:(id)a4
{
}

- (void)errorEventForRecordID:(id)a3 withResults:(id)a4
{
}

- (void)finishedEventForRecordID:(id)a3 withResults:(id)a4
{
}

- (_TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler)init
{
  result = (_TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_100261080((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler_delegate);
  sub_100261080((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler_classroomDelegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler_queue));

  swift_bridgeObjectRelease();
}

@end