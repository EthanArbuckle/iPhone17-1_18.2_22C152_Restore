@interface MFMailMessageLibraryQueryTransformer
+ (OS_os_log)log;
- (EDMessagePersistence)messagePersistence;
- (MFMailMessageLibraryQueryTransformer)initWithMessagePersistence:(id)a3;
- (MFMessageCriterionConverter)criterionConverter;
- (id)criterionForQuery:(id)a3;
- (id)mailAccountForIdentifier:(id)a3;
- (id)messageCriterionConverter:(id)a3 expressionForConstantValue:(id)a4 withCriterionType:(int64_t)a5;
- (int64_t)messageCriterionConverter:(id)a3 criterionTypeForKey:(id)a4;
- (unsigned)optionsForQuery:(id)a3;
- (void)setCriterionConverter:(id)a3;
@end

@implementation MFMailMessageLibraryQueryTransformer

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MFMailMessageLibraryQueryTransformer_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_18 != -1) {
    dispatch_once(&log_onceToken_18, block);
  }
  v2 = (void *)log_log_18;
  return (OS_os_log *)v2;
}

void __43__MFMailMessageLibraryQueryTransformer_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_18;
  log_log_18 = (uint64_t)v1;
}

- (MFMailMessageLibraryQueryTransformer)initWithMessagePersistence:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMailMessageLibraryQueryTransformer;
  v5 = [(MFMailMessageLibraryQueryTransformer *)&v9 init];
  if (v5)
  {
    v6 = objc_alloc_init(MFMessageCriterionConverter);
    criterionConverter = v5->_criterionConverter;
    v5->_criterionConverter = v6;

    [(MFMessageCriterionConverter *)v5->_criterionConverter setDelegate:v5];
    objc_storeWeak((id *)&v5->_messagePersistence, v4);
  }

  return v5;
}

- (int64_t)messageCriterionConverter:(id)a3 criterionTypeForKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (messageCriterionConverter_criterionTypeForKey__onceToken[0] != -1) {
    dispatch_once(messageCriterionConverter_criterionTypeForKey__onceToken, &__block_literal_global_43);
  }
  v7 = [(id)messageCriterionConverter_criterionTypeForKey__mapping objectForKeyedSubscript:v6];
  int64_t v8 = [v7 integerValue];

  return v8;
}

void __86__MFMailMessageLibraryQueryTransformer_messageCriterionConverter_criterionTypeForKey___block_invoke()
{
  v15[24] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F5FE18];
  v14[0] = *MEMORY[0x1E4F600A0];
  v14[1] = v0;
  v15[0] = &unk_1EFF50E20;
  v15[1] = &unk_1EFF50E38;
  uint64_t v1 = *MEMORY[0x1E4F5FE30];
  v14[2] = *MEMORY[0x1E4F5FEC8];
  v14[3] = v1;
  v15[2] = &unk_1EFF50E50;
  v15[3] = &unk_1EFF50E68;
  uint64_t v2 = *MEMORY[0x1E4F5FEB0];
  v14[4] = *MEMORY[0x1E4F5FE38];
  v14[5] = v2;
  v15[4] = &unk_1EFF50E80;
  v15[5] = &unk_1EFF50E98;
  uint64_t v3 = *MEMORY[0x1E4F5FEE0];
  v14[6] = *MEMORY[0x1E4F5FEE8];
  v14[7] = v3;
  v15[6] = &unk_1EFF50EB0;
  v15[7] = &unk_1EFF50EC8;
  uint64_t v4 = *MEMORY[0x1E4F5FE90];
  v14[8] = *MEMORY[0x1E4F5FEF0];
  v14[9] = v4;
  v15[8] = &unk_1EFF50EE0;
  v15[9] = &unk_1EFF50EF8;
  uint64_t v5 = *MEMORY[0x1E4F5FEA0];
  v14[10] = *MEMORY[0x1E4F5FEA8];
  v14[11] = v5;
  v15[10] = &unk_1EFF50F10;
  v15[11] = &unk_1EFF50F28;
  uint64_t v6 = *MEMORY[0x1E4F5FEB8];
  v14[12] = *MEMORY[0x1E4F5FE20];
  v14[13] = v6;
  v15[12] = &unk_1EFF50F40;
  v15[13] = &unk_1EFF50F58;
  uint64_t v7 = *MEMORY[0x1E4F60098];
  v14[14] = *MEMORY[0x1E4F600A8];
  v14[15] = v7;
  v15[14] = &unk_1EFF50F70;
  v15[15] = &unk_1EFF50F88;
  uint64_t v8 = *MEMORY[0x1E4F5FF00];
  v14[16] = *MEMORY[0x1E4F5FEF8];
  v14[17] = v8;
  v15[16] = &unk_1EFF50FA0;
  v15[17] = &unk_1EFF50FB8;
  uint64_t v9 = *MEMORY[0x1E4F5FE68];
  v14[18] = *MEMORY[0x1E4F5FF18];
  v14[19] = v9;
  v15[18] = &unk_1EFF50FD0;
  v15[19] = &unk_1EFF50FE8;
  uint64_t v10 = *MEMORY[0x1E4F5FE58];
  v14[20] = *MEMORY[0x1E4F5FE60];
  v14[21] = v10;
  v15[20] = &unk_1EFF51000;
  v15[21] = &unk_1EFF51018;
  uint64_t v11 = *MEMORY[0x1E4F5FE00];
  v14[22] = *MEMORY[0x1E4F5FF68];
  v14[23] = v11;
  v15[22] = &unk_1EFF51030;
  v15[23] = &unk_1EFF51048;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:24];
  v13 = (void *)messageCriterionConverter_criterionTypeForKey__mapping;
  messageCriterionConverter_criterionTypeForKey__mapping = v12;
}

