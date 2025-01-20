@interface _PASZoneSupport
+ (id)copyArray:(id)a3 toZone:(_NSZone *)a4;
+ (id)copyData:(id)a3 toZone:(_NSZone *)a4;
+ (id)copyDate:(id)a3 toZone:(_NSZone *)a4;
+ (id)copyDictionary:(id)a3 toZone:(_NSZone *)a4;
+ (id)copyNumber:(id)a3 toZone:(_NSZone *)a4;
+ (id)copySet:(id)a3 toZone:(_NSZone *)a4;
+ (id)copyString:(id)a3 toZone:(_NSZone *)a4;
+ (id)copyUUID:(id)a3 toZone:(_NSZone *)a4;
+ (id)deepCopyObject:(id)a3 toZone:(_NSZone *)a4 strategy:(id)a5;
+ (id)mutableCopyArray:(id)a3 toZone:(_NSZone *)a4;
+ (id)mutableCopyData:(id)a3 toZone:(_NSZone *)a4;
+ (id)mutableCopyDictionary:(id)a3 toZone:(_NSZone *)a4;
+ (id)mutableCopySet:(id)a3 toZone:(_NSZone *)a4;
+ (id)mutableCopyString:(id)a3 toZone:(_NSZone *)a4;
+ (id)newMutableArrayInZone:(_NSZone *)a3;
+ (id)newMutableArrayInZone:(_NSZone *)a3 capacity:(unint64_t)a4;
+ (id)newMutableDataInZone:(_NSZone *)a3;
+ (id)newMutableDataInZone:(_NSZone *)a3 capacity:(unint64_t)a4;
+ (id)newMutableDataInZone:(_NSZone *)a3 length:(unint64_t)a4;
+ (id)newMutableDictionaryInZone:(_NSZone *)a3;
+ (id)newMutableDictionaryInZone:(_NSZone *)a3 capacity:(unint64_t)a4;
+ (id)newMutableSetInZone:(_NSZone *)a3;
+ (id)newMutableSetInZone:(_NSZone *)a3 capacity:(unint64_t)a4;
+ (id)newMutableStringInZone:(_NSZone *)a3;
+ (id)newMutableStringInZone:(_NSZone *)a3 capacity:(unint64_t)a4;
@end

@implementation _PASZoneSupport

+ (id)deepCopyObject:(id)a3 toZone:(_NSZone *)a4 strategy:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  char v8 = (char)a5;
  id v9 = a3;
  v10 = (void *)MEMORY[0x1A62450A0]();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v33 = v8;
    context = v10;
    id v11 = v9;
    v12 = objc_msgSend(a1, "newMutableArrayInZone:capacity:", a4, objc_msgSend(v11, "count"));
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v48 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [a1 deepCopyObject:*(void *)(*((void *)&v47 + 1) + 8 * i) toZone:a4 strategy:*(unsigned int *)&a5];
          [v12 addObject:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v47 objects:v52 count:16];
      }
      while (v15);
    }

    if ((v33 & 1) == 0)
    {
      id v19 = (id)[a1 copyArray:v12 toZone:a4];
LABEL_25:
      v30 = v19;

      v10 = context;
      goto LABEL_49;
    }
    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = v9;
    v21 = objc_msgSend(a1, "newMutableDictionaryInZone:capacity:", a4, objc_msgSend(v20, "count"));
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __50___PASZoneSupport_deepCopyObject_toZone_strategy___block_invoke;
    v40[3] = &unk_1E5AEAD00;
    id v42 = a1;
    v43 = a4;
    char v44 = v8;
    char v46 = *((unsigned char *)&a5 + 3);
    __int16 v45 = *(unsigned int *)&a5 >> 8;
    id v22 = v21;
    id v41 = v22;
    [v20 enumerateKeysAndObjectsUsingBlock:v40];

    if ((v8 & 2) != 0) {
      id v23 = v22;
    }
    else {
      id v23 = (id)[a1 copyDictionary:v22 toZone:a4];
    }
    v30 = v23;

    goto LABEL_49;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v34 = v8;
    context = v10;
    id v24 = v9;
    v12 = objc_msgSend(a1, "newMutableSetInZone:capacity:", a4, objc_msgSend(v24, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v13 = v24;
    uint64_t v25 = [v13 countByEnumeratingWithState:&v36 objects:v51 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v37 != v27) {
            objc_enumerationMutation(v13);
          }
          v29 = [a1 deepCopyObject:*(void *)(*((void *)&v36 + 1) + 8 * j) toZone:a4 strategy:*(unsigned int *)&a5];
          [v12 addObject:v29];
        }
        uint64_t v26 = [v13 countByEnumeratingWithState:&v36 objects:v51 count:16];
      }
      while (v26);
    }

    if ((v34 & 4) == 0)
    {
      id v19 = (id)[a1 copySet:v12 toZone:a4];
      goto LABEL_25;
    }
