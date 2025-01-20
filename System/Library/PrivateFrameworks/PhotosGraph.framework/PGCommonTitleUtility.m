@interface PGCommonTitleUtility
+ (BOOL)containsCelebrationForDateNodes:(id)a3 holidayName:(id *)a4 titleGenerationContext:(id)a5 graph:(id)a6;
+ (BOOL)isLargeCountryForAddressNode:(id)a3 locationHelper:(id)a4;
+ (_NSRange)_closestSpaceMatchFromMatches:(id)a3 withUsedNameRange:(_NSRange)a4 searchForward:(BOOL)a5;
+ (id)addressNodesFromMomentNodes:(id)a3;
+ (id)bestAddressNodeForMomentNodes:(id)a3;
+ (id)dateNodesFromMomentNodes:(id)a3;
+ (id)holidayNameForDateNodes:(id)a3;
+ (id)locationLabelForDimension:(unint64_t)a3;
+ (id)titleWithLineBreakForTitle:(id)a3;
+ (id)titleWithLineBreakForTitle:(id)a3 andUsedNames:(id)a4;
+ (id)titleWithNoLineBreakSpaceForTitle:(id)a3 andUsedNames:(id)a4;
+ (unint64_t)dimensionForLabel:(id)a3;
+ (void)startAndEndDateNodeFromDateNodes:(id)a3 startDateNode:(id *)a4 endDateNode:(id *)a5;
@end

@implementation PGCommonTitleUtility

+ (unint64_t)dimensionForLabel:(id)a3
{
  id v3 = a3;
  if (dimensionForLabel__onceToken != -1) {
    dispatch_once(&dimensionForLabel__onceToken, &__block_literal_global_289);
  }
  uint64_t v4 = [(id)dimensionForLabel__dimensionLabelMapping indexOfObject:v3];
  if (v4) {
    BOOL v5 = v4 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = v4;
  }

  return v6;
}

void __42__PGCommonTitleUtility_dimensionForLabel___block_invoke()
{
  v2[10] = *MEMORY[0x1E4F143B8];
  v2[0] = @"None";
  v2[1] = @"Area";
  v2[2] = @"Address";
  v2[3] = @"Number";
  v2[4] = @"Street";
  v2[5] = @"District";
  v2[6] = @"City";
  v2[7] = @"County";
  v2[8] = @"State";
  v2[9] = @"Country";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:10];
  v1 = (void *)dimensionForLabel__dimensionLabelMapping;
  dimensionForLabel__dimensionLabelMapping = v0;
}

+ (id)locationLabelForDimension:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 1uLL:
      id v3 = @"Area";
      goto LABEL_14;
    case 2uLL:
      id v3 = @"Address";
      goto LABEL_14;
    case 3uLL:
      id v3 = @"Number";
      goto LABEL_14;
    case 4uLL:
      id v3 = @"Street";
      goto LABEL_14;
    case 5uLL:
      id v3 = @"District";
      goto LABEL_14;
    case 6uLL:
      id v3 = @"City";
      goto LABEL_14;
    case 7uLL:
      id v3 = @"County";
      goto LABEL_14;
    case 8uLL:
      id v3 = @"State";
      goto LABEL_14;
    case 9uLL:
      id v3 = @"Country";
LABEL_14:
      v7 = v3;
      break;
    default:
      BOOL v5 = +[PGLogging sharedLogging];
      unint64_t v6 = [v5 loggingConnection];

      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v9 = 134217984;
        unint64_t v10 = a3;
        _os_log_error_impl(&dword_1D1805000, v6, OS_LOG_TYPE_ERROR, "Couldn't match dimension %lu to label", (uint8_t *)&v9, 0xCu);
      }

      id v3 = 0;
      break;
  }
  return v3;
}

