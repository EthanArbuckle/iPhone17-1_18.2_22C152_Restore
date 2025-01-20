@interface RTTConversation
+ (BOOL)supportsSecureCoding;
+ (RTTConversation)conversationWithCall:(id)a3;
+ (RTTConversation)conversationWithCall:(id)a3 withCallback:(id)a4;
+ (RTTConversation)conversationWithCallUID:(id)a3 withCallback:(id)a4;
+ (RTTConversation)conversationWithID:(id)a3 andUtterances:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConversation:(id)a3;
- (NSMutableArray)utterances;
- (NSString)callIdentifier;
- (RTTConversation)init;
- (RTTConversation)initWithCoder:(id)a3;
- (TUCall)call;
- (id)addTranscriptionFromOtherContactPath:(id)a3;
- (id)appendCharacter:(unsigned __int16)a3;
- (id)appendStringFromOtherContactPath:(id)a3;
- (id)description;
- (id)lastUtteranceForMe:(BOOL)a3;
- (id)lastUtteranceForMe:(BOOL)a3 isTranscription:(BOOL)a4;
- (id)mergeUtterancesIfPossible;
- (id)otherContactPath;
- (id)processBackspaceForMe:(BOOL)a3;
- (id)updateTranscriptionFromOtherContactPath:(id)a3;
- (unint64_t)lastUtteranceIndexForMe:(BOOL)a3 isTranscription:(BOOL)a4;
- (unint64_t)utteranceCountForMe:(BOOL)a3;
- (void)addUtterance:(id)a3;
- (void)cleanup;
- (void)encodeWithCoder:(id)a3;
- (void)setCall:(id)a3;
- (void)setCallIdentifier:(id)a3;
- (void)setUtterances:(id)a3;
@end

@implementation RTTConversation

+ (RTTConversation)conversationWithCallUID:(id)a3 withCallback:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = AXLogRTT();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v5;
    _os_log_impl(&dword_21FEA9000, v7, OS_LOG_TYPE_INFO, "Looking for conversation asynchronously: %@", buf, 0xCu);
  }

  v8 = +[RTTServer sharedInstance];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__RTTConversation_conversationWithCallUID_withCallback___block_invoke;
  v12[3] = &unk_264540C20;
  id v13 = v5;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  [v8 findConversationForCallUID:v10 andResult:v12];

  return result;
}

void __56__RTTConversation_conversationWithCallUID_withCallback___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  if (!v3)
  {
    v4 = objc_alloc_init(RTTConversation);
    [(RTTConversation *)v4 setCallIdentifier:*(void *)(a1 + 32)];
    v3 = v4;
  }
  id v5 = v3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (RTTConversation)conversationWithCall:(id)a3 withCallback:(id)a4
{
  id v6 = a4;
  id v8 = [a3 callUUID];
  [a1 conversationWithCallUID:v8 withCallback:v6];

  return result;
}

+ (RTTConversation)conversationWithCall:(id)a3
{
  id v3 = a3;
  if (([MEMORY[0x263F472B0] currentProcessIsHeard] & 1) == 0 && !_AXSInUnitTestMode()) {
    +[RTTConversation conversationWithCall:]();
  }
  v4 = objc_alloc_init(RTTConversation);
  id v5 = [v3 callUUID];
  [(RTTConversation *)v4 setCallIdentifier:v5];

  [(RTTConversation *)v4 setCall:v3];

  return v4;
}

+ (RTTConversation)conversationWithID:(id)a3 andUtterances:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(RTTConversation);
  [(RTTConversation *)v7 setCallIdentifier:v6];

  id v8 = [MEMORY[0x263EFF980] arrayWithArray:v5];

  [(RTTConversation *)v7 setUtterances:v8];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTTConversation)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RTTConversation;
  id v5 = [(RTTConversation *)&v12 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RTTConversationCallIdentifierKey"];
    [(RTTConversation *)v5 setCallIdentifier:v6];

    v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    id v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"RTTConversationUtterancesKey"];
    [(RTTConversation *)v5 setUtterances:v10];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(RTTConversation *)self utterances];
  [v4 encodeObject:v5 forKey:@"RTTConversationUtterancesKey"];

  id v6 = [(RTTConversation *)self callIdentifier];
  [v4 encodeObject:v6 forKey:@"RTTConversationCallIdentifierKey"];
}

