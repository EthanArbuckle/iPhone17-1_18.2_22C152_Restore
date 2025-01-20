@interface PaperTextAttachmentView
- (BOOL)_wantsToolPickerVisible:(id)a3;
@end

@implementation PaperTextAttachmentView

- (BOOL)_wantsToolPickerVisible:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = PaperTextAttachmentView._wantsToolPickerVisible(_:)((PKToolPicker)v4);

  return self & 1;
}

@end