LABEL_24:
    id v19 = v12;
    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ((v8 & 0x10) != 0) {
      id v31 = (id)[a1 mutableCopyData:v9 toZone:a4];
    }
    else {
      id v31 = (id)[a1 copyData:v9 toZone:a4];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ((v8 & 8) != 0) {
        id v31 = (id)[a1 mutableCopyString:v9 toZone:a4];
      }
      else {
        id v31 = (id)[a1 copyString:v9 toZone:a4];
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v31 = (id)[a1 copyNumber:v9 toZone:a4];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v31 = (id)[a1 copyDate:v9 toZone:a4];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v31 = (id)[a1 copyUUID:v9 toZone:a4];
          }
          else if ((v8 & 0x20) != 0 && [v9 conformsToProtocol:&unk_1EF685A68])
          {
            id v31 = (id)[v9 mutableCopyWithZone:a4];
          }
          else if ([v9 conformsToProtocol:&unk_1EF685428])
          {
            id v31 = (id)[v9 copyWithZone:a4];
          }
          else
          {
            id v31 = v9;
          }
        }
      }
    }
  }
  v30 = v31;
LABEL_49:

  return v30;
}

+ (id)copyUUID:(id)a3 toZone:(_NSZone *)a4
{
  id v7 = a3;
  if (!a4 || (_NSZone *)MEMORY[0x1A6244840]() == a4)
  {
    CFUUIDRef v8 = (CFUUIDRef)[v7 copy];
  }
  else
  {
    CFUUIDBytes v11 = CFUUIDGetUUIDBytes((CFUUIDRef)v7);
    CFUUIDRef v8 = CFUUIDCreateFromUUIDBytes(a4, v11);
    if (!v8)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:a1 file:@"_PASZoneSupport.m" lineNumber:258 description:@"Unexpected CFUUIDCreateFromUUIDBytes() failure"];
    }
  }

  return v8;
}

+ (id)copyDate:(id)a3 toZone:(_NSZone *)a4
{
  id v7 = a3;
  if (a4 && (_NSZone *)MEMORY[0x1A6244840]() != a4 && malloc_size(v7))
  {
    CFAbsoluteTime v8 = MEMORY[0x1A6244470](v7);
    CFDateRef v9 = CFDateCreate(a4, v8);
    if (!v9)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:a1 file:@"_PASZoneSupport.m" lineNumber:246 description:@"Unexpected CFDateCreate() failure"];
    }
  }
  else
  {
    CFDateRef v9 = (CFDateRef)[v7 copy];
  }

  return v9;
}

