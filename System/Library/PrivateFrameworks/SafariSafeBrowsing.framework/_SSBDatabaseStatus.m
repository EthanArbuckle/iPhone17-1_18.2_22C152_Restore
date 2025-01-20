@interface _SSBDatabaseStatus
- (_SSBDatabaseStatus)initWithDatabaseStatus:(DatabaseStatus *)a3;
- (id).cxx_construct;
- (id)lastUpdateTimeOfDatabaseAtIndex:(unint64_t)a3;
- (id)nameOfDatabaseAtIndex:(unint64_t)a3;
- (id)nextPollingTimeOfDatabaseAtIndex:(unint64_t)a3;
- (unint64_t)databaseCount;
- (unint64_t)sizeOfDatabaseAtIndex:(unint64_t)a3;
- (unsigned)hashCountOfDatabaseAtIndex:(unint64_t)a3;
@end

@implementation _SSBDatabaseStatus

- (_SSBDatabaseStatus)initWithDatabaseStatus:(DatabaseStatus *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_SSBDatabaseStatus;
  v4 = [(_SSBDatabaseStatus *)&v8 init];
  v5 = v4;
  if (v4)
  {
    std::vector<SafeBrowsing::DatabaseStatus::Database>::__vdeallocate((uint64_t *)v4 + 1);
    *(_OWORD *)(v5 + 8) = *(_OWORD *)&a3->m_databases.__begin_;
    *((void *)v5 + 3) = a3->m_databases.__end_cap_.__value_;
    a3->m_databases.__begin_ = 0;
    a3->m_databases.__end_ = 0;
    a3->m_databases.__end_cap_.__value_ = 0;
    v6 = v5;
  }

  return (_SSBDatabaseStatus *)v5;
}

- (unint64_t)databaseCount
{
  return 0x6DB6DB6DB6DB6DB7
       * ((self->_databaseStatus.m_databases.__end_ - self->_databaseStatus.m_databases.__begin_) >> 3);
}

- (id)nameOfDatabaseAtIndex:(unint64_t)a3
{
  uint64_t v4 = *((void *)self + 1);
  unint64_t v5 = 0x6DB6DB6DB6DB6DB7 * ((*((void *)self + 2) - v4) >> 3);
  if (v5 <= a3)
  {
    v7 = self;
    objc_super v8 = (void *)MEMORY[0x263EFF940];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = NSStringFromSelector(a2);
    [v8 raise:*MEMORY[0x263EFF578], @"-[%@ %@]", v10, v11 format];

    uint64_t v4 = v7[1];
    unint64_t v5 = 0x6DB6DB6DB6DB6DB7 * ((v7[2] - v4) >> 3);
  }
  if (v5 <= a3)
  {
    __break(1u);
  }
  else
  {
    v12 = NSString;
    v13 = (uint64_t *)(v4 + 56 * a3);
    if (*((char *)v13 + 23) < 0) {
      v13 = (uint64_t *)*v13;
    }
    return (id)[v12 stringWithUTF8String:v13];
  }
  return self;
}

- (unint64_t)sizeOfDatabaseAtIndex:(unint64_t)a3
{
  uint64_t v4 = *(void *)(self + 8);
  unint64_t v5 = 0x6DB6DB6DB6DB6DB7 * ((*(void *)(self + 16) - v4) >> 3);
  if (v5 <= a3)
  {
    unint64_t v7 = self;
    objc_super v8 = (void *)MEMORY[0x263EFF940];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = NSStringFromSelector(a2);
    [v8 raise:*MEMORY[0x263EFF578], @"-[%@ %@]", v10, v11 format];

    uint64_t v4 = *(void *)(v7 + 8);
    unint64_t v5 = 0x6DB6DB6DB6DB6DB7 * ((*(void *)(v7 + 16) - v4) >> 3);
  }
  if (v5 > a3) {
    return *(void *)(v4 + 56 * a3 + 24);
  }
  __break(1u);
  return self;
}

- (unsigned)hashCountOfDatabaseAtIndex:(unint64_t)a3
{
  begin = self->_databaseStatus.m_databases.__begin_;
  unint64_t v5 = 0x6DB6DB6DB6DB6DB7 * ((self->_databaseStatus.m_databases.__end_ - begin) >> 3);
  if (v5 <= a3)
  {
    unint64_t v7 = self;
    objc_super v8 = (void *)MEMORY[0x263EFF940];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = NSStringFromSelector(a2);
    [v8 raise:*MEMORY[0x263EFF578], @"-[%@ %@]", v10, v11 format];

    begin = v7->_databaseStatus.m_databases.__begin_;
    unint64_t v5 = 0x6DB6DB6DB6DB6DB7 * ((v7->_databaseStatus.m_databases.__end_ - begin) >> 3);
  }
  if (v5 <= a3) {
    __break(1u);
  }
  else {
    LODWORD(self) = *((_DWORD *)begin + 14 * a3 + 8);
  }
  return self;
}

- (id)lastUpdateTimeOfDatabaseAtIndex:(unint64_t)a3
{
  uint64_t v4 = *((void *)self + 1);
  unint64_t v5 = 0x6DB6DB6DB6DB6DB7 * ((*((void *)self + 2) - v4) >> 3);
  if (v5 <= a3)
  {
    unint64_t v7 = self;
    objc_super v8 = (void *)MEMORY[0x263EFF940];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = NSStringFromSelector(a2);
    [v8 raise:*MEMORY[0x263EFF578], @"-[%@ %@]", v10, v11 format];

    uint64_t v4 = v7[1];
    unint64_t v5 = 0x6DB6DB6DB6DB6DB7 * ((v7[2] - v4) >> 3);
  }
  if (v5 <= a3)
  {
    __break(1u);
  }
  else
  {
    v12 = (void *)MEMORY[0x263EFF910];
    uint64_t v13 = (unsigned __int128)(*(uint64_t *)(v4 + 56 * a3 + 40) * (__int128)0x431BDE82D7B634DBLL) >> 64;
    return (id)[v12 dateWithTimeIntervalSince1970:(double)(uint64_t)((v13 >> 18) + ((unint64_t)v13 >> 63))];
  }
  return self;
}

- (id)nextPollingTimeOfDatabaseAtIndex:(unint64_t)a3
{
  uint64_t v4 = *((void *)self + 1);
  unint64_t v5 = 0x6DB6DB6DB6DB6DB7 * ((*((void *)self + 2) - v4) >> 3);
  if (v5 <= a3)
  {
    unint64_t v7 = self;
    objc_super v8 = (void *)MEMORY[0x263EFF940];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = NSStringFromSelector(a2);
    [v8 raise:*MEMORY[0x263EFF578], @"-[%@ %@]", v10, v11 format];

    uint64_t v4 = v7[1];
    unint64_t v5 = 0x6DB6DB6DB6DB6DB7 * ((v7[2] - v4) >> 3);
  }
  if (v5 <= a3)
  {
    __break(1u);
  }
  else
  {
    v12 = (void *)MEMORY[0x263EFF910];
    uint64_t v13 = (unsigned __int128)(*(uint64_t *)(v4 + 56 * a3 + 48) * (__int128)0x431BDE82D7B634DBLL) >> 64;
    return (id)[v12 dateWithTimeIntervalSince1970:(double)(uint64_t)((v13 >> 18) + ((unint64_t)v13 >> 63))];
  }
  return self;
}

- (void).cxx_destruct
{
  p_databaseStatus = &self->_databaseStatus;
  std::vector<SafeBrowsing::DatabaseStatus::Database>::__destroy_vector::operator()[abi:sn180100]((void ***)&p_databaseStatus);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end