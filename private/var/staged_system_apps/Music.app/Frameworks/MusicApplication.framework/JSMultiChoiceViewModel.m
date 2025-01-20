@interface JSMultiChoiceViewModel
@end

@implementation JSMultiChoiceViewModel

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore22JSMultiChoiceViewModel_selectedItem));
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore22JSMultiChoiceViewModel_delegate;

  sub_1A500((uint64_t)v3);
}

@end