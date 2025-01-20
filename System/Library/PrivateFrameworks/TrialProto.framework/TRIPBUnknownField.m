@interface TRIPBUnknownField
- (BOOL)isEqual:(id)a3;
- (NSArray)groupList;
- (NSArray)lengthDelimitedList;
- (TRIPBUInt32Array)fixed32List;
- (TRIPBUInt64Array)fixed64List;
- (TRIPBUInt64Array)varintList;
- (TRIPBUnknownField)initWithNumber:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)number;
- (unint64_t)hash;
- (unint64_t)serializedSize;
- (unint64_t)serializedSizeAsMessageSetExtension;
- (void)addFixed32:(unsigned int)a3;
- (void)addFixed64:(unint64_t)a3;
- (void)addGroup:(id)a3;
- (void)addLengthDelimited:(id)a3;
- (void)addVarint:(unint64_t)a3;
- (void)dealloc;
- (void)mergeFromField:(id)a3;
- (void)writeAsMessageSetExtensionToOutput:(id)a3;
- (void)writeToOutput:(id)a3;
@end

@implementation TRIPBUnknownField

- (TRIPBUnknownField)initWithNumber:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TRIPBUnknownField;
  result = [(TRIPBUnknownField *)&v5 init];
  if (result) {
    result->number_ = a3;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TRIPBUnknownField;
  [(TRIPBUnknownField *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_super v5 = [+[TRIPBUnknownField allocWithZone:](TRIPBUnknownField, "allocWithZone:") initWithNumber:self->number_];
  v5->mutableFixed32List_ = (TRIPBUInt32Array *)[(TRIPBUInt32Array *)self->mutableFixed32List_ copyWithZone:a3];
  v5->mutableFixed64List_ = (TRIPBUInt64Array *)[(TRIPBUInt64Array *)self->mutableFixed64List_ copyWithZone:a3];
  v5->mutableLengthDelimitedList_ = (NSMutableArray *)[(NSMutableArray *)self->mutableLengthDelimitedList_ mutableCopyWithZone:a3];
  v5->mutableVarintList_ = (TRIPBUInt64Array *)[(TRIPBUInt64Array *)self->mutableVarintList_ copyWithZone:a3];
  if ([(NSMutableArray *)self->mutableGroupList_ count])
  {
    v5->mutableGroupList_ = (NSMutableArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA48], "allocWithZone:", a3), "initWithCapacity:", -[NSMutableArray count](self->mutableGroupList_, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    mutableGroupList = self->mutableGroupList_;
    uint64_t v7 = [(NSMutableArray *)mutableGroupList countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(mutableGroupList);
          }
          v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * v10) copyWithZone:a3];
          [(NSMutableArray *)v5->mutableGroupList_ addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)mutableGroupList countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->number_ != *((_DWORD *)a3 + 2))
  {
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((!-[TRIPBUInt64Array count](self->mutableVarintList_, "count") && ![*((id *)a3 + 2) count]
     || (int v5 = [(TRIPBUInt64Array *)self->mutableVarintList_ isEqual:*((void *)a3 + 2)]) != 0)
    && (!-[TRIPBUInt32Array count](self->mutableFixed32List_, "count") && ![*((id *)a3 + 3) count]
     || (int v5 = [(TRIPBUInt32Array *)self->mutableFixed32List_ isEqual:*((void *)a3 + 3)]) != 0)
    && (!-[TRIPBUInt64Array count](self->mutableFixed64List_, "count") && ![*((id *)a3 + 4) count]
     || (int v5 = [(TRIPBUInt64Array *)self->mutableFixed64List_ isEqual:*((void *)a3 + 4)]) != 0)
    && (!-[NSMutableArray count](self->mutableLengthDelimitedList_, "count") && ![*((id *)a3 + 5) count]
     || (int v5 = [(NSMutableArray *)self->mutableLengthDelimitedList_ isEqual:*((void *)a3 + 5)]) != 0))
  {
    if (-[NSMutableArray count](self->mutableGroupList_, "count") || [*((id *)a3 + 6) count])
    {
      mutableGroupList = self->mutableGroupList_;
      uint64_t v7 = *((void *)a3 + 6);
      LOBYTE(v5) = [(NSMutableArray *)mutableGroupList isEqual:v7];
      return v5;
    }
LABEL_22:
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(TRIPBUInt64Array *)self->mutableVarintList_ hash];
  unint64_t v4 = [(TRIPBUInt32Array *)self->mutableFixed32List_ hash] - v3 + 32 * v3;
  unint64_t v5 = [(TRIPBUInt64Array *)self->mutableFixed64List_ hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSMutableArray *)self->mutableLengthDelimitedList_ hash] - v5 + 32 * v5;
  return [(NSMutableArray *)self->mutableGroupList_ hash] - v6 + 32 * v6 + 28629151;
}

