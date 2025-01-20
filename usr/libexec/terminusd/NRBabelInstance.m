@interface NRBabelInstance
- (BOOL)handleUpdateFromAddr:(const in6_addr *)a3 ForPrefix:(const in6_addr *)a4 plen:(unsigned __int8)a5 nextHop:(const in6_addr *)a6 babelInterface:(id)a7 routerID:(unint64_t)a8 seqno:(unsigned __int16)a9 interval:(unsigned __int16)a10 metric:(unsigned __int16)a11 ae:(unsigned __int8)a12;
- (BOOL)isNewDistanceUnfeasibleForPrefix:(id)a3 routerID:(unint64_t)a4 seqno:(unsigned __int16)a5 metric:(unsigned __int16)a6;
- (BOOL)purgeAllRoutesFromNeighbor:(id)a3;
- (BOOL)purgeInterface:(id)a3;
- (NEVirtualInterface_s)nevi;
- (NRBabelInstance)init;
- (NSMutableArray)interfaces;
- (NSMutableArray)neighbors;
- (NSMutableArray)posrs;
- (NSMutableArray)routes;
- (NSMutableArray)sources;
- (NSString)addrStr;
- (OS_dispatch_queue)queue;
- (OS_nw_path_evaluator)ifBringupPathEvaluator;
- (id)copyNeighborWithAddr:(const in6_addr *)a3 babelInterface:(id)a4 isNewNeighbor:(BOOL *)a5;
- (id)copyPendingOutgoingSeqnoReqWithPrefix:(id)a3 routerID:(unint64_t)a4 isNewPOSR:(BOOL *)a5;
- (id)copyRouteString;
- (id)copyRouteWithPrefix:(id)a3 neighbor:(id)a4;
- (id)copySourceWithPrefix:(id)a3 routerID:(unint64_t)a4;
- (id)createSelectedRoutesArrayForPrefix:(id)a3;
- (id)createUpdateTLVs;
- (id)createUpdateTLVsForPrefix:(id)a3;
- (id)createUpdateTLVsForPrefix:(id)a3 interval:(unsigned __int16)a4;
- (id)createUpdateTLVsForRoutes:(id)a3;
- (id)createUpdateTLVsForRoutes:(id)a3 interval:(unsigned __int16)a4;
- (id)createUpdateTLVsWithInterval:(unsigned __int16)a3;
- (id)description;
- (unint64_t)routerID;
- (unsigned)nodeSeqno;
- (void)addRouterID:(unint64_t)a3 toTLVs:(id)a4;
- (void)addUpdateForRoute:(id)a3 interval:(unsigned __int16)a4 toTLVs:(id)a5;
- (void)dealloc;
- (void)handleAckReqFromAddr:(const in6_addr *)a3 babelInterface:(id)a4 nonce:(unsigned __int16)a5 interval:(unsigned __int16)a6;
- (void)handleHelloFromAddr:(const in6_addr *)a3 babelInterface:(id)a4 seqno:(unsigned __int16)a5 interval:(unsigned __int16)a6 personal:(BOOL)a7;
- (void)handleIHUFromAddr:(const in6_addr *)a3 babelInterface:(id)a4 rxcost:(unsigned __int16)a5 interval:(unsigned __int16)a6;
- (void)handleIfBringupPathUpdate:(id)a3;
- (void)handlePacket:(const char *)a3 length:(unsigned int)a4 remoteAddr:(const in6_addr *)a5 localAddr:(const in6_addr *)a6 babelInterface:(id)a7 dtls:(BOOL)a8;
- (void)handleRouteReqFromAddr:(const in6_addr *)a3 babelInterface:(id)a4 ForPrefix:(const in6_addr *)a5 plen:(unsigned __int8)a6;
- (void)handleSeqnoReqFromAddr:(const in6_addr *)a3 babelInterface:(id)a4 ForPrefix:(const in6_addr *)a5 plen:(unsigned __int8)a6 routerID:(unint64_t)a7 seqno:(unsigned __int16)a8 hopCount:(unsigned __int8)a9;
- (void)sendImmediateRouteUpdateToAllNeighbors;
- (void)sendImmediateRouteUpdateToNeighbor:(id)a3;
- (void)sendSeqnoReqIfNecessaryTo:(id)a3 forPrefix:(id)a4 routerID:(unint64_t)a5 seqno:(unsigned __int16)a6 hopCount:(unsigned __int8)a7 originator:(id)a8;
- (void)setAddrStr:(id)a3;
- (void)setIfBringupPathEvaluator:(id)a3;
- (void)setInterfaces:(id)a3;
- (void)setNeighbors:(id)a3;
- (void)setNevi:(NEVirtualInterface_s *)a3;
- (void)setNodeSeqno:(unsigned __int16)a3;
- (void)setPosrs:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRouterID:(unint64_t)a3;
- (void)setRoutes:(id)a3;
- (void)setSources:(id)a3;
- (void)setupAddress:(in6_addr *)a3;
- (void)setupInterfaces;
- (void)updateFeasabilityDistanceForRoute:(id)a3;
- (void)updateRoutes;
@end

@implementation NRBabelInstance

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addrStr, 0);
  objc_storeStrong((id *)&self->_ifBringupPathEvaluator, 0);
  objc_storeStrong((id *)&self->_posrs, 0);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_neighbors, 0);
  objc_storeStrong((id *)&self->_interfaces, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setAddrStr:(id)a3
{
}

- (NSString)addrStr
{
  return self->_addrStr;
}

- (void)setNevi:(NEVirtualInterface_s *)a3
{
  self->_nevi = a3;
}

- (NEVirtualInterface_s)nevi
{
  return self->_nevi;
}

- (void)setIfBringupPathEvaluator:(id)a3
{
}

- (OS_nw_path_evaluator)ifBringupPathEvaluator
{
  return self->_ifBringupPathEvaluator;
}

- (void)setPosrs:(id)a3
{
}

- (NSMutableArray)posrs
{
  return self->_posrs;
}

- (void)setRoutes:(id)a3
{
}

- (NSMutableArray)routes
{
  return self->_routes;
}

- (void)setSources:(id)a3
{
}

- (NSMutableArray)sources
{
  return self->_sources;
}

- (void)setNeighbors:(id)a3
{
}

- (NSMutableArray)neighbors
{
  return self->_neighbors;
}

- (void)setInterfaces:(id)a3
{
}

- (NSMutableArray)interfaces
{
  return self->_interfaces;
}

- (void)setRouterID:(unint64_t)a3
{
  self->_routerID = a3;
}

- (unint64_t)routerID
{
  return self->_routerID;
}

- (void)setNodeSeqno:(unsigned __int16)a3
{
  self->_nodeSeqno = a3;
}

- (unsigned)nodeSeqno
{
  return self->_nodeSeqno;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)copyRouteString
{
  [(NRBabelInstance *)self setupInterfaces];
  [(NRBabelInstance *)self updateRoutes];
  id v3 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@\nInterfaces\n", self];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v4 = [(NRBabelInstance *)self interfaces];
  id v5 = [v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v29;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"\t%@\n", *(void *)(*((void *)&v28 + 1) + 8 * (void)v8)];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v6);
  }

  [v3 appendFormat:@"Neighbors\n"];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v9 = [(NRBabelInstance *)self neighbors];
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        [v3 appendFormat:@"\t%@\n", *(void *)(*((void *)&v24 + 1) + 8 * (void)v13)];
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v11);
  }

  [v3 appendFormat:@"Routes\n"];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v14 = [(NRBabelInstance *)self routes];
  id v15 = [v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        [v3 appendFormat:@"\t%@\n", *(void *)(*((void *)&v20 + 1) + 8 * (void)v18)];
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v16);
  }

  return v3;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  unint64_t routerID = self->_routerID;
  unint64_t v5 = bswap64(routerID);
  if (v5 > 0xFFFE)
  {
    id v7 = objc_alloc((Class)NSString);
    unsigned int v8 = bswap32(routerID);
    id v6 = [v7 initWithFormat:@"<%x:%x:%x:%x>", HIWORD(v8), (unsigned __int16)v8, bswap32(HIDWORD(routerID)) >> 16, __rev16(HIWORD(routerID))];
  }
  else
  {
    id v6 = [objc_alloc((Class)NSString) initWithFormat:@"<%llx>", v5, v12, v13, v14];
  }
  v9 = v6;
  id v10 = [v3 initWithFormat:@"NRBabelInstance %@", v6];

  return v10;
}

- (void)handlePacket:(const char *)a3 length:(unsigned int)a4 remoteAddr:(const in6_addr *)a5 localAddr:(const in6_addr *)a6 babelInterface:(id)a7 dtls:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v11 = *(void *)&a4;
  id v14 = a7;
  id v15 = v14;
  if (v11 <= 3)
  {
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    if (!_NRLogIsLevelEnabled()) {
      goto LABEL_209;
    }
    if (qword_1001F4A58 == -1) {
      goto LABEL_6;
    }
LABEL_210:
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    goto LABEL_6;
  }
  int v16 = !v8;
  unsigned int v17 = [v14 dtlsEnabled] & !v8;
  unsigned int v18 = *((unsigned __int16 *)a3 + 1);
  uint64_t v19 = __rev16(v18);
  if ((int)v19 + 2 > v11)
  {
    if ((v17 & 1) == 0)
    {
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      if (!_NRLogIsLevelEnabled()) {
        goto LABEL_209;
      }
      if (qword_1001F4A58 != -1) {
        goto LABEL_210;
      }
LABEL_6:
      _NRLogWithArgs();
      goto LABEL_209;
    }
    goto LABEL_147;
  }
  if (*a3 != 42)
  {
    if ((v17 & 1) == 0)
    {
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      if (!_NRLogIsLevelEnabled()) {
        goto LABEL_209;
      }
      if (qword_1001F4A58 != -1) {
        goto LABEL_210;
      }
      goto LABEL_6;
    }
LABEL_147:
    id v96 = [(NRBabelInstance *)self copyNeighborWithAddr:a5 babelInterface:v15 isNewNeighbor:0];
    id v97 = [objc_alloc((Class)NSData) initWithBytes:a3 length:v11];
    uint64_t v98 = [v96 dtlsStack];
    id v99 = v97;
    if (v98)
    {
      *(unsigned char *)(v98 + 11) = 1;
      if (qword_1001F4D10 != -1) {
        dispatch_once(&qword_1001F4D10, &stru_1001C8638);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4D10 != -1) {
          dispatch_once(&qword_1001F4D10, &stru_1001C8638);
        }
        id v100 = (id)qword_1001F4D08;
        [v99 length];
        _NRLogWithArgs();
      }
      v101 = *(id *)(v98 + 40);
      v102 = [v99 _createDispatchData];
      completion = _NSConcreteStackBlock;
      uint64_t v145 = 3221225472;
      v146 = sub_100132764;
      v147 = &unk_1001C84D8;
      uint64_t v148 = v98;
      nw_connection_send(v101, v102, _nw_content_context_default_message, 0, &completion);
    }
    goto LABEL_209;
  }
  if (a3[1] != 2)
  {
    if ((v17 & 1) == 0)
    {
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      if (_NRLogIsLevelEnabled())
      {
        id v103 = sub_1000B9E04();
        _NRLogWithArgs();
      }
      goto LABEL_209;
    }
    goto LABEL_147;
  }
  v136 = self;
  unsigned int v133 = [v15 dtlsEnabled];
  id v20 = objc_alloc((Class)NSMutableString);
  IPv6AddrString = (void *)createIPv6AddrString();
  v132 = a6;
  long long v22 = (void *)createIPv6AddrString();
  id v137 = [v20 initWithFormat:@"[%@] %@ > %@ Babel len(%u,%u)", v15, IPv6AddrString, v22, v19, v11];

  completion = 0;
  uint64_t v145 = 0;
  in6_addr v143 = *a5;
  v142[0] = 0;
  v142[1] = 0;
  v141[0] = 0;
  v141[1] = 0;
  if (!v18)
  {
    char v135 = 0;
    long long v26 = v136;
    goto LABEL_200;
  }
  char v135 = 0;
  uint64_t v23 = 0;
  unsigned int v24 = v19 + 4;
  unsigned int v25 = 4;
  long long v26 = v136;
  unsigned int v134 = v19 + 4;
  while (1)
  {
    long long v27 = &a3[v25];
    uint64_t v28 = *(unsigned __int8 *)v27;
    if (*v27) {
      break;
    }
    [v137 appendString:@"Pad1, "];
    ++v25;
LABEL_19:
    if (v25 >= v24) {
      goto LABEL_200;
    }
  }
  uint64_t v29 = v25 + 1;
  if (v29 >= v24)
  {
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    if (!_NRLogIsLevelEnabled()) {
      goto LABEL_200;
    }
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    id v104 = (id)qword_1001F4A50;
    if (v28 >= 0x10) {
      v105 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"Unknown[%u]", v28];
    }
    else {
      v105 = off_1001C71E0[(v28 - 1)];
    }
