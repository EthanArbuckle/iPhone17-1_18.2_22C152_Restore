@interface TextFieldAlertSheet
- (_TtC10PodcastsUI19TextFieldAlertSheet)initWithCoder:(id)a3;
- (void)loadView;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TextFieldAlertSheet

- (void)loadView
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10PodcastsUI19TextFieldAlertSheet_size);
  uint64_t v4 = *(void *)((char *)&self->super.super.super._responderFlags
                 + OBJC_IVAR____TtC10PodcastsUI19TextFieldAlertSheet_size);
  v5 = (objc_class *)type metadata accessor for SheetView();
  v6 = (char *)objc_allocWithZone(v5);
  v7 = &v6[OBJC_IVAR____TtC10PodcastsUI9SheetView_sizeRestrictions];
  *(void *)v7 = v3;
  *((void *)v7 + 1) = v4;
  *((void *)v7 + 2) = v3;
  *((void *)v7 + 3) = v4;
  v10.receiver = v6;
  v10.super_class = v5;
  v8 = self;
  v9 = -[TextFieldAlertSheet initWithFrame:](&v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  -[TextFieldAlertSheet setView:](v8, sel_setView_, v9, v10.receiver, v10.super_class);
}

- (_TtC10PodcastsUI19TextFieldAlertSheet)initWithCoder:(id)a3
{
  result = (_TtC10PodcastsUI19TextFieldAlertSheet *)sub_1E3E7DF80();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1E3C77424();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TextFieldAlertSheet();
  uint64_t v4 = (char *)v7.receiver;
  [(TextFieldAlertSheet *)&v7 viewWillAppear:v3];
  uint64_t v5 = *(void *)&v4[OBJC_IVAR____TtC10PodcastsUI19TextFieldAlertSheet_inputField + 8];
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(ObjectType, v5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10PodcastsUI19TextFieldAlertSheet_inputField);
}

@end