@interface VKMetrics
- (CGRect)boundingRectForItem:(unsigned __int8)a3 text:(id)a4 locale:(id)a5;
- (VKMetrics)initWithDescriptor:(id)a3;
- (id).cxx_construct;
@end

@implementation VKMetrics

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
  value = self->_labelMetrics.__ptr_.__value_;
  self->_labelMetrics.__ptr_.__value_ = 0;
  if (value)
  {
    v3 = *(void **)value;
    if (*(void *)value)
    {
      *((void *)value + 1) = v3;
      operator delete(v3);
    }
    JUMPOUT(0x1A6239270);
  }
}

- (CGRect)boundingRectForItem:(unsigned __int8)a3 text:(id)a4 locale:(id)a5
{
  int v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v8;
  v11 = (const char *)[v10 UTF8String];
  id v12 = v9;
  md::StringWithLocaleImp<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>::StringWithLocaleImp((uint64_t)v24, v11, (const char *)[v12 UTF8String]);
  md::LabelMetrics::boundingRectForItem((uint64_t)v21, (unsigned __int8 **)self->_labelMetrics.__ptr_.__value_, v6, (uint64_t)v24);
  if (v23)
  {
    double v13 = v21[0];
    double v14 = (float)-v22;
    double v15 = (float)(v21[2] - v21[0]);
    double v16 = (float)(v22 - v21[1]);
    if ((SHIBYTE(v28) & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  double v13 = 0.0;
  double v14 = 0.0;
  double v15 = 0.0;
  double v16 = 0.0;
  if (SHIBYTE(v28) < 0) {
LABEL_3:
  }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v29 + 40))(v29, v27, v28 & 0x7FFFFFFFFFFFFFFFLL);
LABEL_4:
  if (SHIBYTE(v25) < 0) {
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)v26 + 40))(v26, v24[0], v25 & 0x7FFFFFFFFFFFFFFFLL);
  }

  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  double v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (VKMetrics)initWithDescriptor:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VKMetrics;
  if ([(VKMetrics *)&v6 init]) {
    operator new();
  }

  return 0;
}

@end