LABEL_178:
    _NRLogWithArgs();
    goto LABEL_179;
  }
  uint64_t v138 = v23;
  unint64_t v30 = a3[v29];
  char v31 = v28 - 1;
  if (v28 >= 0x10) {
    v32 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"Unknown[%u]", v28];
  }
  else {
    v32 = off_1001C71E0[v31];
  }
  [v137 appendFormat:@"%@-%u ", v32, v30, v126, v127, v128, v129, v130];

  v25 += v30 + 2;
  unsigned int v24 = v134;
  if (v25 <= v134)
  {
    if ((v28 - 9) > 1 || (v135 & 1) == 0)
    {
      uint64_t v23 = v138;
      if (v28 == 1) {
        goto LABEL_76;
      }
    }
    else
    {
      [(NRBabelInstance *)v136 updateRoutes];
      char v135 = 0;
      uint64_t v23 = v138;
    }
    unsigned int v33 = v133;
    if ((v28 - 6) >= 0xFEu) {
      unsigned int v33 = 0;
    }
    if ((v33 & v16) == 1)
    {
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      if (!_NRLogIsLevelEnabled())
      {
LABEL_76:
        long long v26 = v136;
        goto LABEL_19;
      }
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      id v34 = (id)qword_1001F4A50;
      if (v28 - 2) < 0xE && ((0x3FF3u >> (v28 - 2))) {
        v35 = off_1001C7258[(v28 - 2)];
      }
      else {
        v35 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"Unknown[%u]", v28];
      }
      uint64_t v128 = (uint64_t)v35;
      v129 = (void *)v30;
      long long v26 = v136;
      uint64_t v126 = 3657;
      v127 = v136;
      _NRLogWithArgs();

      goto LABEL_48;
    }
    switch((int)v28)
    {
      case 2:
        if (v30 > 5)
        {
          if (sub_1000C46F8((unsigned char *)v27 + 8, (int)v30 - 6)) {
            goto LABEL_76;
          }
          id v36 = sub_1000B9E04();
          int IsLevelEnabled = _NRLogIsLevelEnabled();

          long long v26 = v136;
          if (IsLevelEnabled)
          {
            id v38 = sub_1000B9E04();
            uint64_t v126 = 3661;
            v127 = v136;
            v124 = "";
            v125 = "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]";
            uint64_t v128 = bswap32(*((unsigned __int16 *)v27 + 2)) >> 16;
            _NRLogWithArgs();
          }
          -[NRBabelInstance handleAckReqFromAddr:babelInterface:nonce:interval:](v136, "handleAckReqFromAddr:babelInterface:nonce:interval:", a5, v15, bswap32(*((unsigned __int16 *)v27 + 2)) >> 16, bswap32(*((unsigned __int16 *)v27 + 3)) >> 16, v124, v125);
          goto LABEL_48;
        }
        id v106 = sub_1000B9E04();
        int v107 = _NRLogIsLevelEnabled();

        if (!v107) {
          goto LABEL_199;
        }
        id v104 = sub_1000B9E04();
        v105 = @"AckReq";
        break;
      case 3:
        if (v30 > 1)
        {
          if (sub_1000C46F8((unsigned char *)v27 + 4, (int)v30 - 2)) {
            goto LABEL_76;
          }
          id v39 = sub_1000B9E04();
          int v40 = _NRLogIsLevelEnabled();

          long long v26 = v136;
          if (!v40) {
            goto LABEL_48;
          }
          id v41 = sub_1000B9E04();
          uint64_t v126 = 3668;
          v127 = v136;
          uint64_t v128 = bswap32(*((unsigned __int16 *)v27 + 1)) >> 16;
          goto LABEL_130;
        }
        id v108 = sub_1000B9E04();
        int v109 = _NRLogIsLevelEnabled();

        if (!v109) {
          goto LABEL_199;
        }
        id v104 = sub_1000B9E04();
        v105 = @"Ack";
        break;
      case 4:
        if (v30 > 5)
        {
          if (sub_1000C46F8((unsigned char *)v27 + 8, (int)v30 - 6)) {
            goto LABEL_76;
          }
          unsigned int v42 = v27[2];
          long long v26 = v136;
          if (v42 & 0x80000000) == 0 || ([v15 isLocalAddressEqualTo:v132]) {
            goto LABEL_61;
          }
          id v43 = sub_1000B9E04();
          int v44 = _NRLogIsLevelEnabled();

          if (v44)
          {
            id v45 = sub_1000B9E04();
            v129 = (void *)createIPv6AddrString();
            v130 = (void *)createIPv6AddrString();
            v127 = v136;
            uint64_t v128 = (uint64_t)v15;
            uint64_t v126 = 3676;
            v124 = "";
            v125 = "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]";
            _NRLogWithArgs();

            long long v26 = v136;
          }
          unsigned int v24 = v134;
          uint64_t v23 = v138;
          if (objc_msgSend(v15, "setupLocalAddressCheckAgainst:", v132, v124, v125))
          {
LABEL_61:
            [(NRBabelInstance *)v26 handleHelloFromAddr:a5 babelInterface:v15 seqno:bswap32(*((unsigned __int16 *)v27 + 2)) >> 16 interval:bswap32(*((unsigned __int16 *)v27 + 3)) >> 16 personal:(v42 >> 7) & 1];
            goto LABEL_19;
          }
          id v94 = sub_1000B9E04();
          int v95 = _NRLogIsLevelEnabled();

          if (!v95) {
            goto LABEL_48;
          }
          id v92 = sub_1000B9E04();
          v93 = (void *)createIPv6AddrString();
          v129 = v93;
          v130 = (void *)createIPv6AddrString();
          v127 = v136;
          uint64_t v128 = (uint64_t)v15;
          uint64_t v126 = 3679;
          _NRLogWithArgs();

          long long v26 = v136;
          goto LABEL_139;
        }
        id v110 = sub_1000B9E04();
        int v111 = _NRLogIsLevelEnabled();

        if (!v111) {
          goto LABEL_199;
        }
        id v104 = sub_1000B9E04();
        v105 = @"Hello";
        break;
      case 5:
        if (v30 > 5)
        {
          int v46 = *((unsigned __int8 *)v27 + 2);
          if (v27[2])
          {
            in6_addr v140 = *v132;
            int v47 = sub_1000C49DC(&v140, v46, (void *)(v27 + 8), (int)v30 - 6, 0, 0, 0);
            if (v47 < 0)
            {
              id v78 = sub_1000B9E04();
              int v79 = _NRLogIsLevelEnabled();

              long long v26 = v136;
              unsigned int v24 = v134;
              if (v79)
              {
                id v80 = sub_1000B9E04();
                uint64_t v126 = 3707;
                v127 = v136;
                _NRLogWithArgs();
              }
            }
            else
            {
              int v48 = v47;
              if ([v15 isLocalAddressEqualTo:&v140]) {
                goto LABEL_124;
              }
              id v49 = sub_1000B9E04();
              int v50 = _NRLogIsLevelEnabled();

              long long v26 = v136;
              unsigned int v24 = v134;
              if (v50)
              {
                id v51 = sub_1000B9E04();
                v127 = v136;
                uint64_t v128 = createIPv6AddrString();
                uint64_t v126 = 3711;
                _NRLogWithArgs();

                unsigned int v24 = v134;
              }
            }
            goto LABEL_49;
          }
          if ([v15 isLocalAddressEqualTo:v132])
          {
            int v48 = 0;
LABEL_124:
            if (sub_1000C46F8(&v27[v48 + 8], (int)v30 - v48 - 6))
            {
              long long v26 = v136;
            }
            else
            {
              long long v26 = v136;
              [(NRBabelInstance *)v136 handleIHUFromAddr:a5 babelInterface:v15 rxcost:bswap32(*((unsigned __int16 *)v27 + 2)) >> 16 interval:bswap32(*((unsigned __int16 *)v27 + 3)) >> 16];
            }
            unsigned int v24 = v134;
            goto LABEL_19;
          }
          id v85 = sub_1000B9E04();
          int v86 = _NRLogIsLevelEnabled();

          if (v86)
          {
            id v87 = sub_1000B9E04();
            v129 = (void *)createIPv6AddrString();
            v130 = (void *)createIPv6AddrString();
            v127 = v136;
            uint64_t v128 = (uint64_t)v15;
            uint64_t v126 = 3694;
            v124 = "";
            v125 = "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]";
            _NRLogWithArgs();
          }
          if (objc_msgSend(v15, "setupLocalAddressCheckAgainst:", v132, v124, v125))
          {
            int v48 = 0;
            uint64_t v23 = v138;
            goto LABEL_124;
          }
          id v90 = sub_1000B9E04();
          int v91 = _NRLogIsLevelEnabled();

          if (v91)
          {
            id v92 = sub_1000B9E04();
            v93 = (void *)createIPv6AddrString();
            v129 = v93;
            v130 = (void *)createIPv6AddrString();
            v127 = v136;
            uint64_t v128 = (uint64_t)v15;
            uint64_t v126 = 3697;
            _NRLogWithArgs();

            long long v26 = v136;
LABEL_139:

            goto LABEL_48;
          }
LABEL_136:
          long long v26 = v136;
          goto LABEL_48;
        }
        id v112 = sub_1000B9E04();
        int v113 = _NRLogIsLevelEnabled();

        if (!v113) {
          goto LABEL_199;
        }
        id v104 = sub_1000B9E04();
        v105 = @"IHU";
        break;
      case 6:
        if (v30 > 9)
        {
          uint64_t v23 = *(void *)(v27 + 4);
          long long v26 = v136;
          goto LABEL_19;
        }
        id v114 = sub_1000B9E04();
        int v115 = _NRLogIsLevelEnabled();

        if (!v115) {
          goto LABEL_199;
        }
        id v104 = sub_1000B9E04();
        v105 = @"RouterID";
        break;
      case 7:
        if (v30 > 1)
        {
          int v52 = *((unsigned __int8 *)v27 + 2);
          if (v27[2])
          {
            if (v52 == 1) {
              p_completion = &completion;
            }
            else {
              p_completion = (void ***)&v143;
            }
            if ((sub_1000C49DC(p_completion, v52, (void *)(v27 + 4), (int)v30 - 2, 0, 0, 0) & 0x80000000) == 0) {
              goto LABEL_76;
            }
            id v81 = sub_1000B9E04();
            int v82 = _NRLogIsLevelEnabled();

            long long v26 = v136;
            if (!v82) {
              goto LABEL_48;
            }
            id v41 = sub_1000B9E04();
            uint64_t v126 = 3735;
            v127 = v136;
            goto LABEL_130;
          }
          id v67 = sub_1000B9E04();
          int v68 = _NRLogIsLevelEnabled();

          long long v26 = v136;
          if (v68)
          {
            id v41 = sub_1000B9E04();
            uint64_t v126 = 3725;
            goto LABEL_130;
          }
          goto LABEL_48;
        }
        id v116 = sub_1000B9E04();
        int v117 = _NRLogIsLevelEnabled();

        if (!v117) {
          goto LABEL_199;
        }
        id v104 = sub_1000B9E04();
        v105 = @"NextHop";
        break;
      case 8:
        if (v30 > 9)
        {
          unsigned int v54 = v30 - 10;
          unsigned __int8 v139 = v27[4];
          in6_addr v140 = (in6_addr)0;
          int v55 = *((unsigned __int8 *)v27 + 2);
          if (v55 == 1) {
            v56 = (char *)v142;
          }
          else {
            v56 = (char *)v141;
          }
          int v57 = sub_1000C49DC(&v140, v55, (void *)(v27 + 12), v54, *((unsigned __int8 *)v27 + 5), v56, &v139);
          if ((v57 & 0x80000000) == 0)
          {
            int v131 = *((unsigned __int8 *)v27 + 2);
            uint64_t v58 = v138;
            if ((v27[3] & 0x40) != 0) {
              uint64_t v58 = *(void *)&v140.__u6_addr32[2];
            }
            if (sub_1000C46F8(&v27[v57 + 12], v54 - v57))
            {
              long long v26 = v136;
              unsigned int v24 = v134;
              uint64_t v23 = v58;
              goto LABEL_19;
            }
            if (v131 == 1) {
              v76 = &completion;
            }
            else {
              v76 = (void ***)&v143;
            }
            BYTE6(v124) = v27[2];
            WORD2(v124) = bswap32(*((unsigned __int16 *)v27 + 5)) >> 16;
            WORD1(v124) = bswap32(*((unsigned __int16 *)v27 + 3)) >> 16;
            LOWORD(v124) = bswap32(*((unsigned __int16 *)v27 + 4)) >> 16;
            long long v26 = v136;
            uint64_t v138 = v58;
            unsigned __int8 v77 = -[NRBabelInstance handleUpdateFromAddr:ForPrefix:plen:nextHop:babelInterface:routerID:seqno:interval:metric:ae:](v136, "handleUpdateFromAddr:ForPrefix:plen:nextHop:babelInterface:routerID:seqno:interval:metric:ae:", a5, &v140, v139, v76, v15, v58, v124);
            unsigned int v24 = v134;
            if (v27[3] < 0) {
              *(in6_addr *)v56 = v140;
            }
            v135 |= v77;
            goto LABEL_49;
          }
          id v69 = sub_1000B9E04();
          int v70 = _NRLogIsLevelEnabled();

          long long v26 = v136;
          if (!v70) {
            goto LABEL_48;
          }
          id v41 = sub_1000B9E04();
          uint64_t v126 = 3750;
          v127 = v136;
          goto LABEL_130;
        }
        id v118 = sub_1000B9E04();
        int v119 = _NRLogIsLevelEnabled();

        if (!v119) {
          goto LABEL_199;
        }
        id v104 = sub_1000B9E04();
        v105 = @"Update";
        break;
      case 9:
        if (v30 > 1)
        {
          int v59 = v30 - 2;
          int v60 = *((unsigned __int8 *)v27 + 2);
          if (v27[2])
          {
            unsigned __int8 v139 = v27[3];
            in6_addr v140 = (in6_addr)0;
            int v61 = sub_1000C49DC(&v140, v60, (void *)(v27 + 4), (int)v30 - 2, 0, 0, &v139);
            long long v26 = v136;
            if (v61 < 0)
            {
              id v62 = sub_1000B9E04();
              int v63 = _NRLogIsLevelEnabled();

              if (v63)
              {
                id v41 = sub_1000B9E04();
                uint64_t v126 = 3804;
                v127 = v136;
LABEL_130:
                _NRLogWithArgs();
              }
LABEL_48:
              unsigned int v24 = v134;
LABEL_49:
              uint64_t v23 = v138;
              goto LABEL_19;
            }
          }
          else
          {
            long long v26 = v136;
            if (v27[3])
            {
              id v71 = sub_1000B9E04();
              int v72 = _NRLogIsLevelEnabled();

              if (v72)
              {
                id v41 = sub_1000B9E04();
                v127 = (NRBabelInstance *)*((unsigned __int8 *)v27 + 3);
                uint64_t v126 = 3796;
                goto LABEL_130;
              }
              goto LABEL_48;
            }
            int v61 = 0;
            unsigned __int8 v139 = 0;
            in6_addr v140 = (in6_addr)0;
          }
          if ((sub_1000C46F8(&v27[v61 + 4], v59 - v61) & 1) == 0) {
            [(NRBabelInstance *)v26 handleRouteReqFromAddr:a5 babelInterface:v15 ForPrefix:&v140 plen:v139];
          }
          goto LABEL_49;
        }
        id v120 = sub_1000B9E04();
        int v121 = _NRLogIsLevelEnabled();

        if (!v121) {
          goto LABEL_199;
        }
        id v104 = sub_1000B9E04();
        v105 = @"RouteReq";
        break;
      case 10:
        if (v30 > 0xD)
        {
          int v64 = *((unsigned __int8 *)v27 + 2);
          if (v27[2])
          {
            if (v27[6])
            {
              int v65 = v30 - 14;
              unsigned __int8 v139 = v27[3];
              in6_addr v140 = (in6_addr)0;
              int v66 = sub_1000C49DC(&v140, v64, (void *)(v27 + 16), (int)v30 - 14, 0, 0, &v139);
              if ((v66 & 0x80000000) == 0)
              {
                long long v26 = v136;
                if ((sub_1000C46F8(&v27[v66 + 16], v65 - v66) & 1) == 0)
                {
                  LOBYTE(v124) = v27[6];
                  [(NRBabelInstance *)v136 handleSeqnoReqFromAddr:a5 babelInterface:v15 ForPrefix:&v140 plen:v139 routerID:*((void *)v27 + 1) seqno:bswap32(*((unsigned __int16 *)v27 + 2)) >> 16 hopCount:v124];
                }
                goto LABEL_48;
              }
              id v88 = sub_1000B9E04();
              int v89 = _NRLogIsLevelEnabled();

              long long v26 = v136;
              if (v89)
              {
                id v41 = sub_1000B9E04();
                uint64_t v126 = 3824;
                v127 = v136;
                goto LABEL_130;
              }
            }
            else
            {
              id v83 = sub_1000B9E04();
              int v84 = _NRLogIsLevelEnabled();

              long long v26 = v136;
              if (v84)
              {
                id v41 = sub_1000B9E04();
                uint64_t v126 = 3816;
                goto LABEL_130;
              }
            }
          }
          else
          {
            id v73 = sub_1000B9E04();
            int v74 = _NRLogIsLevelEnabled();

            if (!v74) {
              goto LABEL_136;
            }
            id v75 = sub_1000B9E04();
            uint64_t v126 = 3812;
            _NRLogWithArgs();

            long long v26 = v136;
          }
          goto LABEL_48;
        }
        id v122 = sub_1000B9E04();
        int v123 = _NRLogIsLevelEnabled();

        if (!v123) {
          goto LABEL_199;
        }
        id v104 = sub_1000B9E04();
        v105 = @"SeqnoReq";
        break;
      default:
        goto LABEL_76;
    }
    _NRLogWithArgs();
    long long v26 = v136;
