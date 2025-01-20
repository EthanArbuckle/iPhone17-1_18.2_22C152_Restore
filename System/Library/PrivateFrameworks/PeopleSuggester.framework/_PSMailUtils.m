@interface _PSMailUtils
+ (id)recipientsForMailLabel:(id)a3 contactResolver:(id)a4;
+ (id)recipientsForRecipientString:(id)a3 contactResolver:(id)a4;
@end

@implementation _PSMailUtils

+ (id)recipientsForMailLabel:(id)a3 contactResolver:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [a3 objectForKeyedSubscript:@"mailRecipients"];
  v7 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v13 = [_PSRecipient alloc];
        v14 = [v12 identifier];
        v15 = [v12 handle];
        v16 = [v5 resolveContact:v12];
        v17 = [(_PSRecipient *)v13 initWithIdentifier:v14 handle:v15 contact:v16];

        [v7 addObject:v17];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  return v7;
}

+ (id)recipientsForRecipientString:(id)a3 contactResolver:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [MEMORY[0x1E4F5B3D8] recipientIdentifiersFromMobileMailConversationId:a3];
  v7 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v14 = [_PSRecipient alloc];
        v15 = objc_msgSend(v5, "resolveContactIfPossibleFromContactIdentifierString:", v13, (void)v18);
        v16 = [(_PSRecipient *)v14 initWithIdentifier:v13 handle:v13 contact:v15];

        [v7 addObject:v16];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v7;
}

@end