- (RTTConversation)init
{
  v5.receiver = self;
  v5.super_class = (Class)RTTConversation;
  v2 = [(RTTConversation *)&v5 init];
  if (v2)
  {
    id v3 = [MEMORY[0x263EFF980] array];
    [(RTTConversation *)v2 setUtterances:v3];
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = [v4 callIdentifier];
    id v6 = [(RTTConversation *)self callIdentifier];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToConversation:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  BOOL v18 = 0;
  BOOL v5 = 0;
  if ([(RTTConversation *)self isEqual:v4])
  {
    id v6 = [(RTTConversation *)self utterances];
    uint64_t v7 = [v6 count];
    uint64_t v8 = [v4 utterances];
    BOOL v5 = v7 == [v8 count];
  }
  BOOL v18 = v5;
  if (*((unsigned char *)v16 + 24))
  {
    id v9 = [(RTTConversation *)self utterances];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __41__RTTConversation_isEqualToConversation___block_invoke;
    v12[3] = &unk_264540C48;
    id v14 = &v15;
    id v13 = v4;
    [v9 enumerateObjectsUsingBlock:v12];

    BOOL v10 = *((unsigned char *)v16 + 24) != 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __41__RTTConversation_isEqualToConversation___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = [v7 utterances];
  BOOL v10 = [v9 objectAtIndex:a3];
  char v11 = [v8 isEqual:v10];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v11;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
}

- (id)otherContactPath
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__3;
  v34 = __Block_byref_object_dispose__3;
  id v35 = 0;
  id v3 = [(RTTConversation *)self callIdentifier];
  BOOL v4 = [v3 length] == 0;

  if (!v4)
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__3;
    v28 = __Block_byref_object_dispose__3;
    id v29 = 0;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __35__RTTConversation_otherContactPath__block_invoke;
    v23[3] = &unk_2645408B8;
    v23[4] = self;
    v23[5] = &v24;
    +[RTTTelephonyUtilities performCallCenterTask:v23];
    BOOL v5 = (void *)v25[5];
    if (v5)
    {
      id v6 = [v5 handle];
      uint64_t v7 = [v6 value];

      id v8 = [(id)v25[5] isoCountryCode];
      id v9 = [MEMORY[0x263F7E280] phoneNumberWithDigits:v7 countryCode:v8];
      uint64_t v10 = [v9 unformattedInternationalRepresentation];
      char v11 = (void *)v31[5];
      v31[5] = v10;

      if (!v31[5])
      {
        uint64_t v12 = [v9 formattedRepresentation];
        id v13 = (void *)v31[5];
        v31[5] = v12;

        id v14 = AXLogRTT();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          uint64_t v15 = v31[5];
          *(_DWORD *)buf = 138412290;
          uint64_t v37 = v15;
          _os_log_impl(&dword_21FEA9000, v14, OS_LOG_TYPE_INFO, "Using non-international phone number: %@", buf, 0xCu);
        }
      }
    }
    _Block_object_dispose(&v24, 8);
  }
  if (!v31[5])
  {
    id v16 = [(RTTConversation *)self utterances];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __35__RTTConversation_otherContactPath__block_invoke_17;
    v22[3] = &unk_264540C70;
    v22[4] = &v30;
    [v16 enumerateObjectsUsingBlock:v22];
  }
  if (_AXSInUnitTestMode())
  {
    uint64_t v17 = [(RTTConversation *)self call];
    if (v17)
    {
      BOOL v18 = v31[5] == 0;

      if (v18)
      {
        v19 = (void *)v31[5];
        v31[5] = @"Unknown";
      }
    }
  }
  id v20 = (id)v31[5];
  _Block_object_dispose(&v30, 8);

  return v20;
}

