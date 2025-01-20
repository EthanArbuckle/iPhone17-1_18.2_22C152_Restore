@interface PKDiff
+ (BOOL)supportsSecureCoding;
- (BOOL)getHunkForKey:(id)a3 oldValue:(id *)a4 newValue:(id *)a5 message:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDiff:(id)a3;
- (NSData)passManifestHash;
- (NSString)passUniqueID;
- (PKDiff)init;
- (PKDiff)initWithCoder:(id)a3;
- (id)anyKey;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)hunkCount;
- (unint64_t)_hunkIndexForKey:(id)a3;
- (unint64_t)hash;
- (void)addHunkWithKey:(id)a3 oldValue:(id)a4 newValue:(id)a5 message:(id)a6;
- (void)addHunksFromDiff:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateHunks:(id)a3;
- (void)key:(id *)a3 oldValue:(id *)a4 newValue:(id *)a5 message:(id *)a6 forHunkAtIndex:(int64_t)a7;
- (void)removeHunkForKey:(id)a3;
- (void)setPassManifestHash:(id)a3;
- (void)setPassUniqueID:(id)a3;
@end

@implementation PKDiff

- (PKDiff)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKDiff;
  v2 = [(PKDiff *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    hunks = v2->_hunks;
    v2->_hunks = v3;
  }
  return v2;
}

- (void)addHunkWithKey:(id)a3 oldValue:(id)a4 newValue:(id)a5 message:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v18 = 0;
  BOOL v14 = [(PKDiff *)self getHunkForKey:v10 oldValue:&v18 newValue:0 message:0];
  id v15 = v18;
  if (v14)
  {
    [(PKDiff *)self removeHunkForKey:v10];
    if (([v15 isEqual:v12] & 1) == 0) {
      [(PKDiff *)self addHunkWithKey:v10 oldValue:v15 newValue:v12 message:v13];
    }
  }
  else if (v10)
  {
    hunks = self->_hunks;
    v17 = +[PKDiffHunk hunkWithKey:v10 oldValue:v11 newValue:v12 message:v13];
    [(NSMutableArray *)hunks addObject:v17];
  }
}

- (int64_t)hunkCount
{
  return [(NSMutableArray *)self->_hunks count];
}

- (void)key:(id *)a3 oldValue:(id *)a4 newValue:(id *)a5 message:(id *)a6 forHunkAtIndex:(int64_t)a7
{
  id v11 = [(NSMutableArray *)self->_hunks objectAtIndex:a7];
  id v12 = v11;
  if (a3)
  {
    *a3 = [v11 key];
    id v11 = v12;
  }
  if (a4)
  {
    *a4 = [v12 valueOld];
    id v11 = v12;
  }
  if (a5)
  {
    *a5 = [v12 valueNew];
    id v11 = v12;
  }
  if (a6)
  {
    *a6 = [v12 message];
    id v11 = v12;
  }
}

- (void)enumerateHunks:(id)a3
{
  v4 = (void (**)(id, void *, void *, void *, void *, unsigned char *))a3;
  uint64_t v5 = [(NSMutableArray *)self->_hunks count];
  if (v5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = v5 - 1;
    do
    {
      v8 = [(NSMutableArray *)self->_hunks objectAtIndex:v6];
      unsigned __int8 v14 = 0;
      v9 = [v8 key];
      id v10 = [v8 valueOld];
      id v11 = [v8 valueNew];
      id v12 = [v8 message];
      v4[2](v4, v9, v10, v11, v12, &v14);

      LODWORD(v9) = v14;
      if (v9) {
        break;
      }
    }
    while (v7 != v6++);
  }
}

- (id)description
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __21__PKDiff_description__block_invoke;
  v7[3] = &unk_1E56E88C8;
  id v8 = v3;
  id v4 = v3;
  [(PKDiff *)self enumerateHunks:v7];
  uint64_t v5 = [NSString stringWithFormat:@"<%@:%p card:%@ %@>", objc_opt_class(), self, self->_passUniqueID, v4];

  return v5;
}

void __21__PKDiff_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [NSString stringWithFormat:@"%@: %@ -> %@ (%@)", a2, a3, a4, a5];
  [v5 addObject:v6];
}

