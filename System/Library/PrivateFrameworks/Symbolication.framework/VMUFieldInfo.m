@interface VMUFieldInfo
- (BOOL)isArrayEntries;
- (BOOL)isArraySize;
- (BOOL)isByref;
- (BOOL)isCapture;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKeyField;
- (BOOL)isKeysPointer;
- (BOOL)isStorageBitmapPointer;
- (BOOL)isStorageImplPointer;
- (BOOL)isValueField;
- (BOOL)isValuesPointer;
- (BOOL)typeNameMayDescribeReferencedAllocation;
- (NSArray)possibleEnumPayloadFieldArray;
- (NSArray)subFieldArray;
- (NSString)ivarName;
- (NSString)typeName;
- (NSString)typedDescription;
- (VMUClassInfo)destinationLayout;
- (VMUFieldInfo)initWithName:(id)a3 type:(id)a4 kind:(unsigned int)a5 scan:(unsigned int)a6 offset:(unsigned int)a7 size:(unsigned int)a8 stride:(unsigned int)a9 subFieldArray:(id)a10 swiftTyperef:(void *)a11;
- (VMUFieldInfo)initWithName:(id)a3 type:(id)a4 scan:(unsigned int)a5 offset:(unsigned int)a6 size:(unsigned int)a7;
- (VMUFieldInfo)initWithObjcIvar:(objc_ivar *)a3 size:(unsigned int)a4 offset:(unsigned int)a5 ivarName:(const char *)a6 isARC:(BOOL)a7 is64Bit:(BOOL)a8;
- (VMUFieldInfo)initWithSerializer:(id)a3 classMap:(id)a4 version:(unsigned int)a5 error:(id *)a6;
- (VMUFieldInfo)initWithSerializer:(id)a3 classMap:(id)a4 version:(unsigned int)a5 returnedDestinationLayoutClassInfoIndex:(unsigned int *)a6 error:(id *)a7;
- (id)_fullIvarNameAtOffset:(unsigned int)a3 leafOffset:(unsigned int *)a4 depth:(unsigned int)a5;
- (id)description;
- (id)descriptionOfFieldValueInObjectMemory:(void *)a3 scanner:(id)a4;
- (id)fullIvarNameAtOffset:(unsigned int)a3;
- (id)getLeafFieldAtOffset:(unsigned int)a3 leafOffset:(unsigned int *)a4;
- (id)initStorageEntryFieldWithName:(id)a3 type:(id)a4 kind:(unsigned int)a5 scan:(unsigned int)a6 offset:(unsigned int)a7 size:(unsigned int)a8 stride:(unsigned int)a9 subFieldArray:(id)a10;
- (id)initStorageInfoFieldWithName:(id)a3 type:(id)a4 kind:(unsigned int)a5 scan:(unsigned int)a6 offset:(unsigned int)a7 size:(unsigned int)a8 stride:(unsigned int)a9 subFieldArray:(id)a10;
- (id)initSwiftEnumPayloadFieldWithName:(id)a3 type:(id)a4 kind:(unsigned int)a5 scan:(unsigned int)a6 offset:(unsigned int)a7 size:(unsigned int)a8 stride:(unsigned int)a9 possibleEnumSubFieldArray:(id)a10 swiftTyperef:(void *)a11;
- (id)mutableCopy;
- (unint64_t)hash;
- (unsigned)bitfieldWidth;
- (unsigned)flags;
- (unsigned)kind;
- (unsigned)offset;
- (unsigned)scanType;
- (unsigned)scannableSize;
- (unsigned)size;
- (unsigned)stride;
- (void)_setFlags:(unsigned int)a3;
- (void)_setIvarName:(id)a3;
- (void)_setKind:(unsigned int)a3;
- (void)_setOffset:(unsigned int)a3;
- (void)_setScanType:(unsigned int)a3;
- (void)_setScannableSize:(unsigned int)a3;
- (void)_setSize:(unsigned int)a3;
- (void)_setStride:(unsigned int)a3;
- (void)dealloc;
- (void)enumerateSublayoutsForSize:(int)a3 parentOffset:(unsigned int)a4 remotePointerSize:(uint64_t)a5 withBlock:;
- (void)initializeSubFieldArray;
- (void)serializeWithClassMap:(id)a3 simpleSerializer:(id)a4 version:(unsigned int)a5;
- (void)setDestinationLayout:(id)a3;
- (void)setTypeName:(id)a3;
- (void)swiftTyperef;
@end