void __35__RTTConversation_otherContactPath__block_invoke(uint64_t a1)
{
  id v6 = +[RTTTelephonyUtilities sharedCallCenter];
  v2 = [*(id *)(a1 + 32) callIdentifier];
  uint64_t v3 = [v6 callWithCallUUID:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __35__RTTConversation_otherContactPath__block_invoke_17(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if (([v9 isMe] & 1) == 0)
  {
    uint64_t v6 = [v9 contactPath];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    *a4 = 1;
  }
}

- (id)mergeUtterancesIfPossible
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(RTTConversation *)self utterances];
  uint64_t v4 = [v3 lastObject];

  id v5 = v4;
  uint64_t v6 = [(RTTConversation *)self utterances];
  unint64_t v7 = [v6 count];

  id v8 = v5;
  if (v7 >= 2)
  {
    id v9 = [(RTTConversation *)self utterances];
    uint64_t v10 = [(RTTConversation *)self utterances];
    char v11 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v10, "count") - 2);

    uint64_t v12 = [v5 contactPath];
    id v13 = [v11 text];
    id v14 = [v5 text];
    uint64_t v15 = [v13 stringByAppendingString:v14];
    id v16 = +[RTTUtterance utteranceWithContactPath:v12 andText:v15];

    uint64_t v17 = AXLogRTT();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v26 = 138412290;
      id v27 = v16;
      _os_log_impl(&dword_21FEA9000, v17, OS_LOG_TYPE_INFO, "Testing complete %@", (uint8_t *)&v26, 0xCu);
    }

    int v18 = [v11 isMe];
    id v8 = v5;
    if (v18 == [v5 isMe])
    {
      id v8 = v5;
      if ([v11 isComplete])
      {
        id v8 = v5;
        if ([v16 isComplete])
        {
          v19 = AXLogRTT();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            LOWORD(v26) = 0;
            _os_log_impl(&dword_21FEA9000, v19, OS_LOG_TYPE_INFO, "Merging", (uint8_t *)&v26, 2u);
          }

          id v20 = [v11 text];
          v21 = [v5 text];
          v22 = [v20 stringByAppendingString:v21];
          [v11 updateText:v22];

          v23 = [(RTTConversation *)self utterances];
          [v23 removeObject:v5];

          id v8 = v11;
        }
      }
    }
  }
  uint64_t v24 = AXLogRTT();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    int v26 = 138412290;
    id v27 = v8;
    _os_log_impl(&dword_21FEA9000, v24, OS_LOG_TYPE_INFO, "Utterance merge result: %@", (uint8_t *)&v26, 0xCu);
  }

  return v8;
}

- (void)addUtterance:(id)a3
{
  id v14 = a3;
  uint64_t v4 = -[RTTConversation lastUtteranceForMe:isTranscription:](self, "lastUtteranceForMe:isTranscription:", 1, [v14 isTranscription]);
  id v5 = [v14 text];
  if ([v5 length] != 1)
  {

    goto LABEL_5;
  }
  uint64_t v6 = [v14 text];
  int v7 = [v6 characterAtIndex:0];

  if (v7 != 8)
  {
LABEL_5:
    if (![v4 isMe]
      || ([v4 isComplete] & 1) != 0
      || ([v4 hasTimedOut] & 1) != 0)
    {
      id v9 = [(RTTConversation *)self utterances];
      [v9 addObject:v14];
    }
    else
    {
      uint64_t v10 = [v4 text];
      char v11 = [v14 text];
      uint64_t v12 = [v10 stringByAppendingString:v11];
      [v4 updateText:v12];

      id v13 = [(RTTConversation *)self mergeUtterancesIfPossible];
    }
    goto LABEL_9;
  }
  id v8 = [(RTTConversation *)self processBackspaceForMe:1];
LABEL_9:
}

- (id)appendCharacter:(unsigned __int16)a3
{
  unsigned __int16 v7 = a3;
  uint64_t v4 = [NSString stringWithCharacters:&v7 length:1];
  id v5 = [(RTTConversation *)self appendStringFromOtherContactPath:v4];

  return v5;
}

