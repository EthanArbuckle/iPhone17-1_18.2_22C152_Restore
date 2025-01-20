@interface MFMessageCriterionConverter
+ (OS_os_log)log;
- (MFMessageCriterionConverterDelegate)delegate;
- (id)_defaultKeysForCriterionType:(int64_t)a3;
- (id)_messageCriterionForComparisonPredicate:(id)a3;
- (id)_messageCriterionForCompoundPredicate:(id)a3;
- (id)_orPredicateForAttributes:(id)a3 matchingValue:(id)a4 qualifier:(int64_t)a5;
- (id)_predicateForKey:(id)a3 value:(id)a4 qualifier:(int64_t)a5;
- (id)_predicateKeysForCriterion:(int64_t)a3;
- (id)_searchPredicateForCriterion:(id)a3;
- (id)_simplifiedCompoundPredicateOfType:(unint64_t)a3 forSubqueries:(id)a4;
- (id)messageCriterionFromPredicate:(id)a3;
- (id)messageCriterionFromPredicateFormatString:(id)a3;
- (id)predicateFromMessageCriterion:(id)a3;
- (int64_t)_criterionTypeForKey:(id)a3;
- (int64_t)_criterionTypeFromExpression:(id)a3;
- (int64_t)_defaultCriterionTypeForKey:(id)a3;
- (unint64_t)_proposedPredicateOperatorType:(unint64_t)a3 forKey:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation MFMessageCriterionConverter

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__MFMessageCriterionConverter_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_21 != -1) {
    dispatch_once(&log_onceToken_21, block);
  }
  v2 = (void *)log_log_21;
  return (OS_os_log *)v2;
}

void __34__MFMessageCriterionConverter_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_21;
  log_log_21 = (uint64_t)v1;
}

- (id)_simplifiedCompoundPredicateOfType:(unint64_t)a3 forSubqueries:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v16 = a4;
  id v5 = [MEMORY[0x1E4F1C978] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v16;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v7) {
    goto LABEL_10;
  }
  uint64_t v8 = *(void *)v18;
  while (2)
  {
    uint64_t v9 = 0;
    v10 = v5;
    do
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v12 = v10;
LABEL_14:

        goto LABEL_15;
      }
      id v12 = v11;
      if ([v12 compoundPredicateType] != a3)
      {

        goto LABEL_14;
      }
      v13 = [v12 subpredicates];
      id v5 = [v10 arrayByAddingObjectsFromArray:v13];

      ++v9;
      v10 = v5;
    }
    while (v7 != v9);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_10:

  if (!v5) {
LABEL_15:
  }
    id v5 = v6;
  if ([v5 count]) {
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F28BA0]) initWithType:a3 subpredicates:v5];
  }
  else {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)_proposedPredicateOperatorType:(unint64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(MFMessageCriterionConverter *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(MFMessageCriterionConverter *)self delegate];
    a3 = [v9 messageCriterionConverter:self willUsePredicateOperatorType:a3 forKey:v6];
  }
  return a3;
}

- (id)_predicateForKey:(id)a3 value:(id)a4 qualifier:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v8];
  v11 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v9];
  if ((unint64_t)a5 >= 9)
  {
    v13 = +[MFMessageCriterionConverter log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MFMessageCriterionConverter _predicateForKey:value:qualifier:](a5, v13);
    }

    uint64_t v12 = 99;
  }
  else
  {
    uint64_t v12 = qword_1A8AC6550[a5];
  }
  unint64_t v14 = [(MFMessageCriterionConverter *)self _proposedPredicateOperatorType:v12 forKey:v8];
  v15 = [MEMORY[0x1E4F28B98] predicateWithLeftExpression:v10 rightExpression:v11 modifier:0 type:v14 options:0];

  return v15;
}

- (id)_orPredicateForAttributes:(id)a3 matchingValue:(id)a4 qualifier:(int64_t)a5
{
  id v8 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__MFMessageCriterionConverter__orPredicateForAttributes_matchingValue_qualifier___block_invoke;
  v14[3] = &unk_1E5D40040;
  v14[4] = self;
  id v9 = v8;
  id v15 = v9;
  int64_t v16 = a5;
  v10 = objc_msgSend(a3, "ef_map:", v14);
  if ([v10 count] == 1)
  {
    uint64_t v11 = [v10 objectAtIndexedSubscript:0];
LABEL_5:
    uint64_t v12 = (void *)v11;
    goto LABEL_7;
  }
  if ((unint64_t)[v10 count] >= 2)
  {
    uint64_t v11 = [(MFMessageCriterionConverter *)self _simplifiedCompoundPredicateOfType:2 forSubqueries:v10];
    goto LABEL_5;
  }
  uint64_t v12 = 0;
LABEL_7:

  return v12;
}

