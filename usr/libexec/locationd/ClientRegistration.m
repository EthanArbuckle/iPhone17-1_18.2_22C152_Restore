@interface ClientRegistration
- (CLMotionAlarmNotifierClientProtocol)adapter;
- (Name)name;
- (id).cxx_construct;
- (void)dealloc;
- (void)setAdapter:(id)a3;
- (void)setName:(Name *)a3;
@end

@implementation ClientRegistration

- (void)dealloc
{
  self->_adapter = 0;
  v3.receiver = self;
  v3.super_class = (Class)ClientRegistration;
  [(ClientRegistration *)&v3 dealloc];
}

- (CLMotionAlarmNotifierClientProtocol)adapter
{
  return self->_adapter;
}

- (void)setAdapter:(id)a3
{
}

- (Name)name
{
  return (Name *)sub_100089AE0(retstr->fUserName.__r_.__value_.var0.var0.__data_, (long long *)(v1 + 16));
}

- (void)setName:(Name *)a3
{
  std::string::operator=((std::string *)&self->_name, (const std::string *)a3);
  std::string::operator=((std::string *)&self->_name.fUserName.__r_.var0, (const std::string *)&a3->fUserName.__r_.var0);
  std::string::operator=((std::string *)&self[1]._adapter, (const std::string *)&a3[1].fUserName.__r_.__value_.var0.var1.__size_);
  std::string::operator=((std::string *)(&self[1]._name.fUserName.__r_.__value_.var0.var1 + 1), (const std::string *)&a3[1].fUserName.var0);
  char v5 = a3[2].fUserName.__r_.__value_.var0.var0.__data_[18];
  LOWORD(self[2].super.isa) = *((_WORD *)&a3[2].fUserName.__r_.__value_.var0.var1 + 8);
  BYTE2(self[2].super.isa) = v5;
  std::string::operator=((std::string *)&self[2]._adapter, (const std::string *)&a3[2].fUserName.__r_.var0);
  std::string::operator=((std::string *)(&self[2]._name.fUserName.__r_.__value_.var0.var1 + 1), (const std::string *)&a3[3].fUserName.__r_.__value_.var0.var1.__size_);
  std::string::operator=((std::string *)&self[3], (const std::string *)&a3[3].fUserName.var0);
  char v6 = a3[4].fUserName.__r_.__value_.var0.var0.__data_[18];
  LOWORD(self[3]._name.fUserName.__r_.__value_.var0.var1.__size_) = *((_WORD *)&a3[4].fUserName.__r_.__value_.var0.var1
                                                                    + 8);
  self[3]._name.fUserName.__r_.__value_.var0.var0.__data_[10] = v6;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *(_DWORD *)((char *)self + 111) = 0;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 179) = 0u;
  return self;
}

@end