@interface WBSTrackedFirstParty
- (NSArray)blockedTrackers;
- (NSArray)preventedTrackers;
- (NSArray)trackers;
- (WBSTrackedFirstParty)initWithDomain:(id)a3;
- (WBSTrackedFirstParty)initWithDomain:(id)a3 blockedTrackers:(id)a4 preventedTrackers:(id)a5;
- (void)setBlockedTrackers:(id)a3;
- (void)setPreventedTrackers:(id)a3;
@end

@implementation WBSTrackedFirstParty

- (WBSTrackedFirstParty)initWithDomain:(id)a3
{
  return [(WBSTrackedFirstParty *)self initWithDomain:a3 blockedTrackers:MEMORY[0x1E4F1CBF0] preventedTrackers:MEMORY[0x1E4F1CBF0]];
}

- (WBSTrackedFirstParty)initWithDomain:(id)a3 blockedTrackers:(id)a4 preventedTrackers:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)WBSTrackedFirstParty;
  v10 = [(WBSTrackingCapableFirstParty *)&v17 initWithDomain:a3];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    blockedTrackers = v10->_blockedTrackers;
    v10->_blockedTrackers = (NSArray *)v11;

    uint64_t v13 = [v9 copy];
    preventedTrackers = v10->_preventedTrackers;
    v10->_preventedTrackers = (NSArray *)v13;

    v15 = v10;
  }

  return v10;
}

- (NSArray)trackers
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [(NSArray *)self->_preventedTrackers arrayByAddingObjectsFromArray:self->_blockedTrackers];
  v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"domain" ascending:1 selector:sel_localizedCaseInsensitiveCompare_];
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5 = [v2 sortedArrayUsingDescriptors:v4];

  return (NSArray *)v5;
}

- (NSArray)blockedTrackers
{
  return self->_blockedTrackers;
}

- (void)setBlockedTrackers:(id)a3
{
}

- (NSArray)preventedTrackers
{
  return self->_preventedTrackers;
}

- (void)setPreventedTrackers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preventedTrackers, 0);
  objc_storeStrong((id *)&self->_blockedTrackers, 0);
}

@end