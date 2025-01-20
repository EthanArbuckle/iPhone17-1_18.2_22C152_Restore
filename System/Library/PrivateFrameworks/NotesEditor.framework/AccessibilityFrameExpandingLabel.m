@interface AccessibilityFrameExpandingLabel
- (CGRect)accessibilityFrame;
- (_TtC11NotesEditorP33_BCDBDF3703124CBFF67EDFC1BC77488932AccessibilityFrameExpandingLabel)initWithCoder:(id)a3;
- (_TtC11NotesEditorP33_BCDBDF3703124CBFF67EDFC1BC77488932AccessibilityFrameExpandingLabel)initWithFrame:(CGRect)a3;
- (void)setAccessibilityFrame:(CGRect)a3;
@end

@implementation AccessibilityFrameExpandingLabel

- (CGRect)accessibilityFrame
{
  v2 = self;
  sub_20C083A14();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setAccessibilityFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AccessibilityFrameExpandingLabel();
  -[AccessibilityFrameExpandingLabel setAccessibilityFrame:](&v7, sel_setAccessibilityFrame_, x, y, width, height);
}

- (_TtC11NotesEditorP33_BCDBDF3703124CBFF67EDFC1BC77488932AccessibilityFrameExpandingLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(void *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC11NotesEditorP33_BCDBDF3703124CBFF67EDFC1BC77488932AccessibilityFrameExpandingLabel_accessibilityFrameDelegate) = 0;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AccessibilityFrameExpandingLabel();
  return -[AccessibilityFrameExpandingLabel initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11NotesEditorP33_BCDBDF3703124CBFF67EDFC1BC77488932AccessibilityFrameExpandingLabel)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC11NotesEditorP33_BCDBDF3703124CBFF67EDFC1BC77488932AccessibilityFrameExpandingLabel_accessibilityFrameDelegate) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AccessibilityFrameExpandingLabel();
  return [(AccessibilityFrameExpandingLabel *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end