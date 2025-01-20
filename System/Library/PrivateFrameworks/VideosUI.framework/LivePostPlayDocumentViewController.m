@interface LivePostPlayDocumentViewController
- (NSString)description;
- (_TtC8VideosUI34LivePostPlayDocumentViewController)initWithCoder:(id)a3;
- (void)vui_viewDidLayoutSubviews;
- (void)vui_viewDidLoad;
@end

@implementation LivePostPlayDocumentViewController

- (NSString)description
{
  v2 = self;
  sub_1E32AE14C();

  v3 = (void *)sub_1E387C8E8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC8VideosUI34LivePostPlayDocumentViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E32AED2C();
}

- (void)vui_viewDidLoad
{
  v2 = self;
  sub_1E32AEF00();
}

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  sub_1E32AF0E0();
}

- (void).cxx_destruct
{
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI34LivePostPlayDocumentViewController_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E3877538();
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_47();
  v3();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI34LivePostPlayDocumentViewController____lazy_storage___backgroudGradientView);
}

@end