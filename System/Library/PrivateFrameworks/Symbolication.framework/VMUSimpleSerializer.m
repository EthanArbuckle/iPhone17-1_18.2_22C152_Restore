@interface VMUSimpleSerializer
- (id).cxx_construct;
- (id)copyContiguousData;
- (unsigned)serializeNullTerminatedBytes:(const char *)a3;
- (unsigned)serializeString:(id)a3;
- (void)_serializeValues:(unsigned int *)a3 count:(unsigned int)a4;
- (void)dealloc;
- (void)serialize32:(unsigned int)a3;
- (void)serialize64:(unint64_t)a3;
@end

@implementation VMUSimpleSerializer

- (void)dealloc
{
  intRegion = self->super._intRegion;
  if (intRegion)
  {
    free(intRegion);
    self->super._intRegion = 0;
  }
  stringRegion = self->super._stringRegion;
  if (stringRegion)
  {
    free(stringRegion);
    self->super._stringRegion = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)VMUSimpleSerializer;
  [(VMUSimpleSerializer *)&v5 dealloc];
}

- (void)serialize32:(unsigned int)a3
{
  unsigned int __src = a3;
  self->super._intRegion = (char *)_appendToBuffer((unsigned __int8 *)self->super._intRegion, &self->super._intRegCapacity, &self->super._cursor, &__src, 4uLL);
}

- (void)serialize64:(unint64_t)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = __ROR8__(a3, 32);
  self->super._intRegion = (char *)_appendToBuffer((unsigned __int8 *)self->super._intRegion, &self->super._intRegCapacity, &self->super._cursor, v3, 8uLL);
}

- (unsigned)serializeString:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x1AD0D9F90]();
  id v6 = v4;
  LODWORD(self) = -[VMUSimpleSerializer serializeNullTerminatedBytes:](self, "serializeNullTerminatedBytes:", [v6 UTF8String]);

  return self;
}

- (unsigned)serializeNullTerminatedBytes:(const char *)a3
{
  LODWORD(v4) = -1;
  unsigned int __src = -1;
  if (a3)
  {
    v17 = a3;
    p_internCursor = &self->_internCursor;
    v7 = std::__hash_table<std::__hash_value_type<char const*,unsigned int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,unsigned int>,cstring_callbacks,cstring_callbacks,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,unsigned int>,cstring_callbacks,cstring_callbacks,true>,std::allocator<std::__hash_value_type<char const*,unsigned int>>>::__emplace_unique_key_args<char const*,char const*,unsigned int &>((uint64_t)&self->_internMap, &v17, &v17, &self->_internCursor);
    v8 = v7;
    if (v9)
    {
      unsigned int __src = *p_internCursor;
      uint64_t v4 = __src;
      int v10 = strlen(a3);
      v11 = _appendToBuffer((unsigned __int8 *)self->super._stringRegion, &self->super._stringRegCapacity, &self->_internCursor, (void *)a3, (v10 + 1));
      v12 = &v11[v4];
      if (strcmp((const char *)&v11[v4], a3)) {
        -[VMUSimpleSerializer serializeNullTerminatedBytes:]();
      }
      *((void *)v8 + 2) = v12;
      int64_t v13 = v11 - (unsigned __int8 *)self->super._stringRegion;
      if (v13)
      {
        for (i = self->_internMap.__table_.__p1_.__value_.__next_; i; i = (void *)*i)
        {
          v15 = (unsigned __int8 *)i[2];
          if (v15 != v12) {
            i[2] = &v15[v13];
          }
        }
        self->super._stringRegion = (char *)v11;
      }
    }
    else
    {
      LODWORD(v4) = v7[6];
      unsigned int __src = v4;
    }
  }
  self->super._intRegion = (char *)_appendToBuffer((unsigned __int8 *)self->super._intRegion, &self->super._intRegCapacity, &self->super._cursor, &__src, 4uLL);
  return v4;
}

- (void)_serializeValues:(unsigned int *)a3 count:(unsigned int)a4
{
  self->super._intRegion = (char *)_appendToBuffer((unsigned __int8 *)self->super._intRegion, &self->super._intRegCapacity, &self->super._cursor, a3, 4 * a4);
}

- (id)copyContiguousData
{
  uint64_t v3 = self->super._cursor + self->_internCursor + 16;
  LODWORD(v7) = [(id)objc_opt_class() version];
  HIDWORD(v7) = 16;
  LODWORD(v8) = self->super._cursor + 16;
  HIDWORD(v8) = v3;
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v3, v7, v8];
  [v4 replaceBytesInRange:0 withBytes:&v7 length:16];
  unsigned int cursor = self->super._cursor;
  [v4 replaceBytesInRange:NSMakeRange(16, 16) withBytes:cursor];
  [v4 replaceBytesInRange:NSMakeRange(cursor + 16, self->_internCursor) withBytes:self->super._stringRegion];
  return v4;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((_DWORD *)self + 18) = 1065353216;
  return self;
}

- (void)serializeNullTerminatedBytes:.cold.1()
{
  __assert_rtn("-[VMUSimpleSerializer serializeNullTerminatedBytes:]", "VMUSimpleSerializer.mm", 93, "strcmp((const char*)(&newStringRegion[encoded]), (const char*)bytes) == 0");
}

@end