- (id)appendStringFromOtherContactPath:(id)a3
{
  id v4 = a3;
  id v5 = [(RTTConversation *)self lastUtteranceForMe:0];
  uint64_t v6 = [v4 characterAtIndex:0];
  if (v6 == 8)
  {
    id v7 = [(RTTConversation *)self processBackspaceForMe:0];
  }
  else
  {
    if (!v5
      || (uint64_t v8 = v6, ([v5 isMe] & 1) != 0)
      || ([v5 hasTimedOut] & 1) != 0
      || [v5 isComplete]
      && ([MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet],
          id v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v9 characterIsMember:v8],
          v9,
          !v10))
    {
      id v13 = [(RTTConversation *)self otherContactPath];
      uint64_t v14 = +[RTTUtterance utteranceWithContactPath:v13 andText:v4];

      char v11 = [(RTTConversation *)self utterances];
      [v11 addObject:v14];
      id v5 = (void *)v14;
    }
    else
    {
      char v11 = [v5 text];
      uint64_t v12 = [v11 stringByAppendingString:v4];
      [v5 updateText:v12];
    }
    id v7 = v5;
    id v5 = v7;
  }

  return v7;
}

- (id)addTranscriptionFromOtherContactPath:(id)a3
{
  id v4 = a3;
  id v5 = [(RTTConversation *)self otherContactPath];
  uint64_t v6 = +[RTTUtterance utteranceWithContactPath:v5 andText:v4 isTranscription:1];

  id v7 = [(RTTConversation *)self utterances];
  [v7 addObject:v6];

  return v6;
}

- (id)updateTranscriptionFromOtherContactPath:(id)a3
{
  id v4 = a3;
  id v5 = [(RTTConversation *)self lastUtteranceForMe:0 isTranscription:1];
  [v5 updateText:v4];

  return v5;
}

- (id)processBackspaceForMe:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = -[RTTConversation lastUtteranceForMe:](self, "lastUtteranceForMe:");
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 text];
    uint64_t v8 = [v7 length];

    if (v8)
    {
      id v9 = [v6 text];
      uint64_t v10 = [v9 length] - 1;

      char v11 = [v6 text];
      unint64_t v12 = [v11 length];

      if (v12 < 2)
      {
        uint64_t v17 = 1;
      }
      else
      {
        id v13 = [v6 text];
        uint64_t v14 = [v6 text];
        uint64_t v15 = objc_msgSend(v13, "substringFromIndex:", objc_msgSend(v14, "length") - 2);

        if ([v15 isEqualToString:@"\r\n"])
        {
          id v16 = [v6 text];
          uint64_t v10 = [v16 length] - 2;

          uint64_t v17 = 2;
        }
        else
        {
          uint64_t v17 = 1;
        }
      }
      int v18 = [v6 text];
      v19 = objc_msgSend(v18, "stringByReplacingCharactersInRange:withString:", v10, v17, &stru_26D1B01C8);

      [v6 updateText:v19];
    }
  }
  id v20 = [(RTTConversation *)self utterances];
  if (![v20 count]) {
    goto LABEL_14;
  }
  v21 = [v6 text];
  uint64_t v22 = [v21 length];

  if (v6 && !v22)
  {
    v23 = [(RTTConversation *)self utterances];
    [v23 removeObject:v6];

    [(RTTConversation *)self lastUtteranceForMe:v3];
    uint64_t v6 = v20 = v6;
LABEL_14:
  }

  return v6;
}

- (id)lastUtteranceForMe:(BOOL)a3
{
  return [(RTTConversation *)self lastUtteranceForMe:a3 isTranscription:0];
}

