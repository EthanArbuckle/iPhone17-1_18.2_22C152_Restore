@interface TUIStruct
- (BOOL)isEqual:(id)a3;
- (TUIStruct)basedOn;
- (TUIStruct)initWithValue:(const void *)a3 basedOn:(id)a4;
- (const)value;
- (id).cxx_construct;
@end

@implementation TUIStruct

- (TUIStruct)initWithValue:(const void *)a3 basedOn:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TUIStruct;
  id v8 = [(TUIStruct *)&v11 init];
  v9 = (TUIStruct *)v8;
  if (v8)
  {
    sub_163EF0((uint64_t *)v8 + 1, (uint64_t *)a3);
    objc_storeStrong((id *)&v9->_basedOn, a4);
  }

  return v9;
}

- (const)value
{
  return &self->_value;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = v4;
    if (TUI::Evaluation::Variables::Capture::operator==((uint64_t)self->_value._capture.__ptr_, *(void *)[v7 value]))
    {
      basedOn = self->_basedOn;
      v9 = [v7 basedOn];
      if (basedOn == v9)
      {
        unsigned __int8 v6 = 1;
      }
      else
      {
        v10 = self->_basedOn;
        objc_super v11 = [v7 basedOn];
        unsigned __int8 v6 = [(TUIStruct *)v10 isEqual:v11];
      }
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (TUIStruct)basedOn
{
  return self->_basedOn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basedOn, 0);
  cntrl = self->_value._capture.__cntrl_;
  if (cntrl)
  {
    sub_123E4((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end