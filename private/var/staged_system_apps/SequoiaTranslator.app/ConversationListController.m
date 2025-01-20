@interface ConversationListController
- (_TtC17SequoiaTranslator26ConversationListController)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator26ConversationListController)initWithCollectionViewLayout:(id)a3;
- (_TtC17SequoiaTranslator26ConversationListController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissKeyboard;
- (void)scrollViewDidScroll:(id)a3;
- (void)viewDidLoad;
@end

@implementation ConversationListController

- (_TtC17SequoiaTranslator26ConversationListController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10008B5F8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100088058();
}

- (void)dismissKeyboard
{
  v2 = self;
  id v3 = [(ConversationListController *)v2 view];
  if (v3)
  {
    id v4 = v3;
    [v3 endEditing:1];
  }
  else
  {
    __break(1u);
  }
}

- (_TtC17SequoiaTranslator26ConversationListController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC17SequoiaTranslator26ConversationListController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC17SequoiaTranslator26ConversationListController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC17SequoiaTranslator26ConversationListController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator26ConversationListController_dataSource));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator26ConversationListController_viewModel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator26ConversationListController____lazy_storage___bottomSeparatorLine);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100089FC0(v4);
}

@end