@interface _TUIIdentifier
+ (id)fromString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)identifiers;
- (NSUUID)UUID;
- (_TUIIdentifier)initWithOther:(id)a3;
- (_TUIIdentifier)initWithUUID:(id)a3 indexPath:(id)a4 identifier:(id)a5;
- (_TUIIdentifier)initWithUUID:(id)a3 indexes:(void *)a4 identifiers:(id)a5;
- (id).cxx_construct;
- (id)tui_identifierByAppendingIndex:(unint64_t)a3;
- (id)tui_identifierByAppendingString:(id)a3;
- (id)tui_identifierByPrependingUUID:(id)a3;
- (id)tui_identifierDescribeForDebuggingWithPackage:(id)a3;
- (id)tui_identifierToString;
- (id)tui_identifierUUID;
- (id)tui_identifierWithoutUUID;
- (unint64_t)hash;
- (void)_appendIdentifier:(id)a3;
- (void)_appendIndex:(unint64_t)a3;
- (void)_computeHash;
@end

@implementation _TUIIdentifier

- (_TUIIdentifier)initWithUUID:(id)a3 indexes:(void *)a4 identifiers:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_TUIIdentifier;
  v11 = [(_TUIIdentifier *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_UUID, a3);
    begin = v12->_indexes.__begin_;
    v12->_indexes.__begin_ = *(unsigned int **)a4;
    *(void *)a4 = begin;
    end = v12->_indexes.__end_;
    v12->_indexes.__end_ = (unsigned int *)*((void *)a4 + 1);
    *((void *)a4 + 1) = end;
    value = v12->_indexes.__end_cap_.__value_;
    v12->_indexes.__end_cap_.__value_ = (unsigned int *)*((void *)a4 + 2);
    *((void *)a4 + 2) = value;
    v16 = (NSArray *)[v10 copy];
    identifiers = v12->_identifiers;
    v12->_identifiers = v16;

    [(_TUIIdentifier *)v12 _computeHash];
  }

  return v12;
}

- (_TUIIdentifier)initWithOther:(id)a3
{
  v4 = (_TUIIdentifier *)a3;
  v8.receiver = self;
  v8.super_class = (Class)_TUIIdentifier;
  v5 = [(_TUIIdentifier *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_UUID, v4->_UUID);
    objc_storeStrong((id *)&v6->_identifiers, v4->_identifiers);
    if (v6 != v4) {
      sub_1080F0((char *)&v6->_indexes, (char *)v4->_indexes.__begin_, (uint64_t)v4->_indexes.__end_, v4->_indexes.__end_ - v4->_indexes.__begin_);
    }
    v6->_hash = v4->_hash;
  }

  return v6;
}

- (id)tui_identifierWithoutUUID
{
  v2 = [[_TUIIdentifier alloc] initWithOther:self];
  UUID = v2->_UUID;
  v2->_UUID = 0;

  [(_TUIIdentifier *)v2 _computeHash];

  return v2;
}

- (void)_appendIdentifier:(id)a3
{
  id v20 = a3;
  unsigned int v4 = [(NSArray *)self->_identifiers count];
  v5 = [(NSArray *)self->_identifiers arrayByAddingObject:v20];
  identifiers = self->_identifiers;
  self->_identifiers = v5;

  value = self->_indexes.__end_cap_.__value_;
  int v8 = 2 * v4;
  end = self->_indexes.__end_;
  if (end >= value)
  {
    begin = self->_indexes.__begin_;
    uint64_t v12 = end - begin;
    if ((unint64_t)(v12 + 1) >> 62) {
      sub_4484();
    }
    unint64_t v13 = (char *)value - (char *)begin;
    unint64_t v14 = ((char *)value - (char *)begin) >> 1;
    if (v14 <= v12 + 1) {
      unint64_t v14 = v12 + 1;
    }
    if (v13 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v15 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v14;
    }
    if (v15)
    {
      v16 = (char *)sub_10790C((uint64_t)&self->_indexes.__end_cap_, v15);
      begin = self->_indexes.__begin_;
      end = self->_indexes.__end_;
    }
    else
    {
      v16 = 0;
    }
    v17 = (unsigned int *)&v16[4 * v12];
    v18 = (unsigned int *)&v16[4 * v15];
    unsigned int *v17 = v8;
    id v10 = v17 + 1;
    while (end != begin)
    {
      unsigned int v19 = *--end;
      *--v17 = v19;
    }
    self->_indexes.__begin_ = v17;
    self->_indexes.__end_ = v10;
    self->_indexes.__end_cap_.__value_ = v18;
    if (begin) {
      operator delete(begin);
    }
  }
  else
  {
    unsigned int *end = v8;
    id v10 = end + 1;
  }
  self->_indexes.__end_ = v10;
}

