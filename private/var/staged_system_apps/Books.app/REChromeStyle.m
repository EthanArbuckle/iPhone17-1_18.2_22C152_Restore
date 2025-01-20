@interface REChromeStyle
- (REChromeStyle)init;
- (double)menuBottomInset;
@end

@implementation REChromeStyle

- (REChromeStyle)init
{
  return (REChromeStyle *)ChromeStyle.init()();
}

- (double)menuBottomInset
{
  uint64_t v3 = sub_1007F8BF0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v9 = (char *)&v14 - v8;
  swift_getKeyPath();
  swift_getKeyPath();
  v10 = self;
  sub_1007F7850();
  swift_release();
  swift_release();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for UserInterfaceSizeClass.compact(_:), v3);
  char v11 = sub_1007F8BE0();
  v12 = *(void (**)(char *, uint64_t))(v4 + 8);
  v12(v6, v3);
  v12(v9, v3);

  double result = 20.0;
  if (v11) {
    return 17.0;
  }
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR___REChromeStyle__colorScheme;
  uint64_t v4 = sub_100058D18(&qword_100B360C8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR___REChromeStyle__verticalSizeClass;
  uint64_t v6 = sub_100058D18(&qword_100B360C0);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = (char *)self + OBJC_IVAR___REChromeStyle__statusBarHeight;
  uint64_t v8 = sub_100058D18(&qword_100B360B8);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR___REChromeStyle__pageBackgroundColor;
  uint64_t v10 = sub_100058D18(&qword_100B360B0);
  char v11 = *(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8);
  v11(v9, v10);
  v11((char *)self + OBJC_IVAR___REChromeStyle__pageTextColor, v10);
  v11((char *)self + OBJC_IVAR___REChromeStyle__themeSeparatorColor, v10);
  v11((char *)self + OBJC_IVAR___REChromeStyle__themeSecondaryLabel, v10);
  v11((char *)self + OBJC_IVAR___REChromeStyle__secondaryButtonLabelColor, v10);
  v11((char *)self + OBJC_IVAR___REChromeStyle__secondaryButtonFillColor, v10);
  v12 = (char *)self + OBJC_IVAR___REChromeStyle__buttonStyle;
  uint64_t v13 = sub_100058D18(&qword_100B360A8);
  uint64_t v14 = *(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8);
  v14(v12, v13);
  v14((char *)self + OBJC_IVAR___REChromeStyle__buttonDisabledStyle, v13);
  v14((char *)self + OBJC_IVAR___REChromeStyle__secondaryButtonStyle, v13);
  v15 = (char *)self + OBJC_IVAR___REChromeStyle__downloadProgressStyle;
  uint64_t v16 = sub_100058D18(&qword_100B360A0);
  v17 = *(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8);
  v17(v15, v16);
  v17((char *)self + OBJC_IVAR___REChromeStyle__downloadSpinnerStyle, v16);
  v18 = (char *)self + OBJC_IVAR___REChromeStyle__isLeftMenu;
  uint64_t v19 = sub_100058D18((uint64_t *)&unk_100B25F10);
  v20 = *(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8);
  v20(v18, v19);
  v20((char *)self + OBJC_IVAR___REChromeStyle__isDarkTheme, v19);
  v20((char *)self + OBJC_IVAR___REChromeStyle__themeHasDarkBackground, v19);

  swift_release();

  swift_release();
}

@end