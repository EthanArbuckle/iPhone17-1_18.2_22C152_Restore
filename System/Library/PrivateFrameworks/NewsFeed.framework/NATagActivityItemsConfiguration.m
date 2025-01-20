@interface NATagActivityItemsConfiguration
- (NATagActivityItemsConfiguration)initWithItemProviders:(id)a3;
- (NATagActivityItemsConfiguration)initWithObjects:(id)a3;
- (NATagActivityItemsConfiguration)initWithTag:(id)a3;
@end

@implementation NATagActivityItemsConfiguration

- (NATagActivityItemsConfiguration)initWithTag:(id)a3
{
  swift_getObjectType();
  v4 = (void *)swift_unknownObjectRetain();
  return (NATagActivityItemsConfiguration *)sub_1C1283FF4(v4, self);
}

- (NATagActivityItemsConfiguration)initWithObjects:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1BFC9DBE8(0, &qword_1EA19A1F0);
  sub_1C151EBCC();
  v5 = (void *)sub_1C151EBAC();
  swift_bridgeObjectRelease();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = [(NATagActivityItemsConfiguration *)&v8 initWithObjects:v5];

  return v6;
}

- (NATagActivityItemsConfiguration)initWithItemProviders:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1C036AFB4();
  sub_1C151EBCC();
  v5 = (void *)sub_1C151EBAC();
  swift_bridgeObjectRelease();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = [(NATagActivityItemsConfiguration *)&v8 initWithItemProviders:v5];

  return v6;
}

@end