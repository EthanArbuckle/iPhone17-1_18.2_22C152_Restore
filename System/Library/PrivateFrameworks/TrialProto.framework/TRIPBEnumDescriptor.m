@interface TRIPBEnumDescriptor
+ (id)allocDescriptorForName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7;
+ (id)allocDescriptorForName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7 extraTextFormatInfo:(const char *)a8;
- (BOOL)getValue:(int *)a3 forEnumName:(id)a4;
- (BOOL)getValue:(int *)a3 forEnumTextFormatName:(id)a4;
- (NSString)name;
- (TRIPBEnumDescriptor)initWithName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7;
- (id)enumNameForValue:(int)a3;
- (id)textFormatNameForValue:(int)a3;
- (void)calcValueNameOffsets;
- (void)dealloc;
- (void)enumVerifier;
@end

@implementation TRIPBEnumDescriptor

- (void)enumVerifier
{
  return self->enumVerifier_;
}

- (BOOL)getValue:(int *)a3 forEnumTextFormatName:(id)a4
{
  v6 = self;
  if (!self->nameOffsets_) {
    self = (TRIPBEnumDescriptor *)[(TRIPBEnumDescriptor *)self calcValueNameOffsets];
  }
  if (!v6->valueCount_) {
    return 0;
  }
  uint64_t v7 = 0;
  while (1)
  {
    v8 = (void *)MEMORY[0x1996FEF90](self, a2);
    unsigned int v9 = v6->values_[v7];
    if (objc_msgSend(-[TRIPBEnumDescriptor textFormatNameForValue:](v6, "textFormatNameForValue:", v9), "isEqual:", a4))break; {
    if (++v7 >= (unint64_t)v6->valueCount_)
    }
      return 0;
  }
  if (a3) {
    *a3 = v9;
  }
  return 1;
}

- (id)textFormatNameForValue:(int)a3
{
  if (!self->nameOffsets_) {
    [(TRIPBEnumDescriptor *)self calcValueNameOffsets];
  }
  uint64_t valueCount = self->valueCount_;
  if (!valueCount) {
    return 0;
  }
  uint64_t v6 = 0;
  while (self->values_[v6] != a3)
  {
    if (valueCount == ++v6) {
      return 0;
    }
  }
  v8 = (__CFString *)[NSString stringWithUTF8String:&self->valueNames_[self->nameOffsets_[v6]]];
  extraTextFormatInfo = (char *)self->extraTextFormatInfo_;
  if (!extraTextFormatInfo || (id result = (id)TRIPBDecodeTextFormatName(extraTextFormatInfo, v6, v8)) == 0)
  {
    uint64_t v10 = [(__CFString *)v8 length];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    CFStringRef theString = v8;
    uint64_t v56 = 0;
    int64_t v57 = v10;
    CharactersPtr = CFStringGetCharactersPtr(v8);
    CStringPtr = 0;
    v54 = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(v8, 0x600u);
    }
    int64_t v58 = 0;
    int64_t v59 = 0;
    v55 = CStringPtr;
    if (v10 < 1)
    {
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v13 = 0;
      int64_t v14 = 0;
      int64_t v15 = 0;
      uint64_t v16 = 0;
      uint64_t v17 = 64;
      do
      {
        if ((unint64_t)v15 >= 4) {
          uint64_t v18 = 4;
        }
        else {
          uint64_t v18 = v15;
        }
        int64_t v19 = v57;
        if (v57 <= v15)
        {
          UniChar v20 = 0;
        }
        else if (v54)
        {
          UniChar v20 = v54[v15 + v56];
        }
        else if (v55)
        {
          UniChar v20 = v55[v56 + v15];
        }
        else
        {
          if (v59 <= v15 || v14 > v15)
          {
            uint64_t v24 = v18 + v13;
            uint64_t v25 = v17 - v18;
            int64_t v26 = v15 - v18;
            int64_t v27 = v26 + 64;
            if (v26 + 64 >= v57) {
              int64_t v27 = v57;
            }
            int64_t v58 = v26;
            int64_t v59 = v27;
            if (v57 >= v25) {
              int64_t v19 = v25;
            }
            v60.length = v19 + v24;
            v60.location = v26 + v56;
            CFStringGetCharacters(theString, v60, (UniChar *)&v45);
            int64_t v14 = v58;
          }
          UniChar v20 = *((_WORD *)&v45 + v15 - v14);
        }
        if (v15) {
          BOOL v21 = v20 > 0x40u;
        }
        else {
          BOOL v21 = 0;
        }
        if (v21 && v20 < 0x5Bu) {
          ++v16;
        }
        ++v15;
        --v13;
        ++v17;
      }
      while (v10 != v15);
    }
    uint64_t v28 = v16 + v10;
    v29 = malloc_type_malloc(2 * v28, 0x1000040BDFB0063uLL);
    if (v29)
    {
      v30 = v29;
      if (v10 >= 1)
      {
        uint64_t v31 = 0;
        int64_t v32 = 0;
        uint64_t v33 = 0;
        uint64_t v34 = 64;
        do
        {
          if ((unint64_t)v32 >= 4) {
            uint64_t v35 = 4;
          }
          else {
            uint64_t v35 = v32;
          }
          int64_t v36 = v57;
          if (v57 <= v32)
          {
            LOBYTE(v37) = 0;
          }
          else if (v54)
          {
            UniChar v37 = v54[v32 + v56];
            if (v32) {
              goto LABEL_69;
            }
          }
          else
          {
            if (!v55)
            {
              int64_t v38 = v58;
              if (v59 <= v32 || v58 > v32)
              {
                uint64_t v40 = v35 + v31;
                uint64_t v41 = v34 - v35;
                int64_t v42 = v32 - v35;
                int64_t v43 = v42 + 64;
                if (v42 + 64 >= v57) {
                  int64_t v43 = v57;
                }
                int64_t v58 = v42;
                int64_t v59 = v43;
                if (v57 >= v41) {
                  int64_t v36 = v41;
                }
                v61.length = v36 + v40;
                v61.location = v42 + v56;
                CFStringGetCharacters(theString, v61, (UniChar *)&v45);
                int64_t v38 = v58;
              }
              UniChar v37 = *((_WORD *)&v45 + v32 - v38);
              if (!v32) {
                goto LABEL_72;
              }
LABEL_69:
              if (v37 >= 0x41u && v37 <= 0x5Au) {
                v30[v33++] = 95;
              }
              goto LABEL_72;
            }
            UniChar v37 = v55[v56 + v32];
            if (v32) {
              goto LABEL_69;
            }
          }
LABEL_72:
          v30[v33++] = __toupper((char)v37);
          ++v32;
          --v31;
          ++v34;
        }
        while (v10 != v32);
      }
      id v44 = [NSString alloc];
      return (id)objc_msgSend(v44, "initWithCharactersNoCopy:length:freeWhenDone:", v30, v28, 1, v45, v46, v47, v48, v49, v50, v51, v52);
    }
    else
    {
      return @"UNKNOWN_MALLOC_FAILURE";
    }
  }
  return result;
}

