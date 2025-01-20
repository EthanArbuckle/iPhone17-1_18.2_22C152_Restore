@interface MOInteraction(_CDInteraction)
@end

@implementation MOInteraction(_CDInteraction)

- (void)initWithCDInteraction:()_CDInteraction meIdentifier:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: cdInteraction.uuid", v1, 2u);
}

@end