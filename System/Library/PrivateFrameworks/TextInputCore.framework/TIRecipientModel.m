@interface TIRecipientModel
- (NSString)identifier;
- (RKMessageResponseManager)trainer;
- (TILinguisticDataSourceMessage)lastMessage;
- (TIRecipientModel)initWithCompositeName:(id)a3 andTrainer:(id)a4;
- (id)languageGuessForString:(id)a3;
- (void)handleMessages:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastMessage:(id)a3;
- (void)setTrainer:(id)a3;
@end

@implementation TIRecipientModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastMessage, 0);
  objc_storeStrong((id *)&self->_trainer, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setLastMessage:(id)a3
{
}

- (TILinguisticDataSourceMessage)lastMessage
{
  return self->_lastMessage;
}

- (void)setTrainer:(id)a3
{
}

- (RKMessageResponseManager)trainer
{
  return self->_trainer;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)handleMessages:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    uint64_t v27 = *(void *)v31;
    id v28 = v4;
    do
    {
      uint64_t v8 = 0;
      uint64_t v29 = v6;
      do
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v30 + 1) + 8 * v8);
        v10 = [(TIRecipientModel *)self lastMessage];
        if (([v10 fromMe] & 1) == 0)
        {
          int v11 = [v9 fromMe];

          if (!v11) {
            goto LABEL_19;
          }
          v12 = [(TIRecipientModel *)self lastMessage];
          v13 = [v12 body];
          v10 = [(TIRecipientModel *)self languageGuessForString:v13];

          v14 = [v9 body];
          v15 = [(TIRecipientModel *)self languageGuessForString:v14];

          if (v15 && [v15 isEqualToString:v10])
          {
            if (TICanLogMessageAtLevel_onceToken != -1) {
              dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
            }
            if (TICanLogMessageAtLevel_logLevel)
            {
              v16 = TIOSLogFacility();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                v22 = NSString;
                v23 = [(TIRecipientModel *)self lastMessage];
                v24 = [v23 body];
                v25 = [v9 body];
                v26 = [v22 stringWithFormat:@"%s ResponseKitTrainer: training with message pair (%@), (%@) (language = %@)", "-[TIRecipientModel handleMessages:]", v24, v25, v15];
                *(_DWORD *)buf = 138412290;
                v35 = v26;
                _os_log_debug_impl(&dword_1E3F0E000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }
            }
            v17 = [(TIRecipientModel *)self trainer];
            v18 = [v9 body];
            v19 = [(TIRecipientModel *)self lastMessage];
            v20 = [v19 body];
            v21 = [(TIRecipientModel *)self identifier];
            [v17 registerResponse:v18 forMessage:v20 forContext:v21 withLanguage:v15];

            uint64_t v7 = v27;
            id v4 = v28;
            uint64_t v6 = v29;
          }
        }
LABEL_19:
        [(TIRecipientModel *)self setLastMessage:v9];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v6);
  }
}

- (id)languageGuessForString:(id)a3
{
  if (a3)
  {
    v3 = (__CFString *)a3;
    v7.length = [(__CFString *)v3 length];
    v7.location = 0;
    id v4 = (__CFString *)CFStringTokenizerCopyBestStringLanguage(v3, v7);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (TIRecipientModel)initWithCompositeName:(id)a3 andTrainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TIRecipientModel;
  uint64_t v8 = [(TIRecipientModel *)&v13 init];
  if (v8)
  {
    v9 = +[TICryptographer sharedCryptographer];
    uint64_t v10 = [v9 stringDigestForName:v6];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v10;

    objc_storeStrong((id *)&v8->_trainer, a4);
  }

  return v8;
}

@end