@interface TBLocalFetchTileItem
- (NSArray)networks;
- (NSError)error;
- (TBLocalFetchTileItem)initWithTile:(id)a3 error:(id)a4;
- (TBTile)tile;
- (unint64_t)status;
@end

@implementation TBLocalFetchTileItem

- (TBLocalFetchTileItem)initWithTile:(id)a3 error:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)TBLocalFetchTileItem;
  id v4 = a3;
  v5 = [(TBLocalFetchTileItem *)&v16 init];
  v5->_status = 1;
  v6 = [TBFetchedTile alloc];
  uint64_t v7 = objc_msgSend(v4, "key", v16.receiver, v16.super_class);
  v8 = [v4 etag];
  v9 = [v4 created];
  uint64_t v10 = [(TBFetchedTile *)v6 initWithKey:v7 etag:v8 created:v9];
  tile = v5->_tile;
  v5->_tile = (TBTile *)v10;

  v12 = [v4 networks];

  uint64_t v13 = [v12 allObjects];
  networks = v5->_networks;
  v5->_networks = (NSArray *)v13;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tile, 0);
  objc_storeStrong((id *)&self->_networks, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

- (NSError)error
{
  return self->_error;
}

- (NSArray)networks
{
  return self->_networks;
}

- (unint64_t)status
{
  return self->_status;
}

- (TBTile)tile
{
  return self->_tile;
}

@end