@interface NSObject
@end

@implementation NSObject

void __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke(uint64_t a1, objc_class *a2, char a3)
{
  [*(id *)(a1 + 32) appendFormat:@"%@ ", a2];
  if ((*(unsigned char *)(a1 + 40) & 2) != 0)
  {
    if ((objc_class *)objc_opt_class() != a2 || (*(unsigned char *)(a1 + 40) & 4) != 0)
    {
      v6 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v10 = MEMORY[0x1E4F143A8];
      uint64_t v11 = 3221225472;
      v12 = __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_2;
      v13 = &unk_1E5AD9AD8;
      id v7 = v6;
      id v14 = v7;
      _MSVEnumerateClassProtocols(a2, &v10);
      if ([v7 count])
      {
        v8 = *(void **)(a1 + 32);
        v9 = [v7 componentsJoinedByString:@", "];
        [v8 appendFormat:@"<%@> ", v9, v10, v11, v12, v13];
      }
    }
    else
    {
      [*(id *)(a1 + 32) appendString:@"<NSObject, ...> "];
    }
  }
  if ((a3 & 1) == 0) {
    [*(id *)(a1 + 32) appendString:@": "];
  }
}

void __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_3(uint64_t a1, objc_class *a2)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v12 = __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_4;
  v13 = &unk_1E5AD9B28;
  v3 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  v15 = a2;
  v4 = v3;
  v5 = v11;
  unsigned int outCount = 0;
  v6 = class_copyIvarList(a2, &outCount);
  if (outCount)
  {
    for (unint64_t i = 0;
          i < outCount;
          v12((uint64_t)v5, (uint64_t)v6[i++], (uint64_t)Name, (char *)TypeEncoding, (unsigned int *)&v4[Offset]))
    {
      TypeEncoding = ivar_getTypeEncoding(v6[i]);
      Name = ivar_getName(v6[i]);
      ptrdiff_t Offset = ivar_getOffset(v6[i]);
    }
  }
  free(v6);
}

void __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_5(uint64_t a1, objc_class *a2)
{
  if ((objc_class *)objc_opt_class() != a2 || (*(unsigned char *)(a1 + 57) & 4) != 0)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v12 = __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_6;
    v13 = &unk_1E5AD9B78;
    id v14 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    v16 = a2;
    v4 = v11;
    unsigned int outCount = 0;
    Name = class_getName(a2);
    MetaClass = objc_getMetaClass(Name);
    id v7 = class_copyPropertyList(MetaClass, &outCount);
    if (outCount)
    {
      for (unint64_t i = 0; i < outCount; v12(v4, v7[i++], 1))
        ;
    }
    free(v7);
    v9 = class_copyPropertyList(a2, &outCount);
    if (outCount)
    {
      for (unint64_t j = 0; j < outCount; v12(v4, v9[j++], 0))
        ;
    }
    free(v9);
  }
}

void __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_7(uint64_t a1, objc_class *a2)
{
  if ((objc_class *)objc_opt_class() != a2 || (*(unsigned char *)(a1 + 49) & 4) != 0)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_8;
    v28[3] = &unk_1E5AD9AD8;
    id v5 = v4;
    id v29 = v5;
    _MSVEnumerateClassProtocols(a2, v28);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v21 = __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_10;
    v22 = &unk_1E5AD9BF0;
    uint64_t v26 = *(void *)(a1 + 48);
    id v23 = *(id *)(a1 + 32);
    id v6 = v5;
    id v24 = v6;
    id v25 = *(id *)(a1 + 40);
    v27 = a2;
    id v7 = v20;
    unsigned int outCount = 0;
    Name = class_getName(a2);
    MetaClass = objc_getMetaClass(Name);
    uint64_t v10 = class_copyMethodList(MetaClass, &outCount);
    if (outCount)
    {
      for (unint64_t i = 0; i < outCount; v21((uint64_t)v7, v10[i++], 1))
        ;
    }
    free(v10);
    v12 = class_copyMethodList(a2, &outCount);
    if (outCount)
    {
      for (unint64_t j = 0; j < outCount; v21((uint64_t)v7, v12[j++], 0))
        ;
    }
    free(v12);

    if ((*(unsigned char *)(a1 + 51) & 0x10) != 0)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_11;
      v16[3] = &unk_1E5AD9C18;
      v18 = a2;
      id v14 = *(id *)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 48);
      id v17 = v14;
      uint64_t v19 = v15;
      [v6 enumerateKeysAndObjectsUsingBlock:v16];
    }
  }
}

