@interface JSSplitWidgetViewModel
@end

@implementation JSSplitWidgetViewModel

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore22JSSplitWidgetViewModel__leftViewModelKind;
  uint64_t v4 = sub_100063814(&qword_1010D4FF0);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore22JSSplitWidgetViewModel__rightViewModelKind, v4);
  v6 = (char *)self + OBJC_IVAR____TtC11MusicJSCore22JSSplitWidgetViewModel__displayStyle;
  uint64_t v7 = sub_100063814(&qword_1010D5008);
  v8 = *(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);

  v8(v6, v7);
}

@end