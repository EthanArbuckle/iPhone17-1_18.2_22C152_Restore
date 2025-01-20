@interface ICCRIndex
+ (id)indexForReplica:(id)a3 betweenIndex:(id)a4 andIndex:(id)a5;
+ (id)indexWithPath:(id)a3;
- (BOOL)isEqual:(id)a3;
- (ICCRIndex)init;
- (ICCRIndex)initWithICCRCoder:(id)a3;
- (NSArray)indexPath;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deltaSince:(id)a3 in:(id)a4;
- (id)indexAtDepth:(unint64_t)a3 withInteger:(int64_t)a4 replica:(id)a5;
- (id)nextIndexForReplica:(id)a3;
- (id)previousIndexForReplica:(id)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)depth;
- (unint64_t)hash;
- (void)encodeWithICCRCoder:(id)a3;
- (void)realizeLocalChangesIn:(id)a3;
- (void)setIndexPath:(id)a3;
@end

@implementation ICCRIndex

+ (id)indexWithPath:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ICCRIndex);
  [(ICCRIndex *)v4 setIndexPath:v3];

  return v4;
}

- (ICCRIndex)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICCRIndex;
  v2 = [(ICCRIndex *)&v6 init];
  if (v2)
  {
    id v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    indexPath = v2->_indexPath;
    v2->_indexPath = v3;
  }
  return v2;
}

- (ICCRIndex)initWithICCRCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ICCRIndex *)self init];
  uint64_t v6 = [v4 currentDocumentObjectForDecoding];
  if (*(_DWORD *)(v6 + 48) == 9)
  {
    uint64_t v7 = *(void *)(v6 + 40);
    v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:*(int *)(v7 + 48)];
    if (*(_DWORD *)(v7 + 48))
    {
      v9 = *(uint64_t **)(v7 + 40);
      do
      {
        uint64_t v10 = *v9;
        if (*(unsigned char *)(*v9 + 32))
        {
          v11 = [v4 decodeUUIDFromUUIDIndex:*(void *)(v10 + 40)];
        }
        else
        {
          v11 = 0;
        }
        if ((*(unsigned char *)(v10 + 32) & 2) != 0) {
          uint64_t v12 = *(void *)(v10 + 48);
        }
        else {
          uint64_t v12 = 0;
        }
        v13 = +[ICCRIndexElement elementWithInteger:v12 replica:v11];
        [v8 addObject:v13];

        ++v9;
      }
      while (v9 != (uint64_t *)(*(void *)(v7 + 40) + 8 * *(int *)(v7 + 48)));
    }
    uint64_t v14 = [v8 copy];
    indexPath = v5->_indexPath;
    v5->_indexPath = (NSArray *)v14;
  }
  return v5;
}

- (void)encodeWithICCRCoder:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 currentDocumentObjectForEncoding];
  uint64_t v6 = v5;
  if (*(_DWORD *)(v5 + 48) != 9)
  {
    CRDT::Document_DocObject::clear_contents(v5);
    *(_DWORD *)(v6 + 48) = 9;
    operator new();
  }
  uint64_t v7 = *(void *)(v5 + 40);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v8 = [(ICCRIndex *)self indexPath];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = *(void *)v22;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * v12);
        int v14 = *(_DWORD *)(v7 + 52);
        uint64_t v15 = *(int *)(v7 + 48);
        if ((int)v15 >= v14)
        {
          if (v14 == *(_DWORD *)(v7 + 56)) {
            google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v7 + 40, v14 + 1);
          }
          google::protobuf::internal::GenericTypeHandler<CRDT::Index_Element>::New();
        }
        uint64_t v16 = *(void *)(v7 + 40);
        *(_DWORD *)(v7 + 48) = v15 + 1;
        uint64_t v17 = *(void *)(v16 + 8 * v15);
        v18 = [v13 replica];
        uint64_t v19 = [v4 encodeUUIDIndexFromUUID:v18];
        *(_DWORD *)(v17 + 32) |= 1u;
        *(void *)(v17 + 40) = v19;

        uint64_t v20 = [v13 integer];
        *(_DWORD *)(v17 + 32) |= 2u;
        *(void *)(v17 + 48) = v20;
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }
}

- (unint64_t)depth
{
  v2 = [(ICCRIndex *)self indexPath];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)nextIndexForReplica:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [(ICCRIndex *)self indexPath];
  uint64_t v7 = (void *)[v5 initWithArray:v6 copyItems:1];

  unint64_t __buf = 0;
  arc4random_buf(&__buf, 8uLL);
  unint64_t v8 = __buf;
  uint64_t v9 = [v7 lastObject];
  unint64_t v10 = v8 % 0x7FFFFFFFFFFFFLL + 1;
  uint64_t v11 = [v9 integer] + v10;

  if (v11 < 0x2000000000000000)
  {
    uint64_t v12 = [v7 lastObject];
    objc_msgSend(v12, "setInteger:", objc_msgSend(v12, "integer") + v10);
  }
  else
  {
    uint64_t v12 = +[ICCRIndexElement elementWithInteger:v10 replica:v4];
    [v7 addObject:v12];
  }

  v13 = +[ICCRIndex indexWithPath:v7];

  return v13;
}

