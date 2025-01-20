@interface TBRemoteFetchTileItem
- (NSArray)networks;
- (NSError)error;
- (TBRemoteFetchTileItem)initWithEmptyTileKey:(unint64_t)a3 etag:(id)a4 error:(id)a5;
- (TBRemoteFetchTileItem)initWithTile:(id)a3 status:(unint64_t)a4 etag:(id)a5 error:(id)a6;
- (TBTile)tile;
- (unint64_t)status;
@end

@implementation TBRemoteFetchTileItem

- (TBRemoteFetchTileItem)initWithTile:(id)a3 status:(unint64_t)a4 etag:(id)a5 error:(id)a6
{
  v10 = (NSError *)a6;
  v23.receiver = self;
  v23.super_class = (Class)TBRemoteFetchTileItem;
  id v11 = a5;
  id v12 = a3;
  v13 = [(TBRemoteFetchTileItem *)&v23 init];
  uint64_t v14 = objc_msgSend(v12, "ess", v23.receiver, v23.super_class);
  networks = v13->_networks;
  v13->_networks = (NSArray *)v14;

  v13->_status = a4;
  v16 = [TBFetchedTile alloc];
  uint64_t v17 = [v12 tileKey];

  v18 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v19 = [(TBFetchedTile *)v16 initWithKey:v17 etag:v11 created:v18];

  tile = v13->_tile;
  v13->_tile = (TBTile *)v19;

  error = v13->_error;
  v13->_error = v10;

  return v13;
}

- (TBRemoteFetchTileItem)initWithEmptyTileKey:(unint64_t)a3 etag:(id)a4 error:(id)a5
{
  v8 = (NSError *)a5;
  v17.receiver = self;
  v17.super_class = (Class)TBRemoteFetchTileItem;
  id v9 = a4;
  v10 = [(TBRemoteFetchTileItem *)&v17 init];
  v10->_status = 3;
  id v11 = [TBFetchedTile alloc];
  id v12 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v17.receiver, v17.super_class);
  uint64_t v13 = [(TBFetchedTile *)v11 initWithKey:a3 etag:v9 created:v12];

  tile = v10->_tile;
  v10->_tile = (TBTile *)v13;

  error = v10->_error;
  v10->_error = v8;

  return v10;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tile, 0);
  objc_storeStrong((id *)&self->_networks, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end