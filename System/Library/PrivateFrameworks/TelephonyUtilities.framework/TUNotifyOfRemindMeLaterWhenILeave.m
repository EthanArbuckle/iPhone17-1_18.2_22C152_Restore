@interface TUNotifyOfRemindMeLaterWhenILeave
@end

@implementation TUNotifyOfRemindMeLaterWhenILeave

uint64_t (*__TUNotifyOfRemindMeLaterWhenILeave_block_invoke())(void, void, void)
{
  result = (uint64_t (*)(void, void, void))CUTWeakLinkSymbol();
  TUNotifyOfRemindMeLaterWhenILeave__BBDataProviderSendMessage = result;
  return result;
}

@end