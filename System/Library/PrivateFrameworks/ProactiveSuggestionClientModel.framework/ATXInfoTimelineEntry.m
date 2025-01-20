@interface ATXInfoTimelineEntry
+ (BOOL)supportsSecureCoding;
+ (id)entryWithDate:(id)a3 importantRelativeToTimeline:(BOOL)a4;
+ (id)entryWithDate:(id)a3 relevance:(id)a4;
- (ATXInfoTimelineEntry)initWithCoder:(id)a3;
- (ATXInfoTimelineEntry)initWithDate:(id)a3 importantRelativeToTimeline:(BOOL)a4;
- (ATXInfoTimelineEntry)initWithDate:(id)a3 relevance:(id)a4;
- (ATXInfoTimelineEntryRelevance)relevance;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isImportantRelativeToTimeline;
- (NSDate)date;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXInfoTimelineEntry

+ (id)entryWithDate:(id)a3 relevance:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithDate:v7 relevance:v6];

  return v8;
}

- (ATXInfoTimelineEntry)initWithDate:(id)a3 relevance:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXInfoTimelineEntry;
  v9 = [(ATXInfoTimelineEntry *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_date, a3);
    objc_storeStrong((id *)&v10->_relevance, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  date = self->_date;
  id v5 = a3;
  [v5 encodeObject:date forKey:@"date"];
  [v5 encodeObject:self->_relevance forKey:@"relevance"];
}

- (ATXInfoTimelineEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  if ([(ATXInfoTimelineEntry *)self checkAndReportDecodingFailureIfNeededForid:v5 key:@"date" coder:v4 errorDomain:@"com.apple.proactive.TimelineSuggestionEntry" errorCode:-1])
  {
    id v6 = 0;
  }
  else
  {
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relevance"];
    if ([(ATXInfoTimelineEntry *)self checkAndReportDecodingFailureIfNeededForid:v7 key:@"relevance" coder:v4 errorDomain:@"com.apple.proactive.TimelineSuggestionEntry" errorCode:-1])
    {
      id v6 = 0;
    }
    else
    {
      self = [(ATXInfoTimelineEntry *)self initWithDate:v5 relevance:v7];
      id v6 = self;
    }
  }
  return v6;
}

+ (id)entryWithDate:(id)a3 importantRelativeToTimeline:(BOOL)a4
{
  id v5 = a3;
  id v6 = (void *)[objc_alloc((Class)a1) initWithDate:v5 relevance:0];

  return v6;
}

- (ATXInfoTimelineEntry)initWithDate:(id)a3 importantRelativeToTimeline:(BOOL)a4
{
  return [(ATXInfoTimelineEntry *)self initWithDate:a3 relevance:0];
}

- (NSDate)date
{
  return self->_date;
}

- (ATXInfoTimelineEntryRelevance)relevance
{
  return self->_relevance;
}

- (BOOL)isImportantRelativeToTimeline
{
  return self->_isImportantRelativeToTimeline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevance, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end