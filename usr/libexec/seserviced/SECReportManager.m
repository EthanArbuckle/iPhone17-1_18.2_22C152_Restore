@interface SECReportManager
+ (void)kickOff;
- (_TtC10seserviced16SECReportManager)init;
@end

@implementation SECReportManager

- (_TtC10seserviced16SECReportManager)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC10seserviced16SECReportManager_presentmentReportingTaskIdentifier);
  void *v4 = 0xD00000000000002FLL;
  v4[1] = 0x80000001003B84F0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced16SECReportManager_taskInterval) = (Class)0x40F5180000000000;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(SECReportManager *)&v6 init];
}

+ (void)kickOff
{
  if (qword_100453808 != -1) {
    swift_once();
  }
  sub_10022877C();
}

- (void).cxx_destruct
{
}

@end