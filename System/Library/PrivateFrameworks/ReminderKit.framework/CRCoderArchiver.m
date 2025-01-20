@interface CRCoderArchiver
+ (id)encodedDataWithDocument:(id)a3;
+ (void)initialize;
- (NSMutableOrderedSet)encodedObjects;
- (NSMutableOrderedSet)keySet;
- (NSMutableOrderedSet)uuidSet;
- (id).cxx_construct;
- (id)encodeDocument:(id)a3;
- (int)indexForKey:(id)a3;
- (unint64_t)encodeUUIDIndexFromUUID:(id)a3;
- (void)currentCustomObjectForEncoding;
- (void)currentDocument;
- (void)currentDocumentObjectForEncoding;
- (void)encodeDouble:(double)a3 forKey:(id)a4;
- (void)encodeInt32:(int)a3 forKey:(id)a4;
- (void)encodeInt64:(int64_t)a3 forKey:(id)a4;
- (void)encodeObject:(id)a3 forKey:(id)a4;
- (void)encodeObject:(id)a3 forObjectID:(void *)a4;
- (void)encodeString:(id)a3 forKey:(id)a4;
- (void)encodeUInt32:(unsigned int)a3 forKey:(id)a4;
- (void)encodeUInt64:(unint64_t)a3 forKey:(id)a4;
- (void)encodeUUID:(id)a3 forKey:(id)a4;
- (void)mutableObjectIDForKey:(id)a3;
- (void)setCurrentDocument:(void *)a3;
- (void)setEncodedObjects:(id)a3;
- (void)setKeySet:(id)a3;
- (void)setTypeIndexForCurrentCustomObjectIfNecessary:(id)a3;
- (void)setUuidSet:(id)a3;
@end

@implementation CRCoderArchiver

+ (void)initialize
{
}

+ (id)encodedDataWithDocument:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  v6 = [v5 encodeDocument:v4];

  return v6;
}

- (id)encodeDocument:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  operator new();
}

- (void)setTypeIndexForCurrentCustomObjectIfNecessary:(id)a3
{
  id v7 = a3;
  unint64_t v4 = [(CRCoder *)self typeIndexForClass:objc_opt_class()];
  int v5 = v4;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = [(CRCoderArchiver *)self currentCustomObjectForEncoding];
    v6[8] |= 1u;
    v6[16] = v5;
  }
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v7) {
    [(CRCoderArchiver *)self encodeObject:v7 forObjectID:[(CRCoderArchiver *)self mutableObjectIDForKey:v6]];
  }
}

