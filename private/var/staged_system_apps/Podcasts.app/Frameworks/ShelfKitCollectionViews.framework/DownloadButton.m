@interface DownloadButton
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtC23ShelfKitCollectionViews14DownloadButton)initWithCoder:(id)a3;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityValue:(id)a3;
@end

@implementation DownloadButton

- (_TtC23ShelfKitCollectionViews14DownloadButton)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews14DownloadButton_episodeCellState) = 3;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews14DownloadButton_presenter) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews14DownloadButton_progressView) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews14DownloadButton_progressState;
  *(void *)v4 = 0;
  *((_WORD *)v4 + 4) = 256;
  id v5 = a3;

  result = (_TtC23ShelfKitCollectionViews14DownloadButton *)sub_385890();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1383A8((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews14DownloadButton_downloadButtonStyle);
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews14DownloadButton_progressView);
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_13777C(self, (uint64_t)a2, (void (*)(void))sub_1375A8);
}

- (void)setAccessibilityLabel:(id)a3
{
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_13777C(self, (uint64_t)a2, (void (*)(void))sub_1377FC);
}

- (void)setAccessibilityValue:(id)a3
{
}

@end