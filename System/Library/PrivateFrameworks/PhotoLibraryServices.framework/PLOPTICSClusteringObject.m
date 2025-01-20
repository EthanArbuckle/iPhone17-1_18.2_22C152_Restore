@interface PLOPTICSClusteringObject
+ (id)clusterObjectWithObject:(id)a3 index:(unint64_t)a4 epsilon:(double)a5;
- (BOOL)processed;
- (NSMutableArray)neighbors;
- (PLOPTICSClusteringObject)initWithObject:(id)a3 index:(unint64_t)a4 epsilon:(double)a5;
- (double)coreDistance;
- (double)reachabilityDistance;
- (id)neighborAtIndex:(unint64_t)a3;
- (id)object;
- (unint64_t)index;
- (unint64_t)order;
- (void)registerNeighbors:(id)a3 deleteExisting:(BOOL)a4;
- (void)setCoreDistance:(double)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setOrder:(unint64_t)a3;
- (void)setProcessed:(BOOL)a3;
- (void)setReachabilityDistance:(double)a3;
- (void)sortNeighborsByDistance;
- (void)updateCoreDistanceForNeighbor:(unint64_t)a3;
@end

@implementation PLOPTICSClusteringObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_neighbors, 0);
  objc_storeStrong(&self->_object, 0);
}

- (void)setProcessed:(BOOL)a3
{
  self->_processed = a3;
}

- (BOOL)processed
{
  return self->_processed;
}

- (void)setReachabilityDistance:(double)a3
{
  self->_reachabilityDistance = a3;
}

- (double)reachabilityDistance
{
  return self->_reachabilityDistance;
}

- (void)setCoreDistance:(double)a3
{
  self->_coreDistance = a3;
}

- (double)coreDistance
{
  return self->_coreDistance;
}

- (NSMutableArray)neighbors
{
  return self->_neighbors;
}

- (void)setOrder:(unint64_t)a3
{
  self->_order = a3;
}

- (unint64_t)order
{
  return self->_order;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (unint64_t)index
{
  return self->_index;
}

- (id)object
{
  return self->_object;
}

- (void)updateCoreDistanceForNeighbor:(unint64_t)a3
{
  id v5 = [(PLOPTICSClusteringObject *)self neighborAtIndex:a3];
  v4 = [v5 objectForKeyedSubscript:@"distance"];
  [v4 doubleValue];
  -[PLOPTICSClusteringObject setCoreDistance:](self, "setCoreDistance:");
}

- (id)neighborAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_neighbors count] <= a3)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PLOPTICSClustering.m", 141, @"Invalid parameter not satisfying: %@", @"index < _neighbors.count" object file lineNumber description];
  }
  neighbors = self->_neighbors;
  return (id)[(NSMutableArray *)neighbors objectAtIndex:a3];
}

- (void)sortNeighborsByDistance
{
  id v3 = [(NSMutableArray *)self->_neighbors sortedArrayUsingComparator:&__block_literal_global_25252];
  [(PLOPTICSClusteringObject *)self registerNeighbors:v3 deleteExisting:1];
}

uint64_t __51__PLOPTICSClusteringObject_sortNeighborsByDistance__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 objectForKeyedSubscript:@"distance"];
  [v5 doubleValue];
  double v7 = v6;

  v8 = [v4 objectForKeyedSubscript:@"distance"];

  [v8 doubleValue];
  double v10 = v9;

  if (v7 > v10) {
    return 1;
  }
  else {
    return -1;
  }
}

- (void)registerNeighbors:(id)a3 deleteExisting:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4) {
    [(NSMutableArray *)self->_neighbors removeAllObjects];
  }
  [(NSMutableArray *)self->_neighbors addObjectsFromArray:v6];
}

- (PLOPTICSClusteringObject)initWithObject:(id)a3 index:(unint64_t)a4 epsilon:(double)a5
{
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLOPTICSClusteringObject;
  double v10 = [(PLOPTICSClusteringObject *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong(&v10->_object, a3);
    v11->_coreDistance = a5 + 1.0;
    v11->_reachabilityDistance = a5;
    v11->_index = a4;
    v11->_order = 0;
    v11->_processed = 0;
    uint64_t v12 = objc_opt_new();
    neighbors = v11->_neighbors;
    v11->_neighbors = (NSMutableArray *)v12;
  }
  return v11;
}

+ (id)clusterObjectWithObject:(id)a3 index:(unint64_t)a4 epsilon:(double)a5
{
  id v7 = a3;
  v8 = [[PLOPTICSClusteringObject alloc] initWithObject:v7 index:a4 epsilon:a5];

  return v8;
}

@end