@implementation VMUFieldInfo

- (NSArray)subFieldArray
{
  return (NSArray *)self->_subFieldArray;
}

- (NSArray)possibleEnumPayloadFieldArray
{
  return self->_possibleEnumPayloadFieldArray;
}

- (void)initializeSubFieldArray
{
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  subFieldArray = self->_subFieldArray;
  self->_subFieldArray = v3;
}

- (unint64_t)hash
{
  return [(NSString *)self->_ivarName hash] ^ self->_flags ^ (self->_offset << self->_scanType);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && self->_offset == *((_DWORD *)a3 + 7)
      && self->_scanType == *((_DWORD *)a3 + 6)
      && self->_flags == *((_DWORD *)a3 + 11)
      && self->_size == *((_DWORD *)a3 + 8)
      && self->_scannable == *((_DWORD *)a3 + 9)
      && self->_stride == *((_DWORD *)a3 + 10))
    {
      ivarName = self->_ivarName;
      if (ivarName == *((NSString **)a3 + 1) || (int v6 = -[NSString isEqualToString:](ivarName, "isEqualToString:")) != 0)
      {
        typeName = self->_typeName;
        if (typeName == *((NSString **)a3 + 2)
          || (int v6 = -[NSString isEqualToString:](typeName, "isEqualToString:")) != 0)
        {
          destinationLayout = self->_destinationLayout;
          if (destinationLayout == *((VMUClassInfo **)a3 + 6)
            || (int v6 = -[VMUClassInfo isEqual:](destinationLayout, "isEqual:")) != 0)
          {
            subFieldArray = self->_subFieldArray;
            if (subFieldArray == *((NSMutableArray **)a3 + 7)
              || (int v6 = -[NSMutableArray isEqual:](subFieldArray, "isEqual:")) != 0)
            {
              possibleEnumPayloadFieldArray = self->_possibleEnumPayloadFieldArray;
              if (possibleEnumPayloadFieldArray == *((NSArray **)a3 + 8)
                || (int v6 = -[NSArray isEqual:](possibleEnumPayloadFieldArray, "isEqual:")) != 0)
              {
                LOBYTE(v6) = 1;
              }
            }
          }
        }
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (NSString)typedDescription
{
  typeName = self->_typeName;
  if (typeName)
  {
    descriptionForTypeEncoding((unsigned __int8 *)[(NSString *)typeName UTF8String], (uint64_t)[(NSString *)self->_ivarName UTF8String]);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_ivarName;
  }

  return v4;
}

- (id)mutableCopy
{
  v3 = [VMUMutableFieldInfo alloc];
  LODWORD(v6) = self->_stride;
  v4 = [(VMUFieldInfo *)v3 initWithName:self->_ivarName type:0 kind:0 scan:self->_scanType offset:self->_offset size:self->_size stride:v6 subFieldArray:self->_subFieldArray swiftTyperef:self->_swiftTyperef];
  [v4 setTypeName:self->_typeName];
  [v4 setDestinationLayout:self->_destinationLayout];
  [v4 setScannableSize:self->_scannable];
  [v4 setFlags:self->_flags];
  objc_storeStrong(v4 + 8, self->_possibleEnumPayloadFieldArray);
  return v4;
}

- (VMUFieldInfo)initWithObjcIvar:(objc_ivar *)a3 size:(unsigned int)a4 offset:(unsigned int)a5 ivarName:(const char *)a6 isARC:(BOOL)a7 is64Bit:(BOOL)a8
{
  BOOL v9 = a7;
  uint64_t v12 = *(void *)&a4;
  v26.receiver = self;
  v26.super_class = (Class)VMUFieldInfo;
  v14 = [(VMUFieldInfo *)&v26 init];
  v15 = v14;
  if (!v14) {
    return v15;
  }
  if (a6)
  {
    uint64_t v16 = [[NSString alloc] initWithUTF8String:a6];
    ivarName = v15->_ivarName;
    v15->_ivarName = (NSString *)v16;
  }
  else
  {
    ivarName = v14->_ivarName;
    v14->_ivarName = 0;
  }

  TypeEncoding = (unsigned __int8 *)ivar_getTypeEncoding(a3);
  if (TypeEncoding)
  {
    uint64_t v19 = [[NSString alloc] initWithUTF8String:TypeEncoding];
    typeName = v15->_typeName;
    v15->_typeName = (NSString *)v19;
  }
  else
  {
    typeName = v15->_typeName;
    v15->_typeName = 0;
  }

  v15->_offset = a5;
  v15->_size = v12;
  char v25 = 63;
  unsigned int v21 = pointerScanSizeForTypeEncoding(TypeEncoding, v12, a8, (uint64_t)&v25);
  v15->_unsigned int scannable = v21;
  if (!v21)
  {
    v15->_stride = v12;
LABEL_16:
    v15->_scanType = 0;
    return v15;
  }
  if (typeEncodingDescribesReferencedAllocation((uint64_t)TypeEncoding)) {
    v15->_flags |= 0x10u;
  }
  unsigned int scannable = v15->_scannable;
  v15->_stride = v12;
  if (scannable <= 7) {
    goto LABEL_16;
  }
  if (v9 && v25 == 64) {
    int v23 = 8;
  }
  else {
    int v23 = 1;
  }
  v15->_scanType = v23;
  return v15;
}

- (VMUFieldInfo)initWithName:(id)a3 type:(id)a4 kind:(unsigned int)a5 scan:(unsigned int)a6 offset:(unsigned int)a7 size:(unsigned int)a8 stride:(unsigned int)a9 subFieldArray:(id)a10 swiftTyperef:(void *)a11
{
  uint64_t v11 = *(void *)&a8;
  uint64_t v14 = *(void *)&a5;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a10;
  v45.receiver = self;
  v45.super_class = (Class)VMUFieldInfo;
  v20 = [(VMUFieldInfo *)&v45 init];
  if (v20)
  {
    unsigned int v21 = a11;
    uint64_t v22 = [v17 copy];
    ivarName = v20->_ivarName;
    v20->_ivarName = (NSString *)v22;

    uint64_t v24 = [v18 copy];
    typeName = v20->_typeName;
    v20->_typeName = (NSString *)v24;

    [(VMUFieldInfo *)v20 _setKind:v14];
    v20->_scanType = a6;
    v20->_offset = a7;
    v20->_size = v11;
    if ([v18 length])
    {
      char v44 = 63;
      objc_super v26 = (unsigned __int8 *)[v18 UTF8String];
      unsigned int v27 = pointerScanSizeForTypeEncoding(v26, v11, 1, (uint64_t)&v44);
      v20->_unsigned int scannable = v27;
      if (v27 && typeEncodingDescribesReferencedAllocation((uint64_t)v26)) {
        v20->_flags |= 0x10u;
      }
    }
    else
    {
      if (v11 >= 8) {
        unsigned int v28 = v11;
      }
      else {
        unsigned int v28 = 0;
      }
      v20->_unsigned int scannable = v28;
    }
    v20->_stride = a9;
    if (v19)
    {
      uint64_t v29 = objc_opt_new();
      subFieldArray = v20->_subFieldArray;
      v20->_subFieldArray = (NSMutableArray *)v29;

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v31 = v19;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v41 != v34) {
              objc_enumerationMutation(v31);
            }
            v36 = v20->_subFieldArray;
            v37 = (void *)[*(id *)(*((void *)&v40 + 1) + 8 * i) mutableCopy];
            [(NSMutableArray *)v36 addObject:v37];
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v40 objects:v46 count:16];
        }
        while (v33);
      }

      unsigned int v21 = a11;
    }
    if (v21)
    {
      v38 = malloc_type_calloc(1uLL, 0x10uLL, 0x1000040D9A13B51uLL);
      v20->_swiftTyperef = v38;
      _OWORD *v38 = *v21;
    }
  }

  return v20;
}

