@interface PPTopicDissectorGuardedData
@end

@implementation PPTopicDissectorGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->topicsExactMatchesInSourceText, 0);
  objc_storeStrong((id *)&self->namedEntities, 0);
  objc_storeStrong((id *)&self->topics, 0);
}

@end