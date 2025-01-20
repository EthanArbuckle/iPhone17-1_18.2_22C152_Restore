@interface PFStoryClusteringProperties
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPFStoryClusteringProperties:(id)a3;
- (NSDictionary)algorithmProperties;
- (NSDictionary)distanceWeights;
- (NSString)algorithm;
- (PFStoryClusteringProperties)initWithAlgorithmName:(id)a3 algorithmProperties:(id)a4 distanceWeights:(id)a5;
- (id)description;
@end

@implementation PFStoryClusteringProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceWeights, 0);
  objc_storeStrong((id *)&self->_algorithmProperties, 0);

  objc_storeStrong((id *)&self->_algorithm, 0);
}

- (NSDictionary)distanceWeights
{
  return self->_distanceWeights;
}

- (NSDictionary)algorithmProperties
{
  return self->_algorithmProperties;
}

- (NSString)algorithm
{
  return self->_algorithm;
}

- (BOOL)isEqualToPFStoryClusteringProperties:(id)a3
{
  id v4 = a3;
  v5 = [(PFStoryClusteringProperties *)self algorithm];
  v6 = [v4 algorithm];
  if ([v5 isEqualToString:v6])
  {
    v7 = [(PFStoryClusteringProperties *)self algorithmProperties];
    v8 = [v4 algorithmProperties];
    if ([v7 isEqualToDictionary:v8])
    {
      v9 = [(PFStoryClusteringProperties *)self distanceWeights];
      v10 = [v4 distanceWeights];
      char v11 = [v9 isEqualToDictionary:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PFStoryClusteringProperties *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PFStoryClusteringProperties *)self isEqualToPFStoryClusteringProperties:v4];
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(PFStoryClusteringProperties *)self algorithm];
  v6 = [(PFStoryClusteringProperties *)self algorithmProperties];
  v7 = [(PFStoryClusteringProperties *)self distanceWeights];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; algorithm = %@, algorithm properties = %@, distance weights = %@>",
    v4,
    self,
    v5,
    v6,
  v8 = v7);

  return v8;
}

- (PFStoryClusteringProperties)initWithAlgorithmName:(id)a3 algorithmProperties:(id)a4 distanceWeights:(id)a5
{
  v17.receiver = self;
  v17.super_class = (Class)PFStoryClusteringProperties;
  id v7 = a5;
  id v8 = a4;
  v9 = (__CFString *)a3;
  v10 = [(PFStoryClusteringProperties *)&v17 init];
  char v11 = v10;
  if (v9) {
    v12 = v9;
  }
  else {
    v12 = @"PLDBSCANClustering";
  }
  objc_storeStrong((id *)&v10->_algorithm, v12);
  v13 = (void *)MEMORY[0x1E4F1CC08];
  if (v8) {
    v14 = v8;
  }
  else {
    v14 = (void *)MEMORY[0x1E4F1CC08];
  }
  objc_storeStrong((id *)&v11->_algorithmProperties, v14);
  if (v7) {
    v15 = v7;
  }
  else {
    v15 = v13;
  }
  objc_storeStrong((id *)&v11->_distanceWeights, v15);

  return v11;
}

@end