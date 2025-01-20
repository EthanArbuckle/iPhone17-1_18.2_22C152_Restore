@interface WFWidgetParametersConfigurationViewController
- (NSString)intentIdentifier;
- (WFAction)action;
- (WFWidgetConfigurationRequest)request;
- (_TtC28WidgetConfigurationExtension38WidgetConfigurationParameterDataSource)dataSource;
- (_TtC28WidgetConfigurationExtension45WFWidgetParametersConfigurationViewController)initWithCoder:(id)a3;
- (_TtC28WidgetConfigurationExtension45WFWidgetParametersConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC28WidgetConfigurationExtension45WFWidgetParametersConfigurationViewController)initWithRequest:(id)a3 action:(id)a4 intentIdentifier:(id)a5 dismiss:(id)a6;
- (id)dismiss;
- (void)populateConfiguredIntentWithCompletion:(id)a3;
- (void)viewDidLoad;
@end

@implementation WFWidgetParametersConfigurationViewController

- (WFWidgetConfigurationRequest)request
{
  id v2 = sub_1000042DC();
  return (WFWidgetConfigurationRequest *)v2;
}

- (WFAction)action
{
  id v2 = sub_10000431C();
  return (WFAction *)v2;
}

- (NSString)intentIdentifier
{
  sub_100004374();
  NSString v2 = sub_10001CB00();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC28WidgetConfigurationExtension38WidgetConfigurationParameterDataSource)dataSource
{
  id v2 = sub_1000043E4();
  return (_TtC28WidgetConfigurationExtension38WidgetConfigurationParameterDataSource *)v2;
}

- (id)dismiss
{
  v5[4] = sub_10000448C();
  v5[5] = v2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  v5[2] = sub_1000044C8;
  v5[3] = &unk_10002D120;
  v3 = _Block_copy(v5);
  swift_release();
  return v3;
}

- (_TtC28WidgetConfigurationExtension45WFWidgetParametersConfigurationViewController)initWithRequest:(id)a3 action:(id)a4 intentIdentifier:(id)a5 dismiss:(id)a6
{
  v8 = _Block_copy(a6);
  uint64_t v9 = sub_10001CB10();
  uint64_t v11 = v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v8;
  return (_TtC28WidgetConfigurationExtension45WFWidgetParametersConfigurationViewController *)sub_10000450C(a3, a4, v9, v11, (uint64_t)sub_100006104, v12);
}

- (_TtC28WidgetConfigurationExtension45WFWidgetParametersConfigurationViewController)initWithCoder:(id)a3
{
}

- (void)viewDidLoad
{
  uint64_t v2 = self;
  sub_100004754();
}

- (void)populateConfiguredIntentWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  v6 = self;
  sub_10000537C((uint64_t)&unk_1000347A8, v5);
}

- (_TtC28WidgetConfigurationExtension45WFWidgetParametersConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_10001CB10();
  }
  id v5 = a4;
  sub_100005488();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28WidgetConfigurationExtension45WFWidgetParametersConfigurationViewController_request));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28WidgetConfigurationExtension45WFWidgetParametersConfigurationViewController_action));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28WidgetConfigurationExtension45WFWidgetParametersConfigurationViewController_dataSource));
  swift_release();
}

@end