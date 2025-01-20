@interface SEMSkitWrapper
- (SEMSkitWrapper)initWithSkitDirectoryURL:(id)a3;
- (id).cxx_construct;
- (id)readInfo;
- (shared_ptr<semskitbridge::Searcher>)searcher;
- (void)boostrap;
@end

@implementation SEMSkitWrapper

- (SEMSkitWrapper)initWithSkitDirectoryURL:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SEMSkitWrapper;
  v6 = [(SEMSkitWrapper *)&v26 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_skitDirectoryURL, a3);
    objc_msgSend_path(v7->_skitDirectoryURL, v8, v9, v10);
    id v11 = objc_claimAutoreleasedReturnValue();
    v15 = (char *)objc_msgSend_UTF8String(v11, v12, v13, v14);
    if (*((char *)&v7->_skitDirectoryPath.__pn_.__r_.__value_.var0.__l + 23) < 0)
    {
      *(unsigned char *)v7->_skitDirectoryPath.__pn_.__r_.__value_.var0.__l.__data_ = 0;
      v7->_skitDirectoryPath.__pn_.__r_.__value_.var0.__l.__size_ = 0;
    }
    else
    {
      LOBYTE(v7->_skitDirectoryPath.__pn_.__r_.__value_.var0.__s.__data_[0]) = 0;
      *((unsigned char *)&v7->_skitDirectoryPath.__pn_.__r_.__value_.var0.__l + 23) = 0;
    }
    v16 = v15 - 1;
    while (*++v16)
      ;
    sub_25C80BFA0((std::string *)&v7->_skitDirectoryPath, v15, v16);

    sub_25C80DB5C(v18, v19, &v25);
    p_var0 = (void **)&v7->_skitDirectoryPath.__pn_.__r_.var0;
    if (SHIBYTE(v7->_nameTriePath.__pn_.__r_.__value_.var0.__l.__data_) < 0) {
      operator delete(*p_var0);
    }
    *(_OWORD *)p_var0 = *(_OWORD *)&v25.__r_.__value_.__l.__data_;
    v7->_nameTriePath.__pn_.__r_.__value_.var0.__l.__data_ = (unsigned __int16 *)v25.__r_.__value_.__r.__words[2];
    sub_25C80DC10(v20, v21, &v25);
    p_size = (void **)&v7->_nameTriePath.__pn_.__r_.__value_.var0.__l.__size_;
    if (*((char *)&v7->_nameTriePath.__pn_.__r_.var1 + 3) < 0) {
      operator delete(*p_size);
    }
    *(_OWORD *)p_size = *(_OWORD *)&v25.__r_.__value_.__l.__data_;
    *(void *)&v7->_nameTriePath.__pn_.__r_.var0 = *((void *)&v25.__r_.__value_.__l + 2);
  }

  return v7;
}

- (void)boostrap
{
  v3 = (unsigned __int16 *)operator new(0x48uLL);
  *((void *)v3 + 1) = 0;
  *((void *)v3 + 2) = 0;
  *(void *)v3 = &unk_2709E0370;
  if (*((char *)&self->_skitDirectoryPath.__pn_.__r_.__value_.var0.__l + 23) < 0)
  {
    sub_25C7D0C40(__dst, self->_skitDirectoryPath.__pn_.__r_.__value_.var0.__l.__data_, self->_skitDirectoryPath.__pn_.__r_.__value_.var0.__l.__size_);
  }
  else
  {
    *(_OWORD *)__dst = *(_OWORD *)self->_skitDirectoryPath.__pn_.__r_.__value_.var0.__s.__data_;
    uint64_t v8 = *((void *)&self->_skitDirectoryPath.__pn_.__r_.__value_.var0.__l + 2);
  }
  if (SHIBYTE(self->_nameTriePath.__pn_.__r_.__value_.var0.__l.__data_) < 0) {
    sub_25C7D0C40(&v6, *(void **)&self->_skitDirectoryPath.__pn_.__r_.var0, self->_skitDirectoryPath.__pn_.var0);
  }
  else {
    std::__fs::filesystem::path v6 = *(std::__fs::filesystem::path *)&self->_skitDirectoryPath.__pn_.__r_.var0;
  }
  if (*((char *)&self->_nameTriePath.__pn_.__r_.var1 + 3) < 0) {
    sub_25C7D0C40(&__p, (void *)self->_nameTriePath.__pn_.__r_.__value_.var0.__l.__size_, *((void *)&self->_nameTriePath.__pn_.__r_.__value_.var0.__l + 2));
  }
  else {
    std::__fs::filesystem::path __p = *(std::__fs::filesystem::path *)((char *)&self->_nameTriePath.__pn_.__r_.__value_ + 8);
  }
  sub_25C7D9284((uint64_t)(v3 + 12), (uint64_t)__dst, &v6, &__p);
  if (SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__pn_.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v6.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v6.__pn_.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v8) < 0) {
    operator delete(__dst[0]);
  }
  data = self->_aliasTriePath.__pn_.__r_.__value_.var0.__l.__data_;
  self->_nameTriePath.__pn_.var0 = (int64_t)(v3 + 12);
  self->_aliasTriePath.__pn_.__r_.__value_.var0.__l.__data_ = v3;
  if (data) {
    sub_25C7D2280((std::__shared_weak_count *)data);
  }
}

- (id)readInfo
{
  return (id)((uint64_t (*)(__objc2_class *, char *, NSURL *))MEMORY[0x270F9A6D0])(SEMSkitInfo, sel_readOnlySkitInfoAtDirectory_, self->_skitDirectoryURL);
}

- (shared_ptr<semskitbridge::Searcher>)searcher
{
  data = self->_aliasTriePath.__pn_.__r_.__value_.var0.__l.__data_;
  int64_t *v2 = self->_nameTriePath.__pn_.var0;
  v2[1] = (int64_t)data;
  if (data) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)data + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Searcher *)self;
  return result;
}

- (void).cxx_destruct
{
  data = self->_aliasTriePath.__pn_.__r_.__value_.var0.__l.__data_;
  if (data) {
    sub_25C7D2280((std::__shared_weak_count *)data);
  }
  if (*((char *)&self->_nameTriePath.__pn_.__r_.var1 + 3) < 0) {
    operator delete((void *)self->_nameTriePath.__pn_.__r_.__value_.var0.__l.__size_);
  }
  if (SHIBYTE(self->_nameTriePath.__pn_.__r_.__value_.var0.__l.__data_) < 0) {
    operator delete(*(void **)&self->_skitDirectoryPath.__pn_.__r_.var0);
  }
  if (*((char *)&self->_skitDirectoryPath.__pn_.__r_.__value_.var0.__l + 23) < 0) {
    operator delete(self->_skitDirectoryPath.__pn_.__r_.__value_.var0.__l.__data_);
  }
  objc_storeStrong((id *)&self->_skitDirectoryURL, 0);
}

- (id).cxx_construct
{
  *((void *)self + 12) = 0;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

@end