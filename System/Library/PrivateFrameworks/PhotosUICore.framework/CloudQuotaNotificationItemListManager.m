@interface CloudQuotaNotificationItemListManager
- (_TtC12PhotosUICore37CloudQuotaNotificationItemListManager)init;
- (id)presentingViewControllerForCloudQuotaControllerHelper:(id)a3;
- (void)cloudQuotaControllerHelper:(id)a3 informationViewDidChange:(id)a4;
@end

@implementation CloudQuotaNotificationItemListManager

- (void)cloudQuotaControllerHelper:(id)a3 informationViewDidChange:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = self;
  sub_1A9C83AE8();
}

- (id)presentingViewControllerForCloudQuotaControllerHelper:(id)a3
{
  v4 = *(uint64_t (**)(void))(**(void **)((char *)&self->super.isa
                                         + OBJC_IVAR____TtC12PhotosUICore37CloudQuotaNotificationItemListManager_presentationContext)
                           + 88);
  id v5 = a3;
  id v6 = self;
  uint64_t v7 = v4();
  if (v7)
  {
    id v8 = (void *)v7;

    return v8;
  }
  else
  {
    id result = (id)sub_1AB23C1FC();
    __break(1u);
  }
  return result;
}

- (_TtC12PhotosUICore37CloudQuotaNotificationItemListManager)init
{
  id result = (_TtC12PhotosUICore37CloudQuotaNotificationItemListManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore37CloudQuotaNotificationItemListManager_helper));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore37CloudQuotaNotificationItemListManager_statusProvider));
  swift_unknownObjectRelease();
  sub_1A9C841D4((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore37CloudQuotaNotificationItemListManager__itemList);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore37CloudQuotaNotificationItemListManager_observable));
  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore37CloudQuotaNotificationItemListManager___observationRegistrar;
  uint64_t v4 = sub_1AB230BAC();
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end