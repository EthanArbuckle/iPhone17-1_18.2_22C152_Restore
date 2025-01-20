@interface VMUCallTreeRoot
- (NSString)binaryImagesDescription;
- (VMUCallTreeRoot)initWithCallGraphFile:(id)a3 fileHeader:(id *)a4 topFunctionsList:(id *)a5 binaryImagesList:(id *)a6;
- (VMUCallTreeRoot)initWithSymbolicator:(_CSTypeRef)a3 sampler:(id)a4 options:(unint64_t)a5;
- (id)addBacktrace:(id)a3;
- (id)addBacktrace:(id)a3 count:(unsigned int)a4 numBytes:(unint64_t)a5;
- (id)addChildWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6 toNode:(id)a7;
- (id)addUniqueChildWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6 toNode:(id)a7;
- (id)addUniqueChildWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6 toNode:(id)a7 isLeafNode:(BOOL)a8;
- (id)chargeSystemLibrariesToCallersAndKeepBoundaries:(BOOL)a3;
- (id)descriptionStringForAddress:(unint64_t)a3 atTime:(unint64_t)a4 leafFrame:(BOOL)a5 startOfRecursion:(BOOL)a6;
- (void)addChildCountsIntoNode;
- (void)allBacktracesHaveBeenAdded;
- (void)dealloc;
- (void)setBinaryImagesDescription:(id)a3;
- (void)setCambriaRuntimeVMObjectID:(unint64_t)a3;
- (void)setStackLogReader:(id)a3;
- (void)setVMRegions:(id)a3;
@end

@implementation VMUCallTreeRoot

- (VMUCallTreeRoot)initWithSymbolicator:(_CSTypeRef)a3 sampler:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)VMUCallTreeRoot;
  v9 = [(VMUCallTreeRoot *)&v20 init];
  v10 = v9;
  if (v9)
  {
    name = v9->super._name;
    v9->super._name = (NSString *)&stru_1EFE27F38;

    v10->_symbolicator._opaque_1 = CSRetain();
    v10->_symbolicator._opaque_2 = v12;
    objc_storeStrong((id *)&v10->_sampler, a4);
    v10->_options = a5;
    uint64_t v13 = objc_opt_new();
    uniqueNodeNames = v10->_uniqueNodeNames;
    v10->_uniqueNodeNames = (NSMutableSet *)v13;

    uint64_t v15 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:258 valueOptions:0];
    addressToSymbolNameMap = v10->_addressToSymbolNameMap;
    v10->_addressToSymbolNameMap = (NSMapTable *)v15;

    uint64_t v17 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:258 valueOptions:0];
    addressToLeafSymbolNameMap = v10->_addressToLeafSymbolNameMap;
    v10->_addressToLeafSymbolNameMap = (NSMapTable *)v17;
  }
  return v10;
}

- (void)setStackLogReader:(id)a3
{
}

- (void)setVMRegions:(id)a3
{
}

- (void)setCambriaRuntimeVMObjectID:(unint64_t)a3
{
  self->_cambriaRuntimeObjectID = a3;
}

- (void)allBacktracesHaveBeenAdded
{
  p_symbolicator = &self->_symbolicator;
  CSRelease();
  p_symbolicator->_opaque_1 = 0;
  p_symbolicator->_opaque_2 = 0;
}

- (void)dealloc
{
  [(VMUCallTreeRoot *)self allBacktracesHaveBeenAdded];
  v3.receiver = self;
  v3.super_class = (Class)VMUCallTreeRoot;
  [(VMUCallTreeNode *)&v3 dealloc];
}

