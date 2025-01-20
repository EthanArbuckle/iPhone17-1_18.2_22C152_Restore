@interface SISchemaInstrumentationMessage
- (BOOL)shouldSuppressMessageUnderConditions:(id)a3;
- (id)_pruneSuppressedMessagesFromArray:(id)a3 underConditions:(id)a4;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)formattedJsonBody;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (void)unwrapMessageWithCompletion:(id)a3;
@end

@implementation SISchemaInstrumentationMessage

- (id)formattedJsonBody
{
  v3 = [(SISchemaInstrumentationMessage *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v3])
  {
    v4 = (void *)MEMORY[0x1E4F28D90];
    v5 = [(SISchemaInstrumentationMessage *)self dictionaryRepresentation];
    uint64_t v14 = 0;
    v6 = [v4 dataWithJSONObject:v5 options:3 error:&v14];
    uint64_t v7 = v14;

    v8 = 0;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (!v9) {
      goto LABEL_10;
    }
    uint64_t v10 = [[NSString alloc] initWithData:v6 encoding:4];
  }
  else
  {
    v11 = NSString;
    v12 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v12);
    uint64_t v10 = [v11 stringWithFormat:@"{ \"error\" : \"Invalid JSON\", \"messageType\" : \"%@\" }", v6];
  }
  v8 = (void *)v10;
LABEL_10:

  return v8;
}

- (id)qualifiedMessageName
{
  return @"unspecified";
}

- (id)_pruneSuppressedMessagesFromArray:(id)a3 underConditions:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __105__SISchemaInstrumentationMessage_SensitiveConditions___pruneSuppressedMessagesFromArray_underConditions___block_invoke;
  v21[3] = &unk_1E5EA9C00;
  id v8 = v6;
  id v22 = v8;
  id v9 = v7;
  id v23 = v9;
  [v5 enumerateObjectsUsingBlock:v21];
  if (v9)
  {
    id v10 = (id)[v5 mutableCopy];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v11 = objc_msgSend(v9, "reverseObjectEnumerator", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(v10, "removeObjectAtIndex:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "unsignedIntegerValue"));
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v24 count:16];
      }
      while (v13);
    }
  }
  else
  {
    id v10 = v5;
  }

  return v10;
}

void __105__SISchemaInstrumentationMessage_SensitiveConditions___pruneSuppressedMessagesFromArray_underConditions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = [a2 applySensitiveConditionsPolicy:*(void *)(a1 + 32)];
  if ([v7 suppressMessage])
  {
    id v5 = *(void **)(a1 + 40);
    id v6 = [NSNumber numberWithUnsignedInteger:a3];
    [v5 addObject:v6];
  }
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(SISensitiveConditionsMessagePolicyResult);
  LODWORD(self) = [(SISchemaInstrumentationMessage *)self shouldSuppressMessageUnderConditions:v4];

  if (self) {
    [(SISensitiveConditionsMessagePolicyResult *)v5 setSuppressMessage:1];
  }
  return v5;
}

- (id)suppressMessageUnderConditions
{
  return +[SISensitiveConditionsSet fromDeviceSensitivityState:1];
}

- (BOOL)shouldSuppressMessageUnderConditions:(id)a3
{
  id v4 = a3;
  id v5 = [(SISchemaInstrumentationMessage *)self suppressMessageUnderConditions];
  BOOL v6 = ([v4 isEmpty] & 1) == 0 && (objc_msgSend(v4, "intersectsWith:", v5) & 1) != 0;

  return v6;
}

- (void)unwrapMessageWithCompletion:(id)a3
{
}

@end