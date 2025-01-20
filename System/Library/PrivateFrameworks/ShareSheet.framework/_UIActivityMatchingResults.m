@interface _UIActivityMatchingResults
- (NSArray)excludedActivityTypes;
- (NSArray)hiddenActivities;
- (NSArray)orderedActivities;
- (_UIActivityMatchingContext)context;
- (_UIActivityMatchingResults)initWithActivityMatchingContext:(id)a3;
- (void)addExcludedActivityTypes:(id)a3;
- (void)addHiddenActivities:(id)a3;
- (void)setOrderedActivities:(id)a3;
@end

@implementation _UIActivityMatchingResults

- (_UIActivityMatchingResults)initWithActivityMatchingContext:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIActivityMatchingResults;
  v6 = [(_UIActivityMatchingResults *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    orderedActivities = v7->_orderedActivities;
    v7->_orderedActivities = (NSArray *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    hiddenActivitiesMutable = v7->_hiddenActivitiesMutable;
    v7->_hiddenActivitiesMutable = (NSMutableArray *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    excludedActivityTypesSet = v7->_excludedActivityTypesSet;
    v7->_excludedActivityTypesSet = (NSMutableSet *)v12;
  }
  return v7;
}

- (void)setOrderedActivities:(id)a3
{
  if (a3) {
    id v3 = a3;
  }
  else {
    id v3 = (id)MEMORY[0x1E4F1CBF0];
  }
  objc_storeStrong((id *)&self->_orderedActivities, v3);
}

- (void)addHiddenActivities:(id)a3
{
}

- (NSArray)hiddenActivities
{
  v2 = (void *)[(NSMutableArray *)self->_hiddenActivitiesMutable copy];
  return (NSArray *)v2;
}

- (void)addExcludedActivityTypes:(id)a3
{
}

- (NSArray)excludedActivityTypes
{
  return (NSArray *)[(NSMutableSet *)self->_excludedActivityTypesSet allObjects];
}

- (_UIActivityMatchingContext)context
{
  return self->_context;
}

- (NSArray)orderedActivities
{
  return self->_orderedActivities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedActivities, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypesSet, 0);
  objc_storeStrong((id *)&self->_hiddenActivitiesMutable, 0);
}

@end