id __81__MFMessageCriterionConverter__orPredicateForAttributes_matchingValue_qualifier___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) _predicateForKey:a2 value:*(void *)(a1 + 40) qualifier:*(void *)(a1 + 48)];
  return v2;
}

- (id)_defaultKeysForCriterionType:(int64_t)a3
{
  if (_defaultKeysForCriterionType__onceToken != -1) {
    dispatch_once(&_defaultKeysForCriterionType__onceToken, &__block_literal_global_47);
  }
  v4 = (void *)_defaultKeysForCriterionType__converterKeyDictionary;
  id v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

void __60__MFMessageCriterionConverter__defaultKeysForCriterionType___block_invoke()
{
  v55[26] = *MEMORY[0x1E4F143B8];
  v53 = @"Compound";
  v54[0] = &unk_1EFF51240;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
  v55[0] = v27;
  v54[1] = &unk_1EFF51258;
  v52 = @"AnyRecipient";
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
  v55[1] = v26;
  v54[2] = &unk_1EFF51270;
  uint64_t v51 = *MEMORY[0x1E4F5FF50];
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
  v55[2] = v25;
  v54[3] = &unk_1EFF51288;
  uint64_t v50 = *MEMORY[0x1E4F5FE08];
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
  v55[3] = v24;
  v54[4] = &unk_1EFF512A0;
  v49 = @"BccRecipient";
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
  v55[4] = v23;
  v54[5] = &unk_1EFF512B8;
  v48 = @"senderAddress.emailAddressValue.simpleAddress";
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  v55[5] = v22;
  v54[6] = &unk_1EFF512D0;
  v47 = @"Spotlight";
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  v55[6] = v21;
  v54[7] = &unk_1EFF512E8;
  v46 = @"body";
  long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
  v55[7] = v20;
  v54[8] = &unk_1EFF51300;
  v45 = @"Mailbox";
  long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
  v55[8] = v19;
  v54[9] = &unk_1EFF51318;
  v44 = @"DateReceived";
  long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
  v55[9] = v18;
  v54[10] = &unk_1EFF51330;
  v43 = @"DateSent";
  long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  v55[10] = v17;
  v54[11] = &unk_1EFF51348;
  v42 = @"DisplayDate";
  int64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
  v55[11] = v16;
  v54[12] = &unk_1EFF51360;
  v41 = @"subject.subjectWithoutPrefix";
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  v55[12] = v15;
  v54[13] = &unk_1EFF51378;
  v40 = @"VIP";
  unint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  v55[13] = v14;
  v54[14] = &unk_1EFF51390;
  v39 = @"IsRead";
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  v55[14] = v13;
  v54[15] = &unk_1EFF513A8;
  v38 = @"HasAttachments";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  v55[15] = v12;
  v54[16] = &unk_1EFF513C0;
  v37 = @"Flagged";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  v55[16] = v0;
  v54[17] = &unk_1EFF513D8;
  v36 = @"FlagColor";
  os_log_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  v55[17] = v1;
  v54[18] = &unk_1EFF513F0;
  v35 = @"readLaterDate";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  v55[18] = v2;
  v54[19] = &unk_1EFF51408;
  uint64_t v34 = *MEMORY[0x1E4F5FF00];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  v55[19] = v3;
  v54[20] = &unk_1EFF51420;
  v33 = @"sendLaterDate";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v55[20] = v4;
  v54[21] = &unk_1EFF51438;
  v32 = @"followUpStartDate";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  v55[21] = v5;
  v54[22] = &unk_1EFF51450;
  uint64_t v31 = *MEMORY[0x1E4F5FE60];
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v55[22] = v6;
  v54[23] = &unk_1EFF51468;
  v30 = @"followUpEndDate";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  v55[23] = v7;
  v54[24] = &unk_1EFF51480;
  v29 = @"senderBucket";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  v55[24] = v8;
  v54[25] = &unk_1EFF51498;
  v28 = @"category";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  v55[25] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:26];
  uint64_t v11 = (void *)_defaultKeysForCriterionType__converterKeyDictionary;
  _defaultKeysForCriterionType__converterKeyDictionary = v10;
}

- (id)_predicateKeysForCriterion:(int64_t)a3
{
  id v5 = [(MFMessageCriterionConverter *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 messageCriterionConverter:self predicateKeysForCriterionType:a3];
  }
  else {
  id v6 = [(MFMessageCriterionConverter *)self _defaultKeysForCriterionType:a3];
  }

  return v6;
}