- (void)_appendIndex:(unint64_t)a3
{
  p_end_cap = &self->_indexes.__end_cap_;
  value = self->_indexes.__end_cap_.__value_;
  unsigned int v6 = (2 * a3) | 1;
  end = self->_indexes.__end_;
  if (end >= value)
  {
    begin = self->_indexes.__begin_;
    uint64_t v10 = end - begin;
    if ((unint64_t)(v10 + 1) >> 62) {
      sub_4484();
    }
    unint64_t v11 = (char *)value - (char *)begin;
    unint64_t v12 = ((char *)value - (char *)begin) >> 1;
    if (v12 <= v10 + 1) {
      unint64_t v12 = v10 + 1;
    }
    if (v11 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    if (v13)
    {
      unint64_t v14 = (char *)sub_10790C((uint64_t)p_end_cap, v13);
      begin = self->_indexes.__begin_;
      end = self->_indexes.__end_;
    }
    else
    {
      unint64_t v14 = 0;
    }
    unint64_t v15 = (unsigned int *)&v14[4 * v10];
    v16 = (unsigned int *)&v14[4 * v13];
    *unint64_t v15 = v6;
    int v8 = v15 + 1;
    while (end != begin)
    {
      unsigned int v17 = *--end;
      *--unint64_t v15 = v17;
    }
    self->_indexes.__begin_ = v15;
    self->_indexes.__end_ = v8;
    self->_indexes.__end_cap_.__value_ = v16;
    if (begin) {
      operator delete(begin);
    }
  }
  else
  {
    unsigned int *end = v6;
    int v8 = end + 1;
  }
  self->_indexes.__end_ = v8;
}

- (_TUIIdentifier)initWithUUID:(id)a3 indexPath:(id)a4 identifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_TUIIdentifier;
  unint64_t v11 = [(_TUIIdentifier *)&v22 init];
  if (v11)
  {
    unint64_t v12 = (NSUUID *)[v8 copy];
    UUID = v11->_UUID;
    v11->_UUID = v12;

    id v23 = v10;
    uint64_t v14 = +[NSArray arrayWithObjects:&v23 count:1];
    identifiers = v11->_identifiers;
    v11->_identifiers = (NSArray *)v14;

    id v16 = [v9 length];
    p_indexes = &v11->_indexes;
    sub_114BC0((uint64_t)&v11->_indexes, (unint64_t)v16 + 1);
    if (v16)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        unsigned int v19 = [v9 indexAtPosition:i];
        begin = p_indexes->__begin_;
        p_indexes->__begin_[(void)i] = (2 * v19) | 1;
      }
    }
    else
    {
      begin = p_indexes->__begin_;
    }
    begin[(void)v16] = 0;
    [(_TUIIdentifier *)v11 _computeHash];
  }

  return v11;
}

- (void)_computeHash
{
  begin = self->_indexes.__begin_;
  end = self->_indexes.__end_;
  if (begin == end)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = 0;
    do
    {
      unsigned int v6 = *begin++;
      unint64_t v5 = v6 ^ (16 * v5);
    }
    while (begin != end);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v7 = self->_identifiers;
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(id *)(*((void *)&v13 + 1) + 8 * (void)v10);
        unint64_t v12 = [v11 hash:v13];

        v5 ^= v12;
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  self->_hash = (unint64_t)[(NSUUID *)self->_UUID hash] ^ v5;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v4 = (_TUIIdentifier *)a3;
  if (self == v4) {
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    begin = self->_indexes.__begin_;
    unsigned int v6 = (char *)((char *)self->_indexes.__end_ - (char *)begin);
    v7 = v4->_indexes.__begin_;
    if (v6 == (char *)((char *)v4->_indexes.__end_ - (char *)v7) && !memcmp(begin, v7, (size_t)v6))
    {
      identifiers = self->_identifiers;
      if (identifiers == v4->_identifiers || -[NSArray isEqual:](identifiers, "isEqual:"))
      {
        UUID = self->_UUID;
        if (UUID != v4->_UUID)
        {
          unsigned __int8 v8 = -[NSUUID isEqual:](UUID, "isEqual:");
          goto LABEL_11;
        }
LABEL_10:
        unsigned __int8 v8 = 1;
        goto LABEL_11;
      }
    }
  }
  unsigned __int8 v8 = 0;
LABEL_11:

  return v8;
}

