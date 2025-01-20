@interface WorkoutRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (_TtC12WorkoutKitUI27WorkoutRemoteViewController)initWithCoder:(id)a3;
- (_TtC12WorkoutKitUI27WorkoutRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismiss;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation WorkoutRemoteViewController

+ (id)serviceViewControllerInterface
{
  return sub_2619EDD98((uint64_t)a1, (uint64_t)a2, &protocolRef_WorkoutRemoteViewServiceInterface);
}

+ (id)exportedInterface
{
  return sub_2619EDD98((uint64_t)a1, (uint64_t)a2, &protocolRef_WorkoutRemoteViewServiceExportedInterface);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  v4 = self;
  if (a3)
  {
    id v5 = a3;
    v6 = (void *)sub_2619EE770();
  }
  else
  {
    v6 = 0;
  }
  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for WorkoutRemoteViewController();
  [(_UIRemoteViewController *)&v7 viewServiceDidTerminateWithError:v6];

  [(WorkoutRemoteViewController *)v4 dismiss];
}

- (_TtC12WorkoutKitUI27WorkoutRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_2619EE7F0();
    v6 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC12WorkoutKitUI27WorkoutRemoteViewController_dismissHandler);
    void *v6 = 0;
    v6[1] = 0;
    id v7 = a4;
    v8 = (void *)sub_2619EE7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC12WorkoutKitUI27WorkoutRemoteViewController_dismissHandler);
    void *v9 = 0;
    v9[1] = 0;
    id v10 = a4;
    v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for WorkoutRemoteViewController();
  v11 = [(WorkoutRemoteViewController *)&v13 initWithNibName:v8 bundle:a4];

  return v11;
}

- (_TtC12WorkoutKitUI27WorkoutRemoteViewController)initWithCoder:(id)a3
{
  id v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC12WorkoutKitUI27WorkoutRemoteViewController_dismissHandler);
  v6 = (objc_class *)type metadata accessor for WorkoutRemoteViewController();
  *id v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(WorkoutRemoteViewController *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_2619EC4B8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC12WorkoutKitUI27WorkoutRemoteViewController_dismissHandler));
}

- (void)dismiss
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC12WorkoutKitUI27WorkoutRemoteViewController_dismissHandler);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_2619ED8F4((uint64_t)v2);
    v2(v3);
    sub_2619EC4B8((uint64_t)v2);
  }
}

@end