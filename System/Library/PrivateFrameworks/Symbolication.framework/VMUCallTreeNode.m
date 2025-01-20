@interface VMUCallTreeNode
+ (id)makeFakeRootForNode:(id)a3;
+ (id)nodeWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6;
+ (id)rootForSamples:(id)a3 symbolicator:(_CSTypeRef)a4;
+ (id)rootForSamples:(id)a3 symbolicator:(_CSTypeRef)a4 sampler:(id)a5 options:(unint64_t)a6;
- (BOOL)callTreeHasBranches;
- (BOOL)isMallocBlockContentNode;
- (BOOL)isPseudo;
- (BOOL)symbolNameIsUnknown;
- (VMUCallTreeNode)initWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6;
- (id)allChildren;
- (id)browserName;
- (id)chargeLibrariesInSet:(id)a3 toCaller:(id)a4 parentLibrary:(id)a5;
- (id)chargeLibrariesToCallers:(id)a3 keepBoundaries:(BOOL)a4;
- (id)childAtIndex:(unsigned int)a3;
- (id)description;
- (id)filterOutSymbols:(id)a3;
- (id)filterOutSymbols:(id)a3 required:(id)a4;
- (id)findOrAddChildWithName:(id)a3 address:(unint64_t)a4;
- (id)findOrAddChildWithName:(id)a3 address:(unint64_t)a4 nodeSearchType:(int)a5 isLeafNode:(BOOL)a6;
- (id)fullOutputWithThreshold:(unsigned int)a3;
- (id)fullOutputWithThreshold:(unsigned int)a3 showPseudoNodes:(BOOL)a4;
- (id)invertedNode;
- (id)largestTopOfStackPath;
- (id)name;
- (id)nameWithStringsForSymbol:(id)a3 library:(id)a4 loadAddress:(id)a5 offset:(id)a6 address:(id)a7 suffix:(id)a8;
- (id)nameWithoutOffset;
- (id)parent;
- (id)pruneCount:(unsigned int)a3;
- (id)pruneMallocSize:(unint64_t)a3;
- (id)pseudoName;
- (id)pseudoNodeTopOfStackChild;
- (id)sortedChildrenWithPseudoNode;
- (id)sortedChildrenWithPseudoNode:(id)a3 withCompare:(SEL)a4;
- (id)stringFromCallTreeIndentIfNoBranches:(BOOL)a3;
- (id)stringFromCallTreeIndentIfNoBranches:(BOOL)a3 showPseudoNodes:(BOOL)a4;
- (id)stringFromCallTreeWithOptions:(unint64_t)a3;
- (int64_t)compare:(id)a3;
- (int64_t)comparePuttingMainThreadFirst:(id)a3;
- (int64_t)comparePuttingRetainCycleNodesAtTop:(id)a3;
- (int64_t)compareSizeAndCount:(id)a3;
- (unint64_t)address;
- (unint64_t)numBytes;
- (unsigned)count;
- (unsigned)numChildren;
- (unsigned)sumOfChildCounts;
- (void)_printCallTreeToFile:(__sFILE *)a3 cumulativeOutput:(id)a4 indentString:(id)a5 branchPointCount:(unsigned int)a6 topFunctions:(id)a7 options:(unint64_t)a8;
- (void)addChild:(id)a3;
- (void)countFunctionOccurrencesInTree:(id)a3;
- (void)dealloc;
- (void)getBrowserName:(id)a3;
- (void)parseNameIntoSymbol:(id *)a3 library:(id *)a4 loadAddress:(unint64_t *)a5 offset:(unint64_t *)a6 address:(unint64_t *)a7 suffix:(id *)a8;
- (void)printCallTree;
- (void)printCallTreeToFile:(__sFILE *)a3;
- (void)printCallTreeToFile:(__sFILE *)a3 cumulativeOutput:(id)a4 options:(unint64_t)a5;
- (void)setChildren:(id)a3;
@end

@implementation VMUCallTreeNode

+ (id)rootForSamples:(id)a3 symbolicator:(_CSTypeRef)a4 sampler:(id)a5 options:(unint64_t)a6
{
  unint64_t opaque_2 = a4._opaque_2;
  unint64_t opaque_1 = a4._opaque_1;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v12 = -[VMUCallTreeRoot initWithSymbolicator:sampler:options:]([VMUCallTreeRoot alloc], "initWithSymbolicator:sampler:options:", opaque_1, opaque_2, v11, a6);
  uint64_t Task = CSSymbolicatorGetTask();
  if (Task)
  {
    uint64_t v14 = Task;
    if (CSTaskIsTranslated())
    {
      v15 = [[VMUVMRegionIdentifier alloc] initWithTask:v14 options:1281];
      v16 = [(VMUVMRegionIdentifier *)v15 regions];
      [(VMUCallTreeRoot *)v12 setVMRegions:v16];
      v49[0] = 0;
      v49[1] = v49;
      v49[2] = 0x3010000000;
      v49[4] = 0;
      v49[5] = 0;
      v49[3] = &unk_1A7D91765;
      v17 = [NSString stringWithUTF8String:VMUOAHRuntimeLocation()];
      uint64_t v43 = MEMORY[0x1E4F143A8];
      uint64_t v44 = 3221225472;
      v45 = __63__VMUCallTreeNode_rootForSamples_symbolicator_sampler_options___block_invoke;
      v46 = &unk_1E5D23DF8;
      id v18 = v17;
      id v47 = v18;
      v48 = v49;
      CSSymbolicatorForeachSymbolOwnerAtTime();
      if ((CSIsNull() & 1) == 0)
      {
        v34 = v15;
        uint64_t BaseAddress = CSSymbolOwnerGetBaseAddress();
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        v33 = v16;
        id v20 = v16;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v51 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v40;
          while (2)
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v40 != v22) {
                objc_enumerationMutation(v20);
              }
              v24 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              unint64_t v25 = BaseAddress - [v24 range:v33];
              if (v25 < v26)
              {
                [(VMUCallTreeRoot *)v12 setCambriaRuntimeVMObjectID:v24[14]];
                goto LABEL_14;
              }
            }
            uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v51 count:16];
            if (v21) {
              continue;
            }
            break;
          }
        }