- (void)dealloc
{
  swiftTyperef = self->_swiftTyperef;
  if (swiftTyperef)
  {
    free(swiftTyperef);
    self->_swiftTyperef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VMUFieldInfo;
  [(VMUFieldInfo *)&v4 dealloc];
}

- (id)initSwiftEnumPayloadFieldWithName:(id)a3 type:(id)a4 kind:(unsigned int)a5 scan:(unsigned int)a6 offset:(unsigned int)a7 size:(unsigned int)a8 stride:(unsigned int)a9 possibleEnumSubFieldArray:(id)a10 swiftTyperef:(void *)a11
{
  uint64_t v11 = *(void *)&a8;
  uint64_t v12 = *(void *)&a7;
  uint64_t v13 = *(void *)&a6;
  uint64_t v14 = *(void *)&a5;
  id v22 = a10;
  LODWORD(v21) = a9;
  id v18 = [(VMUFieldInfo *)self initWithName:a3 type:a4 kind:v14 scan:v13 offset:v12 size:v11 stride:v21 subFieldArray:0 swiftTyperef:a11];
  id v19 = v18;
  if (v18) {
    objc_storeStrong((id *)&v18->_possibleEnumPayloadFieldArray, a10);
  }

  return v19;
}

- (id)initStorageInfoFieldWithName:(id)a3 type:(id)a4 kind:(unsigned int)a5 scan:(unsigned int)a6 offset:(unsigned int)a7 size:(unsigned int)a8 stride:(unsigned int)a9 subFieldArray:(id)a10
{
  LODWORD(v11) = a9;
  id result = [(VMUFieldInfo *)self initWithName:a3 type:a4 kind:*(void *)&a5 scan:*(void *)&a6 offset:*(void *)&a7 size:*(void *)&a8 stride:v11 subFieldArray:a10 swiftTyperef:0];
  if (result) {
    *((_DWORD *)result + 11) |= 4u;
  }
  return result;
}

- (id)initStorageEntryFieldWithName:(id)a3 type:(id)a4 kind:(unsigned int)a5 scan:(unsigned int)a6 offset:(unsigned int)a7 size:(unsigned int)a8 stride:(unsigned int)a9 subFieldArray:(id)a10
{
  LODWORD(v11) = a9;
  id result = [(VMUFieldInfo *)self initWithName:a3 type:a4 kind:*(void *)&a5 scan:*(void *)&a6 offset:*(void *)&a7 size:*(void *)&a8 stride:v11 subFieldArray:a10 swiftTyperef:0];
  if (result) {
    *((_DWORD *)result + 11) |= 8u;
  }
  return result;
}

- (VMUFieldInfo)initWithName:(id)a3 type:(id)a4 scan:(unsigned int)a5 offset:(unsigned int)a6 size:(unsigned int)a7
{
  LODWORD(v8) = a7;
  return -[VMUFieldInfo initWithName:type:kind:scan:offset:size:stride:subFieldArray:swiftTyperef:](self, "initWithName:type:kind:scan:offset:size:stride:subFieldArray:swiftTyperef:", a3, a4, 0, *(void *)&a5, *(void *)&a6, v8, 0, 0);
}

- (VMUFieldInfo)initWithSerializer:(id)a3 classMap:(id)a4 version:(unsigned int)a5 error:(id *)a6
{
  return [(VMUFieldInfo *)self initWithSerializer:a3 classMap:a4 version:*(void *)&a5 returnedDestinationLayoutClassInfoIndex:0 error:a6];
}

- (VMUFieldInfo)initWithSerializer:(id)a3 classMap:(id)a4 version:(unsigned int)a5 returnedDestinationLayoutClassInfoIndex:(unsigned int *)a6 error:(id *)a7
{
  v34[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  v33.receiver = self;
  v33.super_class = (Class)VMUFieldInfo;
  uint64_t v14 = [(VMUFieldInfo *)&v33 init];
  if (!v14) {
    goto LABEL_31;
  }
  uint64_t v32 = 0;
  if (!a7) {
    a7 = (id *)&v32;
  }
  v15 = (unsigned int *)[v12 _deserializeValues:2 error:a7];
  if (*a7) {
    goto LABEL_9;
  }
  v14->_offset = *v15;
  v14->_size = v15[1];
  if (*a7) {
    goto LABEL_9;
  }
  v34[0] = &v14->_scanType;
  v34[1] = &v14->_flags;
  v34[2] = &v14->_scannable;
  uint64_t v16 = [v12 _deserializeValues:3 error:a7];
  id v17 = *a7;
  if (*a7) {
    goto LABEL_9;
  }
  do
  {
    *(_DWORD *)v34[(void)v17] = *(_DWORD *)(v16 + 4 * (void)v17);
    id v17 = (char *)v17 + 1;
  }
  while (v17 != (id)3);
  if (*a7) {
    goto LABEL_9;
  }
  if (a5 >= 4)
  {
    id v19 = (unsigned int *)[v12 _deserializeValues:1 error:a7];
    if (*a7) {
      goto LABEL_9;
    }
    v14->_stride = *v19;
    if (*a7) {
      goto LABEL_9;
    }
  }
  unsigned int v20 = [v12 deserialize32WithError:a7];
  if (*a7) {
    goto LABEL_9;
  }
  if (a6) {
    *a6 = v20;
  }
  uint64_t v21 = [v12 copyDeserializedStringWithError:a7];
  ivarName = v14->_ivarName;
  v14->_ivarName = (NSString *)v21;

  if (*a7) {
    goto LABEL_9;
  }
  uint64_t v23 = [v12 copyDeserializedStringWithError:a7];
  typeName = v14->_typeName;
  v14->_typeName = (NSString *)v23;

  if (*a7) {
    goto LABEL_9;
  }
  if (a5 < 4)
  {
LABEL_31:
    id v18 = v14;
    goto LABEL_32;
  }
  int v25 = [v12 deserialize32WithError:a7];
  if (!*a7)
  {
    int v26 = v25;
    if (v25)
    {
      unsigned int v27 = objc_opt_new();
      do
      {
        uint64_t v28 = [v12 deserialize32WithError:a7];
        if (*a7)
        {

          goto LABEL_9;
        }
        uint64_t v29 = [v13 fieldInfoForIndex:v28];
        if (v29) {
          [v27 addObject:v29];
        }
        else {
          NSLog(&cfstr_BadFieldIndexI.isa);
        }

        --v26;
      }
      while (v26);
      if ([v27 count]) {
        v30 = v27;
      }
      else {
        v30 = 0;
      }
      objc_storeStrong((id *)&v14->_subFieldArray, v30);
    }
    goto LABEL_31;
  }
LABEL_9:
  id v18 = 0;
LABEL_32:

  return v18;
}

- (void)serializeWithClassMap:(id)a3 simpleSerializer:(id)a4 version:(unsigned int)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v22[0] = *(void *)&self->_offset;
  [v8 _serializeValues:v22 count:2];
  unsigned int flags = self->_flags;
  v21[0] = self->_scanType;
  v21[1] = flags;
  v21[2] = self->_scannable;
  [v8 _serializeValues:v21 count:3];
  unsigned int stride = self->_stride;
  [v8 _serializeValues:&stride count:1];
  [v8 serialize32:[v7 indexForClassInfo:self->_destinationLayout]];
  [v8 serializeString:self->_ivarName];
  [v8 serializeString:self->_typeName];
  [v8 serialize32:-[NSMutableArray count](self->_subFieldArray, "count")];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_subFieldArray;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [v8 serialize32:[v7 indexForFieldInfo:*(void *)(*((void *)&v15 + 1) + 8 * v14++) fieldInfo:v15]];
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v12);
  }
}

