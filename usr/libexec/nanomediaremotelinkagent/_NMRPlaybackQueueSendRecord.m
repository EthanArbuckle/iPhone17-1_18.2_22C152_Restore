@interface _NMRPlaybackQueueSendRecord
- (NSData)queueData;
- (NSSet)invalidatedMetadataIdentifiers;
- (void)setInvalidatedMetadataIdentifiers:(id)a3;
- (void)setQueueData:(id)a3;
@end

@implementation _NMRPlaybackQueueSendRecord

- (NSData)queueData
{
  return self->_queueData;
}

- (void)setQueueData:(id)a3
{
}

- (NSSet)invalidatedMetadataIdentifiers
{
  return self->_invalidatedMetadataIdentifiers;
}

- (void)setInvalidatedMetadataIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidatedMetadataIdentifiers, 0);

  objc_storeStrong((id *)&self->_queueData, 0);
}

@end