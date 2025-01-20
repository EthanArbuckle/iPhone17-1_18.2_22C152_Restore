@interface VisionLinkAcceleratorViewController
- (_TtC11NotesEditor35VisionLinkAcceleratorViewController)init;
- (_TtC11NotesEditor35VisionLinkAcceleratorViewController)initWithCoder:(id)a3;
@end

@implementation VisionLinkAcceleratorViewController

- (_TtC11NotesEditor35VisionLinkAcceleratorViewController)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor35VisionLinkAcceleratorViewController_pillOrnamentViewController) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor35VisionLinkAcceleratorViewController_editorXOffset) = (Class)0xC030000000000000;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor35VisionLinkAcceleratorViewController_editorYOffset) = (Class)0x4028000000000000;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor35VisionLinkAcceleratorViewController_editorYPadding) = (Class)0x4040000000000000;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(iOSLinkAcceleratorViewController *)&v5 init];
}

- (_TtC11NotesEditor35VisionLinkAcceleratorViewController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor35VisionLinkAcceleratorViewController_pillOrnamentViewController) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor35VisionLinkAcceleratorViewController_editorXOffset) = (Class)0xC030000000000000;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor35VisionLinkAcceleratorViewController_editorYOffset) = (Class)0x4028000000000000;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor35VisionLinkAcceleratorViewController_editorYPadding) = (Class)0x4040000000000000;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(iOSLinkAcceleratorViewController *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor35VisionLinkAcceleratorViewController_pillOrnamentViewController));
}

@end