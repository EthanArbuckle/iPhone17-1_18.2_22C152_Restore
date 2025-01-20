@interface _MNLPRPlate
- (id)charMatching:(void *)a3 alphabetics:(void *)a4 numerics:;
- (id)description;
- (uint64_t)charIndexForTarget:(void *)a3 alphabetics:(void *)a4 numerics:;
- (void)charForTarget:(void *)a3 alphabetics:(void *)a4 numerics:(void *)a5 result:;
- (void)enumerateCharsUsingBlock:(uint64_t)a1;
@end

@implementation _MNLPRPlate

- (void)enumerateCharsUsingBlock:(uint64_t)a1
{
  v3 = a2;
  if (a1)
  {
    unint64_t v4 = 0;
    char v6 = 0;
    do
    {
      if (v4 >= [*(id *)(a1 + 8) count]) {
        break;
      }
      v5 = [*(id *)(a1 + 8) objectAtIndexedSubscript:v4];
      v3[2](v3, v5, v4, &v6);

      ++v4;
    }
    while (!v6);
  }
}

- (void)charForTarget:(void *)a3 alphabetics:(void *)a4 numerics:(void *)a5 result:
{
  id v19 = a2;
  id v9 = a3;
  id v10 = a4;
  v11 = a5;
  int v12 = [v19 charIndex];
  uint64_t v13 = [*(id *)(a1 + 8) count];
  if (v12 < 0)
  {
    if (v13 < 1) {
      goto LABEL_17;
    }
    uint64_t v17 = v13 + 1;
    uint64_t v18 = -1;
    while (1)
    {
      unint64_t v15 = v17 - 2;
      v16 = [*(id *)(a1 + 8) objectAtIndexedSubscript:v17 - 2];
      if (-[_MNLPRPlateCharacter isOfType:alphabetics:numerics:]((uint64_t)v16, [v19 type], v9, v10))
      {
        if (v18 == (int)[v19 charIndex])
        {
LABEL_16:
          v11[2](v11, v16, v15);

          goto LABEL_17;
        }
        --v18;
      }

      if ((unint64_t)--v17 < 2) {
        goto LABEL_17;
      }
    }
  }
  if (v13)
  {
    uint64_t v14 = 0;
    unint64_t v15 = 0;
    do
    {
      v16 = [*(id *)(a1 + 8) objectAtIndexedSubscript:v15];
      if (-[_MNLPRPlateCharacter isOfType:alphabetics:numerics:]((uint64_t)v16, [v19 type], v9, v10))
      {
        if (v14 == (int)[v19 charIndex]) {
          goto LABEL_16;
        }
        ++v14;
      }

      ++v15;
    }
    while (v15 < [*(id *)(a1 + 8) count]);
  }
LABEL_17:
}

- (uint64_t)charIndexForTarget:(void *)a3 alphabetics:(void *)a4 numerics:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __55___MNLPRPlate_charIndexForTarget_alphabetics_numerics___block_invoke;
    v11[3] = &unk_1E60F7518;
    v11[4] = &v12;
    -[_MNLPRPlate charForTarget:alphabetics:numerics:result:](a1, v7, v8, v9, v11);
    a1 = v13[3];
    _Block_object_dispose(&v12, 8);
  }

  return a1;
}

- (id)charMatching:(void *)a3 alphabetics:(void *)a4 numerics:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__5;
    v16 = __Block_byref_object_dispose__5;
    id v17 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49___MNLPRPlate_charMatching_alphabetics_numerics___block_invoke;
    v11[3] = &unk_1E60F7518;
    v11[4] = &v12;
    -[_MNLPRPlate charForTarget:alphabetics:numerics:result:]((uint64_t)a1, v7, v8, v9, v11);
    a1 = (id)v13[5];
    _Block_object_dispose(&v12, 8);
  }
  return a1;
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  char v6 = [v3 stringWithFormat:@"<%@ %p> \"%@\"", v5, self, self->_chars];

  return v6;
}

- (void).cxx_destruct
{
}

@end