- (id)descriptionStringForAddress:(unint64_t)a3 atTime:(unint64_t)a4 leafFrame:(BOOL)a5 startOfRecursion:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  -[VMUStackLogReader vmuVMRegionForAddress:](self->_stackLogReader, "vmuVMRegionForAddress:");
  v10 = (id *)objc_claimAutoreleasedReturnValue();
  BOOL v45 = a5;
  CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
  Path = (const char *)CSSymbolOwnerGetPath();
  if (Path) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v10 == 0;
  }
  if (!v12) {
    Path = (const char *)[v10[5] UTF8String];
  }
  if ((self->_options & 0x10) != 0)
  {
    uint64_t v13 = Path;
    BOOL v14 = isSystemPath(Path);
    Path = v13;
    if (v14)
    {
      id v15 = 0;
      goto LABEL_64;
    }
  }
  v44 = Path;
  BOOL v47 = v6;
  uint64_t Name = CSSymbolOwnerGetName();
  v50 = v10;
  if (Name)
  {
    v48 = [NSString stringWithUTF8String:Name];
  }
  else
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v17 = self->_vmRegions;
    uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v52;
      v48 = @"Rosetta Runtime Routines";
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v52 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v51 + 1) + 8 * i);
          unint64_t v23 = a3 - [(id)v22 range];
          if (v23 < v24)
          {
            if (*(_DWORD *)(v22 + 104) == 234)
            {
              VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager(*(unsigned __int8 *)(v22 + 232), 234, 0, 0, 0);
              v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
              goto LABEL_24;
            }
            if (*(void *)(v22 + 112) == self->_cambriaRuntimeObjectID) {
              goto LABEL_24;
            }
          }
        }
        uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v51 objects:v55 count:16];
        if (v19) {
          continue;
        }
        break;
      }
      v48 = @"<unknown binary>";
    }
    else
    {
      v48 = @"<unknown binary>";
    }