LABEL_14:

        v16 = v33;
        v15 = v34;
      }

      _Block_object_dispose(v49, 8);
    }
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v27 = v10;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v35 objects:v50 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v36 != v29) {
          objc_enumerationMutation(v27);
        }
        id v31 = -[VMUCallTreeRoot addBacktrace:](v12, "addBacktrace:", *(void *)(*((void *)&v35 + 1) + 8 * j), v33);
      }
      uint64_t v28 = [v27 countByEnumeratingWithState:&v35 objects:v50 count:16];
    }
    while (v28);
  }

  return v12;
}

void __63__VMUCallTreeNode_rootForSamples_symbolicator_sampler_options___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = [NSString stringWithUTF8String:CSSymbolOwnerGetPath()];
  if (([v7 hasPrefix:*(void *)(a1 + 32)] & 1) != 0
    || [v7 hasPrefix:@"/usr/local/libexec/rosetta/runtime"])
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v6 + 32) = a2;
    *(void *)(v6 + 40) = a3;
  }
}

+ (id)rootForSamples:(id)a3 symbolicator:(_CSTypeRef)a4
{
  return (id)[a1 rootForSamples:a3 symbolicator:a4._opaque_1 sampler:a4._opaque_2 options:0];
}

+ (id)nodeWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithName:v10 address:a4 count:v7 numBytes:a6];

  return v11;
}

- (VMUCallTreeNode)initWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VMUCallTreeNode;
  v12 = [(VMUCallTreeNode *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    v13->_count = a5;
    v13->_address = a4;
    v13->_numBytes = a6;
  }

  return v13;
}

- (unsigned)numChildren
{
  return self->_numChildren;
}

- (id)childAtIndex:(unsigned int)a3
{
  p_children = &self->_children;
  if (self->_numChildren != 1) {
    p_children = (void **)((char *)*p_children + 8 * a3);
  }
  return *p_children;
}

- (id)allChildren
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(VMUCallTreeNode *)self numChildren])
  {
    uint64_t v4 = 0;
    do
    {
      v5 = [(VMUCallTreeNode *)self childAtIndex:v4];
      [v3 addObject:v5];

      uint64_t v4 = (v4 + 1);
    }
    while (v4 < [(VMUCallTreeNode *)self numChildren]);
  }

  return v3;
}

- (void)setChildren:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int numChildren = self->_numChildren;
  p_children = &self->_children;
  if (numChildren >= 2)
  {
    uint64_t v7 = (void **)*p_children;
  }
  else
  {
    uint64_t v7 = &self->_children;
    if (!numChildren) {
      goto LABEL_9;
    }
  }
  unsigned int v8 = numChildren - 1;
  do
  {
    uint64_t v9 = v8;
    id v10 = v7[v8];
    v7[v8] = 0;

    --v8;
  }
  while (v9);
  if (self->_numChildren >= 2) {
    free(v7);
  }
LABEL_9:
  unsigned int v11 = [v4 count];
  self->_unsigned int numChildren = v11;
  if (v11 >= 2)
  {
    v12 = malloc_type_calloc(v11, 8uLL, 0x80040B8603338uLL);
    *p_children = v12;
    p_children = (void **)v12;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v4;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    int v16 = 0;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v13);
        }
        v19 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_storeStrong(&p_children[(v16 + i)], v19);
        v19[1] = self;
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      v16 += i;
    }
    while (v15);
  }
}

- (void)addChild:(id)a3
{
  v5 = a3;
  if (v5)
  {
    unsigned int numChildren = self->_numChildren;
    int v16 = v5;
    if (numChildren == 1)
    {
      children = self->_children;
      id v10 = (void **)malloc_type_calloc(2uLL, 8uLL, 0x80040B8603338uLL);
      self->_children = v10;
      unsigned int v11 = *v10;
      *id v10 = children;
      v12 = v10 + 1;
      id v8 = children;

      objc_storeStrong(v12, a3);
    }
    else if (numChildren)
    {
      id v13 = malloc_type_realloc(self->_children, 8 * (numChildren + 1), 0x80040B8603338uLL);
      self->_children = v13;
      *((void *)v13 + self->_numChildren) = 0;
      uint64_t v14 = self->_numChildren;
      uint64_t v15 = v16;
      id v8 = (id)*((void *)v13 + v14);
      *((void *)v13 + v14) = v15;
    }
    else
    {
      uint64_t v7 = v5;
      id v8 = self->_children;
      self->_children = v7;
    }

    ++self->_numChildren;
    v5 = v16;
    v16[1] = self;
  }
}

- (unsigned)sumOfChildCounts
{
  if (![(VMUCallTreeNode *)self numChildren]) {
    return 0;
  }
  uint64_t v3 = 0;
  unsigned int v4 = 0;
  do
  {
    v5 = [(VMUCallTreeNode *)self childAtIndex:v3];
    v4 += [v5 count];

    uint64_t v3 = (v3 + 1);
  }
  while (v3 < [(VMUCallTreeNode *)self numChildren]);
  return v4;
}

- (void)dealloc
{
  [(VMUCallTreeNode *)self setChildren:0];
  v3.receiver = self;
  v3.super_class = (Class)VMUCallTreeNode;
  [(VMUCallTreeNode *)&v3 dealloc];
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)VMUCallTreeNode;
  objc_super v3 = [(VMUCallTreeNode *)&v7 description];
  unsigned int v4 = [(VMUCallTreeNode *)self browserName];
  v5 = [v3 stringByAppendingFormat:@"  %@", v4];

  return v5;
}