+ (id)titleWithLineBreakForTitle:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  BOOL v5 = [v3 stringByTrimmingCharactersInSet:v4];

  if ((unint64_t)[v5 length] >= 0xC)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    unint64_t v17 = 0;
    unint64_t v17 = (unint64_t)[v5 length] >> 1;
    uint64_t v6 = [v5 length];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__PGCommonTitleUtility_titleWithLineBreakForTitle___block_invoke;
    v13[3] = &unk_1E68E5590;
    v13[4] = &v14;
    objc_msgSend(v5, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 3, v13);
    unint64_t v7 = v15[3];
    if (v7 < [v5 length])
    {
      v8 = objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithCharactersInString:", @"([{");
      unint64_t v9 = v15[3];
      if (v9 >= 2)
      {
        do
        {
          if (!objc_msgSend(v8, "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", v9 - 1))) {
            break;
          }
          unint64_t v9 = v15[3] - 1;
          v15[3] = v9;
        }
        while (v9 > 1);
      }
    }
    unint64_t v10 = v15[3];
    if (v10 && v10 < [v5 length])
    {
      uint64_t v11 = objc_msgSend(v5, "stringByReplacingCharactersInRange:withString:", v15[3], 0, @"\n");

      BOOL v5 = (void *)v11;
    }
    _Block_object_dispose(&v14, 8);
  }

  return v5;
}

uint64_t __51__PGCommonTitleUtility_titleWithLineBreakForTitle___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unsigned char *a7)
{
  uint64_t v7 = *(void *)(*(void *)(result + 32) + 8);
  unint64_t v8 = *(void *)(v7 + 24);
  if (v8 >= a5 && v8 - a5 < a6)
  {
    if (v8 >= a3 + (a4 >> 1)) {
      unint64_t v10 = a6;
    }
    else {
      unint64_t v10 = 0;
    }
    *(void *)(v7 + 24) = a5 + v10;
    *a7 = 1;
  }
  return result;
}

+ (id)titleWithLineBreakForTitle:(id)a3 andUsedNames:(id)a4
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  unint64_t v87 = [v5 length];
  if (v87 <= 0xB)
  {
    id v7 = v5;
    goto LABEL_113;
  }
  id v101 = 0;
  unint64_t v8 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"[\\r\\n\\t\\f\\v ]+" options:64 error:&v101];
  id v82 = v101;
  v83 = v8;
  v89 = objc_msgSend(v8, "matchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  id v91 = (id)objc_claimAutoreleasedReturnValue();
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v84 = v6;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v97 objects:v103 count:16];
  if (!v9) {
    goto LABEL_45;
  }
  uint64_t v10 = v9;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v98;
  do
  {
    uint64_t v13 = 0;
    uint64_t v85 = v11;
    uint64_t v86 = -v11;
    do
    {
      if (*(void *)v98 != v12) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void **)(*((void *)&v97 + 1) + 8 * v13);
      uint64_t v15 = [v5 rangeOfString:v14];
      unint64_t v17 = v15;
      uint64_t v18 = v16;
      if (v15) {
        BOOL v19 = v15 == 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        BOOL v19 = 1;
      }
      if (v19)
      {
LABEL_13:
        uint64_t v20 = 0;
        goto LABEL_14;
      }
      uint64_t v28 = objc_msgSend(a1, "_closestSpaceMatchFromMatches:withUsedNameRange:searchForward:", v89, v15, v16, 0);
      if (v28 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v20 = 0;
        if (v86 != v13) {
          goto LABEL_14;
        }
        uint64_t v30 = 0;
        unint64_t v31 = v17;
      }
      else
      {
        uint64_t v30 = v28 + v29;
        unint64_t v31 = v17 - (v28 + v29);
        BOOL v32 = v17 <= v28 + v29 || v30 == 0x7FFFFFFFFFFFFFFFLL;
        if (v32 || v17 >= [v5 length]) {
          goto LABEL_13;
        }
      }
      uint64_t v20 = objc_msgSend(v5, "substringWithRange:", v30, v31);
LABEL_14:
      if (v17 == 0x7FFFFFFFFFFFFFFFLL
        || (unint64_t v21 = v17 + v18, v17 + v18 >= [v5 length])
        || ((unint64_t v22 = objc_msgSend(a1, "_closestSpaceMatchFromMatches:withUsedNameRange:searchForward:", v89, v17, v18, 1), v22 != 0x7FFFFFFFFFFFFFFFLL)? (v23 = v22 > v21): (v23 = 0), !v23 || v21 == 0x7FFFFFFFFFFFFFFFLL || (v24 = v22, v22 >= objc_msgSend(v5, "length"))))
      {
        uint64_t v25 = 0;
      }
      else
      {
        uint64_t v25 = objc_msgSend(v5, "substringWithRange:", v21, v24 - v21);
      }
      if (v25 | v20)
      {
        if (!v20) {
          uint64_t v20 = (uint64_t)&stru_1F283BC78;
        }
        if (v25) {
          v27 = (__CFString *)v25;
        }
        else {
          v27 = &stru_1F283BC78;
        }
        id v26 = [NSString stringWithFormat:@"%@%@%@", v20, v14, v27];
      }
      else
      {
        id v26 = v14;
      }
      [v91 addObject:v26];

      ++v13;
    }
    while (v10 != v13);
    uint64_t v11 = v85 + v10;
    uint64_t v33 = [obj countByEnumeratingWithState:&v97 objects:v103 count:16];
    uint64_t v10 = v33;
  }
  while (v33);
