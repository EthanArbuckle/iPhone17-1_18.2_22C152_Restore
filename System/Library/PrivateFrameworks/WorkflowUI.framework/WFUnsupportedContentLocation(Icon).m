@interface WFUnsupportedContentLocation(Icon)
- (uint64_t)icon;
@end

@implementation WFUnsupportedContentLocation(Icon)

- (uint64_t)icon
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v0 = getWFWorkflowExecutionLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    int v2 = 136315138;
    v3 = "-[WFUnsupportedContentLocation(Icon) icon]";
    _os_log_impl(&dword_22D994000, v0, OS_LOG_TYPE_FAULT, "%s The UI should never attempt to display a WFUnsupportedContentLocation", (uint8_t *)&v2, 0xCu);
  }

  return 0;
}

@end