- (id)messageCriterionConverter:(id)a3 expressionForConstantValue:(id)a4 withCriterionType:(int64_t)a5
{
  id v7 = a4;
  if (a5 == 23)
  {
    uint64_t v8 = [(MFMailMessageLibraryQueryTransformer *)self messagePersistence];
    uint64_t v9 = [v8 messageObjectIDCriterionExpressionForPredicateValue:v7];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)mailAccountForIdentifier:(id)a3
{
  uint64_t v3 = +[MailAccount accountWithUniqueId:a3];
  return v3;
}

- (id)criterionForQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MFMailMessageLibraryQueryTransformer *)self criterionConverter];
  uint64_t v6 = [v4 predicate];
  id v7 = [v5 messageCriterionFromPredicate:v6];

  return v7;
}

- (unsigned)optionsForQuery:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  if (optionsForQuery__onceToken != -1) {
    dispatch_once(&optionsForQuery__onceToken, &__block_literal_global_59);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = [v15 sortDescriptors];
  unsigned int v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v9 = (void *)optionsForQuery__mapping;
        uint64_t v10 = [v8 key];
        uint64_t v11 = [v9 objectForKeyedSubscript:v10];

        if (v11)
        {
          int v12 = [v11 unsignedIntegerValue];
          if ([v8 ascending]) {
            int v13 = 1024;
          }
          else {
            int v13 = 0;
          }
          v4 |= v13 | v12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  return v4;
}

void __56__MFMailMessageLibraryQueryTransformer_optionsForQuery___block_invoke()
{
  v5[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F5FE30];
  v4[0] = *MEMORY[0x1E4F5FE38];
  v4[1] = v0;
  v5[0] = &unk_1EFF51060;
  v5[1] = &unk_1EFF51078;
  uint64_t v1 = *MEMORY[0x1E4F5FF18];
  v4[2] = *MEMORY[0x1E4F5FEF8];
  v4[3] = v1;
  v5[2] = &unk_1EFF51090;
  v5[3] = &unk_1EFF510A8;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  uint64_t v3 = (void *)optionsForQuery__mapping;
  optionsForQuery__mapping = v2;
}

- (MFMessageCriterionConverter)criterionConverter
{
  return self->_criterionConverter;
}

- (void)setCriterionConverter:(id)a3
{
}

- (EDMessagePersistence)messagePersistence
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messagePersistence);
  return (EDMessagePersistence *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messagePersistence);
  objc_storeStrong((id *)&self->_criterionConverter, 0);
}

@end