LABEL_179:

    goto LABEL_200;
  }
  if (qword_1001F4A58 != -1) {
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    id v104 = (id)qword_1001F4A50;
    if (v28 >= 0x10) {
      v105 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"Unknown[%u]", v28];
    }
    else {
      v105 = off_1001C71E0[v31];
    }
    long long v26 = v136;
    goto LABEL_178;
  }
LABEL_199:
  long long v26 = v136;
LABEL_200:
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
  if (v135) {
    [(NRBabelInstance *)v26 updateRoutes];
  }

LABEL_209:
}

- (void)sendImmediateRouteUpdateToAllNeighbors
{
}

- (void)sendImmediateRouteUpdateToNeighbor:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4)
  {
    id v23 = v4;
    id v6 = +[NSArray arrayWithObjects:&v23 count:1];
  }
  else
  {
    id v6 = self->_neighbors;
  }
  id v7 = v6;
  BOOL v8 = [(NRBabelInstance *)self createUpdateTLVs];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v9 = v7;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v15 = objc_alloc_init((Class)NSMutableArray);
        int v16 = [v14 createIHUTLV:v18];
        [v15 addObject:v16];

        unsigned int v17 = [v14 createPersonalHelloTLV];
        [v15 addObject:v17];

        [v15 addObjectsFromArray:v8];
        [v14 sendTLVs:v15];
        [v14 enqueueNextUpdate];
        [v14 enqueueNextIHU];
      }
      id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

- (id)createUpdateTLVs
{
  return [(NRBabelInstance *)self createUpdateTLVsWithInterval:0xFFFFLL];
}

- (id)createUpdateTLVsWithInterval:(unsigned __int16)a3
{
  return [(NRBabelInstance *)self createUpdateTLVsForPrefix:0 interval:a3];
}