LABEL_24:
  }
  CSSymbolicatorGetSymbolWithAddressAtTime();
  uint64_t v25 = CSSymbolGetName();
  if (v25
    && ([NSString stringWithUTF8String:v25],
        (v26 = objc_claimAutoreleasedReturnValue()) != 0)
    || (stackLogReader = self->_stackLogReader) != 0
    && ([(VMUStackLogReader *)stackLogReader functionNameForPCaddress:a3],
        (v26 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    VMUSimplifyCPlusPlusSymbolName(v26);
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

    unint64_t options = self->_options;
    if ((options & 0x20) != 0 || (options & 0x40) != 0 && isSystemPath(v44))
    {
      v49 = 0;
      v30 = 0;
      id Range = 0;
      int v46 = 1;
      goto LABEL_48;
    }
    id Range = (id)CSSymbolGetRange();
    if (!Range) {
      id Range = (id)[(VMUStackLogReader *)self->_stackLogReader functionRangeContainingPCaddress:a3];
    }
    uint64_t v33 = 0;
    if (v45)
    {
      v30 = @"0";
      int v46 = 1;
      goto LABEL_46;
    }
    v32 = @"%qu";
    goto LABEL_44;
  }
  v28 = kVMUUnknownSymbolName[0];
  id Range = (id)CSSymbolOwnerGetBaseAddress();
  if (!Range && v50) {
    id Range = v50[1];
  }
  if (Range)
  {
    v32 = @"0x%qx";
    uint64_t v33 = [NSString stringWithFormat:@"0x%qx", Range];
LABEL_44:
    [NSString stringWithFormat:v32, a3 - (void)Range];
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v46 = 0;
    goto LABEL_45;
  }
  int v46 = 0;
  v30 = 0;
  uint64_t v33 = 0;
LABEL_45:
  id Range = (id)a3;
LABEL_46:
  v49 = (void *)v33;
  if (Range)
  {
    [NSString stringWithFormat:@"0x%qx", Range];
    id Range = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_48:
  v34 = &stru_1EFE27F38;
  if (v47) {
    v34 = @"  RECURSION COLLAPSED";
  }
  v35 = v34;
  unint64_t v36 = self->_options;
  CSSymbolOwnerGetSourceInfoWithAddress();
  if (CSIsNull())
  {
    v37 = self->_stackLogReader;
    if (v37)
    {
      if ((v36 & 2) != 0) {
        [(VMUStackLogReader *)v37 sourcePathForPCaddress:a3];
      }
      else {
      v43 = [(VMUStackLogReader *)v37 sourceFileNameForPCaddress:a3];
      }
      if (v43)
      {
        v39 = [NSString stringWithFormat:@"%@  %@:%u", v35, v43, -[VMUStackLogReader sourceLineNumberForPCaddress:](self->_stackLogReader, "sourceLineNumberForPCaddress:", a3)];
      }
      else
      {
        v39 = 0;
      }

      if (v39) {
        goto LABEL_59;
      }
    }
  }
  else
  {
    if ((v36 & 2) != 0) {
      uint64_t Filename = CSSourceInfoGetPath();
    }
    else {
      uint64_t Filename = CSSourceInfoGetFilename();
    }
    v39 = [NSString stringWithFormat:@"%@  %s:%u", v35, Filename, CSSourceInfoGetLineNumber()];
    if (v39) {
      goto LABEL_59;
    }
  }
  v39 = v35;
LABEL_59:
  id v15 = [(VMUCallTreeNode *)self nameWithStringsForSymbol:v28 library:v48 loadAddress:v49 offset:v30 address:Range suffix:v39];
  if (v46)
  {
    v40 = self->_uniqueNodeNames;
    id v41 = v15;
    id v15 = [(NSMutableSet *)v40 member:v41];
    if (!v15)
    {
      [(NSMutableSet *)v40 addObject:v41];
      id v15 = v41;
    }
  }
  v10 = v50;
LABEL_64:

  return v15;
}

- (id)addBacktrace:(id)a3 count:(unsigned int)a4 numBytes:(unint64_t)a5
{
  id v8 = a3;
  int v9 = [v8 backtraceLength];
  if (v9)
  {
    int v10 = v9;
    v11 = self;
    context = (void *)MEMORY[0x1AD0D9F90]();
    key = 0;
    unint64_t options = v11->_options;
    v11->super._count += a4;
    v11->super._numBytes += a5;
    uint64_t v13 = (uint64_t)v11;
    char v37 = options;
    if ((options & 4) == 0)
    {
      sampler = v11->_sampler;
      if (sampler)
      {
        id v15 = [(VMUSampler *)sampler threadDescriptionStringForBacktrace:v8 returnedAddress:&key];
        uint64_t v16 = 2;
        unint64_t v17 = (unint64_t)key;
      }
      else
      {
        if (!v11->_threadPortToNameMap)
        {
          uint64_t v18 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:1282 valueOptions:0];
          threadPortToNameMap = v11->_threadPortToNameMap;
          v11->_threadPortToNameMap = (NSMapTable *)v18;
        }
        unint64_t v17 = [v8 thread];
        id v15 = NSMapGet(v11->_threadPortToNameMap, (const void *)v17);
        if (!v15)
        {
          id v15 = [MEMORY[0x1E4F28E78] stringWithFormat:@"Thread_%x", v17, context];
          NSMapInsert(v11->_threadPortToNameMap, (const void *)v17, v15);
        }
        key = (void *)v17;
        uint64_t v16 = 1;
      }
      uint64_t v13 = [(VMUCallTreeNode *)v11 findOrAddChildWithName:v15 address:v17 nodeSearchType:v16 isLeafNode:0];

      *(_DWORD *)(v13 + 40) += a4;
      *(void *)(v13 + 32) += a5;
    }
    unsigned int v36 = a4;
    uint64_t v20 = [v8 backtrace];
    id v34 = v8;
    [v8 timestamp];
    uint64_t v21 = (v10 - 1);
    if (v10 - 1 >= 0)
    {
      unint64_t v35 = a5;
      uint64_t v22 = 0;
      uint64_t v23 = v20 + 8 * v21 + 8;
      while (1)
      {
        unint64_t v24 = *(void **)(v23 + v22 - 8);
        key = v24;
        if (v22) {
          break;
        }
        if ((unint64_t)v24 >= 0x1000) {
          goto LABEL_19;
        }
LABEL_41:
        v22 -= 8;
        if (v21-- <= 0) {
          goto LABEL_43;
        }
      }
      if ((v37 & 8) != 0 && v24 == *(void **)(v23 + v22)) {
        goto LABEL_41;
      }
LABEL_19:
      if (v21)
      {
        BOOL v25 = 0;
        v26 = &OBJC_IVAR___VMUCallTreeRoot__addressToSymbolNameMap;
      }
      else
      {
        BOOL v25 = (v11->_options & 0x20) == 0;
        v26 = &OBJC_IVAR___VMUCallTreeRoot__addressToSymbolNameMap;
        if ((v11->_options & 0x20) == 0) {
          v26 = &OBJC_IVAR___VMUCallTreeRoot__addressToLeafSymbolNameMap;
        }
      }
      v27 = (NSMapTable *)*(id *)((char *)&v11->super.super.isa + *v26);
      NSMapGet(v27, key);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v28)
      {
        if (!key)
        {
          v28 = @"0x0";
          if (!v25) {
            goto LABEL_38;
          }
          goto LABEL_31;
        }
        uint64_t v29 = -[VMUCallTreeRoot descriptionStringForAddress:atTime:leafFrame:startOfRecursion:](v11, "descriptionStringForAddress:atTime:leafFrame:startOfRecursion:");
        if (v29) {
          v28 = (__CFString *)v29;
        }
        else {
          v28 = @"IGNORE THIS FRAME";
        }
        NSMapInsert(v27, key, v28);
      }
      if (v28 == @"IGNORE THIS FRAME")
      {
        v28 = @"IGNORE THIS FRAME";
LABEL_40:

        goto LABEL_41;
      }
      if (!v25) {
        goto LABEL_38;
      }
LABEL_31:
      if (([(__CFString *)v28 hasPrefix:kVMUUnknownSymbolName[0]] & 1) == 0)
      {
        uint64_t v30 = [(id)v13 findOrAddChildWithName:v28 address:0 nodeSearchType:1 isLeafNode:1];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!*(void *)(v30 + 24)) {
            [v30 parseNameIntoSymbol:0 library:0 loadAddress:0 offset:0 address:0 suffix:0];
          }
          [(id)v30 addAddress:key];
        }
        goto LABEL_39;
      }
LABEL_38:
      uint64_t v30 = [(id)v13 findOrAddChildWithName:v28 address:key nodeSearchType:1 isLeafNode:0];

LABEL_39:
      *(_DWORD *)(v30 + 40) += v36;
      *(void *)(v30 + 32) += v35;
      uint64_t v13 = v30;
      goto LABEL_40;
    }
