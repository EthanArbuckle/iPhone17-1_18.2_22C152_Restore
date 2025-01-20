@interface PPSpotlightSessionState
- (NSMutableArray)engagedBundleIds;
- (NSMutableArray)engagedSpotlightIds;
- (NSMutableArray)seenBundleIds;
- (NSMutableArray)seenSpotlightIds;
- (PPSpotlightSessionState)init;
- (void)setEngagedBundleIds:(id)a3;
- (void)setEngagedSpotlightIds:(id)a3;
- (void)setSeenBundleIds:(id)a3;
- (void)setSeenSpotlightIds:(id)a3;
@end

@implementation PPSpotlightSessionState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagedBundleIds, 0);
  objc_storeStrong((id *)&self->_engagedSpotlightIds, 0);
  objc_storeStrong((id *)&self->_seenBundleIds, 0);
  objc_storeStrong((id *)&self->_seenSpotlightIds, 0);
}

- (void)setEngagedBundleIds:(id)a3
{
}

- (NSMutableArray)engagedBundleIds
{
  return self->_engagedBundleIds;
}

- (void)setEngagedSpotlightIds:(id)a3
{
}

- (NSMutableArray)engagedSpotlightIds
{
  return self->_engagedSpotlightIds;
}

- (void)setSeenBundleIds:(id)a3
{
}

- (NSMutableArray)seenBundleIds
{
  return self->_seenBundleIds;
}

- (void)setSeenSpotlightIds:(id)a3
{
}

- (NSMutableArray)seenSpotlightIds
{
  return self->_seenSpotlightIds;
}

- (PPSpotlightSessionState)init
{
  v12.receiver = self;
  v12.super_class = (Class)PPSpotlightSessionState;
  v2 = [(PPSpotlightSessionState *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    seenSpotlightIds = v2->_seenSpotlightIds;
    v2->_seenSpotlightIds = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    seenBundleIds = v2->_seenBundleIds;
    v2->_seenBundleIds = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    engagedSpotlightIds = v2->_engagedSpotlightIds;
    v2->_engagedSpotlightIds = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    engagedBundleIds = v2->_engagedBundleIds;
    v2->_engagedBundleIds = (NSMutableArray *)v9;
  }
  return v2;
}

@end