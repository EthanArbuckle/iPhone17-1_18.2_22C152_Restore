@interface NSArray(MRAdditions)
- (id)changeDescriptionTo:()MRAdditions keyBlock:isUpdatedBlock:descriptionBlock:;
- (id)mr_compactMap:()MRAdditions;
- (id)mr_filter:()MRAdditions;
- (id)mr_first:()MRAdditions;
- (id)mr_flatMap:()MRAdditions;
- (id)mr_map:()MRAdditions;
- (uint64_t)mr_all:()MRAdditions;
- (uint64_t)mr_any:()MRAdditions;
- (uint64_t)mr_containsAnyOf:()MRAdditions;
@end

@implementation NSArray(MRAdditions)

- (id)mr_map:()MRAdditions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v5 addObjectsFromArray:v11];
        }
        else if (v11)
        {
          objc_msgSend(v5, "addObject:", v11, (void)v13);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)mr_filter:()MRAdditions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (v4[2](v4, v11)) {
          objc_msgSend(v5, "addObject:", v11, (void)v13);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)mr_first:()MRAdditions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = a3;
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

- (id)changeDescriptionTo:()MRAdditions keyBlock:isUpdatedBlock:descriptionBlock:
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  long long v11 = a4;
  id v70 = a5;
  id v71 = a6;
  unint64_t v12 = [a1 count];
  if (v12 <= [v10 count]) {
    long long v13 = v10;
  }
  else {
    long long v13 = a1;
  }
  uint64_t v14 = [v13 count];
  v69 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v14];
  v68 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v14];
  v67 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v14];
  long long v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v14];
  v75 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  obuint64_t j = a1;
  uint64_t v16 = [obj countByEnumeratingWithState:&v107 objects:v117 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v108;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v108 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = v11[2](v11, *(void *)(*((void *)&v107 + 1) + 8 * i));
        if (!v20)
        {
          v73 = _MRLogForCategory(0);
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
            -[NSArray(MRAdditions) changeDescriptionTo:keyBlock:isUpdatedBlock:descriptionBlock:]((uint64_t)v71);
          }
          id v40 = 0;
          goto LABEL_67;
        }
        v21 = (void *)v20;
        [v75 addObject:v20];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v107 objects:v117 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  obuint64_t j = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:obj forKeys:v75];
  v73 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v72 = v10;
  uint64_t v22 = [v72 countByEnumeratingWithState:&v103 objects:v116 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v104;
    while (2)
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v104 != v24) {
          objc_enumerationMutation(v72);
        }
        uint64_t v26 = v11[2](v11, *(void *)(*((void *)&v103 + 1) + 8 * j));
        if (!v26)
        {
          v61 = _MRLogForCategory(0);
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
            -[NSArray(MRAdditions) changeDescriptionTo:keyBlock:isUpdatedBlock:descriptionBlock:]((uint64_t)v71);
          }
          id v40 = 0;
          goto LABEL_66;
        }
        v27 = (void *)v26;
        [v73 addObject:v26];
      }
      uint64_t v23 = [v72 countByEnumeratingWithState:&v103 objects:v116 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }
  v65 = v11;

  v28 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:v72 forKeys:v73];
  v96[0] = MEMORY[0x1E4F143A8];
  v96[1] = 3221225472;
  v96[2] = __85__NSArray_MRAdditions__changeDescriptionTo_keyBlock_isUpdatedBlock_descriptionBlock___block_invoke;
  v96[3] = &unk_1E57D8F60;
  v29 = obj;
  v97 = v29;
  id v101 = v70;
  id v66 = v67;
  id v98 = v66;
  id v30 = v71;
  id v102 = v30;
  id v63 = v68;
  id v99 = v63;
  id v64 = v69;
  id v100 = v64;
  id v72 = v28;
  [v28 enumerateKeysAndObjectsUsingBlock:v96];
  v31 = [MEMORY[0x1E4F1CA80] setWithArray:v75];
  v32 = [MEMORY[0x1E4F1CAD0] setWithArray:v73];
  [v31 minusSet:v32];

  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v33 = v31;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v92 objects:v115 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v93;
    do
    {
      for (uint64_t k = 0; k != v35; ++k)
      {
        if (*(void *)v93 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = [v29 objectForKeyedSubscript:*(void *)(*((void *)&v92 + 1) + 8 * k)];
        v39 = (*((void (**)(id, void *))v30 + 2))(v30, v38);
        [v15 addObject:v39];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v92 objects:v115 count:16];
    }
    while (v35);
  }

  if ([v66 count] || objc_msgSend(v64, "count") || objc_msgSend(v15, "count"))
  {
    id v40 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v41 = v64;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v88 objects:v114 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v89;
      do
      {
        for (uint64_t m = 0; m != v43; ++m)
        {
          if (*(void *)v89 != v44) {
            objc_enumerationMutation(v41);
          }
          [v40 appendFormat:@"+ %@\n", *(void *)(*((void *)&v88 + 1) + 8 * m)];
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v88 objects:v114 count:16];
      }
      while (v43);
    }

    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v46 = v63;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v84 objects:v113 count:16];
    long long v11 = v65;
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v85;
      do
      {
        for (uint64_t n = 0; n != v48; ++n)
        {
          if (*(void *)v85 != v49) {
            objc_enumerationMutation(v46);
          }
          [v40 appendFormat:@"  %@\n", *(void *)(*((void *)&v84 + 1) + 8 * n)];
        }
        uint64_t v48 = [v46 countByEnumeratingWithState:&v84 objects:v113 count:16];
      }
      while (v48);
    }

    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v51 = v66;
    uint64_t v52 = [v51 countByEnumeratingWithState:&v80 objects:v112 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v81;
      do
      {
        for (iuint64_t i = 0; ii != v53; ++ii)
        {
          if (*(void *)v81 != v54) {
            objc_enumerationMutation(v51);
          }
          [v40 appendFormat:@"* %@\n", *(void *)(*((void *)&v80 + 1) + 8 * ii)];
        }
        uint64_t v53 = [v51 countByEnumeratingWithState:&v80 objects:v112 count:16];
      }
      while (v53);
    }

    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v56 = v15;
    uint64_t v57 = [v56 countByEnumeratingWithState:&v76 objects:v111 count:16];
    if (v57)
    {
      uint64_t v58 = v57;
      uint64_t v59 = *(void *)v77;
      do
      {
        for (juint64_t j = 0; jj != v58; ++jj)
        {
          if (*(void *)v77 != v59) {
            objc_enumerationMutation(v56);
          }
          [v40 appendFormat:@"- %@\n", *(void *)(*((void *)&v76 + 1) + 8 * jj)];
        }
        uint64_t v58 = [v56 countByEnumeratingWithState:&v76 objects:v111 count:16];
      }
      while (v58);
    }
  }
  else
  {
    id v40 = 0;
    long long v11 = v65;
  }

  v61 = v97;
