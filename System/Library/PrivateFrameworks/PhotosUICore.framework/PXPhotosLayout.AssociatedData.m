@interface PXPhotosLayout.AssociatedData
- (_TtCE12PhotosUICoreCSo14PXPhotosLayoutP33_8BC30B280D03FB555C1706A4E0200DBD14AssociatedData)init;
@end

@implementation PXPhotosLayout.AssociatedData

- (_TtCE12PhotosUICoreCSo14PXPhotosLayoutP33_8BC30B280D03FB555C1706A4E0200DBD14AssociatedData)init
{
  v2 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtCE12PhotosUICoreCSo14PXPhotosLayoutP33_8BC30B280D03FB555C1706A4E0200DBD14AssociatedData_scrollableContentInsets);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
  _OWORD *v2 = *MEMORY[0x1E4FB2848];
  v2[1] = v3;
  v5.receiver = self;
  v5.super_class = (Class)_s14AssociatedDataCMa_8();
  return [(PXPhotosLayout.AssociatedData *)&v5 init];
}

@end