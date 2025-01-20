@interface VKDebugTreePropertyNode
- (VKDebugTreePropertyNode)initWithDebugTreeProperty:(const void *)a3 withParent:(id)a4;
- (id)idValueForTreeValue:(const void *)a3;
- (id)name;
- (id)propertyColumn;
- (id)tagsColumn;
- (id)valueColumn;
- (void)searchNodes:(id)a3 withParameter:(id)a4;
@end

@implementation VKDebugTreePropertyNode

- (id)idValueForTreeValue:(const void *)a3
{
  switch(*((_DWORD *)a3 + 14))
  {
    case 0:
      v3 = [NSNumber numberWithLongLong:*(void *)a3];
      goto LABEL_10;
    case 1:
      v3 = [NSNumber numberWithUnsignedLongLong:*((void *)a3 + 1)];
      goto LABEL_10;
    case 2:
      objc_msgSend(NSString, "stringWithFormat:", @"%.02f", *((void *)a3 + 2));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 3:
      if (*((unsigned char *)a3 + 24)) {
        v5 = @"True";
      }
      else {
        v5 = @"False";
      }
      v3 = v5;
LABEL_10:
      v4 = v3;
      break;
    case 4:
      v7 = NSString;
      if (*((char *)a3 + 55) < 0) {
        std::string::__init_copy_ctor_external(&v9, *((const std::string::value_type **)a3 + 4), *((void *)a3 + 5));
      }
      else {
        std::string v9 = *(std::string *)((char *)a3 + 32);
      }
      if ((v9.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v8 = &v9;
      }
      else {
        v8 = (std::string *)v9.__r_.__value_.__r.__words[0];
      }
      v4 = [v7 stringWithUTF8String:v8];
      if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v9.__r_.__value_.__l.__data_);
      }
      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

- (void)searchNodes:(id)a3 withParameter:(id)a4
{
  id v31 = a3;
  id v6 = a4;
  property = (const void **)self->_property;
  if (*((char *)property + 23) < 0) {
    property = (const void **)*property;
  }
  v8 = [NSString stringWithUTF8String:property];
  uint64_t v9 = [v8 rangeOfString:v6 options:1];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = self->_property;
    v11 = (long long *)v10[4];
    v12 = (long long *)v10[5];
    if (v11 != v12)
    {
      uint64_t v30 = 24;
      v13 = v11 + 2;
      while (1)
      {
        long long v14 = *(v13 - 2);
        *(_OWORD *)&v32[9] = *(long long *)((char *)v13 - 23);
        *(_OWORD *)v32 = v14;
        if (*((char *)v13 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v13, *((void *)v13 + 1));
        }
        else
        {
          long long v15 = *v13;
          __p.__r_.__value_.__r.__words[2] = *((void *)v13 + 2);
          *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v15;
        }
        v16 = v13 - 2;
        int v34 = *((_DWORD *)v13 + 6);
        v17 = -[VKDebugTreePropertyNode idValueForTreeValue:](self, "idValueForTreeValue:", v32, v30);
        if (!v17)
        {
          int v18 = 3;
          goto LABEL_18;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v17 rangeOfString:v6 options:1] == 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_16;
          }
        }
        else
        {
          v19 = [v17 stringValue];
          uint64_t v20 = [v19 rangeOfString:v6 options:1];

          if (v20 == 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_16:
            int v18 = 0;
            goto LABEL_18;
          }
        }
        v21 = [(VKDebugTreeNode *)self parent];
        [v31 addObject:v21];

        int v18 = 1;
LABEL_18:

        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(__p.__r_.__value_.__l.__data_);
          if (v18 != 3)
          {
LABEL_22:
            if (v18) {
              goto LABEL_40;
            }
          }
        }
        else if (v18 != 3)
        {
          goto LABEL_22;
        }
        v13 += 4;
        if (v16 + 4 == v12)
        {
          v10 = *(Class *)((char *)&self->super.super.isa + v30);
          break;
        }
      }
    }
    v23 = (long long *)v10[7];
    v24 = (long long *)v10[8];
    if (v23 != v24)
    {
      while (1)
      {
        if (*((char *)v23 + 23) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)v32, *(const std::string::value_type **)v23, *((void *)v23 + 1));
        }
        else
        {
          long long v25 = *v23;
          *(void *)&v32[16] = *((void *)v23 + 2);
          *(_OWORD *)v32 = v25;
        }
        v26 = v32[23] >= 0 ? v32 : *(unsigned char **)v32;
        v27 = [NSString stringWithUTF8String:v26];
        uint64_t v28 = [v27 rangeOfString:v6 options:1];

        if (v28 != 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        if ((v32[23] & 0x80000000) != 0) {
          operator delete(*(void **)v32);
        }
        v23 = (long long *)((char *)v23 + 24);
        if (v23 == v24) {
          goto LABEL_40;
        }
      }
      v29 = [(VKDebugTreeNode *)self parent];
      [v31 addObject:v29];

      if ((v32[23] & 0x80000000) != 0) {
        operator delete(*(void **)v32);
      }
    }
  }
  else
  {
    v22 = [(VKDebugTreeNode *)self parent];
    [v31 addObject:v22];
  }
