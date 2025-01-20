@interface TranslateSystemApertureSceneDelegate
- (UIWindow)window;
- (_TtC17SequoiaTranslator36TranslateSystemApertureSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation TranslateSystemApertureSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC17SequoiaTranslator36TranslateSystemApertureSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator36TranslateSystemApertureSceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17SequoiaTranslator36TranslateSystemApertureSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1001F92CC(v8);
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001F8364(v4);
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001F87CC(v4);
}

- (_TtC17SequoiaTranslator36TranslateSystemApertureSceneDelegate)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator36TranslateSystemApertureSceneDelegate____lazy_storage___systemApertureElementProvider) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17SequoiaTranslator36TranslateSystemApertureSceneDelegate_window) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator36TranslateSystemApertureSceneDelegate_currentActivity) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TranslateSystemApertureSceneDelegate();
  return [(TranslateSystemApertureSceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator36TranslateSystemApertureSceneDelegate____lazy_storage___systemApertureElementProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator36TranslateSystemApertureSceneDelegate_window));

  swift_release();
}

@end