@interface NRBabelInterfaceSocket
- (BOOL)handlePathUpdate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)setupLocalAddress;
- (BOOL)setupLocalAddressCheckAgainst:(const in6_addr *)a3;
- (NRBabelInterfaceSocket)initWithInstance:(id)a3 interface:(unsigned int)a4;
- (NSString)ifName;
- (OS_dispatch_source)socketReadSource;
- (OS_nw_interface)nwIf;
- (OS_nw_path_evaluator)pathEvaluator;
- (id)description;
- (int)fd;
- (unsigned)ifIndex;
- (void)addToProhibited:(id)a3;
- (void)dealloc;
- (void)readPackets;
- (void)sendPacket:(iovec *)a3 iovLen:(unsigned int)a4 toAddr:(const in6_addr *)a5;
- (void)setFd:(int)a3;
- (void)setIfIndex:(unsigned int)a3;
- (void)setIfName:(id)a3;
- (void)setNwIf:(id)a3;
- (void)setPathEvaluator:(id)a3;
- (void)setSocketReadSource:(id)a3;
@end

@implementation NRBabelInterfaceSocket

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nwIf, 0);
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
  objc_storeStrong((id *)&self->_socketReadSource, 0);

  objc_storeStrong((id *)&self->_ifName, 0);
}

- (void)setNwIf:(id)a3
{
}

- (OS_nw_interface)nwIf
{
  return self->_nwIf;
}

- (void)setPathEvaluator:(id)a3
{
}

- (OS_nw_path_evaluator)pathEvaluator
{
  return self->_pathEvaluator;
}

- (void)setSocketReadSource:(id)a3
{
}

- (OS_dispatch_source)socketReadSource
{
  return self->_socketReadSource;
}

- (void)setFd:(int)a3
{
  self->_fd = a3;
}

- (int)fd
{
  return self->_fd;
}

- (void)setIfName:(id)a3
{
}

- (NSString)ifName
{
  return self->_ifName;
}

- (void)setIfIndex:(unsigned int)a3
{
  self->_ifIndex = a3;
}

- (unsigned)ifIndex
{
  return self->_ifIndex;
}