+ (id)copyNumber:(id)a3 toZone:(_NSZone *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  CFNumberRef v7 = (const __CFNumber *)a3;
  if (a4 && (_NSZone *)MEMORY[0x1A6244840]() != a4 && malloc_size(v7))
  {
    CFIndex ByteSize = CFNumberGetByteSize(v7);
    size_t v9 = ByteSize + 7;
    memptr = 0;
    uint64_t v22 = 0;
    if ((unint64_t)(ByteSize + 7) > 0x400)
    {
      size_t v15 = CFNumberGetByteSize(v7);
      int v16 = malloc_type_posix_memalign(&memptr, 8uLL, v15, 0x28FF9D6DuLL);
      LOBYTE(v22) = 0;
      if (v16)
      {
        id v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
        objc_exception_throw(v19);
      }
      v10 = (char *)memptr;
    }
    else
    {
      MEMORY[0x1F4188790](ByteSize);
      v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v10, v9);
    }
    CFNumberType Type = CFNumberGetType(v7);
    if (!CFNumberGetValue(v7, Type, v10))
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2 object:a1 file:@"_PASZoneSupport.m" lineNumber:231 description:@"Unexpected value conversion error from CFNumberGetValue"];
    }
    CFNumberType v12 = CFNumberGetType(v7);
    CFNumberRef v13 = CFNumberCreate(a4, v12, v10);
    if (!v13)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2 object:a1 file:@"_PASZoneSupport.m" lineNumber:233 description:@"Unexpected CFNumberCreate() failure"];
    }
    if (v9 >= 0x401) {
      free(v10);
    }
  }
  else
  {
    CFNumberRef v13 = (CFNumberRef)[(__CFNumber *)v7 copy];
  }

  return v13;
}

+ (id)mutableCopyData:(id)a3 toZone:(_NSZone *)a4
{
  id v7 = a3;
  if (!a4 || (_NSZone *)MEMORY[0x1A6244840]() == a4)
  {
    CFMutableDataRef MutableCopy = (CFMutableDataRef)[v7 mutableCopy];
  }
  else
  {
    CFMutableDataRef MutableCopy = CFDataCreateMutableCopy(a4, 0, (CFDataRef)v7);
    if (!MutableCopy)
    {
      size_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:a1 file:@"_PASZoneSupport.m" lineNumber:218 description:@"Unexpected CFDataCreateMutableCopy() failure"];
    }
  }

  return MutableCopy;
}

+ (id)copyData:(id)a3 toZone:(_NSZone *)a4
{
  id v7 = a3;
  if (!a4 || (_NSZone *)MEMORY[0x1A6244840]() == a4)
  {
    CFDataRef Copy = (CFDataRef)[v7 copy];
  }
  else
  {
    CFDataRef Copy = CFDataCreateCopy(a4, (CFDataRef)v7);
    if (!Copy)
    {
      size_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:a1 file:@"_PASZoneSupport.m" lineNumber:207 description:@"Unexpected CFDataCreateCopy() failure"];
    }
  }

  return Copy;
}

+ (id)newMutableDataInZone:(_NSZone *)a3 length:(unint64_t)a4
{
  if (!a3 || (_NSZone *)MEMORY[0x1A6244840]() == a3)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1CA58]);
    return (id)[v10 initWithLength:a4];
  }
  else
  {
    Mutable = CFDataCreateMutable(a3, 0);
    if (!Mutable)
    {
      CFUUIDBytes v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:a1 file:@"_PASZoneSupport.m" lineNumber:195 description:@"Unexpected CFDataCreateMutable() failure"];
    }
    CFDataSetLength(Mutable, a4);
    return Mutable;
  }
}

+ (id)newMutableDataInZone:(_NSZone *)a3 capacity:(unint64_t)a4
{
  if (!a3 || (_NSZone *)MEMORY[0x1A6244840]() == a3)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1CA58]);
    return (id)[v10 initWithCapacity:a4];
  }
  else
  {
    CFMutableDataRef Mutable = CFDataCreateMutable(a3, 0);
    if (!Mutable)
    {
      CFUUIDBytes v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:a1 file:@"_PASZoneSupport.m" lineNumber:184 description:@"Unexpected CFDataCreateMutable() failure"];
    }
    return Mutable;
  }
}

+ (id)newMutableDataInZone:(_NSZone *)a3
{
  return (id)[a1 newMutableDataInZone:a3 capacity:0];
}

