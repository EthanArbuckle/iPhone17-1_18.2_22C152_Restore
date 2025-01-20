@interface _UICollectionLayoutSupplementaryEnroller
- (_UICollectionLayoutSupplementaryEnroller)init;
- (id)description;
- (id)enrollSupplementaryForKind:(id *)a1;
- (uint64_t)commitEnrollment:(uint64_t)result;
- (uint64_t)countForKind:(uint64_t)a1;
- (uint64_t)kindIndexForEnrollmentIdentifier:(uint64_t)a1;
- (uint64_t)pruneUncommittedEnrollments;
- (void)_removeEnrollmentWithIdentifier:(id *)a1;
@end

@implementation _UICollectionLayoutSupplementaryEnroller

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kindEnrollmentsDict, 0);
  objc_storeStrong((id *)&self->_enrollmentsDict, 0);
  objc_storeStrong((id *)&self->_uncommittedEnrollmentIdentifiers, 0);
  objc_storeStrong((id *)&self->_enrollmentIdentifiers, 0);
}

- (_UICollectionLayoutSupplementaryEnroller)init
{
  v12.receiver = self;
  v12.super_class = (Class)_UICollectionLayoutSupplementaryEnroller;
  v2 = [(_UICollectionLayoutSupplementaryEnroller *)&v12 init];
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    enrollmentIdentifiers = v2->_enrollmentIdentifiers;
    v2->_enrollmentIdentifiers = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uncommittedEnrollmentIdentifiers = v2->_uncommittedEnrollmentIdentifiers;
    v2->_uncommittedEnrollmentIdentifiers = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    enrollmentsDict = v2->_enrollmentsDict;
    v2->_enrollmentsDict = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    kindEnrollmentsDict = v2->_kindEnrollmentsDict;
    v2->_kindEnrollmentsDict = v9;
  }
  return v2;
}

- (uint64_t)commitEnrollment:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (!a2)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:sel_commitEnrollment_, v3, @"_UICollectionLayoutSupplementaryEnroller.m", 126, @"Invalid parameter not satisfying: %@", @"enrollmentIdentifier" object file lineNumber description];
    }
    v4 = *(void **)(v3 + 16);
    return [v4 removeObject:a2];
  }
  return result;
}

- (uint64_t)pruneUncommittedEnrollments
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = (id *)result;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v2 = *(id *)(result + 16);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v2);
          }
          -[_UICollectionLayoutSupplementaryEnroller _removeEnrollmentWithIdentifier:](v1, *(void *)(*((void *)&v7 + 1) + 8 * v6++));
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }

    return objc_msgSend(v1[2], "removeAllObjects", (void)v7);
  }
  return result;
}

- (uint64_t)kindIndexForEnrollmentIdentifier:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    if (!a2)
    {
      long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:sel_kindIndexForEnrollmentIdentifier_, v2, @"_UICollectionLayoutSupplementaryEnroller.m", 88, @"Invalid parameter not satisfying: %@", @"enrollmentIdentifier" object file lineNumber description];
    }
    uint64_t v4 = [*(id *)(v2 + 24) objectForKeyedSubscript:a2];
    uint64_t v5 = (void *)v4;
    if (v4)
    {
      uint64_t v6 = *(void *)(v4 + 8);
      id v7 = *(id *)(v2 + 32);
      long long v8 = [v7 objectForKeyedSubscript:v6];

      if (!v8)
      {
        v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:sel_kindIndexForEnrollmentIdentifier_ object:v2 file:@"_UICollectionLayoutSupplementaryEnroller.m" lineNumber:93 description:@"Failed to retrieve the kind enrollments."];
      }
      uint64_t v2 = [v8 indexOfObject:v5];
    }
    else
    {
      uint64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v2;
}

