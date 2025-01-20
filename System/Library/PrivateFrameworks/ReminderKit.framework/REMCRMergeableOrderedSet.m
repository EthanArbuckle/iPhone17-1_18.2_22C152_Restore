@interface REMCRMergeableOrderedSet
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CRDocument)document;
- (NSMutableArray)undos;
- (NSOrderedSet)orderedSet;
- (REMCRMergeableOrderedSet)initWithCoder:(id)a3;
- (REMCRMergeableOrderedSet)initWithReplicaIDSource:(id)a3 document:(id)a4;
- (REMCRMergeableOrderedSet)initWithReplicaIDSource:(id)a3 document:(id)a4 undos:(id)a5;
- (REMCRMergeableOrderedSet)initWithReplicaIDSource:(id)a3 orderedSet:(id)a4;
- (REMCRMergeableOrderedSet)initWithReplicaIDSource:(id)a3 serializedData:(id)a4 error:(id *)a5;
- (REMReplicaIDSource)replicaIDSource;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mergedOrderedSetWithOrderedSet:(id)a3 error:(id *)a4;
- (id)mutableOrderedSet;
- (id)objectAtIndex:(unint64_t)a3;
- (id)serializedData;
- (unint64_t)count;
- (unint64_t)indexOfEqualObject:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)setDocument:(id)a3;
- (void)setReplicaIDSource:(id)a3;
@end

@implementation REMCRMergeableOrderedSet

- (REMCRMergeableOrderedSet)initWithReplicaIDSource:(id)a3 document:(id)a4
{
  return [(REMCRMergeableOrderedSet *)self initWithReplicaIDSource:a3 document:a4 undos:MEMORY[0x1E4F1CBF0]];
}

- (REMCRMergeableOrderedSet)initWithReplicaIDSource:(id)a3 document:(id)a4 undos:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)REMCRMergeableOrderedSet;
  v12 = [(REMCRMergeableOrderedSet *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_replicaIDSource, a3);
    objc_storeStrong((id *)&v13->_document, a4);
    uint64_t v14 = [v11 copy];
    undos = v13->_undos;
    v13->_undos = (NSMutableArray *)v14;
  }
  return v13;
}

- (REMCRMergeableOrderedSet)initWithReplicaIDSource:(id)a3 orderedSet:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [CRTTCompatibleDocument alloc];
  id v9 = +[REMReplicaIDHelper replicaUUIDForCreation];
  id v10 = [(CRDocument *)v8 initWithReplica:v9];

  id v11 = [[CRTombstoneOrderedSet alloc] initWithDocument:v10];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__REMCRMergeableOrderedSet_initWithReplicaIDSource_orderedSet___block_invoke;
  v15[3] = &unk_1E61DCAC8;
  v16 = v11;
  v12 = v11;
  [v6 enumerateObjectsUsingBlock:v15];

  [(CRDocument *)v10 setRootObject:v12];
  [(CRTTCompatibleDocument *)v10 realizeLocalChanges];
  v13 = [(REMCRMergeableOrderedSet *)self initWithReplicaIDSource:v7 document:v10];

  return v13;
}

uint64_t __63__REMCRMergeableOrderedSet_initWithReplicaIDSource_orderedSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (REMCRMergeableOrderedSet)initWithReplicaIDSource:(id)a3 serializedData:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[REMReplicaIDHelper nonEditingReplicaUUID];
  id v10 = +[CRDocument unarchiveFromData:v7 replica:v9];

  id v11 = [(REMCRMergeableOrderedSet *)self initWithReplicaIDSource:v8 document:v10];
  return v11;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMCRMergeableOrderedSet *)self document];
  id v6 = [v3 stringWithFormat:@"<%@: %p document: %@>", v4, self, v5];

  return v6;
}

- (NSOrderedSet)orderedSet
{
  v3 = [MEMORY[0x1E4F1CA70] orderedSet];
  uint64_t v4 = [(REMCRMergeableOrderedSet *)self document];
  v5 = [v4 rootObject];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__REMCRMergeableOrderedSet_orderedSet__block_invoke;
  v9[3] = &unk_1E61DCAC8;
  id v10 = v3;
  id v6 = v3;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = [MEMORY[0x1E4F1CAA0] orderedSetWithOrderedSet:v6];

  return (NSOrderedSet *)v7;
}

uint64_t __38__REMCRMergeableOrderedSet_orderedSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) insertObject:a2 atIndex:a3];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (REMCRMergeableOrderedSet *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(REMCRMergeableOrderedSet *)self orderedSet];
      id v6 = [(REMCRMergeableOrderedSet *)v4 orderedSet];
      char v7 = [v5 isEqualToOrderedSet:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)count
{
  v2 = [(REMCRMergeableOrderedSet *)self document];
  v3 = [v2 rootObject];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)objectAtIndex:(unint64_t)a3
{
  unint64_t v4 = [(REMCRMergeableOrderedSet *)self document];
  v5 = [v4 rootObject];
  id v6 = [v5 objectAtIndex:a3];

  return v6;
}

