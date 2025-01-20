@interface TTRWebViewLoadingStateHelper
- (_TtC9Reminders28TTRWebViewLoadingStateHelper)init;
- (void)dealloc;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation TTRWebViewLoadingStateHelper

- (_TtC9Reminders28TTRWebViewLoadingStateHelper)init
{
  return (_TtC9Reminders28TTRWebViewLoadingStateHelper *)sub_100454F78();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  char v6 = 1;
  v4 = self;
  PassthroughSubject.send(completion:)();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(TTRWebViewLoadingStateHelper *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    v7 = self;
    id v8 = a4;
    PassthroughSubject.send(_:)();
  }
  else
  {
    __break(1u);
  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  if (a4)
  {
    id v8 = a3;
    id v9 = a5;
    v10 = self;
    id v11 = a4;
    PassthroughSubject.send(_:)();
  }
  else
  {
    __break(1u);
  }
}

@end