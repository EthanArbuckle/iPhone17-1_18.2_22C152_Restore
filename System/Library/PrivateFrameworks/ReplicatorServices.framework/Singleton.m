@interface Singleton
- (_TtC18ReplicatorServicesP33_0A2EF918E67C2EDB6C17D3829BB080AE9Singleton)init;
- (_TtC18ReplicatorServicesP33_D9C019F026B67C35EBD66B41D1820C119Singleton)init;
@end

@implementation Singleton

- (_TtC18ReplicatorServicesP33_0A2EF918E67C2EDB6C17D3829BB080AE9Singleton)init
{
  return (_TtC18ReplicatorServicesP33_0A2EF918E67C2EDB6C17D3829BB080AE9Singleton *)sub_25B2F9B7C();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ReplicatorServicesP33_D9C019F026B67C35EBD66B41D1820C119Singleton_connection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ReplicatorServicesP33_D9C019F026B67C35EBD66B41D1820C119Singleton_queue));
  swift_bridgeObjectRelease();
}

- (_TtC18ReplicatorServicesP33_D9C019F026B67C35EBD66B41D1820C119Singleton)init
{
  return (_TtC18ReplicatorServicesP33_D9C019F026B67C35EBD66B41D1820C119Singleton *)sub_25B34A548();
}

@end