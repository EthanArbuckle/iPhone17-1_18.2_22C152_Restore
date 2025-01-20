@interface iOSLinkAcceleratorCollectionViewCell
- (_TtC11NotesEditor36iOSLinkAcceleratorCollectionViewCell)initWithCoder:(id)a3;
- (_TtC11NotesEditor36iOSLinkAcceleratorCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)handleHoverWithRecognizer:(id)a3;
@end

@implementation iOSLinkAcceleratorCollectionViewCell

- (_TtC11NotesEditor36iOSLinkAcceleratorCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC11NotesEditor36iOSLinkAcceleratorCollectionViewCell *)sub_20C14A28C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11NotesEditor36iOSLinkAcceleratorCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20C14E03C();
}

- (void)handleHoverWithRecognizer:(id)a3
{
  id v4 = a3;
  v5 = self;
  byte_2676C0138 = (char *)objc_msgSend(v4, sel_state) - 1 < (char *)2;
  [(iOSLinkAcceleratorCollectionViewCell *)v5 setNeedsUpdateConfiguration];
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_20C1602A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20C160290();
  v8 = self;
  sub_20C14AE90((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor36iOSLinkAcceleratorCollectionViewCell_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor36iOSLinkAcceleratorCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor36iOSLinkAcceleratorCollectionViewCell_dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor36iOSLinkAcceleratorCollectionViewCell_dividerView));
  sub_20BFCEDFC((uint64_t)self + OBJC_IVAR____TtC11NotesEditor36iOSLinkAcceleratorCollectionViewCell_linkSuggestion, &qword_2676BC8E8);
}

@end