- (id)createUpdateTLVsForPrefix:(id)a3
{
  return [(NRBabelInstance *)self createUpdateTLVsForPrefix:a3 interval:0xFFFFLL];
}

- (id)createUpdateTLVsForPrefix:(id)a3 interval:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = [(NRBabelInstance *)self createSelectedRoutesArrayForPrefix:a3];
  id v7 = [(NRBabelInstance *)self createUpdateTLVsForRoutes:v6 interval:v4];

  return v7;
}

- (id)createUpdateTLVsForRoutes:(id)a3
{
  return [(NRBabelInstance *)self createUpdateTLVsForRoutes:a3 interval:0xFFFFLL];
}

- (id)createUpdateTLVsForRoutes:(id)a3 interval:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v31 = objc_alloc_init((Class)NSMutableArray);
  if ([v6 count])
  {
    id v7 = objc_alloc_init((Class)NSMutableArray);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = v6;
    id v8 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v41;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v41 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*(id *)(*((void *)&v40 + 1) + 8 * i) routerID]);
          if (([v7 containsObject:v12] & 1) == 0) {
            [v7 addObject:v12];
          }
        }
        id v9 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v9);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v26 = v7;
    id v28 = [v26 countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v28)
    {
      uint64_t v27 = *(void *)v37;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v37 != v27) {
            objc_enumerationMutation(v26);
          }
          uint64_t v30 = v13;
          id v14 = [*(id *)(*((void *)&v36 + 1) + 8 * v13) unsignedLongLongValue];
          [(NRBabelInstance *)self addRouterID:v14 toTLVs:v31];
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v15 = obj;
          id v16 = [v15 countByEnumeratingWithState:&v32 objects:v44 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v33;
            do
            {
              for (j = 0; j != v17; j = (char *)j + 1)
              {
                if (*(void *)v33 != v18) {
                  objc_enumerationMutation(v15);
                }
                long long v20 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
                if ([v20 routerID] == v14)
                {
                  if (qword_1001F4A58 != -1) {
                    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
                  }
                  if (_NRLogIsLevelEnabled())
                  {
                    if (qword_1001F4A58 != -1) {
                      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
                    }
                    uint64_t v24 = 3441;
                    unsigned int v25 = v20;
                    long long v22 = "";
                    id v23 = "-[NRBabelInstance createUpdateTLVsForRoutes:interval:]";
                    _NRLogWithArgs();
                  }
                  -[NRBabelInstance addUpdateForRoute:interval:toTLVs:](self, "addUpdateForRoute:interval:toTLVs:", v20, v4, v31, v22, v23, v24, v25);
                }
              }
              id v17 = [v15 countByEnumeratingWithState:&v32 objects:v44 count:16];
            }
            while (v17);
          }

          uint64_t v13 = v30 + 1;
        }
        while ((id)(v30 + 1) != v28);
        id v28 = [v26 countByEnumeratingWithState:&v36 objects:v45 count:16];
      }
      while (v28);
    }
  }

  return v31;
}

- (void)updateFeasabilityDistanceForRoute:(id)a3
{
  id v12 = a3;
  if ([v12 metric] != 0xFFFF)
  {
    uint64_t v4 = [v12 bPrefix];
    unint64_t v5 = -[NRBabelInstance copySourceWithPrefix:routerID:](self, "copySourceWithPrefix:routerID:", v4, [v12 routerID]);

    if (v5)
    {
      -[NRBabelSource updateFeasabilityDistanceWithSeqno:metric:](v5, "updateFeasabilityDistanceWithSeqno:metric:", [v12 seqno], [v12 metric]);
    }
    else
    {
      id v6 = [NRBabelSource alloc];
      id v7 = [v12 bPrefix];
      id v8 = [v12 routerID];
      id v9 = [v12 seqno];
      id v10 = [v12 receivedMetric];
      id v11 = [v12 instance];
      unint64_t v5 = [(NRBabelSource *)v6 initWithPrefix:v7 routerID:v8 seqno:v9 metric:v10 instance:v11];
    }
    [(NRBabelSource *)v5 resetGCTimer];
  }
}

- (id)createSelectedRoutesArrayForPrefix:(id)a3
{
  id v3 = a3;
  if (![v3 plen])
  {

    id v3 = 0;
  }
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v5 = self->_routes;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v10, "selected", v14, v15))
        {
          if ([v10 metric] == 0xFFFF)
          {
            if (qword_1001F4A58 != -1) {
              dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
            }
            if (_NRLogIsLevelEnabled())
            {
              if (qword_1001F4A58 != -1) {
                dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
              }
              id v14 = self;
              id v15 = v10;
              _NRLogWithArgs();
            }
          }
          else if (!v3 {
                 || ([v10 bPrefix],
          }
                     id v11 = objc_claimAutoreleasedReturnValue(),
                     unsigned int v12 = [v3 isEqual:v11],
                     v11,
                     v12))
          {
            [v4 addObject:v10];
          }
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)addUpdateForRoute:(id)a3 interval:(unsigned __int16)a4 toTLVs:(id)a5
{
  unsigned int v6 = a4;
  id v7 = a3;
  id v8 = a5;
  long long v18 = 0uLL;
  id v9 = [v7 bPrefix];
  [v9 writePrefix:&v18];

  if (v18 || *(void *)((char *)&v18 + 4) != 0xFFFF000000000000)
  {
    LODWORD(v17) = 0;
    uint64_t v13 = 8;
    HIWORD(v13) = __rev16(v6);
    __int16 v14 = __rev16([v7 seqno:v13]);
    __int16 v15 = __rev16([v7 metric]);
    id v10 = [v7 bPrefix];
    unsigned __int8 v11 = [v10 writeToAE:(char *)&v13 + 2 plen:(char *)&v13 + 4 prefix:&v16];

    BYTE1(v13) = v11 + 10;
    id v12 = [objc_alloc((Class)NSData) initWithBytes:&v13 length:(v11 + 10) + 2];
    [v8 addObject:v12];
  }
}

- (void)addRouterID:(unint64_t)a3 toTLVs:(id)a4
{
  int v6 = 2566;
  unint64_t v7 = a3;
  id v4 = a4;
  id v5 = [objc_alloc((Class)NSData) initWithBytes:&v6 length:12];
  [v4 addObject:v5];
}

- (void)updateRoutes
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  int v61 = self;
  id v4 = self->_routes;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v83 objects:v92 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v84;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v84 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v83 + 1) + 8 * i);
        id v10 = [v9 bPrefix];
        unsigned __int8 v11 = [v3 containsObject:v10];

        if ((v11 & 1) == 0)
        {
          id v12 = [v9 bPrefix];
          [v3 addObject:v12];
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v83 objects:v92 count:16];
    }
    while (v6);
  }

  id v62 = objc_alloc_init((Class)NSMutableArray);
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id obj = v3;
  id v58 = [obj countByEnumeratingWithState:&v79 objects:v91 count:16];
  if (v58)
  {
    uint64_t v57 = *(void *)v80;
    do
    {
      for (j = 0; j != v58; j = (char *)j + 1)
      {
        if (*(void *)v80 != v57) {
          objc_enumerationMutation(obj);
        }
        __int16 v15 = *(void **)(*((void *)&v79 + 1) + 8 * (void)j);
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        int v16 = v61->_routes;
        id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v75 objects:v90 count:16];
        if (v17)
        {
          id v18 = v17;
          int v59 = j;
          __int16 v14 = 0;
          uint64_t v19 = *(void *)v76;
          unsigned __int16 v20 = -1;
          do
          {
            for (k = 0; k != v18; k = (char *)k + 1)
            {
              if (*(void *)v76 != v19) {
                objc_enumerationMutation(v16);
              }
              long long v22 = *(void **)(*((void *)&v75 + 1) + 8 * (void)k);
              id v23 = [v22 bPrefix];
              unsigned int v24 = [v15 isContainedInPrefix:v23];

              if (v24 && [v22 metric] < v20)
              {
                id v25 = v22;

                unsigned __int16 v20 = (unsigned __int16)[v25 metric];
                __int16 v14 = v25;
              }
            }
            id v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v75 objects:v90 count:16];
          }
          while (v18);

          if (v14)
          {
            j = v59;
            if (([v62 containsObject:v14] & 1) == 0) {
              [v62 addObject:v14];
            }
          }
          else
          {
            j = v59;
          }
        }
        else
        {

          __int16 v14 = 0;
        }
      }
      id v58 = [obj countByEnumeratingWithState:&v79 objects:v91 count:16];
    }
    while (v58);
  }

  id v60 = objc_alloc_init((Class)NSMutableArray);
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v26 = v61->_routes;
  id v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v71 objects:v89 count:16];
  if (v27)
  {
    id v28 = v27;
    char v29 = 0;
    uint64_t v30 = *(void *)v72;
    do
    {
      for (m = 0; m != v28; m = (char *)m + 1)
      {
        if (*(void *)v72 != v30) {
          objc_enumerationMutation(v26);
        }
        long long v32 = *(void **)(*((void *)&v71 + 1) + 8 * (void)m);
        unsigned int v33 = [v32 selected:v50, v51, v52, v53, v54, v55];
        id v34 = [v62 containsObject:v32];
        if (v33 != v34)
        {
          int v35 = (int)v34;
          [v32 setSelected:v34];
          if (qword_1001F4A58 != -1) {
            dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
          }
          if (_NRLogIsLevelEnabled())
          {
            if (qword_1001F4A58 != -1) {
              dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
            }
            long long v36 = "un";
            if (v35) {
              long long v36 = "";
            }
            unsigned int v54 = v36;
            int v55 = v32;
            uint64_t v52 = 3256;
            v53 = v61;
            int v50 = "";
            id v51 = "-[NRBabelInstance updateRoutes]";
            _NRLogWithArgs();
          }
          if (v35) {
            [v60 addObject:v32];
          }
          char v29 = 1;
        }
      }
      id v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v71 objects:v89 count:16];
    }
    while (v28);
  }
  else
  {
    char v29 = 0;
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v37 = v61->_routes;
  id v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v67 objects:v88 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v68;
    do
    {
      for (n = 0; n != v39; n = (char *)n + 1)
      {
        if (*(void *)v68 != v40) {
          objc_enumerationMutation(v37);
        }
        long long v42 = *(NRBabelInstance **)(*((void *)&v67 + 1) + 8 * (void)n);
        if (qword_1001F4A58 != -1) {
          dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
        }
        if (_NRLogIsLevelEnabled())
        {
          if (qword_1001F4A58 != -1) {
            dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
          }
          uint64_t v52 = 3278;
          v53 = v42;
          int v50 = "";
          id v51 = "-[NRBabelInstance updateRoutes]";
          _NRLogWithArgs();
        }
        [(NRBabelInstance *)v42 applyUsingSystem];
      }
      id v39 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v67 objects:v88 count:16];
    }
    while (v39);
  }

  if (v29)
  {
    id v43 = [objc_alloc((Class)NSArray) initWithArray:v61->_posrs];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v44 = v43;
    id v45 = [v44 countByEnumeratingWithState:&v63 objects:v87 count:16];
    if (v45)
    {
      id v46 = v45;
      uint64_t v47 = *(void *)v64;
      do
      {
        for (ii = 0; ii != v46; ii = (char *)ii + 1)
        {
          if (*(void *)v64 != v47) {
            objc_enumerationMutation(v44);
          }
          [*(id *)(*((void *)&v63 + 1) + 8 * (void)ii) cancelIfRouteUnselected:v50, v51, v52];
        }
        id v46 = [v44 countByEnumeratingWithState:&v63 objects:v87 count:16];
      }
      while (v46);
    }

    [(NRBabelInstance *)v61 sendImmediateRouteUpdateToAllNeighbors];
    id v49 = v62;
  }
  else
  {
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    id v49 = v62;
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      _NRLogWithArgs();
    }
  }
}

