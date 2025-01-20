@interface ICActivityStreamDigest
- (BOOL)objc_hasRecentUpdates;
- (BOOL)objc_hasUnseenHighlights;
- (BOOL)objc_hasUnseenSummary;
- (BOOL)objc_isCurrentUserMentionedInFilter:(id)a3;
- (BOOL)objc_isCurrentUserMentionedInRecentSummary;
- (ICActivityEventResolving)resolverStorage;
- (ICActivityStreamDigest)initWithResolver:(id)a3;
- (ICTTTextEditFilter)objc_recentUpdatesFilter;
- (NSDate)lastActivitySummaryViewedDate;
- (NSDate)recentUpdatesGenerationDate;
- (NSValue)objc_recentUpdatesRangeValue;
- (id)recentActivityEventsStorage;
- (void)setLastActivitySummaryViewedDate:(id)a3;
- (void)setRecentActivityEventsStorage:(id)a3;
- (void)setRecentUpdatesGenerationDate:(id)a3;
@end

@implementation ICActivityStreamDigest

- (ICActivityStreamDigest)initWithResolver:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICActivityStreamDigest;
  v6 = [(ICActivityStreamDigest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_resolverStorage, a3);
  }

  return v7;
}

- (ICActivityEventResolving)resolverStorage
{
  return self->_resolverStorage;
}

- (NSDate)lastActivitySummaryViewedDate
{
  return self->_lastActivitySummaryViewedDate;
}

- (void)setLastActivitySummaryViewedDate:(id)a3
{
}

- (NSDate)recentUpdatesGenerationDate
{
  return self->_recentUpdatesGenerationDate;
}

- (void)setRecentUpdatesGenerationDate:(id)a3
{
}

- (id)recentActivityEventsStorage
{
  return self->_recentActivityEventsStorage;
}

- (void)setRecentActivityEventsStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_recentActivityEventsStorage, 0);
  objc_storeStrong((id *)&self->_recentUpdatesGenerationDate, 0);
  objc_storeStrong((id *)&self->_lastActivitySummaryViewedDate, 0);
  objc_storeStrong((id *)&self->_resolverStorage, 0);
}

- (ICTTTextEditFilter)objc_recentUpdatesFilter
{
  v2 = self;
  id v3 = ICActivityStreamDigest.recentUpdatesFilter.getter();

  return (ICTTTextEditFilter *)v3;
}

- (BOOL)objc_hasUnseenHighlights
{
  v2 = self;
  if ([(ICActivityStreamDigest *)v2 objc_hasUnseenSummary])
  {
    ICActivityStreamDigest.recentUpdatesRange.getter();
    char v4 = v3;

    return (v4 & 1) == 0;
  }
  else
  {

    return 0;
  }
}

- (BOOL)objc_hasUnseenSummary
{
  v2 = self;
  char v3 = ICActivityStreamDigest.hasUnseenSummary.getter();

  return v3 & 1;
}

- (BOOL)objc_hasRecentUpdates
{
  v2 = self;
  BOOL v3 = ICActivityStreamDigest.hasRecentUpdates.getter();

  return v3;
}

- (NSValue)objc_recentUpdatesRangeValue
{
  v2 = self;
  uint64_t v3 = ICActivityStreamDigest.recentUpdatesRange.getter();
  if (v5) {
    id v6 = 0;
  }
  else {
    id v6 = objc_msgSend(self, sel_valueWithRange_, v3, v4);
  }

  return (NSValue *)v6;
}

- (BOOL)objc_isCurrentUserMentionedInRecentSummary
{
  v2 = self;
  char v3 = ICActivityStreamDigest.isCurrentUserMentionedInRecentSummary.getter();

  return v3 & 1;
}

- (BOOL)objc_isCurrentUserMentionedInFilter:(id)a3
{
  id v4 = a3;
  char v5 = self;
  uint64_t v6 = sub_1C3C3BFB8(v4);
  sub_1C3C4A420(v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1C3C3E410((uint64_t)&v10);
  swift_bridgeObjectRelease();
  char v7 = v11;
  char v8 = v12;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v7 | v8) & 1;
}

@end