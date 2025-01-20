@interface EPWatchPusherProtobufContext
- (AbstractTimer)timer;
- (NRPBWatchPairingExtendedMetadata)metadata;
- (NSMutableArray)completions;
- (void)setCompletions:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation EPWatchPusherProtobufContext

- (AbstractTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (NRPBWatchPairingExtendedMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (void)setCompletions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end