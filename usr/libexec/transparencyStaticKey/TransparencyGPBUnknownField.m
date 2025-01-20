@interface TransparencyGPBUnknownField
- (BOOL)isEqual:(id)a3;
- (NSArray)groupList;
- (NSArray)lengthDelimitedList;
- (TransparencyGPBUInt32Array)fixed32List;
- (TransparencyGPBUInt64Array)fixed64List;
- (TransparencyGPBUInt64Array)varintList;
- (TransparencyGPBUnknownField)initWithNumber:(int)a3;
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

@implementation TransparencyGPBUnknownField

- (TransparencyGPBUnknownField)initWithNumber:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TransparencyGPBUnknownField;
  result = [(TransparencyGPBUnknownField *)&v5 init];
  if (result) {
    result->number_ = a3;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBUnknownField;
  [(TransparencyGPBUnknownField *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = [+[TransparencyGPBUnknownField allocWithZone:](TransparencyGPBUnknownField, "allocWithZone:") initWithNumber:self->number_];
  v5->mutableFixed32List_ = (TransparencyGPBUInt32Array *)[(TransparencyGPBUInt32Array *)self->mutableFixed32List_ copyWithZone:a3];
  v5->mutableFixed64List_ = (TransparencyGPBUInt64Array *)[(TransparencyGPBUInt64Array *)self->mutableFixed64List_ copyWithZone:a3];
  v5->mutableLengthDelimitedList_ = (NSMutableArray *)[(NSMutableArray *)self->mutableLengthDelimitedList_ mutableCopyWithZone:a3];
  v5->mutableVarintList_ = (TransparencyGPBUInt64Array *)[(TransparencyGPBUInt64Array *)self->mutableVarintList_ copyWithZone:a3];
  if ([(NSMutableArray *)self->mutableGroupList_ count])
  {
    v5->mutableGroupList_ = [+[NSMutableArray allocWithZone:a3] initWithCapacity:[(NSMutableArray *)self->mutableGroupList_ count]];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    mutableGroupList = self->mutableGroupList_;
    id v7 = [(NSMutableArray *)mutableGroupList countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(mutableGroupList);
          }
          id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) copyWithZone:a3];
          [(NSMutableArray *)v5->mutableGroupList_ addObject:v11];

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [(NSMutableArray *)mutableGroupList countByEnumeratingWithState:&v13 objects:v17 count:16];
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
  if ((![(TransparencyGPBUInt64Array *)self->mutableVarintList_ count]
     && ![*((id *)a3 + 2) count]
     || (unsigned int v5 = [(TransparencyGPBUInt64Array *)self->mutableVarintList_ isEqual:*((void *)a3 + 2)]) != 0)
    && (![(TransparencyGPBUInt32Array *)self->mutableFixed32List_ count]
     && ![*((id *)a3 + 3) count]
     || (unsigned int v5 = [(TransparencyGPBUInt32Array *)self->mutableFixed32List_ isEqual:*((void *)a3 + 3)]) != 0)
    && (![(TransparencyGPBUInt64Array *)self->mutableFixed64List_ count]
     && ![*((id *)a3 + 4) count]
     || (unsigned int v5 = [(TransparencyGPBUInt64Array *)self->mutableFixed64List_ isEqual:*((void *)a3 + 4)]) != 0)
    && (!-[NSMutableArray count](self->mutableLengthDelimitedList_, "count") && ![*((id *)a3 + 5) count]
     || (unsigned int v5 = [(NSMutableArray *)self->mutableLengthDelimitedList_ isEqual:*((void *)a3 + 5)]) != 0))
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
  unint64_t v3 = [(TransparencyGPBUInt64Array *)self->mutableVarintList_ hash];
  v4 = (char *)[(TransparencyGPBUInt32Array *)self->mutableFixed32List_ hash] + 32 * v3 - v3;
  int64_t v5 = (unsigned char *)[(TransparencyGPBUInt64Array *)self->mutableFixed64List_ hash] - v4 + 32 * (void)v4;
  int64_t v6 = (int64_t)[(NSMutableArray *)self->mutableLengthDelimitedList_ hash] + 32 * v5 - v5;
  return (unint64_t)[(NSMutableArray *)self->mutableGroupList_ hash] + 32 * v6 - v6 + 28629151;
}

- (void)writeToOutput:(id)a3
{
  if ([(TransparencyGPBUInt64Array *)self->mutableVarintList_ count]) {
    [a3 writeUInt64Array:self->number_ values:self->mutableVarintList_ tag:0];
  }
  if ([(TransparencyGPBUInt32Array *)self->mutableFixed32List_ count]) {
    [a3 writeFixed32Array:self->number_ values:self->mutableFixed32List_ tag:0];
  }
  if ([(TransparencyGPBUInt64Array *)self->mutableFixed64List_ count]) {
    [a3 writeFixed64Array:self->number_ values:self->mutableFixed64List_ tag:0];
  }
  if ([(NSMutableArray *)self->mutableLengthDelimitedList_ count]) {
    [a3 writeBytesArray:self->number_ values:self->mutableLengthDelimitedList_];
  }
  if ([(NSMutableArray *)self->mutableGroupList_ count])
  {
    uint64_t number = self->number_;
    mutableGroupList = self->mutableGroupList_;
    _[a3 writeUnknownGroupArray:number values:mutableGroupList];
  }
}

- (unint64_t)serializedSize
{
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  int number = self->number_;
  mutableVarintList = self->mutableVarintList_;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100036FEC;
  v31[3] = &unk_10008E078;
  v31[4] = &v33;
  int v32 = number;
  [(TransparencyGPBUInt64Array *)mutableVarintList enumerateValuesWithBlock:v31];
  mutableFixed32List = self->mutableFixed32List_;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100037028;
  v29[3] = &unk_10008E0A0;
  v29[4] = &v33;
  int v30 = number;
  [(TransparencyGPBUInt32Array *)mutableFixed32List enumerateValuesWithBlock:v29];
  mutableFixed64List = self->mutableFixed64List_;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100037064;
  v27[3] = &unk_10008E078;
  v27[4] = &v33;
  int v28 = number;
  [(TransparencyGPBUInt64Array *)mutableFixed64List enumerateValuesWithBlock:v27];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  mutableLengthDelimitedList = self->mutableLengthDelimitedList_;
  id v8 = [(NSMutableArray *)mutableLengthDelimitedList countByEnumeratingWithState:&v23 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v24;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(mutableLengthDelimitedList);
        }
        id v11 = sub_10001DCF8(number, *(void **)(*((void *)&v23 + 1) + 8 * i));
        v34[3] += (uint64_t)v11;
      }
      id v8 = [(NSMutableArray *)mutableLengthDelimitedList countByEnumeratingWithState:&v23 objects:v38 count:16];
    }
    while (v8);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  mutableGroupList = self->mutableGroupList_;
  id v13 = [(NSMutableArray *)mutableGroupList countByEnumeratingWithState:&v19 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v20;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(mutableGroupList);
        }
        long long v16 = sub_10001DBEC(number, *(void **)(*((void *)&v19 + 1) + 8 * (void)j));
        v34[3] += (uint64_t)v16;
      }
      id v13 = [(NSMutableArray *)mutableGroupList countByEnumeratingWithState:&v19 objects:v37 count:16];
    }
    while (v13);
  }
  unint64_t v17 = v34[3];
  _Block_object_dispose(&v33, 8);
  return v17;
}

