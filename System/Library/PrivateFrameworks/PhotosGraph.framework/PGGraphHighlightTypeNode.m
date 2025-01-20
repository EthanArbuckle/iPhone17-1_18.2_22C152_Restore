@interface PGGraphHighlightTypeNode
+ (MANodeFilter)aggregationTypeNodeFilter;
+ (MANodeFilter)concludedTripTypeNodeFilter;
+ (MANodeFilter)defaultTypeNodeFilter;
+ (MANodeFilter)longTripTypeNodeFilter;
+ (MANodeFilter)onGoingTripTypeNodeFilter;
+ (MANodeFilter)shortTripTypeNodeFilter;
+ (MANodeFilter)tripTypeNodeFilter;
+ (MARelation)highlightGroupOfType;
+ (id)filter;
+ (id)typeNodeFilterForLabel:(id)a3;
- (NSString)featureIdentifier;
- (PGGraphHighlightTypeNode)initWithLabel:(id)a3;
- (id)label;
- (unint64_t)featureType;
- (unsigned)domain;
@end

@implementation PGGraphHighlightTypeNode

- (void).cxx_destruct
{
}

- (id)label
{
  return self->_label;
}

- (NSString)featureIdentifier
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PGGraphHighlightTypeNode *)self label];
  v7 = [v3 stringWithFormat:@"%@|%@", v5, v6];

  return (NSString *)v7;
}

- (unint64_t)featureType
{
  return 32;
}

- (unsigned)domain
{
  return 103;
}

- (PGGraphHighlightTypeNode)initWithLabel:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphHighlightTypeNode;
  v5 = [(PGGraphNode *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    label = v5->_label;
    v5->_label = (NSString *)v6;
  }
  return v5;
}

+ (MARelation)highlightGroupOfType
{
  v2 = +[PGGraphHasTypeEdge filter];
  v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (MANodeFilter)defaultTypeNodeFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Default" domain:103];
  return (MANodeFilter *)v2;
}

+ (MANodeFilter)onGoingTripTypeNodeFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"OngoingTrip" domain:103];
  return (MANodeFilter *)v2;
}

+ (MANodeFilter)aggregationTypeNodeFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Aggregation" domain:103];
  return (MANodeFilter *)v2;
}

+ (MANodeFilter)shortTripTypeNodeFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"ShortTrip" domain:103];
  return (MANodeFilter *)v2;
}

+ (MANodeFilter)longTripTypeNodeFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"LongTrip" domain:103];
  return (MANodeFilter *)v2;
}

+ (MANodeFilter)concludedTripTypeNodeFilter
{
  id v2 = objc_alloc(MEMORY[0x1E4F71F00]);
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"LongTrip", @"ShortTrip", 0);
  id v4 = (void *)[v2 initWithLabels:v3 domain:103 properties:MEMORY[0x1E4F1CC08]];

  return (MANodeFilter *)v4;
}

+ (MANodeFilter)tripTypeNodeFilter
{
  id v2 = objc_alloc(MEMORY[0x1E4F71F00]);
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"LongTrip", @"ShortTrip", @"OngoingTrip", 0);
  id v4 = (void *)[v2 initWithLabels:v3 domain:103 properties:MEMORY[0x1E4F1CC08]];

  return (MANodeFilter *)v4;
}

+ (id)typeNodeFilterForLabel:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F71F00];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithLabel:v4 domain:103];

  return v5;
}

+ (id)filter
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:0 domain:103];
  return v2;
}

@end