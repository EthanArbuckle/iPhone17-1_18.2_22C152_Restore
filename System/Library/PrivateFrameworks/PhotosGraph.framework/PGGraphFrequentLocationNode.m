@interface PGGraphFrequentLocationNode
+ (id)addressOfFrequentLocation;
+ (id)filter;
+ (id)momentOfFrequentLocation;
- (BOOL)hasProperties:(id)a3;
- (NSDate)universalEndDate;
- (NSDate)universalStartDate;
- (NSDateInterval)universalDateInterval;
- (NSString)description;
- (NSString)featureIdentifier;
- (PGGraphAddressNode)addressNode;
- (PGGraphFrequentLocationNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphFrequentLocationNode)initWithUniversalDateInterval:(id)a3;
- (PGGraphFrequentLocationNodeCollection)collection;
- (id)label;
- (id)name;
- (id)propertyDictionary;
- (unint64_t)featureType;
- (unint64_t)numberOfMomentNodes;
- (unsigned)domain;
@end

@implementation PGGraphFrequentLocationNode

- (void).cxx_destruct
{
}

- (NSDateInterval)universalDateInterval
{
  return (NSDateInterval *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)featureIdentifier
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PGGraphFrequentLocationNode *)self universalStartDate];
  v7 = [(PGGraphFrequentLocationNode *)self universalEndDate];
  v8 = [v3 stringWithFormat:@"%@|%@|%@", v5, v6, v7];

  return (NSString *)v8;
}

- (unint64_t)featureType
{
  return 33;
}

- (PGGraphFrequentLocationNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphFrequentLocationNodeCollection alloc] initWithNode:self];
  return v2;
}

- (NSString)description
{
  v3 = [(PGGraphFrequentLocationNode *)self addressNode];
  [v3 coordinate];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  v8 = [(PGGraphFrequentLocationNode *)self universalDateInterval];
  v9 = [v3 keywordDescription];
  v10 = NSString;
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  v13 = [v8 startDate];
  v14 = [v8 endDate];
  v15 = [v10 stringWithFormat:@"%@ ([%@ - %@] %@ <%f,%f> %zu moments)", v12, v13, v14, v9, v5, v7, -[PGGraphFrequentLocationNode numberOfMomentNodes](self, "numberOfMomentNodes")];

  return (NSString *)v15;
}

- (unint64_t)numberOfMomentNodes
{
  v2 = [(PGGraphFrequentLocationNode *)self collection];
  v3 = [v2 momentNodes];
  unint64_t v4 = [v3 count];

  return v4;
}

- (PGGraphAddressNode)addressNode
{
  v2 = [(PGGraphFrequentLocationNode *)self collection];
  v3 = [v2 addressNodes];
  unint64_t v4 = [v3 anyNode];

  return (PGGraphAddressNode *)v4;
}

- (id)name
{
  return 0;
}

- (NSDate)universalEndDate
{
  v2 = [(PGGraphFrequentLocationNode *)self universalDateInterval];
  v3 = [v2 endDate];

  return (NSDate *)v3;
}

- (NSDate)universalStartDate
{
  v2 = [(PGGraphFrequentLocationNode *)self universalDateInterval];
  v3 = [v2 startDate];

  return (NSDate *)v3;
}

- (unsigned)domain
{
  return 204;
}

- (id)label
{
  v2 = @"FrequentLocation";
  return @"FrequentLocation";
}

- (id)propertyDictionary
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"universalStartDate";
  v3 = NSNumber;
  unint64_t v4 = [(NSDateInterval *)self->_universalDateInterval startDate];
  [v4 timeIntervalSinceReferenceDate];
  uint64_t v5 = objc_msgSend(v3, "numberWithDouble:");
  v11[1] = @"universalEndDate";
  v12[0] = v5;
  uint64_t v6 = NSNumber;
  uint64_t v7 = [(NSDateInterval *)self->_universalDateInterval endDate];
  [v7 timeIntervalSinceReferenceDate];
  v8 = objc_msgSend(v6, "numberWithDouble:");
  v12[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4 || ![v4 count]) {
    goto LABEL_8;
  }
  uint64_t v6 = [v5 objectForKeyedSubscript:@"universalStartDate"];
  if (!v6) {
    goto LABEL_6;
  }
  uint64_t v7 = v6;
  [v6 doubleValue];
  double v9 = v8;
  v10 = [(NSDateInterval *)self->_universalDateInterval startDate];
  [v10 timeIntervalSinceReferenceDate];
  double v12 = v11;

  if (v9 == v12)
  {
LABEL_6:
    v14 = [v5 objectForKeyedSubscript:@"universalEndDate"];
    if (v14)
    {
      v15 = v14;
      [v14 doubleValue];
      double v17 = v16;
      v18 = [(NSDateInterval *)self->_universalDateInterval endDate];
      [v18 timeIntervalSinceReferenceDate];
      BOOL v20 = v17 != v19;

      char v13 = !v20;
      goto LABEL_9;
    }
LABEL_8:
    char v13 = 1;
    goto LABEL_9;
  }
  char v13 = 0;
LABEL_9:

  return v13 & 1;
}

- (PGGraphFrequentLocationNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"universalStartDate"];
  [v7 doubleValue];
  double v9 = v8;

  v10 = [v6 objectForKeyedSubscript:@"universalEndDate"];

  [v10 doubleValue];
  double v12 = v11;

  char v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v9];
  v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v12];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v13 endDate:v14];
  double v16 = [(PGGraphFrequentLocationNode *)self initWithUniversalDateInterval:v15];

  return v16;
}

- (PGGraphFrequentLocationNode)initWithUniversalDateInterval:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphFrequentLocationNode;
  id v6 = [(PGGraphNode *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_universalDateInterval, a3);
  }

  return v7;
}

+ (id)momentOfFrequentLocation
{
  v2 = +[PGGraphFrequentLocationInEdge filter];
  v3 = [v2 inRelation];

  return v3;
}

+ (id)addressOfFrequentLocation
{
  v2 = +[PGGraphFrequentLocationAtEdge filter];
  v3 = [v2 outRelation];

  return v3;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"FrequentLocation" domain:204];
  return v2;
}

@end