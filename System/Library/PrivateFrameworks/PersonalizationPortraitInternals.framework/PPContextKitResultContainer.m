@interface PPContextKitResultContainer
@end

@implementation PPContextKitResultContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicsExactMatchesInSourceText, 0);
  objc_storeStrong((id *)&self->_namedEntities, 0);
  objc_storeStrong((id *)&self->_topics, 0);
}

@end