- (void)handleSeqnoReqFromAddr:(const in6_addr *)a3 babelInterface:(id)a4 ForPrefix:(const in6_addr *)a5 plen:(unsigned __int8)a6 routerID:(unint64_t)a7 seqno:(unsigned __int16)a8 hopCount:(unsigned __int8)a9
{
  id v9 = (void *)a8;
  uint64_t v11 = a6;
  id v15 = a4;
  long long v85 = self;
  id v86 = [(NRBabelInstance *)self copyNeighborWithAddr:a3 babelInterface:v15 isNewNeighbor:0];
  int v16 = [[NRBabelPrefix alloc] initWithPrefix:a5 plen:v11];
  if (qword_1001F4A58 != -1) {
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    id v17 = (void *)qword_1001F4A50;
    unint64_t v18 = bswap64(a7);
    id v19 = (id)qword_1001F4A50;
    if (v18 > 0xFFFE)
    {
      id v21 = objc_alloc((Class)NSString);
      unsigned int v22 = bswap32(a7);
      id v20 = [v21 initWithFormat:@"<%x:%x:%x:%x>", HIWORD(v22), (unsigned __int16)v22, bswap32(HIDWORD(a7)) >> 16, __rev16(HIWORD(a7))];
    }
    else
    {
      id v20 = [objc_alloc((Class)NSString) initWithFormat:@"<%llx>", v18, v66, v68, v70];
    }
    id v23 = v20;
    uint64_t v78 = a9;
    id v79 = v86;
    long long v72 = v16;
    id v74 = v20;
    uint64_t v68 = 3138;
    long long v70 = self;
    long long v64 = "";
    long long v66 = "-[NRBabelInstance handleSeqnoReqFromAddr:babelInterface:ForPrefix:plen:routerID:seqno:hopCount:]";
    uint64_t v76 = v9;
    _NRLogWithArgs();
  }
  unsigned int v24 = -[NRBabelInstance createSelectedRoutesArrayForPrefix:](self, "createSelectedRoutesArrayForPrefix:", v16, v64, v66, v68, v70, v72, v74, v76, v78, v79);
  if ([v24 count])
  {
    long long v80 = v16;
    id v82 = v15;
    id v25 = objc_alloc_init((Class)NSMutableArray);
    id v83 = objc_alloc_init((Class)NSMutableArray);
    id v84 = objc_alloc_init((Class)NSMutableArray);
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v81 = v24;
    id obj = v24;
    id v26 = [obj countByEnumeratingWithState:&v94 objects:v99 count:16];
    id v89 = v25;
    id v27 = &unk_1001F4000;
    if (v26)
    {
      id v28 = v26;
      uint64_t v29 = *(void *)v95;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v95 != v29) {
            objc_enumerationMutation(obj);
          }
          long long v32 = *(void **)(*((void *)&v94 + 1) + 8 * i);
          if ([v32 routerID] != (id)a7) {
            goto LABEL_31;
          }
          unsigned int v33 = [v32 seqno];
          if (v33 == v9) {
            goto LABEL_31;
          }
          if (v33 >= v9)
          {
            if ((__int16)(v33 - (_WORD)v9) >= 0) {
              LOBYTE(v34) = -1;
            }
            else {
              LOBYTE(v34) = 1;
            }
            if ((unsigned __int16)(v33 - (_WORD)v9) == 0x8000) {
              goto LABEL_31;
            }
          }
          else
          {
            if ((unsigned __int16)((_WORD)v9 - v33) == 0x8000) {
              goto LABEL_31;
            }
            int v34 = ((__int16)((_WORD)v9 - v33) >> 15) | 1;
          }
          if ((char)v34 > 0)
          {
            if (v85->_routerID == a7) {
              id v31 = v83;
            }
            else {
              id v31 = v84;
            }
            goto LABEL_18;
          }
LABEL_31:
          if (v27[331] != -1) {
            dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
          }
          int IsLevelEnabled = _NRLogIsLevelEnabled();
          id v31 = v25;
          if (IsLevelEnabled)
          {
            if (v27[331] != -1) {
              dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
            }
            id v36 = (id)qword_1001F4A50;
            if ([v32 routerID] == (id)a7) {
              long long v37 = "";
            }
            else {
              long long v37 = "not ";
            }
            id v38 = [v32 seqno];
            unsigned int v39 = [v32 seqno];
            if ((__int16)(v39 - (_WORD)v9) >= 0) {
              LODWORD(v40) = -1;
            }
            else {
              LODWORD(v40) = 1;
            }
            if ((unsigned __int16)(v39 - (_WORD)v9) == 0x8000) {
              LODWORD(v40) = 0;
            }
            int v41 = ((int)((v9 - v39) << 16) >> 31) | 1;
            if ((unsigned __int16)((_WORD)v9 - v39) == 0x8000) {
              int v41 = 0;
            }
            if (v39 < v9) {
              LODWORD(v40) = v41;
            }
            if (v39 == v9) {
              uint64_t v40 = 0;
            }
            else {
              uint64_t v40 = v40;
            }
            long long v75 = v9;
            uint64_t v77 = v40;
            long long v71 = (void *)v37;
            id v73 = v38;
            uint64_t v69 = 3152;
            long long v65 = "";
            long long v67 = "-[NRBabelInstance handleSeqnoReqFromAddr:babelInterface:ForPrefix:plen:routerID:seqno:hopCount:]";
            _NRLogWithArgs();

            id v25 = v89;
            id v31 = v89;
            id v27 = (void *)&unk_1001F4000;
          }
LABEL_18:
          [v31 addObject:v32, v65, v67, v69, v71, v73, v75, v77];
        }
        id v28 = [obj countByEnumeratingWithState:&v94 objects:v99 count:16];
      }
      while (v28);
    }

    if ([v25 count])
    {
      long long v42 = v83;
      if (v27[331] != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      id v15 = v82;
      int v16 = v80;
      unsigned int v24 = v81;
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4A58 != -1) {
          dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
        }
        id v43 = (id)qword_1001F4A50;
        if ([v25 count] == (id)1)
        {
          [v25 objectAtIndexedSubscript:0];
          v71 = uint64_t v69 = 3162;
          long long v65 = "";
          long long v67 = "-[NRBabelInstance handleSeqnoReqFromAddr:babelInterface:ForPrefix:plen:routerID:seqno:hopCount:]";
          _NRLogWithArgs();
        }
        else
        {
          uint64_t v69 = 3162;
          long long v71 = v25;
          long long v65 = "";
          long long v67 = "-[NRBabelInstance handleSeqnoReqFromAddr:babelInterface:ForPrefix:plen:routerID:seqno:hopCount:]";
          _NRLogWithArgs();
        }
      }
      uint64_t v47 = v85;
      id v48 = v25;
    }
    else
    {
      long long v42 = v83;
      if (![v83 count])
      {
        long long v92 = 0u;
        long long v93 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        id v49 = v84;
        id v50 = [v49 countByEnumeratingWithState:&v90 objects:v98 count:16];
        if (v50)
        {
          id v51 = v50;
          id obja = 0;
          uint64_t v52 = *(void *)v91;
          unsigned __int16 v53 = -1;
          do
          {
            for (j = 0; j != v51; j = (char *)j + 1)
            {
              if (*(void *)v91 != v52) {
                objc_enumerationMutation(v49);
              }
              int v55 = *(void **)(*((void *)&v90 + 1) + 8 * (void)j);
              v56 = [v55 neighbor];
              unsigned __int8 v57 = [v86 isEqual:v56];

              if ((v57 & 1) == 0 && [v55 metric] < v53)
              {
                unsigned __int16 v53 = (unsigned __int16)[v55 metric];
                id v58 = v55;

                id obja = v58;
              }
              id v25 = v89;
              id v27 = &unk_1001F4000;
            }
            id v51 = [v49 countByEnumeratingWithState:&v90 objects:v98 count:16];
          }
          while (v51);

          long long v42 = v83;
          int v59 = obja;
          if (obja)
          {
            int v16 = v80;
            unsigned int v24 = v81;
            id v15 = v82;
            if (a9 > 1u)
            {
              if (qword_1001F4A58 != -1) {
                dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
              }
              if (_NRLogIsLevelEnabled())
              {
                id v63 = sub_1000B9E04();
                [obja neighbor];
                v71 = uint64_t v69 = 3201;
                long long v65 = "";
                long long v67 = "-[NRBabelInstance handleSeqnoReqFromAddr:babelInterface:ForPrefix:plen:routerID:seqno:hopCount:]";
                _NRLogWithArgs();

                int v59 = obja;
              }
              -[NRBabelInstance sendSeqnoReqIfNecessaryTo:forPrefix:routerID:seqno:hopCount:originator:](v85, "sendSeqnoReqIfNecessaryTo:forPrefix:routerID:seqno:hopCount:originator:", v59, v80, a7, v9, (a9 - 1), v86, v65, v67, v69, v71);
            }
            else
            {
              if (qword_1001F4A58 != -1) {
                dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
              }
              if (_NRLogIsLevelEnabled())
              {
                id v60 = sub_1000B9E04();
                _NRLogWithArgs();
              }
            }
            goto LABEL_97;
          }
        }
        else
        {
        }
        uint64_t v61 = v27[331];
        unsigned int v24 = v81;
        id v15 = v82;
        int v16 = v80;
        if (v61 != -1) {
          dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
        }
        if (_NRLogIsLevelEnabled())
        {
          if (qword_1001F4A58 != -1) {
            dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
          }
          id v62 = (id)qword_1001F4A50;
          _NRLogWithArgs();
        }
        int v59 = 0;
        goto LABEL_97;
      }
      ++v85->_nodeSeqno;
      uint64_t v44 = v27[331];
      id v15 = v82;
      if (v44 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      int v16 = v80;
      unsigned int v24 = v81;
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4A58 != -1) {
          dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
        }
        id v45 = (id)qword_1001F4A50;
        nodeSeqno = (void *)v85->_nodeSeqno;
        if ([v83 count] == (id)1)
        {
          [v83 objectAtIndexedSubscript:0];
          v75 = id v73 = nodeSeqno;
          uint64_t v69 = 3170;
          long long v71 = v9;
          long long v65 = "";
          long long v67 = "-[NRBabelInstance handleSeqnoReqFromAddr:babelInterface:ForPrefix:plen:routerID:seqno:hopCount:]";
          _NRLogWithArgs();
        }
        else
        {
          id v73 = nodeSeqno;
          long long v75 = v83;
          uint64_t v69 = 3170;
          long long v71 = v9;
          long long v65 = "";
          long long v67 = "-[NRBabelInstance handleSeqnoReqFromAddr:babelInterface:ForPrefix:plen:routerID:seqno:hopCount:]";
          _NRLogWithArgs();
        }
      }
      uint64_t v47 = v85;
      id v48 = v83;
    }
    int v59 = -[NRBabelInstance createUpdateTLVsForRoutes:](v47, "createUpdateTLVsForRoutes:", v48, v65, v67, v69, v71, v73, v75);
    [v86 sendTLVs:v59];