+ (id)mutableCopyString:(id)a3 toZone:(_NSZone *)a4
{
  id v7 = (__CFString *)a3;
  if (!a4 || (_NSZone *)MEMORY[0x1A6244840]() == a4)
  {
    CFMutableStringRef MutableCopy = (CFMutableStringRef)[(__CFString *)v7 mutableCopy];
  }
  else
  {
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(a4, 0, v7);
    if (!MutableCopy)
    {
      size_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:a1 file:@"_PASZoneSupport.m" lineNumber:167 description:@"Unexpected CFStringCreateMutableCopy() failure"];
    }
  }

  return MutableCopy;
}

+ (id)copyString:(id)a3 toZone:(_NSZone *)a4
{
  id v7 = (__CFString *)a3;
  if (a4 && (_NSZone *)MEMORY[0x1A6244840]() != a4 && malloc_size(v7))
  {
    CFStringRef Copy = CFStringCreateCopy(a4, v7);
    if (!Copy)
    {
      size_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:a1 file:@"_PASZoneSupport.m" lineNumber:156 description:@"Unexpected CFStringCreateCopy() failure"];
    }
  }
  else
  {
    CFStringRef Copy = (CFStringRef)[(__CFString *)v7 copy];
  }

  return (id)Copy;
}

+ (id)newMutableStringInZone:(_NSZone *)a3 capacity:(unint64_t)a4
{
  if (!a3 || (_NSZone *)MEMORY[0x1A6244840]() == a3)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28E78]);
    return (id)[v10 initWithCapacity:a4];
  }
  else
  {
    CFMutableStringRef Mutable = CFStringCreateMutable(a3, 0);
    if (!Mutable)
    {
      CFUUIDBytes v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:a1 file:@"_PASZoneSupport.m" lineNumber:143 description:@"Unexpected CFStringCreateMutable() failure"];
    }
    return Mutable;
  }
}

+ (id)newMutableStringInZone:(_NSZone *)a3
{
  return (id)[a1 newMutableStringInZone:a3 capacity:0];
}

+ (id)mutableCopySet:(id)a3 toZone:(_NSZone *)a4
{
  id v7 = a3;
  if (!a4 || (_NSZone *)MEMORY[0x1A6244840]() == a4)
  {
    CFMutableSetRef MutableCopy = (CFMutableSetRef)[v7 mutableCopy];
  }
  else
  {
    CFMutableSetRef MutableCopy = CFSetCreateMutableCopy(a4, 0, (CFSetRef)v7);
    if (!MutableCopy)
    {
      size_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:a1 file:@"_PASZoneSupport.m" lineNumber:126 description:@"Unexpected CFSetCreateCopy() failure"];
    }
  }

  return MutableCopy;
}

+ (id)copySet:(id)a3 toZone:(_NSZone *)a4
{
  id v7 = a3;
  if (!a4 || (_NSZone *)MEMORY[0x1A6244840]() == a4)
  {
    CFSetRef Copy = (CFSetRef)[v7 copy];
  }
  else
  {
    CFSetRef Copy = CFSetCreateCopy(a4, (CFSetRef)v7);
    if (!Copy)
    {
      size_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:a1 file:@"_PASZoneSupport.m" lineNumber:115 description:@"Unexpected CFSetCreateCopy() failure"];
    }
  }

  return Copy;
}

+ (id)newMutableSetInZone:(_NSZone *)a3 capacity:(unint64_t)a4
{
  if (!a3 || (_NSZone *)MEMORY[0x1A6244840]() == a3)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1CA80]);
    return (id)[v10 initWithCapacity:a4];
  }
  else
  {
    CFMutableSetRef Mutable = CFSetCreateMutable(a3, a4, MEMORY[0x1E4F1D548]);
    if (!Mutable)
    {
      CFUUIDBytes v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:a1 file:@"_PASZoneSupport.m" lineNumber:104 description:@"Unexpected CFSetCreateMutable() failure"];
    }
    return Mutable;
  }
}

+ (id)newMutableSetInZone:(_NSZone *)a3
{
  return (id)[a1 newMutableSetInZone:a3 capacity:0];
}

