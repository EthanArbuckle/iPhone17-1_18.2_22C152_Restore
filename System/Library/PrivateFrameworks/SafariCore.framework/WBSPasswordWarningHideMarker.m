@interface WBSPasswordWarningHideMarker
- (BOOL)isEqual:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (WBSPasswordWarningHideMarker)initWithDictionaryRepresentation:(id)a3;
- (WBSPasswordWarningHideMarker)initWithIssueTypes:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)issueTypes;
@end

@implementation WBSPasswordWarningHideMarker

- (WBSPasswordWarningHideMarker)initWithIssueTypes:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WBSPasswordWarningHideMarker;
  v4 = [(WBSPasswordWarningHideMarker *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_issueTypes = a3;
    v6 = v4;
  }

  return v5;
}

- (WBSPasswordWarningHideMarker)initWithDictionaryRepresentation:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"issueTypes"];
  if (v4)
  {
    v5 = -[WBSPasswordWarningHideMarker initWithIssueTypes:]([WBSPasswordWarningHideMarker alloc], "initWithIssueTypes:", [v4 unsignedIntegerValue]);
  }
  else
  {
    v6 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[WBSPasswordWarningHideMarker initWithDictionaryRepresentation:](v6);
    }
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WBSPasswordWarningHideMarker *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t issueTypes = self->_issueTypes;
      BOOL v6 = issueTypes == [(WBSPasswordWarningHideMarker *)v4 issueTypes];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_issueTypes;
}

- (NSDictionary)dictionaryRepresentation
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"issueTypes";
  v2 = [NSNumber numberWithUnsignedInteger:self->_issueTypes];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

- (unint64_t)issueTypes
{
  return self->_issueTypes;
}

- (void)initWithDictionaryRepresentation:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "hide warning marker initialized with invalid dictionary", v1, 2u);
}

@end