- (id)getLeafFieldAtOffset:(unsigned int)a3 leafOffset:(unsigned int *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  subFieldArray = self->_subFieldArray;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = subFieldArray;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
      unsigned int v14 = [v13 offset:v19];
      if ([v13 size] + v14 > a3) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
    if (v14 > a3) {
      goto LABEL_11;
    }
    id v17 = v13;

    if (v17)
    {
      v23[0] = 0;
      [v17 getLeafFieldAtOffset:a3 - [v17 offset] leafOffset:v23];
      long long v15 = (VMUFieldInfo *)objc_claimAutoreleasedReturnValue();
      if (a4)
      {
        int v18 = [v17 offset];
        *a4 = v23[0] + v18;
      }

      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
  if (a4) {
    *a4 = 0;
  }
  long long v15 = self;
LABEL_15:

  return v15;
}

- (id)_fullIvarNameAtOffset:(unsigned int)a3 leafOffset:(unsigned int *)a4 depth:(unsigned int)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (_fullIvarNameAtOffset_leafOffset_depth__onceToken != -1) {
    dispatch_once(&_fullIvarNameAtOffset_leafOffset_depth__onceToken, &__block_literal_global_12);
  }
  subFieldArray = self->_subFieldArray;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v10 = subFieldArray;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
LABEL_5:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v27 != v13) {
        objc_enumerationMutation(v10);
      }
      long long v15 = *(void **)(*((void *)&v26 + 1) + 8 * v14);
      unsigned int v16 = [v15 offset];
      if ([v15 size] + v16 > v7) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v12) {
          goto LABEL_5;
        }
        goto LABEL_13;
      }
    }
    if (v16 > v7) {
      goto LABEL_13;
    }
    id v20 = v15;

    if (v20)
    {
      v30[0] = 0;
      long long v21 = [v20 _fullIvarNameAtOffset:v7 - [v20 offset] leafOffset:v30 depth:a5 + 1];
      if (a4)
      {
        int v22 = [v20 offset];
        *a4 = v30[0] + v22;
      }
      if (a5 && [(NSString *)self->_ivarName isEqualToString:@"some"])
      {
        uint64_t v23 = v21;
      }
      else if (v21 {
             && [v21 length]
      }
             && ![(id)_fullIvarNameAtOffset_leafOffset_depth__internalPartialIvarNames containsObject:v21])
      {
        uint64_t v23 = [NSString stringWithFormat:@"%@.%@", self->_ivarName, v21, (void)v26];
      }
      else
      {
        ivarName = self->_ivarName;
        if (v7)
        {
          uint64_t v23 = [(NSString *)ivarName stringByAppendingFormat:@" + %u", v7];
        }
        else
        {
          uint64_t v23 = ivarName;
        }
      }
      id v17 = v23;

      goto LABEL_37;
    }
  }
  else
  {
LABEL_13:
  }
  if (a4) {
    *a4 = 0;
  }
  if (a5
    && ([(id)_fullIvarNameAtOffset_leafOffset_depth__internalPartialIvarNames containsObject:self->_ivarName] & 1) != 0)
  {
    id v17 = 0;
  }
  else
  {
    int v18 = self->_ivarName;
    if (v7)
    {
      long long v19 = [(NSString *)v18 stringByAppendingFormat:@" + %u", v7];
    }
    else
    {
      long long v19 = v18;
    }
    id v17 = v19;
  }