+ (id)makeFakeRootForNode:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[VMUCallTreeNode nodeWithName:address:count:numBytes:](VMUCallTreeNode, @"nodeWithName:address:count:numBytes:", 0, 0, [v3 count], [v3 numBytes]);
  v5 = [MEMORY[0x1E4F1C978] arrayWithObject:v3];

  [v4 setChildren:v5];

  return v4;
}

- (id)parent
{
  return self->_parent;
}

- (unint64_t)address
{
  return self->_address;
}

- (unsigned)count
{
  return self->_count;
}

- (unint64_t)numBytes
{
  return self->_numBytes;
}

- (id)name
{
  return self->_name;
}

- (void)getBrowserName:(id)a3
{
  id v11 = a3;
  [v11 setString:&stru_1EFE27F38];
  unint64_t numBytes = self->_numBytes;
  if (numBytes)
  {
    float v5 = (float)numBytes;
    if (numBytes < 0x100000)
    {
      if (numBytes < 0x400)
      {
        [v11 appendFormat:@"%u (%qu bytes) %@", self->_count, self->_numBytes, self->_name];
      }
      else
      {
        float v7 = v5 * 0.00097656;
        if ((float)(v5 * 0.00097656) >= 10.0)
        {
          uint64_t count = self->_count;
          if (v7 >= 100.0) {
            [v11 appendFormat:@"%u (%.0fK) %@", count, v7, self->_name];
          }
          else {
            [v11 appendFormat:@"%u (%.1fK) %@", count, v7, self->_name];
          }
        }
        else
        {
          [v11 appendFormat:@"%u (%.2fK) %@", self->_count, v7, self->_name];
        }
      }
    }
    else
    {
      float v6 = v5 * 0.00000095367;
      if ((float)(v5 * 0.00000095367) >= 10.0)
      {
        uint64_t v8 = self->_count;
        if (v6 >= 100.0) {
          [v11 appendFormat:@"%u (%.0fM) %@", v8, v6, self->_name];
        }
        else {
          [v11 appendFormat:@"%u (%.1fM) %@", v8, v6, self->_name];
        }
      }
      else
      {
        [v11 appendFormat:@"%u (%.2fM) %@", self->_count, v6, self->_name];
      }
    }
  }
  else
  {
    [v11 appendFormat:@"%d %@", self->_count, self->_name, v10];
  }
}

- (id)browserName
{
  id v3 = objc_opt_new();
  [(VMUCallTreeNode *)self getBrowserName:v3];

  return v3;
}

- (BOOL)isPseudo
{
  return 0;
}

- (id)pseudoName
{
  return self->_name;
}

- (BOOL)symbolNameIsUnknown
{
  return [(NSString *)self->_name hasPrefix:kVMUUnknownSymbolName[0]];
}

- (BOOL)isMallocBlockContentNode
{
  return !self->_address && [(NSString *)self->_name hasPrefix:@"CONTENT:"];
}

- (id)nameWithoutOffset
{
  uint64_t v3 = [(NSString *)self->_name rangeOfString:@" + "];
  name = self->_name;
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    float v5 = name;
  }
  else
  {
    -[NSString substringToIndex:](name, "substringToIndex:");
    float v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)nameWithStringsForSymbol:(id)a3 library:(id)a4 loadAddress:(id)a5 offset:(id)a6 address:(id)a7 suffix:(id)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = [MEMORY[0x1E4F28E78] stringWithString:a3];
  v19 = v18;
  if (v13) {
    [v18 appendFormat:@"%@%@%@", @"  (in ", v13, @")"];
  }
  if (v14) {
    [v19 appendFormat:@"%@%@", @"  load address ", v14];
  }
  if (v15) {
    [v19 appendFormat:@"%@%@", @" + ", v15];
  }
  if (v16) {
    [v19 appendFormat:@"%@%@%@", @"  [", v16, @"]"];
  }
  if (v17) {
    [v19 appendString:v17];
  }

  return v19;
}

- (void)parseNameIntoSymbol:(id *)a3 library:(id *)a4 loadAddress:(unint64_t *)a5 offset:(unint64_t *)a6 address:(unint64_t *)a7 suffix:(id *)a8
{
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  if (a7) {
    *a7 = 0;
  }
  if (a8) {
    *a8 = 0;
  }
  id v16 = (id)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:self->_name];
  [v16 setCharactersToBeSkipped:0];
  [v16 scanUpToString:@"  (in " intoString:a3];
  [v16 scanString:@"  (in " intoString:0];
  [v16 scanUpToString:@"" intoString:a4];
  [v16 scanString:@"" intoString:nil];
  if ([v16 scanString:@"  load address " intoString:0]) {
    [v16 scanHexLongLong:a5];
  }
  if ([v16 scanString:@" + " intoString:0]
    && ([v16 scanHexLongLong:a6] & 1) == 0)
  {
    [v16 scanLongLong:a6];
  }
  if ([v16 scanString:@"  [" intoString:0])
  {
    [v16 scanHexLongLong:a7];
    [v16 scanString:@"]" intoString:0];
  }
  id v14 = v16;
  if (a8)
  {
    id v15 = [v16 string];
    [v15 substringFromIndex:[v16 scanLocation]];
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    id v14 = v16;
  }
}

- (id)findOrAddChildWithName:(id)a3 address:(unint64_t)a4 nodeSearchType:(int)a5 isLeafNode:(BOOL)a6
{
  id v9 = a3;
  uint64_t v10 = v9;
  uint64_t numChildren = self->_numChildren;
  p_children = &self->_children;
  if (numChildren >= 2) {
    p_children = (void **)*p_children;
  }
  if (a5 == 2)
  {
    if (numChildren)
    {
      uint64_t v13 = 0;
      while (![*((id *)p_children[v13] + 2) isEqualToString:v10])
      {
        if (++v13 >= (unint64_t)self->_numChildren) {
          goto LABEL_13;
        }
      }
      id v15 = p_children[v13];
      goto LABEL_16;
    }
LABEL_13:
    id v14 = [(id)objc_opt_class() nodeWithName:v10 address:a4 count:0 numBytes:0];
    [(VMUCallTreeNode *)self addChild:v14];
    goto LABEL_17;
  }
  if (a5 != 1 || !numChildren) {
    goto LABEL_13;
  }
  while (*((id *)*p_children + 2) != v9)
  {
    ++p_children;
    if (!--numChildren) {
      goto LABEL_13;
    }
  }
  id v15 = *p_children;
LABEL_16:
  id v14 = v15;
LABEL_17:

  return v14;
}

