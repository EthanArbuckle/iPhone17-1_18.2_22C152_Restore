@interface PPCoalescedScoredNamedEntity
- (PPCoalescedScoredNamedEntity)initWithScoredNamedEntity:(id)a3 occurrencesInSource:(unsigned __int16)a4;
- (PPScoredItem)scoredNamedEntity;
- (unsigned)occurrencesInSource;
@end

@implementation PPCoalescedScoredNamedEntity

- (void).cxx_destruct
{
}

- (unsigned)occurrencesInSource
{
  return self->_occurrencesInSource;
}

- (PPScoredItem)scoredNamedEntity
{
  return self->_scoredNamedEntity;
}

- (PPCoalescedScoredNamedEntity)initWithScoredNamedEntity:(id)a3 occurrencesInSource:(unsigned __int16)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPCoalescedScoredNamedEntity;
  v8 = [(PPCoalescedScoredNamedEntity *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_scoredNamedEntity, a3);
    v9->_occurrencesInSource = a4;
  }

  return v9;
}

@end