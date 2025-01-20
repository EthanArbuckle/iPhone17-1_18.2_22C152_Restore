@interface PPTextToTopicTransformGuardedData
@end

@implementation PPTextToTopicTransformGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicTransform, 0);
  objc_storeStrong((id *)&self->_vocabularyTrie, 0);
}

@end