@interface DictionaryViewController
- (_TtC17SequoiaTranslator24DictionaryViewController)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator24DictionaryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)closeActionWithSender:(id)a3;
- (void)loadView;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation DictionaryViewController

- (_TtC17SequoiaTranslator24DictionaryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC17SequoiaTranslator24DictionaryViewController *)sub_1000C6C74(v5, v7, a4);
}

- (_TtC17SequoiaTranslator24DictionaryViewController)initWithCoder:(id)a3
{
  return (_TtC17SequoiaTranslator24DictionaryViewController *)sub_1000C6F64(a3);
}

- (void)loadView
{
  id v3 = objc_allocWithZone((Class)UIView);
  v4 = self;
  id v7 = [v3 initWithFrame:0.0, 0.0, 0.0, 0.0];
  id v5 = sub_1000C68C0();
  [v7 addSubview:v5];

  id v6 = sub_1000C68D4();
  [v7 addSubview:v6];

  [(DictionaryViewController *)v4 setView:v7];
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000C72BC();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for DictionaryViewController();
  id v4 = v10.receiver;
  [(DictionaryViewController *)&v10 viewDidDisappear:v3];
  NSString v5 = String._bridgeToObjectiveC()();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v4;
  v9[4] = sub_1000CA688;
  v9[5] = v6;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_1001BB31C;
  v9[3] = &unk_1002CD1F8;
  id v7 = _Block_copy(v9);
  id v8 = v4;
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v7);
}

- (void)closeActionWithSender:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_1000C7E00();

  sub_10000AB68((uint64_t)&v5);
}

- (void).cxx_destruct
{
  sub_1000CA304((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator24DictionaryViewController_sourceLocale);
  sub_1000CA304((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator24DictionaryViewController_targetLocale);
  swift_bridgeObjectRelease();
  sub_100013384((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator24DictionaryViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator24DictionaryViewController____lazy_storage___webview));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator24DictionaryViewController____lazy_storage___notFoundLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator24DictionaryViewController____lazy_storage___queue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator24DictionaryViewController____lazy_storage___dictionaryManager));
  swift_bridgeObjectRelease();
  BOOL v3 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator24DictionaryViewController_timeStamp;
  uint64_t v4 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator24DictionaryViewController_observer);
}

@end