- (id)findOrAddChildWithName:(id)a3 address:(unint64_t)a4
{
  return [(VMUCallTreeNode *)self findOrAddChildWithName:a3 address:a4 nodeSearchType:2 isLeafNode:0];
}

- (int64_t)compareSizeAndCount:(id)a3
{
  int64_t v3 = *((void *)a3 + 4) - self->_numBytes;
  if (!v3) {
    int64_t v3 = *((unsigned int *)a3 + 10) - (unint64_t)self->_count;
  }
  BOOL v4 = v3 < 0;
  int64_t v5 = v3 != 0;
  if (v4) {
    return -1;
  }
  else {
    return v5;
  }
}

- (int64_t)compare:(id)a3
{
  BOOL v4 = a3;
  NSComparisonResult v5 = [(VMUCallTreeNode *)self compareSizeAndCount:v4];
  if (v5 == NSOrderedSame)
  {
    if (self->_address && [(NSString *)self->_name containsString:@"  (in ")]
    {
      float v6 = (void *)MEMORY[0x1AD0D9F90]();
      id v20 = 0;
      id v21 = 0;
      id v19 = 0;
      [(VMUCallTreeNode *)self parseNameIntoSymbol:&v21 library:&v20 loadAddress:0 offset:0 address:0 suffix:&v19];
      id v7 = v21;
      id v8 = v20;
      id v9 = v19;
      id v17 = 0;
      id v18 = 0;
      id v16 = 0;
      [v4 parseNameIntoSymbol:&v18 library:&v17 loadAddress:0 offset:0 address:0 suffix:&v16];
      id v10 = v18;
      id v11 = v17;
      id v12 = v16;
      if (v7)
      {
        if (v10)
        {
          NSComparisonResult v5 = [v7 compare:v10];
          if (v5) {
            goto LABEL_22;
          }
        }
      }
      if (v8)
      {
        if (v11)
        {
          NSComparisonResult v5 = [v8 compare:v11];
          if (v5) {
            goto LABEL_22;
          }
        }
      }
      if (v9)
      {
        if (v12)
        {
          NSComparisonResult v5 = [v9 compare:v12];
          if (v5) {
            goto LABEL_22;
          }
        }
      }
      if (-[VMUCallTreeNode numChildren](self, "numChildren") && ![v4 numChildren]) {
        goto LABEL_17;
      }
      if (!-[VMUCallTreeNode numChildren](self, "numChildren") && [v4 numChildren])
      {
        NSComparisonResult v5 = NSOrderedDescending;
        goto LABEL_22;
      }
      unint64_t address = self->_address;
      unint64_t v14 = v4[3];
      if (address >= v14) {
        NSComparisonResult v5 = (unint64_t)(address > v14);
      }
      else {
LABEL_17:
      }
        NSComparisonResult v5 = NSOrderedAscending;
LABEL_22:

      goto LABEL_23;
    }
    NSComparisonResult v5 = [(NSString *)self->_name compare:v4[2]];
  }
LABEL_23:

  return v5;
}

- (int64_t)comparePuttingRetainCycleNodesAtTop:(id)a3
{
  BOOL v4 = (id *)a3;
  NSComparisonResult v5 = [(VMUCallTreeNode *)self parent];
  float v6 = [v5 parent];
  if (v6)
  {
  }
  else
  {
    id v7 = [v4 parent];
    id v8 = [v7 parent];

    if (!v8) {
      goto LABEL_13;
    }
  }
  id v9 = v4[4];
  if (!self->_numBytes)
  {
    if (v9)
    {
      int64_t v13 = -1;
      goto LABEL_15;
    }
LABEL_13:
    int64_t v13 = [(VMUCallTreeNode *)self compare:v4];
    goto LABEL_15;
  }
  if (!v9)
  {
    int64_t v13 = 1;
    goto LABEL_15;
  }
  BOOL v10 = [(NSString *)self->_name containsString:kVMURootRetainCycle[0]];
  int v11 = [v4[2] containsString:kVMURootRetainCycle[0]];
  int v12 = !v10;
  if (v11 | !v10) {
    int64_t v13 = 1;
  }
  else {
    int64_t v13 = -1;
  }
  if (v11 != v12) {
    goto LABEL_13;
  }
LABEL_15:

  return v13;
}

- (int64_t)comparePuttingMainThreadFirst:(id)a3
{
  BOOL v4 = (id *)a3;
  NSComparisonResult v5 = [(VMUCallTreeNode *)self name];
  float v6 = [v4 name];
  if ([v5 hasPrefix:kVMUThreadNamePrefix]
    && (([v5 rangeOfString:kVMUMainThreadName[0]], v7)
     || ([v5 rangeOfString:kVMUMainThreadDispatchQueueName], v8)))
  {
    int64_t v9 = -1;
  }
  else if ([v6 hasPrefix:kVMUThreadNamePrefix] {
         && (([v6 rangeOfString:kVMUMainThreadName[0]], v10)
  }
          || ([v6 rangeOfString:kVMUMainThreadDispatchQueueName], v11)))
  {
    int64_t v9 = 1;
  }
  else
  {
    int64_t v9 = [(VMUCallTreeNode *)self compareSizeAndCount:v4];
    if (!v9)
    {
      unint64_t v12 = [(id)kVMUThreadNamePrefix length];
      if ([(NSString *)self->_name length] <= v12)
      {
        unint64_t v14 = 0;
      }
      else
      {
        int64_t v13 = [(NSString *)self->_name substringFromIndex:v12];
        unint64_t v14 = [v13 longLongValue];
      }
      if ([v4[2] length] <= v12)
      {
        unint64_t v16 = 0;
      }
      else
      {
        id v15 = [v4[2] substringFromIndex:v12];
        unint64_t v16 = [v15 longLongValue];
      }
      if (v14 < v16) {
        int64_t v9 = -1;
      }
      else {
        int64_t v9 = 1;
      }
    }
  }

  return v9;
}