void __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  v30 = __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_9;
  v31 = &unk_1E5AD9BC8;
  id v5 = v4;
  id v32 = v5;
  id v6 = (Protocol *)v3;
  id v7 = &v28;
  unsigned int outCount = 0;
  v8 = protocol_copyMethodDescriptionList(v6, 1, 0, &outCount);
  v9 = v8;
  if (outCount)
  {
    unint64_t v10 = 0;
    p_types = &v8->types;
    do
    {
      ((void (*)(uint64_t *, void, char *, uint64_t, uint64_t))v30)(v7, *(p_types - 1), *p_types, 1, 1);
      ++v10;
      p_types += 2;
    }
    while (v10 < outCount);
  }
  free(v9);
  v12 = protocol_copyMethodDescriptionList(v6, 1, 1, &outCount);
  v13 = v12;
  if (outCount)
  {
    unint64_t v14 = 0;
    uint64_t v15 = &v12->types;
    do
    {
      ((void (*)(uint64_t *, void, char *, void, uint64_t))v30)(v7, *(v15 - 1), *v15, 0, 1);
      ++v14;
      v15 += 2;
    }
    while (v14 < outCount);
  }
  free(v13);
  v16 = protocol_copyMethodDescriptionList(v6, 0, 0, &outCount);
  id v17 = v16;
  if (outCount)
  {
    unint64_t v18 = 0;
    uint64_t v19 = &v16->types;
    do
    {
      ((void (*)(uint64_t *, void, char *, uint64_t, void))v30)(v7, *(v19 - 1), *v19, 1, 0);
      ++v18;
      v19 += 2;
    }
    while (v18 < outCount);
  }
  free(v17);
  v20 = protocol_copyMethodDescriptionList(v6, 0, 1, &outCount);
  v21 = v20;
  if (outCount)
  {
    unint64_t v22 = 0;
    id v23 = &v20->types;
    do
    {
      ((void (*)(uint64_t *, void, char *, uint64_t, void))v30)(v7, *(v23 - 1), *v23, 1, 0);
      ++v22;
      v23 += 2;
    }
    while (v22 < outCount);
  }
  free(v21);

  id v24 = *(void **)(a1 + 32);
  id v25 = NSString;
  Name = protocol_getName(v6);
  v27 = objc_msgSend(v25, "stringWithUTF8String:", Name, v28, v29);
  [v24 setObject:v5 forKeyedSubscript:v27];
}

void __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_10(uint64_t a1, Method m, int a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  Name = method_getName(m);
  id v7 = NSStringFromSelector(Name);
  if ((![v7 isEqualToString:@".cxx_destruct"] || (*(unsigned char *)(a1 + 59) & 4) != 0)
    && ([*(id *)(a1 + 32) containsObject:v7] & 1) == 0)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v8 = [*(id *)(a1 + 40) allValues];
    uint64_t v24 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v24)
    {
      uint64_t v9 = *(void *)v31;
      int v22 = a3;
      id v25 = v8;
      uint64_t v23 = *(void *)v31;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(v8);
          }
          uint64_t v11 = *(void **)(*((void *)&v30 + 1) + 8 * v10);
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v12 = v11;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v27;
            while (2)
            {
              uint64_t v16 = 0;
              do
              {
                if (*(void *)v27 != v15) {
                  objc_enumerationMutation(v12);
                }
                id v17 = [*(id *)(*((void *)&v26 + 1) + 8 * v16) second];
                char v18 = [v17 isEqual:v7];

                if (v18)
                {

                  goto LABEL_23;
                }
                ++v16;
              }
              while (v14 != v16);
              uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }

          ++v10;
          v8 = v25;
          uint64_t v9 = v23;
        }
        while (v10 != v24);
        a3 = v22;
        uint64_t v24 = [v25 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v24);
    }

    uint64_t v19 = *(void **)(a1 + 48);
    uint64_t v20 = *(void *)(a1 + 64);
    v21 = _MSVDescribeMethod(m, a3);
    [v19 appendFormat:@"/* %@ */ %@", v20, v21];

    if ((*(unsigned char *)(a1 + 59) & 8) != 0) {
      objc_msgSend(*(id *)(a1 + 48), "appendFormat:", @"// IMP: %p", method_getImplementation(m));
    }
    [*(id *)(a1 + 48) appendString:@"\n"];
  }
