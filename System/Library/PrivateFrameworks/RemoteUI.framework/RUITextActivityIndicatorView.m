@interface RUITextActivityIndicatorView
- (_TtC8RemoteUI28RUITextActivityIndicatorView)initWithCoder:(id)a3;
- (_TtC8RemoteUI28RUITextActivityIndicatorView)initWithFrame:(CGRect)a3;
- (void)startAnimating;
- (void)stopAnimating;
@end

@implementation RUITextActivityIndicatorView

- (_TtC8RemoteUI28RUITextActivityIndicatorView)initWithFrame:(CGRect)a3
{
  return (_TtC8RemoteUI28RUITextActivityIndicatorView *)sub_2145D5C6C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8RemoteUI28RUITextActivityIndicatorView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8RemoteUI28RUITextActivityIndicatorView_activityIndicator;
  id v6 = objc_allocWithZone(MEMORY[0x263F823E8]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithActivityIndicatorStyle_, 100);
  uint64_t v8 = OBJC_IVAR____TtC8RemoteUI28RUITextActivityIndicatorView_label;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);

  result = (_TtC8RemoteUI28RUITextActivityIndicatorView *)sub_214603608();
  __break(1u);
  return result;
}

- (void)startAnimating
{
}

- (void)stopAnimating
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RemoteUI28RUITextActivityIndicatorView_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RemoteUI28RUITextActivityIndicatorView_label));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8RemoteUI28RUITextActivityIndicatorView_stackView);
}

@end