- (id)pseudoNodeTopOfStackChild
{
  unsigned int v3 = [(VMUCallTreeNode *)self numChildren];
  if (v3)
  {
    unsigned int v4 = v3;
    int v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = [(VMUCallTreeNode *)self childAtIndex:v7];
      v5 += *(_DWORD *)(v8 + 40);
      v6 += *(void *)(v8 + 32);

      uint64_t v7 = (v7 + 1);
    }
    while (v4 != v7);
  }
  else
  {
    uint64_t v6 = 0;
    int v5 = 0;
  }
  unsigned int count = self->_count;
  uint64_t v10 = count - v5;
  if (count == v5)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v12 = self->_numBytes - v6;
    int64_t v13 = [(VMUCallTreeNode *)self pseudoName];
    uint64_t v11 = +[VMUCallTreeNode nodeWithName:v13 address:self->_address count:v10 numBytes:v12];
  }

  return v11;
}

- (id)sortedChildrenWithPseudoNode:(id)a3 withCompare:(SEL)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unsigned int numChildren = self->_numChildren;
  if (!v6)
  {
    if (numChildren == 1)
    {
      v15[0] = self->_children;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    }
    else
    {
      if (numChildren)
      {
        int64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:self->_children];
        uint64_t v11 = [v13 sortedArrayUsingSelector:a4];

        goto LABEL_14;
      }
      uint64_t v12 = [MEMORY[0x1E4F1C978] array];
    }
LABEL_12:
    uint64_t v11 = (void *)v12;
    goto LABEL_14;
  }
  if (!numChildren)
  {
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObject:v6];
    goto LABEL_12;
  }
  uint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithObject:v6];
  if (self->_numChildren)
  {
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = [(VMUCallTreeNode *)self childAtIndex:v9];
      [v8 addObject:v10];

      uint64_t v9 = (v9 + 1);
    }
    while (v9 < self->_numChildren);
  }
  uint64_t v11 = [v8 sortedArrayUsingSelector:a4];

LABEL_14:

  return v11;
}

- (id)sortedChildrenWithPseudoNode
{
  unsigned int numChildren = self->_numChildren;
  if (numChildren != 1)
  {
    if (!numChildren)
    {
      unsigned int v4 = [MEMORY[0x1E4F1C978] array];
      goto LABEL_10;
    }
    id v6 = 0;
    goto LABEL_8;
  }
  int v5 = self->_children;
  id v6 = v5;
  if (!v5 || v5[10] != self->_count)
  {
LABEL_8:
    uint64_t v7 = [(VMUCallTreeNode *)self pseudoNodeTopOfStackChild];
    unsigned int v4 = [(VMUCallTreeNode *)self sortedChildrenWithPseudoNode:v7 withCompare:sel_compare_];

    goto LABEL_9;
  }
  unsigned int v4 = [MEMORY[0x1E4F1C978] arrayWithObject:v5];
LABEL_9:

LABEL_10:

  return v4;
}

- (id)largestTopOfStackPath
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [MEMORY[0x1E4F1CA48] arrayWithObject:self];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v18 = self;
  unsigned int v4 = [(VMUCallTreeNode *)self sortedChildrenWithPseudoNode];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unsigned int v7 = 0;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = [v10 largestTopOfStackPath];
        if ([v11 count])
        {
          id v12 = [v11 lastObject];
        }
        else
        {
          id v12 = v10;
        }
        int64_t v13 = v12;
        unsigned int v14 = [v12 count];
        if (v14 > v7)
        {
          unsigned int v15 = v14;
          unint64_t v16 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v11 count] + 1];

          [v16 addObject:v18];
          [v16 addObjectsFromArray:v11];
          unsigned int v7 = v15;
          unsigned int v3 = v16;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_printCallTreeToFile:(__sFILE *)a3 cumulativeOutput:(id)a4 indentString:(id)a5 branchPointCount:(unsigned int)a6 topFunctions:(id)a7 options:(unint64_t)a8
{
  id v51 = a4;
  id v12 = a5;
  int64_t v13 = (NSMapTable *)a7;
  unsigned int v14 = (void *)MEMORY[0x1AD0D9F90]();
  table = v13;
  if (v13 || (a8 & 1) != 0)
  {
    unint64_t v16 = [(VMUCallTreeNode *)self pseudoNodeTopOfStackChild];
    unsigned int v15 = v16;
    if (v16)
    {
      if (v13)
      {
        if ([v16 symbolNameIsUnknown])
        {
          id v17 = v15[2];
        }
        else
        {
          id v17 = [v15 nameWithoutOffset];
        }
        id v18 = v17;
        long long v19 = NSMapGet(table, v17);
        if (!v19)
        {
          long long v19 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
          void *v19 = 0;
          v19[1] = 0;
          NSMapInsertKnownAbsent(table, v18, v19);
        }
        uint64_t v20 = (uint64_t)v15[4] + v19[1];
        *v19 += *((unsigned int *)v15 + 10);
        v19[1] = v20;
      }
      if (![(VMUCallTreeNode *)self numChildren]) {
        goto LABEL_76;
      }
    }
  }
  else
  {
    unsigned int v15 = 0;
  }
  long long v21 = sel_compare_;
  if ((a8 & 0x80) == 0)
  {
    if ((a8 & 0x40) != 0)
    {
      long long v21 = sel_comparePuttingRetainCycleNodesAtTop_;
    }
    else if (!self->_parent {
           || !self->_numChildren && [(NSString *)self->_name hasPrefix:kVMUThreadNamePrefix])
    }
    {
      long long v21 = sel_comparePuttingMainThreadFirst_;
    }
  }
  if ((a8 & 1) == 0)
  {

    unsigned int v15 = 0;
  }
  v45 = [(VMUCallTreeNode *)self sortedChildrenWithPseudoNode:v15 withCompare:v21];
  unint64_t v22 = [v45 count];
  v50 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:1024];
  if (v22 <= 1) {
    unsigned int v23 = a6;
  }
  else {
    unsigned int v23 = a6 + 1;
  }
  unsigned int v44 = v23;
  id v24 = [(VMUCallTreeNode *)self parent];
  long long v42 = v14;
  if (v24)
  {
    uint64_t v25 = self;
  }
  else
  {
    uint64_t v25 = self;
    if ([(VMUCallTreeNode *)self numBytes])
    {
      if ([(VMUCallTreeNode *)self numChildren] < 2) {
        goto LABEL_28;
      }
      if (v51) {
        id v40 = v51;
      }
      else {
        id v40 = (id)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:256];
      }
      id v24 = v40;
      if (v12) {
        [v40 appendString:v12];
      }
      [(VMUCallTreeNode *)self getBrowserName:v50];
      [v24 appendFormat:@"%@%@\n", v50, kVMURootNodeNameForMallocCallTrees[0]];
      [v12 appendString:@"  "];
      if (!v51)
      {
        id v24 = v24;
        fputs((const char *)[v24 UTF8String], a3);
      }
    }
  }

