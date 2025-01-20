@interface PGSurveyQuestion
- (BOOL)_additionalInfosAreEqualForOtherQuestionAdditionalInfo:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToPersistedQuestion:(id)a3;
- (BOOL)isEquivalentToQuestion:(id)a3;
- (NSDictionary)additionalInfo;
- (NSString)entityIdentifier;
- (double)localFactoryScore;
- (double)score;
- (id)_additionalInfoWithAnswerReasonRemovedForQuestionType:(unsigned __int16)a3 additionalInfo:(id)a4;
- (unint64_t)hash;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
- (void)persistWithCreationDate:(id)a3 questionVersion:(signed __int16)a4;
- (void)setScore:(double)a3;
@end

@implementation PGSurveyQuestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->entityIdentifier, 0);
  objc_storeStrong((id *)&self->additionalInfo, 0);
}

- (unsigned)state
{
  return self->state;
}

- (void)setScore:(double)a3
{
  self->score = a3;
}

- (double)score
{
  return self->score;
}

- (double)localFactoryScore
{
  return self->localFactoryScore;
}

- (NSString)entityIdentifier
{
  return self->entityIdentifier;
}

- (NSDictionary)additionalInfo
{
  return self->additionalInfo;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PGSurveyQuestion *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PGSurveyQuestion *)self isEquivalentToQuestion:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  v2 = [(PGSurveyQuestion *)self entityIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEquivalentToQuestion:(id)a3
{
  id v5 = a3;
  v6 = [v5 entityIdentifier];
  v7 = [(PGSurveyQuestion *)self entityIdentifier];
  if ([v6 isEqualToString:v7])
  {
    int v8 = [v5 entityType];
    if (v8 == [(PGSurveyQuestion *)self entityType])
    {
      int v9 = [v5 type];
      if (v9 == [(PGSurveyQuestion *)self type])
      {
        v10 = [v5 additionalInfo];
        uint64_t v11 = [v10 count];
        if (v11
          || ([(PGSurveyQuestion *)self additionalInfo],
              unint64_t v3 = objc_claimAutoreleasedReturnValue(),
              [v3 count]))
        {
          v12 = [v5 additionalInfo];
          v13 = [(PGSurveyQuestion *)self additionalInfo];
          char v14 = [v12 isEqualToDictionary:v13];

          if (v11)
          {
LABEL_12:

            goto LABEL_9;
          }
        }
        else
        {
          char v14 = 1;
        }

        goto LABEL_12;
      }
    }
  }
  char v14 = 0;
LABEL_9:

  return v14;
}

- (id)_additionalInfoWithAnswerReasonRemovedForQuestionType:(unsigned __int16)a3 additionalInfo:(id)a4
{
  int v4 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v7 = [v5 allKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    uint64_t v11 = *MEMORY[0x1E4F8E920];
    uint64_t v20 = *MEMORY[0x1E4F8E950];
    uint64_t v18 = *MEMORY[0x1E4F8E948];
    uint64_t v19 = *MEMORY[0x1E4F8E960];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (([v13 isEqualToString:v11] & 1) == 0)
        {
          if (v4 != 25)
          {
            if (v4 == 14)
            {
              char v14 = v13;
              uint64_t v15 = v19;
LABEL_12:
              if ([v14 isEqualToString:v15]) {
                continue;
              }
            }
            v16 = [v5 objectForKeyedSubscript:v13];
            [v6 setObject:v16 forKeyedSubscript:v13];

            continue;
          }
          if ([v13 isEqualToString:v20]) {
            continue;
          }
          char v14 = v13;
          uint64_t v15 = v18;
          goto LABEL_12;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  return v6;
}

- (BOOL)_additionalInfosAreEqualForOtherQuestionAdditionalInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PGSurveyQuestion *)self type];
  id v6 = [(PGSurveyQuestion *)self additionalInfo];
  v7 = [(PGSurveyQuestion *)self _additionalInfoWithAnswerReasonRemovedForQuestionType:v5 additionalInfo:v6];

  uint64_t v8 = [(PGSurveyQuestion *)self _additionalInfoWithAnswerReasonRemovedForQuestionType:[(PGSurveyQuestion *)self type] additionalInfo:v4];

  LOBYTE(v4) = [v7 isEqualToDictionary:v8];
  return (char)v4;
}

- (BOOL)isEquivalentToPersistedQuestion:(id)a3
{
  id v5 = a3;
  id v6 = [v5 entityIdentifier];
  v7 = [(PGSurveyQuestion *)self entityIdentifier];
  if ([v6 isEqualToString:v7])
  {
    int v8 = [v5 entityType];
    if (v8 == [(PGSurveyQuestion *)self entityType])
    {
      int v9 = [v5 type];
      if (v9 == [(PGSurveyQuestion *)self type])
      {
        uint64_t v10 = [v5 additionalInfo];
        uint64_t v11 = [v10 count];
        if (v11
          || ([(PGSurveyQuestion *)self additionalInfo],
              unint64_t v3 = objc_claimAutoreleasedReturnValue(),
              [v3 count]))
        {
          v12 = [v5 additionalInfo];
          BOOL v13 = [(PGSurveyQuestion *)self _additionalInfosAreEqualForOtherQuestionAdditionalInfo:v12];

          if (v11)
          {
LABEL_12:

            goto LABEL_9;
          }
        }
        else
        {
          BOOL v13 = 1;
        }

        goto LABEL_12;
      }
    }
  }
  BOOL v13 = 0;
LABEL_9:

  return v13;
}

- (unsigned)entityType
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA00]);
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = NSStringFromSelector(a2);
  int v9 = [v5 stringWithFormat:@"%@ must implement %@", v7, v8];
  uint64_t v10 = (void *)[v3 initWithName:v4 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (unsigned)displayType
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA00]);
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = NSStringFromSelector(a2);
  int v9 = [v5 stringWithFormat:@"%@ must implement %@", v7, v8];
  uint64_t v10 = (void *)[v3 initWithName:v4 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (unsigned)type
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA00]);
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = NSStringFromSelector(a2);
  int v9 = [v5 stringWithFormat:@"%@ must implement %@", v7, v8];
  uint64_t v10 = (void *)[v3 initWithName:v4 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)persistWithCreationDate:(id)a3 questionVersion:(signed __int16)a4
{
  id v17 = a3;
  id v6 = (void *)MEMORY[0x1E4F39258];
  v7 = [(PGSurveyQuestion *)self entityIdentifier];
  uint64_t v8 = [(PGSurveyQuestion *)self type];
  uint64_t v9 = [(PGSurveyQuestion *)self state];
  uint64_t v10 = [(PGSurveyQuestion *)self entityType];
  uint64_t v11 = [(PGSurveyQuestion *)self displayType];
  [(PGSurveyQuestion *)self score];
  double v13 = v12;
  char v14 = [(PGSurveyQuestion *)self additionalInfo];
  LOWORD(v16) = a4;
  id v15 = (id)[v6 creationRequestForQuestionWithEntityIdentifier:v7 type:v8 state:v9 entityType:v10 displayType:v11 score:v14 additionalInfo:v13 creationDate:v17 questionVersion:v16];
}

@end