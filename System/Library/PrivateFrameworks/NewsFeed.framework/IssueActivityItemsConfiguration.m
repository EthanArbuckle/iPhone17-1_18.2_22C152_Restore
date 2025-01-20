@interface IssueActivityItemsConfiguration
- (_TtC8NewsFeed31IssueActivityItemsConfiguration)initWithItemProviders:(id)a3;
- (_TtC8NewsFeed31IssueActivityItemsConfiguration)initWithObjects:(id)a3;
@end

@implementation IssueActivityItemsConfiguration

- (_TtC8NewsFeed31IssueActivityItemsConfiguration)initWithObjects:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1BFC9DBE8(0, &qword_1EA19A1F0);
  sub_1C151EBCC();
  v5 = (void *)sub_1C151EBAC();
  swift_bridgeObjectRelease();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = [(IssueActivityItemsConfiguration *)&v8 initWithObjects:v5];

  return v6;
}

- (_TtC8NewsFeed31IssueActivityItemsConfiguration)initWithItemProviders:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1C036AFB4();
  sub_1C151EBCC();
  v5 = (void *)sub_1C151EBAC();
  swift_bridgeObjectRelease();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = [(IssueActivityItemsConfiguration *)&v8 initWithItemProviders:v5];

  return v6;
}

@end