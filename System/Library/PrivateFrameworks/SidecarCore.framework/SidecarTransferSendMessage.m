@interface SidecarTransferSendMessage
@end

@implementation SidecarTransferSendMessage

uint64_t ____SidecarTransferSendMessage_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _sendCompletion:a2];
}

@end