LABEL_37:

  return v17;
}

void __55__VMUFieldInfo__fullIvarNameAtOffset_leafOffset_depth___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithObjects:@"_guts", @"_object", @"_otherBits", @"_rawValue", @"rawValue", @"_value", @"_variantBuffer", @"_storage", @"_buffer", @"object", @"some", @"native", nil];
  v1 = (void *)_fullIvarNameAtOffset_leafOffset_depth__internalPartialIvarNames;
  _fullIvarNameAtOffset_leafOffset_depth__internalPartialIvarNames = v0;
}

- (id)fullIvarNameAtOffset:(unsigned int)a3
{
  int v5 = 0;
  v3 = [(VMUFieldInfo *)self _fullIvarNameAtOffset:*(void *)&a3 leafOffset:&v5 depth:0];

  return v3;
}

- (void)_setIvarName:(id)a3
{
  if (self->_ivarName != a3)
  {
    objc_super v4 = (NSString *)[a3 copy];
    ivarName = self->_ivarName;
    self->_ivarName = v4;
  }
}

- (void)setTypeName:(id)a3
{
  if (self->_typeName != a3)
  {
    objc_super v4 = (NSString *)[a3 copy];
    typeName = self->_typeName;
    self->_typeName = v4;
  }
}

- (void)_setScanType:(unsigned int)a3
{
  self->_scanType = a3;
}