- (void)writeToOutput:(id)a3
{
  if ([(TRIPBUInt64Array *)self->mutableVarintList_ count]) {
    [a3 writeUInt64Array:self->number_ values:self->mutableVarintList_ tag:0];
  }
  if ([(TRIPBUInt32Array *)self->mutableFixed32List_ count]) {
    [a3 writeFixed32Array:self->number_ values:self->mutableFixed32List_ tag:0];
  }
  if ([(TRIPBUInt64Array *)self->mutableFixed64List_ count]) {
    [a3 writeFixed64Array:self->number_ values:self->mutableFixed64List_ tag:0];
  }
  if ([(NSMutableArray *)self->mutableLengthDelimitedList_ count]) {
    [a3 writeBytesArray:self->number_ values:self->mutableLengthDelimitedList_];
  }
  if ([(NSMutableArray *)self->mutableGroupList_ count])
  {
    uint64_t number = self->number_;
    mutableGroupList = self->mutableGroupList_;
    [a3 writeUnknownGroupArray:number values:mutableGroupList];
  }
}

- (unint64_t)serializedSize
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  unsigned int number = self->number_;
  mutableVarintList = self->mutableVarintList_;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __35__TRIPBUnknownField_serializedSize__block_invoke;
  v35[3] = &unk_1E576BF00;
  v35[4] = &v37;
  unsigned int v36 = number;
  [(TRIPBUInt64Array *)mutableVarintList enumerateValuesWithBlock:v35];
  mutableFixed32List = self->mutableFixed32List_;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __35__TRIPBUnknownField_serializedSize__block_invoke_2;
  v33[3] = &unk_1E576BF28;
  v33[4] = &v37;
  unsigned int v34 = number;
  [(TRIPBUInt32Array *)mutableFixed32List enumerateValuesWithBlock:v33];
  mutableFixed64List = self->mutableFixed64List_;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __35__TRIPBUnknownField_serializedSize__block_invoke_3;
  v31[3] = &unk_1E576BF00;
  v31[4] = &v37;
  unsigned int v32 = number;
  [(TRIPBUInt64Array *)mutableFixed64List enumerateValuesWithBlock:v31];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  mutableLengthDelimitedList = self->mutableLengthDelimitedList_;
  uint64_t v8 = [(NSMutableArray *)mutableLengthDelimitedList countByEnumeratingWithState:&v27 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(mutableLengthDelimitedList);
        }
        uint64_t v11 = TRIPBComputeBytesSize(number, *(void **)(*((void *)&v27 + 1) + 8 * i));
        v38[3] += v11;
      }
      uint64_t v8 = [(NSMutableArray *)mutableLengthDelimitedList countByEnumeratingWithState:&v27 objects:v42 count:16];
    }
    while (v8);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  mutableGroupList = self->mutableGroupList_;
  uint64_t v13 = [(NSMutableArray *)mutableGroupList countByEnumeratingWithState:&v23 objects:v41 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v24;
    unsigned int v15 = 8 * number;
    uint64_t v16 = 10;
    if (((number >> 25) & 0xF) == 0) {
      uint64_t v16 = 8;
    }
    uint64_t v17 = 4;
    if (v15 < 0x80) {
      uint64_t v17 = 2;
    }
    if (v15 < 0x200000) {
      uint64_t v16 = 6;
    }
    if (v15 >= 0x4000) {
      uint64_t v18 = v16;
    }
    else {
      uint64_t v18 = v17;
    }
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(mutableGroupList);
        }
        uint64_t v20 = [*(id *)(*((void *)&v23 + 1) + 8 * j) serializedSize];
        v38[3] += v20 + v18;
      }
      uint64_t v13 = [(NSMutableArray *)mutableGroupList countByEnumeratingWithState:&v23 objects:v41 count:16];
    }
    while (v13);
  }
  unint64_t v21 = v38[3];
  _Block_object_dispose(&v37, 8);
  return v21;
}