LABEL_43:
    id v8 = v34;
  }
  else
  {
    uint64_t v13 = 0;
  }

  return (id)v13;
}

- (id)addBacktrace:(id)a3
{
  return [(VMUCallTreeRoot *)self addBacktrace:a3 count:1 numBytes:0];
}

- (id)addChildWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6 toNode:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  uint64_t v14 = [(NSMutableSet *)self->_uniqueNodeNames member:v12];
  if (v14)
  {
    id v15 = (id)v14;
    uint64_t v16 = 1;
  }
  else
  {
    [(NSMutableSet *)self->_uniqueNodeNames addObject:v12];
    id v15 = v12;
    uint64_t v16 = 0;
  }
  uint64_t v17 = [v13 findOrAddChildWithName:v15 address:a4 nodeSearchType:v16 isLeafNode:a4 != 0];
  *(_DWORD *)(v17 + 40) += a5;
  *(void *)(v17 + 32) += a6;

  return (id)v17;
}

- (id)addUniqueChildWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6 toNode:(id)a7
{
  return [(VMUCallTreeRoot *)self addUniqueChildWithName:a3 address:a4 count:*(void *)&a5 numBytes:a6 toNode:a7 isLeafNode:a4 != 0];
}

- (id)addUniqueChildWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6 toNode:(id)a7 isLeafNode:(BOOL)a8
{
  id result = (id)[a7 findOrAddChildWithName:a3 address:a4 nodeSearchType:0 isLeafNode:a8];
  *((_DWORD *)result + 10) += a5;
  *((void *)result + 4) += a6;
  return result;
}

- (void)addChildCountsIntoNode
{
  id v15 = [MEMORY[0x1E4F1CA48] arrayWithObject:self];
  if (![v15 count])
  {
    uint64_t v4 = -1;
    do
    {
LABEL_11:
      uint64_t v11 = [v15 objectAtIndexedSubscript:v4];
      uint64_t v12 = *(void *)(v11 + 32);
      id v13 = [(id)v11 parent];
      v13[4] += v12;

      LODWORD(v12) = *(_DWORD *)(v11 + 40);
      uint64_t v14 = [(id)v11 parent];
      v14[10] += v12;

      objc_super v3 = v15;
      --v4;
    }
    while (v4);
    goto LABEL_12;
  }
  uint64_t v2 = 0;
  objc_super v3 = v15;
  do
  {
    uint64_t v4 = v2;
    v5 = [v3 objectAtIndexedSubscript:v2];
    int v6 = [v5 numChildren];
    if (v6)
    {
      int v7 = v6;
      uint64_t v8 = 0;
      do
      {
        int v9 = [v5 childAtIndex:v8];
        [v15 addObject:v9];

        uint64_t v8 = (v8 + 1);
      }
      while (v7 != v8);
    }
    uint64_t v2 = v4 + 1;

    BOOL v10 = v4 + 1 >= (unint64_t)[v15 count];
    objc_super v3 = v15;
  }
  while (!v10);
  if (v4) {
    goto LABEL_11;
  }
LABEL_12:
}

