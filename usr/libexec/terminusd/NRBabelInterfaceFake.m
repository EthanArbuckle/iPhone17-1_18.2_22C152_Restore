@interface NRBabelInterfaceFake
- (NRBabelInterfaceFake)initWithInstance:(id)a3 link:(id)a4;
- (NRBabelLinkFake)link;
- (id)description;
- (void)sendPacket:(iovec *)a3 iovLen:(unsigned int)a4 toAddr:(const in6_addr *)a5;
- (void)setLink:(id)a3;
@end

@implementation NRBabelInterfaceFake

- (void).cxx_destruct
{
}

- (void)setLink:(id)a3
{
}

- (NRBabelLinkFake)link
{
  return self->_link;
}

- (id)description
{
  return [(NRBabelLinkFake *)self->_link name];
}

- (void)sendPacket:(iovec *)a3 iovLen:(unsigned int)a4 toAddr:(const in6_addr *)a5
{
  if (a4)
  {
    uint64_t v8 = a4;
    if (a4 > 8)
    {
      uint64_t v11 = a4 & 7;
      if (!v11) {
        uint64_t v11 = 8;
      }
      uint64_t v9 = a4 - v11;
      p_iov_len = (const double *)&a3[4].iov_len;
      int32x4_t v13 = 0uLL;
      uint64_t v14 = v9;
      int32x4_t v15 = 0uLL;
      do
      {
        v16 = p_iov_len - 8;
        unsigned long long v17 = (unsigned __int128)vld2q_f64(v16);
        v18 = p_iov_len - 4;
        unsigned long long v19 = (unsigned __int128)vld2q_f64(v18);
        v20 = p_iov_len + 16;
        unsigned long long v22 = (unsigned __int128)vld2q_f64(p_iov_len);
        v21 = p_iov_len + 4;
        unsigned long long v23 = (unsigned __int128)vld2q_f64(v21);
        int32x4_t v13 = vaddq_s32(v13, vuzp1q_s32((int32x4_t)v17, (int32x4_t)v19));
        int32x4_t v15 = vaddq_s32(v15, vuzp1q_s32((int32x4_t)v22, (int32x4_t)v23));
        p_iov_len = v20;
        v14 -= 8;
      }
      while (v14);
      LODWORD(v10) = vaddvq_s32(vaddq_s32(v15, v13));
    }
    else
    {
      uint64_t v9 = 0;
      LODWORD(v10) = 0;
    }
    uint64_t v24 = a4 - v9;
    v25 = &a3[v9].iov_len;
    do
    {
      int v26 = *(_DWORD *)v25;
      v25 += 2;
      size_t v10 = (v10 + v26);
      --v24;
    }
    while (v24);
    if (v10)
    {
      v27 = (char *)malloc_type_malloc(v10, 0xA172743EuLL);
      if (v27)
      {
        v28 = v27;
        v58 = self;
        int v29 = 0;
        v30 = &a3->iov_len;
        do
        {
          int v31 = v29;
          size_t v32 = *v30;
          memcpy(&v28[v29], (const void *)*(v30 - 1), *v30);
          int v29 = v32 + v31;
          v30 += 2;
          --v8;
        }
        while (v8);
        unint64_t v33 = bswap64(*(void *)a5->__u6_addr8);
        unint64_t v34 = 0xFF02000000000000;
        if (v33 == 0xFF02000000000000)
        {
          unint64_t v34 = 65542;
          unint64_t v33 = bswap64(*(void *)&a5->__u6_addr32[2]);
          v35 = v58;
          if (v33 == 65542)
          {
            int v36 = 0;
LABEL_29:
            int v56 = v10;
            id v57 = [objc_alloc((Class)NSData) initWithBytesNoCopy:v28 length:v10 freeWhenDone:1];
            long long v68 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            v37 = [(NRBabelLinkFake *)v35->_link fakeInterfaces];
            id v38 = [v37 countByEnumeratingWithState:&v68 objects:v72 count:16];
            if (v38)
            {
              id v39 = v38;
              uint64_t v40 = *(void *)v69;
              if (v36)
              {
                do
                {
                  for (i = 0; i != v39; i = (char *)i + 1)
                  {
                    if (*(void *)v69 != v40) {
                      objc_enumerationMutation(v37);
                    }
                    v42 = *(NRBabelInterfaceFake **)(*((void *)&v68 + 1) + 8 * i);
                    v43 = [(NRBabelInterface *)v42 localAddress];
                    if (*(void *)v43->__u6_addr8 == *(void *)a5->__u6_addr8
                      && *(void *)&v43->__u6_addr32[2] == *(void *)&a5->__u6_addr32[2])
                    {
                      v45 = [(NRBabelInterface *)v42 instance];
                      v46 = [v45 queue];
                      v59 = _NSConcreteStackBlock;
                      uint64_t v60 = 3221225472;
                      v61 = sub_1000CA120;
                      v62 = &unk_1001C71A0;
                      id v63 = v57;
                      v64 = v58;
                      int v67 = v56;
                      v65 = v42;
                      v66 = a5;
                      dispatch_async(v46, &v59);
                    }
                  }
                  id v39 = [v37 countByEnumeratingWithState:&v68 objects:v72 count:16];
                }
                while (v39);
              }
              else
              {
                do
                {
                  for (j = 0; j != v39; j = (char *)j + 1)
                  {
                    if (*(void *)v69 != v40) {
                      objc_enumerationMutation(v37);
                    }
                    v48 = *(NRBabelInterfaceFake **)(*((void *)&v68 + 1) + 8 * (void)j);
                    if (v48 != v58)
                    {
                      v49 = [*(id *)(*((void *)&v68 + 1) + 8 * (void)j) instance];
                      v50 = [v49 queue];
                      v59 = _NSConcreteStackBlock;
                      uint64_t v60 = 3221225472;
                      v61 = sub_1000CA120;
                      v62 = &unk_1001C71A0;
                      id v63 = v57;
                      v64 = v58;
                      int v67 = v56;
                      v65 = v48;
                      v66 = a5;
                      dispatch_async(v50, &v59);
                    }
                  }
                  id v39 = [v37 countByEnumeratingWithState:&v68 objects:v72 count:16];
                }
                while (v39);
              }
            }

            return;
          }
        }
        else
        {
          v35 = v58;
        }
        if (v34 < v33) {
          int v36 = -1;
        }
        else {
          int v36 = 1;
        }
        goto LABEL_29;
      }
      id v51 = sub_1000B9E04();
      int IsLevelEnabled = _NRLogIsLevelEnabled();

      if (IsLevelEnabled)
      {
        id v53 = sub_1000B9E04();
        _NRLogWithArgs();
      }
      uint64_t v54 = _os_log_pack_size();
      __chkstk_darwin(v54);
      __error();
      uint64_t v55 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v55 = 136446466;
      *(void *)(v55 + 4) = "strict_malloc";
      *(_WORD *)(v55 + 12) = 2048;
      *(void *)(v55 + 14) = v10;
      sub_1000B9E04();
      _NRLogAbortWithPack();
      goto LABEL_55;
    }
  }
  if (qword_1001F4A58 != -1) {
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4A58 == -1)
    {
LABEL_22:
      _NRLogWithArgs();
      return;
    }
LABEL_55:
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    goto LABEL_22;
  }
}