- (void)addToProhibited:(id)a3
{
  id v12 = a3;
  v4 = (void *)nw_parameters_copy_prohibited_interfaces();
  if (!v4)
  {
    v5 = &v12;
    xpc_object_t v6 = xpc_array_create(0, 0);
    if (!v6)
    {
      id v8 = sub_1000B9E04();
      int IsLevelEnabled = _NRLogIsLevelEnabled();

      if (IsLevelEnabled)
      {
        id v10 = sub_1000B9E04();
        _NRLogWithArgs();
      }
      v4 = (void *)_os_log_pack_size();
      __chkstk_darwin(v4);
      __error();
      uint64_t v11 = _os_log_pack_fill();
      sub_10005F8D8(v11, (uint64_t)"nr_xpc_array_create");
      sub_1000B9E04();
      _NRLogAbortWithPack();
LABEL_17:
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      goto LABEL_7;
    }
    v4 = v6;
  }
  v5 = (id *)nw_interface_copy_dictionary();
  if (v5)
  {
    xpc_array_append_value(v4, v5);
    nw_parameters_set_prohibited_interfaces();
    goto LABEL_11;
  }
  v3 = &unk_1001F4000;
  if (qword_1001F4A58 != -1) {
    goto LABEL_17;
  }
LABEL_7:
  if (_NRLogIsLevelEnabled())
  {
    if (v3[331] != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    _NRLogWithArgs();
  }
LABEL_11:

  v7 = v12;
}

- (BOOL)handlePathUpdate:(id)a3
{
  v4 = a3;
  v5 = [(NRBabelInterface *)self instance];
  if (v5)
  {
    if (nw_path_get_status(v4) == nw_path_status_satisfied)
    {
      if (![(NRBabelInterface *)self viable])
      {
        if (qword_1001F4A58 != -1) {
          dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
        }
        if (_NRLogIsLevelEnabled())
        {
          if (qword_1001F4A58 != -1) {
            dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
          }
          uint64_t v22 = 1207;
          v25 = self;
          v16 = "";
          v19 = "-[NRBabelInterfaceSocket handlePathUpdate:]";
          _NRLogWithArgs();
        }
      }
      -[NRBabelInterface setViable:](self, "setViable:", 1, v16, v19, v22, v25);
      id v6 = objc_alloc((Class)NSString);
      ifName = self->_ifName;
      id v8 = [v5 addrStr];
      id v9 = [v6 initWithFormat:@"for addr in $(ifconfig %@ | grep 'inet6 fdfd:' | sed -e 's/^[[:space:]]*//' | cut -d' ' -f2); do ifconfig %@ inet6 -alias $addr ; done ; ifconfig %@ inet6 %@/128"];
             ifName,
             ifName,
             ifName,
             v8);

      system((const char *)[v9 UTF8String]);
      int mtu = nw_path_get_mtu();
      uint64_t v11 = (mtu - 48);
      if (mtu > 559)
      {
        if (mtu >= 0x10030)
        {
          if (qword_1001F4A58 != -1) {
            dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
          }
          if (_NRLogIsLevelEnabled())
          {
            if (qword_1001F4A58 != -1) {
              dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
            }
            uint64_t ifIndex = self->_ifIndex;
            uint64_t status = v11;
            uint64_t v23 = 1225;
            v17 = "";
            v20 = "-[NRBabelInterfaceSocket handlePathUpdate:]";
            _NRLogWithArgs();
          }
          uint64_t v11 = 0xFFFFLL;
        }
      }
      else
      {
        if (qword_1001F4A58 != -1) {
          dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
        }
        if (_NRLogIsLevelEnabled())
        {
          if (qword_1001F4A58 != -1) {
            dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
          }
          uint64_t ifIndex = self->_ifIndex;
          uint64_t status = v11;
          uint64_t v23 = 1222;
          v17 = "";
          v20 = "-[NRBabelInterfaceSocket handlePathUpdate:]";
          _NRLogWithArgs();
        }
        uint64_t v11 = 512;
      }
      if ([(NRBabelInterface *)self mtu] != (unsigned __int16)v11)
      {
        if (qword_1001F4A58 != -1) {
          dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
        }
        if (_NRLogIsLevelEnabled())
        {
          if (qword_1001F4A58 != -1) {
            dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
          }
          id v14 = (id)qword_1001F4A50;
          uint64_t v29 = v11;
          uint64_t v24 = 1229;
          uint64_t v27 = [(NRBabelInterface *)self mtu];
          v18 = "";
          v21 = "-[NRBabelInterfaceSocket handlePathUpdate:]";
          _NRLogWithArgs();
        }
        -[NRBabelInterface setMtu:](self, "setMtu:", (unsigned __int16)v11, v18, v21, v24, v27, v29);
      }

      BOOL v12 = 1;
    }
    else
    {
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4A58 != -1) {
          dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
        }
        id v13 = (id)qword_1001F4A50;
        v25 = self;
        uint64_t status = nw_path_get_status(v4);
        uint64_t v22 = 1201;
        v16 = "";
        v19 = "-[NRBabelInterfaceSocket handlePathUpdate:]";
        _NRLogWithArgs();
      }
      -[NRBabelInterface setViable:](self, "setViable:", 0, v16, v19, v22, v25, status);
      [v5 purgeInterface:self];
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (NRBabelInterfaceSocket)initWithInstance:(id)a3 interface:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  int v85 = v4;
  v84.receiver = self;
  v84.super_class = (Class)NRBabelInterfaceSocket;
  v7 = [(NRBabelInterface *)&v84 initWithInstance:v6];
  id v8 = v7;
  if (!v7)
  {
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    if (!_NRLogIsLevelEnabled()) {
      goto LABEL_116;
    }
    if (qword_1001F4A58 == -1) {
      goto LABEL_8;
    }
    goto LABEL_77;
  }
  v7->_uint64_t ifIndex = v4;
  BOOL v9 = if_indextoname(v4, (char *)__strerrbuf) == 0;
  id v10 = objc_alloc((Class)NSString);
  if (v9) {
    uint64_t v11 = [(NSString *)[v10 initWithFormat:@"invalid%u", v4];
  }
  else {
    uint64_t v11 = (NSString *)[v10 initWithUTF8String:__strerrbuf];
  }
  ifName = v8->_ifName;
  v8->_ifName = v11;

  if ([(NSString *)v8->_ifName hasPrefix:@"en"]) {
    [(NRBabelInterface *)v8 setDtlsEnabled:1];
  }
  unsigned int v13 = socket(30, 2, 0);
  if ((v13 & 0x80000000) != 0)
  {
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    if (!_NRLogIsLevelEnabled()) {
      goto LABEL_116;
    }
    if (qword_1001F4A58 == -1) {
      goto LABEL_8;
    }
LABEL_77:
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
LABEL_8:
    _NRLogWithArgs();
LABEL_116:
    v74 = 0;
    goto LABEL_117;
  }
  if (![(NRBabelInterfaceSocket *)v8 setupLocalAddress])
  {
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    if (!_NRLogIsLevelEnabled()) {
      goto LABEL_115;
    }
    if (qword_1001F4A58 == -1) {
      goto LABEL_39;
    }
    goto LABEL_85;
  }
  int v14 = fcntl(v13, 3, 0);
  if (v14 < 0)
  {
    v16 = __error();
    if (strerror_r(*v16, (char *)__strerrbuf, 0x80uLL)) {
      LOBYTE(__strerrbuf[0]) = 0;
    }
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    if (!_NRLogIsLevelEnabled()) {
      goto LABEL_115;
    }
    if (qword_1001F4A58 == -1) {
      goto LABEL_39;
    }
    goto LABEL_85;
  }
  if (fcntl(v13, 4, v14 | 4u))
  {
    v15 = __error();
    if (strerror_r(*v15, (char *)__strerrbuf, 0x80uLL)) {
      LOBYTE(__strerrbuf[0]) = 0;
    }
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    if (!_NRLogIsLevelEnabled()) {
      goto LABEL_115;
    }
    if (qword_1001F4A58 == -1) {
      goto LABEL_39;
    }
LABEL_85:
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
LABEL_39:
    _NRLogWithArgs();
LABEL_115:
    close(v13);
    goto LABEL_116;
  }
  long long v82 = xmmword_10016CA04;
  int v83 = v85;
  if (setsockopt(v13, 41, 12, &v82, 0x14u))
  {
    v17 = __error();
    if (strerror_r(*v17, (char *)__strerrbuf, 0x80uLL)) {
      LOBYTE(__strerrbuf[0]) = 0;
    }
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    if (!_NRLogIsLevelEnabled()) {
      goto LABEL_115;
    }
    goto LABEL_66;
  }
  if (setsockopt(v13, 41, 11, &unk_10016C9E0, 4u))
  {
    v18 = __error();
    if (strerror_r(*v18, (char *)__strerrbuf, 0x80uLL)) {
      LOBYTE(__strerrbuf[0]) = 0;
    }
    id v19 = sub_1000B9E04();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_115;
    }
    goto LABEL_66;
  }
  if (setsockopt(v13, 0xFFFF, 4, &unk_10016C9E4, 4u))
  {
    v21 = __error();
    if (strerror_r(*v21, (char *)__strerrbuf, 0x80uLL)) {
      LOBYTE(__strerrbuf[0]) = 0;
    }
    id v22 = sub_1000B9E04();
    int v23 = _NRLogIsLevelEnabled();

    if (!v23) {
      goto LABEL_115;
    }
    goto LABEL_66;
  }
  if (setsockopt(v13, 0xFFFF, 512, &unk_10016C9E4, 4u))
  {
    uint64_t v24 = __error();
    if (strerror_r(*v24, (char *)__strerrbuf, 0x80uLL)) {
      LOBYTE(__strerrbuf[0]) = 0;
    }
    id v25 = sub_1000B9E04();
    int v26 = _NRLogIsLevelEnabled();

    if (!v26) {
      goto LABEL_115;
    }
    goto LABEL_66;
  }
  if (setsockopt(v13, 41, 125, &v85, 4u))
  {
    uint64_t v27 = __error();
    if (strerror_r(*v27, (char *)__strerrbuf, 0x80uLL)) {
      LOBYTE(__strerrbuf[0]) = 0;
    }
    id v28 = sub_1000B9E04();
    int v29 = _NRLogIsLevelEnabled();

    if (!v29) {
      goto LABEL_115;
    }
    goto LABEL_66;
  }
  if (setsockopt(v13, 41, 27, &unk_10016C9E4, 4u))
  {
    v31 = __error();
    if (strerror_r(*v31, (char *)__strerrbuf, 0x80uLL)) {
      LOBYTE(__strerrbuf[0]) = 0;
    }
    id v32 = sub_1000B9E04();
    int v33 = _NRLogIsLevelEnabled();

    if (!v33) {
      goto LABEL_115;
    }
    goto LABEL_66;
  }
  if (setsockopt(v13, 0xFFFF, 4130, &unk_10016C9E4, 4u))
  {
    v34 = __error();
    if (strerror_r(*v34, (char *)__strerrbuf, 0x80uLL)) {
      LOBYTE(__strerrbuf[0]) = 0;
    }
    id v35 = sub_1000B9E04();
    int v36 = _NRLogIsLevelEnabled();

    if (!v36) {
      goto LABEL_115;
    }
    goto LABEL_66;
  }
  if (setsockopt(v13, 41, 61, &unk_10016C9E4, 4u))
  {
    v37 = __error();
    if (strerror_r(*v37, (char *)__strerrbuf, 0x80uLL)) {
      LOBYTE(__strerrbuf[0]) = 0;
    }
    id v38 = sub_1000B9E04();
    int v39 = _NRLogIsLevelEnabled();

    if (!v39) {
      goto LABEL_115;
    }
LABEL_66:
    id v30 = sub_1000B9E04();
    _NRLogWithArgs();

    goto LABEL_115;
  }
  v81[0] = (sockaddr)xmmword_10016C9E8;
  *(_OWORD *)&v81[0].sa_data[10] = *(long long *)((char *)&xmmword_10016C9E8 + 12);
  if (bind(v13, v81, 0x1Cu))
  {
    v40 = __error();
    if (strerror_r(*v40, (char *)__strerrbuf, 0x80uLL)) {
      LOBYTE(__strerrbuf[0]) = 0;
    }
    id v41 = sub_1000B9E04();
    int v42 = _NRLogIsLevelEnabled();

    if (v42)
    {
      id v43 = sub_1000B9E04();
      _NRLogWithArgs();
    }
    goto LABEL_115;
  }
  v44 = [v6 queue];
  dispatch_source_t v45 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v13, 0, v44);
  socketReadSource = v8->_socketReadSource;
  v8->_socketReadSource = (OS_dispatch_source *)v45;

  if (!v8->_socketReadSource)
  {
    id v61 = sub_1000B9E04();
    int v62 = _NRLogIsLevelEnabled();

    if (v62)
    {
      id v63 = sub_1000B9E04();
      _NRLogWithArgs();
    }
    goto LABEL_115;
  }
  v8->_fd = v13;
  objc_initWeak(__strerrbuf, v8);
  v47 = v8->_socketReadSource;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000BBB80;
  handler[3] = &unk_1001C7FF0;
  objc_copyWeak(&v80, __strerrbuf);
  dispatch_source_set_event_handler(v47, handler);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BBBC0;
  block[3] = &unk_1001C7FF0;
  objc_copyWeak(&v78, __strerrbuf);
  dispatch_async(v44, block);
  dispatch_activate((dispatch_object_t)v8->_socketReadSource);
  id v48 = sub_1000B9E04();
  char v49 = _NRLogIsLevelEnabled();

  if (v49)
  {
    id v50 = sub_1000B9E04();
    _NRLogWithArgs();
  }
  uint64_t v51 = nw_interface_create_with_index();
  nwIf = v8->_nwIf;
  v8->_nwIf = (OS_nw_interface *)v51;

  if (!v8->_nwIf)
  {
    id v64 = sub_1000B9E04();
    int v65 = _NRLogIsLevelEnabled();

    if (!v65)
    {
      int v60 = 6;
      goto LABEL_114;
    }
    id v54 = sub_1000B9E04();
    _NRLogWithArgs();
    goto LABEL_112;
  }
  v53 = nw_parameters_create();
  id v54 = v53;
  if (!v53)
  {
    id v66 = sub_1000B9E04();
    char v67 = _NRLogIsLevelEnabled();

    if (v67)
    {
      id v68 = sub_1000B9E04();
      _NRLogWithArgs();
    }
    id v54 = 0;
    goto LABEL_112;
  }
  nw_parameters_require_interface(v53, (nw_interface_t)v8->_nwIf);
  uint64_t evaluator_for_endpoint = nw_path_create_evaluator_for_endpoint();
  pathEvaluator = v8->_pathEvaluator;
  v8->_pathEvaluator = (OS_nw_path_evaluator *)evaluator_for_endpoint;

  if (!v8->_pathEvaluator)
  {
    id v69 = sub_1000B9E04();
    int v70 = _NRLogIsLevelEnabled();

    if (v70) {
      goto LABEL_111;
    }
    goto LABEL_112;
  }
  v57 = (void *)nw_path_evaluator_copy_path();
  unsigned __int8 v58 = [(NRBabelInterfaceSocket *)v8 handlePathUpdate:v57];

  if ((v58 & 1) == 0)
  {
    id v71 = sub_1000B9E04();
    int v72 = _NRLogIsLevelEnabled();

    if (v72)
    {
LABEL_111:
      id v73 = sub_1000B9E04();
      _NRLogWithArgs();
    }
LABEL_112:
    int v60 = 6;
    goto LABEL_113;
  }
  objc_copyWeak(&v76, __strerrbuf);
  nw_path_evaluator_set_update_handler();
  v59 = v8;
  objc_destroyWeak(&v76);
  int v60 = 1;
