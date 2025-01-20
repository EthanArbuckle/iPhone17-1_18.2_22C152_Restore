@interface NSArray(MSVSequence)
- (double)msv_reduceIntoCGFloat:()MSVSequence by:;
- (double)msv_reduceIntoCGFloat:()MSVSequence enumeratedBy:;
- (double)msv_reduceIntoDouble:()MSVSequence by:;
- (double)msv_reduceIntoDouble:()MSVSequence enumeratedBy:;
- (float)msv_reduceIntoFloat:()MSVSequence by:;
- (float)msv_reduceIntoFloat:()MSVSequence enumeratedBy:;
- (id)msv_compactMap:()MSVSequence;
- (id)msv_enumeratedCompactMap:()MSVSequence;
- (id)msv_enumeratedMap:()MSVSequence;
- (id)msv_filter:()MSVSequence;
- (id)msv_firstWhere:()MSVSequence;
- (id)msv_flatMap:()MSVSequence;
- (id)msv_map:()MSVSequence;
- (id)msv_prefixUpToIndex:()MSVSequence;
- (id)msv_reduceIntoObject:()MSVSequence by:;
- (id)msv_reduceIntoObject:()MSVSequence enumeratedBy:;
- (id)msv_suffixFromIndex:()MSVSequence;
- (uint64_t)msv_reduceIntoBool:()MSVSequence by:;
- (uint64_t)msv_reduceIntoBool:()MSVSequence enumeratedBy:;
- (uint64_t)msv_reduceIntoInt32:()MSVSequence by:;
- (uint64_t)msv_reduceIntoInt32:()MSVSequence enumeratedBy:;
- (uint64_t)msv_reduceIntoInt64:()MSVSequence by:;
- (uint64_t)msv_reduceIntoInt64:()MSVSequence enumeratedBy:;
- (uint64_t)msv_reduceIntoInt:()MSVSequence by:;
- (uint64_t)msv_reduceIntoInt:()MSVSequence enumeratedBy:;
- (uint64_t)msv_reduceIntoUInt32:()MSVSequence by:;
- (uint64_t)msv_reduceIntoUInt32:()MSVSequence enumeratedBy:;
- (uint64_t)msv_reduceIntoUInt64:()MSVSequence by:;
- (uint64_t)msv_reduceIntoUInt64:()MSVSequence enumeratedBy:;
- (uint64_t)msv_reduceIntoUInt:()MSVSequence by:;
- (uint64_t)msv_reduceIntoUInt:()MSVSequence enumeratedBy:;
@end

@implementation NSArray(MSVSequence)

- (id)msv_filter:()MSVSequence
{
  v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  if ([a1 count])
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      v8 = [a1 objectAtIndexedSubscript:v7];
      if ((v4[2](v4, v8) & 1) == 0) {
        [v5 removeObjectAtIndex:v7 - v6++];
      }

      ++v7;
    }
    while (v7 < [a1 count]);
  }
  v9 = (void *)[v5 copy];

  return v9;
}

- (id)msv_compactMap:()MSVSequence
{
  v4 = (void *)MEMORY[0x1A62426F0](a3);
  v5 = objc_msgSend(a1, "msv_enumeratedCompactMap:", v4);

  return v5;
}

- (id)msv_flatMap:()MSVSequence
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 count];
  id v6 = a1;
  unint64_t v7 = (void (**)(id, void))v4;
  v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v5];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = v7[2](v7, *(void *)(*((void *)&v17 + 1) + 8 * i));
        objc_msgSend(v8, "addObjectsFromArray:", v14, (void)v17);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  v15 = (void *)[v8 copy];
  return v15;
}

- (id)msv_map:()MSVSequence
{
  id v4 = (void *)MEMORY[0x1A62426F0](a3);
  uint64_t v5 = objc_msgSend(a1, "msv_enumeratedMap:", v4);

  return v5;
}

