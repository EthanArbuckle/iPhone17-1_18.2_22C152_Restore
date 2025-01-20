@interface SFReaderThemePickerControl
- (_TtC12MobileSafari26SFReaderThemePickerControl)initWithCoder:(id)a3;
- (_TtC12MobileSafari26SFReaderThemePickerControl)initWithFrame:(CGRect)a3;
@end

@implementation SFReaderThemePickerControl

- (_TtC12MobileSafari26SFReaderThemePickerControl)initWithFrame:(CGRect)a3
{
  return (_TtC12MobileSafari26SFReaderThemePickerControl *)sub_18C6854F8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12MobileSafari26SFReaderThemePickerControl)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC12MobileSafari26SFReaderThemePickerControl__clientIsChangingSelection) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12MobileSafari26SFReaderThemePickerControl___selectedTheme) = 0;
  id v4 = a3;
  sub_18C6F8518();

  result = (_TtC12MobileSafari26SFReaderThemePickerControl *)sub_18C6FA758();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC12MobileSafari26SFReaderThemePickerControl___observationRegistrar;
  uint64_t v3 = sub_18C6F8528();
  id v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end