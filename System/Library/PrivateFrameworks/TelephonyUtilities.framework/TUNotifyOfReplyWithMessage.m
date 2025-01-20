@interface TUNotifyOfReplyWithMessage
@end

@implementation TUNotifyOfReplyWithMessage

uint64_t (*__TUNotifyOfReplyWithMessage_block_invoke())(void, void, void)
{
  result = (uint64_t (*)(void, void, void))CUTWeakLinkSymbol();
  TUNotifyOfReplyWithMessage__BBDataProviderSendMessage = result;
  return result;
}

@end