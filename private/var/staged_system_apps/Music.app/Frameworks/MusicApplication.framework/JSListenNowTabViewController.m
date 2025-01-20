@interface JSListenNowTabViewController
- (_TtC16MusicApplication28JSListenNowTabViewController)initWithCoder:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation JSListenNowTabViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(JSDrivenViewController *)&v5 viewWillAppear:v3];
  if (qword_DBDDC8 != -1) {
    swift_once();
  }
  *(unsigned char *)(qword_E4A8A8
           + OBJC_IVAR____TtCO16MusicApplication12Interstellar16HighlightsSource_automaticallyFetchObjectsForHighlights) = 1;
  sub_494DEC(1, (uint64_t)UIScreen.Dimensions.size.getter, 0);
}

- (_TtC16MusicApplication28JSListenNowTabViewController)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  objc_super v5 = [(JSTabViewController *)&v7 initWithCoder:v4];

  return v5;
}

@end