@interface PLOPTICSClusterDescriptor
+ (id)clusterDescriptor:(_NSRange)a3 rootLevel:(int64_t)a4 minCoreDistanceIndex:(int64_t)a5 minCoreDistance:(double)a6;
- (NSNumber)clusterSize;
- (NSNumber)endIndex;
- (NSNumber)minCoreDistance;
- (NSNumber)minCoreDistanceIndex;
- (NSNumber)rootLevel;
- (NSNumber)startIndex;
- (PLOPTICSClusterDescriptor)initWithParameters:(_NSRange)a3 rootLevel:(int64_t)a4 minCoreDistanceIndex:(int64_t)a5 minCoreDistance:(double)a6;
- (_NSRange)indexRange;
@end

@implementation PLOPTICSClusterDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minCoreDistance, 0);
  objc_storeStrong((id *)&self->_minCoreDistanceIndex, 0);
  objc_storeStrong((id *)&self->_rootLevel, 0);
  objc_storeStrong((id *)&self->_clusterSize, 0);
  objc_storeStrong((id *)&self->_endIndex, 0);
  objc_storeStrong((id *)&self->_startIndex, 0);
}

- (NSNumber)minCoreDistance
{
  return self->_minCoreDistance;
}

- (NSNumber)minCoreDistanceIndex
{
  return self->_minCoreDistanceIndex;
}

- (NSNumber)rootLevel
{
  return self->_rootLevel;
}

- (NSNumber)clusterSize
{
  return self->_clusterSize;
}

- (NSNumber)endIndex
{
  return self->_endIndex;
}

- (NSNumber)startIndex
{
  return self->_startIndex;
}

- (_NSRange)indexRange
{
  NSUInteger v3 = [(NSNumber *)self->_startIndex unsignedIntegerValue];
  NSUInteger v4 = [(NSNumber *)self->_clusterSize unsignedIntegerValue];
  NSUInteger v5 = v3;
  result.length = v4;
  result.location = v5;
  return result;
}

- (PLOPTICSClusterDescriptor)initWithParameters:(_NSRange)a3 rootLevel:(int64_t)a4 minCoreDistanceIndex:(int64_t)a5 minCoreDistance:(double)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v27.receiver = self;
  v27.super_class = (Class)PLOPTICSClusterDescriptor;
  v11 = [(PLOPTICSClusterDescriptor *)&v27 init];
  v12 = v11;
  if (v11)
  {
    if (location == 0x7FFFFFFFFFFFFFFFLL)
    {
      startIndex = v11->_startIndex;
      v11->_startIndex = 0;
    }
    else
    {
      uint64_t v14 = [NSNumber numberWithUnsignedInteger:location];
      startIndex = v12->_startIndex;
      v12->_startIndex = (NSNumber *)v14;
    }

    if (length == 0x7FFFFFFFFFFFFFFFLL) {
      NSUInteger v15 = 0;
    }
    else {
      NSUInteger v15 = length;
    }
    uint64_t v16 = [NSNumber numberWithUnsignedInteger:v15];
    clusterSize = v12->_clusterSize;
    v12->_clusterSize = (NSNumber *)v16;

    if (v12->_startIndex)
    {
      uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", location + -[NSNumber unsignedIntegerValue](v12->_clusterSize, "unsignedIntegerValue") - 1);
      endIndex = v12->_endIndex;
      v12->_endIndex = (NSNumber *)v18;
    }
    else
    {
      endIndex = v12->_endIndex;
      v12->_endIndex = 0;
    }

    uint64_t v20 = [NSNumber numberWithInteger:a4];
    rootLevel = v12->_rootLevel;
    v12->_rootLevel = (NSNumber *)v20;

    uint64_t v22 = [NSNumber numberWithInteger:a5];
    minCoreDistanceIndex = v12->_minCoreDistanceIndex;
    v12->_minCoreDistanceIndex = (NSNumber *)v22;

    uint64_t v24 = [NSNumber numberWithDouble:a6];
    minCoreDistance = v12->_minCoreDistance;
    v12->_minCoreDistance = (NSNumber *)v24;
  }
  return v12;
}

+ (id)clusterDescriptor:(_NSRange)a3 rootLevel:(int64_t)a4 minCoreDistanceIndex:(int64_t)a5 minCoreDistance:(double)a6
{
  v6 = -[PLOPTICSClusterDescriptor initWithParameters:rootLevel:minCoreDistanceIndex:minCoreDistance:]([PLOPTICSClusterDescriptor alloc], "initWithParameters:rootLevel:minCoreDistanceIndex:minCoreDistance:", a3.location, a3.length, a4, a5, a6);
  return v6;
}

@end