- (unint64_t)indexOfEqualObject:(id)a3
{
  id v4 = a3;
  v5 = [(REMCRMergeableOrderedSet *)self document];
  id v6 = [v5 rootObject];
  unint64_t v7 = [v6 indexOfEqualObject:v4];

  return v7;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  id v6 = [(REMCRMergeableOrderedSet *)self document];
  v5 = [v6 rootObject];
  [v5 enumerateObjectsUsingBlock:v4];
}

- (id)mutableOrderedSet
{
  v3 = [REMMutableCRMergeableOrderedSet alloc];
  id v4 = [(REMCRMergeableOrderedSet *)self replicaIDSource];
  v5 = [(REMCRMergeableOrderedSet *)self document];
  id v6 = [(REMCRMergeableOrderedSet *)self undos];
  unint64_t v7 = [(REMMutableCRMergeableOrderedSet *)v3 initWithReplicaIDSource:v4 immutableDocumentToEdit:v5 undos:v6];

  return v7;
}

- (id)serializedData
{
  v2 = [(REMCRMergeableOrderedSet *)self document];
  v3 = [v2 archivedData];

  return v3;
}

- (id)mergedOrderedSetWithOrderedSet:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [(REMCRMergeableOrderedSet *)self document];
  id v8 = +[REMReplicaIDHelper nonEditingReplicaUUID];
  id v9 = (void *)[v7 copyForReplica:v8];

  id v10 = [v6 document];

  uint64_t v11 = [v9 mergeWithDocument:v10];
  if (v11 == 1)
  {
    a4 = self;
  }
  else if (v11)
  {
    uint64_t v14 = [REMCRMergeableOrderedSet alloc];
    v15 = [(REMCRMergeableOrderedSet *)self replicaIDSource];
    v16 = [(REMCRMergeableOrderedSet *)self undos];
    a4 = [(REMCRMergeableOrderedSet *)v14 initWithReplicaIDSource:v15 document:v9 undos:v16];
  }
  else if (a4)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v18 = *MEMORY[0x1E4F28588];
    v19[0] = @"Failed to merge CR documents.";
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    *a4 = (id)[v12 initWithDomain:@"REMCRMergeableOrderedSet" code:-1 userInfo:v13];

    a4 = 0;
  }

  return a4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)MEMORY[0x1BA9DB950](self, a2, a3);
  v5 = [(REMCRMergeableOrderedSet *)self document];
  id v6 = [(REMCRMergeableOrderedSet *)self document];
  unint64_t v7 = [v6 replica];
  id v8 = (void *)[v5 copyForReplica:v7];

  id v9 = [REMCRMergeableOrderedSet alloc];
  id v10 = [(REMCRMergeableOrderedSet *)self replicaIDSource];
  uint64_t v11 = (void *)[v10 copy];
  id v12 = [(REMCRMergeableOrderedSet *)self undos];
  v13 = [(REMCRMergeableOrderedSet *)v9 initWithReplicaIDSource:v11 document:v8 undos:v12];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(REMCRMergeableOrderedSet *)self replicaIDSource];
  [v4 encodeObject:v5 forKey:@"replicaIDSource"];

  id v6 = [(REMCRMergeableOrderedSet *)self document];
  id v7 = [v6 archivedData];

  [v4 encodeObject:v7 forKey:@"document"];
}

- (REMCRMergeableOrderedSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)REMCRMergeableOrderedSet;
  v5 = [(REMCRMergeableOrderedSet *)&v10 init];
  if (!v5)
  {
LABEL_5:
    v5 = v5;
    id v6 = v5;
    goto LABEL_7;
  }
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"replicaIDSource"];
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"document"];
    if (!v7)
    {

      id v6 = 0;
      goto LABEL_7;
    }
    id v8 = (void *)v7;
    v5 = [(REMCRMergeableOrderedSet *)v5 initWithReplicaIDSource:v6 serializedData:v7 error:0];

    goto LABEL_5;
  }
LABEL_7:

  return v6;
}

- (REMReplicaIDSource)replicaIDSource
{
  return self->_replicaIDSource;
}

- (void)setReplicaIDSource:(id)a3
{
}

- (CRDocument)document
{
  return self->_document;
}

- (void)setDocument:(id)a3
{
}

- (NSMutableArray)undos
{
  return self->_undos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undos, 0);
  objc_storeStrong((id *)&self->_document, 0);

  objc_storeStrong((id *)&self->_replicaIDSource, 0);
}

@end