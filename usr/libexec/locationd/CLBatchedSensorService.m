@interface CLBatchedSensorService
+ (BOOL)isSupported;
- (CLBatchedSensorService)initWithClientProtocol:(id)a3;
- (ConnectionInfo)info;
- (NSMutableSet)clients;
- (id).cxx_construct;
- (void)beginService;
- (void)dealloc;
- (void)disableProvider;
- (void)enableProvider;
- (void)endService;
- (void)registerForData:(id)a3;
- (void)setClients:(id)a3;
- (void)setInfo:(ConnectionInfo *)a3;
- (void)unregisterForData:(id)a3;
@end

@implementation CLBatchedSensorService

+ (BOOL)isSupported
{
  if (qword_10247EC98 != -1) {
    dispatch_once(&qword_10247EC98, &stru_1022CF6C0);
  }
  return byte_10247EC90;
}

- (CLBatchedSensorService)initWithClientProtocol:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CLBatchedSensorService;
  result = [(CLBatchedSensorService *)&v4 initWithInboundProtocol:&OBJC_PROTOCOL___CLBatchedSensorServiceProtocol outboundProtocol:a3];
  if (result) {
    result->_clients = 0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLBatchedSensorService;
  [(CLBatchedSensorService *)&v3 dealloc];
}

- (void)beginService
{
  [self universe].silo
  if (qword_102419310 != -1) {
    dispatch_once(&qword_102419310, &stru_1022CF6E0);
  }
  objc_super v3 = qword_102419318;
  if (os_log_type_enabled((os_log_t)qword_102419318, OS_LOG_TYPE_DEFAULT))
  {
    p_info = &self->_info;
    if (*((char *)&self->_info.name.__r_.__value_.var0.var1 + 23) < 0) {
      p_info = (ConnectionInfo *)p_info->name.__r_.__value_.var0.var1.__data_;
    }
    *(_DWORD *)buf = 136446210;
    v7 = p_info;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[service-base-%{public}s] beginning service", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419310 != -1) {
      dispatch_once(&qword_102419310, &stru_1022CF6E0);
    }
    v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBatchedSensorService beginService]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  self->_clients = (NSMutableSet *)objc_opt_new();
}

- (void)endService
{
  [self universe].silo
  if (qword_102419310 != -1) {
    dispatch_once(&qword_102419310, &stru_1022CF6E0);
  }
  objc_super v3 = qword_102419318;
  if (os_log_type_enabled((os_log_t)qword_102419318, OS_LOG_TYPE_DEFAULT))
  {
    p_info = &self->_info;
    if (*((char *)&self->_info.name.__r_.__value_.var0.var1 + 23) < 0) {
      p_info = (ConnectionInfo *)p_info->name.__r_.__value_.var0.var1.__data_;
    }
    *(_DWORD *)buf = 136446210;
    v7 = p_info;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[service-base-%{public}s] ending service", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419310 != -1) {
      dispatch_once(&qword_102419310, &stru_1022CF6E0);
    }
    v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBatchedSensorService endService]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }

  self->_clients = 0;
}

- (void)registerForData:(id)a3
{
  -[NSMutableSet addObject:](self->_clients, "addObject:");
  if (qword_102419310 != -1) {
    dispatch_once(&qword_102419310, &stru_1022CF6E0);
  }
  v5 = qword_102419318;
  if (os_log_type_enabled((os_log_t)qword_102419318, OS_LOG_TYPE_DEFAULT))
  {
    p_info = &self->_info;
    if (*((char *)&self->_info.name.__r_.__value_.var0.var1 + 23) < 0) {
      p_info = (ConnectionInfo *)p_info->name.__r_.__value_.var0.var1.__data_;
    }
    unsigned int v7 = [(NSMutableSet *)self->_clients count];
    *(_DWORD *)buf = 136446722;
    v23 = p_info;
    __int16 v24 = 2050;
    id v25 = a3;
    __int16 v26 = 1026;
    unsigned int v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[service-base-%{public}s] added client %{public}p, num clients %{public}d", buf, 0x1Cu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419310 != -1) {
      dispatch_once(&qword_102419310, &stru_1022CF6E0);
    }
    data = &self->_info;
    if (*((char *)&self->_info.name.__r_.__value_.var0.var1 + 23) < 0) {
      data = (ConnectionInfo *)data->name.__r_.__value_.var0.var1.__data_;
    }
    unsigned int v11 = [(NSMutableSet *)self->_clients count];
    int v16 = 136446722;
    v17 = data;
    __int16 v18 = 2050;
    id v19 = a3;
    __int16 v20 = 1026;
    unsigned int v21 = v11;
    v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBatchedSensorService registerForData:]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  v8 = (NSObject **)sub_10019F4CC();
  v9 = &self->_info;
  if (*((char *)&v9->name.__r_.__value_.var0.var1 + 23) < 0)
  {
    sub_1000DC48C(__p, v9->name.__r_.__value_.var0.var1.__data_, v9->name.__r_.__value_.var0.var1.__size_);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)v9->name.__r_.__value_.var0.var0.__data_;
    uint64_t v14 = *((void *)&v9->name.__r_.__value_.var0.var1 + 2);
  }
  int var0 = v9->name.__r_.var0;
  sub_100F2B9F0(v8, (long long *)__p);
  if (SHIBYTE(v14) < 0) {
    operator delete(__p[0]);
  }
}