- (id)enrollSupplementaryForKind:(id *)a1
{
  if (a1)
  {
    if (![a2 length])
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:sel_enrollSupplementaryForKind_, a1, @"_UICollectionLayoutSupplementaryEnroller.m", 50, @"Invalid parameter not satisfying: %@", @"kind.length" object file lineNumber description];
    }
    uint64_t v4 = [_UICollectionLayoutSupplementaryEnrollment alloc];
    if (v4
      && (v19.receiver = v4,
          v19.super_class = (Class)_UICollectionLayoutSupplementaryEnrollment,
          (id v5 = objc_msgSendSuper2(&v19, sel_init)) != 0))
    {
      uint64_t v6 = v5;
      objc_storeStrong((id *)v5 + 1, a2);
      uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
      long long v8 = (void *)v6[2];
      v6[2] = v7;

      int v9 = 0;
      long long v10 = (void *)v6[2];
    }
    else
    {
      uint64_t v6 = 0;
      long long v10 = 0;
      int v9 = 1;
    }
    id v11 = v10;
    [a1[3] setObject:v6 forKeyedSubscript:v11];
    if (v9)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:sel__addEnrollmentToKindDict_, a1, @"_UICollectionLayoutSupplementaryEnroller.m", 141, @"Invalid parameter not satisfying: %@", @"enrollment" object file lineNumber description];

      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v12 = (void *)v6[1];
    }
    id v13 = v12;
    if (![v13 length])
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:sel__addEnrollmentToKindDict_ object:a1 file:@"_UICollectionLayoutSupplementaryEnroller.m" lineNumber:143 description:@"Fatal: enrollment has an empty kind."];
    }
    id v14 = [a1[4] objectForKeyedSubscript:v13];
    if (!v14)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
      [a1[4] setObject:v14 forKeyedSubscript:v13];
    }
    [v14 addObject:v6];

    [a1[1] addObject:v11];
    [a1[2] addObject:v11];
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableDictionary count](self->_enrollmentsDict, "count"));
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p: %@ enrollments=%@; uncommittedEnrollments=%@>",
    v5,
    self,
    v6,
    self->_kindEnrollmentsDict,
  uint64_t v7 = self->_uncommittedEnrollmentIdentifiers);

  return v7;
}

- (uint64_t)countForKind:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    if (![a2 length])
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:sel_countForKind_, v2, @"_UICollectionLayoutSupplementaryEnroller.m", 77, @"Invalid parameter not satisfying: %@", @"kind.length" object file lineNumber description];
    }
    uint64_t v4 = [*(id *)(v2 + 32) objectForKeyedSubscript:a2];
    id v5 = v4;
    if (v4) {
      uint64_t v2 = [v4 count];
    }
    else {
      uint64_t v2 = 0;
    }
  }
  return v2;
}

- (void)_removeEnrollmentWithIdentifier:(id *)a1
{
  if (a1)
  {
    if (!a2)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:sel__removeEnrollmentWithIdentifier_, a1, @"_UICollectionLayoutSupplementaryEnroller.m", 154, @"Invalid parameter not satisfying: %@", @"enrollmentIdentifier" object file lineNumber description];
    }
    long long v10 = [a1[3] objectForKeyedSubscript:a2];
    if (!v10)
    {
      long long v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel__removeEnrollmentWithIdentifier_ object:a1 file:@"_UICollectionLayoutSupplementaryEnroller.m" lineNumber:157 description:@"Failed to retrieve enrollment."];
    }
    [a1[3] removeObjectForKey:a2];
    [a1[1] removeObject:a2];
    if (v10) {
      uint64_t v4 = v10[1];
    }
    else {
      uint64_t v4 = 0;
    }
    id v5 = a1[4];
    uint64_t v6 = [v5 objectForKeyedSubscript:v4];

    if (!v6)
    {
      int v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:sel__removeEnrollmentWithIdentifier_ object:a1 file:@"_UICollectionLayoutSupplementaryEnroller.m" lineNumber:165 description:@"Failed to find the enrollment kind set"];
    }
    [v6 removeObject:v10];
  }
}

@end