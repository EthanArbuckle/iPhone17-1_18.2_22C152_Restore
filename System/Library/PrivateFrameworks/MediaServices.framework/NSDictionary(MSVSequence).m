@interface NSDictionary(MSVSequence)
- (double)msv_reduceIntoCGFloat:()MSVSequence by:;
- (double)msv_reduceIntoDouble:()MSVSequence by:;
- (float)msv_reduceIntoFloat:()MSVSequence by:;
- (id)msv_compactMap:()MSVSequence;
- (id)msv_compactMapKeysAndValues:()MSVSequence;
- (id)msv_compactMapValues:()MSVSequence;
- (id)msv_filter:()MSVSequence;
- (id)msv_firstWhere:()MSVSequence;
- (id)msv_flatMap:()MSVSequence;
- (id)msv_map:()MSVSequence;
- (id)msv_mapKeysAndValues:()MSVSequence;
- (id)msv_mapValues:()MSVSequence;
- (id)msv_reduceIntoObject:()MSVSequence by:;
- (uint64_t)msv_reduceIntoBool:()MSVSequence by:;
- (uint64_t)msv_reduceIntoInt32:()MSVSequence by:;
- (uint64_t)msv_reduceIntoInt64:()MSVSequence by:;
- (uint64_t)msv_reduceIntoInt:()MSVSequence by:;
- (uint64_t)msv_reduceIntoUInt32:()MSVSequence by:;
- (uint64_t)msv_reduceIntoUInt64:()MSVSequence by:;
- (uint64_t)msv_reduceIntoUInt:()MSVSequence by:;
@end

@implementation NSDictionary(MSVSequence)

