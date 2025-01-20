@interface _NSDiffableDataSourceSectionSnapshotState
- (BOOL)containsIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSOrderedSet)identifiers;
- (_NSDiffableDataSourceSectionSnapshotState)init;
- (_NSDiffableDataSourceSectionSnapshotState)initWithSnapshotter:(id)a3 identifiers:(id)a4;
- (_NSDiffableDataSourceSectionSnapshotState)initWithSnapshotter:(id)a3 identifiers:(id)a4 identifiersHaveGuaranteedPerformance:(BOOL)a5;
- (_UITreeDataSourceSnapshotter)snapshotter;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)snapshotterMutableCopy;
- (int64_t)indexOfIdentifier:(id)a3;
- (void)willBecomeWiredToDataSource;
@end

@implementation _NSDiffableDataSourceSectionSnapshotState

- (void)willBecomeWiredToDataSource
{
  self->_identifierLookupCount = -1;
}

- (_UITreeDataSourceSnapshotter)snapshotter
{
  return self->_snapshotter;
}

- (NSOrderedSet)identifiers
{
  return self->_identifiers;
}

- (id)snapshotterMutableCopy
{
  v2 = (void *)[(_UITreeDataSourceSnapshotter *)self->_snapshotter copy];
  return v2;
}

- (_NSDiffableDataSourceSectionSnapshotState)initWithSnapshotter:(id)a3 identifiers:(id)a4
{
  return [(_NSDiffableDataSourceSectionSnapshotState *)self initWithSnapshotter:a3 identifiers:a4 identifiersHaveGuaranteedPerformance:0];
}

- (_NSDiffableDataSourceSectionSnapshotState)init
{
  v3 = objc_alloc_init(_UITreeDataSourceSnapshotter);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
  v5 = [(_NSDiffableDataSourceSectionSnapshotState *)self initWithSnapshotter:v3 identifiers:v4 identifiersHaveGuaranteedPerformance:1];

  return v5;
}

- (_NSDiffableDataSourceSectionSnapshotState)initWithSnapshotter:(id)a3 identifiers:(id)a4 identifiersHaveGuaranteedPerformance:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_NSDiffableDataSourceSectionSnapshotState;
  v11 = [(_NSDiffableDataSourceSectionSnapshotState *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_snapshotter, a3);
    objc_storeStrong((id *)&v12->_identifiers, a4);
    if (a5 || [(NSOrderedSet *)v12->_identifiers count] <= 0xA) {
      objc_storeStrong((id *)&v12->_guaranteedPerformanceIdentifiers, v12->_identifiers);
    }
  }

  return v12;
}

- (int64_t)indexOfIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unint64_t identifierLookupCount = self->_identifierLookupCount;
    if (identifierLookupCount < 0xA)
    {
      self->_unint64_t identifierLookupCount = identifierLookupCount + 1;
    }
    else if (!self->_guaranteedPerformanceIdentifiers)
    {
      v6 = (NSOrderedSet *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithOrderedSet:self->_identifiers];
      guaranteedPerformanceIdentifiers = self->_guaranteedPerformanceIdentifiers;
      self->_guaranteedPerformanceIdentifiers = v6;
    }
    identifiers = self->_guaranteedPerformanceIdentifiers;
    if (!identifiers) {
      identifiers = self->_identifiers;
    }
    int64_t v8 = [(NSOrderedSet *)identifiers indexOfObject:v4];
  }
  else
  {
    int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_guaranteedPerformanceIdentifiers, 0);
  objc_storeStrong((id *)&self->_snapshotter, 0);
}

- (BOOL)containsIdentifier:(id)a3
{
  return a3 && -[NSOrderedSet containsObject:](self->_identifiers, "containsObject:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (!self->_guaranteedPerformanceIdentifiers)
  {
    id v4 = (NSOrderedSet *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithOrderedSet:self->_identifiers];
    guaranteedPerformanceIdentifiers = self->_guaranteedPerformanceIdentifiers;
    self->_guaranteedPerformanceIdentifiers = v4;
  }
  id v6 = objc_alloc((Class)objc_opt_class());
  v7 = (void *)[(_UITreeDataSourceSnapshotter *)self->_snapshotter copy];
  int64_t v8 = (void *)[(NSOrderedSet *)self->_identifiers copy];
  id v9 = (id *)[v6 initWithSnapshotter:v7 identifiers:v8];

  if (v9) {
    objc_storeStrong(v9 + 2, self->_guaranteedPerformanceIdentifiers);
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_NSDiffableDataSourceSectionSnapshotState *)a3;
  v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      BOOL v7 = 1;
    }
    else
    {
      id v6 = v4;
      objc_opt_class();
      BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0
        && [(_UITreeDataSourceSnapshotter *)self->_snapshotter isEqual:v6->_snapshotter]
        && [(NSOrderedSet *)self->_identifiers isEqualToOrderedSet:v6->_identifiers];
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p: ", v5, self];

  [v3 appendFormat:@"identifiers = %@; snapshotter=%@>", self->_identifiers, self->_snapshotter];
  return v3;
}

@end