LABEL_28:
  long long v41 = v15;
  if ((a8 & 8) != 0) {
    unint64_t v26 = "   ";
  }
  else {
    unint64_t v26 = "  ";
  }
  id v27 = v50;
  if (v22)
  {
    unint64_t v28 = 0;
    BOOL v48 = 0;
    uint64_t v29 = 2;
    if ((a8 & 8) != 0) {
      uint64_t v29 = 3;
    }
    uint64_t v43 = v29;
    do
    {
      v30 = [v45 objectAtIndex:v28];
      id v31 = (void *)MEMORY[0x1AD0D9F90]();
      if (v51) {
        id v32 = v51;
      }
      else {
        id v32 = (id)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:256];
      }
      v33 = v32;
      v34 = [(VMUCallTreeNode *)v25 parent];
      if (v34 || [(VMUCallTreeNode *)v25 numChildren] < 2)
      {
      }
      else if ([v30 numChildren] != 0 || v48)
      {
        if ((a8 & 2) != 0)
        {
          [v33 appendString:@"\n"];
        }
        else if ((a8 & 4) != 0)
        {
          [v33 appendFormat:@"%@----\n", v12];
        }
      }
      BOOL v48 = [v30 numChildren] != 0;
      if (v12) {
        [v33 appendString:v12];
      }
      uint64_t v35 = [(VMUCallTreeNode *)v25 parent];
      long long v36 = (void *)v35;
      if (v28 == 10 && v35 && v22 >= 0xC && [v30 numChildren] <= 1)
      {
        char v37 = [v30 isMallocBlockContentNode];

        if (v37)
        {
          [v33 appendFormat:@"%lu ADDITIONAL CHILDREN\n", v22 - 10];

          id v27 = v50;
          break;
        }
      }
      else
      {
      }
      id v27 = v50;
      if ((a8 & 0x40) != 0 && ![v30 count])
      {
        long long v39 = [v30 name];
        [v50 setString:v39];

        id v27 = v50;
      }
      else
      {
        [v30 getBrowserName:v50];
      }
      uint64_t v25 = self;
      [v33 appendFormat:@"%@\n", v27];
      if (v12)
      {
        long long v38 = (char *)v26;
        if ((a8 & 8) == 0)
        {
          long long v38 = (char *)v26;
          if (v22 >= 2)
          {
            long long v38 = (char *)v26;
            if (v28 < v22 - 1) {
              long long v38 = off_1E5D23E18[v44 & 3];
            }
          }
        }
        [v12 appendFormat:@"%s", v38];
      }
      if (!v51) {
        fputs((const char *)[v33 UTF8String], a3);
      }

      [v30 _printCallTreeToFile:a3 cumulativeOutput:v51 indentString:v12 branchPointCount:v44 topFunctions:table options:a8];
      if (v12) {
        [v12 deleteCharactersInRange:NSMakeRange(v12.length - v43, v43)];
      }

      ++v28;
    }
    while (v22 != v28);
  }

  unsigned int v15 = v41;
  unsigned int v14 = v42;
LABEL_76:
}

- (void)countFunctionOccurrencesInTree:(id)a3
{
  id v8 = a3;
  [v8 addObject:self->_name];
  unsigned int v4 = [(VMUCallTreeNode *)self numChildren];
  if (v4)
  {
    unsigned int v5 = v4;
    uint64_t v6 = 0;
    do
    {
      unsigned int v7 = [(VMUCallTreeNode *)self childAtIndex:v6];
      [v7 countFunctionOccurrencesInTree:v8];

      uint64_t v6 = (v6 + 1);
    }
    while (v5 != v6);
  }
}