LABEL_23:
}

void __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obunint64_t j = a3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v11 = [v10 second];
        id v12 = NSSelectorFromString(v11);

        uint64_t v13 = [v10 first];
        int v14 = [v13 BOOLValue];
        uint64_t v15 = *(objc_class **)(a1 + 40);
        if (v14) {
          Method ClassMethod = class_getClassMethod(v15, v12);
        }
        else {
          Method ClassMethod = class_getInstanceMethod(v15, v12);
        }
        id v17 = ClassMethod;

        uint64_t v19 = *(void **)(a1 + 32);
        uint64_t v18 = *(void *)(a1 + 40);
        uint64_t v20 = [v10 first];
        v21 = _MSVDescribeMethod(v17, [v20 BOOLValue]);
        [v19 appendFormat:@"/* %@ <%@> */ %@", v18, v5, v21];

        if ((*(unsigned char *)(a1 + 51) & 8) != 0) {
          objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"// IMP: %p", method_getImplementation(v17));
        }
        [*(id *)(a1 + 32) appendString:@"\n"];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }
}

void __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_9(uint64_t a1, SEL aSelector, uint64_t a3, uint64_t a4)
{
  NSStringFromSelector(aSelector);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [NSNumber numberWithBool:a4];
  uint64_t v8 = +[MSVPair pairWithFirst:v7 second:v9];
  [v6 addObject:v8];
}

