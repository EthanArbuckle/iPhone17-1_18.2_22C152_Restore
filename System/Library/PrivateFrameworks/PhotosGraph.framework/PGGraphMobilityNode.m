@interface PGGraphMobilityNode
+ (id)filter;
+ (unint64_t)mobilityTypeForMobilityLabel:(id)a3;
- (MANodeFilter)uniquelyIdentifyingFilter;
- (PGGraphMobilityNode)initWithLabel:(id)a3;
- (id)label;
- (unint64_t)mobilityType;
- (unsigned)domain;
@end

@implementation PGGraphMobilityNode

- (void).cxx_destruct
{
}

- (id)label
{
  return self->_label;
}

- (unint64_t)mobilityType
{
  v2 = [(PGGraphMobilityNode *)self label];
  unint64_t v3 = [(id)objc_opt_class() mobilityTypeForMobilityLabel:v2];

  return v3;
}

- (MANodeFilter)uniquelyIdentifyingFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:self->_label domain:203];
  return (MANodeFilter *)v2;
}

- (unsigned)domain
{
  return 203;
}

- (PGGraphMobilityNode)initWithLabel:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphMobilityNode;
  v5 = [(PGGraphNode *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    label = v5->_label;
    v5->_label = (NSString *)v6;
  }
  return v5;
}

+ (unint64_t)mobilityTypeForMobilityLabel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F76AB8]])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F76AA8]])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F76AB0]])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F76AC0]])
  {
    unint64_t v4 = 4;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:0 domain:203];
  return v2;
}

@end