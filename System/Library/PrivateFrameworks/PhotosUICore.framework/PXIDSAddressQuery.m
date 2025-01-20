@interface PXIDSAddressQuery
- (BOOL)isComplete;
- (NSSet)remainingDestinations;
- (PXIDSAddressQuery)initWithDestinations:(id)a3 resultHandler:(id)a4;
- (id)popStashedResults;
- (id)resultHandler;
- (void)stashDestination:(id)a3 withResult:(BOOL)a4;
@end

@implementation PXIDSAddressQuery

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_mutableStashedResults, 0);
  objc_storeStrong((id *)&self->_mutableRemainingDestinations, 0);
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (BOOL)isComplete
{
  return self->_resultsCount == self->_destinationsCount;
}

- (NSSet)remainingDestinations
{
  v2 = (void *)[(NSMutableSet *)self->_mutableRemainingDestinations copy];
  return (NSSet *)v2;
}

- (id)popStashedResults
{
  v3 = (void *)[(NSMutableDictionary *)self->_mutableStashedResults copy];
  mutableStashedResults = self->_mutableStashedResults;
  self->_mutableStashedResults = 0;

  return v3;
}

- (void)stashDestination:(id)a3 withResult:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v14 = v7;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXIDSAddressQueryController.m", 66, @"Invalid parameter not satisfying: %@", @"destination" object file lineNumber description];

    id v7 = 0;
  }
  if (([(NSMutableSet *)self->_mutableRemainingDestinations containsObject:v7] & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXIDSAddressQueryController.m", 67, @"Invalid parameter not satisfying: %@", @"[_mutableRemainingDestinations containsObject:destination]" object file lineNumber description];
  }
  mutableStashedResults = self->_mutableStashedResults;
  ++self->_resultsCount;
  if (!mutableStashedResults)
  {
    v9 = [MEMORY[0x1E4F1CA60] dictionary];
    v10 = self->_mutableStashedResults;
    self->_mutableStashedResults = v9;
  }
  v11 = [NSNumber numberWithBool:v4];
  [(NSMutableDictionary *)self->_mutableStashedResults setObject:v11 forKeyedSubscript:v14];

  [(NSMutableSet *)self->_mutableRemainingDestinations removeObject:v14];
}

- (PXIDSAddressQuery)initWithDestinations:(id)a3 resultHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXIDSAddressQueryController.m", 52, @"Invalid parameter not satisfying: %@", @"destinations.count > 0" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"PXIDSAddressQueryController.m", 53, @"Invalid parameter not satisfying: %@", @"resultHandler" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)PXIDSAddressQuery;
  v9 = [(PXIDSAddressQuery *)&v17 init];
  if (v9)
  {
    v9->_destinationsCount = [v7 count];
    uint64_t v10 = [MEMORY[0x1E4F1CA80] setWithArray:v7];
    mutableRemainingDestinations = v9->_mutableRemainingDestinations;
    v9->_mutableRemainingDestinations = (NSMutableSet *)v10;

    uint64_t v12 = [v8 copy];
    id resultHandler = v9->_resultHandler;
    v9->_id resultHandler = (id)v12;

    v9->_resultsCount = 0;
  }

  return v9;
}

@end