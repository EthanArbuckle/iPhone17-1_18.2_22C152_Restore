@interface _UIFontPickerSceneHostingImpl
- (UIFontPickerViewController)delegateFontPickerViewController;
- (_UIFontPickerSceneHostingImpl)init;
- (void)_pickerDidCancel;
- (void)_pickerDidSelectFont:(id)a3;
- (void)clientIsReady;
- (void)setDelegateFontPickerViewController:(id)a3;
- (void)setHideNavigationBar:(BOOL)a3;
- (void)setRemoteSelectedFontDescriptors:(id)a3 scrollToVisible:(BOOL)a4;
- (void)setShowsGrabber:(BOOL)a3;
- (void)setupRemoteHosting;
@end

@implementation _UIFontPickerSceneHostingImpl

- (UIFontPickerViewController)delegateFontPickerViewController
{
  v2 = (void *)MEMORY[0x18C109380]((char *)self + OBJC_IVAR____UIFontPickerSceneHostingImpl_delegateFontPickerViewController, a2);
  return (UIFontPickerViewController *)v2;
}

- (void)setDelegateFontPickerViewController:(id)a3
{
}

- (void)setupRemoteHosting
{
  v2 = self;
  sub_185AC8390();
}

- (void)setRemoteSelectedFontDescriptors:(id)a3 scrollToVisible:(BOOL)a4
{
  v5 = a3;
  if (a3)
  {
    sub_1853B985C(0, (unint64_t *)&unk_1E8FB7578);
    v5 = (void *)sub_186A1EB3C();
  }
  v7 = self;
  sub_185AC891C(v5, a4);

  swift_bridgeObjectRelease();
}

- (void)setHideNavigationBar:(BOOL)a3
{
}

- (void)setShowsGrabber:(BOOL)a3
{
}

- (void)_pickerDidSelectFont:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = [(_UIFontPickerSceneHostingImpl *)v5 delegateFontPickerViewController];
  [(UIFontPickerViewController *)v6 _pickerDidSelectFont:v4];
}

- (void)_pickerDidCancel
{
  v2 = self;
  v3 = [(_UIFontPickerSceneHostingImpl *)v2 delegateFontPickerViewController];
  [(UIFontPickerViewController *)v3 _pickerDidCancel];
}

- (void)clientIsReady
{
  v5 = self;
  v2 = [(_UIFontPickerSceneHostingImpl *)v5 delegateFontPickerViewController];
  if (v2)
  {
    v3 = (_UIFontPickerSceneHostingImpl *)v2;
    [(UIViewController *)v2 _endDelayingPresentation];

    id v4 = v3;
  }
  else
  {
    id v4 = v5;
  }
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

- (_UIFontPickerSceneHostingImpl)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIFontPickerSceneHostingImpl_hostingController) = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)_UIFontPickerSceneHostingImpl;
  return [(_UIFontPickerSceneHostingImpl *)&v4 init];
}

@end