- (id)msv_enumeratedCompactMap:()MSVSequence
{
  id v4 = a3;
  uint64_t v5 = (void *)[a1 mutableCopy];
  if ([a1 count])
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      v8 = [a1 objectAtIndexedSubscript:v7];
      uint64_t v9 = v4[2](v4, v8, v7);
      uint64_t v10 = (void *)v9;
      if (v9)
      {
        if ((void *)v9 != v8) {
          [v5 setObject:v9 atIndexedSubscript:v7 - v6];
        }
      }
      else
      {
        [v5 removeObjectAtIndex:v7 - v6++];
      }

      ++v7;
    }
    while (v7 < [a1 count]);
  }
  uint64_t v11 = (void *)[v5 copy];

  return v11;
}

- (id)msv_enumeratedMap:()MSVSequence
{
  id v4 = a3;
  uint64_t v5 = (void *)[a1 mutableCopy];
  if ([a1 count])
  {
    unint64_t v6 = 0;
    do
    {
      unint64_t v7 = [a1 objectAtIndexedSubscript:v6];
      v8 = v4[2](v4, v7, v6);
      if (v8 != v7) {
        [v5 setObject:v8 atIndexedSubscript:v6];
      }

      ++v6;
    }
    while (v6 < [a1 count]);
  }
  uint64_t v9 = (void *)[v5 copy];

  return v9;
}

- (id)msv_firstWhere:()MSVSequence
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = a1;
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (v4[2](v4, v9))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)msv_reduceIntoObject:()MSVSequence enumeratedBy:
{
  id v6 = a3;
  uint64_t v7 = a4;
  id v8 = v6;
  uint64_t v9 = v8;
  if ([a1 count])
  {
    unint64_t v10 = 0;
    long long v11 = v8;
    do
    {
      long long v12 = [a1 objectAtIndexedSubscript:v10];
      uint64_t v9 = v7[2](v7, v11, v12, v10);

      ++v10;
      long long v11 = v9;
    }
    while (v10 < [a1 count]);
  }

  return v9;
}

- (uint64_t)msv_reduceIntoUInt64:()MSVSequence enumeratedBy:
{
  id v6 = a4;
  if ([a1 count])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [a1 objectAtIndexedSubscript:v7];
      a3 = v6[2](v6, a3, v8, v7);

      ++v7;
    }
    while (v7 < [a1 count]);
  }

  return a3;
}

- (uint64_t)msv_reduceIntoUInt32:()MSVSequence enumeratedBy:
{
  id v6 = a4;
  if ([a1 count])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [a1 objectAtIndexedSubscript:v7];
      a3 = v6[2](v6, a3, v8, v7);

      ++v7;
    }
    while (v7 < [a1 count]);
  }

  return a3;
}

- (uint64_t)msv_reduceIntoUInt:()MSVSequence enumeratedBy:
{
  id v6 = a4;
  if ([a1 count])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [a1 objectAtIndexedSubscript:v7];
      a3 = v6[2](v6, a3, v8, v7);

      ++v7;
    }
    while (v7 < [a1 count]);
  }

  return a3;
}

- (uint64_t)msv_reduceIntoInt64:()MSVSequence enumeratedBy:
{
  id v6 = a4;
  if ([a1 count])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [a1 objectAtIndexedSubscript:v7];
      a3 = v6[2](v6, a3, v8, v7);

      ++v7;
    }
    while (v7 < [a1 count]);
  }

  return a3;
}

- (uint64_t)msv_reduceIntoInt32:()MSVSequence enumeratedBy:
{
  id v6 = a4;
  if ([a1 count])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [a1 objectAtIndexedSubscript:v7];
      a3 = v6[2](v6, a3, v8, v7);

      ++v7;
    }
    while (v7 < [a1 count]);
  }

  return a3;
}

- (uint64_t)msv_reduceIntoInt:()MSVSequence enumeratedBy:
{
  id v6 = a4;
  if ([a1 count])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [a1 objectAtIndexedSubscript:v7];
      a3 = v6[2](v6, a3, v8, v7);

      ++v7;
    }
    while (v7 < [a1 count]);
  }

  return a3;
}

- (double)msv_reduceIntoDouble:()MSVSequence enumeratedBy:
{
  id v6 = a4;
  if ([a1 count])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [a1 objectAtIndexedSubscript:v7];
      a2 = v6[2](v6, v8, v7, a2);

      ++v7;
    }
    while (v7 < [a1 count]);
  }

  return a2;
}

