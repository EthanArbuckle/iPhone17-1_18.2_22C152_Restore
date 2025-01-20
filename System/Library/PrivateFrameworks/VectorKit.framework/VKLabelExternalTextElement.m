@interface VKLabelExternalTextElement
+ (BOOL)supportsSecureCoding;
- (VKLabelExternalTextElement)initWithCoder:(id)a3;
- (VKLabelExternalTextElement)initWithTextElement:(const void *)a3;
- (const)element;
- (id).cxx_construct;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VKLabelExternalTextElement

- (id).cxx_construct
{
  *((_WORD *)self + 4) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  return self;
}

- (void).cxx_destruct
{
  if (SHIBYTE(self[1]._element.text.text.var0) < 0)
  {
    operator delete(*((void **)&self[1]._element.text.text.__r_.__value_.var0.__l + 2));
    if ((self[1]._element.text.text.__r_.__value_.var0.__s.__data_[15] & 0x80000000) == 0)
    {
LABEL_3:
      if ((SHIBYTE(self[1].super.isa) & 0x80000000) == 0) {
        goto LABEL_4;
      }
LABEL_8:
      operator delete(*(void **)&self->_element.text.text.__r_.var0);
      if ((*((char *)&self->_element.text.text.__r_.__value_.var0.__l + 23) & 0x80000000) == 0) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if ((self[1]._element.text.text.__r_.__value_.var0.__s.__data_[15] & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(*(void **)&self[1]._element.minZoom);
  if (SHIBYTE(self[1].super.isa) < 0) {
    goto LABEL_8;
  }
LABEL_4:
  if ((*((char *)&self->_element.text.text.__r_.__value_.var0.__l + 23) & 0x80000000) == 0) {
    return;
  }
LABEL_9:
  data = self->_element.text.text.__r_.__value_.var0.__l.__data_;
  operator delete(data);
}

- (const)element
{
  return &self->_element;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  p_text = &self->_element.text;
  if (*((char *)&self->_element.text.text.__r_.__value_.var0.__l + 23) < 0) {
    p_text = (StringWithLocaleImp<std::string> *)p_text->text.__r_.__value_.var0.__l.__data_;
  }
  v5 = [NSString stringWithUTF8String:p_text];
  [v12 encodeObject:v5 forKey:@"text"];
  p_var0 = &self->_element.text.text.__r_.var0;
  if (SHIBYTE(self[1].super.isa) < 0) {
    p_var0 = *(int **)p_var0;
  }
  v7 = [NSString stringWithUTF8String:p_var0];
  [v12 encodeObject:v7 forKey:@"textLocale"];
  p_element = &self[1]._element;
  if (self[1]._element.text.text.__r_.__value_.var0.__s.__data_[15] < 0) {
    p_element = *(LabelExternalTextElement **)&p_element->minZoom;
  }
  v9 = [NSString stringWithUTF8String:p_element];
  [v12 encodeObject:v9 forKey:@"localizedText"];
  v10 = &self[1]._element.text.text.__r_.__value_.var0.__l + 1;
  if (SHIBYTE(self[1]._element.text.text.var0) < 0) {
    v10 = (void *)*v10;
  }
  v11 = [NSString stringWithUTF8String:v10];
  [v12 encodeObject:v11 forKey:@"localizedTextLocale"];
  [v12 encodeInt32:self->_element.textType forKey:@"textType"];
  [v12 encodeInt32:self->_element.minZoom forKey:@"minZoom"];
}

- (VKLabelExternalTextElement)initWithCoder:(id)a3
{
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)VKLabelExternalTextElement;
  v5 = [(VKLabelExternalTextElement *)&v55 init];
  if (!v5) {
    goto LABEL_71;
  }
  id v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
  v6 = (const char *)[v50 UTF8String];
  {
    operator new();
  }
  uint64_t v54 = mdm::Allocator::instance(void)::alloc;
  size_t v7 = strlen(v6);
  if (v7 > 0x7FFFFFFFFFFFFFF7) {
    abort();
  }
  size_t v8 = v7;
  if (v7 >= 0x17)
  {
    uint64_t v10 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17) {
      uint64_t v10 = v7 | 7;
    }
    uint64_t v11 = v10 + 1;
    p_dst = (const std::string::value_type **)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)mdm::Allocator::instance(void)::alloc + 16))(mdm::Allocator::instance(void)::alloc, v10 + 1, 1);
    size_t v52 = v8;
    int64_t v53 = v11 | 0x8000000000000000;
    __dst = (const std::string::value_type *)p_dst;
    goto LABEL_10;
  }
  HIBYTE(v53) = v7;
  p_dst = &__dst;
  if (v7) {
LABEL_10:
  }
    memmove(p_dst, v6, v8);
  *((unsigned char *)p_dst + v8) = 0;
  int v12 = SHIBYTE(v53);
  v13 = __dst;
  if (v53 >= 0) {
    std::string::size_type v14 = HIBYTE(v53);
  }
  else {
    std::string::size_type v14 = v52;
  }
  if (v53 >= 0) {
    v15 = (const std::string::value_type *)&__dst;
  }
  else {
    v15 = __dst;
  }
  std::string::__assign_external((std::string *)(v5 + 16), v15, v14);
  if (v12 < 0) {
    (*(void (**)(uint64_t, const std::string::value_type *, int64_t))(*(void *)v54 + 40))(v54, v13, v53 & 0x7FFFFFFFFFFFFFFFLL);
  }
  id v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textLocale"];
  v16 = (const char *)[v49 UTF8String];
  {
    operator new();
  }
  uint64_t v54 = mdm::Allocator::instance(void)::alloc;
  size_t v17 = strlen(v16);
  if (v17 > 0x7FFFFFFFFFFFFFF7) {
    abort();
  }
  size_t v18 = v17;
  if (v17 >= 0x17)
  {
    uint64_t v20 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v17 | 7) != 0x17) {
      uint64_t v20 = v17 | 7;
    }
    uint64_t v21 = v20 + 1;
    v19 = (const std::string::value_type **)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)mdm::Allocator::instance(void)::alloc
                                                                                                 + 16))(mdm::Allocator::instance(void)::alloc, v20 + 1, 1);
    size_t v52 = v18;
    int64_t v53 = v21 | 0x8000000000000000;
    __dst = (const std::string::value_type *)v19;
    goto LABEL_27;
  }
  HIBYTE(v53) = v17;
  v19 = &__dst;
  if (v17) {
LABEL_27:
  }
    memmove(v19, v16, v18);
  *((unsigned char *)v19 + v18) = 0;
  int v22 = SHIBYTE(v53);
  v23 = __dst;
  if (v53 >= 0) {
    std::string::size_type v24 = HIBYTE(v53);
  }
  else {
    std::string::size_type v24 = v52;
  }
  if (v53 >= 0) {
    v25 = (const std::string::value_type *)&__dst;
  }
  else {
    v25 = __dst;
  }
  std::string::__assign_external((std::string *)(v5 + 40), v25, v24);
  if (v22 < 0) {
    (*(void (**)(uint64_t, const std::string::value_type *, int64_t))(*(void *)v54 + 40))(v54, v23, v53 & 0x7FFFFFFFFFFFFFFFLL);
  }
  id v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedText"];
  v27 = (const char *)[v26 UTF8String];
  {
    operator new();
  }
  uint64_t v54 = mdm::Allocator::instance(void)::alloc;
  size_t v28 = strlen(v27);
  if (v28 > 0x7FFFFFFFFFFFFFF7) {
    abort();
  }
  size_t v29 = v28;
  if (v28 >= 0x17)
  {
    uint64_t v31 = (v28 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v28 | 7) != 0x17) {
      uint64_t v31 = v28 | 7;
    }
    uint64_t v32 = v31 + 1;
    v30 = (const std::string::value_type **)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)mdm::Allocator::instance(void)::alloc
                                                                                                 + 16))(mdm::Allocator::instance(void)::alloc, v31 + 1, 1);
    size_t v52 = v29;
    int64_t v53 = v32 | 0x8000000000000000;
    __dst = (const std::string::value_type *)v30;
    goto LABEL_44;
  }
  HIBYTE(v53) = v28;
  v30 = &__dst;
  if (v28) {
LABEL_44:
  }
    memmove(v30, v27, v29);
  *((unsigned char *)v30 + v29) = 0;
  int v33 = SHIBYTE(v53);
  v34 = __dst;
  if (v53 >= 0) {
    std::string::size_type v35 = HIBYTE(v53);
  }
  else {
    std::string::size_type v35 = v52;
  }
  if (v53 >= 0) {
    v36 = (const std::string::value_type *)&__dst;
  }
  else {
    v36 = __dst;
  }
  std::string::__assign_external((std::string *)(v5 + 64), v36, v35);
  if (v33 < 0) {
    (*(void (**)(uint64_t, const std::string::value_type *, int64_t))(*(void *)v54 + 40))(v54, v34, v53 & 0x7FFFFFFFFFFFFFFFLL);
  }
  id v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTextLocale"];
  v38 = (const char *)[v37 UTF8String];
  {
    operator new();
  }
  uint64_t v54 = mdm::Allocator::instance(void)::alloc;
  size_t v39 = strlen(v38);
  if (v39 > 0x7FFFFFFFFFFFFFF7) {
    abort();
  }
  size_t v40 = v39;
  if (v39 >= 0x17)
  {
    uint64_t v42 = (v39 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v39 | 7) != 0x17) {
      uint64_t v42 = v39 | 7;
    }
    uint64_t v43 = v42 + 1;
    v41 = (const std::string::value_type **)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)mdm::Allocator::instance(void)::alloc
                                                                                                 + 16))(mdm::Allocator::instance(void)::alloc, v42 + 1, 1);
    size_t v52 = v40;
    int64_t v53 = v43 | 0x8000000000000000;
    __dst = (const std::string::value_type *)v41;
  }
  else
  {
    HIBYTE(v53) = v39;
    v41 = &__dst;
    if (!v39) {
      goto LABEL_62;
    }
  }
  memmove(v41, v38, v40);