- (void)writeAsMessageSetExtensionToOutput:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  mutableLengthDelimitedList = self->mutableLengthDelimitedList_;
  id v6 = [(NSMutableArray *)mutableLengthDelimitedList countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(mutableLengthDelimitedList);
        }
        [a3 writeRawMessageSetExtension:self->number_ value:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      id v7 = [(NSMutableArray *)mutableLengthDelimitedList countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (unint64_t)serializedSizeAsMessageSetExtension
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  mutableLengthDelimitedList = self->mutableLengthDelimitedList_;
  id v4 = [(NSMutableArray *)mutableLengthDelimitedList countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  unint64_t v6 = 0;
  uint64_t v7 = *(void *)v11;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(mutableLengthDelimitedList);
      }
      v6 += (unint64_t)sub_10001DFC4(self->number_, *(void **)(*((void *)&v10 + 1) + 8 * i));
    }
    id v5 = [(NSMutableArray *)mutableLengthDelimitedList countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v5);
  return v6;
}

- (id)description
{
  unint64_t v3 = +[NSMutableString stringWithFormat:@"<%@ %p>: Field: %d {\n", objc_opt_class(), self, self->number_];
  mutableVarintList = self->mutableVarintList_;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10003756C;
  v28[3] = &unk_10008D6F8;
  v28[4] = v3;
  [(TransparencyGPBUInt64Array *)mutableVarintList enumerateValuesWithBlock:v28];
  mutableFixed32List = self->mutableFixed32List_;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10003759C;
  v27[3] = &unk_10008D860;
  v27[4] = v3;
  [(TransparencyGPBUInt32Array *)mutableFixed32List enumerateValuesWithBlock:v27];
  mutableFixed64List = self->mutableFixed64List_;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000375CC;
  v26[3] = &unk_10008D6F8;
  v26[4] = v3;
  [(TransparencyGPBUInt64Array *)mutableFixed64List enumerateValuesWithBlock:v26];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  mutableLengthDelimitedList = self->mutableLengthDelimitedList_;
  id v8 = [(NSMutableArray *)mutableLengthDelimitedList countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(mutableLengthDelimitedList);
        }
        [(NSMutableString *)v3 appendFormat:@"\t%@\n", *(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      id v9 = [(NSMutableArray *)mutableLengthDelimitedList countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v9);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  mutableGroupList = self->mutableGroupList_;
  id v13 = [(NSMutableArray *)mutableGroupList countByEnumeratingWithState:&v18 objects:v29 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(mutableGroupList);
        }
        [(NSMutableString *)v3 appendFormat:@"\t%@\n", *(void *)(*((void *)&v18 + 1) + 8 * (void)j)];
      }
      id v14 = [(NSMutableArray *)mutableGroupList countByEnumeratingWithState:&v18 objects:v29 count:16];
    }
    while (v14);
  }
  [(NSMutableString *)v3 appendString:@"}"];
  return v3;
}