- (void)calcValueNameOffsets
{
  objc_sync_enter(self);
  if (!self->nameOffsets_)
  {
    v3 = (unsigned int *)malloc_type_malloc(4 * self->valueCount_, 0x100004052888210uLL);
    if (self->valueCount_)
    {
      unint64_t v4 = 0;
      valueNames = self->valueNames_;
      uint64_t v6 = valueNames;
      do
      {
        v3[v4] = v6 - valueNames;
        while (*(unsigned __int8 *)v6++)
          ;
        ++v4;
      }
      while (v4 < self->valueCount_);
    }
    self->nameOffsets_ = v3;
  }
  objc_sync_exit(self);
}

+ (id)allocDescriptorForName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7 extraTextFormatInfo:(const char *)a8
{
  id result = (id)[a1 allocDescriptorForName:a3 valueNames:a4 values:a5 count:*(void *)&a6 enumVerifier:a7];
  *((void *)result + 5) = a8;
  return result;
}

- (TRIPBEnumDescriptor)initWithName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7
{
  v14.receiver = self;
  v14.super_class = (Class)TRIPBEnumDescriptor;
  v12 = [(TRIPBEnumDescriptor *)&v14 init];
  if (v12)
  {
    v12->name_ = (NSString *)[a3 copy];
    v12->valueNames_ = a4;
    v12->valueCount_ = a6;
    v12->values_ = a5;
    v12->enumVerifier_ = a7;
  }
  return v12;
}

+ (id)allocDescriptorForName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = objc_alloc((Class)a1);
  return (id)[v12 initWithName:a3 valueNames:a4 values:a5 count:v8 enumVerifier:a7];
}

- (void)dealloc
{
  nameOffsets = self->nameOffsets_;
  if (nameOffsets) {
    free(nameOffsets);
  }
  v4.receiver = self;
  v4.super_class = (Class)TRIPBEnumDescriptor;
  [(TRIPBEnumDescriptor *)&v4 dealloc];
}

- (id)enumNameForValue:(int)a3
{
  if (!self->nameOffsets_) {
    [(TRIPBEnumDescriptor *)self calcValueNameOffsets];
  }
  uint64_t valueCount = self->valueCount_;
  if (!valueCount) {
    return 0;
  }
  unint64_t v6 = 0;
  uint64_t v7 = 4 * valueCount;
  while (self->values_[v6 / 4] != a3)
  {
    v6 += 4;
    if (v7 == v6) {
      return 0;
    }
  }
  return (id)[NSString stringWithFormat:@"%@_%s", self->name_, &self->valueNames_[self->nameOffsets_[v6 / 4]]];
}

- (BOOL)getValue:(int *)a3 forEnumName:(id)a4
{
  NSUInteger v7 = [(NSString *)self->name_ length];
  NSUInteger v8 = v7 + 1;
  if ([a4 length] <= v7 + 1) {
    goto LABEL_10;
  }
  int v9 = [a4 hasPrefix:self->name_];
  if (!v9) {
    return v9;
  }
  if ([a4 characterAtIndex:v7] != 95) {
    goto LABEL_10;
  }
  uint64_t v10 = [a4 UTF8String];
  if (!self->nameOffsets_) {
    [(TRIPBEnumDescriptor *)self calcValueNameOffsets];
  }
  uint64_t valueCount = self->valueCount_;
  if (!valueCount)
  {
LABEL_10:
    LOBYTE(v9) = 0;
    return v9;
  }
  unint64_t v12 = 0;
  uint64_t v13 = (const char *)(v10 + v8);
  valueNames = self->valueNames_;
  nameOffsets = self->nameOffsets_;
  uint64_t v16 = 4 * valueCount;
  while (strcmp(v13, &valueNames[nameOffsets[v12 / 4]]))
  {
    v12 += 4;
    if (v16 == v12) {
      goto LABEL_10;
    }
  }
  if (a3) {
    *a3 = self->values_[v12 / 4];
  }
  LOBYTE(v9) = 1;
  return v9;
}

- (NSString)name
{
  return self->name_;
}

@end