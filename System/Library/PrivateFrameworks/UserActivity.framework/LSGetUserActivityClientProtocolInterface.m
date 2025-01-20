@interface LSGetUserActivityClientProtocolInterface
@end

@implementation LSGetUserActivityClientProtocolInterface

void ___LSGetUserActivityClientProtocolInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0CC79F8];
  v1 = (void *)_LSGetUserActivityClientProtocolInterface_result;
  _LSGetUserActivityClientProtocolInterface_result = v0;

  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [(id)_LSGetUserActivityClientProtocolInterface_result setClasses:v14 forSelector:sel_doUpdateUserActivityInfo_makeCurrent_completionHandler_ argumentIndex:0 ofReply:0];
  [(id)_LSGetUserActivityClientProtocolInterface_result setClasses:v14 forSelector:sel_doFetchUserActivityInfoWithUUID_completionHandler_ argumentIndex:0 ofReply:1];
  [(id)_LSGetUserActivityClientProtocolInterface_result setClasses:v14 forSelector:sel_doPinUserActivityInfo_completionHandler_ argumentIndex:0 ofReply:0];
  v10 = (void *)_LSGetUserActivityClientProtocolInterface_result;
  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  [v10 setClasses:v13 forSelector:sel_doGetUserActivityProxiesWithOptions_completionHandler_ argumentIndex:0 ofReply:1];
}

@end