LABEL_45:

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v34 = v91;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v93 objects:v102 count:16];
  if (!v35)
  {

LABEL_111:
    id v7 = [a1 titleWithLineBreakForTitle:v5];
    goto LABEL_112;
  }
  uint64_t v36 = v35;
  unint64_t v37 = vcvtps_u32_f32((float)v87 * 0.5);
  unint64_t v38 = -1;
  uint64_t v39 = *(void *)v94;
  unint64_t v40 = -1;
  uint64_t v41 = -1;
  unint64_t v42 = -1;
  id v92 = v34;
  do
  {
    for (uint64_t i = 0; i != v36; ++i)
    {
      if (*(void *)v94 != v39) {
        objc_enumerationMutation(v92);
      }
      uint64_t v44 = [v5 rangeOfString:*(void *)(*((void *)&v93 + 1) + 8 * i)];
      if (v44 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v46 = v44 + v45;
        if ((uint64_t)(v37 - v44) >= 0) {
          unint64_t v47 = v37 - v44;
        }
        else {
          unint64_t v47 = v44 - v37;
        }
        unint64_t v48 = v37 - v46;
        if ((uint64_t)(v37 - v46) < 0) {
          unint64_t v48 = v46 - v37;
        }
        if (v47 >= v38) {
          unint64_t v49 = v38;
        }
        else {
          unint64_t v49 = v47;
        }
        if (v47 >= v38) {
          uint64_t v50 = v41;
        }
        else {
          uint64_t v50 = v44;
        }
        BOOL v51 = v47 >= v40;
        if (v47 >= v40) {
          unint64_t v47 = v40;
        }
        else {
          unint64_t v49 = v40;
        }
        if (v51)
        {
          unint64_t v52 = v42;
        }
        else
        {
          uint64_t v50 = v42;
          unint64_t v52 = v44;
        }
        if (v44)
        {
          unint64_t v38 = v49;
          unint64_t v40 = v47;
          uint64_t v41 = v50;
          unint64_t v42 = v52;
        }
        if (v46 != v87)
        {
          if (v48 >= v40)
          {
            if (v48 < v38)
            {
              unint64_t v38 = v48;
              uint64_t v41 = v44 + v45;
            }
          }
          else
          {
            unint64_t v38 = v40;
            unint64_t v40 = v48;
            uint64_t v41 = v42;
            unint64_t v42 = v44 + v45;
          }
        }
      }
    }
    id v34 = v92;
    uint64_t v36 = [v92 countByEnumeratingWithState:&v93 objects:v102 count:16];
  }
  while (v36);

  if (v42 == -1) {
    goto LABEL_111;
  }
  if (v41 == -1) {
    unint64_t v53 = v42;
  }
  else {
    unint64_t v53 = v41;
  }
  unint64_t v54 = 0x1E4F28000;
  if (v87 > 0x16)
  {
LABEL_87:
    v57 = 0;
    goto LABEL_88;
  }
  if (v42 <= v53) {
    unint64_t v55 = v53;
  }
  else {
    unint64_t v55 = v42;
  }
  id v56 = [v5 substringToIndex:v55];
  v57 = [v5 substringFromIndex:v55];
  double v58 = (double)(unint64_t)[v56 length];
  if ((double)(unint64_t)[v57 length] * 1.5 < v58)
  {

    goto LABEL_87;
  }
  if (!v56)
  {
LABEL_88:
    v59 = [v5 substringToIndex:v42];
    v60 = [v5 substringFromIndex:v42];
    v61 = [v5 substringToIndex:v53];
    v62 = [v5 substringFromIndex:v53];
    uint64_t v63 = [v59 length];
    if ((uint64_t)(v63 - v37) >= 0) {
      unint64_t v64 = v63 - v37;
    }
    else {
      unint64_t v64 = v37 - v63;
    }
    uint64_t v65 = [v61 length];
    if ((uint64_t)(v65 - v37) >= 0) {
      unint64_t v66 = v65 - v37;
    }
    else {
      unint64_t v66 = v37 - v65;
    }
    v67 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    uint64_t v68 = [v60 rangeOfCharacterFromSet:v67 options:0];
    uint64_t v69 = [v62 rangeOfCharacterFromSet:v67 options:0];
    if (v68) {
      BOOL v70 = v64 >= v66;
    }
    else {
      BOOL v70 = 1;
    }
    BOOL v71 = !v70 || v69 == 0;
    if (v71) {
      v72 = v59;
    }
    else {
      v72 = v61;
    }
    if (v71) {
      v73 = v60;
    }
    else {
      v73 = v62;
    }
    id v56 = v72;
    id v74 = v73;
    id v34 = v92;
    id v75 = v74;

    unint64_t v54 = 0x1E4F28000uLL;
    v57 = v75;
  }
  v76 = [*(id *)(v54 + 2952) whitespaceCharacterSet];
  v77 = objc_msgSend(v57, "pg_stringByTrailingCharactersInSet:options:", v76, 1);

  if (([v77 isEqualToString:v57] & 1) == 0)
  {
    v78 = objc_msgSend(v57, "substringToIndex:", objc_msgSend(v57, "length") - objc_msgSend(v77, "length"));
    id v79 = v77;

    uint64_t v80 = [v56 stringByAppendingString:v78];

    id v56 = (id)v80;
    v57 = v79;
  }
  id v7 = [NSString stringWithFormat:@"%@%@%@", v56, @"\n", v57];

