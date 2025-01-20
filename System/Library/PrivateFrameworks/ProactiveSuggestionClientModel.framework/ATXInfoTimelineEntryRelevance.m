@interface ATXInfoTimelineEntryRelevance
+ (BOOL)supportsSecureCoding;
+ (id)relevanceWithScore:(double)a3 duration:(double)a4;
- (ATXInfoTimelineEntryRelevance)initWithCoder:(id)a3;
- (ATXInfoTimelineEntryRelevance)initWithScore:(double)a3 duration:(double)a4;
- (double)duration;
- (double)score;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXInfoTimelineEntryRelevance

+ (id)relevanceWithScore:(double)a3 duration:(double)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithScore:a3 duration:a4];
  return v4;
}

- (ATXInfoTimelineEntryRelevance)initWithScore:(double)a3 duration:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ATXInfoTimelineEntryRelevance;
  result = [(ATXInfoTimelineEntryRelevance *)&v7 init];
  if (result)
  {
    result->_score = a3;
    result->_duration = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double score = self->_score;
  id v5 = a3;
  [v5 encodeDouble:@"score" forKey:score];
  [v5 encodeDouble:@"duration" forKey:self->_duration];
}

- (ATXInfoTimelineEntryRelevance)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"score"];
  double v6 = v5;
  objc_super v7 = [v4 error];

  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ATXInfoTimelineEntryRelevance initWithCoder:](v4);
    }
  }
  else
  {
    [v4 decodeDoubleForKey:@"duration"];
    double v9 = v8;
    v10 = [v4 error];

    if (!v10)
    {
      self = [(ATXInfoTimelineEntryRelevance *)self initWithScore:v6 duration:v9];
      v11 = self;
      goto LABEL_8;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ATXInfoTimelineEntryRelevance initWithCoder:](v4);
    }
  }
  v11 = 0;
LABEL_8:

  return v11;
}

- (double)score
{
  return self->_score;
}

- (double)duration
{
  return self->_duration;
}

- (void)initWithCoder:(void *)a1 .cold.1(void *a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v1 = [a1 error];
  v2[0] = 138412546;
  OUTLINED_FUNCTION_0_4();
  _os_log_error_impl(&dword_1AE67F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "ATXInfoTimelineEntryRelevance: error decoding %@ - %@", (uint8_t *)v2, 0x16u);
}

- (void)initWithCoder:(void *)a1 .cold.2(void *a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v1 = [a1 error];
  v2[0] = 138412546;
  OUTLINED_FUNCTION_0_4();
  _os_log_error_impl(&dword_1AE67F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "ATXInfoTimelineEntryRelevance: error decoding %@ - %@", (uint8_t *)v2, 0x16u);
}

@end