- (id)_searchPredicateForCriterion:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 qualifier];
  uint64_t v7 = [v5 expression];
  id v8 = v5;
  uint64_t v9 = [v8 criterionType];
  uint64_t v10 = 0;
  switch(v9)
  {
    case 23:
      uint64_t v10 = 11;
      break;
    case 24:
    case 26:
    case 29:
    case 30:
    case 31:
    case 32:
    case 34:
    case 36:
    case 37:
    case 38:
    case 39:
    case 42:
    case 43:
    case 45:
    case 50:
      break;
    case 25:
      uint64_t v10 = 1;
      break;
    case 27:
      uint64_t v11 = [v8 expression];
      if ([v11 isEqualToString:@"MessageSenderIsVIP"])
      {
        uint64_t v10 = 16;
      }
      else if ([v11 isEqualToString:@"MessageIsRead"])
      {
        uint64_t v10 = 17;
      }
      else if ([v11 isEqualToString:@"MFMessageHasAttachments"])
      {
        uint64_t v10 = 18;
      }
      else
      {
        BOOL v12 = [v11 isEqualToString:@"MessageIsFlagged"] == 0;
        uint64_t v13 = 19;
LABEL_35:
        if (v12) {
          uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v10 = v13;
        }
      }
LABEL_38:

      break;
    case 28:
      uint64_t v10 = 20;
      break;
    case 33:
      uint64_t v10 = 9;
      break;
    case 35:
      uint64_t v10 = 8;
      break;
    case 40:
      uint64_t v10 = 3;
      break;
    case 41:
      uint64_t v10 = 4;
      break;
    case 44:
      uint64_t v10 = 36;
      break;
    case 46:
      uint64_t v10 = 29;
      break;
    case 47:
      uint64_t v10 = 32;
      break;
    case 48:
      uint64_t v10 = 33;
      break;
    case 49:
      uint64_t v10 = 31;
      break;
    case 51:
      uint64_t v10 = 25;
      break;
    default:
      switch(v9)
      {
        case 1:
          uint64_t v11 = [v8 criterionIdentifier];
          if ([(id)*MEMORY[0x1E4F60738] isEqual:v11])
          {
            uint64_t v10 = 15;
            goto LABEL_38;
          }
          if ([(id)*MEMORY[0x1E4F60740] isEqual:v11])
          {
            uint64_t v10 = 3;
            goto LABEL_38;
          }
          if ([(id)*MEMORY[0x1E4F60660] isEqual:v11])
          {
            uint64_t v10 = 4;
            goto LABEL_38;
          }
          BOOL v12 = [(id)*MEMORY[0x1E4F60650] isEqual:v11] == 0;
          uint64_t v13 = 5;
          goto LABEL_35;
        case 2:
          uint64_t v10 = 10;
          break;
        case 9:
          uint64_t v10 = 2;
          break;
        case 10:
          uint64_t v10 = 13;
          break;
        case 11:
          uint64_t v10 = 12;
          break;
        case 12:
          uint64_t v10 = 14;
          break;
        default:
          goto LABEL_39;
      }
      break;
  }
LABEL_39:

  unint64_t v14 = [(MFMessageCriterionConverter *)self _predicateKeysForCriterion:v10];
  uint64_t v15 = 3;
  switch(v10)
  {
    case 0:
      uint64_t v22 = +[MFMessageCriterionConverter log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[MFMessageCriterionConverter _searchPredicateForCriterion:]();
      }
      goto LABEL_56;
    case 1:
      v24 = [v8 criteria];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __60__MFMessageCriterionConverter__searchPredicateForCriterion___block_invoke;
      v30[3] = &unk_1E5D40068;
      v30[4] = self;
      long long v17 = objc_msgSend(v24, "ef_compactMap:", v30);

      if ([v8 allCriteriaMustBeSatisfied]) {
        uint64_t v25 = 1;
      }
      else {
        uint64_t v25 = 2;
      }
      uint64_t v18 = [(MFMessageCriterionConverter *)self _simplifiedCompoundPredicateOfType:v25 forSubqueries:v17];
      goto LABEL_42;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 15:
    case 29:
    case 30:
    case 32:
    case 33:
    case 34:
    case 35:
      uint64_t v16 = [(MFMessageCriterionConverter *)self _orPredicateForAttributes:v14 matchingValue:v7 qualifier:v6];
      goto LABEL_46;
    case 12:
    case 13:
    case 14:
    case 31:
      long long v17 = [v8 dateFromExpression];
      uint64_t v18 = [(MFMessageCriterionConverter *)self _orPredicateForAttributes:v14 matchingValue:v17 qualifier:v6];
LABEL_42:
      long long v19 = (void *)v18;

      if (!v19) {
        goto LABEL_49;
      }
      goto LABEL_47;
    case 16:
      goto LABEL_45;
    case 17:
      if (v6 == 3)
      {
        uint64_t v26 = MEMORY[0x1E4F1CC38];
      }
      else
      {
        if (v6 != 7)
        {
          v29 = +[MFMessageCriterionConverter log];
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            -[MFMessageCriterionConverter _searchPredicateForCriterion:](v6, v29);
          }

          long long v19 = 0;
          goto LABEL_49;
        }
        uint64_t v26 = MEMORY[0x1E4F1CC28];
      }
      uint64_t v6 = 3;
      uint64_t v16 = [(MFMessageCriterionConverter *)self _orPredicateForAttributes:v14 matchingValue:v26 qualifier:3];