LABEL_97:

    goto LABEL_98;
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
LABEL_98:
}

- (void)sendSeqnoReqIfNecessaryTo:(id)a3 forPrefix:(id)a4 routerID:(unint64_t)a5 seqno:(unsigned __int16)a6 hopCount:(unsigned __int8)a7 originator:(id)a8
{
  uint64_t v9 = a7;
  uint64_t v10 = a6;
  id v14 = a3;
  id v15 = a8;
  char v23 = 0;
  id v16 = [(NRBabelInstance *)self copyPendingOutgoingSeqnoReqWithPrefix:a4 routerID:a5 isNewPOSR:&v23];
  id v17 = v16;
  if (v23) {
    goto LABEL_2;
  }
  unsigned int v19 = [v16 seqno];
  if (v19 != v10)
  {
    if (v19 >= v10)
    {
      if ((__int16)(v19 - v10) >= 0) {
        LOBYTE(v20) = -1;
      }
      else {
        LOBYTE(v20) = 1;
      }
      if ((unsigned __int16)(v19 - v10) == 0x8000) {
        goto LABEL_13;
      }
    }
    else
    {
      if ((unsigned __int16)(v10 - v19) == 0x8000) {
        goto LABEL_13;
      }
      int v20 = ((__int16)(v10 - v19) >> 15) | 1;
    }
    if ((char)v20 > 0)
    {
LABEL_2:
      [v17 setSeqno:v10];
      [v17 setOriginator:v15];
      [v17 setRoute:v14];
      unint64_t v18 = [v14 neighbor];
      [v17 setTarget:v18];

      [v17 setHopCount:v9];
      [v17 start];
      goto LABEL_3;
    }
  }
LABEL_13:
  if (qword_1001F4A58 != -1) {
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    id v21 = (id)qword_1001F4A50;
    unsigned int v22 = [v14 neighbor];
    _NRLogWithArgs();
  }
LABEL_3:
}

- (void)handleRouteReqFromAddr:(const in6_addr *)a3 babelInterface:(id)a4 ForPrefix:(const in6_addr *)a5 plen:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  id v17 = [(NRBabelInstance *)self copyNeighborWithAddr:a3 babelInterface:a4 isNewNeighbor:0];
  uint64_t v9 = [[NRBabelPrefix alloc] initWithPrefix:a5 plen:v6];
  if (qword_1001F4A58 != -1) {
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    id v15 = v9;
    id v16 = v17;
    uint64_t v13 = 3097;
    id v14 = self;
    uint64_t v11 = "";
    id v12 = "-[NRBabelInstance handleRouteReqFromAddr:babelInterface:ForPrefix:plen:]";
    _NRLogWithArgs();
  }
  uint64_t v10 = -[NRBabelInstance createUpdateTLVsForPrefix:](self, "createUpdateTLVsForPrefix:", v9, v11, v12, v13, v14, v15, v16);
  [v17 sendTLVs:v10];
}

- (BOOL)handleUpdateFromAddr:(const in6_addr *)a3 ForPrefix:(const in6_addr *)a4 plen:(unsigned __int8)a5 nextHop:(const in6_addr *)a6 babelInterface:(id)a7 routerID:(unint64_t)a8 seqno:(unsigned __int16)a9 interval:(unsigned __int16)a10 metric:(unsigned __int16)a11 ae:(unsigned __int8)a12
{
  uint64_t v14 = a5;
  id v18 = a7;
  unsigned int v19 = [[NRBabelPrefix alloc] initWithPrefix:a4 plen:v14];
  id v20 = [(NRBabelInstance *)self copyNeighborWithAddr:a3 babelInterface:v18 isNewNeighbor:0];
  if (qword_1001F4A58 != -1) {
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    id v21 = (void *)qword_1001F4A50;
    unint64_t v22 = bswap64(a8);
    id v23 = (id)qword_1001F4A50;
    if (v22 > 0xFFFE)
    {
      id v25 = objc_alloc((Class)NSString);
      unsigned int v26 = bswap32(a8);
      id v24 = [v25 initWithFormat:@"<%x:%x:%x:%x>", HIWORD(v26), (unsigned __int16)v26, bswap32(HIDWORD(a8)) >> 16, __rev16(HIWORD(a8))];
    }
    else
    {
      id v24 = [objc_alloc((Class)NSString) initWithFormat:@"<%llx>", v22, v77, v79, v81];
    }
    id v27 = v24;
    id v89 = [v20 descriptionWithNextHop:a6];
    uint64_t v90 = a10;
    uint64_t v87 = a9;
    uint64_t v88 = a11;
    uint64_t v79 = 2915;
    long long v81 = self;
    id v83 = v19;
    long long v85 = v27;
    long long v75 = "";
    uint64_t v77 = "-[NRBabelInstance handleUpdateFromAddr:ForPrefix:plen:nextHop:babelInterface:routerID:seqno:interval:metric:ae:]";
    _NRLogWithArgs();
  }
  if (a11 != 0xFFFF || a12)
  {
    id v91 = v18;
    id v31 = -[NRBabelInstance copyRouteWithPrefix:neighbor:](self, "copyRouteWithPrefix:neighbor:", v19, v20, v75, v77, v79, v81, v83, v85, v87, v88, v89, v90);
    unsigned int v32 = [(NRBabelInstance *)self isNewDistanceUnfeasibleForPrefix:v19 routerID:a8 seqno:a9 metric:a11];
    unsigned int v33 = v32;
    id v92 = v20;
    if (v31)
    {
      long long v93 = v31;
      unsigned int v34 = [(NRBabelRoute *)v31 selected];
      if (a11 != 0xFFFF && (v34 & v33) != 0)
      {
        int v35 = v31;
        if ([(NRBabelRoute *)v31 routerID] == a8)
        {
          id v18 = v91;
          if (qword_1001F4A58 != -1) {
            dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
          }
          if (_NRLogIsLevelEnabled())
          {
            if (qword_1001F4A58 != -1) {
              dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
            }
            id v36 = (void *)qword_1001F4A50;
            unint64_t v37 = bswap64(a8);
            id v38 = (id)qword_1001F4A50;
            if (v37 > 0xFFFE)
            {
              id v56 = objc_alloc((Class)NSString);
              unsigned int v57 = bswap32(a8);
              id v39 = [v56 initWithFormat:@"<%x:%x:%x:%x>", HIWORD(v57), (unsigned __int16)v57, bswap32(HIDWORD(a8)) >> 16, __rev16(HIWORD(a8))];
            }
            else
            {
              id v39 = [objc_alloc((Class)NSString) initWithFormat:@"<%llx>", v37, v78, v80, v82];
            }
            id v58 = v39;
            _NRLogWithArgs();
          }
          goto LABEL_99;
        }
        if (qword_1001F4A58 != -1) {
          dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
        }
        if (_NRLogIsLevelEnabled())
        {
          if (qword_1001F4A58 != -1) {
            dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
          }
          uint64_t v47 = (void *)qword_1001F4A50;
          unint64_t v48 = bswap64(a8);
          id v49 = (id)qword_1001F4A50;
          if (v48 > 0xFFFE)
          {
            id v59 = objc_alloc((Class)NSString);
            unsigned int v60 = bswap32(a8);
            int v35 = v31;
            id v50 = (NRBabelRoute *)[v59 initWithFormat:@"<%x:%x:%x:%x>", HIWORD(v60), (unsigned __int16)v60, bswap32(HIDWORD(a8)) >> 16, __rev16(HIWORD(a8))];
          }
          else
          {
            id v50 = (NRBabelRoute *)[objc_alloc((Class)NSString) initWithFormat:@"<%llx>", v48, v78, v80, v82];
          }
          uint64_t v61 = v50;
          id v84 = v50;
          id v86 = v35;
          uint64_t v80 = 2965;
          id v82 = self;
          uint64_t v76 = "";
          uint64_t v78 = "-[NRBabelInstance handleUpdateFromAddr:ForPrefix:plen:nextHop:babelInterface:routerID:seqno:interval:metric:ae:]";
          _NRLogWithArgs();
        }
        id v62 = v35;
        id v51 = v91;
        -[NRBabelRoute setReceivedMetric:](v62, "setReceivedMetric:", 0xFFFFLL, v76, v78, v80, v82, v84, v86);
        goto LABEL_84;
      }
      unsigned int v44 = [(NRBabelRoute *)v31 receivedMetric];
      BOOL v45 = v44 != a11;
      if (v44 == a11)
      {
        id v46 = v93;
        if (a11 == 0xFFFF) {
          goto LABEL_57;
        }
      }
      else
      {
        [(NRBabelRoute *)v93 setReceivedMetric:a11];
        id v46 = v93;
        if (a11 == 0xFFFF)
        {
LABEL_51:
          if (qword_1001F4A58 != -1) {
            dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
          }
          id v51 = v91;
          if (!_NRLogIsLevelEnabled()) {
            goto LABEL_84;
          }
          if (qword_1001F4A58 != -1) {
            dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
          }
          id v82 = self;
          id v84 = v93;
          uint64_t v80 = 3013;
          uint64_t v76 = "";
          uint64_t v78 = "-[NRBabelInstance handleUpdateFromAddr:ForPrefix:plen:nextHop:babelInterface:routerID:seqno:interval:metric:ae:]";
          goto LABEL_77;
        }
      }
      if ([(NRBabelRoute *)v46 routerID] != a8)
      {
        [(NRBabelRoute *)v46 setRouterID:a8];
        BOOL v45 = 1;
      }
      if (![(NRBabelRoute *)v46 isNextHopEqualTo:a6])
      {
        [(NRBabelRoute *)v46 setNextHop:a6];
        BOOL v45 = 1;
      }
      if (a10 != 0xFFFF) {
        -[NRBabelRoute setInterval:](v46, "setInterval:");
      }
      [(NRBabelRoute *)v46 setNumExpiryTimerFires:0];
      [(NRBabelRoute *)v46 resetExpiryTimer];
      if (v45) {
        goto LABEL_51;
      }
LABEL_57:
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      id v51 = v91;
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4A58 != -1) {
          dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
        }
        id v82 = self;
        id v84 = v93;
        uint64_t v80 = 3015;
        uint64_t v76 = "";
        uint64_t v78 = "-[NRBabelInstance handleUpdateFromAddr:ForPrefix:plen:nextHop:babelInterface:routerID:seqno:interval:metric:ae:]";
        _NRLogWithArgs();
      }
      BOOL v30 = 0;
      goto LABEL_85;
    }
    if (a11 == 0xFFFF)
    {
      id v18 = v91;
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      if (!_NRLogIsLevelEnabled()) {
        goto LABEL_98;
      }
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      uint64_t v40 = (void *)qword_1001F4A50;
      unint64_t v52 = bswap64(a8);
      id v53 = (id)qword_1001F4A50;
      if (v52 > 0xFFFE)
      {
        id v69 = objc_alloc((Class)NSString);
        unsigned int v70 = bswap32(a8);
        id v54 = [v69 initWithFormat:@"<%x:%x:%x:%x>", HIWORD(v70), (unsigned __int16)v70, bswap32(HIDWORD(a8)) >> 16, __rev16(HIWORD(a8))];
      }
      else
      {
        id v54 = [objc_alloc((Class)NSString) initWithFormat:@"<%llx>", v52, v78, v80, v82];
      }
      long long v71 = v54;
    }
    else
    {
      id v18 = v91;
      if (!v32)
      {
        int v55 = [[NRBabelRoute alloc] initWithPrefix:v19 neighbor:v20 routerID:a8 seqno:a9 interval:a10 receivedMetric:a11 nextHop:a6 instance:self];
        if (qword_1001F4A58 != -1) {
          dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
        }
        long long v93 = v55;
        if (!_NRLogIsLevelEnabled())
        {
          id v51 = v91;
          goto LABEL_84;
        }
        id v51 = v91;
        if (qword_1001F4A58 != -1) {
          dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
        }
        id v82 = self;
        id v84 = v55;
        uint64_t v80 = 2957;
        uint64_t v76 = "";
        uint64_t v78 = "-[NRBabelInstance handleUpdateFromAddr:ForPrefix:plen:nextHop:babelInterface:routerID:seqno:interval:metric:ae:]";
LABEL_77:
        _NRLogWithArgs();
LABEL_84:
        BOOL v30 = 1;
LABEL_85:
        id v63 = [objc_alloc((Class)NSArray) initWithArray:self->_posrs];
        long long v94 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        id v64 = v63;
        id v65 = [v64 countByEnumeratingWithState:&v94 objects:v98 count:16];
        if (v65)
        {
          id v66 = v65;
          uint64_t v67 = *(void *)v95;
          do
          {
            for (i = 0; i != v66; i = (char *)i + 1)
            {
              if (*(void *)v95 != v67) {
                objc_enumerationMutation(v64);
              }
              [*(id *)(*((void *)&v94 + 1) + 8 * i) cancelIfMatchesPrefix:v19 routerID:a8 seqno:a9 seqno:v76 seqno:v78 seqno:v80 seqno:v82 seqno:v84];
            }
            id v66 = [v64 countByEnumeratingWithState:&v94 objects:v98 count:16];
          }
          while (v66);
        }

        id v18 = v51;
        int v35 = v93;
        goto LABEL_100;
      }
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      if (!_NRLogIsLevelEnabled())
      {
LABEL_98:
        int v35 = 0;
LABEL_99:
        BOOL v30 = 0;
LABEL_100:

        uint64_t v29 = v92;
        goto LABEL_101;
      }
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      uint64_t v40 = (void *)qword_1001F4A50;
      unint64_t v41 = bswap64(a8);
      id v42 = (id)qword_1001F4A50;
      if (v41 > 0xFFFE)
      {
        id v72 = objc_alloc((Class)NSString);
        unsigned int v73 = bswap32(a8);
        id v43 = [v72 initWithFormat:@"<%x:%x:%x:%x>", HIWORD(v73), (unsigned __int16)v73, bswap32(HIDWORD(a8)) >> 16, __rev16(HIWORD(a8))];
      }
      else
      {
        id v43 = [objc_alloc((Class)NSString) initWithFormat:@"<%llx>", v41, v78, v80, v82];
      }
      long long v71 = v43;
    }
    _NRLogWithArgs();

    goto LABEL_98;
  }
  unsigned __int8 v28 = [(NRBabelInstance *)self purgeAllRoutesFromNeighbor:v20];
  uint64_t v29 = v20;
  BOOL v30 = v28;
