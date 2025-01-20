@interface TUCall(TCSClientServer)
- (uint64_t)tc_useUnderlyingRemoteUplinkMuted;
- (void)tc_setUseUnderlyingRemoteUplinkMuted:()TCSClientServer;
@end

@implementation TUCall(TCSClientServer)

- (void)tc_setUseUnderlyingRemoteUplinkMuted:()TCSClientServer
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_tc_useUnderlyingRemoteUplinkMuted, v2, (void *)3);
}

- (uint64_t)tc_useUnderlyingRemoteUplinkMuted
{
  v1 = objc_getAssociatedObject(a1, sel_tc_useUnderlyingRemoteUplinkMuted);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

@end