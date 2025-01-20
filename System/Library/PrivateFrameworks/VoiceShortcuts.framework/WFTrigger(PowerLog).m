@interface WFTrigger(PowerLog)
+ (id)powerLogEventKindForTrigger:()PowerLog;
@end

@implementation WFTrigger(PowerLog)

+ (id)powerLogEventKindForTrigger:()PowerLog
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (powerLogEventKindForTrigger__onceToken != -1) {
    dispatch_once(&powerLogEventKindForTrigger__onceToken, &__block_literal_global_1874);
  }
  v4 = (void *)powerLogEventKindForTrigger__eventKinds;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [v4 objectForKeyedSubscript:v6];

  if (!v7)
  {
    v8 = getWFTriggersLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      v11 = "+[WFTrigger(PowerLog) powerLogEventKindForTrigger:]";
      __int16 v12 = 2112;
      uint64_t v13 = objc_opt_class();
      _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_ERROR, "%s Missing eventKind for %@", (uint8_t *)&v10, 0x16u);
    }

    v7 = &unk_1F2270790;
  }

  return v7;
}

@end