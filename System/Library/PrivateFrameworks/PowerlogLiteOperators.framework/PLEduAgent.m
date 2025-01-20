@interface PLEduAgent
+ (id)entryEventPointDefinitionMode;
+ (id)entryEventPointDefinitionSyncBubble;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (PLEduAgent)init;
- (PLXPCListenerOperatorComposition)syncBubbleStatusNotification;
- (void)initOperatorDependancies;
- (void)logEventPointMode;
- (void)setSyncBubbleStatusNotification:(id)a3;
@end

@implementation PLEduAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLEduAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"Mode";
  objc_super v2 = +[PLEduAgent entryEventPointDefinitionMode];
  v6[1] = @"SyncBubble";
  v7[0] = v2;
  v3 = +[PLEduAgent entryEventPointDefinitionSyncBubble];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)entryEventPointDefinitionMode
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F07C0;
  v12[1] = MEMORY[0x1E4F1CC28];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"EduMode";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventPointDefinitionSyncBubble
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F29F07D0;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  v8 = @"status";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v9 = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

- (PLEduAgent)init
{
  if ([MEMORY[0x1E4F92A38] isHomePod])
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLEduAgent;
    self = [(PLAgent *)&v5 init];
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  id v3 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __38__PLEduAgent_initOperatorDependancies__block_invoke;
  v6[3] = &unk_1E692A6F8;
  v6[4] = self;
  v4 = (PLXPCListenerOperatorComposition *)[v3 initWithOperator:self withRegistration:&unk_1F29E9658 withBlock:v6];
  syncBubbleStatusNotification = self->_syncBubbleStatusNotification;
  self->_syncBubbleStatusNotification = v4;
}

void __38__PLEduAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __38__PLEduAgent_initOperatorDependancies__block_invoke_2;
    v19 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v20 = v7;
    if (qword_1EBD5BDD8 != -1) {
      dispatch_once(&qword_1EBD5BDD8, &block);
    }
    if (_MergedGlobals_88)
    {
      v8 = [NSString stringWithFormat:@"sync bubble payload=%@", v6, block, v17, v18, v19, v20];
      v9 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLEduAgent.m"];
      v11 = [v10 lastPathComponent];
      v12 = [NSString stringWithUTF8String:"-[PLEduAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:79];

      v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v14 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"SyncBubble"];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v14 withRawData:v6];
  [*(id *)(a1 + 32) logEntry:v15];
}

uint64_t __38__PLEduAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_88 = result;
  return result;
}

- (void)logEventPointMode
{
  id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"Mode"];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
  v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x1E4F92A88], "isEduMode"));
  [v3 setObject:v4 forKeyedSubscript:@"EduMode"];

  [(PLOperator *)self logEntry:v3];
}

- (PLXPCListenerOperatorComposition)syncBubbleStatusNotification
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSyncBubbleStatusNotification:(id)a3
{
}

- (void).cxx_destruct
{
}

@end