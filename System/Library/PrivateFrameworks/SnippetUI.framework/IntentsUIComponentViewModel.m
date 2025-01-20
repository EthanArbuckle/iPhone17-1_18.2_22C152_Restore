@interface IntentsUIComponentViewModel
- (_TtC9SnippetUI27IntentsUIComponentViewModel)init;
- (id)maximumSizesBySystemVersionForRemoteViewController:(id)a3;
@end

@implementation IntentsUIComponentViewModel

- (_TtC9SnippetUI27IntentsUIComponentViewModel)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9SnippetUI27IntentsUIComponentViewModel__resolvedViews;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684B1DB0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  swift_bridgeObjectRelease();
}

- (id)maximumSizesBySystemVersionForRemoteViewController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22C500CCC();

  sub_22C28737C(0, (unint64_t *)&qword_26ADF3AC0);
  sub_22C28737C(0, &qword_2684B1D98);
  sub_22C50144C(&qword_2684B1DA0, (unint64_t *)&qword_26ADF3AC0);
  v6 = (void *)sub_22C64F370();
  swift_bridgeObjectRelease();

  return v6;
}

@end