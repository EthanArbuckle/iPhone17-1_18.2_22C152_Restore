@interface StubFCIssueReadingHistoryType
- (BOOL)hasIssueWithIDBeenBadged:(id)a3;
- (BOOL)hasIssueWithIDBeenEngaged:(id)a3;
- (BOOL)hasIssueWithIDBeenSeen:(id)a3;
- (BOOL)hasIssueWithIDBeenVisited:(id)a3;
- (NSArray)allEngagedIssueIDs;
- (NSString)mostRecentlyVisitedIssueID;
- (id)bookmarkForLastVisitToIssueWithID:(id)a3;
- (id)lastEngagedDateForIssueWithID:(id)a3;
- (id)lastRemovedFromMyMagazinesDateForIssueWithID:(id)a3;
- (id)lastSeenDateForIssueWithID:(id)a3;
- (id)lastVisitedDateForIssueWithID:(id)a3;
- (void)prepareForUseWithCompletion:(id)a3;
@end

@implementation StubFCIssueReadingHistoryType

- (BOOL)hasIssueWithIDBeenVisited:(id)a3
{
  return 0;
}

- (BOOL)hasIssueWithIDBeenBadged:(id)a3
{
  return 0;
}

- (BOOL)hasIssueWithIDBeenEngaged:(id)a3
{
  return 0;
}

- (BOOL)hasIssueWithIDBeenSeen:(id)a3
{
  return 0;
}

- (id)bookmarkForLastVisitToIssueWithID:(id)a3
{
  return 0;
}

- (id)lastVisitedDateForIssueWithID:(id)a3
{
  return 0;
}

- (id)lastEngagedDateForIssueWithID:(id)a3
{
  return 0;
}

- (id)lastSeenDateForIssueWithID:(id)a3
{
  return 0;
}

- (id)lastRemovedFromMyMagazinesDateForIssueWithID:(id)a3
{
  return 0;
}

- (NSString)mostRecentlyVisitedIssueID
{
  return (NSString *)0;
}

- (NSArray)allEngagedIssueIDs
{
  v2 = (void *)sub_1DFDFE200();
  return (NSArray *)v2;
}

- (void)prepareForUseWithCompletion:(id)a3
{
  v3 = _Block_copy(a3);
  v4 = (void (*)(void *))v3[2];
  swift_retain();
  v4(v3);
  _Block_release(v3);
  swift_release();
}

@end