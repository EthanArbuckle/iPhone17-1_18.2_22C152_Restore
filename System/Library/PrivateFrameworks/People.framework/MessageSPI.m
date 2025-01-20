@interface MessageSPI
+ (BOOL)canSendIMessage:(id)a3;
@end

@implementation MessageSPI

+ (BOOL)canSendIMessage:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  v4 = (id *)getIMSPIiMessageServiceSymbolLoc_ptr;
  v16 = (void *)getIMSPIiMessageServiceSymbolLoc_ptr;
  if (!getIMSPIiMessageServiceSymbolLoc_ptr)
  {
    v5 = (void *)IMCoreLibrary();
    v14[3] = (uint64_t)dlsym(v5, "IMSPIiMessageService");
    getIMSPIiMessageServiceSymbolLoc_ptr = v14[3];
    v4 = (id *)v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v4) {
    +[MessageSPI canSendIMessage:]();
  }
  id v6 = *v4;
  id v7 = v3;
  id v8 = v6;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  v9 = (uint64_t (*)(id, id))getIMSPIHasActiveAliasForSendingOnServiceSymbolLoc_ptr;
  v16 = getIMSPIHasActiveAliasForSendingOnServiceSymbolLoc_ptr;
  if (!getIMSPIHasActiveAliasForSendingOnServiceSymbolLoc_ptr)
  {
    v10 = (void *)IMCoreLibrary();
    v14[3] = (uint64_t)dlsym(v10, "IMSPIHasActiveAliasForSendingOnService");
    getIMSPIHasActiveAliasForSendingOnServiceSymbolLoc_ptr = (_UNKNOWN *)v14[3];
    v9 = (uint64_t (*)(id, id))v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v9) {
    +[MessageSPI canSendIMessage:]();
  }
  char v11 = v9(v7, v8);

  return v11;
}

+ (void)canSendIMessage:.cold.1()
{
}

@end