- (void)unregisterForData:(id)a3
{
  -[NSMutableSet removeObject:](self->_clients, "removeObject:");
  if (qword_102419310 != -1) {
    dispatch_once(&qword_102419310, &stru_1022CF6E0);
  }
  v5 = qword_102419318;
  if (os_log_type_enabled((os_log_t)qword_102419318, OS_LOG_TYPE_DEFAULT))
  {
    p_info = &self->_info;
    if (*((char *)&self->_info.name.__r_.__value_.var0.var1 + 23) < 0) {
      p_info = (ConnectionInfo *)p_info->name.__r_.__value_.var0.var1.__data_;
    }
    unsigned int v7 = [(NSMutableSet *)self->_clients count];
    *(_DWORD *)buf = 136446722;
    v10 = p_info;
    __int16 v11 = 2050;
    id v12 = a3;
    __int16 v13 = 1026;
    unsigned int v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[service-base-%{public}s] removed client %{public}p, num clients left %{public}d", buf, 0x1Cu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419310 != -1) {
      dispatch_once(&qword_102419310, &stru_1022CF6E0);
    }
    [(NSMutableSet *)self->_clients count];
    v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBatchedSensorService unregisterForData:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
}

- (void)enableProvider
{
  p_info = &self->_info;
  uint64_t v3 = *((unsigned __int8 *)&self->_info.name.__r_.__value_.var0.var1 + 23);
  size_t size = self->_info.name.__r_.__value_.var0.var1.__size_;
  if ((v3 & 0x80u) == 0) {
    unint64_t v5 = *((unsigned __int8 *)&self->_info.name.__r_.__value_.var0.var1 + 23);
  }
  else {
    unint64_t v5 = self->_info.name.__r_.__value_.var0.var1.__size_;
  }
  uint64_t v6 = qword_10247EC58;
  if (byte_10247EC67 >= 0) {
    uint64_t v6 = byte_10247EC67;
  }
  if (v5 == v6)
  {
    if (byte_10247EC67 >= 0) {
      unsigned int v7 = &qword_10247EC50;
    }
    else {
      unsigned int v7 = (uint64_t *)qword_10247EC50;
    }
    if ((v3 & 0x80) != 0)
    {
      if (!memcmp(p_info->name.__r_.__value_.var0.var1.__data_, v7, size)) {
        goto LABEL_31;
      }
    }
    else
    {
      if (!*((unsigned char *)&self->_info.name.__r_.__value_.var0.var1 + 23)) {
        goto LABEL_31;
      }
      v8 = &self->_info;
      uint64_t v9 = *((unsigned __int8 *)&self->_info.name.__r_.__value_.var0.var1 + 23);
      while (v8->name.__r_.__value_.var0.var0.__data_[0] == *(unsigned __int8 *)v7)
      {
        v8 = (ConnectionInfo *)((char *)v8 + 1);
        unsigned int v7 = (uint64_t *)((char *)v7 + 1);
        if (!--v9) {
          goto LABEL_31;
        }
      }
    }
  }
  uint64_t v10 = qword_10247EC78;
  if (byte_10247EC87 >= 0) {
    uint64_t v10 = byte_10247EC87;
  }
  if (v5 != v10) {
    return;
  }
  if (byte_10247EC87 >= 0) {
    __int16 v11 = &qword_10247EC70;
  }
  else {
    __int16 v11 = (uint64_t *)qword_10247EC70;
  }
  if ((v3 & 0x80) != 0)
  {
    if (memcmp(p_info->name.__r_.__value_.var0.var1.__data_, v11, size)) {
      return;
    }
    goto LABEL_31;
  }
  if (!v3)
  {
LABEL_31:
    id v12 = *(void (**)(void))(*(void *)sub_1000D2E34(0) + 176);
    v12();
    return;
  }
  while (p_info->name.__r_.__value_.var0.var0.__data_[0] == *(unsigned __int8 *)v11)
  {
    p_info = (ConnectionInfo *)((char *)p_info + 1);
    __int16 v11 = (uint64_t *)((char *)v11 + 1);
    if (!--v3) {
      goto LABEL_31;
    }
  }
}

