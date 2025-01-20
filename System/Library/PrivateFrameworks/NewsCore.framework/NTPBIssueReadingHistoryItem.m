@interface NTPBIssueReadingHistoryItem
@end

@implementation NTPBIssueReadingHistoryItem

uint64_t __64__NTPBIssueReadingHistoryItem_FCIssueReadingHistory__asCKRecord__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1A320]);
  uint64_t v1 = [v0 initWithZoneName:@"IssueReadingHistory" ownerName:*MEMORY[0x1E4F19C08]];
  uint64_t v2 = _MergedGlobals_207;
  _MergedGlobals_207 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

@end