- (id)fullOutputWithThreshold:(unsigned int)a3 showPseudoNodes:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  unsigned int v7 = objc_opt_new();
  id v8 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:259];
  [v7 appendString:@"Call graph:\n"];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
  [v9 setString:kVMUCallTreeInitialIndentation];
  long long v38 = v9;
  [(VMUCallTreeNode *)self _printCallTreeToFile:0 cumulativeOutput:v7 indentString:v9 branchPointCount:0 topFunctions:v8 options:v4];
  [v7 appendString:@"\n"];
  [v7 appendFormat:@"Total number in stack (recursive counted multiple, when >=%d):\n", v5];
  id v10 = v7;
  uint64_t v11 = self;
  context = (void *)MEMORY[0x1AD0D9F90]();
  id v12 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  [(VMUCallTreeNode *)v11 countFunctionOccurrencesInTree:v12];
  int64_t v13 = [v12 allObjects];
  uint64_t v43 = MEMORY[0x1E4F143A8];
  uint64_t v44 = 3221225472;
  char v37 = &v45;
  v45 = __printTotalNumberInStack_block_invoke;
  v46 = &unk_1E5D23E40;
  unsigned int v14 = (NSMapTable *)v12;
  id v47 = v14;
  unsigned int v15 = [v13 sortedArrayUsingComparator:&v43];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v16 = v15;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        unint64_t v22 = [(NSMapTable *)v14 countForObject:v21];
        if (v22 >= v5) {
          [v10 appendFormat:@"        %lu       %@\n", v22, v21, context, v37];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v18);
  }

  [v10 appendFormat:@"\n"];

  [v10 appendString:@"Sort by top of stack, same collapsed (when >= 5):\n"];
  id v23 = v10;
  id v24 = v8;
  uint64_t v25 = NSAllMapTableKeys(v24);
  uint64_t v43 = MEMORY[0x1E4F143A8];
  uint64_t v44 = 3221225472;
  v45 = __printCollapsedTops_block_invoke;
  v46 = &unk_1E5D23E40;
  unint64_t v26 = v24;
  id v47 = v26;
  id v27 = [v25 sortedArrayUsingComparator:&v43];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v28 = v27;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v40 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(const void **)(*((void *)&v39 + 1) + 8 * j);
        unint64_t v34 = *(void *)NSMapGet(v26, v33);
        if (v34 >= 5) {
          [v23 appendFormat:@"        %@        %lu\n", v33, v34];
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v30);
  }

  return v23;
}

- (id)fullOutputWithThreshold:(unsigned int)a3
{
  return [(VMUCallTreeNode *)self fullOutputWithThreshold:*(void *)&a3 showPseudoNodes:1];
}

- (BOOL)callTreeHasBranches
{
  v2 = self;
  if (!v2) {
    return 0;
  }
  p_isa = (id *)&v2->super.isa;
  do
  {
    unsigned int v4 = [p_isa numChildren];
    if (v4 != 1) {
      break;
    }
    uint64_t v5 = (id *)p_isa[6];

    p_isa = v5;
  }
  while (v5);
  BOOL v6 = v4 > 1;

  return v6;
}

- (id)stringFromCallTreeWithOptions:(unint64_t)a3
{
  uint64_t v5 = objc_opt_new();
  if ((a3 & 0x10) != 0 || [(VMUCallTreeNode *)self callTreeHasBranches])
  {
    BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
    unsigned int v7 = v6;
    if ((a3 & 0x20) == 0) {
      [v6 setString:kVMUCallTreeInitialIndentation];
    }
  }
  else
  {
    unsigned int v7 = 0;
  }
  [(VMUCallTreeNode *)self _printCallTreeToFile:0 cumulativeOutput:v5 indentString:v7 branchPointCount:0 topFunctions:0 options:a3];

  return v5;
}

- (id)stringFromCallTreeIndentIfNoBranches:(BOOL)a3 showPseudoNodes:(BOOL)a4
{
  uint64_t v4 = 16;
  if (!a3) {
    uint64_t v4 = 0;
  }
  return [(VMUCallTreeNode *)self stringFromCallTreeWithOptions:v4 | a4];
}

- (id)stringFromCallTreeIndentIfNoBranches:(BOOL)a3
{
  return [(VMUCallTreeNode *)self stringFromCallTreeIndentIfNoBranches:a3 showPseudoNodes:1];
}

- (void)printCallTreeToFile:(__sFILE *)a3 cumulativeOutput:(id)a4 options:(unint64_t)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F28E78];
  id v9 = a4;
  id v10 = (id)[[v8 alloc] initWithCapacity:128];
  [v10 setString:kVMUCallTreeInitialIndentation];
  [(VMUCallTreeNode *)self _printCallTreeToFile:a3 cumulativeOutput:v9 indentString:v10 branchPointCount:0 topFunctions:0 options:a5];
}

- (void)printCallTreeToFile:(__sFILE *)a3
{
}

- (void)printCallTree
{
}

- (id)invertedNode
{
  unsigned int v3 = objc_alloc_init(VMUCallTreeNode);
  name = v3->_name;
  v3->_name = (NSString *)&stru_1EFE27F38;

  uint64_t v5 = (void *)MEMORY[0x1AD0D9F90]();
  BOOL v6 = [MEMORY[0x1E4F1CA48] array];
  unsigned int v7 = [(VMUCallTreeNode *)self numChildren];
  if (v7)
  {
    unsigned int v8 = v7;
    uint64_t v9 = 0;
    do
    {
      id v10 = [(VMUCallTreeNode *)self childAtIndex:v9];
      invertRecursiveWithNewInvertedRoot(v10, v3, v6);

      uint64_t v9 = (v9 + 1);
    }
    while (v8 != v9);
  }

  return v3;
}

