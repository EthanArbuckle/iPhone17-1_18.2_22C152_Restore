@interface NSProgress(BRCAdditions)
- (id)brc_dumpDescription;
- (uint64_t)brc_publish;
- (uint64_t)brc_unpublish;
- (void)brc_publish;
- (void)brc_unpublish;
@end

@implementation NSProgress(BRCAdditions)

- (uint64_t)brc_publish
{
  v2 = brc_bread_crumbs();
  v3 = brc_notifications_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[NSProgress(BRCAdditions) brc_publish]();
  }

  return [a1 _publish];
}

- (uint64_t)brc_unpublish
{
  v2 = brc_bread_crumbs();
  v3 = brc_notifications_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[NSProgress(BRCAdditions) brc_unpublish]();
  }

  return [a1 _unpublish];
}

- (id)brc_dumpDescription
{
  v2 = [MEMORY[0x263EFF980] array];
  if ([a1 isFinished]) {
    [v2 addObject:@"finished"];
  }
  if ([a1 isIndeterminate]) {
    [v2 addObject:@"indeterminate"];
  }
  if ([a1 isCancelled]) {
    [v2 addObject:@"cancelled"];
  }
  if ([a1 isPaused]) {
    [v2 addObject:@"paused"];
  }
  if ([v2 count])
  {
    v3 = NSString;
    v4 = [v2 componentsJoinedByString:@"|"];
    v5 = [v3 stringWithFormat:@"s:%@ ", v4];
  }
  else
  {
    v5 = &stru_26F3822F0;
  }
  v6 = NSString;
  [a1 fractionCompleted];
  v8 = [v6 stringWithFormat:@"%@f:%.4f uc:%lld/%lld", v5, v7, objc_msgSend(a1, "completedUnitCount"), objc_msgSend(a1, "totalUnitCount")];

  return v8;
}

- (void)brc_publish
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[NOTIF] published progress for %@%@");
}

- (void)brc_unpublish
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[NOTIF] unpublished progress for %@%@");
}

@end