@interface NSArray(Additions)
- (id)pl_arrayOfUniqueObjectsNotInOrderedSet:()Additions;
- (id)pl_shortDescription;
- (uint64_t)pl_countOfObjectsPassingTest:()Additions;
- (uint64_t)pl_indexOfFirstObjectInRange:()Additions passingTest:;
- (uint64_t)pl_indexOfFirstObjectPassingTest:()Additions;
- (uint64_t)pl_indexOfLastObjectInRange:()Additions passingTest:;
- (uint64_t)pl_indexOfLastObjectPassingTest:()Additions;
@end

@implementation NSArray(Additions)

- (uint64_t)pl_indexOfLastObjectInRange:()Additions passingTest:
{
  id v8 = a5;
  v9 = v8;
  if (a4)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__NSArray_Additions__pl_indexOfLastObjectInRange_passingTest___block_invoke;
    v14[3] = &unk_1E586FBD8;
    id v15 = v8;
    uint64_t v10 = objc_msgSend(a1, "pl_indexOfFirstObjectInRange:passingTest:", a3, a4, v14);
    uint64_t v11 = v10 - 1;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v11 = a4 + a3 - 1;
    }
    if (v10 == a3) {
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v12 = v11;
    }
  }
  else
  {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v12;
}

- (uint64_t)pl_indexOfLastObjectPassingTest:()Additions
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "pl_indexOfLastObjectInRange:passingTest:", 0, objc_msgSend(a1, "count"), v4);

  return v5;
}

- (uint64_t)pl_indexOfFirstObjectInRange:()Additions passingTest:
{
  id v8 = a5;
  v9 = v8;
  if (a4)
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__NSArray_Additions__pl_indexOfFirstObjectInRange_passingTest___block_invoke;
    v14[3] = &unk_1E586B278;
    void v14[4] = a1;
    id v15 = v8;
    v16 = &v17;
    uint64_t v10 = (unsigned int (**)(void, void))MEMORY[0x19F38D650](v14);
    if (((uint64_t (*)(void, unint64_t))v10[2])(v10, a3))
    {
      uint64_t v11 = a3;
    }
    else if (*((unsigned char *)v18 + 24) {
           || (unint64_t v12 = a4 + a3 - 1, (((uint64_t (*)(void, unint64_t))v10[2])(v10, v12) & 1) == 0)
    }
           || *((unsigned char *)v18 + 24))
    {
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      while (a3 + 1 < v12)
      {
        if (v10[2](v10, (v12 + a3) >> 1)) {
          unint64_t v12 = (v12 + a3) >> 1;
        }
        else {
          a3 = (v12 + a3) >> 1;
        }
        uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        if (*((unsigned char *)v18 + 24)) {
          goto LABEL_9;
        }
      }
      uint64_t v11 = v12;
    }
LABEL_9:

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v11;
}

- (uint64_t)pl_indexOfFirstObjectPassingTest:()Additions
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "pl_indexOfFirstObjectInRange:passingTest:", 0, objc_msgSend(a1, "count"), v4);

  return v5;
}

- (id)pl_arrayOfUniqueObjectsNotInOrderedSet:()Additions
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 count];
  if (!v5)
  {
    id v13 = [MEMORY[0x1E4F1C978] array];
LABEL_10:
    v14 = v13;
    goto LABEL_33;
  }
  unint64_t v6 = v5;
  unint64_t v7 = [v4 count];
  if (!v7)
  {
    id v13 = a1;
    goto LABEL_10;
  }
  size_t v8 = v7;
  v30 = &v28;
  if (v7 >= 0x201) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = v7;
  }
  size_t v10 = 8 * v9;
  MEMORY[0x1F4188790](v7);
  unint64_t v12 = (char *)&v28 - v11;
  bzero((char *)&v28 - v11, v10);
  if (v8 > 0x200) {
    unint64_t v12 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero(v12, v10);
  }
  objc_msgSend(v4, "getObjects:range:", v12, 0, v8);
  qsort_b(v12, v8, 8uLL, &__block_literal_global_53254);
  if (v6 >= 0x201) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = v6;
  }
  size_t v17 = 8 * v16;
  MEMORY[0x1F4188790](v15);
  uint64_t v19 = (char *)&v28 - v18;
  bzero((char *)&v28 - v18, v17);
  if (v6 > 0x200) {
    uint64_t v19 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero(v19, v17);
  }
  unint64_t v29 = v6;
  id v31 = v4;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  long long v32 = 0u;
  id v20 = a1;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = 0;
    uint64_t v24 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(v20);
        }
        v26 = *(const void **)(*((void *)&v32 + 1) + 8 * i);
        if (!bsearch_b(v26, v12, v8, 8uLL, &__block_literal_global_53254)) {
          *(void *)&v19[8 * v23++] = v26;
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v22);
  }
  else
  {
    uint64_t v23 = 0;
  }

  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:v23];
  id v4 = v31;
  if (v8 >= 0x201) {
    NSZoneFree(0, v12);
  }
  if (v29 >= 0x201) {
    NSZoneFree(0, v19);
  }
LABEL_33:

  return v14;
}

- (uint64_t)pl_countOfObjectsPassingTest:()Additions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x19F38D3B0]();
  char v17 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v14;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v14 != v10) {
        objc_enumerationMutation(v6);
      }
      v9 += v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * v11), &v17);
      if (v17) {
        break;
      }
      if (v8 == ++v11)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)pl_shortDescription
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28E78] stringWithString:@"{"];
  v3 = (void *)MEMORY[0x19F38D3B0]();
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%p", *(void *)(*((void *)&v13 + 1) + 8 * i));
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = [v4 componentsJoinedByString:@", "];
  [v2 appendString:v11];

  [v2 appendString:@"}"];
  return v2;
}

@end