- (id)tui_identifierByAppendingString:(id)a3
{
  id v4 = a3;
  if (v4 && !self->_UUID)
  {
    unint64_t v5 = [[_TUIIdentifier alloc] initWithOther:self];
    [(_TUIIdentifier *)v5 _appendIdentifier:v4];
    [(_TUIIdentifier *)v5 _computeHash];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)tui_identifierByAppendingIndex:(unint64_t)a3
{
  if (self->_UUID)
  {
    v3 = 0;
  }
  else
  {
    v3 = [[_TUIIdentifier alloc] initWithOther:self];
    [(_TUIIdentifier *)v3 _appendIndex:a3];
    [(_TUIIdentifier *)v3 _computeHash];
  }

  return v3;
}

- (id)tui_identifierByPrependingUUID:(id)a3
{
  id v5 = a3;
  if (self->_UUID)
  {
    unsigned int v6 = 0;
  }
  else
  {
    unsigned int v6 = [[_TUIIdentifier alloc] initWithOther:self];
    objc_storeStrong((id *)&v6->_UUID, a3);
    [(_TUIIdentifier *)v6 _computeHash];
  }

  return v6;
}

- (id)tui_identifierToString
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithCapacity:64];
  UUID = self->_UUID;
  if (UUID)
  {
    id v5 = [(NSUUID *)UUID UUIDString];
    [v3 appendFormat:@"%@", v5];
  }
  for (i = self->_indexes.__begin_; i != self->_indexes.__end_; ++i)
  {
    unint64_t v7 = *i;
    if (v7)
    {
      [v3 appendFormat:@"/%lu" v7 >> 1];
    }
    else
    {
      unsigned __int8 v8 = [(NSArray *)self->_identifiers objectAtIndexedSubscript:v7 >> 1];
      [v3 appendFormat:@";%@", v8];
    }
  }
  id v9 = [v3 copy];

  return v9;
}

- (id)tui_identifierDescribeForDebuggingWithPackage:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  UUID = self->_UUID;
  if (UUID)
  {
    unint64_t v7 = [(NSUUID *)UUID UUIDString];
    [v5 addObject:v7];
  }
  for (i = self->_indexes.__begin_; i != self->_indexes.__end_; ++i)
  {
    unint64_t v9 = *i;
    if (v9)
    {
      id v10 = +[TUIIdentifierMap describeForDebuggingIdentifierIndex:v9 >> 1 package:v4];
      [v5 addObject:v10];
    }
    else
    {
      id v10 = [(NSArray *)self->_identifiers objectAtIndexedSubscript:v9 >> 1];
      id v11 = +[NSString stringWithFormat:@"Identifier:%@", v10];
      [v5 addObject:v11];
    }
  }
  id v12 = [v5 copy];

  return v12;
}

- (id)tui_identifierUUID
{
  return self->_UUID;
}

