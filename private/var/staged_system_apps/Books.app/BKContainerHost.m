@interface BKContainerHost
- (BKContainerHost)init;
- (BKContainerHost)initWithLaunchCoordinator:(id)a3;
- (TFResolver)bridgedResolver;
@end

@implementation BKContainerHost

- (BKContainerHost)initWithLaunchCoordinator:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKContainerHost____lazy_storage___containerManager) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKContainerHost____lazy_storage___container) = 0;
  v6 = (char *)self + OBJC_IVAR___BKContainerHost____lazy_storage___resolver;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((void *)v6 + 4) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKContainerHost_launchCoordinator) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  swift_unknownObjectRetain();
  return [(BKContainerHost *)&v8 init];
}

- (TFResolver)bridgedResolver
{
  v2 = self;
  sub_100029A0C();
  sub_1007F4D80();
  swift_release();
  sub_10005DA74(v5, v5[3]);
  v3 = (void *)sub_1007F4C40();
  _s5Books15CurrentPageViewVwxx_0((uint64_t)v5);

  return (TFResolver *)v3;
}

- (BKContainerHost)init
{
  result = (BKContainerHost *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end