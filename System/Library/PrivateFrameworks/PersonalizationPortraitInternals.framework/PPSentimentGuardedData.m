@interface PPSentimentGuardedData
@end

@implementation PPSentimentGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_storeStrong((id *)&self->_tokenWeightTrie, 0);
}

@end