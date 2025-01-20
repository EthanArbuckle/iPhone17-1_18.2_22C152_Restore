@interface PPCoalescedScoredTopic
- (PPCoalescedScoredTopic)initWithScoredTopic:(id)a3 occurrencesInSource:(unsigned __int16)a4;
- (PPScoredItem)scoredTopic;
- (unsigned)occurrencesInSource;
@end

@implementation PPCoalescedScoredTopic

- (void).cxx_destruct
{
}

- (unsigned)occurrencesInSource
{
  return self->_occurrencesInSource;
}

- (PPScoredItem)scoredTopic
{
  return self->_scoredTopic;
}

- (PPCoalescedScoredTopic)initWithScoredTopic:(id)a3 occurrencesInSource:(unsigned __int16)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPCoalescedScoredTopic;
  v8 = [(PPCoalescedScoredTopic *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_scoredTopic, a3);
    v9->_occurrencesInSource = a4;
  }

  return v9;
}

@end