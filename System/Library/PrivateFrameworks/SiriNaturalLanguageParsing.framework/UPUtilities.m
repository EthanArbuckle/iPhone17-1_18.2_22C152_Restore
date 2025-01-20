@interface UPUtilities
+ (BOOL)checkFileExistence:(id)a3 error:(id *)a4;
+ (_NSRange)rangeFromStart:(unint64_t)a3 end:(unint64_t)a4;
+ (basic_string<char16_t,)nSStringToU16String:(std::allocator<char16_t>> *__return_ptr)retstr;
+ (id)higherLevelEntityLabelFromParentLabel:(id)a3 childLabel:(id)a4;
+ (id)intermediateNodeRepresentations:(id)a3;
+ (id)rootNodeRepresentationForIntent:(id)a3 andEntities:(id)a4;
+ (id)stdU16ToNSString:(const void *)a3;
@end

@implementation UPUtilities

+ (id)rootNodeRepresentationForIntent:(id)a3 andEntities:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v19 = a4;
  v21 = [MEMORY[0x1E4F1CA48] array];
  v22 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v19;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v9 isHigherLevelEntity])
        {
          [v22 addObject:v9];
        }
        else
        {
          v10 = [UPResultLeafNode alloc];
          v11 = [v9 label];
          v12 = [v9 text];
          v13 = [v9 semanticValue];
          v14 = [(UPResultLeafNode *)v10 initWithLabel:v11 andText:v12 andSemanticValue:v13];

          [v21 addObject:v14];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  v15 = [UPResultRootNode alloc];
  v16 = +[UPUtilities intermediateNodeRepresentations:v22];
  v17 = [(UPResultRootNode *)v15 initWithLabel:v20 intermediateNodes:v16 directLeafNodes:v21];

  return v17;
}

+ (id)intermediateNodeRepresentations:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v40 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v3);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  obuint64_t j = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v50 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v8 = [v7 higherLevelParentLabel];
        v9 = [v7 higherLevelChildLabel];
        v10 = [UPResultLeafNode alloc];
        v11 = [v7 text];
        v12 = [v7 semanticValue];
        v13 = [(UPResultLeafNode *)v10 initWithLabel:v9 andText:v11 andSemanticValue:v12];

        v14 = [v40 objectForKey:v8];
        BOOL v15 = v14 == 0;

        if (v15)
        {
          v16 = [MEMORY[0x1E4F1CA60] dictionary];
          [v40 setObject:v16 forKey:v8];
        }
        v17 = [v40 objectForKey:v8];
        v18 = [v7 groupId];
        if (v18) {
          [v7 groupId];
        }
        else {
        id v19 = [NSNumber numberWithLong:0x7FFFFFFFFFFFFFFFLL];
        }

        id v20 = [v17 objectForKey:v19];
        BOOL v21 = v20 == 0;

        if (v21)
        {
          v22 = [MEMORY[0x1E4F1CA48] array];
          [v17 setObject:v22 forKey:v19];
        }
        long long v23 = [v17 objectForKey:v19];
        [v23 addObject:v13];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v4);
  }

  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v38 = v40;
  uint64_t v25 = [v38 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v25)
  {
    uint64_t v36 = *(void *)v46;
    do
    {
      uint64_t v37 = v25;
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v46 != v36) {
          objc_enumerationMutation(v38);
        }
        uint64_t v27 = *(void *)(*((void *)&v45 + 1) + 8 * j);
        uint64_t v28 = [v38 objectForKey:v27];
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v29 = v28;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v41 objects:v53 count:16];
        if (v30)
        {
          uint64_t v31 = *(void *)v42;
          do
          {
            for (uint64_t k = 0; k != v30; ++k)
            {
              if (*(void *)v42 != v31) {
                objc_enumerationMutation(v29);
              }
              v33 = [v29 objectForKey:*(void *)(*((void *)&v41 + 1) + 8 * k)];
              v34 = [[UPResultIntermediateNode alloc] initWithLabel:v27 andLeafNodes:v33];
              [v24 addObject:v34];
            }
            uint64_t v30 = [v29 countByEnumeratingWithState:&v41 objects:v53 count:16];
          }
          while (v30);
        }
      }
      uint64_t v25 = [v38 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v25);
  }

  return v24;
}

+ (id)higherLevelEntityLabelFromParentLabel:(id)a3 childLabel:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v7 appendString:v5];
  [v7 appendString:@"."];
  [v7 appendString:v6];

  return v7;
}

+ (id)stdU16ToNSString:(const void *)a3
{
  uint64_t v3 = *((void *)a3 + 1);
  if (*((char *)a3 + 23) >= 0)
  {
    uint64_t v4 = *((unsigned __int8 *)a3 + 23);
  }
  else
  {
    a3 = *(const void **)a3;
    uint64_t v4 = v3;
  }
  return (id)[NSString stringWithCharacters:a3 length:v4];
}

+ (basic_string<char16_t,)nSStringToU16String:(std::allocator<char16_t>> *__return_ptr)retstr
{
  id v9 = v1;
  std::basic_string<char16_t>::size_type v3 = [v9 lengthOfBytesUsingEncoding:10];
  retstr->var0.var0.var0.var1.var0 = 0;
  retstr->var0.var0.var0.var1.var1 = 0;
  *((void *)&retstr->var0.var0.var0.var1 + 2) = 0;
  std::basic_string<char16_t>::resize((std::basic_string<char16_t> *)retstr, v3, v4);
  if (*((char *)&retstr->var0.var0.var0.var1 + 23) >= 0) {
    var0 = retstr;
  }
  else {
    var0 = (basic_string<char16_t, std::char_traits<char16_t>, std::allocator<char16_t>> *)retstr->var0.var0.var0.var1.var0;
  }
  objc_msgSend(v9, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", var0, v3, 0, 10, 0, 0, v3, 0);
  std::basic_string<char16_t>::size_type v6 = [v9 length];
  std::basic_string<char16_t>::resize((std::basic_string<char16_t> *)retstr, v6, v7);

  return result;
}

+ (_NSRange)rangeFromStart:(unint64_t)a3 end:(unint64_t)a4
{
  NSUInteger v5 = a4 - a3;
  result.length = v5;
  result.location = a3;
  return result;
}

+ (BOOL)checkFileExistence:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  std::basic_string<char16_t>::size_type v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v6, "fileExistsAtPath:", v11, (void)v17) & 1) == 0)
        {
          if (a4)
          {
            v21[0] = *MEMORY[0x1E4F28568];
            v13 = [MEMORY[0x1E4F28B50] mainBundle];
            v14 = [v13 localizedStringForKey:@"Could not open file path" value:&stru_1F23628D0 table:0];
            v21[1] = @"FilePath";
            v22[0] = v14;
            v22[1] = v11;
            BOOL v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

            *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F289A0] code:-3001 userInfo:v15];
          }
          BOOL v12 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_13:

  return v12;
}

@end