- (VMUCallTreeRoot)initWithCallGraphFile:(id)a3 fileHeader:(id *)a4 topFunctionsList:(id *)a5 binaryImagesList:(id *)a6
{
  id v10 = a3;
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  uint64_t v11 = -[VMUCallTreeRoot initWithSymbolicator:sampler:options:](self, "initWithSymbolicator:sampler:options:", 0, 0, 0, 0);
  if (!v11)
  {
    id v15 = 0;
    goto LABEL_30;
  }
  uint64_t v12 = v11;
  id v13 = (const char *)[v10 fileSystemRepresentation];
  v78 = fopen(v13, "re");
  if (!v78)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "couldn't open %s for reading call tree\n", v13);
    id v15 = 0;
    goto LABEL_29;
  }
  if (!a4)
  {
    uint64_t v14 = 0;
    if (a5) {
      goto LABEL_11;
    }
LABEL_15:
    v77 = 0;
    goto LABEL_16;
  }
  uint64_t v14 = [MEMORY[0x1E4F28E78] string];
  if (!a5) {
    goto LABEL_15;
  }
LABEL_11:
  v77 = [MEMORY[0x1E4F28E78] string];
LABEL_16:
  v68 = a4;
  v69 = (void *)v14;
  if (a6)
  {
    id v76 = [MEMORY[0x1E4F28E78] string];
  }
  else
  {
    id v76 = 0;
  }
  v72 = [NSArray arrayWithObjects:v12, nil];
  uint64_t v16 = v12;
  name = v16->super._name;
  v16->super._name = (NSString *)&stru_1EFE27F38;

  id v71 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v18 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  v75 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v74 = [@"(" characterSetWithCharactersInString];
  v70 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@""]);
  v73 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  v84[0] = 0;
  uint64_t v19 = v78;
  int v20 = feof(v78);
  uint64_t v21 = v16;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  unint64_t v24 = v21;
  if (v20) {
    goto LABEL_20;
  }
  v66 = a5;
  p_isa = (id *)&v21->super.super.isa;
  v63 = a6;
  id v64 = v10;
  char v65 = 0;
  uint64_t v29 = 0;
  int v30 = 0;
  v31 = 0;
  uint64_t v59 = 1;
  char v61 = 1;
  v32 = v21;
  while (1)
  {
    uint64_t v33 = fgetln(v19, v84);
    if (!v33) {
      break;
    }
    id v34 = (void *)MEMORY[0x1AD0D9F90]();
    id v35 = [NSString alloc];
    unsigned int v36 = (void *)[v35 initWithBytesNoCopy:v33 length:v84[0] encoding:4 freeWhenDone:0];
    if (!strncmp(v33, "Call graph:", 0xBuLL))
    {
      int v30 = 1;
      goto LABEL_46;
    }
    if (!strncmp(v33, "Total number in stack", 0x15uLL) || v30 == 1 && v84[0] <= 1)
    {
LABEL_37:
      [v77 appendString:v36];
      int v30 = 2;
LABEL_46:

      uint64_t v23 = v29;
      uint64_t v22 = v31;
      unint64_t v24 = v32;
      uint64_t v19 = v78;
      goto LABEL_47;
    }
    if (!strncmp(v33, "Binary Images:", 0xEuLL))
    {
LABEL_45:
      [v76 appendString:v36];
      int v30 = 3;
      goto LABEL_46;
    }
    switch(v30)
    {
      case 0:
        if ([v36 integerValue] > 0) {
          goto LABEL_42;
        }
        [v69 appendString:v36];
        int v30 = 0;
        goto LABEL_46;
      case 1:
LABEL_42:
        uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v36];

        [v23 setCharactersToBeSkipped:0];
        id v83 = 0;
        [v23 scanUpToCharactersFromSet:v18 intoString:&v83];
        id v62 = v83;
        unint64_t v37 = [v62 length];
        context = v34;
        if (v37 < 4)
        {
          unint64_t v24 = v32;
          uint64_t v22 = v31;
          a6 = v63;
          id v10 = v64;
          a5 = v66;
          goto LABEL_103;
        }
        unint64_t v38 = v37;
        if (v37 <= [v31 length])
        {
          do
          {
            [v72 removeLastObject];
            unint64_t v24 = [v72 lastObject];

            [v71 removeLastObject];
            uint64_t v22 = [v71 lastObject];

            v31 = v22;
            v32 = v24;
          }
          while (v38 <= [v22 length]);
        }
        else
        {
          unint64_t v24 = v32;
          uint64_t v22 = v31;
        }
        uint64_t v82 = 0;
        a5 = v66;
        if (![v23 scanInteger:&v82]
          || v82 < 1
          || ![v23 scanCharactersFromSet:v75 intoString:0])
        {
          goto LABEL_89;
        }
        unint64_t v39 = 0;
        if (![v23 scanCharactersFromSet:v74 intoString:0]) {
          goto LABEL_66;
        }
        LODWORD(v79) = 0;
        if (([v23 scanFloat:&v79] & 1) == 0)
        {
          [v23 setScanLocation:[v23 scanLocation] - 1];
          unint64_t v39 = 0;
          goto LABEL_66;
        }
        id v81 = 0;
        int v40 = [v23 scanUpToCharactersFromSet:v70 intoString:&v81];
        id v41 = v81;
        v42 = v41;
        if (!v40) {
          goto LABEL_63;
        }
        if ([v41 isEqualToString:@"K"])
        {
          float v43 = *(float *)&v79;
          float v44 = 1024.0;
LABEL_62:
          *(float *)&uint64_t v79 = v43 * v44;
          goto LABEL_63;
        }
        if ([v42 isEqualToString:@"M"])
        {
          float v43 = *(float *)&v79;
          float v44 = 1048600.0;
          goto LABEL_62;
        }
        if (([v42 hasSuffix:@"bytes"] & 1) == 0 && [v42 length])
        {
LABEL_88:

LABEL_89:
          a6 = v63;
          id v10 = v64;
LABEL_103:

LABEL_104:
          if (v33[v84[0] - 1] == 10) {
            v33[v84[0] - 1] = 0;
          }
          fprintf((FILE *)*MEMORY[0x1E4F143C8], "parse error with line: '%s'\n", v33);
          uint64_t v21 = (VMUCallTreeRoot *)p_isa;
LABEL_20:
          if (v68) {
            id *v68 = 0;
          }
          BOOL v25 = v69;
          if (a5) {
            *a5 = 0;
          }
          if (a6) {
            *a6 = 0;
          }

          v26 = 0;
LABEL_27:
          v27 = v71;
          goto LABEL_28;
        }
LABEL_63:
        float v45 = *(float *)&v79;
        if (![v23 scanCharactersFromSet:v70 intoString:0]
          || ![v23 scanCharactersFromSet:v75 intoString:0])
        {
          goto LABEL_88;
        }
        unint64_t v39 = (unint64_t)v45;

LABEL_66:
        uint64_t v46 = [v23 scanLocation];
        id v80 = 0;
        [v23 scanUpToCharactersFromSet:v73 intoString:&v80];
        id v47 = v80;
        uint64_t v48 = [v47 length];
        if (v48)
        {
          if (!v39)
          {
            uint64_t v57 = v46;
            id v49 = p_isa[14];
            id v50 = v47;
            id v47 = [v49 member:v50];
            if (!v47)
            {
              [v49 addObject:v50];
              id v47 = v50;
            }

            uint64_t v46 = v57;
            unint64_t v39 = 0;
LABEL_76:
            uint64_t v51 = [(VMUCallTreeNode *)v24 findOrAddChildWithName:v47 address:0 nodeSearchType:0 isLeafNode:0];
            long long v52 = (void *)v51;
            if (v51)
            {
              *(_DWORD *)(v51 + 40) = v82;
              *(void *)(v51 + 32) = v39;
              uint64_t v79 = 0;
              if ((v61 & 1) != 0
                && ([(id)v51 parseNameIntoSymbol:0 library:0 loadAddress:0 offset:0 address:&v79 suffix:0], (uint64_t v53 = v79) != 0))
              {
                char v61 = 1;
              }
              else
              {
                [v23 setScanLocation:v46];
                [v23 scanUpToString:@"0x" intoString:0];
                [v23 scanHexLongLong:&v79];
                uint64_t v53 = v79;
                char v61 = 0;
                if (!v79)
                {
                  uint64_t v79 = v59;
                  uint64_t v53 = v59++;
                }
              }
              v52[3] = v53;
              [v72 addObject:v52];
              v58 = v52;
              long long v54 = v52;

              [v71 addObject:v62];
              id v55 = v62;

              if ((id *)v54->super._parent == p_isa)
              {
                *((_DWORD *)p_isa + 10) += v82;
                p_isa[4] = (char *)p_isa[4] + v39;
              }
              unint64_t v24 = v54;
              uint64_t v22 = v55;
              long long v52 = v58;
            }

            int v30 = 1;
            v32 = v24;
            v31 = v22;
            uint64_t v29 = v23;
            id v34 = context;
            goto LABEL_46;
          }
          if (([v47 isEqualToString:kVMURootNodeNameForMallocCallTrees[0]] & 1) == 0) {
            goto LABEL_76;
          }
        }
        else
        {
          char v65 = 1;
        }

        int v30 = 1;
        uint64_t v19 = v78;
        if (!v48) {
          goto LABEL_91;
        }
        break;
      case 2:
        goto LABEL_37;
      case 3:
        goto LABEL_45;
      default:
        goto LABEL_46;
    }