uint64_t __35__TRIPBUnknownField_serializedSize__block_invoke(uint64_t a1, unint64_t a2)
{
  unsigned int v3 = 8 * *(_DWORD *)(a1 + 40);
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (v3 >> 28) {
    uint64_t v6 = 5;
  }
  if (v3 >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (v3 >= 0x80) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 1;
  }
  uint64_t result = TRIPBComputeRawVarint64Size(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result + v7;
  return result;
}

uint64_t __35__TRIPBUnknownField_serializedSize__block_invoke_2(uint64_t result)
{
  unsigned int v1 = 8 * *(_DWORD *)(result + 40);
  uint64_t v2 = 6;
  uint64_t v3 = 7;
  uint64_t v4 = 8;
  if (v1 >> 28) {
    uint64_t v4 = 9;
  }
  if (v1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (v1 >= 0x80) {
    uint64_t v5 = v2;
  }
  else {
    uint64_t v5 = 5;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v5;
  return result;
}

uint64_t __35__TRIPBUnknownField_serializedSize__block_invoke_3(uint64_t result)
{
  unsigned int v1 = 8 * *(_DWORD *)(result + 40);
  uint64_t v2 = 10;
  uint64_t v3 = 11;
  uint64_t v4 = 12;
  if (v1 >> 28) {
    uint64_t v4 = 13;
  }
  if (v1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (v1 >= 0x80) {
    uint64_t v5 = v2;
  }
  else {
    uint64_t v5 = 9;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v5;
  return result;
}

- (void)writeAsMessageSetExtensionToOutput:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  mutableLengthDelimitedList = self->mutableLengthDelimitedList_;
  uint64_t v6 = [(NSMutableArray *)mutableLengthDelimitedList countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(mutableLengthDelimitedList);
        }
        [a3 writeRawMessageSetExtension:self->number_ value:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v7 = [(NSMutableArray *)mutableLengthDelimitedList countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (unint64_t)serializedSizeAsMessageSetExtension
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  mutableLengthDelimitedList = self->mutableLengthDelimitedList_;
  uint64_t v4 = [(NSMutableArray *)mutableLengthDelimitedList countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  unint64_t v6 = 0;
  uint64_t v7 = *(void *)v11;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(mutableLengthDelimitedList);
      }
      v6 += TRIPBComputeRawMessageSetExtensionSize(self->number_, *(void **)(*((void *)&v10 + 1) + 8 * i));
    }
    uint64_t v5 = [(NSMutableArray *)mutableLengthDelimitedList countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v5);
  return v6;
}

- (id)description
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p>: Field: %d {\n", objc_opt_class(), self, self->number_];
  mutableVarintList = self->mutableVarintList_;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __32__TRIPBUnknownField_description__block_invoke;
  v28[3] = &unk_1E576BF50;
  v28[4] = v3;
  [(TRIPBUInt64Array *)mutableVarintList enumerateValuesWithBlock:v28];
  mutableFixed32List = self->mutableFixed32List_;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __32__TRIPBUnknownField_description__block_invoke_2;
  v27[3] = &unk_1E576BF78;
  v27[4] = v3;
  [(TRIPBUInt32Array *)mutableFixed32List enumerateValuesWithBlock:v27];
  mutableFixed64List = self->mutableFixed64List_;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __32__TRIPBUnknownField_description__block_invoke_3;
  v26[3] = &unk_1E576BF50;
  v26[4] = v3;
  [(TRIPBUInt64Array *)mutableFixed64List enumerateValuesWithBlock:v26];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  mutableLengthDelimitedList = self->mutableLengthDelimitedList_;
  uint64_t v8 = [(NSMutableArray *)mutableLengthDelimitedList countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(mutableLengthDelimitedList);
        }
        [v3 appendFormat:@"\t%@\n", *(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      uint64_t v9 = [(NSMutableArray *)mutableLengthDelimitedList countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v9);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  mutableGroupList = self->mutableGroupList_;
  uint64_t v13 = [(NSMutableArray *)mutableGroupList countByEnumeratingWithState:&v18 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(mutableGroupList);
        }
        [v3 appendFormat:@"\t%@\n", *(void *)(*((void *)&v18 + 1) + 8 * j)];
      }
      uint64_t v14 = [(NSMutableArray *)mutableGroupList countByEnumeratingWithState:&v18 objects:v29 count:16];
    }
    while (v14);
  }
  [v3 appendString:@"}"];
  return v3;
}

uint64_t __32__TRIPBUnknownField_description__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"\t%llu\n", a2);
}

uint64_t __32__TRIPBUnknownField_description__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"\t%u\n", a2);
}

uint64_t __32__TRIPBUnknownField_description__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"\t%llu\n", a2);
}