LABEL_113:

LABEL_114:
  objc_destroyWeak(&v78);
  objc_destroyWeak(&v80);
  objc_destroyWeak(__strerrbuf);

  v74 = v8;
  if (v60 == 6) {
    goto LABEL_115;
  }
LABEL_117:

  return v74;
}

- (BOOL)setupLocalAddress
{
  return [(NRBabelInterfaceSocket *)self setupLocalAddressCheckAgainst:0];
}

- (BOOL)setupLocalAddressCheckAgainst:(const in6_addr *)a3
{
  int v29 = 0;
  if (getifaddrs(&v29))
  {
    v5 = __error();
    if (strerror_r(*v5, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      _NRLogWithArgs();
    }
LABEL_38:
    LOBYTE(v19) = 0;
    return v19;
  }
  id v6 = v29;
  if (!v29)
  {
    v18 = 0;
LABEL_37:
    freeifaddrs(v18);
    goto LABEL_38;
  }
  v7 = (void *)&unk_1001F4000;
  id v8 = (id *)&unk_1001F4000;
  while (1)
  {
    ifa_addr = v6->ifa_addr;
    if (ifa_addr->sa_family != 30) {
      goto LABEL_13;
    }
    id v10 = self;
    if (v7[331] != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (v7[331] != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      id v11 = v8[330];
      BOOL v12 = v8;
      IPv6AddrString = (void *)createIPv6AddrString();
      int v14 = (void *)createIPv6AddrString();
      [(NRBabelInterface *)v10 localAddress];
      uint64_t v27 = v14;
      id v28 = (void *)createIPv6AddrString();
      id v25 = v10;
      int v26 = IPv6AddrString;
      uint64_t v24 = 990;
      id v22 = "";
      int v23 = "-[NRBabelInterfaceSocket setupLocalAddressCheckAgainst:]";
      _NRLogWithArgs();

      id v8 = v12;
      v7 = &unk_1001F4000;
    }
    v15 = [(NRBabelInterfaceSocket *)v10 ifName];
    unsigned __int8 v16 = [v15 hasPrefix:@"ipsec"];

    if ((v16 & 1) == 0) {
      break;
    }
    if (ifa_addr->sa_data[6] == 253 && ifa_addr->sa_data[7] == 116) {
      goto LABEL_28;
    }
LABEL_12:

LABEL_13:
    id v6 = v6->ifa_next;
    if (!v6)
    {
      v18 = v29;
      goto LABEL_37;
    }
  }
  if (*(_DWORD *)&ifa_addr[1].sa_data[6] != v10->_ifIndex
    || ifa_addr->sa_data[6] != 254
    || (ifa_addr->sa_data[7] & 0xC0) != 0x80)
  {
    goto LABEL_12;
  }
LABEL_28:
  if (a3)
  {
    if (*(void *)a3->__u6_addr8 != *(void *)&ifa_addr->sa_data[6]
      || *(void *)&a3->__u6_addr32[2] != *(void *)&ifa_addr[1].sa_len)
    {
      goto LABEL_12;
    }
  }
  if (![(NRBabelInterface *)v10 isLocalAddressEqualTo:&ifa_addr->sa_data[6]])
  {
    if (v7[331] != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (v7[331] != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      id v20 = v8[330];
      [(NRBabelInterface *)v10 localAddress];
      int v26 = (void *)createIPv6AddrString();
      uint64_t v27 = (void *)createIPv6AddrString();
      uint64_t v24 = 1010;
      id v25 = v10;
      id v22 = "";
      int v23 = "-[NRBabelInterfaceSocket setupLocalAddressCheckAgainst:]";
      _NRLogWithArgs();
    }
  }
  -[NRBabelInterface setLocalAddress:](v10, "setLocalAddress:", &ifa_addr->sa_data[6], v22, v23, v24, v25, v26, v27);

  freeifaddrs(v29);
  if (!a3 || (unsigned int v19 = [(NRBabelInterface *)v10 isLocalAddressEqualTo:a3]) != 0) {
    LOBYTE(v19) = 1;
  }
  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int ifIndex = self->_ifIndex;
    BOOL v6 = ifIndex == [v4 ifIndex];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  ifName = self->_ifName;
  unsigned int v5 = [(NRBabelInterface *)self dtlsEnabled];
  BOOL v6 = "";
  if (v5) {
    BOOL v6 = "_DTLS";
  }
  id v7 = [v3 initWithFormat:@"%@%s", ifName, v6];

  return v7;
}

- (void)readPackets
{
  v2 = self;
  id v3 = [(NRBabelInterface *)self instance];
  if (!v3) {
    goto LABEL_102;
  }
  int fd = v2->_fd;
  unint64_t v44 = (unint64_t)v57 | 0xC;
  memset(v57, 0, sizeof(v57));
  memset(v52, 0, sizeof(v52));
  int v53 = 0;
  v51[0] = v56;
  v51[1] = 2000;
  dispatch_source_t v45 = (unsigned int *)v2;
LABEL_3:
  while (1)
  {
    *(&v50.msg_namelen + 1) = 0;
    *(&v50.msg_iovlen + 1) = 0;
    v50.msg_name = v52;
    v50.msg_namelen = 28;
    v50.msg_iov = (iovec *)v51;
    v50.msg_iovlen = 1;
    v50.uint64_t msg_control = v57;
    *(void *)&v50.msg_controllen = 32;
    ssize_t v5 = recvmsg(fd, &v50, 0);
    if (v5 < 0) {
      break;
    }
    if (v50.msg_namelen >= 0x1C && (msg_name = (unsigned __int8 *)v50.msg_name) != 0)
    {
      if (*((unsigned char *)v50.msg_name + 1) == 30)
      {
        if (*(unsigned __int8 *)v50.msg_name <= 0x1Bu)
        {
          if (qword_1001F4A58 != -1) {
            dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
          }
          if (_NRLogIsLevelEnabled())
          {
            if (qword_1001F4A58 != -1) {
              dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
            }
            uint64_t IPv6AddrString = *msg_name;
            uint64_t msg_control = 28;
            uint64_t v38 = 880;
            int v36 = "";
            v37 = "-[NRBabelInterfaceSocket readPackets]";
            _NRLogWithArgs();
          }
          continue;
        }
        ssize_t v7 = v5;
        id v8 = (char *)v50.msg_name + 8;
        if (*((unsigned __int8 *)v50.msg_name + 8) == 254 && (*((unsigned char *)v50.msg_name + 9) & 0xC0) == 0x80
          || ([(NRBabelInterfaceSocket *)v2 ifName],
              BOOL v9 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v10 = [v9 hasPrefix:@"ipsec"],
              v9,
              v2 = (NRBabelInterfaceSocket *)v45,
              (v10 & 1) != 0))
        {
          if (*((_WORD *)msg_name + 1) == 10266)
          {
            if (v50.msg_controllen - 33 >= 0xFFFFFFF3 && v50.msg_control == v57)
            {
              if (DWORD2(v57[0]) == 46)
              {
                if (HIDWORD(v57[1]) == v2->_ifIndex)
                {
                  if ([(NRBabelInterface *)v2 isLocalAddressEqualTo:v44]) {
                    goto LABEL_44;
                  }
                  if (*(void *)((char *)v57 + 12) == 767 && *(void *)((char *)&v57[1] + 4) == 0x600010000000000) {
                    goto LABEL_44;
                  }
                  if (qword_1001F4A58 != -1) {
                    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
                  }
                  id v12 = (id)qword_1001F4A50;
                  int IsLevelEnabled = _NRLogIsLevelEnabled();

                  if (IsLevelEnabled)
                  {
                    id v14 = sub_1000B9E04();
                    uint64_t v38 = 942;
                    uint64_t IPv6AddrString = createIPv6AddrString();
                    int v36 = "";
                    v37 = "-[NRBabelInterfaceSocket readPackets]";
                    _NRLogWithArgs();
                  }
                  v2 = (NRBabelInterfaceSocket *)v45;
                  if (objc_msgSend(v45, "setupLocalAddressCheckAgainst:", v44, v36, v37))
                  {
LABEL_44:
                    [v3 handlePacket:v56 length:v7 remoteAddr:msg_name + 8 localAddr:v44 babelInterface:v2 dtls:0];
                  }
                  else
                  {
                    id v32 = sub_1000B9E04();
                    int v33 = _NRLogIsLevelEnabled();

                    v2 = (NRBabelInterfaceSocket *)v45;
                    if (v33)
                    {
                      id v34 = sub_1000B9E04();
                      uint64_t v38 = 945;
                      uint64_t IPv6AddrString = createIPv6AddrString();
                      int v36 = "";
                      v37 = "-[NRBabelInterfaceSocket readPackets]";
                      _NRLogWithArgs();

                      v2 = (NRBabelInterfaceSocket *)v45;
                    }
                  }
                  continue;
                }
                id v43 = v3;
                long long v48 = 0u;
                long long v49 = 0u;
                long long v46 = 0u;
                long long v47 = 0u;
                unsigned __int8 v16 = [v3 interfaces];
                id v17 = [v16 countByEnumeratingWithState:&v46 objects:v54 count:16];
                if (!v17)
                {
LABEL_85:

                  if (qword_1001F4A58 != -1) {
                    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
                  }
                  v2 = (NRBabelInterfaceSocket *)v45;
                  id v3 = v43;
                  if (_NRLogIsLevelEnabled())
                  {
                    if (qword_1001F4A58 != -1) {
                      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
                    }
                    id v29 = (id)qword_1001F4A50;
                    id v30 = (void *)createIPv6AddrString();
                    v31 = (void *)createIPv6AddrString();
                    id v41 = (_OWORD *)HIDWORD(v57[1]);
                    uint64_t v42 = v45[12];
                    uint64_t IPv6AddrString = (uint64_t)v30;
                    uint64_t msg_control = (uint64_t)v31;
                    uint64_t v38 = 934;
                    int v36 = "";
                    v37 = "-[NRBabelInterfaceSocket readPackets]";
                    _NRLogWithArgs();

                    v2 = (NRBabelInterfaceSocket *)v45;
                  }
                  continue;
                }
                id v18 = v17;
                uint64_t v19 = *(void *)v47;
LABEL_72:
                uint64_t v20 = 0;
                while (1)
                {
                  if (*(void *)v47 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  v21 = *(void **)(*((void *)&v46 + 1) + 8 * v20);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v22 = v21;
                    unsigned int v23 = [v22 ifIndex];
                    if (v23 == HIDWORD(v57[1]))
                    {
                      id v3 = v43;
                      [v43 handlePacket:v56 length:v7 remoteAddr:v8 localAddr:v44 babelInterface:v22 dtls:0];

                      if (qword_1001F4A58 != -1) {
                        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
                      }
                      id v24 = (id)qword_1001F4A50;
                      char v25 = _NRLogIsLevelEnabled();

                      v2 = (NRBabelInterfaceSocket *)v45;
                      if (v25)
                      {
                        if (qword_1001F4A58 != -1) {
                          dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
                        }
                        id v26 = (id)qword_1001F4A50;
                        uint64_t v27 = (void *)createIPv6AddrString();
                        id v28 = (void *)createIPv6AddrString();
                        id v41 = (_OWORD *)HIDWORD(v57[1]);
                        uint64_t v42 = v45[12];
                        uint64_t IPv6AddrString = (uint64_t)v27;
                        uint64_t msg_control = (uint64_t)v28;
                        uint64_t v38 = 930;
                        int v36 = "";
                        v37 = "-[NRBabelInterfaceSocket readPackets]";
                        _NRLogWithArgs();

                        v2 = (NRBabelInterfaceSocket *)v45;
                      }
                      goto LABEL_3;
                    }
                  }
                  if (v18 == (id)++v20)
                  {
                    id v18 = [v16 countByEnumeratingWithState:&v46 objects:v54 count:16];
                    if (!v18) {
                      goto LABEL_85;
                    }
                    goto LABEL_72;
                  }
                }
              }
              if (qword_1001F4A58 != -1) {
                dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
              }
              if (_NRLogIsLevelEnabled())
              {
                if (qword_1001F4A58 != -1) {
                  dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
                }
                uint64_t IPv6AddrString = DWORD2(v57[0]);
                uint64_t v38 = 903;
                int v36 = "";
                v37 = "-[NRBabelInterfaceSocket readPackets]";
                _NRLogWithArgs();
              }
            }
            else
            {
              if (qword_1001F4A58 != -1) {
                dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
              }
              if (_NRLogIsLevelEnabled())
              {
                if (qword_1001F4A58 != -1) {
                  dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
                }
                uint64_t msg_control = (uint64_t)v50.msg_control;
                id v41 = v57;
                uint64_t v38 = 898;
                uint64_t IPv6AddrString = v50.msg_controllen;
                int v36 = "";
                v37 = "-[NRBabelInterfaceSocket readPackets]";
                _NRLogWithArgs();
              }
            }
          }
          else
          {
            if (qword_1001F4A58 != -1) {
              dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
            }
            if (_NRLogIsLevelEnabled())
            {
              if (qword_1001F4A58 != -1) {
                dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
              }
              int v36 = "";
              v37 = "-[NRBabelInterfaceSocket readPackets]";
              uint64_t v38 = 892;
              uint64_t IPv6AddrString = bswap32(*((unsigned __int16 *)msg_name + 1)) >> 16;
              _NRLogWithArgs();
            }
          }
        }
        else
        {
          if (qword_1001F4A58 != -1) {
            dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
          }
          if (_NRLogIsLevelEnabled())
          {
            if (qword_1001F4A58 != -1) {
              dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
            }
            id v15 = (id)qword_1001F4A50;
            uint64_t v38 = 887;
            uint64_t IPv6AddrString = createIPv6AddrString();
            int v36 = "";
            v37 = "-[NRBabelInterfaceSocket readPackets]";
            _NRLogWithArgs();

            v2 = (NRBabelInterfaceSocket *)v45;
          }
        }
      }
      else
      {
        if (qword_1001F4A58 != -1) {
          dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
        }
        if (_NRLogIsLevelEnabled())
        {
          if (qword_1001F4A58 != -1) {
            dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
          }
          uint64_t IPv6AddrString = msg_name[1];
          uint64_t v38 = 876;
          int v36 = "";
          v37 = "-[NRBabelInterfaceSocket readPackets]";
          _NRLogWithArgs();
        }
      }
    }
    else
    {
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4A58 != -1) {
          dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
        }
        uint64_t IPv6AddrString = v50.msg_namelen;
        uint64_t msg_control = (uint64_t)v50.msg_name;
        uint64_t v38 = 870;
        int v36 = "";
        v37 = "-[NRBabelInterfaceSocket readPackets]";
        _NRLogWithArgs();
      }
    }
  }
  id v35 = __error();
  if (*v35 != 35)
  {
    if (strerror_r(*v35, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      _NRLogWithArgs();
    }
  }
LABEL_102:
}

- (void)dealloc
{
  socketReadSource = self->_socketReadSource;
  if (socketReadSource) {
    dispatch_source_cancel(socketReadSource);
  }
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0) {
    close(fd);
  }
  if (self->_pathEvaluator) {
    nw_path_evaluator_cancel();
  }
  v5.receiver = self;
  v5.super_class = (Class)NRBabelInterfaceSocket;
  [(NRBabelInterface *)&v5 dealloc];
}

- (void)sendPacket:(iovec *)a3 iovLen:(unsigned int)a4 toAddr:(const in6_addr *)a5
{
  if ([(NRBabelInterface *)self viable])
  {
    int fd = self->_fd;
    uint64_t v33 = 672800284;
    unsigned int ifIndex = self->_ifIndex;
    in6_addr v34 = *a5;
    v32.msg_name = &v33;
    *(&v32.msg_namelen + 1) = 0;
    v32.msg_namelen = 28;
    v32.msg_iov = a3;
    memset(&v32.msg_iovlen + 1, 0, 20);
    v32.msg_iovlen = a4;
    ssize_t v10 = sendmsg(fd, &v32, 0);
    if (v10 < 0)
    {
      unsigned int v13 = __error();
      if (strerror_r(*v13, __strerrbuf, 0x80uLL)) {
        __strerrbuf[0] = 0;
      }
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4A58 != -1) {
          dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
        }
        _NRLogWithArgs();
      }
    }
    else
    {
      if (a4)
      {
        uint64_t v11 = a4;
        if (a4 > 8)
        {
          uint64_t v14 = a4 & 7;
          if (!v14) {
            uint64_t v14 = 8;
          }
          uint64_t v12 = a4 - v14;
          p_iov_len = (const double *)&a3[4].iov_len;
          int32x4_t v16 = 0uLL;
          uint64_t v17 = v12;
          int32x4_t v18 = 0uLL;
          do
          {
            uint64_t v19 = p_iov_len - 8;
            unsigned long long v20 = (unsigned __int128)vld2q_f64(v19);
            v21 = p_iov_len - 4;
            unsigned long long v22 = (unsigned __int128)vld2q_f64(v21);
            unsigned int v23 = p_iov_len + 16;
            unsigned long long v25 = (unsigned __int128)vld2q_f64(p_iov_len);
            id v24 = p_iov_len + 4;
            unsigned long long v26 = (unsigned __int128)vld2q_f64(v24);
            int32x4_t v16 = vaddq_s32(v16, vuzp1q_s32((int32x4_t)v20, (int32x4_t)v22));
            int32x4_t v18 = vaddq_s32(v18, vuzp1q_s32((int32x4_t)v25, (int32x4_t)v26));
            p_iov_len = v23;
            v17 -= 8;
          }
          while (v17);
          a4 = vaddvq_s32(vaddq_s32(v18, v16));
        }
        else
        {
          uint64_t v12 = 0;
          a4 = 0;
        }
        uint64_t v27 = v11 - v12;
        id v28 = &a3[v12].iov_len;
        do
        {
          int v29 = *(_DWORD *)v28;
          v28 += 2;
          a4 += v29;
          --v27;
        }
        while (v27);
      }
      if (a4 != v10)
      {
        if (qword_1001F4A58 != -1) {
          dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
        }
        if (_NRLogIsLevelEnabled())
        {
          if (qword_1001F4A58 != -1) {
            dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
          }
          id v30 = (id)qword_1001F4A50;
          uint64_t IPv6AddrString = (void *)createIPv6AddrString();
          _NRLogWithArgs();
        }
      }
    }
  }
}

@end