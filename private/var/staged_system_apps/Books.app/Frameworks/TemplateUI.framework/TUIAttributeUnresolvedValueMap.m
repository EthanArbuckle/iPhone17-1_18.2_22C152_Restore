@interface TUIAttributeUnresolvedValueMap
- ($738B17BD11CC339B30296C0EA03CEC2B)valueForAttribute:(unsigned __int16)a3;
- (TUIAttributeUnresolvedValueMap)initWithOther:(id)a3;
- (id).cxx_construct;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)enumerateAttributesAndValuesUsingBlock:(id)a3;
@end

@implementation TUIAttributeUnresolvedValueMap

- (TUIAttributeUnresolvedValueMap)initWithOther:(id)a3
{
  v4 = (TUIAttributeUnresolvedValueMap *)a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIAttributeUnresolvedValueMap;
  v5 = [(TUIAttributeUnresolvedValueMap *)&v9 init];
  v6 = v5;
  if (v4)
  {
    if (v5) {
      BOOL v7 = v5 == v4;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7)
    {
      v5->_map.__table_.__p3_.__value_ = v4->_map.__table_.__p3_.__value_;
      sub_34794(&v5->_map.__table_.__bucket_list_.__ptr_.__value_, (uint64_t *)v4->_map.__table_.__p1_.__value_.__next_, 0);
    }
  }

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[TUIMutableAttributeUnresolvedValueMap allocWithZone:a3];

  return [(TUIAttributeUnresolvedValueMap *)v4 initWithOther:self];
}

- ($738B17BD11CC339B30296C0EA03CEC2B)valueForAttribute:(unsigned __int16)a3
{
  unsigned __int16 v6 = a3;
  v3 = sub_12E50(&self->_map.__table_.__bucket_list_.__ptr_.__value_, &v6);
  v4 = ($738B17BD11CC339B30296C0EA03CEC2B *)v3 + 5;
  if (!v3) {
    v4 = ($738B17BD11CC339B30296C0EA03CEC2B *)&TUIValueNil;
  }
  return ($738B17BD11CC339B30296C0EA03CEC2B)v4->var0;
}

- (void)enumerateAttributesAndValuesUsingBlock:(id)a3
{
  id v4 = a3;
  char v6 = 0;
  p_p1 = &self->_map.__table_.__p1_;
  do
  {
    p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned short, TUIValue>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned short, TUIValue>, void *>>> *)p_p1->__value_.__next_;
    if (!p_p1) {
      break;
    }
    (*((void (**)(id, void, void, char *))v4 + 2))(v4, LOWORD(p_p1[2].__value_.__next_), HIDWORD(p_p1[2].__value_.__next_), &v6);
  }
  while (!v6);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

@end