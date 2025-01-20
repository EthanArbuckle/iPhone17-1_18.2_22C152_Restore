@interface ConfirmationView
- (_TtC17SequoiaTranslator16ConfirmationView)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator16ConfirmationView)initWithFrame:(CGRect)a3;
@end

@implementation ConfirmationView

- (_TtC17SequoiaTranslator16ConfirmationView)initWithFrame:(CGRect)a3
{
  return (_TtC17SequoiaTranslator16ConfirmationView *)sub_10006F1B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17SequoiaTranslator16ConfirmationView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10006FEEC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator16ConfirmationView_background));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator16ConfirmationView_layoutStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator16ConfirmationView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator16ConfirmationView_separator1));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator16ConfirmationView_option1Button));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator16ConfirmationView_separator2));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator16ConfirmationView_option2Button);
}

@end