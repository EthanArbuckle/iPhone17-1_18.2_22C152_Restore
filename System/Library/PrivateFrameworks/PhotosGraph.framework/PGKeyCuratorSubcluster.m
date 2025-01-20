@interface PGKeyCuratorSubcluster
- (CLSInvestigationItem)keyItem;
- (PGKeyCuratorSubcluster)initWithItems:(id)a3 keyItem:(id)a4 score:(double)a5 iconicScoreBucket:(unint64_t)a6;
- (double)score;
- (unint64_t)iconicScoreBucket;
@end

@implementation PGKeyCuratorSubcluster

- (void).cxx_destruct
{
}

- (unint64_t)iconicScoreBucket
{
  return self->_iconicScoreBucket;
}

- (double)score
{
  return self->_score;
}

- (CLSInvestigationItem)keyItem
{
  return (CLSInvestigationItem *)objc_getProperty(self, a2, 8, 1);
}

- (PGKeyCuratorSubcluster)initWithItems:(id)a3 keyItem:(id)a4 score:(double)a5 iconicScoreBucket:(unint64_t)a6
{
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGKeyCuratorSubcluster;
  v11 = [(PGKeyCuratorSubcluster *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_keyItem, a4);
    v12->_score = a5;
    v12->_iconicScoreBucket = a6;
  }

  return v12;
}

@end