- (double)msv_reduceIntoCGFloat:()MSVSequence enumeratedBy:
{
  id v6 = a4;
  if ([a1 count])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [a1 objectAtIndexedSubscript:v7];
      a2 = v6[2](v6, v8, v7, a2);

      ++v7;
    }
    while (v7 < [a1 count]);
  }

  return a2;
}

- (float)msv_reduceIntoFloat:()MSVSequence enumeratedBy:
{
  id v6 = a4;
  if ([a1 count])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [a1 objectAtIndexedSubscript:v7];
      a2 = v6[2](v6, v8, v7, a2);

      ++v7;
    }
    while (v7 < [a1 count]);
  }

  return a2;
}

- (uint64_t)msv_reduceIntoBool:()MSVSequence enumeratedBy:
{
  id v6 = a4;
  if ([a1 count])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [a1 objectAtIndexedSubscript:v7];
      a3 = v6[2](v6, a3 & 1, v8, v7);

      ++v7;
    }
    while (v7 < [a1 count]);
  }

  return a3;
}

- (id)msv_reduceIntoObject:()MSVSequence by:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = a4;
  id v8 = v6;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = a1;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  long long v11 = v8;
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v18;
    long long v11 = v8;
    do
    {
      uint64_t v14 = 0;
      v15 = v11;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v9);
        }
        long long v11 = v7[2](v7, v15, *(void *)(*((void *)&v17 + 1) + 8 * v14));

        ++v14;
        v15 = v11;
      }
      while (v12 != v14);
      uint64_t v12 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v11;
}

- (uint64_t)msv_reduceIntoUInt64:()MSVSequence by:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        a3 = v6[2](v6, a3, *(void *)(*((void *)&v13 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  return a3;
}

- (uint64_t)msv_reduceIntoUInt32:()MSVSequence by:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        a3 = v6[2](v6, a3, *(void *)(*((void *)&v13 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  return a3;
}

- (uint64_t)msv_reduceIntoUInt:()MSVSequence by:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        a3 = v6[2](v6, a3, *(void *)(*((void *)&v13 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  return a3;
}

- (uint64_t)msv_reduceIntoInt64:()MSVSequence by:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        a3 = v6[2](v6, a3, *(void *)(*((void *)&v13 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  return a3;
}

- (uint64_t)msv_reduceIntoInt32:()MSVSequence by:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        a3 = v6[2](v6, a3, *(void *)(*((void *)&v13 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  return a3;
}

- (uint64_t)msv_reduceIntoInt:()MSVSequence by:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        a3 = v6[2](v6, a3, *(void *)(*((void *)&v13 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  return a3;
}

- (double)msv_reduceIntoDouble:()MSVSequence by:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        a2 = v6[2](v6, *(void *)(*((void *)&v13 + 1) + 8 * v11++), a2);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  return a2;
}

- (double)msv_reduceIntoCGFloat:()MSVSequence by:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        a2 = v6[2](v6, *(void *)(*((void *)&v13 + 1) + 8 * v11++), a2);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  return a2;
}

- (float)msv_reduceIntoFloat:()MSVSequence by:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        a2 = v6[2](v6, *(void *)(*((void *)&v13 + 1) + 8 * v11++), a2);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  return a2;
}

- (uint64_t)msv_reduceIntoBool:()MSVSequence by:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        a3 = v6[2](v6, a3 & 1, *(void *)(*((void *)&v13 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  return a3;
}

- (id)msv_suffixFromIndex:()MSVSequence
{
  if (a3)
  {
    if ([a1 count] <= a3)
    {
      id v5 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      objc_msgSend(a1, "subarrayWithRange:", a3, objc_msgSend(a1, "count") - a3);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v5 = a1;
  }
  return v5;
}

- (id)msv_prefixUpToIndex:()MSVSequence
{
  if ([a1 count] == a3)
  {
    id v5 = a1;
  }
  else
  {
    objc_msgSend(a1, "subarrayWithRange:", 0, a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

@end