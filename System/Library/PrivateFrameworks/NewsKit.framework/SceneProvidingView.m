@interface SceneProvidingView
- (_TtC7NewsKit18SceneProvidingView)initWithCoder:(id)a3;
- (_TtC7NewsKit18SceneProvidingView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
@end

@implementation SceneProvidingView

- (_TtC7NewsKit18SceneProvidingView)initWithCoder:(id)a3
{
  result = (_TtC7NewsKit18SceneProvidingView *)sub_2286DE2E8();
  __break(1u);
  return result;
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = (char *)v6.receiver;
  [(SceneProvidingView *)&v6 didMoveToWindow];
  id v3 = objc_msgSend(v2, sel_window, v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = (char *)objc_msgSend(v3, sel_windowScene);

    if (v5)
    {
      __swift_project_boxed_opaque_existential_1(&v2[OBJC_IVAR____TtC7NewsKit18SceneProvidingView_sceneProvider], *(void *)&v2[OBJC_IVAR____TtC7NewsKit18SceneProvidingView_sceneProvider + 24]);
      sub_2286DDE58();

      v2 = v5;
    }
  }
}

- (_TtC7NewsKit18SceneProvidingView)initWithFrame:(CGRect)a3
{
  result = (_TtC7NewsKit18SceneProvidingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end