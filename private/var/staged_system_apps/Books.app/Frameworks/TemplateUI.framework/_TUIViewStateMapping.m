@interface _TUIViewStateMapping
- (_TUIViewStateMapping)initWithParent:(id)a3;
- (_TUIViewStateMapping)parent;
- (id).cxx_construct;
- (id)viewStateForBinding:(id)a3;
- (void)setViewState:(id)a3 forBinding:(id)a4;
@end

@implementation _TUIViewStateMapping

- (_TUIViewStateMapping)initWithParent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUIViewStateMapping;
  v6 = [(_TUIViewStateMapping *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_parent, a3);
  }

  return v7;
}

- (id)viewStateForBinding:(id)a3
{
  if (TUINameIsValid(*(_DWORD *)&a3))
  {
    $201E9A47BE70A2B12CCA2F48B75AA2F7 v9 = a3;
    id v5 = sub_270E0(&self->_bindingMap.__table_.__bucket_list_.__ptr_.__value_, &v9.var0);
    if (v5) {
      v6 = v5[3];
    }
    else {
      v6 = 0;
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setViewState:(id)a3 forBinding:(id)a4
{
  id v7 = a3;
  if (TUINameIsValid(*(_DWORD *)&a4))
  {
    $201E9A47BE70A2B12CCA2F48B75AA2F7 v9 = a4;
    v10 = &v9;
    v8 = (id *)sub_107CE4((uint64_t)&self->_bindingMap, &v9.var0, (uint64_t)&std::piecewise_construct, (_DWORD **)&v10);
    objc_storeStrong(v8 + 3, a3);
  }
}

- (_TUIViewStateMapping)parent
{
  return self->_parent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parent, 0);

  sub_125DC((uint64_t)&self->_bindingMap);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

@end