- (void)encodeObject:(id)a3 forObjectID:(void *)a4
{
  id v31 = a3;
  id v6 = [(CRCoderArchiver *)self encodedObjects];
  id v7 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v31];
  uint64_t v8 = [v6 indexOfObject:v7];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v9 = *(_DWORD *)([(CRCoderArchiver *)self currentDocument] + 64);
    if (*((_DWORD *)a4 + 12) != 6)
    {
      CRDT::ObjectID::clear_contents((uint64_t)a4);
      *((_DWORD *)a4 + 12) = 6;
    }
    *((_DWORD *)a4 + 10) = v9;
    v10 = [(CRCoderArchiver *)self currentDocument];
    int v11 = v10[17];
    uint64_t v12 = v10[16];
    if ((int)v12 >= v11)
    {
      if (v11 == v10[18]) {
        google::protobuf::internal::RepeatedPtrFieldBase::Reserve((uint64_t)(v10 + 14), v11 + 1);
      }
      google::protobuf::internal::GenericTypeHandler<CRDT::Document_DocObject>::New();
    }
    uint64_t v13 = *((void *)v10 + 7);
    v10[16] = v12 + 1;
    v14 = *(Document_DocObject **)(v13 + 8 * v12);
    p_currentDocObjectEncodingStack = &self->currentDocObjectEncodingStack;
    value = self->currentDocObjectEncodingStack.__end_cap_.__value_;
    end = self->currentDocObjectEncodingStack.__end_;
    if (end >= value)
    {
      uint64_t v19 = end - p_currentDocObjectEncodingStack->__begin_;
      if ((unint64_t)(v19 + 1) >> 61) {
        std::vector<CRDT::Document_DocObject *>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v20 = (char *)value - (char *)p_currentDocObjectEncodingStack->__begin_;
      uint64_t v21 = v20 >> 2;
      if (v20 >> 2 <= (unint64_t)(v19 + 1)) {
        uint64_t v21 = v19 + 1;
      }
      if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v22 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v22 = v21;
      }
      if (v22) {
        v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CRDT::Document_DocObject *>>((uint64_t)&self->currentDocObjectEncodingStack.__end_cap_, v22);
      }
      else {
        v23 = 0;
      }
      v24 = (Document_DocObject **)&v23[8 * v19];
      v25 = (Document_DocObject **)&v23[8 * v22];
      *v24 = v14;
      v18 = v24 + 1;
      begin = p_currentDocObjectEncodingStack->__begin_;
      v26 = self->currentDocObjectEncodingStack.__end_;
      if (v26 != p_currentDocObjectEncodingStack->__begin_)
      {
        do
        {
          v28 = *--v26;
          *--v24 = v28;
        }
        while (v26 != begin);
        v26 = p_currentDocObjectEncodingStack->__begin_;
      }
      p_currentDocObjectEncodingStack->__begin_ = v24;
      self->currentDocObjectEncodingStack.__end_ = v18;
      self->currentDocObjectEncodingStack.__end_cap_.__value_ = v25;
      if (v26) {
        operator delete(v26);
      }
    }
    else
    {
      *end = v14;
      v18 = end + 1;
    }
    self->currentDocObjectEncodingStack.__end_ = v18;
    v29 = [(CRCoderArchiver *)self encodedObjects];
    v30 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v31];
    [v29 addObject:v30];

    [(CRCoderArchiver *)self setTypeIndexForCurrentCustomObjectIfNecessary:v31];
    [v31 encodeWithCRCoder:self];
    --self->currentDocObjectEncodingStack.__end_;
  }
  else
  {
    if (*((_DWORD *)a4 + 12) != 6)
    {
      CRDT::ObjectID::clear_contents((uint64_t)a4);
      *((_DWORD *)a4 + 12) = 6;
    }
    *((_DWORD *)a4 + 10) = v8;
  }
}

- (void)encodeString:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = [(CRCoderArchiver *)self mutableObjectIDForKey:a4];
  id v8 = v6;
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v8 UTF8String]);
  if (*((_DWORD *)v7 + 12) != 4)
  {
    CRDT::ObjectID::clear_contents((uint64_t)v7);
    *((_DWORD *)v7 + 12) = 4;
    operator new();
  }
  std::string::operator=(*((std::string **)v7 + 5), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
}

- (void)encodeUUID:(id)a3 forKey:(id)a4
{
  id v7 = a4;
  id v6 = [a3 UUIDString];
  [(CRCoderArchiver *)self encodeString:v6 forKey:v7];
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  id v8 = a4;
  id v6 = -[CRCoderArchiver mutableObjectIDForKey:](self, "mutableObjectIDForKey:");
  id v7 = (double *)v6;
  if (v6[12] != 3)
  {
    CRDT::ObjectID::clear_contents((uint64_t)v6);
    *((_DWORD *)v7 + 12) = 3;
  }
  v7[5] = a3;
}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  id v8 = a4;
  id v6 = -[CRCoderArchiver mutableObjectIDForKey:](self, "mutableObjectIDForKey:");
  id v7 = v6;
  if (v6[12] != 1)
  {
    CRDT::ObjectID::clear_contents((uint64_t)v6);
    v7[12] = 1;
  }
  *((void *)v7 + 5) = a3;
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  id v8 = a4;
  id v6 = -[CRCoderArchiver mutableObjectIDForKey:](self, "mutableObjectIDForKey:");
  id v7 = v6;
  if (v6[12] != 1)
  {
    CRDT::ObjectID::clear_contents((uint64_t)v6);
    v7[12] = 1;
  }
  *((void *)v7 + 5) = a3;
}

