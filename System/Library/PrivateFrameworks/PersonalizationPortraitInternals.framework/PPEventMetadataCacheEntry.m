@interface PPEventMetadataCacheEntry
- (NSDate)expiration;
- (PPEventMetadata)metadata;
- (unint64_t)chunkIndex;
- (void)setChunkIndex:(unint64_t)a3;
- (void)setExpiration:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation PPEventMetadataCacheEntry

- (NSDate)expiration
{
  return self->_expiration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
}

- (unint64_t)chunkIndex
{
  return self->_chunkIndex;
}

- (PPEventMetadata)metadata
{
  return self->_metadata;
}

- (void)setChunkIndex:(unint64_t)a3
{
  self->_chunkIndex = a3;
}

- (void)setMetadata:(id)a3
{
}

- (void)setExpiration:(id)a3
{
}

@end