- (void)_setOffset:(unsigned int)a3
{
  self->_offset = a3;
}

- (void)_setSize:(unsigned int)a3
{
  unsigned int scannable = self->_scannable;
  if (scannable >= a3) {
    unsigned int scannable = a3;
  }
  self->_size = a3;
  self->_unsigned int scannable = scannable;
}

- (void)_setFlags:(unsigned int)a3
{
  self->_unsigned int flags = a3;
  if ((a3 & 2) != 0)
  {
    objc_super v4 = +[VMUClassInfo _genericBlockByrefInfo];
    destinationLayout = self->_destinationLayout;
    self->_destinationLayout = v4;
  }
}

- (unsigned)bitfieldWidth
{
  typeName = self->_typeName;
  if (typeName)
  {
    uint64_t v3 = [(NSString *)typeName UTF8String];
    if (*(unsigned char *)v3 == 98) {
      LODWORD(typeName) = strtol((const char *)(v3 + 1), 0, 10);
    }
    else {
      LODWORD(typeName) = 0;
    }
  }
  return typeName;
}

- (BOOL)isCapture
{
  return self->_flags & 1;
}

- (BOOL)isByref
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (BOOL)isStorageImplPointer
{
  return (self->_flags & 4) != 0
      && [(NSString *)self->_ivarName isEqualToString:storageInfoTypeStorageImplPointer];
}