+ (id)mutableCopyDictionary:(id)a3 toZone:(_NSZone *)a4
{
  id v7 = a3;
  if (!a4 || (_NSZone *)MEMORY[0x1A6244840]() == a4)
  {
    CFMutableDictionaryRef MutableCopy = (CFMutableDictionaryRef)[v7 mutableCopy];
  }
  else
  {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(a4, 0, (CFDictionaryRef)v7);
    if (!MutableCopy)
    {
      size_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:a1 file:@"_PASZoneSupport.m" lineNumber:88 description:@"Unexpected CFDictionaryCreateMutableCopy() failure"];
    }
  }

  return MutableCopy;
}

+ (id)copyDictionary:(id)a3 toZone:(_NSZone *)a4
{
  id v7 = a3;
  if (!a4 || (_NSZone *)MEMORY[0x1A6244840]() == a4)
  {
    CFDictionaryRef Copy = (CFDictionaryRef)[v7 copy];
  }
  else
  {
    CFDictionaryRef Copy = CFDictionaryCreateCopy(a4, (CFDictionaryRef)v7);
    if (!Copy)
    {
      size_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:a1 file:@"_PASZoneSupport.m" lineNumber:77 description:@"Unexpected CFDictionaryCreateCopy() failure"];
    }
  }

  return Copy;
}

+ (id)newMutableDictionaryInZone:(_NSZone *)a3 capacity:(unint64_t)a4
{
  if (!a3 || (_NSZone *)MEMORY[0x1A6244840]() == a3)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1CA60]);
    return (id)[v10 initWithCapacity:a4];
  }
  else
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(a3, a4, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (!Mutable)
    {
      CFUUIDBytes v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:a1 file:@"_PASZoneSupport.m" lineNumber:66 description:@"Unexpected CFDictionaryCreateMutable() failure"];
    }
    return Mutable;
  }
}

+ (id)newMutableDictionaryInZone:(_NSZone *)a3
{
  return (id)[a1 newMutableDictionaryInZone:a3 capacity:0];
}

+ (id)mutableCopyArray:(id)a3 toZone:(_NSZone *)a4
{
  id v7 = a3;
  if (!a4 || (_NSZone *)MEMORY[0x1A6244840]() == a4)
  {
    CFMutableArrayRef MutableCopy = (CFMutableArrayRef)[v7 mutableCopy];
  }
  else
  {
    CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(a4, 0, (CFArrayRef)v7);
    if (!MutableCopy)
    {
      size_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:a1 file:@"_PASZoneSupport.m" lineNumber:49 description:@"Unexpected CFArrayCreateMutableCopy() failure"];
    }
  }

  return MutableCopy;
}

+ (id)copyArray:(id)a3 toZone:(_NSZone *)a4
{
  id v7 = a3;
  if (!a4 || (_NSZone *)MEMORY[0x1A6244840]() == a4)
  {
    CFArrayRef Copy = (CFArrayRef)[v7 copy];
  }
  else
  {
    CFArrayRef Copy = CFArrayCreateCopy(a4, (CFArrayRef)v7);
    if (!Copy)
    {
      size_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:a1 file:@"_PASZoneSupport.m" lineNumber:38 description:@"Unexpected CFArrayCreateCopy() failure"];
    }
  }

  return Copy;
}

+ (id)newMutableArrayInZone:(_NSZone *)a3 capacity:(unint64_t)a4
{
  if (!a3 || (_NSZone *)MEMORY[0x1A6244840]() == a3)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
    return (id)[v10 initWithCapacity:a4];
  }
  else
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable(a3, a4, MEMORY[0x1E4F1D510]);
    if (!Mutable)
    {
      CFUUIDBytes v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:a1 file:@"_PASZoneSupport.m" lineNumber:27 description:@"Unexpected CFArrayCreateMutable() failure"];
    }
    return Mutable;
  }
}

+ (id)newMutableArrayInZone:(_NSZone *)a3
{
  return (id)[a1 newMutableArrayInZone:a3 capacity:0];
}

@end