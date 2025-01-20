@interface DMDActivationPredicateCompound
- (DMDActivationPredicateCompound)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 subPredicateObservers:(id)a5 predicate:(id)a6;
- (NSArray)subPredicateObservers;
- (id)metadata;
- (void)invalidate;
- (void)reportActivationPredicateObserverDidTrigger;
- (void)updateObserverRegistration;
@end

@implementation DMDActivationPredicateCompound

- (DMDActivationPredicateCompound)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 subPredicateObservers:(id)a5 predicate:(id)a6
{
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)DMDActivationPredicateCompound;
  v11 = [(DMDActivationPredicateObserver *)&v15 initWithDelegate:a3 uniqueIdentifier:a4 predicate:a6];
  if (v11)
  {
    v12 = (NSArray *)[v10 copy];
    subPredicateObservers = v11->_subPredicateObservers;
    v11->_subPredicateObservers = v12;
  }
  return v11;
}

- (void)updateObserverRegistration
{
  v12.receiver = self;
  v12.super_class = (Class)DMDActivationPredicateCompound;
  [(DMDActivationPredicateObserver *)&v12 updateObserverRegistration];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = [(DMDActivationPredicateCompound *)self subPredicateObservers];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) updateObserverRegistration];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)invalidate
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(DMDActivationPredicateCompound *)self subPredicateObservers];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) invalidate];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)DMDActivationPredicateCompound;
  [(DMDActivationPredicateObserver *)&v8 invalidate];
}

- (id)metadata
{
  v17.receiver = self;
  v17.super_class = (Class)DMDActivationPredicateCompound;
  v3 = [(DMDActivationPredicateObserver *)&v17 metadata];
  id v4 = [(DMDActivationPredicateCompound *)self subPredicateObservers];
  id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [(DMDActivationPredicateCompound *)self subPredicateObservers];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) metadata];
        if (v11) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    [v3 setObject:v5 forKeyedSubscript:DMFDeclarationStatePredicateSubPredicatesKey];
  }

  return v3;
}

- (void)reportActivationPredicateObserverDidTrigger
{
  v12.receiver = self;
  v12.super_class = (Class)DMDActivationPredicateCompound;
  [(DMDActivationPredicateObserver *)&v12 reportActivationPredicateObserverDidTrigger];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = [(DMDActivationPredicateCompound *)self subPredicateObservers];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) reportActivationPredicateObserverDidTrigger];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (NSArray)subPredicateObservers
{
  return self->_subPredicateObservers;
}

- (void).cxx_destruct
{
}

@end