LABEL_47:
    uint64_t v29 = v23;
    v31 = v22;
    v32 = v24;
    if (feof(v19)) {
      goto LABEL_91;
    }
  }
  unint64_t v24 = v32;
  uint64_t v22 = v31;
  uint64_t v23 = v29;
LABEL_91:
  id v10 = v64;
  a5 = v66;
  if (!v30 || (v65 & 1) != 0)
  {
    a6 = v63;
    uint64_t v21 = (VMUCallTreeRoot *)p_isa;
    if (v65) {
      goto LABEL_104;
    }
    goto LABEL_20;
  }
  [p_isa allBacktracesHaveBeenAdded];
  BOOL v25 = v69;
  if (v68) {
    id *v68 = v69;
  }
  if (v66) {
    id *v66 = v77;
  }
  if (v63)
  {
    id v56 = v76;
    id *v63 = v56;
    objc_storeStrong(p_isa + 18, v56);
    v26 = p_isa;
    goto LABEL_27;
  }
  v27 = v71;
  v26 = p_isa;
LABEL_28:
  uint64_t v12 = v26;

  id v15 = v12;
LABEL_29:

LABEL_30:
  return v15;
}

- (id)chargeSystemLibrariesToCallersAndKeepBoundaries:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = self;
  if (v4->_binaryImagesDescription)
  {
    BOOL v20 = v3;
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    binaryImages = v4->_binaryImages;
    if (!binaryImages)
    {
      uint64_t v7 = +[VMUProcessDescription parseBinaryImagesDescription:v4->_binaryImagesDescription];
      uint64_t v8 = v4->_binaryImages;
      v4->_binaryImages = (NSArray *)v7;

      binaryImages = v4->_binaryImages;
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    int v9 = binaryImages;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v15 = [v14 objectForKey:@"ExecutablePath"];
          if (isSystemPath((const char *)[v15 UTF8String]))
          {
            uint64_t v16 = [v14 objectForKey:@"DisplayName"];
            if ([v16 length]) {
              [v5 addObject:v16];
            }
          }
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    if (v20) {
      uint64_t v17 = @"KEEP-BOUNDARIES PLACEHOLDER";
    }
    else {
      uint64_t v17 = 0;
    }
    uint64_t v18 = [(VMUCallTreeNode *)v4 chargeLibrariesInSet:v5 toCaller:0 parentLibrary:v17];

    uint64_t v4 = (VMUCallTreeRoot *)v18;
  }

  return v4;
}

- (NSString)binaryImagesDescription
{
  return self->_binaryImagesDescription;
}

- (void)setBinaryImagesDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binaryImages, 0);
  objc_storeStrong((id *)&self->_binaryImagesDescription, 0);
  objc_storeStrong((id *)&self->_threadPortToNameMap, 0);
  objc_storeStrong((id *)&self->_addressToLeafSymbolNameMap, 0);
  objc_storeStrong((id *)&self->_addressToSymbolNameMap, 0);
  objc_storeStrong((id *)&self->_uniqueNodeNames, 0);
  objc_storeStrong((id *)&self->_sampler, 0);
  objc_storeStrong((id *)&self->_vmRegions, 0);

  objc_storeStrong((id *)&self->_stackLogReader, 0);
}

@end