- (id)filterOutSymbols:(id)a3 required:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[NSString length](self->_name, "length") && ([v6 containsObject:self->_name] & 1) != 0)
  {
    unsigned int v8 = 0;
  }
  else
  {
    id v26 = 0;
    [(VMUCallTreeNode *)self parseNameIntoSymbol:&v26 library:0 loadAddress:0 offset:0 address:0 suffix:0];
    id v9 = v26;
    if ([v9 length] && [v6 containsObject:v9])
    {
      unsigned int v8 = 0;
    }
    else
    {
      if (v7 && [v7 containsObject:v9])
      {

        id v7 = 0;
      }
      unsigned int v10 = [(VMUCallTreeNode *)self numChildren];
      if (v10)
      {
        unsigned int v11 = v10;
        uint64_t v12 = 0;
        int v13 = 0;
        do
        {
          unsigned int v14 = [(VMUCallTreeNode *)self childAtIndex:v12];
          v13 += v14[10];

          uint64_t v12 = (v12 + 1);
        }
        while (v11 != v12);
        id v25 = v9;
        if (v13 == self->_count
          || ([(VMUCallTreeNode *)self pseudoName],
              unsigned int v15 = objc_claimAutoreleasedReturnValue(),
              char v16 = [v6 containsObject:v15],
              v15,
              (v16 & 1) != 0))
        {
          uint64_t v17 = 0;
        }
        else
        {
          uint64_t v17 = self->_count - v13;
        }
        uint64_t v18 = 0;
        id v19 = 0;
        uint64_t v20 = 0;
        if (v11 <= 1) {
          int v21 = 1;
        }
        else {
          int v21 = v11;
        }
        do
        {
          unint64_t v22 = -[VMUCallTreeNode childAtIndex:](self, "childAtIndex:", v18, v25);
          id v23 = [v22 filterOutSymbols:v6 required:v7];
          if (v23)
          {
            if (!v19) {
              id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            [v19 addObject:v23];
            uint64_t v17 = [v23 count] + v17;
            v20 += v23[4];
          }

          uint64_t v18 = (v18 + 1);
        }
        while (v21 != v18);
        if (![(NSString *)self->_name length] || v17)
        {
          unsigned int v8 = [(id)objc_opt_class() nodeWithName:self->_name address:self->_address count:v17 numBytes:v20];
          [(VMUCallTreeNode *)v8 setChildren:v19];
        }
        else
        {
          unsigned int v8 = 0;
        }
        id v9 = v25;
      }
      else
      {
        unsigned int v8 = self;
      }
    }
  }

  return v8;
}

- (id)filterOutSymbols:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithArray:v5];

  id v7 = [(VMUCallTreeNode *)self filterOutSymbols:v6 required:0];

  return v7;
}

- (id)chargeLibrariesInSet:(id)a3 toCaller:(id)a4 parentLibrary:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = (void *)MEMORY[0x1AD0D9F90]();
  id v22 = 0;
  [(VMUCallTreeNode *)self parseNameIntoSymbol:0 library:&v22 loadAddress:0 offset:0 address:0 suffix:0];
  id v12 = v22;
  if (![v12 length]) {
    goto LABEL_9;
  }
  if (v8)
  {
    if ([v8 containsObject:v12]) {
      goto LABEL_4;
    }
LABEL_9:
    id v14 = v10;
    if (v9)
    {
LABEL_7:
      uint64_t v15 = [v9 findOrAddChildWithName:self->_name address:self->_address nodeSearchType:1 isLeafNode:0];
      *(_DWORD *)(v15 + 40) += self->_count;
      *(void *)(v15 + 32) += self->_numBytes;

      id v9 = (id)v15;
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if (!isSystemPath((const char *)[v12 UTF8String])) {
    goto LABEL_9;
  }
LABEL_4:
  if (v10)
  {
    char v13 = [v12 isEqualToString:v10];
    id v14 = v12;

    if (v13) {
      goto LABEL_12;
    }
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    id v9 = [(id)objc_opt_class() nodeWithName:self->_name address:self->_address count:self->_count numBytes:self->_numBytes];
    goto LABEL_12;
  }
  id v14 = 0;
LABEL_12:
  unsigned int v16 = [(VMUCallTreeNode *)self numChildren];
  if (v16)
  {
    unsigned int v17 = v16;
    uint64_t v18 = 0;
    do
    {
      id v19 = [(VMUCallTreeNode *)self childAtIndex:v18];
      id v20 = (id)[v19 chargeLibrariesInSet:v8 toCaller:v9 parentLibrary:v14];

      uint64_t v18 = (v18 + 1);
    }
    while (v17 != v18);
  }

  return v9;
}

- (id)chargeLibrariesToCallers:(id)a3 keepBoundaries:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithArray:v7];

  if (v4) {
    id v9 = @"KEEP-BOUNDARIES PLACEHOLDER";
  }
  else {
    id v9 = 0;
  }
  id v10 = [(VMUCallTreeNode *)self chargeLibrariesInSet:v8 toCaller:0 parentLibrary:v9];

  return v10;
}

- (id)pruneCount:(unsigned int)a3
{
  if (self->_count >= a3)
  {
    uint64_t v4 = *(void *)&a3;
    unsigned int v6 = [(VMUCallTreeNode *)self numChildren];
    if (v6)
    {
      unsigned int v7 = v6;
      unsigned int v3 = [(id)objc_opt_class() nodeWithName:self->_name address:self->_address count:self->_count numBytes:self->_numBytes];
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v9 = 0;
      do
      {
        id v10 = [(VMUCallTreeNode *)self childAtIndex:v9];
        unsigned int v11 = v10;
        if (v10[10] >= v4)
        {
          id v12 = [v10 pruneCount:v4];
          [v8 addObject:v12];
        }
        uint64_t v9 = (v9 + 1);
      }
      while (v7 != v9);
      [(VMUCallTreeNode *)v3 setChildren:v8];
    }
    else
    {
      unsigned int v3 = self;
    }
  }
  else
  {
    unsigned int v3 = 0;
  }

  return v3;
}

- (id)pruneMallocSize:(unint64_t)a3
{
  if (self->_numBytes >= a3)
  {
    unsigned int v6 = [(VMUCallTreeNode *)self numChildren];
    if (v6)
    {
      unsigned int v7 = v6;
      unsigned int v3 = [(id)objc_opt_class() nodeWithName:self->_name address:self->_address count:self->_count numBytes:self->_numBytes];
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v9 = 0;
      do
      {
        id v10 = [(VMUCallTreeNode *)self childAtIndex:v9];
        unsigned int v11 = v10;
        if (v10[4] >= a3)
        {
          id v12 = [v10 pruneMallocSize:a3];
          [v8 addObject:v12];
        }
        uint64_t v9 = (v9 + 1);
      }
      while (v7 != v9);
      [(VMUCallTreeNode *)v3 setChildren:v8];
    }
    else
    {
      unsigned int v3 = self;
    }
  }
  else
  {
    unsigned int v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end