void __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_6(void *a1, objc_property_t property, int a3)
{
  Name = property_getName(property);
  uint64_t v7 = property_copyAttributeValue(property, "G");
  uint64_t v8 = v7;
  if (!v7) {
    uint64_t v7 = (char *)Name;
  }
  Uid = sel_getUid(v7);
  free(v8);
  if (Uid)
  {
    uint64_t v10 = (void *)a1[4];
    uint64_t v11 = NSStringFromSelector(Uid);
    [v10 addObject:v11];
  }
  id v12 = property_copyAttributeValue(property, "R");
  if (v12)
  {
    free(v12);
    goto LABEL_10;
  }
  uint64_t v13 = property_copyAttributeValue(property, "S");
  if (v13)
  {
    int v14 = v13;
    uint64_t v15 = sel_getUid(v13);
    free(v14);
    if (!v15) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v37 = [MEMORY[0x1E4F28E78] stringWithUTF8String:property_getName(property)];
  v38 = [v37 substringToIndex:1];
  v39 = [v38 uppercaseString];
  objc_msgSend(v37, "replaceCharactersInRange:withString:", 0, 1, v39);

  [v37 insertString:@"set" atIndex:0];
  [v37 appendString:@":"];
  id v40 = v37;
  uint64_t v15 = sel_getUid((const char *)[v40 UTF8String]);

  if (v15)
  {
LABEL_9:
    uint64_t v16 = (void *)a1[4];
    id v17 = NSStringFromSelector(v15);
    [v16 addObject:v17];
  }
LABEL_10:
  uint64_t v18 = (void *)a1[5];
  uint64_t v19 = a1[6];
  v42 = v18;
  uint64_t v20 = [MEMORY[0x1E4F28E78] stringWithString:@"@property "];
  v21 = [MEMORY[0x1E4F1CA48] array];
  int v22 = v21;
  if (a3) {
    [v21 addObject:@"class"];
  }
  unsigned int outCount = 0;
  long long v23 = property_copyAttributeList(property, &outCount);
  v44 = (void *)v20;
  uint64_t v45 = v19;
  v43 = v23;
  if (outCount)
  {
    unint64_t v24 = 0;
    char v41 = 0;
    char v47 = 0;
    v48 = 0;
    v46 = 0;
    p_value = &v23->value;
    while (1)
    {
      long long v27 = *(p_value - 1);
      long long v26 = *p_value;
      if (!strcmp(v27, "R"))
      {
        long long v29 = v22;
        long long v30 = @"readonly";
      }
      else if (!strcmp(v27, "C"))
      {
        long long v29 = v22;
        long long v30 = @"copy";
      }
      else if (!strcmp(v27, "&"))
      {
        long long v29 = v22;
        long long v30 = @"retain";
      }
      else if (!strcmp(v27, "N"))
      {
        long long v29 = v22;
        long long v30 = @"nonatomic";
      }
      else
      {
        if (!strcmp(v27, "G"))
        {
          objc_msgSend(NSString, "stringWithFormat:", @"getter=%s", v26);
          long long v31 = LABEL_34:;
          [v22 addObject:v31];

          goto LABEL_30;
        }
        if (!strcmp(v27, "S"))
        {
          objc_msgSend(NSString, "stringWithFormat:", @"setter=%s", v26);
          goto LABEL_34;
        }
        if (!strcmp(v27, "D"))
        {
          char v41 = 1;
          goto LABEL_30;
        }
        if (strcmp(v27, "W"))
        {
          if (!strcmp(v27, "T"))
          {
            uint64_t v32 = _MSVObjCTypeDescription(v26);

            v47 |= *v26 == 64;
            v48 = (void *)v32;
          }
          else if (!strcmp(v27, "V"))
          {
            uint64_t v28 = [NSString stringWithUTF8String:v26];

            v46 = (void *)v28;
          }
          goto LABEL_30;
        }
        long long v29 = v22;
        long long v30 = @"weak";
      }
      [v29 addObject:v30];
LABEL_30:
      ++v24;
      p_value += 2;
      if (v24 >= outCount) {
        goto LABEL_39;
      }
    }
  }
  v46 = 0;
  v48 = 0;
  char v47 = 0;
  char v41 = 0;
LABEL_39:
  free(v43);
  if ([v22 count])
  {
    [v22 sortUsingComparator:&__block_literal_global_392];
    long long v33 = [v22 componentsJoinedByString:@", "];
    [v44 appendFormat:@"(%@) ", v33];
  }
  if (v47) {
    v34 = &stru_1EF642BA8;
  }
  else {
    v34 = @" ";
  }
  [v44 appendFormat:@"%@%@%s;", v48, v34, property_getName(property)];
  if (v46)
  {
    [v44 appendFormat:@"  // @synthesize %s=%@;", property_getName(property), v46];
    v35 = v42;
  }
  else
  {
    v35 = v42;
    if (v41) {
      objc_msgSend(v44, "appendFormat:", @"  // @dynamic %s;", property_getName(property));
    }
  }
  id v36 = v44;

  [v35 appendFormat:@"/* %@ */ %@\n", v45, v36];
}

void __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, unsigned int *a5)
{
  _MSVObjCTypeDescription(a4);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = _MSVDebugIvarValue(a5, a4, 0);
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"\t/* %@ */ %s: (%@) = %@;\n",
    *(void *)(a1 + 40),
    a3,
    v10,
    v9);
}

void __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_2(uint64_t a1, Protocol *p)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(NSString, "stringWithFormat:", @"%s", protocol_getName(p));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

@end