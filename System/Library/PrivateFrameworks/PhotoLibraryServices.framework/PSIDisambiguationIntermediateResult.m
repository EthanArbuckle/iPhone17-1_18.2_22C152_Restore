@interface PSIDisambiguationIntermediateResult
- (NSArray)exactMatchResults;
- (NSArray)fullTokenMatchResults;
- (NSArray)wildcardMatchResults;
- (PLDisambiguation)disambiguation;
- (PSIDisambiguationIntermediateResult)initWithDisambiguation:(id)a3 exactMatchResults:(id)a4 fullTokenMatchResults:(id)a5 wildcardMatchResults:(id)a6;
- (id)description;
@end

@implementation PSIDisambiguationIntermediateResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wildcardMatchResults, 0);
  objc_storeStrong((id *)&self->_fullTokenMatchResults, 0);
  objc_storeStrong((id *)&self->_exactMatchResults, 0);
  objc_storeStrong((id *)&self->_disambiguation, 0);
}

- (NSArray)wildcardMatchResults
{
  return self->_wildcardMatchResults;
}

- (NSArray)fullTokenMatchResults
{
  return self->_fullTokenMatchResults;
}

- (NSArray)exactMatchResults
{
  return self->_exactMatchResults;
}

- (PLDisambiguation)disambiguation
{
  return self->_disambiguation;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Disambiguation: %@, exactMatchResults: %@, fullTokenMatchResults: %@, wildcardMatchResults: %@", self->_disambiguation, self->_exactMatchResults, self->_fullTokenMatchResults, self->_wildcardMatchResults];
}

- (PSIDisambiguationIntermediateResult)initWithDisambiguation:(id)a3 exactMatchResults:(id)a4 fullTokenMatchResults:(id)a5 wildcardMatchResults:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PSIDisambiguationIntermediateResult;
  v15 = [(PSIDisambiguationIntermediateResult *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_disambiguation, a3);
    objc_storeStrong((id *)&v16->_exactMatchResults, a4);
    objc_storeStrong((id *)&v16->_fullTokenMatchResults, a5);
    objc_storeStrong((id *)&v16->_wildcardMatchResults, a6);
  }

  return v16;
}

@end