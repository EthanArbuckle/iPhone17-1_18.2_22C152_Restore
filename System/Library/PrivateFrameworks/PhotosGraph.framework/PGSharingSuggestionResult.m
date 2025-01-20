@interface PGSharingSuggestionResult
- (BOOL)useContactSuggestion;
- (NSArray)sourceNames;
- (NSDictionary)dictionaryRepresentation;
- (PGPersonResult)person;
- (PGSharingSuggestionResult)initWithPerson:(id)a3 weight:(double)a4 sourceWeight:(double)a5 sourceName:(id)a6;
- (double)score;
- (double)sourceWeight;
- (double)weight;
- (id)description;
- (void)mergeWithSuggestionResult:(id)a3;
- (void)setUseContactSuggestion:(BOOL)a3;
@end

@implementation PGSharingSuggestionResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceNames, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

- (void)setUseContactSuggestion:(BOOL)a3
{
  self->_useContactSuggestion = a3;
}

- (BOOL)useContactSuggestion
{
  return self->_useContactSuggestion;
}

- (NSArray)sourceNames
{
  return self->_sourceNames;
}

- (double)sourceWeight
{
  return self->_sourceWeight;
}

- (double)weight
{
  return self->_weight;
}

- (PGPersonResult)person
{
  return self->_person;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGSharingSuggestionResult;
  v4 = [(PGSharingSuggestionResult *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ - person:%@ weight:%.2f sourceWeight:%.2f sources:%@", v4, self->_person, *(void *)&self->_weight, *(void *)&self->_sourceWeight, self->_sourceNames];

  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  v24[7] = *MEMORY[0x1E4F143B8];
  v3 = [(PGSharingSuggestionResult *)self person];
  v4 = [v3 contactIdentifier];

  if (![(__CFString *)v4 length]
    && [(PGSharingSuggestionResult *)self useContactSuggestion])
  {
    v5 = [(PGSharingSuggestionResult *)self person];
    uint64_t v6 = [v5 suggestedContactIdentifier];

    v4 = (__CFString *)v6;
  }
  v23[0] = @"localIdentifier";
  objc_super v7 = [(PGSharingSuggestionResult *)self person];
  uint64_t v8 = [v7 localIdentifier];
  v9 = (void *)v8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  else {
    v10 = &stru_1F283BC78;
  }
  if (v4) {
    v11 = v4;
  }
  else {
    v11 = &stru_1F283BC78;
  }
  v24[0] = v10;
  v24[1] = v11;
  v23[1] = @"contactIdentifier";
  v23[2] = @"displayName";
  v12 = [(PGSharingSuggestionResult *)self person];
  uint64_t v13 = [v12 fullName];
  v14 = (void *)v13;
  if (v13) {
    v15 = (__CFString *)v13;
  }
  else {
    v15 = &stru_1F283BC78;
  }
  v24[2] = v15;
  v23[3] = @"score";
  v16 = NSNumber;
  [(PGSharingSuggestionResult *)self score];
  v17 = objc_msgSend(v16, "numberWithDouble:");
  v24[3] = v17;
  v23[4] = @"weight";
  v18 = [NSNumber numberWithDouble:self->_weight];
  v24[4] = v18;
  v23[5] = @"sourceWeight";
  v19 = [NSNumber numberWithDouble:self->_sourceWeight];
  v24[5] = v19;
  v23[6] = @"sourceNames";
  v20 = [(PGSharingSuggestionResult *)self sourceNames];
  v24[6] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:7];

  return (NSDictionary *)v21;
}

- (double)score
{
  return self->_sourceWeight + self->_weight * 0.001;
}

- (void)mergeWithSuggestionResult:(id)a3
{
  id v12 = a3;
  [v12 weight];
  double sourceWeight = self->_sourceWeight;
  self->_weight = v5 + self->_weight;
  if (sourceWeight > 0.25 || ([v12 sourceWeight], v6 > 0.25))
  {
    [v12 sourceWeight];
    self->_double sourceWeight = v7 + self->_sourceWeight;
  }
  sourceNames = self->_sourceNames;
  v9 = [v12 sourceNames];
  v10 = [(NSArray *)sourceNames arrayByAddingObjectsFromArray:v9];
  v11 = self->_sourceNames;
  self->_sourceNames = v10;
}

- (PGSharingSuggestionResult)initWithPerson:(id)a3 weight:(double)a4 sourceWeight:(double)a5 sourceName:(id)a6
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PGSharingSuggestionResult;
  uint64_t v13 = [(PGSharingSuggestionResult *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_person, a3);
    v14->_weight = a4;
    v14->_double sourceWeight = a5;
    v19[0] = v12;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    sourceNames = v14->_sourceNames;
    v14->_sourceNames = (NSArray *)v15;

    v14->_useContactSuggestion = 0;
  }

  return v14;
}

@end