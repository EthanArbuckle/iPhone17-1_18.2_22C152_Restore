@interface TBMutableTileFetchResponse
- (NSArray)results;
- (NSDictionary)resultsByBSSID;
- (NSError)error;
- (NSMutableSet)mutableTiles;
- (NSSet)tiles;
- (TBMutableTileFetchResponse)init;
- (void)addResponse:(id)a3;
- (void)setMutableTiles:(id)a3;
@end

@implementation TBMutableTileFetchResponse

- (TBMutableTileFetchResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)TBMutableTileFetchResponse;
  v2 = [(TBMutableTileFetchResponse *)&v6 init];
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  mutableTiles = v2->_mutableTiles;
  v2->_mutableTiles = (NSMutableSet *)v3;

  return v2;
}

- (void)addResponse:(id)a3
{
  id v8 = a3;
  v4 = [v8 tiles];

  if (v4)
  {
    mutableTiles = self->_mutableTiles;
    objc_super v6 = [v8 tiles];
    v7 = [v6 allObjects];
    [(NSMutableSet *)mutableTiles addObjectsFromArray:v7];
  }
}

- (NSSet)tiles
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithSet:self->_mutableTiles];
}

- (NSError)error
{
  return self->error;
}

- (NSArray)results
{
  return self->results;
}

- (NSDictionary)resultsByBSSID
{
  return self->resultsByBSSID;
}

- (NSMutableSet)mutableTiles
{
  return self->_mutableTiles;
}

- (void)setMutableTiles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableTiles, 0);
  objc_storeStrong((id *)&self->resultsByBSSID, 0);
  objc_storeStrong((id *)&self->results, 0);

  objc_storeStrong((id *)&self->error, 0);
}

@end