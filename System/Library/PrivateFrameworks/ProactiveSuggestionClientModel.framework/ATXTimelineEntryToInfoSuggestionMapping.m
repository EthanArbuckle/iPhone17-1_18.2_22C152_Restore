@interface ATXTimelineEntryToInfoSuggestionMapping
+ (id)entryMappingWithTimelineEntry:(id)a3 suggestionId:(id)a4 withSuggestionMappingReason:(int64_t)a5;
- (ATXInfoTimelineEntry)timelineEntry;
- (ATXTimelineEntryToInfoSuggestionMapping)initWithTimelineEntry:(id)a3 suggestionId:(id)a4 withSuggestionMappingReason:(int64_t)a5;
- (NSString)suggestionId;
- (int64_t)suggestionMappingReason;
@end

@implementation ATXTimelineEntryToInfoSuggestionMapping

- (ATXTimelineEntryToInfoSuggestionMapping)initWithTimelineEntry:(id)a3 suggestionId:(id)a4 withSuggestionMappingReason:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXTimelineEntryToInfoSuggestionMapping;
  v11 = [(ATXTimelineEntryToInfoSuggestionMapping *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_timelineEntry, a3);
    uint64_t v13 = [v10 copy];
    suggestionId = v12->_suggestionId;
    v12->_suggestionId = (NSString *)v13;

    v12->_suggestionMappingReason = a5;
  }

  return v12;
}

+ (id)entryMappingWithTimelineEntry:(id)a3 suggestionId:(id)a4 withSuggestionMappingReason:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithTimelineEntry:v9 suggestionId:v8 withSuggestionMappingReason:a5];

  return v10;
}

- (NSString)suggestionId
{
  return self->_suggestionId;
}

- (ATXInfoTimelineEntry)timelineEntry
{
  return self->_timelineEntry;
}

- (int64_t)suggestionMappingReason
{
  return self->_suggestionMappingReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineEntry, 0);
  objc_storeStrong((id *)&self->_suggestionId, 0);
}

@end