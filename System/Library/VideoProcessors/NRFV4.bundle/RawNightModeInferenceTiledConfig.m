@interface RawNightModeInferenceTiledConfig
- (NSArray)networkInputNames;
- (NSArray)networkOutputNames;
- (NSNumber)tileHeight;
- (NSNumber)tileWidth;
- (int)espressoStorageType;
- (unint64_t)ktraceID;
- (unint64_t)outputHeight;
- (unint64_t)outputWidth;
- (unint64_t)tilePadding;
- (void)setEspressoStorageType:(int)a3;
- (void)setKtraceID:(unint64_t)a3;
- (void)setNetworkInputNames:(id)a3;
- (void)setNetworkOutputNames:(id)a3;
- (void)setOutputHeight:(unint64_t)a3;
- (void)setOutputWidth:(unint64_t)a3;
- (void)setTileHeight:(id)a3;
- (void)setTilePadding:(unint64_t)a3;
- (void)setTileWidth:(id)a3;
@end

@implementation RawNightModeInferenceTiledConfig

- (unint64_t)tilePadding
{
  return self->_tilePadding;
}

- (void)setTilePadding:(unint64_t)a3
{
  self->_tilePadding = a3;
}

- (int)espressoStorageType
{
  return self->_espressoStorageType;
}

- (void)setEspressoStorageType:(int)a3
{
  self->_espressoStorageType = a3;
}

- (NSArray)networkInputNames
{
  return self->_networkInputNames;
}

- (void)setNetworkInputNames:(id)a3
{
}

- (NSArray)networkOutputNames
{
  return self->_networkOutputNames;
}

- (void)setNetworkOutputNames:(id)a3
{
}

- (unint64_t)outputHeight
{
  return self->_outputHeight;
}

- (void)setOutputHeight:(unint64_t)a3
{
  self->_outputHeight = a3;
}

- (unint64_t)outputWidth
{
  return self->_outputWidth;
}

- (void)setOutputWidth:(unint64_t)a3
{
  self->_outputWidth = a3;
}

- (NSNumber)tileWidth
{
  return self->_tileWidth;
}

- (void)setTileWidth:(id)a3
{
  self->_tileWidth = (NSNumber *)a3;
}

- (NSNumber)tileHeight
{
  return self->_tileHeight;
}

- (void)setTileHeight:(id)a3
{
  self->_tileHeight = (NSNumber *)a3;
}

- (unint64_t)ktraceID
{
  return self->_ktraceID;
}

- (void)setKtraceID:(unint64_t)a3
{
  self->_ktraceID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkOutputNames, 0);

  objc_storeStrong((id *)&self->_networkInputNames, 0);
}

@end