- (NRBabelInterfaceFake)initWithInstance:(id)a3 link:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)NRBabelInterfaceFake;
  uint64_t v8 = [(NRBabelInterface *)&v30 initWithInstance:v6];
  uint64_t v9 = v8;
  if (v8)
  {
    [(NRBabelInterface *)v8 setInstance:v6];
    objc_storeStrong((id *)&v9->_link, a4);
    uint64_t v26 = 33022;
    int v27 = 0;
    __int16 v28 = __rev16([v7 fakeLinkIndex]);
    __int16 v29 = (unint64_t)[v6 routerID] >> 48;
    [(NRBabelInterface *)v9 setLocalAddress:&v26];
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      id v10 = (id)qword_1001F4A50;
      IPv6AddrString = (void *)createIPv6AddrString();
      [v7 name];
      v21 = v20 = IPv6AddrString;
      uint64_t v18 = 3909;
      id v19 = v6;
      v16 = "";
      unsigned long long v17 = "-[NRBabelInterfaceFake initWithInstance:link:]";
      _NRLogWithArgs();
    }
    v12 = [v6 queue:v16, v17, v18, v19, v20, v21];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000CA48C;
    block[3] = &unk_1001C8868;
    id v23 = v6;
    int32x4_t v13 = v9;
    uint64_t v24 = v13;
    id v25 = v7;
    dispatch_async(v12, block);

    uint64_t v14 = v13;
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
  }

  return v9;
}

@end