- (id)msv_compactMap:()MSVSequence
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __44__NSDictionary_MSVSequence__msv_compactMap___block_invoke;
  v13 = &unk_1E5ADA378;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:&v10];
  v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)msv_map:()MSVSequence
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __37__NSDictionary_MSVSequence__msv_map___block_invoke;
  v13 = &unk_1E5ADA378;
  id v14 = v5;
  id v15 = v4;
  id v6 = v4;
  id v7 = v5;
  [a1 enumerateKeysAndObjectsUsingBlock:&v10];
  v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)msv_firstWhere:()MSVSequence
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__4230;
  id v15 = __Block_byref_object_dispose__4231;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__NSDictionary_MSVSequence__msv_firstWhere___block_invoke;
  v8[3] = &unk_1E5ADA3A0;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v11;
  [a1 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)msv_reduceIntoObject:()MSVSequence by:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4230;
  v19 = __Block_byref_object_dispose__4231;
  id v8 = v6;
  id v20 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__NSDictionary_MSVSequence__msv_reduceIntoObject_by___block_invoke;
  v12[3] = &unk_1E5ADA3A0;
  id v14 = &v15;
  id v9 = v7;
  id v13 = v9;
  [a1 enumerateKeysAndObjectsUsingBlock:v12];
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (uint64_t)msv_reduceIntoUInt64:()MSVSequence by:
{
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__NSDictionary_MSVSequence__msv_reduceIntoUInt64_by___block_invoke;
  v10[3] = &unk_1E5ADA3A0;
  v12 = &v13;
  id v7 = v6;
  id v11 = v7;
  [a1 enumerateKeysAndObjectsUsingBlock:v10];
  uint64_t v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (uint64_t)msv_reduceIntoUInt32:()MSVSequence by:
{
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__NSDictionary_MSVSequence__msv_reduceIntoUInt32_by___block_invoke;
  v10[3] = &unk_1E5ADA3A0;
  v12 = &v13;
  id v7 = v6;
  id v11 = v7;
  [a1 enumerateKeysAndObjectsUsingBlock:v10];
  uint64_t v8 = *((unsigned int *)v14 + 6);

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (uint64_t)msv_reduceIntoUInt:()MSVSequence by:
{
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__NSDictionary_MSVSequence__msv_reduceIntoUInt_by___block_invoke;
  v10[3] = &unk_1E5ADA3A0;
  v12 = &v13;
  id v7 = v6;
  id v11 = v7;
  [a1 enumerateKeysAndObjectsUsingBlock:v10];
  uint64_t v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (uint64_t)msv_reduceIntoInt64:()MSVSequence by:
{
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__NSDictionary_MSVSequence__msv_reduceIntoInt64_by___block_invoke;
  v10[3] = &unk_1E5ADA3A0;
  v12 = &v13;
  id v7 = v6;
  id v11 = v7;
  [a1 enumerateKeysAndObjectsUsingBlock:v10];
  uint64_t v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (uint64_t)msv_reduceIntoInt32:()MSVSequence by:
{
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__NSDictionary_MSVSequence__msv_reduceIntoInt32_by___block_invoke;
  v10[3] = &unk_1E5ADA3A0;
  v12 = &v13;
  id v7 = v6;
  id v11 = v7;
  [a1 enumerateKeysAndObjectsUsingBlock:v10];
  uint64_t v8 = *((unsigned int *)v14 + 6);

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (uint64_t)msv_reduceIntoInt:()MSVSequence by:
{
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__NSDictionary_MSVSequence__msv_reduceIntoInt_by___block_invoke;
  v10[3] = &unk_1E5ADA3A0;
  v12 = &v13;
  id v7 = v6;
  id v11 = v7;
  [a1 enumerateKeysAndObjectsUsingBlock:v10];
  uint64_t v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (double)msv_reduceIntoDouble:()MSVSequence by:
{
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  double v16 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__NSDictionary_MSVSequence__msv_reduceIntoDouble_by___block_invoke;
  v10[3] = &unk_1E5ADA3A0;
  v12 = &v13;
  id v7 = v6;
  id v11 = v7;
  [a1 enumerateKeysAndObjectsUsingBlock:v10];
  double v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (double)msv_reduceIntoCGFloat:()MSVSequence by:
{
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  double v16 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__NSDictionary_MSVSequence__msv_reduceIntoCGFloat_by___block_invoke;
  v10[3] = &unk_1E5ADA3A0;
  v12 = &v13;
  id v7 = v6;
  id v11 = v7;
  [a1 enumerateKeysAndObjectsUsingBlock:v10];
  double v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (float)msv_reduceIntoFloat:()MSVSequence by:
{
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = (float *)&v13;
  uint64_t v15 = 0x2020000000;
  float v16 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__NSDictionary_MSVSequence__msv_reduceIntoFloat_by___block_invoke;
  v10[3] = &unk_1E5ADA3A0;
  v12 = &v13;
  id v7 = v6;
  id v11 = v7;
  [a1 enumerateKeysAndObjectsUsingBlock:v10];
  float v8 = v14[6];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (uint64_t)msv_reduceIntoBool:()MSVSequence by:
{
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__NSDictionary_MSVSequence__msv_reduceIntoBool_by___block_invoke;
  v10[3] = &unk_1E5ADA3A0;
  v12 = &v13;
  id v7 = v6;
  id v11 = v7;
  [a1 enumerateKeysAndObjectsUsingBlock:v10];
  uint64_t v8 = *((unsigned __int8 *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)msv_flatMap:()MSVSequence
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __41__NSDictionary_MSVSequence__msv_flatMap___block_invoke;
  uint64_t v13 = &unk_1E5ADA378;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:&v10];
  uint64_t v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)msv_filter:()MSVSequence
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __40__NSDictionary_MSVSequence__msv_filter___block_invoke;
  uint64_t v13 = &unk_1E5ADA378;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:&v10];
  uint64_t v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)msv_compactMapValues:()MSVSequence
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __50__NSDictionary_MSVSequence__msv_compactMapValues___block_invoke;
  uint64_t v13 = &unk_1E5ADA378;
  id v14 = v5;
  id v15 = v4;
  id v6 = v4;
  id v7 = v5;
  [a1 enumerateKeysAndObjectsUsingBlock:&v10];
  uint64_t v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)msv_compactMapKeysAndValues:()MSVSequence
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __57__NSDictionary_MSVSequence__msv_compactMapKeysAndValues___block_invoke;
  uint64_t v13 = &unk_1E5ADA378;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:&v10];
  uint64_t v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)msv_mapValues:()MSVSequence
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __43__NSDictionary_MSVSequence__msv_mapValues___block_invoke;
  uint64_t v13 = &unk_1E5ADA378;
  id v14 = v5;
  id v15 = v4;
  id v6 = v4;
  id v7 = v5;
  [a1 enumerateKeysAndObjectsUsingBlock:&v10];
  uint64_t v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)msv_mapKeysAndValues:()MSVSequence
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __50__NSDictionary_MSVSequence__msv_mapKeysAndValues___block_invoke;
  uint64_t v13 = &unk_1E5ADA378;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:&v10];
  uint64_t v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

@end