LABEL_46:
      long long v19 = (void *)v16;
      if (v16)
      {
LABEL_47:
        if (v6 == 4)
        {
          uint64_t v20 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v19];

          long long v19 = (void *)v20;
        }
      }
LABEL_49:
      if (v19)
      {
        v21 = +[MFMessageCriterionConverter log];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          -[MFMessageCriterionConverter _searchPredicateForCriterion:]();
        }
      }
LABEL_58:

      return v19;
    case 18:
    case 19:
    case 20:
    case 22:
      uint64_t v15 = v6;
LABEL_45:
      uint64_t v16 = [(MFMessageCriterionConverter *)self _orPredicateForAttributes:v14 matchingValue:MEMORY[0x1E4F1CC38] qualifier:v15];
      goto LABEL_46;
    case 21:
    case 23:
    case 24:
    case 26:
    case 27:
    case 28:
      goto LABEL_54;
    case 25:
      if (v6 == 8)
      {
        v27 = [v7 componentsSeparatedByString:@", "];
        uint64_t v28 = objc_msgSend(v27, "ef_map:", &__block_literal_global_136_0);

        uint64_t v7 = (void *)v28;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v7, "integerValue"));
        uint64_t v7 = v27 = v7;
      }

      uint64_t v16 = [(MFMessageCriterionConverter *)self _orPredicateForAttributes:v14 matchingValue:v7 qualifier:v6];
      goto LABEL_46;
    case 36:
      uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2 object:self file:@"MFMessageCriterionConverter.m" lineNumber:514 description:@"Criterion code is no longer supported"];
      goto LABEL_56;
    default:
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_54:
        uint64_t v22 = +[MFMessageCriterionConverter log];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          -[MFMessageCriterionConverter _searchPredicateForCriterion:].cold.4();
        }
LABEL_56:
      }
      long long v19 = 0;
      goto LABEL_58;
  }
}

id __60__MFMessageCriterionConverter__searchPredicateForCriterion___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) _searchPredicateForCriterion:a2];
  return v2;
}

id __60__MFMessageCriterionConverter__searchPredicateForCriterion___block_invoke_133(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v2, "integerValue"));

  return v3;
}

- (id)predicateFromMessageCriterion:(id)a3
{
  v4 = [a3 criterionForSQL];
  id v5 = [(MFMessageCriterionConverter *)self _searchPredicateForCriterion:v4];

  return v5;
}

- (int64_t)_defaultCriterionTypeForKey:(id)a3
{
  id v3 = a3;
  if (_defaultCriterionTypeForKey__onceToken != -1) {
    dispatch_once(&_defaultCriterionTypeForKey__onceToken, &__block_literal_global_145);
  }
  v4 = [(id)_defaultCriterionTypeForKey__converterKeyDictionary objectForKeyedSubscript:v3];
  int64_t v5 = [v4 integerValue];

  return v5;
}