- (id)lastUtteranceForMe:(BOOL)a3 isTranscription:(BOOL)a4
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__3;
  id v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  uint64_t v6 = [(RTTConversation *)self utterances];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__RTTConversation_lastUtteranceForMe_isTranscription___block_invoke;
  v9[3] = &unk_264540C98;
  BOOL v10 = a3;
  BOOL v11 = a4;
  v9[4] = &v12;
  [v6 enumerateObjectsWithOptions:2 usingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __54__RTTConversation_lastUtteranceForMe_isTranscription___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (*(unsigned __int8 *)(a1 + 40) == [v7 isMe]
    && *(unsigned __int8 *)(a1 + 41) == [v7 isTranscription])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (unint64_t)lastUtteranceIndexForMe:(BOOL)a3 isTranscription:(BOOL)a4
{
  uint64_t v6 = [(RTTConversation *)self utterances];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__RTTConversation_lastUtteranceIndexForMe_isTranscription___block_invoke;
  v9[3] = &__block_descriptor_34_e29_B32__0__RTTUtterance_8Q16_B24l;
  BOOL v10 = a3;
  BOOL v11 = a4;
  unint64_t v7 = [v6 indexOfObjectWithOptions:2 passingTest:v9];

  return v7;
}

uint64_t __59__RTTConversation_lastUtteranceIndexForMe_isTranscription___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (*(unsigned __int8 *)(a1 + 32) == [v6 isMe]
    && *(unsigned __int8 *)(a1 + 33) == [v6 isTranscription])
  {
    uint64_t v7 = 1;
    *a4 = 1;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)utteranceCountForMe:(BOOL)a3
{
  id v4 = [(RTTConversation *)self utterances];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__RTTConversation_utteranceCountForMe___block_invoke;
  v8[3] = &__block_descriptor_33_e29_B32__0__RTTUtterance_8Q16_B24l;
  BOOL v9 = a3;
  id v5 = [v4 indexesOfObjectsPassingTest:v8];

  unint64_t v6 = [v5 count];
  return v6;
}

uint64_t __39__RTTConversation_utteranceCountForMe___block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = *(unsigned char *)(a1 + 32) == 0;
  return [a2 isMe] ^ v2;
}

- (void)cleanup
{
  BOOL v3 = [(RTTConversation *)self utterances];
  id v4 = [v3 indexesOfObjectsPassingTest:&__block_literal_global_7];

  id v5 = [(RTTConversation *)self utterances];
  [v5 removeObjectsAtIndexes:v4];

  unint64_t v6 = [MEMORY[0x263F089C8] indexSet];
  uint64_t v7 = [(RTTConversation *)self utterances];
  uint64_t v8 = [v7 count];

  BOOL v9 = [(RTTConversation *)self utterances];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __26__RTTConversation_cleanup__block_invoke_2;
  v12[3] = &unk_264540D20;
  id v13 = v6;
  uint64_t v14 = v8;
  void v12[4] = self;
  id v10 = v6;
  [v9 enumerateObjectsUsingBlock:v12];

  BOOL v11 = [(RTTConversation *)self utterances];
  [v11 removeObjectsAtIndexes:v10];
}

BOOL __26__RTTConversation_cleanup__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = [a2 text];
  BOOL v3 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  id v4 = [v2 stringByTrimmingCharactersInSet:v3];
  BOOL v5 = [v4 length] == 0;

  return v5;
}

void __26__RTTConversation_cleanup__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  if ((unint64_t)(a3 + 1) >= *(void *)(a1 + 48))
  {
    unint64_t v6 = 0;
  }
  else
  {
    BOOL v5 = [*(id *)(a1 + 32) utterances];
    unint64_t v6 = [v5 objectAtIndex:a3 + 1];

    if (v6)
    {
      if (([v11 isComplete] & 1) == 0)
      {
        int v7 = [v11 isMe];
        if (v7 == [v6 isMe])
        {
          uint64_t v8 = [v11 text];
          BOOL v9 = [v6 text];
          id v10 = [v8 stringByAppendingString:v9];
          [v6 updateText:v10];

          [*(id *)(a1 + 40) addIndex:a3];
        }
      }
    }
  }
}

- (id)description
{
  BOOL v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)RTTConversation;
  id v4 = [(RTTConversation *)&v9 description];
  BOOL v5 = [(RTTConversation *)self callIdentifier];
  unint64_t v6 = [(RTTConversation *)self utterances];
  int v7 = [v3 stringWithFormat:@"%@ - %@ [%ld]", v4, v5, objc_msgSend(v6, "count")];

  return v7;
}

- (NSString)callIdentifier
{
  return self->_callIdentifier;
}

- (void)setCallIdentifier:(id)a3
{
}

- (NSMutableArray)utterances
{
  return self->_utterances;
}

- (void)setUtterances:(id)a3
{
}

- (TUCall)call
{
  return self->_call;
}

- (void)setCall:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_call, 0);
  objc_storeStrong((id *)&self->_utterances, 0);

  objc_storeStrong((id *)&self->_callIdentifier, 0);
}

+ (void)conversationWithCall:.cold.1()
{
}

@end