- (BOOL)isArraySize
{
  return (self->_flags & 4) != 0
      && [(NSString *)self->_ivarName isEqualToString:storageInfoTypeArraySize];
}

- (BOOL)isArrayEntries
{
  return (self->_flags & 4) != 0
      && [(NSString *)self->_ivarName isEqualToString:storageInfoTypeArrayEntries];
}

- (BOOL)isStorageBitmapPointer
{
  return (self->_flags & 4) != 0
      && [(NSString *)self->_ivarName isEqualToString:storageInfoTypeBitmapPointer];
}

- (BOOL)isKeysPointer
{
  return (self->_flags & 4) != 0
      && [(NSString *)self->_ivarName isEqualToString:storageInfoTypeKeysPointer];
}

- (BOOL)isValuesPointer
{
  return (self->_flags & 4) != 0
      && [(NSString *)self->_ivarName isEqualToString:storageInfoTypeValuesPointer];
}

- (BOOL)isKeyField
{
  return (self->_flags & 8) != 0
      && [(NSString *)self->_ivarName isEqualToString:storageInfoEntryKeyField];
}

- (BOOL)isValueField
{
  return (self->_flags & 8) != 0
      && [(NSString *)self->_ivarName isEqualToString:storageInfoEntryValueField];
}

- (BOOL)typeNameMayDescribeReferencedAllocation
{
  return (LOBYTE(self->_flags) >> 4) & 1;
}

- (void)_setKind:(unsigned int)a3
{
  self->_unsigned int flags = self->_flags & 0xFFFFFFF | (a3 << 28);
}

