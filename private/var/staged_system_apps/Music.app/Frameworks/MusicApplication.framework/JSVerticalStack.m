@interface JSVerticalStack
@end

@implementation JSVerticalStack

- (void).cxx_destruct
{
  sub_1A500((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore15JSVerticalStack_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore15JSVerticalStack__childViewModelKinds;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFF508);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end