void __59__MFMessageCriterionConverter__defaultCriterionTypeForKey___block_invoke()
{
  v4[25] = *MEMORY[0x1E4F143B8];
  v3[0] = @"Compound";
  v3[1] = @"AnyRecipient";
  v4[0] = &unk_1EFF51240;
  v4[1] = &unk_1EFF51258;
  uint64_t v0 = *MEMORY[0x1E4F5FE08];
  v3[2] = *MEMORY[0x1E4F5FF50];
  v3[3] = v0;
  v4[2] = &unk_1EFF51270;
  v4[3] = &unk_1EFF51288;
  v3[4] = @"BccRecipient";
  v3[5] = @"senderAddress.emailAddressValue.simpleAddress";
  v4[4] = &unk_1EFF512A0;
  v4[5] = &unk_1EFF512B8;
  v3[6] = @"Spotlight";
  v3[7] = @"body";
  v4[6] = &unk_1EFF512D0;
  v4[7] = &unk_1EFF512E8;
  v3[8] = @"Mailbox";
  v3[9] = @"DateReceived";
  v4[8] = &unk_1EFF51300;
  v4[9] = &unk_1EFF51318;
  v3[10] = @"DateSent";
  v3[11] = @"DisplayDate";
  v4[10] = &unk_1EFF51330;
  v4[11] = &unk_1EFF51348;
  v3[12] = @"subject.subjectWithoutPrefix";
  v3[13] = @"VIP";
  v4[12] = &unk_1EFF51360;
  v4[13] = &unk_1EFF51378;
  v3[14] = @"IsRead";
  v3[15] = @"HasAttachments";
  v4[14] = &unk_1EFF51390;
  v4[15] = &unk_1EFF513A8;
  v3[16] = @"Flagged";
  v3[17] = @"FlagColor";
  v4[16] = &unk_1EFF513C0;
  v4[17] = &unk_1EFF513D8;
  v3[18] = @"readLaterDate";
  v3[19] = @"sendLaterDate";
  v4[18] = &unk_1EFF513F0;
  v4[19] = &unk_1EFF51420;
  v3[20] = @"followUpStartDate";
  v3[21] = @"followUpEndDate";
  v4[20] = &unk_1EFF51438;
  v4[21] = &unk_1EFF51468;
  v3[22] = @"unsubscribeType";
  v3[23] = @"senderBucket";
  v4[22] = &unk_1EFF514B0;
  v4[23] = &unk_1EFF51480;
  v3[24] = @"category";
  v4[24] = &unk_1EFF51498;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:25];
  id v2 = (void *)_defaultCriterionTypeForKey__converterKeyDictionary;
  _defaultCriterionTypeForKey__converterKeyDictionary = v1;
}

- (int64_t)_criterionTypeForKey:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(MFMessageCriterionConverter *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (int64_t v6 = [v5 messageCriterionConverter:self criterionTypeForKey:v4]) == 0)
  {
    int64_t v6 = [(MFMessageCriterionConverter *)self _defaultCriterionTypeForKey:v4];
  }

  return v6;
}

- (int64_t)_criterionTypeFromExpression:(id)a3
{
  id v4 = a3;
  if (![v4 expressionType])
  {
    uint64_t v5 = [v4 constantValue];
    goto LABEL_5;
  }
  if ([v4 expressionType] == 3)
  {
    uint64_t v5 = [v4 keyPath];
LABEL_5:
    int64_t v6 = (void *)v5;
    goto LABEL_7;
  }
  int64_t v6 = 0;
LABEL_7:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v7 = [(MFMessageCriterionConverter *)self _criterionTypeForKey:v6];
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

- (id)_messageCriterionForComparisonPredicate:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 predicateOperatorType];
  switch(v5)
  {
    case 0:
      uint64_t v7 = 5;
      uint64_t v8 = 5;
      break;
    case 1:
    case 3:
    case 6:
    case 7:
    case 11:
      goto LABEL_2;
    case 2:
      uint64_t v7 = 6;
      uint64_t v8 = 6;
      break;
    case 4:
      uint64_t v8 = 3;
      uint64_t v7 = 7;
      break;
    case 5:
      uint64_t v8 = 7;
      uint64_t v7 = 3;
      break;
    case 8:
      uint64_t v7 = 1;
      uint64_t v8 = 1;
      break;
    case 9:
      uint64_t v7 = 2;
      uint64_t v8 = 2;
      break;
    case 10:
      uint64_t v7 = 8;
      uint64_t v8 = 8;
      break;
    default:
      if (v5 == 100)
      {
LABEL_2:
        int64_t v6 = +[MFMessageCriterionConverter log];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          -[MFMessageCriterionConverter _messageCriterionForComparisonPredicate:].cold.6();
        }
      }
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      break;
  }
  uint64_t v9 = [v4 leftExpression];
  int64_t v10 = [(MFMessageCriterionConverter *)self _criterionTypeFromExpression:v9];

  uint64_t v11 = [v4 rightExpression];
  if (![v11 expressionType])
  {
    unint64_t v14 = [v11 constantValue];
    uint64_t v15 = [(MFMessageCriterionConverter *)self delegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      long long v17 = [(MFMessageCriterionConverter *)self delegate];
      BOOL v12 = [v17 messageCriterionConverter:self expressionForConstantValue:v14 withCriterionType:v10];

      if (v12) {
        goto LABEL_17;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = v14;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = v14;
        BOOL v12 = 0;
        goto LABEL_18;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v52 = v14;
          BOOL v12 = 0;
          uint64_t v13 = 0;
          goto LABEL_19;
        }
        goto LABEL_16;
      }
      uint64_t v18 = MFCriterionExpressionForDate(v14);
    }
    BOOL v12 = v18;