- (void)mergeFromField:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[a3 varintList];
  if ([v5 count])
  {
    mutableVarintList = self->mutableVarintList_;
    if (mutableVarintList) {
      [(TRIPBUInt64Array *)mutableVarintList addValuesFromArray:v5];
    }
    else {
      self->mutableVarintList_ = (TRIPBUInt64Array *)[v5 copy];
    }
  }
  uint64_t v7 = (void *)[a3 fixed32List];
  if ([v7 count])
  {
    mutableFixed32List = self->mutableFixed32List_;
    if (mutableFixed32List) {
      [(TRIPBUInt32Array *)mutableFixed32List addValuesFromArray:v7];
    }
    else {
      self->mutableFixed32List_ = (TRIPBUInt32Array *)[v7 copy];
    }
  }
  uint64_t v9 = (void *)[a3 fixed64List];
  if ([v9 count])
  {
    mutableFixed64List = self->mutableFixed64List_;
    if (mutableFixed64List) {
      [(TRIPBUInt64Array *)mutableFixed64List addValuesFromArray:v9];
    }
    else {
      self->mutableFixed64List_ = (TRIPBUInt64Array *)[v9 copy];
    }
  }
  long long v11 = (void *)[a3 lengthDelimitedList];
  if ([v11 count])
  {
    mutableLengthDelimitedList = self->mutableLengthDelimitedList_;
    if (mutableLengthDelimitedList) {
      [(NSMutableArray *)mutableLengthDelimitedList addObjectsFromArray:v11];
    }
    else {
      self->mutableLengthDelimitedList_ = (NSMutableArray *)[v11 mutableCopy];
    }
  }
  uint64_t v13 = (void *)[a3 groupList];
  if ([v13 count])
  {
    if (!self->mutableGroupList_) {
      self->mutableGroupList_ = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v13, "count"));
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = (void *)[*(id *)(*((void *)&v19 + 1) + 8 * v17) copy];
          [(NSMutableArray *)self->mutableGroupList_ addObject:v18];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }
  }
}

- (void)addVarint:(unint64_t)a3
{
  unint64_t v5 = a3;
  mutableVarintList = self->mutableVarintList_;
  if (mutableVarintList)
  {
    -[TRIPBUInt64Array addValue:](mutableVarintList, "addValue:");
  }
  else
  {
    self->mutableVarintList_ = [[TRIPBUInt64Array alloc] initWithValues:&v5 count:1];
  }
}

- (void)addFixed32:(unsigned int)a3
{
  unsigned int v5 = a3;
  mutableFixed32List = self->mutableFixed32List_;
  if (mutableFixed32List)
  {
    -[TRIPBUInt32Array addValue:](mutableFixed32List, "addValue:");
  }
  else
  {
    self->mutableFixed32List_ = [[TRIPBUInt32Array alloc] initWithValues:&v5 count:1];
  }
}

- (void)addFixed64:(unint64_t)a3
{
  unint64_t v5 = a3;
  mutableFixed64List = self->mutableFixed64List_;
  if (mutableFixed64List)
  {
    -[TRIPBUInt64Array addValue:](mutableFixed64List, "addValue:");
  }
  else
  {
    self->mutableFixed64List_ = [[TRIPBUInt64Array alloc] initWithValues:&v5 count:1];
  }
}

- (void)addLengthDelimited:(id)a3
{
  id v5 = a3;
  mutableLengthDelimitedList = self->mutableLengthDelimitedList_;
  if (mutableLengthDelimitedList)
  {
    -[NSMutableArray addObject:](mutableLengthDelimitedList, "addObject:");
  }
  else
  {
    self->mutableLengthDelimitedList_ = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:&v5 count:1];
  }
}

- (void)addGroup:(id)a3
{
  id v5 = a3;
  mutableGroupList = self->mutableGroupList_;
  if (mutableGroupList)
  {
    -[NSMutableArray addObject:](mutableGroupList, "addObject:");
  }
  else
  {
    self->mutableGroupList_ = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:&v5 count:1];
  }
}

- (int)number
{
  return self->number_;
}

- (TRIPBUInt64Array)varintList
{
  return self->mutableVarintList_;
}

- (TRIPBUInt32Array)fixed32List
{
  return self->mutableFixed32List_;
}

- (TRIPBUInt64Array)fixed64List
{
  return self->mutableFixed64List_;
}

- (NSArray)lengthDelimitedList
{
  return &self->mutableLengthDelimitedList_->super;
}

- (NSArray)groupList
{
  return &self->mutableGroupList_->super;
}

@end