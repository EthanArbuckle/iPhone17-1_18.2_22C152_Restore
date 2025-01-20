@interface TUNotifyOfRemindMeLater
@end

@implementation TUNotifyOfRemindMeLater

uint64_t (*__TUNotifyOfRemindMeLater_block_invoke())(void, void, void)
{
  result = (uint64_t (*)(void, void, void))CUTWeakLinkSymbol();
  TUNotifyOfRemindMeLater__BBDataProviderSendMessage = result;
  return result;
}

@end