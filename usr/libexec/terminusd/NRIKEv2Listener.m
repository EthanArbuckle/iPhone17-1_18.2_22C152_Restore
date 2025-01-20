@interface NRIKEv2Listener
- (NRIKEv2Listener)init;
- (NSString)description;
- (void)listener:(id)a3 receivedNewSession:(id)a4;
- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8;
@end

@implementation NRIKEv2Listener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSessionSource, 0);
  objc_storeStrong((id *)&self->_pendingSessions, 0);
  objc_storeStrong((id *)&self->_pairingManager, 0);
  objc_storeStrong((id *)&self->_pairingClients, 0);
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_ikeListener, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  v14 = (NEIKEv2Listener *)a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = v19;
  if (!v14)
  {
    id v103 = v19;
    id v104 = sub_10000F954();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v106 = sub_10000F954();
      _NRLogWithArgs();
    }
    v21 = v15;
    id v20 = v103;
    goto LABEL_12;
  }
  v21 = v15;
  if (!v15)
  {
    id v107 = v19;
    id v108 = sub_10000F954();
    int v109 = _NRLogIsLevelEnabled();

    if (v109)
    {
      id v110 = sub_10000F954();
      _NRLogWithArgs();
    }
    id v20 = v107;
    goto LABEL_12;
  }
  if (!v19)
  {
    id v111 = sub_10000F954();
    int v112 = _NRLogIsLevelEnabled();

    if (v112)
    {
      id v113 = sub_10000F954();
      _NRLogWithArgs();
    }
    id v20 = 0;
    goto LABEL_12;
  }
  if (self->_ikeListener != v14)
  {
    if (qword_1001F47F8 != -1) {
      dispatch_once(&qword_1001F47F8, &stru_1001C5F68);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F47F8 != -1) {
        dispatch_once(&qword_1001F47F8, &stru_1001C5F68);
      }
      _NRLogWithArgs();
    }
    goto LABEL_11;
  }
  v140 = v19;
  v22 = [v16 localIdentifier];
  id v23 = [v22 identifierType];

  if (v23 != (id)11)
  {
    if (qword_1001F47F8 != -1) {
      dispatch_once(&qword_1001F47F8, &stru_1001C5F68);
    }
    id v20 = v140;
    if (!_NRLogIsLevelEnabled()) {
      goto LABEL_11;
    }
    if (qword_1001F47F8 != -1) {
      dispatch_once(&qword_1001F47F8, &stru_1001C5F68);
    }
    id v49 = (id)qword_1001F47F0;
    v50 = [v16 localIdentifier];
    [v50 identifierType];
LABEL_46:
    _NRLogWithArgs();

    id v20 = v140;
    goto LABEL_11;
  }
  v24 = [v16 remoteIdentifier];
  id v25 = [v24 identifierType];

  if (v25 != (id)11)
  {
    if (qword_1001F47F8 != -1) {
      dispatch_once(&qword_1001F47F8, &stru_1001C5F68);
    }
    id v20 = v140;
    if (!_NRLogIsLevelEnabled()) {
      goto LABEL_11;
    }
    if (qword_1001F47F8 != -1) {
      dispatch_once(&qword_1001F47F8, &stru_1001C5F68);
    }
    id v49 = (id)qword_1001F47F0;
    v50 = [v16 remoteIdentifier];
    [v50 identifierType];
    goto LABEL_46;
  }
  v26 = [v16 localIdentifier];
  v138 = v18;
  v139 = v17;
  v142 = self;
  if (qword_1001F4C70 != -1) {
    dispatch_once(&qword_1001F4C70, &stru_1001C7ED0);
  }
  id v27 = (id)qword_1001F4C68;
  if (([v26 isEqual:v27] & 1) == 0)
  {

    goto LABEL_48;
  }
  v28 = [v16 remoteIdentifier];
  if (qword_1001F4C70 != -1) {
    dispatch_once(&qword_1001F4C70, &stru_1001C7ED0);
  }
  id v29 = (id)qword_1001F4C68;
  unsigned int v30 = [v28 isEqual:v29];

  if (!v30)
  {
LABEL_48:
    v51 = [v16 localIdentifier];
    id v20 = v140;
    if (qword_1001F4C80 != -1) {
      dispatch_once(&qword_1001F4C80, &stru_1001C7EF0);
    }
    id v18 = v138;
    id v17 = v139;
    id v52 = (id)qword_1001F4C78;
    unsigned int v53 = [v51 isEqual:v52];

    if (v53)
    {
      pairingManager = v142->_pairingManager;
      if (pairingManager)
      {
        [(NRDevicePairingManagerContext *)pairingManager requestConfigurationForListener:v14 session:v21 sessionConfig:v16 childConfig:v139 validateAuthBlock:v138 responseBlock:v140];
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    v55 = [v16 localIdentifier];
    v56 = [v16 remoteIdentifier];
    unsigned __int8 v57 = [v55 isEqual:v56];

    unsigned __int8 v144 = v57;
    v137 = v16;
    if (v57)
    {
      long long v148 = 0u;
      long long v149 = 0u;
      long long v150 = 0u;
      long long v151 = 0u;
      id v58 = sub_100145898();
      v59 = (NSUUID *)[v58 countByEnumeratingWithState:&v148 objects:v156 count:16];
      if (v59)
      {
        uint64_t v60 = *(void *)v149;
LABEL_62:
        uint64_t v74 = 0;
        while (1)
        {
          if (*(void *)v149 != v60) {
            objc_enumerationMutation(v58);
          }
          v75 = *(void **)(*((void *)&v148 + 1) + 8 * v74);
          v76 = sub_10013DC5C((uint64_t)NRDLocalDevice, v75);
          if ((!v76 || !_os_feature_enabled_impl() || !v76[11]) && sub_100118D5C(v76) == 1) {
            break;
          }

          if (v59 == (NSUUID *)++v74)
          {
            v59 = (NSUUID *)[v58 countByEnumeratingWithState:&v148 objects:v156 count:16];
            if (!v59) {
              goto LABEL_78;
            }
            goto LABEL_62;
          }
        }
        v59 = v75;
        if (qword_1001F47F8 != -1) {
          dispatch_once(&qword_1001F47F8, &stru_1001C5F68);
        }
        if (_NRLogIsLevelEnabled())
        {
          id v77 = sub_10000F954();
          v127 = v142;
          v128 = v59;
          uint64_t v126 = 698;
          v124 = "";
          v125 = "-[NRIKEv2Listener requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]";
          _NRLogWithArgs();
        }
LABEL_78:
        id v20 = v140;
      }

      goto LABEL_80;
    }
    v61 = [v16 remoteIdentifier];
    v62 = [v16 localIdentifier];
    v63 = sub_10013E8A4((uint64_t)NRDLocalDevice, v61, v62, v21);

    id v64 = sub_10000F954();
    if (v63)
    {
      int v65 = _NRLogIsLevelEnabled();

      if (v65)
      {
        id v66 = sub_10000F954();
        v127 = v142;
        v128 = v63->_identity;
        uint64_t v126 = 681;
        v124 = "";
        v125 = "-[NRIKEv2Listener requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]";
        _NRLogWithArgs();
      }
      v67 = v63->_nrUUID;

      if (v67)
      {
        v59 = v63->_nrUUID;

LABEL_80:
        if (v59)
        {
          v78 = sub_10013DD58((uint64_t)NRDLocalDevice, v59, 0);
          v79 = v78;
          if (v78 && v78[9])
          {
            v80 = [v21 ikeInterfaceName];
            v81 = [v21 localEndpoint];
            v82 = (NSUUID *)sub_10000FA68((uint64_t)v142, v80, v81, v59);

            id v83 = sub_10000F954();
            LODWORD(v81) = _NRLogIsLevelEnabled();

            if (v81)
            {
              id v84 = sub_10000F954();
              if (v142) {
                links = v142->_links;
              }
              else {
                links = 0;
              }
              v132 = v137;
              v133 = v139;
              v130 = v21;
              v131 = links;
              uint64_t v126 = 719;
              v127 = v142;
              v128 = v82;
              v124 = "";
              v125 = "-[NRIKEv2Listener requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlo"
                     "ck:responseBlock:]";
              _NRLogWithArgs();
            }
            if (v82)
            {
              if (v142) {
                v86 = v142->_links;
              }
              else {
                v86 = 0;
              }
              uint64_t v87 = -[NSMutableDictionary objectForKeyedSubscript:](v86, "objectForKeyedSubscript:", v82, v124, v125, v126, v127, v128, v130, v131, v132, v133);
              v88 = (id *)v87;
              if (v87)
              {
                id v89 = *(id *)(v87 + 24);
                if (v89)
                {
                  v90 = v89;
                  unsigned int v91 = [v88[3] state];

                  if (v91 != 255)
                  {
                    id v92 = v88[3];
                    if (v92)
                    {
                      v93 = v92;
                      v94 = v88;
                      id v20 = v140;
LABEL_107:
                      if ((v144 & 1) == 0)
                      {
                        v145[0] = _NSConcreteStackBlock;
                        v145[1] = 3221225472;
                        v145[2] = sub_10001011C;
                        v145[3] = &unk_1001C5F48;
                        id v147 = v20;
                        v146 = v59;
                        id v20 = objc_retainBlock(v145);
                      }
                      [v93 requestConfigurationForListener:v14 session:v21 sessionConfig:v137 childConfig:v139 validateAuthBlock:v138 responseBlock:v20];

                      goto LABEL_111;
                    }
                  }
                }
              }
              if (v142) {
                pairingClients = v142->_pairingClients;
              }
              else {
                pairingClients = 0;
              }
              v94 = [(NSMutableDictionary *)pairingClients objectForKeyedSubscript:v82];

              id v20 = v140;
              if (v94)
              {
                id v99 = v94[4];
                if (v99)
                {
                  v100 = (unsigned __int8 *)v94[4];
                  if (v100)
                  {
                    int v101 = v100[8];

                    if (v101 == 6) {
                      goto LABEL_110;
                    }
                  }
                  else
                  {
                  }
                  id v102 = v94[4];
                  if (v102)
                  {
                    v93 = v102;
                    goto LABEL_107;
                  }
                }
              }
LABEL_110:
              sub_10000FBF0((id *)&v142->super.isa, v21, v137, v139, v138, v140, v82);
LABEL_111:

              id v16 = v137;
              id v18 = v138;
              id v17 = v139;
              goto LABEL_12;
            }
          }
          else
          {
            id v95 = sub_10000F954();
            int v96 = _NRLogIsLevelEnabled();

            if (v96)
            {
              id v97 = sub_10000F954();
              _NRLogWithArgs();
            }
          }
        }
        else
        {
          sub_10000F9A8((uint64_t)v142, 3022, v68, v69, v70, v71, v72, v73, (uint64_t)v21);
        }
        id v16 = v137;
        id v18 = v138;
        id v17 = v139;
LABEL_11:
        (*((void (**)(id, void, void, void))v20 + 2))(v20, 0, 0, 0);
        goto LABEL_12;
      }
      id v122 = sub_10000F954();
      int v123 = _NRLogIsLevelEnabled();

      if (v123)
      {
        id v121 = sub_10000F954();
        v129 = v63->_identity;
        _NRLogWithArgs();

        goto LABEL_130;
      }
    }
    else
    {
      int v114 = _NRLogIsLevelEnabled();

      if (v114)
      {
        id v121 = sub_10000F954();
        _NRLogWithArgs();
LABEL_130:
      }
    }
    sub_10000F9A8((uint64_t)v142, 3023, v115, v116, v117, v118, v119, v120, (uint64_t)v21);

    goto LABEL_113;
  }
  id v136 = v16;
  v31 = [v15 localEndpoint];
  long long v152 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  v32 = v142;
  v33 = v142->_pairingClients;
  id v34 = [(NSMutableDictionary *)v33 countByEnumeratingWithState:&v152 objects:v157 count:16];
  if (!v34)
  {

LABEL_113:
    id v18 = v138;
    id v17 = v139;
    id v20 = v140;
    goto LABEL_11;
  }
  id v35 = v34;
  v141 = v31;
  v135 = v14;
  char v134 = 0;
  uint64_t v36 = *(void *)v153;
  v37 = v33;
  do
  {
    v38 = 0;
    id v143 = v35;
    do
    {
      if (*(void *)v153 != v36) {
        objc_enumerationMutation(v37);
      }
      uint64_t v39 = [(NSMutableDictionary *)v32->_pairingClients objectForKeyedSubscript:*(void *)(*((void *)&v152 + 1) + 8 * (void)v38)];
      v40 = (id *)v39;
      if (v39 && *(void *)(v39 + 32))
      {
        id v41 = *(id *)(v39 + 8);
        v42 = [v21 ikeInterfaceName];
        if ([v41 isEqualToString:v42])
        {
          [v40[2] hostname];
          uint64_t v43 = v36;
          v45 = v44 = v37;
          [v141 hostname];
          v47 = v46 = v21;
          unsigned int v48 = [v45 isEqualToString:v47];

          v21 = v46;
          v32 = v142;

          v37 = v44;
          uint64_t v36 = v43;
          id v35 = v143;

          if (v48)
          {
            [v40[4] requestConfigurationForListener:v135 session:v21 sessionConfig:v136 childConfig:v139 validateAuthBlock:v138 responseBlock:v140];
            char v134 = 1;
          }
        }
        else
        {
        }
      }

      v38 = (char *)v38 + 1;
    }
    while (v35 != v38);
    id v35 = [(NSMutableDictionary *)v37 countByEnumeratingWithState:&v152 objects:v157 count:16];
  }
  while (v35);

  v14 = v135;
  id v16 = v136;
  id v18 = v138;
  id v17 = v139;
  id v20 = v140;
  if ((v134 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_12:
}

- (void)listener:(id)a3 receivedNewSession:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  if (!v11)
  {
    id v6 = sub_10000F954();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_9;
    }
LABEL_15:
    id v10 = sub_10000F954();
    _NRLogWithArgs();

    goto LABEL_9;
  }
  if (!v5)
  {
    id v8 = sub_10000F954();
    int v9 = _NRLogIsLevelEnabled();

    if (!v9) {
      goto LABEL_9;
    }
    goto LABEL_15;
  }
  if (qword_1001F47F8 != -1) {
    dispatch_once(&qword_1001F47F8, &stru_1001C5F68);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F47F8 != -1) {
      dispatch_once(&qword_1001F47F8, &stru_1001C5F68);
    }
    _NRLogWithArgs();
  }
LABEL_9:
}

- (NRIKEv2Listener)init
{
  v11.receiver = self;
  v11.super_class = (Class)NRIKEv2Listener;
  v2 = [(NRIKEv2Listener *)&v11 init];
  if (!v2)
  {
    id v7 = sub_10000F954();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v9 = sub_10000F954();
      _NRLogWithArgs();
    }
    _os_log_pack_size();
    __error();
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136446210;
    *(void *)(v10 + 4) = "-[NRIKEv2Listener init]";
    sub_10000F954();
    _NRLogAbortWithPack();
  }
  v3 = v2;
  v4 = (OS_dispatch_queue *)sub_10015BD9C();
  queue = v3->_queue;
  v3->_queue = v4;

  return v3;
}

- (NSString)description
{
  if (self)
  {
    self = (NRIKEv2Listener *)[objc_alloc((Class)NSString) initWithFormat:@"NRIKEv2Listener[%@]", @"62743"];
    uint64_t v2 = vars8;
  }
  return (NSString *)self;
}

@end