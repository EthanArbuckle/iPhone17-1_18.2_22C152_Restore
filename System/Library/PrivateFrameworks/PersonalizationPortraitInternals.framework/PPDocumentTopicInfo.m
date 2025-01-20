@interface PPDocumentTopicInfo
- (PPDocumentTopicInfo)init;
- (double)countForAlgorithm:(unint64_t)a3;
- (void)addToCountForAlgorithm:(unint64_t)a3 value:(double)a4;
@end

@implementation PPDocumentTopicInfo

- (void).cxx_destruct
{
}

- (double)countForAlgorithm:(unint64_t)a3
{
  v3 = [(NSMutableArray *)self->_topicAlgorithmCounts objectAtIndexedSubscript:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)addToCountForAlgorithm:(unint64_t)a3 value:(double)a4
{
  v7 = NSNumber;
  -[NSMutableArray objectAtIndexedSubscript:](self->_topicAlgorithmCounts, "objectAtIndexedSubscript:");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v10 doubleValue];
  v9 = [v7 numberWithDouble:v8 + a4];
  [(NSMutableArray *)self->_topicAlgorithmCounts setObject:v9 atIndexedSubscript:a3];
}

- (PPDocumentTopicInfo)init
{
  v7.receiver = self;
  v7.super_class = (Class)PPDocumentTopicInfo;
  v2 = [(PPDocumentTopicInfo *)&v7 init];
  if (v2)
  {
    uint64_t v3 = 12;
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:12];
    topicAlgorithmCounts = v2->_topicAlgorithmCounts;
    v2->_topicAlgorithmCounts = (NSMutableArray *)v4;

    do
    {
      [(NSMutableArray *)v2->_topicAlgorithmCounts addObject:&unk_1F2569848];
      --v3;
    }
    while (v3);
  }
  return v2;
}

@end