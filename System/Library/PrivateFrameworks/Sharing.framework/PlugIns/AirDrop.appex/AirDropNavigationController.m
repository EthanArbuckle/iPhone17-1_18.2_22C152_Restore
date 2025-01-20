@interface AirDropNavigationController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (_TtC7AirDrop27AirDropNavigationController)initWithCoder:(id)a3;
- (_TtC7AirDrop27AirDropNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC7AirDrop27AirDropNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7AirDrop27AirDropNavigationController)initWithRootViewController:(id)a3;
- (void)airDropViewServiceDidFinishTransferWithSuccess:(BOOL)a3;
- (void)airDropViewServiceDidRequestDismissal;
- (void)airDropViewServiceDidStartTransfer;
- (void)airDropViewServiceRequestingSendingAppBundleIdentifierWithCompletionHandler:(id)a3;
- (void)airDropViewServiceRequestingSharedItemsWithDataRequest:(id)a3 completionHandler:(id)a4;
- (void)airDropViewServiceWillStartTransferToRecipient:(id)a3;
- (void)beginRequestWithExtensionContext:(id)a3;
@end

@implementation AirDropNavigationController

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  AirDropNavigationController.beginRequest(with:)((NSExtensionContext)v4);
}

+ (id)_remoteViewControllerInterface
{
  return sub_10001E078((uint64_t)a1, (uint64_t)a2, &protocolRef_SFAirDropViewServiceHostProtocol);
}

+ (id)_exportedInterface
{
  return sub_10001E078((uint64_t)a1, (uint64_t)a2, &protocolRef_SFAirDropViewServiceProtocol);
}

- (_TtC7AirDrop27AirDropNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  v8 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC7AirDrop27AirDropNavigationController_AirDropNoContentViewKey);
  void *v8 = 0xD000000000000011;
  v8[1] = 0x800000010002C340;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return [(AirDropNavigationController *)&v10 initWithNavigationBarClass:a3 toolbarClass:a4];
}

- (_TtC7AirDrop27AirDropNavigationController)initWithRootViewController:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC7AirDrop27AirDropNavigationController_AirDropNoContentViewKey);
  void *v6 = 0xD000000000000011;
  v6[1] = 0x800000010002C340;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(AirDropNavigationController *)&v8 initWithRootViewController:a3];
}

- (_TtC7AirDrop27AirDropNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (!a3)
  {
    v12 = (Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC7AirDrop27AirDropNavigationController_AirDropNoContentViewKey);
    void *v12 = 0xD000000000000011;
    v12[1] = 0x800000010002C340;
    goto LABEL_5;
  }
  sub_100023090();
  objc_super v8 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC7AirDrop27AirDropNavigationController_AirDropNoContentViewKey);
  void *v8 = 0xD000000000000011;
  v8[1] = 0x800000010002C340;
  if (!v9)
  {
LABEL_5:
    id v13 = a4;
    NSString v11 = 0;
    goto LABEL_6;
  }
  id v10 = a4;
  NSString v11 = sub_100023080();
  swift_bridgeObjectRelease();
LABEL_6:
  v16.receiver = self;
  v16.super_class = ObjectType;
  v14 = [(AirDropNavigationController *)&v16 initWithNibName:v11 bundle:a4];

  return v14;
}

- (_TtC7AirDrop27AirDropNavigationController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC7AirDrop27AirDropNavigationController_AirDropNoContentViewKey);
  void *v6 = 0xD000000000000011;
  v6[1] = 0x800000010002C340;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(AirDropNavigationController *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

- (void)airDropViewServiceWillStartTransferToRecipient:(id)a3
{
  id v5 = a3;
  v6 = self;
  AirDropNavigationController.airDropViewServiceWillStartTransfer(to:)((uint64_t)a3);
}

- (void)airDropViewServiceDidStartTransfer
{
}

- (void)airDropViewServiceDidFinishTransferWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = self;
  id v4 = (void *)sub_10001DB80();
  if (v4)
  {
    [v4 airDropViewServiceDidFinishTransferWithSuccess:v3];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)airDropViewServiceRequestingSharedItemsWithDataRequest:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_10001F468;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  uint64_t v9 = self;
  AirDropNavigationController.airDropViewServiceRequestingSharedItems(with:completionHandler:)((uint64_t)a3, (uint64_t)v6, v7);
  sub_10001F418((uint64_t)v6);
}

- (void)airDropViewServiceRequestingSendingAppBundleIdentifierWithCompletionHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    uint64_t v7 = sub_10001F460;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  id v8 = self;
  AirDropNavigationController.airDropViewServiceRequestingSendingAppBundleIdentifier(completionHandler:)((uint64_t)v7, v6);
  sub_10001F418((uint64_t)v7);
}

- (void)airDropViewServiceDidRequestDismissal
{
}

@end