LABEL_17:
    uint64_t v13 = 0;
LABEL_18:
    v52 = 0;
LABEL_19:

    goto LABEL_20;
  }
  if ([v11 expressionType] != 3)
  {
    unint64_t v14 = +[MFMessageCriterionConverter log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MFMessageCriterionConverter _messageCriterionForComparisonPredicate:].cold.5((uint64_t)v54, [v11 expressionType], v14);
    }
LABEL_16:
    BOOL v12 = 0;
    goto LABEL_17;
  }
  BOOL v12 = [v11 keyPath];
  uint64_t v13 = 0;
  v52 = 0;
LABEL_20:
  id v19 = 0;
  uint64_t v20 = 9;
  switch(v10)
  {
    case 0:
      p_super = MFLogGeneral();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        v30 = objc_msgSend(v4, "ef_publicDescription");
        [(MFMessageCriterionConverter *)v30 _messageCriterionForComparisonPredicate:p_super];
      }
      goto LABEL_114;
    case 1:
      p_super = +[MFMessageCriterionConverter log];
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        -[MFMessageCriterionConverter _messageCriterionForComparisonPredicate:](p_super, v31, v32, v33, v34, v35, v36, v37);
      }
      goto LABEL_114;
    case 2:
      goto LABEL_102;
    case 3:
      id v19 = 0;
      uint64_t v20 = 40;
      goto LABEL_102;
    case 4:
      id v19 = 0;
      uint64_t v20 = 41;
      goto LABEL_102;
    case 5:
      v38 = (id *)MEMORY[0x1E4F60650];
      goto LABEL_87;
    case 6:
      uint64_t v29 = +[MFMessageCriterion toMeCriterion];
      goto LABEL_106;
    case 7:
      uint64_t v29 = +[MFMessageCriterion ccMeCriterion];
      goto LABEL_106;
    case 8:
      id v19 = 0;
      uint64_t v20 = 35;
      goto LABEL_102;
    case 9:
      id v19 = 0;
      uint64_t v20 = 33;
      goto LABEL_102;
    case 10:
      id v19 = 0;
      uint64_t v20 = 2;
      goto LABEL_102;
    case 11:
      id v19 = 0;
      uint64_t v20 = 23;
      goto LABEL_102;
    case 12:
      id v19 = 0;
      uint64_t v20 = 11;
      goto LABEL_102;
    case 13:
      id v19 = 0;
      uint64_t v20 = 10;
      goto LABEL_102;
    case 14:
      id v19 = 0;
      uint64_t v20 = 12;
      goto LABEL_102;
    case 15:
      v38 = (id *)MEMORY[0x1E4F60738];
      goto LABEL_87;
    case 16:
      uint64_t v24 = [v13 BOOLValue];
      if (v8 == 3) {
        goto LABEL_110;
      }
      if (v8 != 7)
      {
        p_super = +[MFMessageCriterionConverter log];
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
          -[MFMessageCriterionConverter _messageCriterionForComparisonPredicate:](p_super, v44, v45, v46, v47, v48, v49, v50);
        }
        goto LABEL_114;
      }
      uint64_t v24 = v24 ^ 1;
LABEL_110:
      p_super = +[MFMessageCriterion senderIsVIPCriterion:v24];
LABEL_111:
      id v19 = 0;
      goto LABEL_116;
    case 17:
    case 19:
      v21 = MFMessageIsFlagged;
      if (v10 == 17) {
        v21 = MessageIsRead;
      }
      uint64_t v22 = *v21;

      if (v13)
      {
        id v19 = 0;
        if (![v13 integerValue]) {
          uint64_t v8 = v7;
        }
      }
      else
      {
        id v19 = 0;
      }
      uint64_t v20 = 27;
      goto LABEL_101;
    case 18:
      uint64_t v29 = +[MFMessageCriterion hasAttachmentsCriterion];
      goto LABEL_106;
    case 20:
      uint64_t v29 = +[MFMessageCriterion criterionForFlagColor:[v13 integerValue]];
      goto LABEL_106;
    case 21:
      if (!v13) {
        goto LABEL_107;
      }
      uint64_t v29 = +[MFMessageCriterion criterionForConversationID:[v13 longLongValue]];
      goto LABEL_106;
    case 22:
      if (!v13) {
        goto LABEL_107;
      }
      uint64_t v29 = +[MFMessageCriterion messageIsDeletedCriterion:[v13 BOOLValue]];
      goto LABEL_106;
    case 23:
      id v19 = 0;
      if ([v4 predicateOperatorType] == 10) {
        uint64_t v8 = 3;
      }
      uint64_t v20 = 24;
      if (!v12 && v13)
      {
        [v13 stringValue];
        BOOL v12 = v20 = 24;
        id v19 = 0;
      }
      goto LABEL_102;
    case 24:
      if ([v13 integerValue] == 2)
      {
        uint64_t v29 = +[MFMessageCriterion threadNotifyMessageCriterion];
LABEL_106:
        p_super = v29;
        id v19 = 0;
        goto LABEL_116;
      }
      if ([v13 integerValue] == 1)
      {
        uint64_t v29 = +[MFMessageCriterion threadMuteMessageCriterion];
        goto LABEL_106;
      }
