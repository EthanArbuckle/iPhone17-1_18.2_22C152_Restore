@interface BRCMetricEndpoint
- (BRCMetricEndpoint)initWithSession:(id)a3;
@end

@implementation BRCMetricEndpoint

- (BRCMetricEndpoint)initWithSession:(id)a3
{
  v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    -[BRCMetricEndpoint initWithSession:]();
  }

  return 0;
}

- (void)initWithSession:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: needs override%@", v2, v3, v4, v5, v6);
}

@end