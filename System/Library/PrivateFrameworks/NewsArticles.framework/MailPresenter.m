@interface MailPresenter
- (BOOL)canComposeMail;
- (_TtC12NewsArticles13MailPresenter)init;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)presentMail:(id)a3;
@end

@implementation MailPresenter

- (BOOL)canComposeMail
{
  v2 = self;
  return objc_msgSend(v2, sel_canSendMail);
}

- (void)presentMail:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BF5D95AC(v4);
}

- (_TtC12NewsArticles13MailPresenter)init
{
  result = (_TtC12NewsArticles13MailPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
}

@end