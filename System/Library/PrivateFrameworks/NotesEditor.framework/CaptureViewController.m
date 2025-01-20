@interface CaptureViewController
- (BOOL)shouldAutorotate;
- (_TtC11NotesEditorP33_4045383A19295915DBCF26644168878021CaptureViewController)initWithCoder:(id)a3;
- (_TtC11NotesEditorP33_4045383A19295915DBCF26644168878021CaptureViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC11NotesEditorP33_4045383A19295915DBCF26644168878021CaptureViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC11NotesEditorP33_4045383A19295915DBCF26644168878021CaptureViewController)initWithRootViewController:(id)a3;
@end

@implementation CaptureViewController

- (BOOL)shouldAutorotate
{
  if ((*((unsigned char *)&self->super.super.super.super.super.isa
        + OBJC_IVAR____TtC11NotesEditorP33_4045383A19295915DBCF26644168878021CaptureViewController_disableAutorotate) & 1) != 0)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(CaptureViewController *)&v3 shouldAutorotate];
}

- (_TtC11NotesEditorP33_4045383A19295915DBCF26644168878021CaptureViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC11NotesEditorP33_4045383A19295915DBCF26644168878021CaptureViewController_disableAutorotate) = 0;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return [(CaptureViewController *)&v9 initWithNavigationBarClass:a3 toolbarClass:a4];
}

- (_TtC11NotesEditorP33_4045383A19295915DBCF26644168878021CaptureViewController)initWithRootViewController:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC11NotesEditorP33_4045383A19295915DBCF26644168878021CaptureViewController_disableAutorotate) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(CaptureViewController *)&v7 initWithRootViewController:a3];
}

- (_TtC11NotesEditorP33_4045383A19295915DBCF26644168878021CaptureViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_20C162AC0();
    *((unsigned char *)&self->super.super.super.super.super.isa
    + OBJC_IVAR____TtC11NotesEditorP33_4045383A19295915DBCF26644168878021CaptureViewController_disableAutorotate) = 0;
    id v8 = a4;
    a3 = (id)sub_20C162A80();
    swift_bridgeObjectRelease();
  }
  else
  {
    *((unsigned char *)&self->super.super.super.super.super.isa
    + OBJC_IVAR____TtC11NotesEditorP33_4045383A19295915DBCF26644168878021CaptureViewController_disableAutorotate) = 0;
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = [(CaptureViewController *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (_TtC11NotesEditorP33_4045383A19295915DBCF26644168878021CaptureViewController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC11NotesEditorP33_4045383A19295915DBCF26644168878021CaptureViewController_disableAutorotate) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(CaptureViewController *)&v7 initWithCoder:a3];
}

@end