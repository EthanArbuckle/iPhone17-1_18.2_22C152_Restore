@interface BAWidgetData
- (BAWidgetData)init;
- (BAWidgetData)initWithWidgetFamily:(id)a3 displayMode:(id)a4 isContentExposed:(BOOL)a5 isStreakExposed:(BOOL)a6;
@end

@implementation BAWidgetData

- (BAWidgetData)initWithWidgetFamily:(id)a3 displayMode:(id)a4 isContentExposed:(BOOL)a5 isStreakExposed:(BOOL)a6
{
  uint64_t v9 = sub_27DDB0();
  uint64_t v11 = v10;
  uint64_t v12 = sub_27DDB0();
  v13 = (uint64_t *)((char *)self + OBJC_IVAR___BAWidgetData_widgetFamily);
  uint64_t *v13 = v9;
  v13[1] = v11;
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___BAWidgetData_displayMode);
  uint64_t *v14 = v12;
  v14[1] = v15;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___BAWidgetData_isContentExposed) = a5;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___BAWidgetData_isStreakExposed) = a6;
  v17.receiver = self;
  v17.super_class = (Class)type metadata accessor for BridgedWidgetData();
  return [(BAWidgetData *)&v17 init];
}

- (BAWidgetData)init
{
  result = (BAWidgetData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end