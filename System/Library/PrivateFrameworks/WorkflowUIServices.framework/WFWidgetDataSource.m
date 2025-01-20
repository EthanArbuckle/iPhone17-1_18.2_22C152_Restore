@interface WFWidgetDataSource
+ (id)systemActionForWorkflowIdentifier:(id)a3;
- (BOOL)cacheUpdateIdentifierIsValid:(id)a3;
- (WFWidgetDataSource)init;
- (WFWidgetDataSource)initWithAction:(id)a3;
- (WFWidgetDataSource)initWithActions:(id)a3;
- (WFWidgetDataSource)initWithIdentifier:(id)a3 limit:(int64_t)a4;
- (id)configuredActions;
- (id)folderIdentifierForDeepLinking;
- (id)widgetWorkflowWithIdentifier:(id)a3;
@end

@implementation WFWidgetDataSource

- (WFWidgetDataSource)initWithAction:(id)a3
{
  return (WFWidgetDataSource *)sub_217808A54(a3, 0);
}

- (WFWidgetDataSource)initWithActions:(id)a3
{
  sub_2177EE9A8(0, &qword_267B9C9B8);
  v3 = (void *)sub_217858F08();
  return (WFWidgetDataSource *)sub_217808A54(v3, 1);
}

- (WFWidgetDataSource)initWithIdentifier:(id)a3 limit:(int64_t)a4
{
  v5 = (void *)sub_217858E48();
  return (WFWidgetDataSource *)sub_217808B1C(v5, v6, a4);
}

- (BOOL)cacheUpdateIdentifierIsValid:(id)a3
{
  uint64_t v4 = sub_217858E48();
  uint64_t v6 = v5;
  v7 = self;
  LOBYTE(v4) = sub_217808BCC(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (id)configuredActions
{
  v2 = self;
  sub_217809124();

  sub_2177EE9A8(0, &qword_267B9C9B8);
  v3 = (void *)sub_217858EF8();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)widgetWorkflowWithIdentifier:(id)a3
{
  uint64_t v4 = sub_217858E48();
  uint64_t v6 = v5;
  v7 = self;
  id v8 = sub_2178098A8(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

+ (id)systemActionForWorkflowIdentifier:(id)a3
{
  sub_217858E48();
  swift_getObjCClassMetadata();
  id v3 = sub_217809C84();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)folderIdentifierForDeepLinking
{
  sub_217809DC8();
  if (v2)
  {
    id v3 = (void *)sub_217858E38();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (WFWidgetDataSource)init
{
}

- (void).cxx_destruct
{
  sub_217809FA0(*(void **)((char *)&self->super.isa + OBJC_IVAR___WFWidgetDataSource_backing), *(void *)&self->backing[OBJC_IVAR___WFWidgetDataSource_backing], *(void *)&self->backing[OBJC_IVAR___WFWidgetDataSource_backing + 8], self->backing[OBJC_IVAR___WFWidgetDataSource_backing + 16]);
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WFWidgetDataSource_cache);
}

@end