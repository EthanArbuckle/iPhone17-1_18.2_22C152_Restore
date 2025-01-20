@interface FCHLSPlaylistState
- (FCHLSPlaylistState)init;
- (void)setCurrentStreamInf:(uint64_t)a1;
@end

@implementation FCHLSPlaylistState

- (void)setCurrentStreamInf:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (FCHLSPlaylistState)init
{
  v12.receiver = self;
  v12.super_class = (Class)FCHLSPlaylistState;
  v2 = [(FCHLSPlaylistState *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    mutableGroups = v2->_mutableGroups;
    v2->_mutableGroups = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    mutableSegments = v2->_mutableSegments;
    v2->_mutableSegments = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    mutableStreamInfs = v2->_mutableStreamInfs;
    v2->_mutableStreamInfs = (NSMutableArray *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    mutableSessionData = v2->_mutableSessionData;
    v2->_mutableSessionData = (NSMutableDictionary *)v9;

    v2->_currentDuration = -1.0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableSessionData, 0);
  objc_storeStrong((id *)&self->_currentKey, 0);
  objc_storeStrong((id *)&self->_mutableStreamInfs, 0);
  objc_storeStrong((id *)&self->_currentStreamInf, 0);
  objc_storeStrong((id *)&self->_mutableSegments, 0);
  objc_storeStrong((id *)&self->_currentMap, 0);
  objc_storeStrong((id *)&self->_mutableGroups, 0);
}

@end