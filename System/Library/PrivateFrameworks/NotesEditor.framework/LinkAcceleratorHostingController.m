@interface LinkAcceleratorHostingController
- (_TtC11NotesEditor32LinkAcceleratorHostingController)initWithCoder:(id)a3;
- (_TtC11NotesEditor32LinkAcceleratorHostingController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation LinkAcceleratorHostingController

- (_TtC11NotesEditor32LinkAcceleratorHostingController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_20C162AC0();
    v8 = (char *)self + OBJC_IVAR____TtC11NotesEditor32LinkAcceleratorHostingController_acceleratorHostingDelegate;
    *(_OWORD *)v8 = 0u;
    *((_OWORD *)v8 + 1) = 0u;
    *((void *)v8 + 4) = 0;
    id v9 = a4;
    a3 = (id)sub_20C162A80();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = (char *)self + OBJC_IVAR____TtC11NotesEditor32LinkAcceleratorHostingController_acceleratorHostingDelegate;
    *(_OWORD *)v10 = 0u;
    *((_OWORD *)v10 + 1) = 0u;
    *((void *)v10 + 4) = 0;
    id v11 = a4;
  }
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = [(LinkAcceleratorHostingController *)&v14 initWithNibName:a3 bundle:a4];

  return v12;
}

- (_TtC11NotesEditor32LinkAcceleratorHostingController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (char *)self + OBJC_IVAR____TtC11NotesEditor32LinkAcceleratorHostingController_acceleratorHostingDelegate;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((void *)v6 + 4) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(LinkAcceleratorHostingController *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end