LABEL_66:

LABEL_67:

  return v40;
}

- (uint64_t)mr_any:()MRAdditions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * i)))
        {
          uint64_t v6 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (uint64_t)mr_all:()MRAdditions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (!v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v9)))
        {
          uint64_t v10 = 0;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 1;
LABEL_11:

  return v10;
}

- (uint64_t)mr_containsAnyOf:()MRAdditions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(a1, "containsObject:", *(void *)(*((void *)&v11 + 1) + 8 * v8), (void)v11))
        {
          uint64_t v9 = 1;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 0;
LABEL_11:

  return v9;
}

- (id)mr_flatMap:()MRAdditions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
        if (v11) {
          objc_msgSend(v5, "addObjectsFromArray:", v11, (void)v13);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)mr_compactMap:()MRAdditions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
        if (v11) {
          objc_msgSend(v5, "addObject:", v11, (void)v13);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)changeDescriptionTo:()MRAdditions keyBlock:isUpdatedBlock:descriptionBlock:.cold.1(uint64_t a1)
{
  v1 = (*(void (**)(void))(a1 + 16))();
  OUTLINED_FUNCTION_0_14(&dword_194F3C000, v2, v3, "[changeDescription] Nil key returned for object: %{public}@", v4, v5, v6, v7, 2u);
}

@end