LABEL_62:
  *((unsigned char *)v41 + v40) = 0;
  int v44 = SHIBYTE(v53);
  v45 = __dst;
  if (v53 >= 0) {
    std::string::size_type v46 = HIBYTE(v53);
  }
  else {
    std::string::size_type v46 = v52;
  }
  if (v53 >= 0) {
    v47 = (const std::string::value_type *)&__dst;
  }
  else {
    v47 = __dst;
  }
  std::string::__assign_external((std::string *)(v5 + 88), v47, v46);
  if (v44 < 0) {
    (*(void (**)(uint64_t, const std::string::value_type *, int64_t))(*(void *)v54 + 40))(v54, v45, v53 & 0x7FFFFFFFFFFFFFFFLL);
  }
  v5[9] = [v4 decodeInt32ForKey:@"textType"];
  v5[8] = [v4 decodeInt32ForKey:@"minZoom"];

LABEL_71:
  return (VKLabelExternalTextElement *)v5;
}

- (VKLabelExternalTextElement)initWithTextElement:(const void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VKLabelExternalTextElement;
  id v4 = [(VKLabelExternalTextElement *)&v7 init];
  v5 = v4;
  if (v4) {
    md::LabelExternalTextElement::operator=((uint64_t)&v4->_element, a3);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end