LABEL_40:
}

- (id)tagsColumn
{
  if (*((void *)self->_property + 8) == *((void *)self->_property + 7))
  {
    v3 = @" ";
  }
  else
  {
    v3 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    property = self->_property;
    v5 = (long long *)property[7];
    for (i = (long long *)property[8]; v5 != i; v5 = (long long *)((char *)v5 + 24))
    {
      if (*((char *)v5 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v5, *((void *)v5 + 1));
      }
      else
      {
        long long v7 = *v5;
        __p.__r_.__value_.__r.__words[2] = *((void *)v5 + 2);
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v7;
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
      [(__CFString *)v3 appendString:v9];

      [(__CFString *)v3 appendString:@", "];
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    -[__CFString deleteCharactersInRange:](v3, "deleteCharactersInRange:", [(__CFString *)v3 length] - 2, 2);
  }
  return v3;
}

- (id)valueColumn
{
  if (*((void *)self->_property + 5) == *((void *)self->_property + 4))
  {
    v3 = @" ";
  }
  else
  {
    v3 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    property = self->_property;
    v5 = (long long *)property[4];
    id v6 = (long long *)property[5];
    if (v5 != v6)
    {
      long long v7 = v5 + 2;
      do
      {
        long long v8 = *(v7 - 2);
        *(_OWORD *)&v14[9] = *(long long *)((char *)v7 - 23);
        *(_OWORD *)long long v14 = v8;
        if (*((char *)v7 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v7, *((void *)v7 + 1));
        }
        else
        {
          long long v9 = *v7;
          __p.__r_.__value_.__r.__words[2] = *((void *)v7 + 2);
          *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v9;
        }
        v10 = v7 - 2;
        int v16 = *((_DWORD *)v7 + 6);
        v11 = [(VKDebugTreePropertyNode *)self idValueForTreeValue:v14];
        if (v11)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            -[__CFString appendString:](v3, "appendString:", v11, *(void *)v14, *(_OWORD *)&v14[8], *(void *)&v14[24]);
          }
          else
          {
            v12 = objc_msgSend(v11, "stringValue", *(void *)v14, *(_OWORD *)&v14[8], *(void *)&v14[24]);
            [(__CFString *)v3 appendString:v12];
          }
          [(__CFString *)v3 appendString:@", "];
        }

        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        v7 += 4;
      }
      while (v10 + 4 != v6);
    }
    -[__CFString deleteCharactersInRange:](v3, "deleteCharactersInRange:", [(__CFString *)v3 length] - 2, 2);
  }
  return v3;
}

- (id)propertyColumn
{
  property = (const void **)self->_property;
  if (*((char *)property + 23) < 0) {
    property = (const void **)*property;
  }
  return (id)[NSString stringWithUTF8String:property];
}

- (id)name
{
  property = (const void **)self->_property;
  if (*((char *)property + 23) < 0) {
    property = (const void **)*property;
  }
  return (id)[NSString stringWithUTF8String:property];
}

- (VKDebugTreePropertyNode)initWithDebugTreeProperty:(const void *)a3 withParent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)VKDebugTreePropertyNode;
  result = [(VKDebugTreeNode *)&v6 initWithParent:a4];
  if (result) {
    result->_property = a3;
  }
  return result;
}

@end