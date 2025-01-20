@interface PGKeyCuratorCluster
- (CLSInvestigationItem)keyItem;
- (NSArray)subclusters;
- (PGKeyCuratorCluster)initWithSubclusters:(id)a3 keyItem:(id)a4 score:(double)a5;
- (double)score;
@end

@implementation PGKeyCuratorCluster

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyItem, 0);
  objc_storeStrong((id *)&self->_subclusters, 0);
}

- (double)score
{
  return self->_score;
}

- (CLSInvestigationItem)keyItem
{
  return (CLSInvestigationItem *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)subclusters
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (PGKeyCuratorCluster)initWithSubclusters:(id)a3 keyItem:(id)a4 score:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGKeyCuratorCluster;
  v11 = [(PGKeyCuratorCluster *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_subclusters, a3);
    objc_storeStrong((id *)&v12->_keyItem, a4);
    v12->_score = a5;
  }

  return v12;
}

@end