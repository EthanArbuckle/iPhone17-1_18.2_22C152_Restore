@interface VMUCallTreeLeafNode
- (VMUCallTreeLeafNode)init;
- (VMUCallTreeLeafNode)initWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6;
- (void)addAddress:(unint64_t)a3;
- (void)getBrowserName:(id)a3;
@end

@implementation VMUCallTreeLeafNode

- (VMUCallTreeLeafNode)initWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6
{
  v10.receiver = self;
  v10.super_class = (Class)VMUCallTreeLeafNode;
  v6 = [(VMUCallTreeNode *)&v10 initWithName:a3 address:a4 count:*(void *)&a5 numBytes:a6];
  if (v6)
  {
    v7 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    addresses = v6->_addresses;
    v6->_addresses = v7;
  }
  return v6;
}

- (VMUCallTreeLeafNode)init
{
  return [(VMUCallTreeLeafNode *)self initWithName:&stru_1EFE27F38 address:0 count:0 numBytes:0];
}

- (void)addAddress:(unint64_t)a3
{
  addresses = self->_addresses;
  v5 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSCountedSet *)addresses addObject:v5];

  combinedName = self->_combinedName;
  self->_combinedName = 0;
}

- (void)getBrowserName:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MEMORY[0x1AD0D9F90]();
  v6 = (void *)v5;
  if (!self->_combinedName)
  {
    v27 = (void *)v5;
    id v28 = v4;
    id v39 = 0;
    uint64_t v40 = 0;
    id v37 = 0;
    id v38 = 0;
    [(VMUCallTreeNode *)self parseNameIntoSymbol:&v39 library:&v38 loadAddress:0 offset:0 address:&v40 suffix:&v37];
    id v26 = v39;
    id v25 = v38;
    id v24 = v37;
    v7 = [(NSCountedSet *)self->_addresses allObjects];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __38__VMUCallTreeLeafNode_getBrowserName___block_invoke;
    v36[3] = &unk_1E5D255F8;
    v36[4] = self;
    v8 = [v7 sortedArrayUsingComparator:v36];

    id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    id v10 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v33;
      while (2)
      {
        uint64_t v16 = 0;
        uint64_t v29 = v14 + v13;
        uint64_t v30 = v14;
        do
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = v14 + v16;
          if ((unint64_t)(v14 + v16) > 1)
          {
            if (v17 == 2)
            {
              [v9 appendString:@",..."];
              [v10 appendString:@",..."];
              goto LABEL_16;
            }
          }
          else
          {
            v18 = *(void **)(*((void *)&v32 + 1) + 8 * v16);
            if (v17 == 1)
            {
              [v9 appendString:@","];
              uint64_t v14 = v30;
              [v10 appendString:@","];
            }
            uint64_t v19 = [v18 unsignedLongLongValue];
            [v9 appendFormat:@"%qu", v19 - v40];
            [v10 appendFormat:@"0x%qx", v19];
          }
          ++v16;
        }
        while (v13 != v16);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v41 count:16];
        uint64_t v14 = v29;
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_16:

    v20 = [(VMUCallTreeNode *)self nameWithStringsForSymbol:v26 library:v25 loadAddress:0 offset:v9 address:v10 suffix:v24];
    combinedName = self->_combinedName;
    self->_combinedName = v20;

    v6 = v27;
    id v4 = v28;
  }
  v22 = self->super._name;
  objc_storeStrong((id *)&self->super._name, self->_combinedName);
  v31.receiver = self;
  v31.super_class = (Class)VMUCallTreeLeafNode;
  [(VMUCallTreeNode *)&v31 getBrowserName:v4];
  name = self->super._name;
  self->super._name = v22;
}

uint64_t __38__VMUCallTreeLeafNode_getBrowserName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 56) countForObject:v5];
  unint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 56) countForObject:v6];
  if (v7 <= v8) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = -1;
  }
  if (v7 < v8) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = v9;
  }
  if (v7 == v8)
  {
    unint64_t v11 = [v5 unsignedLongLongValue];
    if (v11 < [v6 unsignedLongLongValue]) {
      uint64_t v12 = -1;
    }
    else {
      uint64_t v12 = v10;
    }
    unint64_t v13 = [v5 unsignedLongLongValue];
    if (v13 > [v6 unsignedLongLongValue]) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v12;
    }
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedName, 0);

  objc_storeStrong((id *)&self->_addresses, 0);
}

@end