LABEL_112:
  id v6 = v84;

LABEL_113:
  return v7;
}

+ (id)titleWithNoLineBreakSpaceForTitle:(id)a3 andUsedNames:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      uint64_t v11 = v5;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
        uint64_t v13 = [v12 stringByReplacingOccurrencesOfString:@" " withString:@" "];
        id v5 = [v11 stringByReplacingOccurrencesOfString:v12 withString:v13];

        ++v10;
        uint64_t v11 = v5;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (_NSRange)_closestSpaceMatchFromMatches:(id)a3 withUsedNameRange:(_NSRange)a4 searchForward:(BOOL)a5
{
  BOOL v31 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = a3;
  uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v36;
    NSUInteger v10 = location + length;
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v33 = 0;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(obj);
        }
        v13.NSUInteger location = [*(id *)(*((void *)&v35 + 1) + 8 * i) range];
        if (v13.location != 0x7FFFFFFFFFFFFFFFLL)
        {
          NSUInteger v14 = v13.location;
          NSUInteger v15 = v13.length;
          v43.NSUInteger location = location;
          v43.NSUInteger length = length;
          NSUInteger v16 = NSIntersectionRange(v13, v43).length;
          v41.NSUInteger location = v14;
          v41.NSUInteger length = v15;
          v44.NSUInteger location = location;
          v44.NSUInteger length = length;
          NSRange v17 = NSUnionRange(v41, v44);
          NSUInteger v18 = v14 - v10 + v15;
          if (location <= v14)
          {
            NSUInteger v19 = location + length;
          }
          else
          {
            NSUInteger v18 = location - v14;
            NSUInteger v19 = v14;
          }
          if (v17.location == location && v17.length == length)
          {
            NSUInteger v18 = v15;
            NSUInteger v21 = v14;
          }
          else
          {
            NSUInteger v21 = v19;
          }
          if (v16) {
            NSUInteger v22 = v18;
          }
          else {
            NSUInteger v22 = v15;
          }
          if (v16) {
            NSUInteger v23 = v21;
          }
          else {
            NSUInteger v23 = v14;
          }
          if (v31)
          {
            if (v23 < v10) {
              continue;
            }
          }
          else if (location <= v23)
          {
            continue;
          }
          int64_t v24 = location - v23;
          if ((uint64_t)(location - v23) < 0) {
            int64_t v24 = v23 - location;
          }
          uint64_t v25 = location - (v22 + v23);
          if (v25 < 0) {
            uint64_t v25 = v22 + v23 - location;
          }
          if (v24 >= (unint64_t)v25) {
            int64_t v24 = v25;
          }
          BOOL v26 = v24 < v11;
          if (v24 < v11) {
            uint64_t v11 = v24;
          }
          NSUInteger v27 = v33;
          if (v26) {
            NSUInteger v27 = v22;
          }
          uint64_t v28 = v32;
          if (v26) {
            uint64_t v28 = v23;
          }
          uint64_t v32 = v28;
          NSUInteger v33 = v27;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (!v8) {
        goto LABEL_43;
      }
    }
  }
  uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v33 = 0;
