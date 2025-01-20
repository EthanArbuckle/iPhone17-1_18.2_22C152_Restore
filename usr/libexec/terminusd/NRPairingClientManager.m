@interface NRPairingClientManager
@end

@implementation NRPairingClientManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingNRUUIDPairingCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_activePairingNRUUIDs, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end