+ (id)fromString:(id)a3
{
  id v41 = a3;
  v42 = objc_opt_new();
  __p = 0;
  v47 = 0;
  v48 = 0;
  id v3 = [objc_alloc((Class)NSScanner) initWithString:v41];
  id v4 = +[NSCharacterSet characterSetWithCharactersInString:@"/;"];
  if ([v3 isAtEnd])
  {
    id v5 = 0;
LABEL_3:
    unsigned int v6 = 0;
  }
  else
  {
    id v45 = 0;
    [v3 scanUpToCharactersFromSet:v4 intoString:&v45];
    id v9 = v45;
    if ([v9 length]) {
      id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:v9];
    }
    else {
      id v5 = 0;
    }

    uint64_t v10 = 0;
    while (([v3 isAtEnd] & 1) == 0)
    {
      id v11 = [v3 string];
      unsigned int v12 = [v11 characterAtIndex:[v3 scanLocation]];

      [v3 setScanLocation:[v3 scanLocation] + 1];
      if (v12 == 47)
      {
        uint64_t v44 = 0;
        unsigned __int8 v13 = [v3 scanUnsignedLongLong:&v44];
        if ((v13 & 1) == 0) {
          goto LABEL_3;
        }
        int v14 = (2 * v44) | 1;
        long long v15 = v47;
        if (v47 >= v48)
        {
          unsigned int v17 = (char *)__p;
          uint64_t v18 = (v47 - (unsigned char *)__p) >> 2;
          unint64_t v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62) {
            sub_4484();
          }
          uint64_t v20 = v48 - (unsigned char *)__p;
          if ((v48 - (unsigned char *)__p) >> 1 > v19) {
            unint64_t v19 = v20 >> 1;
          }
          if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v21 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v21 = v19;
          }
          if (v21)
          {
            objc_super v22 = (char *)sub_10790C((uint64_t)&v48, v21);
            unsigned int v17 = (char *)__p;
            long long v15 = v47;
          }
          else
          {
            objc_super v22 = 0;
          }
          id v23 = &v22[4 * v18];
          *(_DWORD *)id v23 = v14;
          long long v16 = v23 + 4;
          while (v15 != v17)
          {
            int v24 = *((_DWORD *)v15 - 1);
            v15 -= 4;
            *((_DWORD *)v23 - 1) = v24;
            v23 -= 4;
          }
          __p = v23;
          v47 = v16;
          v48 = &v22[4 * v21];
          if (v17) {
            operator delete(v17);
          }
        }
        else
        {
          *(_DWORD *)v47 = v14;
          long long v16 = v15 + 4;
        }
        v47 = v16;
        if ((v13 & 1) == 0) {
          goto LABEL_3;
        }
      }
      else
      {
        if (v12 != 59) {
          goto LABEL_3;
        }
        id v43 = 0;
        unsigned __int8 v25 = [v3 scanUpToCharactersFromSet:v4 intoString:&v43];
        id v26 = v43;
        v27 = v26;
        if ((v25 & 1) == 0)
        {

          goto LABEL_3;
        }
        [v42 addObject:v26];
        v28 = v47;
        if (v47 >= v48)
        {
          v30 = (char *)__p;
          uint64_t v31 = (v47 - (unsigned char *)__p) >> 2;
          unint64_t v32 = v31 + 1;
          if ((unint64_t)(v31 + 1) >> 62) {
            sub_4484();
          }
          uint64_t v33 = v48 - (unsigned char *)__p;
          if ((v48 - (unsigned char *)__p) >> 1 > v32) {
            unint64_t v32 = v33 >> 1;
          }
          if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v34 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v34 = v32;
          }
          if (v34)
          {
            v35 = (char *)sub_10790C((uint64_t)&v48, v34);
            v30 = (char *)__p;
            v28 = v47;
          }
          else
          {
            v35 = 0;
          }
          v36 = &v35[4 * v31];
          *(_DWORD *)v36 = 2 * v10;
          v29 = v36 + 4;
          while (v28 != v30)
          {
            int v37 = *((_DWORD *)v28 - 1);
            v28 -= 4;
            *((_DWORD *)v36 - 1) = v37;
            v36 -= 4;
          }
          __p = v36;
          v47 = v29;
          v48 = &v35[4 * v34];
          if (v30) {
            operator delete(v30);
          }
        }
        else
        {
          *(_DWORD *)v47 = 2 * v10;
          v29 = v28 + 4;
        }
        v47 = v29;
        ++v10;

        if ((v25 & 1) == 0) {
          goto LABEL_3;
        }
      }
    }
    if (v10)
    {
      unsigned int v6 = [[_TUIIdentifier alloc] initWithUUID:v5 indexes:&__p identifiers:v42];
    }
    else
    {
      v38 = (char *)__p;
      if (v47 - (unsigned char *)__p == 4)
      {
        unsigned int v6 = +[NSNumber numberWithUnsignedInteger:(unint64_t)*(unsigned int *)__p >> 1];
      }
      else if (__p == v47)
      {
        unsigned int v6 = 0;
      }
      else
      {
        unsigned int v6 = 0;
        do
        {
          if (v6)
          {
            uint64_t v39 = [(_TUIIdentifier *)v6 indexPathByAddingIndex:(unint64_t)*(unsigned int *)v38 >> 1];

            unsigned int v6 = (_TUIIdentifier *)v39;
          }
          else
          {
            unsigned int v6 = +[NSIndexPath indexPathWithIndex:(unint64_t)*(unsigned int *)v38 >> 1];
          }
          v38 += 4;
        }
        while (v38 != v47);
      }
      if (v5)
      {
        uint64_t v40 = [(_TUIIdentifier *)v6 tui_identifierByPrependingUUID:v5];

        unsigned int v6 = (_TUIIdentifier *)v40;
      }
    }
  }
  unint64_t v7 = v6;

  if (__p)
  {
    v47 = (char *)__p;
    operator delete(__p);
  }

  return v7;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  begin = self->_indexes.__begin_;
  if (begin)
  {
    self->_indexes.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end