LABEL_43:

  NSUInteger v29 = v32;
  NSUInteger v30 = v33;
  result.NSUInteger length = v30;
  result.NSUInteger location = v29;
  return result;
}

+ (void)startAndEndDateNodeFromDateNodes:(id)a3 startDateNode:(id *)a4 endDateNode:(id *)a5
{
  NSUInteger v18 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = a3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    NSUInteger v10 = 0;
    uint64_t v21 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        NSRange v13 = objc_msgSend(v12, "localDate", v18);
        if (!v7 || [v7 compare:v13] == 1)
        {
          id v14 = v13;

          id v15 = v12;
          uint64_t v7 = v14;
          NSUInteger v10 = v15;
        }
        if (!v8 || [v8 compare:v13] == -1)
        {
          id v16 = v13;

          id v17 = v12;
          uint64_t v8 = v16;
          uint64_t v9 = v17;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    NSUInteger v10 = 0;
  }
  if (v18) {
    *NSUInteger v18 = v10;
  }
  if (a5) {
    *a5 = v9;
  }
}

+ (id)bestAddressNodeForMomentNodes:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v3);
        }
        NSUInteger v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = [v10 bestAddressNode];
        uint64_t v12 = [v11 anyEdgeFromNode:v10];
        if (!v6 || ([v6 relevance], double v14 = v13, objc_msgSend(v12, "relevance"), v14 < v15))
        {
          id v16 = v12;

          id v17 = v11;
          uint64_t v6 = v16;
          uint64_t v7 = v17;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)dateNodesFromMomentNodes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        NSUInteger v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dateNodes", (void)v12);
        [v4 unionSet:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)holidayNameForDateNodes:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "collection", (void)v18);
        uint64_t v9 = [v8 holidayNodes];

        NSUInteger v10 = [v9 array];
        uint64_t v11 = [v10 sortedArrayUsingComparator:&__block_literal_global_5708];

        long long v12 = [v11 firstObject];
        long long v13 = v12;
        if (v12)
        {
          long long v14 = [v12 name];
          long long v15 = v14;
          if (v14 && [v14 length])
          {
            id v16 = [MEMORY[0x1E4F76CA8] localizedNameForName:v15];

            goto LABEL_14;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v16 = 0;
LABEL_14:

  return v16;
}

uint64_t __48__PGCommonTitleUtility_holidayNameForDateNodes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 name];
  uint64_t v6 = [v4 name];

  if ([v5 length])
  {
    uint64_t v7 = [MEMORY[0x1E4F76CA8] localizedNameForName:v5];
  }
  else
  {
    uint64_t v7 = &stru_1F283BC78;
  }
  if ([v6 length])
  {
    uint64_t v8 = [MEMORY[0x1E4F76CA8] localizedNameForName:v6];
  }
  else
  {
    uint64_t v8 = &stru_1F283BC78;
  }
  if ([(__CFString *)v7 length] || ![(__CFString *)v8 length])
  {
    if ([(__CFString *)v8 length] || ![(__CFString *)v7 length]) {
      uint64_t v9 = [(__CFString *)v7 localizedCompare:v8];
    }
    else {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

+ (BOOL)containsCelebrationForDateNodes:(id)a3 holidayName:(id *)a4 titleGenerationContext:(id)a5 graph:(id)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v34 = a5;
  id v33 = a6;
  uint64_t v48 = 0;
  unint64_t v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v9)
  {
    id v35 = 0;
    uint64_t v32 = *(void *)v45;
    NSUInteger v10 = &selRef_cacheWithPhotoLibrary_error_;
LABEL_3:
    uint64_t v39 = 0;
    NSUInteger v29 = v10[240];
    uint64_t v31 = v9;
    while (1)
    {
      if (*(void *)v45 != v32) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void **)(*((void *)&v44 + 1) + 8 * v39);
      context = (void *)MEMORY[0x1D25FED50]();
      long long v12 = [v11 collection];
      long long v13 = [v12 holidayNodes];

      long long v14 = +[PGGraphEdgeCollection edgesToNodes:v13];
      long long v36 = [v14 holidayNodes];
      long long v15 = [v36 holidayNames];
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v17 = [v11 localDate];
      long long v18 = [v34 holidayService];
      long long v19 = [v33 infoNode];
      long long v20 = [v19 locale];
      long long v21 = [v20 countryCode];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __97__PGCommonTitleUtility_containsCelebrationForDateNodes_holidayName_titleGenerationContext_graph___block_invoke;
      v40[3] = &unk_1E68E5548;
      unint64_t v42 = &v48;
      NSRange v43 = a4;
      id v22 = v16;
      id v41 = v22;
      [v18 enumerateEventRulesWithNames:v15 betweenLocalDate:v17 andLocalDate:v17 supportedCountryCode:v21 usingBlock:v40];

      int v23 = *((unsigned __int8 *)v49 + 24);
      if (*((unsigned char *)v49 + 24)) {
        BOOL v24 = a4 == 0;
      }
      else {
        BOOL v24 = 1;
      }
      if (!v24)
      {
        long long v25 = [v22 sortedArrayUsingSelector:v29];
        uint64_t v26 = [v25 firstObject];

        id v35 = (id)v26;
      }

      NSUInteger v10 = &selRef_cacheWithPhotoLibrary_error_;
      if (v23) {
        break;
      }
      if (v31 == ++v39)
      {
        uint64_t v9 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v35 = 0;
  }

  if (a4) {
    *a4 = v35;
  }
  BOOL v27 = *((unsigned char *)v49 + 24) != 0;

  _Block_object_dispose(&v48, 8);
  return v27;
}

void __97__PGCommonTitleUtility_containsCelebrationForDateNodes_holidayName_titleGenerationContext_graph___block_invoke(void *a1, void *a2)
{
  uint64_t v2 = a1[6];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  if (v2)
  {
    id v3 = (void *)a1[4];
    id v4 = [a2 localizedName];
    [v3 addObject:v4];
  }
}

+ (BOOL)isLargeCountryForAddressNode:(id)a3 locationHelper:(id)a4
{
  id v4 = [a4 countryNodeFromAddressNode:a3];
  uint64_t v5 = [v4 anyNode];

  uint64_t v6 = [v5 name];
  LOBYTE(v4) = +[PGCountrySize isLargeCountry:v6];

  return (char)v4;
}

+ (id)addressNodesFromMomentNodes:(id)a3
{
  id v3 = a3;
  id v4 = [v3 anyObject];
  uint64_t v5 = [v4 graph];

  if (v5)
  {
    uint64_t v6 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithSet:v3 graph:v5];
    uint64_t v7 = [(PGGraphMomentNodeCollection *)v6 addressNodes];
    id v8 = [v7 set];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v8;
}

@end