- (id)previousIndexForReplica:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [(ICCRIndex *)self indexPath];
  uint64_t v7 = (void *)[v5 initWithArray:v6 copyItems:1];

  unint64_t __buf = 0;
  arc4random_buf(&__buf, 8uLL);
  unint64_t v8 = __buf;
  uint64_t v9 = [v7 lastObject];
  unint64_t v10 = v8 % 0x7FFFFFFFFFFFFLL;
  int64_t v11 = [v9 integer] - v10;

  if (v11 > (uint64_t)0xDFFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = [v7 lastObject];
    objc_msgSend(v12, "setInteger:", objc_msgSend(v12, "integer") - v10);
  }
  else
  {
    uint64_t v12 = +[ICCRIndexElement elementWithInteger:-(uint64_t)v10 replica:v4];
    [v7 addObject:v12];
  }

  v13 = +[ICCRIndex indexWithPath:v7];

  return v13;
}

- (id)indexAtDepth:(unint64_t)a3 withInteger:(int64_t)a4 replica:(id)a5
{
  id v8 = a5;
  id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
  unint64_t v10 = [(ICCRIndex *)self indexPath];
  unint64_t v11 = [(ICCRIndex *)self depth];
  if (v11 >= a3) {
    unint64_t v12 = a3;
  }
  else {
    unint64_t v12 = v11;
  }
  v13 = objc_msgSend(v10, "subarrayWithRange:", 0, v12);
  int v14 = (void *)[v9 initWithArray:v13 copyItems:1];

  while (1)
  {

    if ([v14 count] >= a3) {
      break;
    }
    unint64_t v10 = +[ICCRIndexElement elementWithInteger:0 replica:v8];
    [v14 addObject:v10];
  }
  uint64_t v15 = +[ICCRIndexElement elementWithInteger:a4 replica:v8];
  [v14 addObject:v15];

  uint64_t v16 = +[ICCRIndex indexWithPath:v14];

  return v16;
}

+ (id)indexForReplica:(id)a3 betweenIndex:(id)a4 andIndex:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = v9;
  id v48 = v9;
  if (!v8 || !v9)
  {
    if (v8)
    {
      uint64_t v40 = [v8 nextIndexForReplica:v7];
    }
    else
    {
      if (!v9)
      {
        v42 = (void *)MEMORY[0x1E4F1C978];
        v43 = +[ICCRIndexElement elementWithInteger:0 replica:v7];
        v44 = [v42 arrayWithObject:v43];
        v39 = +[ICCRIndex indexWithPath:v44];

        goto LABEL_49;
      }
      uint64_t v40 = [v9 previousIndexForReplica:v7];
    }
    v39 = (void *)v40;
    goto LABEL_49;
  }
  if ([v8 compare:v9] != -1) {
    __assert_rtn("+[ICCRIndex indexForReplica:betweenIndex:andIndex:]", "ICCRIndex.mm", 204, "[before compare:after] == NSOrderedAscending");
  }
  id v45 = v7;
  char v11 = 0;
  uint64_t v12 = -1;
  do
  {
    unint64_t v13 = v12 + 1;
    if (v12 + 1 >= (unint64_t)[v8 depth])
    {
      uint64_t v16 = 0;
    }
    else
    {
      int v14 = [v8 indexPath];
      uint64_t v15 = [v14 objectAtIndexedSubscript:v12 + 1];
      uint64_t v16 = [v15 integer];
    }
    if (v13 >= [v10 depth])
    {
      uint64_t v19 = 0;
    }
    else
    {
      uint64_t v17 = [v10 indexPath];
      v18 = [v17 objectAtIndexedSubscript:v12 + 1];
      uint64_t v19 = [v18 integer];
    }
    uint64_t v20 = 0x2000000000000000;
    if ((v11 & 1) == 0) {
      uint64_t v20 = 0;
    }
    unint64_t v21 = 0xE000000000000000;
    if ((v11 & 1) == 0) {
      unint64_t v21 = 0;
    }
    uint64_t v22 = v20 + v19 + ~(v16 + v21);
    if (v22 == -1 && v13 < [v8 depth] && v13 < objc_msgSend(v10, "depth"))
    {
      v47 = [v8 indexPath];
      v46 = [v47 objectAtIndexedSubscript:v12 + 1];
      long long v23 = [v46 replica];
      long long v24 = [v10 indexPath];
      v25 = [v24 objectAtIndexedSubscript:v12 + 1];
      uint64_t v26 = [v25 replica];
      int v27 = [v23 isEqual:v26] ^ 1;
    }
    else
    {
      LOBYTE(v27) = 0;
    }
    if (v22) {
      char v11 = v27;
    }
    else {
      char v11 = 1;
    }
    ++v12;
    unint64_t v10 = v48;
  }
  while (v22 < 1);
  unint64_t __buf = 0;
  id v7 = v45;
  arc4random_buf(&__buf, 8uLL);
  if (v22 >= 0x7FFFFFFFFFFFFLL) {
    unint64_t v28 = 0x7FFFFFFFFFFFFLL;
  }
  else {
    unint64_t v28 = v22;
  }
  unint64_t v29 = __buf;
  char v30 = arc4random();
  uint64_t v31 = v29 % v28 + 1;
  uint64_t v32 = v31 + v16;
  if (v31 + v16 <= 0x1FFFFFFFFFFFFFFFLL) {
    id v33 = v8;
  }
  else {
    id v33 = v48;
  }
  if (v31 + v16 > 0x1FFFFFFFFFFFFFFFLL) {
    uint64_t v32 = v31 + v16 - 0x3FFFFFFFFFFFFFFFLL;
  }
  int64_t v34 = v19 - v31;
  if (v34 >= (uint64_t)0xE000000000000000) {
    id v35 = v48;
  }
  else {
    id v35 = v8;
  }
  if (v34 < (uint64_t)0xE000000000000000) {
    int64_t v34 = ~v34;
  }
  BOOL v36 = (v30 & 1) == 0;
  if (v30) {
    v37 = v35;
  }
  else {
    v37 = v33;
  }
  if (v36) {
    uint64_t v38 = v32;
  }
  else {
    uint64_t v38 = v34;
  }
  v39 = [v37 indexAtDepth:v12 withInteger:v38 replica:v45];
  unint64_t v10 = v48;