- (void)mergeFromField:(id)a3
{
  id v5 = [a3 varintList];
  if ([v5 count])
  {
    mutableVarintList = self->mutableVarintList_;
    if (mutableVarintList) {
      [(TransparencyGPBUInt64Array *)mutableVarintList addValuesFromArray:v5];
    }
    else {
      self->mutableVarintList_ = (TransparencyGPBUInt64Array *)[v5 copy];
    }
  }
  id v7 = [a3 fixed32List];
  if ([v7 count])
  {
    mutableFixed32List = self->mutableFixed32List_;
    if (mutableFixed32List) {
      [(TransparencyGPBUInt32Array *)mutableFixed32List addValuesFromArray:v7];
    }
    else {
      self->mutableFixed32List_ = (TransparencyGPBUInt32Array *)[v7 copy];
    }
  }
  id v9 = [a3 fixed64List];
  if ([v9 count])
  {
    mutableFixed64List = self->mutableFixed64List_;
    if (mutableFixed64List) {
      [(TransparencyGPBUInt64Array *)mutableFixed64List addValuesFromArray:v9];
    }
    else {
      self->mutableFixed64List_ = (TransparencyGPBUInt64Array *)[v9 copy];
    }
  }
  id v11 = [a3 lengthDelimitedList];
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
  id v13 = [a3 groupList];
  if ([v13 count])
  {
    if (!self->mutableGroupList_) {
      self->mutableGroupList_ = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:[v13 count]];
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        unint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v17) copy];
          [(NSMutableArray *)self->mutableGroupList_ addObject:v18];

          unint64_t v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
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
    -[TransparencyGPBUInt64Array addValue:](mutableVarintList, "addValue:");
  }
  else
  {
    self->mutableVarintList_ = [[TransparencyGPBUInt64Array alloc] initWithValues:&v5 count:1];
  }
}

- (void)addFixed32:(unsigned int)a3
{
  unsigned int v5 = a3;
  mutableFixed32List = self->mutableFixed32List_;
  if (mutableFixed32List)
  {
    -[TransparencyGPBUInt32Array addValue:](mutableFixed32List, "addValue:");
  }
  else
  {
    self->mutableFixed32List_ = [[TransparencyGPBUInt32Array alloc] initWithValues:&v5 count:1];
  }
}

- (void)addFixed64:(unint64_t)a3
{
  unint64_t v5 = a3;
  mutableFixed64List = self->mutableFixed64List_;
  if (mutableFixed64List)
  {
    -[TransparencyGPBUInt64Array addValue:](mutableFixed64List, "addValue:");
  }
  else
  {
    self->mutableFixed64List_ = [[TransparencyGPBUInt64Array alloc] initWithValues:&v5 count:1];
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
    self->mutableLengthDelimitedList_ = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithObjects:&v5 count:1];
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
    self->mutableGroupList_ = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithObjects:&v5 count:1];
  }
}

- (int)number
{
  return self->number_;
}

- (TransparencyGPBUInt64Array)varintList
{
  return self->mutableVarintList_;
}

- (TransparencyGPBUInt32Array)fixed32List
{
  return self->mutableFixed32List_;
}

- (TransparencyGPBUInt64Array)fixed64List
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