- (void)encodeUInt32:(unsigned int)a3 forKey:(id)a4
{
  id v8 = a4;
  id v6 = -[CRCoderArchiver mutableObjectIDForKey:](self, "mutableObjectIDForKey:");
  id v7 = v6;
  if (v6[12] != 2)
  {
    CRDT::ObjectID::clear_contents((uint64_t)v6);
    v7[12] = 2;
  }
  *((void *)v7 + 5) = a3;
}

- (void)encodeUInt64:(unint64_t)a3 forKey:(id)a4
{
  id v8 = a4;
  id v6 = -[CRCoderArchiver mutableObjectIDForKey:](self, "mutableObjectIDForKey:");
  id v7 = v6;
  if (v6[12] != 2)
  {
    CRDT::ObjectID::clear_contents((uint64_t)v6);
    v7[12] = 2;
  }
  *((void *)v7 + 5) = a3;
}

- (unint64_t)encodeUUIDIndexFromUUID:(id)a3
{
  id v4 = a3;
  int v5 = [(CRCoderArchiver *)self uuidSet];
  unint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [(CRCoderArchiver *)self uuidSet];
    unint64_t v6 = [v7 count];

    id v8 = [(CRCoderArchiver *)self uuidSet];
    [v8 addObject:v4];
  }
  return v6;
}

- (void)mutableObjectIDForKey:(id)a3
{
  id v4 = a3;
  int v5 = [(CRCoderArchiver *)self currentCustomObjectForEncoding];
  int v6 = v5[13];
  uint64_t v7 = v5[12];
  if ((int)v7 >= v6)
  {
    if (v6 == v5[14]) {
      google::protobuf::internal::RepeatedPtrFieldBase::Reserve((uint64_t)(v5 + 10), v6 + 1);
    }
    google::protobuf::internal::GenericTypeHandler<CRDT::Document_CustomObject_MapEntry>::New();
  }
  uint64_t v8 = *((void *)v5 + 5);
  v5[12] = v7 + 1;
  uint64_t v9 = *(void *)(v8 + 8 * v7);
  int v10 = [(CRCoderArchiver *)self indexForKey:v4];
  int v11 = *(_DWORD *)(v9 + 32);
  *(_DWORD *)(v9 + 48) = v10;
  *(_DWORD *)(v9 + 32) = v11 | 3;
  uint64_t v12 = *(void **)(v9 + 40);
  if (!v12) {
    operator new();
  }

  return v12;
}

- (void)currentCustomObjectForEncoding
{
  v2 = [(CRCoderArchiver *)self currentDocumentObjectForEncoding];
  id v3 = v2;
  if (*((_DWORD *)v2 + 12) != 13)
  {
    CRDT::Document_DocObject::clear_contents((uint64_t)v2);
    *((_DWORD *)v3 + 12) = 13;
    operator new();
  }
  return v2[5];
}

- (void)currentDocumentObjectForEncoding
{
  return (void *)*((void *)self->currentDocObjectEncodingStack.__end_ - 1);
}

- (int)indexForKey:(id)a3
{
  id v4 = a3;
  int v5 = [(CRCoderArchiver *)self keySet];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [(CRCoderArchiver *)self keySet];
    LODWORD(v6) = [v7 count];

    uint64_t v8 = [(CRCoderArchiver *)self keySet];
    [v8 addObject:v4];
  }
  return v6;
}

- (NSMutableOrderedSet)uuidSet
{
  return self->_uuidSet;
}

- (void)setUuidSet:(id)a3
{
}

- (NSMutableOrderedSet)keySet
{
  return self->_keySet;
}

- (void)setKeySet:(id)a3
{
}

- (NSMutableOrderedSet)encodedObjects
{
  return self->_encodedObjects;
}

- (void)setEncodedObjects:(id)a3
{
}

- (void)currentDocument
{
  return self->_currentDocument;
}

- (void)setCurrentDocument:(void *)a3
{
  self->_currentDocument = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedObjects, 0);
  objc_storeStrong((id *)&self->_keySet, 0);
  objc_storeStrong((id *)&self->_uuidSet, 0);
  begin = self->currentDocObjectEncodingStack.__begin_;
  if (begin)
  {
    self->currentDocObjectEncodingStack.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end