LABEL_49:

  return v39;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ICCRIndex *)self depth];
  unint64_t v6 = [v4 depth];
  if (v5 >= v6) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = v5;
  }
  if (v7)
  {
    uint64_t v8 = 0;
    while (1)
    {
      id v9 = [(ICCRIndex *)self indexPath];
      unint64_t v10 = [v9 objectAtIndexedSubscript:v8];
      char v11 = [v4 indexPath];
      uint64_t v12 = [v11 objectAtIndexedSubscript:v8];
      int64_t v13 = [v10 compare:v12];

      if (v13) {
        break;
      }
      if (v7 == ++v8) {
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    unint64_t v14 = [(ICCRIndex *)self depth];
    if (v14 >= [v4 depth])
    {
      unint64_t v17 = [v4 depth];
      if (v17 >= [(ICCRIndex *)self depth])
      {
        int64_t v13 = 0;
        goto LABEL_16;
      }
      uint64_t v15 = [(ICCRIndex *)self indexPath];
      uint64_t v16 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v4, "depth"));
      int64_t v13 = ([v16 integer] >> 63) | 1;
    }
    else
    {
      uint64_t v15 = [v4 indexPath];
      uint64_t v16 = objc_msgSend(v15, "objectAtIndexedSubscript:", -[ICCRIndex depth](self, "depth"));
      if ([v16 integer] >= 0) {
        int64_t v13 = -1;
      }
      else {
        int64_t v13 = 1;
      }
    }
  }
LABEL_16:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(ICCRIndex *)self indexPath];
  unint64_t v3 = 0;
  uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v3 ^= [*(id *)(*((void *)&v8 + 1) + 8 * v6++) hash];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(ICCRIndex *)self compare:v4] == 0;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  BOOL v5 = [(ICCRIndex *)self indexPath];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setIndexPath:v6];

  return v4;
}

- (id)deltaSince:(id)a3 in:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Cannot calculate deltas for ICCRIndex." userInfo:0];
  objc_exception_throw(v7);
}

- (void)realizeLocalChangesIn:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(ICCRIndex *)self indexPath];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v10 = [v9 replica];
        long long v11 = objc_msgSend(MEMORY[0x1E4F29128], "CR_unserialized");
        int v12 = [v10 isEqual:v11];

        if (v12)
        {
          uint64_t v13 = [v4 replica];
          [v9 setReplica:v13];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (NSString)description
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p ", v5, self];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [(ICCRIndex *)self indexPath];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int v12 = [v11 replica];
        uint64_t v13 = objc_msgSend(v12, "CR_shortDescription");
        [v6 appendFormat:@"(%@:%lld) ", v13, objc_msgSend(v11, "integer")];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  [v6 appendString:@">"];
  return (NSString *)v6;
}

- (NSArray)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end