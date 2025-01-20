@interface PGSurveyResult
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToPersistedQuestion:(id)a3;
- (BOOL)isEquivalentToSurveyResult:(id)a3;
- (NSDate)creationDate;
- (NSDictionary)additionalInfo;
- (NSString)entityIdentifier;
- (NSString)momentIdentifier;
- (double)localFactoryScore;
- (double)score;
- (signed)questionVersion;
- (unint64_t)hash;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
- (void)setAdditionalInfo:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDisplayType:(unsigned __int16)a3;
- (void)setEntityIdentifier:(id)a3;
- (void)setEntityType:(unsigned __int16)a3;
- (void)setMomentIdentifier:(id)a3;
- (void)setQuestionVersion:(signed __int16)a3;
- (void)setScore:(double)a3;
- (void)setState:(unsigned __int16)a3;
- (void)setType:(unsigned __int16)a3;
@end

@implementation PGSurveyResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->creationDate, 0);
  objc_storeStrong((id *)&self->additionalInfo, 0);
  objc_storeStrong((id *)&self->momentIdentifier, 0);
  objc_storeStrong((id *)&self->entityIdentifier, 0);
}

- (void)setQuestionVersion:(signed __int16)a3
{
  self->questionVersion = a3;
}

- (signed)questionVersion
{
  return self->questionVersion;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)creationDate
{
  return self->creationDate;
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

- (void)setDisplayType:(unsigned __int16)a3
{
  self->displayType = a3;
}

- (unsigned)displayType
{
  return self->displayType;
}

- (void)setAdditionalInfo:(id)a3
{
}

- (NSDictionary)additionalInfo
{
  return self->additionalInfo;
}

- (void)setEntityType:(unsigned __int16)a3
{
  self->entityType = a3;
}

- (unsigned)entityType
{
  return self->entityType;
}

- (void)setState:(unsigned __int16)a3
{
  self->state = a3;
}

- (unsigned)state
{
  return self->state;
}

- (void)setType:(unsigned __int16)a3
{
  self->type = a3;
}

- (unsigned)type
{
  return self->type;
}

- (void)setMomentIdentifier:(id)a3
{
}

- (NSString)momentIdentifier
{
  return self->momentIdentifier;
}

- (void)setEntityIdentifier:(id)a3
{
}

- (NSString)entityIdentifier
{
  return self->entityIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PGSurveyResult *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PGSurveyResult *)self isEquivalentToSurveyResult:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  v2 = [(PGSurveyResult *)self entityIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEquivalentToSurveyResult:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 entityIdentifier];
  v6 = [(PGSurveyResult *)self entityIdentifier];
  if ([v5 isEqualToString:v6]
    && (int v7 = [v4 entityType], v7 == -[PGSurveyResult entityType](self, "entityType"))
    && (int v8 = [v4 type], v8 == -[PGSurveyResult type](self, "type"))
    && (int v9 = [v4 state], v9 == -[PGSurveyResult state](self, "state")))
  {
    v10 = [v4 additionalInfo];
    v11 = [(PGSurveyResult *)self additionalInfo];
    int v12 = [v10 isEqualToDictionary:v11];
  }
  else
  {
    int v12 = 0;
  }

  v13 = [(PGSurveyResult *)self momentIdentifier];
  uint64_t v14 = [v13 length];

  if (v14)
  {
    v15 = [v4 momentIdentifier];
    v16 = [(PGSurveyResult *)self momentIdentifier];
    v12 &= [v15 isEqualToString:v16];
  }
  return v12;
}

- (BOOL)isEquivalentToPersistedQuestion:(id)a3
{
  return 0;
}

@end