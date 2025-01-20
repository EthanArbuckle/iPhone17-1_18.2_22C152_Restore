@interface _SSBServiceStatus
- (NSArray)activeTransactions;
- (NSArray)databaseUpdatersStatuses;
- (NSString)name;
- (_SSBServiceStatus)initWithServiceStatus:(ServiceStatus *)a3;
- (id).cxx_construct;
- (id)bundleIdentifierForConnectionAtIndex:(unint64_t)a3;
- (int)processIdentifier;
- (int)processIdentifierForConnectionAtIndex:(unint64_t)a3;
- (unint64_t)connectionCount;
- (unint64_t)databaseUpdaterState;
@end

@implementation _SSBServiceStatus

- (_SSBServiceStatus)initWithServiceStatus:(ServiceStatus *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_SSBServiceStatus;
  v4 = [(_SSBServiceStatus *)&v10 init];
  v5 = v4;
  if (v4)
  {
    p_serviceStatus = (void **)&v4->_serviceStatus;
    if (*((char *)&v4->_serviceStatus.m_name.__r_.__value_.var0.var1 + 23) < 0) {
      operator delete(*p_serviceStatus);
    }
    long long v7 = *(_OWORD *)a3->m_name.__r_.__value_.var0.var0.__data_;
    *((void *)&v5->_serviceStatus.m_name.__r_.__value_.var0.var1 + 2) = *((void *)&a3->m_name.__r_.__value_.var0.var1
                                                                          + 2);
    *(_OWORD *)p_serviceStatus = v7;
    *((unsigned char *)&a3->m_name.__r_.__value_.var0.var1 + 23) = 0;
    a3->m_name.__r_.__value_.var0.var0.__data_[0] = 0;
    v5->_serviceStatus.m_name.__r_.var0 = a3->m_name.__r_.var0;
    std::vector<std::string>::__vdeallocate((std::vector<std::string> *)&v5->_serviceStatus.m_name.var0);
    *(_OWORD *)&v5->_serviceStatus.m_name.var0 = *(_OWORD *)&a3->m_name.var0;
    v5[1]._serviceStatus.m_name.__r_.__value_.var0.var1.__data_ = (char *)a3[1].m_name.__r_.__value_.var0.var1.__size_;
    a3->m_name.var0 = 0;
    a3[1].m_name.__r_.__value_.var0.var1.__data_ = 0;
    a3[1].m_name.__r_.__value_.var0.var1.__size_ = 0;
    std::vector<SafeBrowsing::ServiceStatus::Connection>::__vdeallocate((uint64_t *)&v5[1]._serviceStatus.m_name.__r_.__value_.var0.var1.__size_);
    *(_OWORD *)&v5[1]._serviceStatus.m_name.__r_.__value_.var0.var1.__size_ = *((_OWORD *)&a3[1].m_name.__r_.__value_.var0.var1
                                                                              + 1);
    *(void *)&v5[1]._serviceStatus.m_name.__r_.var0 = a3[1].m_name.var0;
    *((void *)&a3[1].m_name.__r_.__value_.var0.var1 + 2) = 0;
    *(void *)&a3[1].m_name.__r_.var0 = 0;
    a3[1].m_name.var0 = 0;
    std::vector<SafeBrowsing::ServiceStatus::DatabaseUpdaterStatus>::__move_assign((uint64_t)&v5[1]._serviceStatus.m_name.var0, (__n128 *)&a3[2]);
    v8 = v5;
  }

  return v5;
}

- (NSString)name
{
  p_serviceStatus = &self->_serviceStatus;
  if (*((char *)&self->_serviceStatus.m_name.__r_.__value_.var0.var1 + 23) < 0) {
    p_serviceStatus = (ServiceStatus *)p_serviceStatus->m_name.__r_.__value_.var0.var1.__data_;
  }
  return (NSString *)[NSString stringWithUTF8String:p_serviceStatus];
}

- (int)processIdentifier
{
  return self->_serviceStatus.m_name.__r_.var0;
}

- (NSArray)activeTransactions
{
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:0xAAAAAAAAAAAAAAABLL * (((uint64_t)self[1].super.isa - self->_serviceStatus.m_name.var0) >> 3)];
  int64_t var0 = self->_serviceStatus.m_name.var0;
  for (Class i = self[1].super.isa; (Class)var0 != i; var0 += 24)
  {
    int64_t v6 = var0;
    if (*(char *)(var0 + 23) < 0) {
      int64_t v6 = *(void *)var0;
    }
    long long v7 = [NSString stringWithUTF8String:v6];
    [v3 addObject:v7];
  }

  return (NSArray *)v3;
}