- (void)disableProvider
{
  p_info = &self->_info;
  uint64_t v3 = *((unsigned __int8 *)&self->_info.name.__r_.__value_.var0.var1 + 23);
  size_t size = self->_info.name.__r_.__value_.var0.var1.__size_;
  if ((v3 & 0x80u) == 0) {
    unint64_t v5 = *((unsigned __int8 *)&self->_info.name.__r_.__value_.var0.var1 + 23);
  }
  else {
    unint64_t v5 = self->_info.name.__r_.__value_.var0.var1.__size_;
  }
  uint64_t v6 = qword_10247EC58;
  if (byte_10247EC67 >= 0) {
    uint64_t v6 = byte_10247EC67;
  }
  if (v5 == v6)
  {
    if (byte_10247EC67 >= 0) {
      unsigned int v7 = &qword_10247EC50;
    }
    else {
      unsigned int v7 = (uint64_t *)qword_10247EC50;
    }
    if ((v3 & 0x80) != 0)
    {
      if (!memcmp(p_info->name.__r_.__value_.var0.var1.__data_, v7, size)) {
        goto LABEL_31;
      }
    }
    else
    {
      if (!*((unsigned char *)&self->_info.name.__r_.__value_.var0.var1 + 23)) {
        goto LABEL_31;
      }
      v8 = &self->_info;
      uint64_t v9 = *((unsigned __int8 *)&self->_info.name.__r_.__value_.var0.var1 + 23);
      while (v8->name.__r_.__value_.var0.var0.__data_[0] == *(unsigned __int8 *)v7)
      {
        v8 = (ConnectionInfo *)((char *)v8 + 1);
        unsigned int v7 = (uint64_t *)((char *)v7 + 1);
        if (!--v9) {
          goto LABEL_31;
        }
      }
    }
  }
  uint64_t v10 = qword_10247EC78;
  if (byte_10247EC87 >= 0) {
    uint64_t v10 = byte_10247EC87;
  }
  if (v5 != v10) {
    return;
  }
  if (byte_10247EC87 >= 0) {
    __int16 v11 = &qword_10247EC70;
  }
  else {
    __int16 v11 = (uint64_t *)qword_10247EC70;
  }
  if ((v3 & 0x80) != 0)
  {
    if (memcmp(p_info->name.__r_.__value_.var0.var1.__data_, v11, size)) {
      return;
    }
    goto LABEL_31;
  }
  if (!v3)
  {
LABEL_31:
    id v12 = *(void (**)(void))(*(void *)sub_1000D2E34(0) + 176);
    v12();
    return;
  }
  while (p_info->name.__r_.__value_.var0.var0.__data_[0] == *(unsigned __int8 *)v11)
  {
    p_info = (ConnectionInfo *)((char *)p_info + 1);
    __int16 v11 = (uint64_t *)((char *)v11 + 1);
    if (!--v3) {
      goto LABEL_31;
    }
  }
}

- (ConnectionInfo)info
{
  uint64_t v3 = &result->name.__r_.__value_.var0.var1 + 1;
  if (SHIBYTE(result->name.var0) < 0)
  {
    result = (ConnectionInfo *)sub_1000DC48C(retstr, v3->__data_, *(void *)&result->name.__r_.var0);
  }
  else
  {
    retstr->name.__r_.__value_.var0.var1 = *v3;
    *((void *)&retstr->name.__r_.__value_.var0.var1 + 2) = result->name.var0;
  }
  retstr->name.__r_.int var0 = v3[1].__size_;
  return result;
}

- (void)setInfo:(ConnectionInfo *)a3
{
  p_info = &self->_info;
  std::string::operator=((std::string *)&self->_info, (const std::string *)a3);
  p_info->name.__r_.int var0 = a3->name.__r_.var0;
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (void).cxx_destruct
{
  if (*((char *)&self->_info.name.__r_.__value_.var0.var1 + 23) < 0) {
    operator delete(self->_info.name.__r_.__value_.var0.var1.__data_);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0uLL;
  *((void *)self + 2) = 0;
  return self;
}

@end