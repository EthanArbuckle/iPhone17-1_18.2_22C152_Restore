@interface SBApplicationShortcutReportRecipe
- (id)title;
- (void)_dumpReport;
@end

@implementation SBApplicationShortcutReportRecipe

- (id)title
{
  return @"Application Shortcut Log Dump";
}

- (void)_dumpReport
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "***WARNING*** SBSuppressAppShortcutTruncation is enabled.  You probably don't want this on.", v1, 2u);
}

@end