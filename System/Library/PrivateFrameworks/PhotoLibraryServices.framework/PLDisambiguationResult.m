@interface PLDisambiguationResult
- (NSArray)genericLocationTuples;
- (NSArray)locationNames;
- (NSArray)personLookupIdentifiers;
- (PLDisambiguation)disambiguation;
- (PLDisambiguationResult)initWithDisambiguation:(id)a3 personLookupIdentifiers:(id)a4 locationNames:(id)a5 genericLocationTuples:(id)a6;
- (id)description;
@end

@implementation PLDisambiguationResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genericLocationTuples, 0);
  objc_storeStrong((id *)&self->_locationNames, 0);
  objc_storeStrong((id *)&self->_personLookupIdentifiers, 0);
  objc_storeStrong((id *)&self->_disambiguation, 0);
}

- (NSArray)genericLocationTuples
{
  return self->_genericLocationTuples;
}

- (NSArray)locationNames
{
  return self->_locationNames;
}

- (NSArray)personLookupIdentifiers
{
  return self->_personLookupIdentifiers;
}

- (PLDisambiguation)disambiguation
{
  return self->_disambiguation;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Disambiguation: %@, personLookupIdentifiers: %@, locationNames: %@, genericLocationDict: %@", self->_disambiguation, self->_personLookupIdentifiers, self->_locationNames, self->_genericLocationTuples];
}

- (PLDisambiguationResult)initWithDisambiguation:(id)a3 personLookupIdentifiers:(id)a4 locationNames:(id)a5 genericLocationTuples:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v12)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PLDisambiguationResult.m", 16, @"Invalid parameter not satisfying: %@", @"disambiguation" object file lineNumber description];
  }
  v26.receiver = self;
  v26.super_class = (Class)PLDisambiguationResult;
  v16 = [(PLDisambiguationResult *)&v26 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_disambiguation, a3);
    uint64_t v18 = [v13 copy];
    personLookupIdentifiers = v17->_personLookupIdentifiers;
    v17->_personLookupIdentifiers = (NSArray *)v18;

    uint64_t v20 = [v14 copy];
    locationNames = v17->_locationNames;
    v17->_locationNames = (NSArray *)v20;

    uint64_t v22 = [v15 copy];
    genericLocationTuples = v17->_genericLocationTuples;
    v17->_genericLocationTuples = (NSArray *)v22;
  }
  return v17;
}

@end