LABEL_107:
      id v19 = 0;
      p_super = 0;
LABEL_116:

      return p_super;
    case 25:
      if (v52)
      {
        v39 = [v52 ef_mapSelector:sel_stringValue];
        uint64_t v40 = [v39 componentsJoinedByString:@", "];

        id v19 = 0;
        uint64_t v20 = 51;
LABEL_95:
        BOOL v12 = (void *)v40;
      }
      else if (v13)
      {
        uint64_t v22 = [v13 stringValue];

        id v19 = 0;
        uint64_t v20 = 51;
LABEL_101:
        BOOL v12 = v22;
      }
      else
      {
        id v19 = 0;
        uint64_t v20 = 51;
      }
LABEL_102:
      v43 = [[MFMessageCriterion alloc] initWithType:v20 qualifier:v8 expression:v12];
      p_super = &v43->super;
      if (v19) {
        [(MFMessageCriterion *)v43 setCriterionIdentifier:v19];
      }
      goto LABEL_116;
    case 26:
      v38 = (id *)MEMORY[0x1E4F606F0];
LABEL_87:
      id v19 = *v38;
      uint64_t v20 = 1;
      goto LABEL_102;
    case 27:
      p_super = objc_msgSend(objc_alloc(MEMORY[0x1E4F607C0]), "initWithHash:", -[NSObject longLongValue](v13, "longLongValue"));
      uint64_t v25 = [MFMessageCriterion alloc];
      uint64_t v26 = [p_super stringValue];
      uint64_t v27 = [(MFMessageCriterion *)v25 initWithType:38 qualifier:v8 expression:v26];

      goto LABEL_115;
    case 28:
      v41 = [(MFMessageCriterionConverter *)self delegate];
      p_super = [v41 mailAccountForIdentifier:v12];

      uint64_t v28 = +[MFMessageCriterion criterionForAccount:p_super];
      goto LABEL_89;
    case 29:
      id v19 = 0;
      uint64_t v20 = 46;
      goto LABEL_102;
    case 30:
      if ([v13 BOOLValue]) {
        uint64_t v8 = 5;
      }
      else {
        uint64_t v8 = 6;
      }

      v42 = [MEMORY[0x1E4F1C9C8] now];
      uint64_t v40 = MFCriterionExpressionForDate(v42);

      uint64_t v13 = 0;
      id v19 = 0;
      uint64_t v20 = 46;
      goto LABEL_95;
    case 31:
      id v19 = 0;
      uint64_t v20 = 49;
      goto LABEL_102;
    case 32:
      id v19 = 0;
      uint64_t v20 = 47;
      goto LABEL_102;
    case 33:
      id v19 = 0;
      uint64_t v20 = 48;
      goto LABEL_102;
    case 34:
      p_super = +[MFMessageCriterion followUpMessageCriterion];
      if ([v13 BOOLValue]) {
        goto LABEL_111;
      }
      uint64_t v28 = +[MFMessageCriterion notCriterionWithCriterion:p_super];
LABEL_89:
      uint64_t v27 = v28;
      goto LABEL_115;
    case 35:
      uint64_t v29 = +[MFMessageCriterion messageCriterionForUnsubscribeTypeNotMatching:[v13 integerValue]];
      goto LABEL_106;
    case 36:
      uint64_t v29 = +[MFMessageCriterion criterionForCategoryType:[v13 unsignedLongValue]];
      goto LABEL_106;
    default:
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        p_super = MFLogGeneral();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG)) {
          -[MFMessageCriterionConverter _messageCriterionForComparisonPredicate:].cold.4();
        }
LABEL_114:
        uint64_t v27 = 0;
LABEL_115:

        id v19 = 0;
        p_super = v27;
      }
      else
      {
        p_super = 0;
      }
      goto LABEL_116;
  }
}