- (BOOL)getHunkForKey:(id)a3 oldValue:(id *)a4 newValue:(id *)a5 message:(id *)a6
{
  unint64_t v10 = [(PKDiff *)self _hunkIndexForKey:a3];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = [(NSMutableArray *)self->_hunks objectAtIndex:v10];
    id v12 = v11;
    if (a4)
    {
      *a4 = [v11 valueOld];
    }
    if (a5)
    {
      *a5 = [v12 valueNew];
    }
    if (a6)
    {
      *a6 = [v12 message];
    }
  }
  return v10 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)removeHunkForKey:(id)a3
{
  unint64_t v4 = [(PKDiff *)self _hunkIndexForKey:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = v4;
    hunks = self->_hunks;
    [(NSMutableArray *)hunks removeObjectAtIndex:v5];
  }
}

- (void)addHunksFromDiff:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __27__PKDiff_addHunksFromDiff___block_invoke;
  v3[3] = &unk_1E56E88C8;
  v3[4] = self;
  [a3 enumerateHunks:v3];
}

uint64_t __27__PKDiff_addHunksFromDiff___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) addHunkWithKey:a2 oldValue:a3 newValue:a4 message:a5];
}

- (id)anyKey
{
  v2 = [(NSMutableArray *)self->_hunks lastObject];
  v3 = [v2 key];

  return v3;
}

- (unint64_t)hash
{
  v2 = [(NSMutableArray *)self->_hunks arrayByAddingObject:self->_passUniqueID];
  unint64_t v3 = PKCombinedHash(17, v2);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKDiff *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKDiff *)self isEqualToDiff:v5];

  return v6;
}

- (BOOL)isEqualToDiff:(id)a3
{
  unint64_t v4 = a3;
  if ([(NSMutableArray *)self->_hunks isEqual:v4[1]]) {
    char v5 = [(NSString *)self->_passUniqueID isEqual:v4[2]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    NSComparisonResult v5 = [(NSString *)self->_passUniqueID caseInsensitiveCompare:*((void *)v4 + 2)];
    if (v5 == NSOrderedSame)
    {
      unint64_t v6 = [(NSMutableArray *)self->_hunks count];
      if (v6 > [*((id *)v4 + 1) count])
      {
LABEL_5:
        NSComparisonResult v5 = NSOrderedDescending;
        goto LABEL_9;
      }
      unint64_t v9 = [(NSMutableArray *)self->_hunks count];
      if (v9 >= [*((id *)v4 + 1) count])
      {
        if ([(NSMutableArray *)self->_hunks count])
        {
          unint64_t v10 = 0;
          do
          {
            id v11 = [(NSMutableArray *)self->_hunks objectAtIndexedSubscript:v10];
            id v12 = [*((id *)v4 + 1) objectAtIndexedSubscript:v10];
            NSComparisonResult v5 = [v11 compare:v12];

            if (v5) {
              break;
            }
            ++v10;
          }
          while (v10 < [(NSMutableArray *)self->_hunks count]);
        }
        else
        {
          NSComparisonResult v5 = NSOrderedSame;
        }
      }
      else
      {
        NSComparisonResult v5 = NSOrderedAscending;
      }
    }
  }
  else
  {
    unint64_t v7 = objc_opt_class();
    if (v7 < objc_opt_class()) {
      NSComparisonResult v5 = NSOrderedAscending;
    }
    else {
      NSComparisonResult v5 = NSOrderedDescending;
    }
  }
LABEL_9:

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDiff)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKDiff;
  NSComparisonResult v5 = [(PKDiff *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueID"];
    passUniqueID = v5->_passUniqueID;
    v5->_passUniqueID = (NSString *)v6;

    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    unint64_t v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"hunks"];
    hunks = v5->_hunks;
    v5->_hunks = (NSMutableArray *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  hunks = self->_hunks;
  id v5 = a3;
  [v5 encodeObject:hunks forKey:@"hunks"];
  [v5 encodeObject:self->_passUniqueID forKey:@"uniqueID"];
}

- (unint64_t)_hunkIndexForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableArray *)self->_hunks count];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    while (1)
    {
      id v8 = [(NSMutableArray *)self->_hunks objectAtIndex:v7];
      uint64_t v9 = [v8 key];
      char v10 = [v9 isEqualToString:v4];

      if (v10) {
        break;
      }
      if (v6 == ++v7) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (NSString)passUniqueID
{
  return self->_passUniqueID;
}

- (void)setPassUniqueID:(id)a3
{
}

- (NSData)passManifestHash
{
  return self->_passManifestHash;
}

- (void)setPassManifestHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passManifestHash, 0);
  objc_storeStrong((id *)&self->_passUniqueID, 0);
  objc_storeStrong((id *)&self->_hunks, 0);
}

@end