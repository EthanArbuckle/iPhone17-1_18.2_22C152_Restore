@interface OutlineDisclosureButton
- (NSArray)accessibilityUserInputLabels;
- (NSString)accessibilityLabel;
- (_TtC11NotesEditor23OutlineDisclosureButton)initWithCoder:(id)a3;
- (_TtC11NotesEditor23OutlineDisclosureButton)initWithFrame:(CGRect)a3;
- (int64_t)writingDirection;
- (unint64_t)accessibilityTraits;
- (void)contentSizeCategoryDidChange;
- (void)setAccessibilityTraits:(unint64_t)a3;
- (void)setWritingDirection:(int64_t)a3;
@end

@implementation OutlineDisclosureButton

- (int64_t)writingDirection
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC11NotesEditor23OutlineDisclosureButton_writingDirection);
  swift_beginAccess();
  return *v2;
}

- (void)setWritingDirection:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC11NotesEditor23OutlineDisclosureButton_writingDirection);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (_TtC11NotesEditor23OutlineDisclosureButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC11NotesEditor23OutlineDisclosureButton_isCollapsed) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor23OutlineDisclosureButton_writingDirection) = (Class)-1;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[OutlineDisclosureButton initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11NotesEditor23OutlineDisclosureButton)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC11NotesEditor23OutlineDisclosureButton_isCollapsed) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor23OutlineDisclosureButton_writingDirection) = (Class)-1;

  result = (_TtC11NotesEditor23OutlineDisclosureButton *)sub_20C163BD0();
  __break(1u);
  return result;
}

- (NSString)accessibilityLabel
{
  v2 = self;
  _s11NotesEditor23OutlineDisclosureButtonC18accessibilityLabelSSSgvg_0();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_20C162A80();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSArray)accessibilityUserInputLabels
{
  v2 = self;
  _s11NotesEditor23OutlineDisclosureButtonC28accessibilityUserInputLabelsSaySSGSgvg_0();

  uint64_t v3 = (void *)sub_20C162CE0();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v2 = v7.receiver;
  unint64_t v3 = [(OutlineDisclosureButton *)&v7 accessibilityTraits];
  uint64_t v4 = *MEMORY[0x263F832A8];

  uint64_t v5 = -1;
  if ((v4 & v3) != 0) {
    uint64_t v5 = ~v4;
  }
  return v5 & v3;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(OutlineDisclosureButton *)&v4 setAccessibilityTraits:a3];
}

- (void).cxx_destruct
{
}

- (void)contentSizeCategoryDidChange
{
  UIAccessibilityButtonShapesEnabled();
  v0 = (void *)sub_20C162A80();
  swift_bridgeObjectRelease();
  id v1 = objc_msgSend(self, sel_systemImageNamed_, v0);

  if (v1)
  {
    id v2 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x263F83628]);
    id v3 = objc_msgSend(self, sel_configurationWithFont_scale_, v2, 1);

    id v5 = objc_msgSend(v1, sel_imageWithSymbolConfiguration_, v3);
    if (v5)
    {
      if (qword_2676BAFE8 != -1) {
        swift_once();
      }
      objc_msgSend(v5, sel_size);
      qword_2676C0040 = fmax(v4, 20.0);
    }
  }
}

@end