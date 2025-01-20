@interface NSCompoundPredicate(VideosUICore)
- (id)vui_predicateWithSubpredicateFilterBlock:()VideosUICore;
@end

@implementation NSCompoundPredicate(VideosUICore)

- (id)vui_predicateWithSubpredicateFilterBlock:()VideosUICore
{
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6 = [a1 subpredicates];
  uint64_t v7 = [a1 compoundPredicateType];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__NSCompoundPredicate_VideosUICore__vui_predicateWithSubpredicateFilterBlock___block_invoke;
  v13[3] = &unk_1E6DDD2F0;
  id v8 = v4;
  id v15 = v8;
  v16 = &v17;
  id v9 = v5;
  id v14 = v9;
  [v6 enumerateObjectsUsingBlock:v13];
  if (*((unsigned char *)v18 + 24))
  {
    objc_msgSend(MEMORY[0x1E4F28F60], "vui_predicateWithSubpredicates:type:", v9, v7);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = a1;
  }
  v11 = v10;

  _Block_object_dispose(&v17, 8);
  return v11;
}

@end