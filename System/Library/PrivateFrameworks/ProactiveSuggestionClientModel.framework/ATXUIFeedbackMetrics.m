@interface ATXUIFeedbackMetrics
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXUIFeedbackMetrics:(id)a3;
- (double)engagementRate;
- (double)rejectionRate;
- (unint64_t)engagementCount;
- (unint64_t)hash;
- (unint64_t)impressionCount;
- (unint64_t)rejectionCount;
- (void)engagementRate;
- (void)rejectionRate;
- (void)setEngagementCount:(unint64_t)a3;
- (void)setImpressionCount:(unint64_t)a3;
- (void)setRejectionCount:(unint64_t)a3;
@end

@implementation ATXUIFeedbackMetrics

- (double)engagementRate
{
  unint64_t impressionCount = self->_impressionCount;
  unint64_t engagementCount = self->_engagementCount;
  if (impressionCount) {
    return (double)engagementCount / (double)impressionCount;
  }
  double v4 = 0.0;
  if (engagementCount)
  {
    v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[ATXUIFeedbackMetrics engagementRate](v5);
    }
  }
  return v4;
}

- (double)rejectionRate
{
  unint64_t impressionCount = self->_impressionCount;
  unint64_t rejectionCount = self->_rejectionCount;
  if (impressionCount) {
    return (double)rejectionCount / (double)impressionCount;
  }
  double v4 = 0.0;
  if (rejectionCount)
  {
    v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[ATXUIFeedbackMetrics rejectionRate](v5);
    }
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (ATXUIFeedbackMetrics *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXUIFeedbackMetrics *)self isEqualToATXUIFeedbackMetrics:v5];

  return v6;
}

- (BOOL)isEqualToATXUIFeedbackMetrics:(id)a3
{
  double v4 = (char *)a3;
  BOOL v5 = *(_OWORD *)&self->_impressionCount == *(_OWORD *)(v4 + 8) && self->_rejectionCount == *((void *)v4 + 3);

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_engagementCount - self->_impressionCount + 32 * self->_impressionCount;
  return self->_rejectionCount - v2 + 32 * v2;
}

- (unint64_t)impressionCount
{
  return self->_impressionCount;
}

- (void)setImpressionCount:(unint64_t)a3
{
  self->_unint64_t impressionCount = a3;
}

- (unint64_t)engagementCount
{
  return self->_engagementCount;
}

- (void)setEngagementCount:(unint64_t)a3
{
  self->_unint64_t engagementCount = a3;
}

- (unint64_t)rejectionCount
{
  return self->_rejectionCount;
}

- (void)setRejectionCount:(unint64_t)a3
{
  self->_unint64_t rejectionCount = a3;
}

- (void)engagementRate
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  unint64_t v2 = "-[ATXUIFeedbackMetrics engagementRate]";
  _os_log_fault_impl(&dword_1AE67F000, log, OS_LOG_TYPE_FAULT, "%s: _engagementCount != 0 while _impressionCount == 0.", (uint8_t *)&v1, 0xCu);
}

- (void)rejectionRate
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  unint64_t v2 = "-[ATXUIFeedbackMetrics rejectionRate]";
  _os_log_fault_impl(&dword_1AE67F000, log, OS_LOG_TYPE_FAULT, "%s: _rejectionCount != 0 while _impressionCount == 0.", (uint8_t *)&v1, 0xCu);
}

@end