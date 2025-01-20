@interface NSProgress(SFAirDropTransferProgressAdditions)
+ (__CFString)sf_transferStateAsString:()SFAirDropTransferProgressAdditions;
+ (uint64_t)sf_publishingKeyForApp:()SFAirDropTransferProgressAdditions sessionID:;
- (id)sf_bundleID;
- (id)sf_error;
- (id)sf_initWithAppBundle:()SFAirDropTransferProgressAdditions sessionID:andPersonRealName:;
- (id)sf_initWithFileURL:()SFAirDropTransferProgressAdditions;
- (id)sf_personRealName;
- (id)sf_publishingKey;
- (id)sf_sessionID;
- (uint64_t)sf_failedWithError:()SFAirDropTransferProgressAdditions;
- (uint64_t)sf_initiator;
- (uint64_t)sf_transferState;
- (void)setSf_initiator:()SFAirDropTransferProgressAdditions;
- (void)setSf_transferState:()SFAirDropTransferProgressAdditions;
@end

@implementation NSProgress(SFAirDropTransferProgressAdditions)

+ (uint64_t)sf_publishingKeyForApp:()SFAirDropTransferProgressAdditions sessionID:
{
  return [NSString stringWithFormat:@"%@.%@", a3, a4];
}

- (id)sf_initWithAppBundle:()SFAirDropTransferProgressAdditions sessionID:andPersonRealName:
{
  v18[5] = *MEMORY[0x263EF8340];
  v17[0] = *MEMORY[0x263F08468];
  v8 = (void *)MEMORY[0x263F08AB8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = objc_msgSend(v8, "sf_publishingKeyForApp:sessionID:", v11, v10);
  v18[0] = v12;
  v17[1] = @"sendState";
  v13 = [NSNumber numberWithInteger:0];
  v18[1] = v13;
  v18[2] = v11;
  v17[2] = @"bundleID";
  v17[3] = @"sessionID";
  v17[4] = @"personRealName";
  v18[3] = v10;
  v18[4] = v9;
  v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:5];

  id v15 = a1;
  [v15 setCompletedUnitCount:-1];
  [v15 setTotalUnitCount:0];
  [v15 setCancellable:1];
  [v15 setPausable:0];
  objc_msgSend(v15, "setSf_transferState:", 0);

  return v15;
}

- (id)sf_publishingKey
{
  v2 = (void *)MEMORY[0x263F08AB8];
  v3 = objc_msgSend(a1, "sf_bundleID");
  v4 = objc_msgSend(a1, "sf_sessionID");
  v5 = objc_msgSend(v2, "sf_publishingKeyForApp:sessionID:", v3, v4);

  return v5;
}

- (id)sf_bundleID
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"bundleID"];

  return v2;
}

- (id)sf_sessionID
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"sessionID"];

  return v2;
}

- (id)sf_personRealName
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"personRealName"];

  return v2;
}

- (id)sf_initWithFileURL:()SFAirDropTransferProgressAdditions
{
  v11[2] = *MEMORY[0x263EF8340];
  v10[0] = @"sendState";
  v4 = NSNumber;
  id v5 = a3;
  v6 = [v4 numberWithInteger:0];
  v10[1] = *MEMORY[0x263F08498];
  v11[0] = v6;
  v11[1] = v5;
  v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  id v8 = a1;
  [v8 setCompletedUnitCount:-1];
  [v8 setTotalUnitCount:0];
  [v8 setCancellable:1];
  [v8 setPausable:0];
  objc_msgSend(v8, "setSf_transferState:", 0);

  return v8;
}

+ (__CFString)sf_transferStateAsString:()SFAirDropTransferProgressAdditions
{
  if ((unint64_t)(a3 - 1) > 5) {
    return @"Initialized";
  }
  else {
    return off_264472CF0[a3 - 1];
  }
}

- (void)setSf_initiator:()SFAirDropTransferProgressAdditions
{
  objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "SFAirDropTransferProgressInitiator", v2, (void *)0x301);
}

- (uint64_t)sf_initiator
{
  v1 = objc_getAssociatedObject(a1, "SFAirDropTransferProgressInitiator");
  uint64_t v2 = [v1 unsignedIntValue];

  return v2;
}

- (void)setSf_transferState:()SFAirDropTransferProgressAdditions
{
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setUserInfoObject:v2 forKey:@"sendState"];
}

- (uint64_t)sf_transferState
{
  v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"sendState"];

  uint64_t v3 = [v2 integerValue];
  return v3;
}

- (uint64_t)sf_failedWithError:()SFAirDropTransferProgressAdditions
{
  [a1 setUserInfoObject:a3 forKey:@"error"];
  return objc_msgSend(a1, "setSf_transferState:", 5);
}

- (id)sf_error
{
  v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"error"];

  return v2;
}

@end