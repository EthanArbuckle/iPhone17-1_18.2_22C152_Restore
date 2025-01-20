@interface LyricsSelectionViewController.LineCell
- (BOOL)isAccessibilityElement;
- (BOOL)isHighlighted;
- (NSString)accessibilityHint;
- (NSString)accessibilityLabel;
- (UIBezierPath)accessibilityPath;
- (_TtCC5Music29LyricsSelectionViewController8LineCell)initWithCoder:(id)a3;
- (_TtCC5Music29LyricsSelectionViewController8LineCell)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
- (void)setAccessibilityHint:(id)a3;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityPath:(id)a3;
- (void)setAccessibilityTraits:(unint64_t)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsAccessibilityElement:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation LyricsSelectionViewController.LineCell

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)_s8LineCellCMa();
  return [(LyricsSelectionViewController.LineCell *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (objc_class *)_s8LineCellCMa();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  char v7 = [(LyricsSelectionViewController.LineCell *)&v9 isHighlighted];
  v8.receiver = v6;
  v8.super_class = v5;
  [(LyricsSelectionViewController.LineCell *)&v8 setHighlighted:v3];
  sub_1007C3B20(v7);
}

- (_TtCC5Music29LyricsSelectionViewController8LineCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1007C724C();
}

- (_TtCC5Music29LyricsSelectionViewController8LineCell)initWithFrame:(CGRect)a3
{
  return (_TtCC5Music29LyricsSelectionViewController8LineCell *)sub_1007C410C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1007C5414();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1007C5AF8(a3);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)_s8LineCellCMa();
  [(LyricsSelectionViewController.LineCell *)&v4 setIsAccessibilityElement:v3];
}

- (UIBezierPath)accessibilityPath
{
  id v2 = [*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtCC5Music29LyricsSelectionViewController8LineCell_containerView) accessibilityPath];

  return (UIBezierPath *)v2;
}

- (void)setAccessibilityPath:(id)a3
{
}

- (NSString)accessibilityLabel
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setAccessibilityLabel:(id)a3
{
}

- (NSString)accessibilityHint
{
  NSString v2 = self;
  sub_1007C6908();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setAccessibilityHint:(id)a3
{
}

- (unint64_t)accessibilityTraits
{
  NSString v2 = self;
  UIAccessibilityTraits v3 = sub_1007C6B44();

  return v3;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC5Music29LyricsSelectionViewController8LineCell_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC5Music29LyricsSelectionViewController8LineCell_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC5Music29LyricsSelectionViewController8LineCell_backgroundColorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC5Music29LyricsSelectionViewController8LineCell_backdropView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC5Music29LyricsSelectionViewController8LineCell_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC5Music29LyricsSelectionViewController8LineCell_highlightOverlayView));
  UIAccessibilityTraits v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtCC5Music29LyricsSelectionViewController8LineCell_borderLayer);
}

@end