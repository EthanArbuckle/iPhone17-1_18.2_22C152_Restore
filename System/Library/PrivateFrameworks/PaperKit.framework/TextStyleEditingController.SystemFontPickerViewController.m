@interface TextStyleEditingController.SystemFontPickerViewController
- (_TtCC8PaperKit26TextStyleEditingController30SystemFontPickerViewController)initWithCoder:(id)a3;
- (_TtCC8PaperKit26TextStyleEditingController30SystemFontPickerViewController)initWithConfiguration:(id)a3;
@end

@implementation TextStyleEditingController.SystemFontPickerViewController

- (_TtCC8PaperKit26TextStyleEditingController30SystemFontPickerViewController)initWithConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(UIFontPickerViewController *)&v5 initWithConfiguration:a3];
}

- (_TtCC8PaperKit26TextStyleEditingController30SystemFontPickerViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(UIFontPickerViewController *)&v5 initWithCoder:a3];
}

@end