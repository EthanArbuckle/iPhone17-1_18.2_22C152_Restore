@interface RSDRemoteLoopbackDevice
- (BOOL)connectable;
- (const)local_address;
- (const)remote_address;
- (int)connectToService:(char *)a3 withTcpOption:(id *)a4;
- (int)listenForService:(char *)a3 port:(char *)a4;
- (unint64_t)tlsRequirement;
- (unsigned)interface_index;
- (unsigned)type;
@end

@implementation RSDRemoteLoopbackDevice

- (unint64_t)tlsRequirement
{
  uint64_t v2 = sub_1000194AC((void *)qword_10005BFE8, @"rsd_loopback_tls_requirement", @"loopback-tls-requirement");
  if (v2)
  {
    unint64_t v3 = v2;
    v4 = "";
  }
  else
  {
    int is_darwinos = os_variant_is_darwinos();
    if (is_darwinos) {
      v4 = " by default for darwinOS";
    }
    else {
      v4 = " by default for non-darwinOS";
    }
    if (is_darwinos) {
      unint64_t v3 = 2;
    }
    else {
      unint64_t v3 = 1;
    }
  }
  v6 = (void *)qword_10005BFE8;
  if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    int v9 = 136315394;
    v10 = sub_100018FBC(v3);
    __int16 v11 = 2080;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "TLS is %s for loopback%s", (uint8_t *)&v9, 0x16u);
  }
  return v3;
}

- (unsigned)type
{
  return 1;
}

- (BOOL)connectable
{
  if (byte_10005C008) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)RSDRemoteLoopbackDevice;
  return [(RSDRemoteDevice *)&v3 connectable];
}

- (unsigned)interface_index
{
  unsigned int result = _os_crash();
  __break(1u);
  return result;
}

- (const)remote_address
{
  unsigned int result = (const in6_addr *)_os_crash();
  __break(1u);
  return result;
}

- (const)local_address
{
  unsigned int result = (const in6_addr *)_os_crash();
  __break(1u);
  return result;
}

- (int)listenForService:(char *)a3 port:(char *)a4
{
  int v5 = socket(2, 1, 0);
  if (v5 == -1)
  {
    int v9 = (void *)qword_10005BFE8;
    if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_ERROR)) {
      sub_10003F9BC(v9);
    }
    return -1;
  }
  int v6 = v5;
  *(_DWORD *)&v19.sa_len = 512;
  *(_DWORD *)&v19.sa_data[2] = inet_addr("127.0.0.1");
  *(void *)&v19.sa_data[6] = 0;
  if (bind(v6, &v19, 0x10u) == -1)
  {
    v10 = (void *)qword_10005BFE8;
    if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_ERROR)) {
      sub_10003FA48(v10);
    }
    goto LABEL_16;
  }
  if (listen(v6, 128) == -1)
  {
    __int16 v11 = (void *)qword_10005BFE8;
    if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_ERROR)) {
      sub_10003FAD4(v11);
    }
    goto LABEL_16;
  }
  socklen_t v14 = 16;
  if (getsockname(v6, &v19, &v14) == -1)
  {
    v12 = (void *)qword_10005BFE8;
    if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_ERROR)) {
      sub_10003FB60(v12);
    }
LABEL_16:
    close(v6);
    return -1;
  }
  unsigned int v7 = bswap32(*(unsigned __int16 *)v19.sa_data) >> 16;
  v8 = qword_10005BFE8;
  if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = qword_10005BFF0;
    __int16 v17 = 1024;
    unsigned int v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@> Bound to localhost:%d", buf, 0x12u);
  }
  asprintf(a4, "%d", v7);
  return v6;
}

- (int)connectToService:(char *)a3 withTcpOption:(id *)a4
{
  if (byte_10005C008 == 1)
  {
    v4 = qword_10005BFE8;
    if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_ERROR)) {
      sub_10003FBEC(v4);
    }
    return -1;
  }
  int v6 = socket(2, 1, 0);
  if (v6 == -1)
  {
    v10 = (void *)qword_10005BFE8;
    if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_ERROR)) {
      sub_10003F9BC(v10);
    }
    return -1;
  }
  int v7 = v6;
  if (fcntl(v6, 4, 4) == -1)
  {
    __int16 v11 = (void *)qword_10005BFE8;
    if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_ERROR)) {
      sub_10003FC70(v11);
    }
    goto LABEL_19;
  }
  uint64_t v8 = strtol(a3, 0, 0);
  if ((unint64_t)(v8 - 0x10000) <= 0xFFFFFFFFFFFF0000)
  {
    int v9 = qword_10005BFE8;
    if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_ERROR)) {
      sub_10003FCFC((uint64_t)a3, v9);
    }
LABEL_19:
    close(v7);
    return -1;
  }
  v20[0] = 512;
  v20[1] = bswap32(v8) >> 16;
  in_addr_t v21 = inet_addr("127.0.0.1");
  uint64_t v22 = 0;
  memset(&v15, 0, 24);
  v15.sae_dstaddr = (const sockaddr *)v20;
  *(&v15.sae_dstaddrlen + 1) = 0;
  v15.sae_dstaddrlen = 16;
  if (connectx(v7, &v15, 0, 0, 0, 0, 0, 0) && *__error() != 36)
  {
    v13 = (void *)qword_10005BFE8;
    if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_ERROR)) {
      sub_10003FD88(v13);
    }
    goto LABEL_19;
  }
  v12 = qword_10005BFE8;
  if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = qword_10005BFF0;
    __int16 v18 = 2080;
    sockaddr v19 = a3;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@> connectx(2) succeeded to %s", buf, 0x16u);
  }
  return v7;
}

@end