- (void)enumerateSublayoutsForSize:(int)a3 parentOffset:(unsigned int)a4 remotePointerSize:(uint64_t)a5 withBlock:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ((uint64_t v7 = *(void **)(a1 + 56)) != 0 && [v7 count] || *(void *)(a1 + 48))
    {
      int v8 = *(_DWORD *)(a1 + 28) + a3;
      int v24 = a4 + v8 - 1;
      uint64_t v9 = v24 & -a4;
      unsigned int v27 = v8;
      unsigned int v10 = v8 + *(_DWORD *)(a1 + 36);
      if (v10 >= a2) {
        unsigned int v10 = a2;
      }
      uint64_t v11 = v9 + a4;
      for (i = v10; v11 <= i; uint64_t v11 = v11 + a4)
      {
        uint64_t v12 = *(void **)(a1 + 56);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          unsigned int v16 = v9 - v27;
          uint64_t v17 = *(void *)v31;
LABEL_10:
          uint64_t v18 = 0;
          while (1)
          {
            if (*(void *)v31 != v17) {
              objc_enumerationMutation(v13);
            }
            long long v19 = *(void **)(*((void *)&v30 + 1) + 8 * v18);
            unsigned int v20 = [v19 offset];
            if ([v19 size] + v20 > v16) {
              break;
            }
            if (v15 == ++v18)
            {
              uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
              if (v15) {
                goto LABEL_10;
              }
              goto LABEL_18;
            }
          }
          if (v20 > v16) {
            goto LABEL_18;
          }
          id v22 = v19;

          if (v22)
          {
            -[VMUFieldInfo enumerateSublayoutsForSize:parentOffset:remotePointerSize:withBlock:](v22, a2, v27, a4, a5);
            int v23 = [v22 offset];
            uint64_t v11 = (v24 + v23 + [v22 size]) & -a4;

            goto LABEL_23;
          }
        }
        else
        {
LABEL_18:
        }
        uint64_t v21 = *(void *)(a1 + 48);
        if (v21) {
          (*(void (**)(uint64_t, uint64_t, uint64_t, void))(a5 + 16))(a5, v21, v9, *(unsigned int *)(a1 + 24));
        }
LABEL_23:
        uint64_t v9 = v11;
      }
    }
  }
}

- (unsigned)kind
{
  return self->_flags >> 28;
}

- (void)_setScannableSize:(unsigned int)a3
{
  self->_unsigned int scannable = a3;
}

- (void)_setStride:(unsigned int)a3
{
  self->_unsigned int stride = a3;
}

- (void)setDestinationLayout:(id)a3
{
  int v5 = (VMUClassInfo *)a3;
  destinationLayout = self->_destinationLayout;
  p_destinationLayout = &self->_destinationLayout;
  if (destinationLayout != v5)
  {
    int v8 = v5;
    objc_storeStrong((id *)p_destinationLayout, a3);
    int v5 = v8;
  }
}

- (VMUClassInfo)destinationLayout
{
  if ((self->_flags & 2) != 0)
  {
    v2 = +[VMUClassInfo _genericBlockByrefInfo];
  }
  else
  {
    v2 = self->_destinationLayout;
  }

  return v2;
}

- (id)descriptionOfFieldValueInObjectMemory:(void *)a3 scanner:(id)a4
{
  int v5 = (char *)a3 + self->_offset;
  typeName = self->_typeName;
  id v7 = a4;
  int v8 = descriptionOfValueAtAddressWithTypeEncoding((uint64_t)v5, (unsigned __int8 *)[(NSString *)typeName UTF8String], self->_size, v7);

  return v8;
}

- (id)description
{
  destinationLayout = self->_destinationLayout;
  if (destinationLayout)
  {
    objc_super v4 = [(VMUClassInfo *)destinationLayout className];
  }
  else
  {
    objc_super v4 = &stru_1EFE27F38;
  }
  v10.receiver = self;
  v10.super_class = (Class)VMUFieldInfo;
  int v5 = [(VMUFieldInfo *)&v10 description];
  uint64_t v6 = [(VMUFieldInfo *)self offset];
  id v7 = [(VMUFieldInfo *)self typedDescription];
  int v8 = [v5 stringByAppendingFormat:@"%+3d \"%@\" size %u (%s)  %@", v6, v7, -[VMUFieldInfo size](self, "size"), VMUScanTypeScanDescription(-[VMUFieldInfo scanType](self, "scanType")), v4];

  return v8;
}

- (NSString)ivarName
{
  return self->_ivarName;
}

- (NSString)typeName
{
  return self->_typeName;
}

- (unsigned)scanType
{
  return self->_scanType;
}

- (unsigned)offset
{
  return self->_offset;
}

- (unsigned)size
{
  return self->_size;
}

- (unsigned)scannableSize
{
  return self->_scannable;
}

- (unsigned)stride
{
  return self->_stride;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)swiftTyperef
{
  return self->_swiftTyperef;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleEnumPayloadFieldArray, 0);
  objc_storeStrong((id *)&self->_subFieldArray, 0);
  objc_storeStrong((id *)&self->_destinationLayout, 0);
  objc_storeStrong((id *)&self->_typeName, 0);

  objc_storeStrong((id *)&self->_ivarName, 0);
}

@end