- (unint64_t)connectionCount
{
  return (uint64_t)(*((void *)&self[1]._serviceStatus.m_name.__r_.__value_.var0.var1 + 2)
                 - self[1]._serviceStatus.m_name.__r_.__value_.var0.var1.__size_) >> 5;
}

- (int)processIdentifierForConnectionAtIndex:(unint64_t)a3
{
  unint64_t size = self[1]._serviceStatus.m_name.__r_.__value_.var0.var1.__size_;
  unint64_t v5 = (uint64_t)(*((void *)&self[1]._serviceStatus.m_name.__r_.__value_.var0.var1 + 2) - size) >> 5;
  if (v5 <= a3)
  {
    long long v7 = self;
    v8 = (void *)MEMORY[0x263EFF940];
    v9 = (objc_class *)objc_opt_class();
    objc_super v10 = NSStringFromClass(v9);
    v11 = NSStringFromSelector(a2);
    [v8 raise:*MEMORY[0x263EFF578], @"-[%@ %@]", v10, v11 format];

    unint64_t size = v7[1]._serviceStatus.m_name.__r_.__value_.var0.var1.__size_;
    unint64_t v5 = (uint64_t)(*((void *)&v7[1]._serviceStatus.m_name.__r_.__value_.var0.var1 + 2) - size) >> 5;
  }
  if (v5 <= a3) {
    __break(1u);
  }
  else {
    LODWORD(self) = *(_DWORD *)(size + 32 * a3);
  }
  return (int)self;
}

- (id)bundleIdentifierForConnectionAtIndex:(unint64_t)a3
{
  uint64_t v4 = *((void *)self + 8);
  unint64_t v5 = (*((void *)self + 9) - v4) >> 5;
  if (v5 <= a3)
  {
    long long v7 = self;
    v8 = (void *)MEMORY[0x263EFF940];
    v9 = (objc_class *)objc_opt_class();
    objc_super v10 = NSStringFromClass(v9);
    v11 = NSStringFromSelector(a2);
    [v8 raise:*MEMORY[0x263EFF578], @"-[%@ %@]", v10, v11 format];

    uint64_t v4 = v7[8];
    unint64_t v5 = (v7[9] - v4) >> 5;
  }
  if (v5 <= a3)
  {
    __break(1u);
    return self;
  }
  uint64_t v12 = v4 + 32 * a3;
  v13 = (void *)(v12 + 8);
  int v14 = *(char *)(v12 + 31);
  if (v14 < 0)
  {
    if (!v13[1])
    {
LABEL_10:
      v15 = 0;
      goto LABEL_11;
    }
    v13 = (void *)*v13;
  }
  else if (!v14)
  {
    goto LABEL_10;
  }
  v15 = [NSString stringWithUTF8String:v13];
LABEL_11:

  return v15;
}

- (NSArray)databaseUpdatersStatuses
{
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:((uint64_t)self[2].super.isa - self[1]._serviceStatus.m_name.var0) >> 3];
  int64_t var0 = (void *)self[1]._serviceStatus.m_name.var0;
  for (Class i = self[2].super.isa; var0 != (void *)i; ++var0)
  {
    id v6 = [[SSBDatabaseUpdaterStatus alloc] _initWithDatabaseUpdaterStatus:*var0];
    [v3 addObject:v6];
  }

  return (NSArray *)v3;
}

- (unint64_t)databaseUpdaterState
{
  v2 = *(int **)(self + 88);
  if (v2 != *(int **)(self + 96)) {
    return *v2;
  }
  __break(1u);
  return self;
}

- (void).cxx_destruct
{
  int64_t var0 = (objc_class *)self[1]._serviceStatus.m_name.var0;
  if (var0)
  {
    self[2].super.isa = var0;
    operator delete(var0);
  }
  p_unint64_t size = (void **)&self[1]._serviceStatus.m_name.__r_.__value_.var0.var1.__size_;
  std::vector<SafeBrowsing::ServiceStatus::Connection>::__destroy_vector::operator()[abi:sn180100](&p_size);
  p_unint64_t size = (void **)&self->_serviceStatus.m_name.var0;
  std::vector<std::string>::__destroy_vector::operator()[abi:sn180100](&p_size);
  if (*((char *)&self->_serviceStatus.m_name.__r_.__value_.var0.var1 + 23) < 0) {
    operator delete(self->_serviceStatus.m_name.__r_.__value_.var0.var1.__data_);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 8) = 0uLL;
  *((void *)self + 3) = 0;
  *((_DWORD *)self + 8) = -1;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((void *)self + 13) = 0;
  return self;
}

@end