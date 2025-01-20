@interface PLRegionsHierarchicalClusteringObject
+ (id)clusterObjectWithObject:(id)a3 index:(unint64_t)a4;
- (PLRegionsClusteringItem)object;
- (unint64_t)index;
- (void)setIndex:(unint64_t)a3;
@end

@implementation PLRegionsHierarchicalClusteringObject

+ (id)clusterObjectWithObject:(id)a3 index:(unint64_t)a4
{
  id v5 = a3;
  objc_opt_class();
  v6 = objc_opt_new();
  v7 = (void *)v6[1];
  v6[1] = v5;

  v6[2] = a4;
  return v6;
}

- (void).cxx_destruct
{
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (unint64_t)index
{
  return self->_index;
}

- (PLRegionsClusteringItem)object
{
  return self->_object;
}

@end