LABEL_101:

  return v30;
}

- (BOOL)purgeInterface:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_neighbors;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v11 babelInterface:v15];
        unsigned int v13 = [v12 isEqual:v4];

        if (v13) {
          v8 |= [(NRBabelInstance *)self purgeAllRoutesFromNeighbor:v11];
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8 & 1;
}

- (BOOL)purgeAllRoutesFromNeighbor:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_routes;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v11 neighbor:v15];
        if ([v12 isEqual:v4])
        {
          unsigned int v13 = [v11 receivedMetric];

          if (v13 != 0xFFFF)
          {
            [v11 setReceivedMetric:0xFFFFLL];
            char v8 = 1;
          }
        }
        else
        {
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    char v8 = 0;
  }

  return v8 & 1;
}

- (void)handleIHUFromAddr:(const in6_addr *)a3 babelInterface:(id)a4 rxcost:(unsigned __int16)a5 interval:(unsigned __int16)a6
{
  uint64_t v6 = a6;
  uint64_t v7 = a5;
  id v15 = a4;
  if (qword_1001F4A58 != -1) {
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
  }
  uint64_t IsLevelEnabled = _NRLogIsLevelEnabled();
  if (IsLevelEnabled)
  {
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    id v11 = (id)qword_1001F4A50;
    IPv6AddrString = (void *)createIPv6AddrString();
    _NRLogWithArgs();
  }
  id v12 = v15;
  if (v6)
  {
    id v13 = [(NRBabelInstance *)self copyNeighborWithAddr:a3 babelInterface:v15 isNewNeighbor:0];
    [v13 setTxcost:v7];
    [v13 resetIncomingIHUTimerInterval:v6];

    id v12 = v15;
  }

  _objc_release_x1(IsLevelEnabled, v12);
}

- (void)handleHelloFromAddr:(const in6_addr *)a3 babelInterface:(id)a4 seqno:(unsigned __int16)a5 interval:(unsigned __int16)a6 personal:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = a6;
  uint64_t v9 = a5;
  id v12 = a4;
  char v28 = 0;
  id v13 = [(NRBabelInstance *)self copyNeighborWithAddr:a3 babelInterface:v12 isNewNeighbor:&v28];
  if (v28)
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
      IPv6AddrString = (void *)createIPv6AddrString();
      unsigned int v16 = [v13 metric];
      long long v17 = "public";
      if (v7) {
        long long v17 = "personal";
      }
      uint64_t v26 = v16;
      id v27 = v17;
      uint64_t v24 = v9;
      uint64_t v25 = v8;
      uint64_t v20 = 2839;
      id v21 = self;
      id v22 = v12;
      id v23 = IPv6AddrString;
      long long v18 = "";
      unsigned int v19 = "-[NRBabelInstance handleHelloFromAddr:babelInterface:seqno:interval:personal:]";
      _NRLogWithArgs();
    }
    -[NRBabelInstance sendImmediateRouteUpdateToNeighbor:](self, "sendImmediateRouteUpdateToNeighbor:", v13, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27);
  }
  [v13 handleHelloWithSeqno:v9 interval:v8 personal:v7];
}

- (void)handleAckReqFromAddr:(const in6_addr *)a3 babelInterface:(id)a4 nonce:(unsigned __int16)a5 interval:(unsigned __int16)a6
{
  uint64_t v6 = a6;
  unsigned int v7 = a5;
  id v8 = [(NRBabelInstance *)self copyNeighborWithAddr:a3 babelInterface:a4 isNewNeighbor:0];
  v10[0] = 515;
  v10[1] = __rev16(v7);
  id v9 = [objc_alloc((Class)NSData) initWithBytes:v10 length:4];
  [v8 scheduleTLV:v9 interval:v6];
}

- (id)copyPendingOutgoingSeqnoReqWithPrefix:(id)a3 routerID:(unint64_t)a4 isNewPOSR:(BOOL *)a5
{
  id v8 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = self->_posrs;
  uint64_t v10 = (NRPendingOutgoingSeqnoReq *)[(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v10; i = (NRPendingOutgoingSeqnoReq *)((char *)i + 1))
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "matchesPrefix:routerID:", v8, a4, (void)v16))
        {
          uint64_t v10 = v13;
          goto LABEL_11;
        }
      }
      uint64_t v10 = (NRPendingOutgoingSeqnoReq *)[(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (a5) {
    *a5 = v10 == 0;
  }
  if (!v10)
  {
    id v14 = [[NRPendingOutgoingSeqnoReq alloc] initWithInstance:self prefix:v8 routerID:a4];
    if (v14)
    {
      uint64_t v10 = v14;
      [(NSMutableArray *)self->_posrs addObject:v14];
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
        _NRLogWithArgs();
      }
      uint64_t v10 = 0;
    }
  }

  return v10;
}

- (id)copyRouteWithPrefix:(id)a3 neighbor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = self->_routes;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "matchesPrefix:neighbor:", v6, v7, (void)v14))
        {
          id v9 = v12;
          goto LABEL_11;
        }
      }
      id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (BOOL)isNewDistanceUnfeasibleForPrefix:(id)a3 routerID:(unint64_t)a4 seqno:(unsigned __int16)a5 metric:(unsigned __int16)a6
{
  uint64_t v6 = a6;
  uint64_t v7 = a5;
  id v8 = [(NRBabelInstance *)self copySourceWithPrefix:a3 routerID:a4];
  LOBYTE(v6) = [v8 isNewDistanceUnfeasibleWithSeqno:v7 metric:v6];

  return v6;
}

- (id)copySourceWithPrefix:(id)a3 routerID:(unint64_t)a4
{
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = self->_sources;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "matchesPrefix:routerID:", v6, a4, (void)v15))
        {
          id v13 = v12;
          goto LABEL_11;
        }
      }
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (id)copyNeighborWithAddr:(const in6_addr *)a3 babelInterface:(id)a4 isNewNeighbor:(BOOL *)a5
{
  id v8 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = self->_neighbors;
  uint64_t v10 = (NRBabelNeighbor *)[(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v10; i = (NRBabelNeighbor *)((char *)i + 1))
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "matchesAddress:babelInterface:", a3, v8, (void)v16))
        {
          uint64_t v10 = v13;
          goto LABEL_11;
        }
      }
      uint64_t v10 = (NRBabelNeighbor *)[(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (a5) {
    *a5 = v10 == 0;
  }
  if (!v10)
  {
    long long v14 = [[NRBabelNeighbor alloc] initWithAddress:a3 babelInterface:v8];
    if (v14)
    {
      uint64_t v10 = v14;
      [(NSMutableArray *)self->_neighbors addObject:v14];
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
        _NRLogWithArgs();
      }
      uint64_t v10 = 0;
    }
  }

  return v10;
}