- (id)_messageCriterionForCompoundPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 subpredicates];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __69__MFMessageCriterionConverter__messageCriterionForCompoundPredicate___block_invoke;
  v21[3] = &unk_1E5D400B0;
  v21[4] = self;
  int64_t v6 = objc_msgSend(v5, "ef_compactMap:", v21);

  uint64_t v7 = [v4 compoundPredicateType];
  if (v7)
  {
    if (v7 == 1)
    {
      uint64_t v8 = +[MFMessageCriterion andCompoundCriterionWithCriteria:v6];
      goto LABEL_10;
    }
    if (v7 == 2)
    {
      uint64_t v8 = +[MFMessageCriterion orCompoundCriterionWithCriteria:v6];
LABEL_10:
      uint64_t v9 = v8;
      goto LABEL_17;
    }
    uint64_t v9 = 0;
  }
  else
  {
    if ((unint64_t)[v6 count] > 1)
    {
      uint64_t v9 = MFLogGeneral();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[MFMessageCriterionConverter _messageCriterionForCompoundPredicate:](v9, v12, v13, v14, v15, v16, v17, v18);
      }
      uint64_t v19 = 0;
    }
    else
    {
      uint64_t v9 = [v6 firstObject];
      if (![v9 qualifier])
      {
        int64_t v10 = [v9 criteria];
        unint64_t v11 = [v10 count];

        if (v11 <= 1)
        {
          [v9 setQualifier:4];
          goto LABEL_17;
        }
      }
      uint64_t v19 = +[MFMessageCriterion notCriterionWithCriterion:v9];
    }

    uint64_t v9 = v19;
  }
LABEL_17:

  return v9;
}

id __69__MFMessageCriterionConverter__messageCriterionForCompoundPredicate___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) messageCriterionFromPredicate:a2];
  return v2;
}

- (id)messageCriterionFromPredicate:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "ef_matchesEverything"))
  {
    uint64_t v5 = +[MFMessageCriterion matchEverythingCriterion];
LABEL_9:
    int64_t v6 = (void *)v5;
    goto LABEL_10;
  }
  if (objc_msgSend(v4, "ef_matchesNothing"))
  {
    uint64_t v5 = +[MFMessageCriterion matchNothingCriterion];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(MFMessageCriterionConverter *)self _messageCriterionForCompoundPredicate:v4];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(MFMessageCriterionConverter *)self _messageCriterionForComparisonPredicate:v4];
    goto LABEL_9;
  }
  uint64_t v8 = MFLogGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[MFMessageCriterionConverter messageCriterionFromPredicate:]();
  }

  int64_t v6 = 0;
LABEL_10:

  return v6;
}

- (id)messageCriterionFromPredicateFormatString:(id)a3
{
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:a3];
  if (v4)
  {
    uint64_t v5 = [(MFMessageCriterionConverter *)self messageCriterionFromPredicate:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (MFMessageCriterionConverterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MFMessageCriterionConverterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_predicateForKey:(int)a1 value:(NSObject *)a2 qualifier:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "Received unhandled MessageRuleQualifier value:%d - assuming contains", (uint8_t *)v2, 8u);
}

- (void)_searchPredicateForCriterion:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1A7EFF000, v1, OS_LOG_TYPE_DEBUG, "Returning criterion:%@ result:%@", v2, 0x16u);
}

- (void)_searchPredicateForCriterion:(int)a1 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "Received unexpected qualifier %d for MessageIsRead criterion.", (uint8_t *)v2, 8u);
}

- (void)_searchPredicateForCriterion:.cold.3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, v0, v1, "Received unknown criterion type for criterion: %@", v2);
}

- (void)_searchPredicateForCriterion:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_1A7EFF000, v0, OS_LOG_TYPE_DEBUG, "Attempted to handle unsupported criterion %@", v1, 0xCu);
}

- (void)_messageCriterionForComparisonPredicate:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_messageCriterionForComparisonPredicate:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_messageCriterionForComparisonPredicate:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, a3, (uint64_t)a3, "Received unknown criterion type for predicate: %@", (uint8_t *)a2);
}

- (void)_messageCriterionForComparisonPredicate:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_1A7EFF000, v0, OS_LOG_TYPE_DEBUG, "Attempted to handle unsupported predicate %@", v1, 0xCu);
}

- (void)_messageCriterionForComparisonPredicate:(NSObject *)a3 .cold.5(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, a3, (uint64_t)a3, "Unsupported expressionType:%lu", (uint8_t *)a1);
}

- (void)_messageCriterionForComparisonPredicate:.cold.6()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, v0, v1, "Received unhandled NSPredicateOperatorType value:%lu - assuming contains", v2);
}

- (void)_messageCriterionForCompoundPredicate:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)messageCriterionFromPredicate:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, v0, v1, "Got unexpected Predicate: %@", v2);
}

@end