- (NRBabelInstance)init
{
  v38.receiver = self;
  v38.super_class = (Class)NRBabelInstance;
  v2 = [(NRBabelInstance *)&v38 init];
  if (!v2)
  {
    id v26 = sub_1000B9E04();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v28 = sub_1000B9E04();
      _NRLogWithArgs();
    }
    uint64_t v29 = _os_log_pack_size();
    id v5 = (char *)block - ((__chkstk_darwin(v29) + 15) & 0xFFFFFFFFFFFFFFF0);
    __error();
    uint64_t v30 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v30 = 136446210;
    *(void *)(v30 + 4) = "-[NRBabelInstance init]";
    sub_1000B9E04();
    _NRLogAbortWithPack();
LABEL_13:
    id v31 = sub_1000B9E04();
    int v32 = _NRLogIsLevelEnabled();

    if (v32)
    {
      id v33 = sub_1000B9E04();
      _NRLogWithArgs();
    }
    uint64_t v34 = _os_log_pack_size();
    __chkstk_darwin(v34);
    __error();
    uint64_t v35 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v35 = 136446466;
    *(void *)(v35 + 4) = "nr_dispatch_queue_create";
    *(_WORD *)(v35 + 12) = 2080;
    *(void *)(v35 + 14) = v5;
    sub_1000B9E04();
    _NRLogAbortWithPack();
  }
  id v3 = v2;
  id v4 = _NRCopySerialQueueAttr();
  id v5 = "terminusd.babel";
  dispatch_queue_t v6 = dispatch_queue_create("terminusd.babel", v4);

  if (!v6) {
    goto LABEL_13;
  }
  queue = v3->_queue;
  v3->_queue = (OS_dispatch_queue *)v6;

  id v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  interfaces = v3->_interfaces;
  v3->_interfaces = v8;

  uint64_t v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  neighbors = v3->_neighbors;
  v3->_neighbors = v10;

  id v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  sources = v3->_sources;
  v3->_sources = v12;

  long long v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  routes = v3->_routes;
  v3->_routes = v14;

  long long v16 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  posrs = v3->_posrs;
  v3->_posrs = v16;

  id v18 = [objc_alloc((Class)NSMutableDictionary) initWithContentsOfFile:@"/tmp/terminus_babel_data.plist"];
  if (!v18) {
    id v18 = objc_alloc_init((Class)NSMutableDictionary);
  }
  long long v19 = [v18 objectForKeyedSubscript:@"routerID"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (id v20 = [v19 unsignedLongLongValue]) == 0)
  {
    do
    {
      uint64_t v21 = arc4random();
      id v20 = (id)(arc4random() | (unint64_t)(v21 << 32));
    }
    while ((unint64_t)v20 + 1 < 2);
    id v22 = +[NSNumber numberWithUnsignedLongLong:v20];
    [v18 setObject:v22 forKeyedSubscript:@"routerID"];

    sub_100113D08(@"/tmp/terminus_babel_data.plist", v18, 1);
  }

  v3->_unint64_t routerID = (unint64_t)v20;
  v3->_nodeSeqno = arc4random_uniform(0x10000u);
  id v23 = v3->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C8B74;
  block[3] = &unk_1001C8BA8;
  uint64_t v24 = v3;
  unint64_t v37 = v24;
  dispatch_async(v23, block);

  return v24;
}

- (void)dealloc
{
  if (self->_nevi) {
    NEVirtualInterfaceInvalidate();
  }
  v3.receiver = self;
  v3.super_class = (Class)NRBabelInstance;
  [(NRBabelInstance *)&v3 dealloc];
}

- (void)setupAddress:(in6_addr *)a3
{
  if (qword_1001F4A58 != -1) {
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    id v4 = (void *)qword_1001F4A50;
    unint64_t routerID = self->_routerID;
    unint64_t v6 = bswap64(routerID);
    id v7 = (id)qword_1001F4A50;
    if (v6 > 0xFFFE)
    {
      id v9 = objc_alloc((Class)NSString);
      unsigned int v10 = bswap32(routerID);
      id v8 = [v9 initWithFormat:@"<%x:%x:%x:%x>", HIWORD(v10), (unsigned __int16)v10, bswap32(HIDWORD(routerID)) >> 16, __rev16(HIWORD(routerID))];
    }
    else
    {
      id v8 = [objc_alloc((Class)NSString) initWithFormat:@"<%llx>", v6, v14, v15, v16];
    }
    uint64_t v11 = v8;
    _NRLogWithArgs();
  }
  system("netstat -rnf inet6 | grep -v Routing | grep -v Destination | grep -v Internet6 | grep -v -e '^$' | while read -r route ; do addr=\"$(echo \"$route\" | awk '{print $1}')\" ; flags=\"$(echo \"$route\" | awk '{print $3}')\" ; [[ $flags"
    " == *\"2\"* ]] && route -nv delete -inet6 \"${addr}\"; done");
  IPv6AddrString = (NSString *)createIPv6AddrString();
  addrStr = self->_addrStr;
  self->_addrStr = IPv6AddrString;

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

- (void)setupInterfaces
{
  for (int i = 0; i != 10; ++i)
  {
    *(_DWORD *)((char *)&__str + 7) = 0;
    *(void *)&long long __str = 0;
    snprintf((char *)&__str, 0xBuLL, "ipsec%u", i);
    uint64_t v5 = if_nametoindex((const char *)&__str);
    if (v5)
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v4 = self->_interfaces;
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v43 objects:v49 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v44;
LABEL_9:
        uint64_t v8 = 0;
        while (1)
        {
          if (*(void *)v44 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v43 + 1) + 8 * v8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 ifIndex] == v5) {
            break;
          }
          if (v6 == (id)++v8)
          {
            id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v43 objects:v49 count:16];
            if (v6) {
              goto LABEL_9;
            }
            goto LABEL_17;
          }
        }
      }
      else
      {
LABEL_17:

        id v4 = [[NRBabelInterfaceSocket alloc] initWithInstance:self interface:v5];
        if (v4)
        {
          [(NSMutableArray *)self->_interfaces addObject:v4];
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
          id v4 = 0;
        }
      }
    }
  }
  nw_parameters_t v10 = nw_parameters_create();
  long long __str = 0uLL;
  xpc_object_t v36 = xpc_uuid_create((const unsigned __int8 *)&__str);
  if (!v36)
  {
    id v23 = sub_1000B9E04();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v25 = sub_1000B9E04();
      _NRLogWithArgs();
    }
    uint64_t v26 = _os_log_pack_size();
    __chkstk_darwin(v26);
    __error();
    uint64_t v27 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v27 = 136446466;
    *(void *)(v27 + 4) = "nr_xpc_uuid_create";
    *(_WORD *)(v27 + 12) = 2048;
    *(void *)(v27 + 14) = &__str;
    sub_1000B9E04();
    _NRLogAbortWithPack();
LABEL_51:
    __break(1u);
  }
  xpc_object_t v11 = xpc_array_create(0, 0);
  id v12 = v11;
  if (!v11)
  {
    id v28 = sub_1000B9E04();
    int v29 = _NRLogIsLevelEnabled();

    if (v29)
    {
      id v30 = sub_1000B9E04();
      _NRLogWithArgs();
    }
    goto LABEL_50;
  }
  xpc_array_append_value(v11, v36);
  nw_parameters_set_preferred_netagent_uuids();
  xpc_object_t v13 = xpc_uint64_create(2uLL);
  xpc_object_t v14 = xpc_array_create(0, 0);
  uint64_t v15 = v14;
  if (!v14)
  {
    id v31 = sub_1000B9E04();
    int v32 = _NRLogIsLevelEnabled();

    if (v32)
    {
      id v33 = sub_1000B9E04();
      _NRLogWithArgs();
    }
LABEL_50:
    uint64_t v34 = _os_log_pack_size();
    __chkstk_darwin(v34);
    __error();
    uint64_t v35 = _os_log_pack_fill();
    sub_10005F8D8(v35, (uint64_t)"nr_xpc_array_create");
    sub_1000B9E04();
    _NRLogAbortWithPack();
    goto LABEL_51;
  }
  xpc_array_append_value(v14, v13);
  nw_parameters_set_prohibited_interface_types();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v16 = self->_interfaces;
  id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v40;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v40 != v18) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v39 + 1) + 8 * (void)j) addToProhibited:v10];
      }
      id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v17);
  }

  if (self->_ifBringupPathEvaluator) {
    nw_path_evaluator_cancel();
  }
  evaluator_for_endpoint = (OS_nw_path_evaluator *)nw_path_create_evaluator_for_endpoint();
  ifBringupPathEvaluator = self->_ifBringupPathEvaluator;
  self->_ifBringupPathEvaluator = evaluator_for_endpoint;

  id v22 = (void *)nw_path_evaluator_copy_path();
  [(NRBabelInstance *)self handleIfBringupPathUpdate:v22];

  objc_initWeak(&v38, self);
  objc_copyWeak(&v37, &v38);
  nw_path_evaluator_set_update_handler();
  [(NRBabelInstance *)self updateRoutes];
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v38);
}

- (void)handleIfBringupPathUpdate:(id)a3
{
  path = a3;
  if (nw_path_get_status(path) == nw_path_status_satisfied)
  {
    uint64_t interface_index = nw_path_get_interface_index();
    uint64_t v5 = [[NRBabelInterfaceSocket alloc] initWithInstance:self interface:interface_index];
    if (v5)
    {
      [(NSMutableArray *)self->_interfaces addObject:v5];
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      if (!_NRLogIsLevelEnabled()) {
        goto LABEL_22;
      }
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      uint64_t v9 = interface_index;
      interfaces = self->_interfaces;
      uint64_t v8 = 2565;
      id v6 = "";
      uint64_t v7 = (NSMutableArray *)"-[NRBabelInstance handleIfBringupPathUpdate:]";
    }
    else
    {
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      if (!_NRLogIsLevelEnabled()) {
        goto LABEL_22;
      }
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      id v6 = (const char *)interface_index;
      uint64_t v7 = self->_interfaces;
    }
    _NRLogWithArgs();
LABEL_22:
    [(NRBabelInstance *)self setupInterfaces];
LABEL_23:

    goto LABEL_24;
  }
  if (qword_1001F4A58 != -1) {
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    uint64_t v5 = (NRBabelInterfaceSocket *)(id)qword_1001F4A50;
    nw_path_get_status(path);
    _NRLogWithArgs();
    goto LABEL_23;
  }
LABEL_24:
}

@end