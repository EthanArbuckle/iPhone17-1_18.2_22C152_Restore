@interface NRPairingClient
- (BOOL)sendPacketData:(id)a3;
- (NSString)description;
- (void)dealloc;
- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8;
@end

@implementation NRPairingClient

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateChangeBlock, 0);
  objc_storeStrong((id *)&self->_initiatorLocalPublicClassAKeys, 0);
  objc_storeStrong((id *)&self->_initiatorLocalPublicClassCKeys, 0);
  objc_storeStrong((id *)&self->_initiatorLocalPublicClassDKeys, 0);
  objc_storeStrong((id *)&self->_localDevice, 0);
  objc_storeStrong((id *)&self->_ikeSessionClassA, 0);
  objc_storeStrong((id *)&self->_ikeSessionClassC, 0);
  objc_storeStrong((id *)&self->_ikeSessionClassD, 0);
  objc_storeStrong((id *)&self->_ikeSessionPairing, 0);
  objc_storeStrong((id *)&self->_ikeListener, 0);
  objc_storeStrong((id *)&self->_randomUUID, 0);
  objc_storeStrong((id *)&self->_pairingParameters, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_nrUUID, 0);
}

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  v14 = (NSUUID *)a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v19 = (void (**)(void))a8;
  if (qword_1001F47D8 != -1) {
    dispatch_once(&qword_1001F47D8, &stru_1001C5E60);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F47D8 != -1) {
      dispatch_once(&qword_1001F47D8, &stru_1001C5E60);
    }
    id v157 = v16;
    id v158 = v17;
    uint64_t v149 = 1591;
    v151 = self;
    v152 = v14;
    id v154 = v15;
    v145 = "";
    v147 = "-[NRPairingClient requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]";
    _NRLogWithArgs();
  }
  if ((self->_state & 0xFE) != 6)
  {
    id v172 = v17;
    v173 = v19;
    v20 = [v16 localIdentifier];
    id v21 = [v20 identifierType];

    if (v21 == (id)11)
    {
      v22 = [v16 remoteIdentifier];
      id v23 = [v22 identifierType];

      if (v23 == (id)11)
      {
        v170 = self;
        v169 = sub_10013DC5C((uint64_t)NRDLocalDevice, self->_nrUUID);
        v24 = [v16 localIdentifier];
        v25 = [v16 remoteIdentifier];
        unsigned __int8 v26 = [v24 isEqual:v25];

        v171 = v15;
        v167 = v14;
        v168 = v18;
        char v166 = v26;
        if (v26) {
          goto LABEL_29;
        }
        v27 = [v16 localIdentifier];
        if (qword_1001F4C30 != -1) {
          dispatch_once(&qword_1001F4C30, &stru_1001C7E50);
        }
        v28 = v170;
        id v29 = (id)qword_1001F4C28;
        if (([v27 isEqual:v29] & 1) == 0)
        {
          v30 = [v16 localIdentifier];
          if (qword_1001F4C40 != -1) {
            dispatch_once(&qword_1001F4C40, &stru_1001C7E70);
          }
          id v31 = (id)qword_1001F4C38;
          if (([v30 isEqual:v31] & 1) == 0)
          {
            v83 = [v16 localIdentifier];
            v84 = v30;
            id v85 = sub_10011E704();
            unsigned __int8 v164 = [v83 isEqual:v85];

            v28 = v170;
            if ((v164 & 1) == 0)
            {
              v14 = v167;
              if (qword_1001F47D8 != -1) {
                dispatch_once(&qword_1001F47D8, &stru_1001C5E60);
              }
              id v15 = v171;
              id v17 = v172;
              id v18 = v168;
              v19 = v173;
              if (_NRLogIsLevelEnabled())
              {
                id v86 = sub_100005C90();
                v87 = [v16 localIdentifier];
                v155 = [v16 remoteIdentifier];
                _NRLogWithArgs();

                id v18 = v168;
                v19 = v173;

                id v15 = v171;
              }
              goto LABEL_130;
            }
LABEL_19:
            v32 = [v16 remoteIdentifier:v145 v147 v149 v151 v152 v154 v157 v158];
            v33 = [v16 localIdentifier];
            v34 = sub_10013E8A4((uint64_t)NRDLocalDevice, v32, v33, v171);

            if (v34)
            {
              if (qword_1001F47D8 != -1) {
                dispatch_once(&qword_1001F47D8, &stru_1001C5E60);
              }
              if (_NRLogIsLevelEnabled())
              {
                if (qword_1001F47D8 != -1) {
                  dispatch_once(&qword_1001F47D8, &stru_1001C5E60);
                }
                id v35 = (id)qword_1001F47D0;
                v151 = v28;
                v152 = v34->_identity;
                uint64_t v149 = 1628;
                v145 = "";
                v147 = "-[NRPairingClient requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthB"
                       "lock:responseBlock:]";
                _NRLogWithArgs();
              }
              v36 = v34->_nrUUID;

              if (v36)
              {
                v37 = v34->_nrUUID;
                unsigned __int8 v38 = [(NSUUID *)v37 isEqual:v28->_nrUUID];

                if (v38)
                {

LABEL_29:
                  v39 = [v16 localIdentifier:v145 v147 v149 v151 v152];
                  if (qword_1001F4C70 != -1) {
                    dispatch_once(&qword_1001F4C70, &stru_1001C7ED0);
                  }
                  v40 = v170;
                  id v41 = (id)qword_1001F4C68;
                  unsigned int v42 = [v39 isEqual:v41];

                  if (v42)
                  {
                    sub_100005D9C((uint64_t)v170, (id *)&v170->_ikeSessionPairing);
                    objc_storeStrong((id *)&v170->_ikeSessionPairing, a4);
                    sub_100005F10((uint64_t)v170);
                    id v43 = [objc_alloc((Class)NEIKEv2AuthenticationProtocol) initWithMethod:2];
                    if (qword_1001F4C70 != -1) {
                      dispatch_once(&qword_1001F4C70, &stru_1001C7ED0);
                    }
                    id v18 = v168;
                    id v44 = (id)qword_1001F4C68;
                    id v45 = sub_10011F450(0, v44, v43);

                    if (v169)
                    {
                      v46 = (void *)v169[19];
                      id v17 = v172;
                      if (v46) {
                        v46 = (void *)v46[2];
                      }
                      v47 = v46;
                    }
                    else
                    {
                      v47 = 0;
                      id v17 = v172;
                    }
                    [v45 setSharedSecret:v47];

                    v48 = [v45 sharedSecret];

                    if (v48)
                    {
                      if (v45)
                      {
                        if (qword_1001F47D8 != -1) {
                          dispatch_once(&qword_1001F47D8, &stru_1001C5E60);
                        }
                        if (_NRLogIsLevelEnabled())
                        {
                          id v49 = sub_100005C90();
                          _NRLogWithArgs();
                        }
                        nrUUID = v170->_nrUUID;
                        v174[0] = _NSConcreteStackBlock;
                        v174[1] = 3221225472;
                        v174[2] = sub_1000064A0;
                        v174[3] = &unk_1001C6DB8;
                        v174[4] = v170;
                        id v175 = v45;
                        id v176 = v17;
                        v177 = v173;
                        id v51 = v45;
                        v52 = nrUUID;
                        v19 = v173;
                        sub_1001464C8((uint64_t)NRDLocalDevice, v52, 1, v174);

                        v14 = v167;
                        id v18 = v168;
                        id v15 = v171;
                        goto LABEL_130;
                      }
                      v173[2]();
                    }
                    else
                    {
                      id v125 = sub_100005C90();
                      int IsLevelEnabled = _NRLogIsLevelEnabled();

                      id v15 = v171;
                      if (!IsLevelEnabled) {
                        goto LABEL_89;
                      }
                      id v127 = sub_100005C90();
                      _NRLogWithArgs();
                    }
                    id v15 = v171;
LABEL_89:

                    v14 = v167;
                    v19 = v173;
LABEL_130:

                    goto LABEL_131;
                  }
                  v55 = [v16 localIdentifier];
                  if (qword_1001F4C30 != -1) {
                    dispatch_once(&qword_1001F4C30, &stru_1001C7E50);
                  }
                  id v56 = (id)qword_1001F4C28;
                  if (([v55 isEqual:v56] & 1) == 0)
                  {
                    v57 = [v16 localIdentifier];
                    if (qword_1001F4C40 != -1) {
                      dispatch_once(&qword_1001F4C40, &stru_1001C7E70);
                    }
                    id v58 = (id)qword_1001F4C38;
                    if (([v57 isEqual:v58] & 1) == 0)
                    {
                      v88 = [v16 localIdentifier];
                      id v89 = sub_10011E704();
                      unsigned __int8 v90 = [v88 isEqual:v89];

                      id v18 = v168;
                      if ((v90 & 1) == 0)
                      {
                        id v91 = sub_100005C90();
                        int v92 = _NRLogIsLevelEnabled();

                        v14 = v167;
                        id v17 = v172;
                        if (v92)
                        {
                          id v93 = sub_100005C90();
                          v153 = [v16 localIdentifier];
                          _NRLogWithArgs();
                        }
                        v19 = v173;
                        ((void (*)(void (**)(void), void, void, void))v173[2])(v173, 0, 0, 0);
                        id v15 = v171;
                        goto LABEL_130;
                      }
LABEL_66:
                      v59 = [v16 localIdentifier];
                      if (qword_1001F4C40 != -1) {
                        dispatch_once(&qword_1001F4C40, &stru_1001C7E70);
                      }
                      id v60 = (id)qword_1001F4C38;
                      unsigned __int8 v61 = [v59 isEqual:v60];

                      if (v61)
                      {
                        int v62 = 3;
                      }
                      else
                      {
                        v63 = [v16 localIdentifier];
                        if (qword_1001F4C50 != -1) {
                          dispatch_once(&qword_1001F4C50, &stru_1001C7E90);
                        }
                        id v64 = (id)qword_1001F4C48;
                        unsigned int v65 = [v63 isEqual:v64];

                        if (v65) {
                          int v62 = 1;
                        }
                        else {
                          int v62 = 4;
                        }
                      }
                      id v15 = v171;
                      id v66 = v171;
                      id v18 = v168;
                      id v67 = v168;
                      v19 = v173;
                      if ((v170->_state & 0xFE) == 6)
                      {
                        id v68 = 0;
LABEL_113:

                        v116 = sub_10013DC5C((uint64_t)NRDLocalDevice, v40->_nrUUID);
                        if (v172)
                        {
                          v117 = v40->_pairingParameters;
                          if (v117 && (int v118 = v117[11], v117, v118))
                          {
                            id v119 = sub_10011F1E0();
                            [v119 setSequencePerTrafficClass:1];
                            v120 = v119;
                            uint64_t v121 = 16;
                          }
                          else
                          {
                            id v119 = sub_10011F1E0();
                            [v119 setMode:2];
                            v120 = v119;
                            uint64_t v121 = 4;
                          }
                          [v120 setReplayWindowSize:v121, v146, v148, v150];
                          id v15 = v171;
                        }
                        else
                        {
                          id v119 = 0;
                        }
                        char v122 = v166;
                        if (!v68) {
                          char v122 = 1;
                        }
                        if ((v122 & 1) == 0) {
                          sub_10014AAE4((uint64_t)NRDLocalDevice, v40->_nrUUID);
                        }
                        if (v119)
                        {
                          pairingParameters = v40->_pairingParameters;
                          if (pairingParameters) {
                            virtualInterface = pairingParameters->_virtualInterface;
                          }
                          else {
                            virtualInterface = 0;
                          }
                          ((void (*)(void (**)(void), id, id, NEVirtualInterface_s *))v19[2])(v19, v68, v119, virtualInterface);
                        }
                        else
                        {
                          ((void (*)(void (**)(void), id, void, void))v19[2])(v19, v68, 0, 0);
                        }

                        v14 = v167;
                        id v17 = v172;
                        goto LABEL_130;
                      }
                      if (!v66)
                      {
                        id v142 = sub_100005C90();
                        int v143 = _NRLogIsLevelEnabled();

                        if (v143)
                        {
                          id v144 = sub_100005C90();
                          v146 = "-[NRPairingClient respondToIKESession:dataProtectionClass:validateAuthBlock:]";
                          _NRLogWithArgs();
                        }
                        id v68 = 0;
                        v40 = v170;
                        id v15 = v171;
                        id v18 = v168;
                        v19 = v173;
                        goto LABEL_113;
                      }
                      uint64_t String = NRDataProtectionClassCreateString();
                      v69 = sub_10013DC5C((uint64_t)NRDLocalDevice, v170->_nrUUID);
                      id v70 = sub_10013EF3C(v69, v62);
                      v162 = v70;
                      if (v70) {
                        v71 = (void *)*((void *)v70 + 1);
                      }
                      else {
                        v71 = 0;
                      }
                      id v72 = v71;

                      if (!v72)
                      {
                        id v148 = v66;
                        v150 = v69;
                        v94 = (void *)String;
                        sub_100005CE4(v170, 3019, @"%@ %@ %@", v73, v74, v75, v76, v77, String);
                        id v68 = 0;
                        id v15 = v171;
LABEL_112:

                        goto LABEL_113;
                      }
                      v78 = v170->_pairingParameters;
                      v161 = (uint64_t (**)(void, void *))v67;
                      if (v78 && v78->_isTransportModeIPsec)
                      {
                        if (v62 == 3)
                        {
                          if (v69)
                          {
                            v95 = sub_10015BD9C();
                            dispatch_assert_queue_V2(v95);

                            uint64_t v80 = sub_1001416EC(v69, @"0");
                            v96 = sub_10015BD9C();
                            dispatch_assert_queue_V2(v96);

                            v82 = sub_1001418A8(v69, @"0");
                            goto LABEL_103;
                          }
LABEL_149:
                          v165 = 0;
                          uint64_t v80 = 0;
                          goto LABEL_104;
                        }
                        if (v62 == 4)
                        {
                          if (v69)
                          {
                            v79 = sub_10015BD9C();
                            dispatch_assert_queue_V2(v79);

                            uint64_t v80 = (uint64_t)sub_100140FAC(v69, @"0");
                            v81 = sub_10015BD9C();
                            dispatch_assert_queue_V2(v81);

                            v82 = sub_1001414DC(v69, @"0");
LABEL_103:
                            v165 = v82;
LABEL_104:
                            v19 = v173;
LABEL_105:
                            v159 = v69;
                            v97 = sub_10011F560(0, v69, v62);
                            v160 = (void *)v80;
                            if (v80 && v165)
                            {
                              id v98 = objc_alloc((Class)NEIKEv2ConfigurationMessage);
                              id v99 = [objc_alloc((Class)NEIKEv2InitiatorTransportIPv6Address) initWithAddress:v165];
                              v178[0] = v99;
                              id v100 = [objc_alloc((Class)NEIKEv2ResponderTransportIPv6Address) initWithAddress:v160];
                              v178[1] = v100;
                              v101 = +[NSArray arrayWithObjects:v178 count:2];
                              id v102 = [v98 initWithWithAttributes:v101];
                              [v97 setConfigurationReply:v102];

                              id v18 = v168;
                              v19 = v173;
                            }
                            id v103 = sub_100006814((uint64_t)v170, 1);
                            [v97 setCustomIKEAuthPrivateNotifies:v103];
                            id v15 = v171;
                            if (v161[2](v161, v97))
                            {
                              v109 = (id *)sub_100006EBC((uint64_t)v170, v62);
                              sub_100005D9C((uint64_t)v170, v109);
                              v110 = (id *)sub_100006EBC((uint64_t)v170, v62);
                              objc_storeStrong(v110, a4);
                              sub_100007030((uint64_t)v170, v62);
                              v94 = (void *)String;
                              id v148 = v66;
                              sub_100005CE4(v170, 3016, @"%@ %@", v111, v112, v113, v114, v115, String);
                              id v68 = v97;
                            }
                            else
                            {
                              v94 = (void *)String;
                              id v148 = v66;
                              sub_100005CE4(v170, 3021, @"%@ %@", v104, v105, v106, v107, v108, String);
                              id v68 = 0;
                            }

                            v69 = v159;
                            id v67 = v161;
                            goto LABEL_112;
                          }
                          goto LABEL_149;
                        }
                      }
                      v165 = 0;
                      uint64_t v80 = 0;
                      goto LABEL_105;
                    }
                  }
                  goto LABEL_66;
                }
                v128 = v167;
                id v140 = sub_100005C90();
                int v141 = _NRLogIsLevelEnabled();

                v28 = v170;
                if (v141)
                {
                  id v136 = sub_100005C90();
                  v139 = v34->_identity;
                  v156 = v34->_nrUUID;
                  _NRLogWithArgs();

                  goto LABEL_140;
                }
              }
              else
              {
                v128 = v167;
                id v137 = sub_100005C90();
                int v138 = _NRLogIsLevelEnabled();

                if (v138)
                {
                  id v136 = sub_100005C90();
                  v139 = v34->_identity;
                  _NRLogWithArgs();
LABEL_140:

                  goto LABEL_141;
                }
              }
            }
            else
            {
              v128 = v167;
              id v129 = sub_100005C90();
              int v130 = _NRLogIsLevelEnabled();

              if (v130)
              {
                id v136 = sub_100005C90();
                _NRLogWithArgs();
LABEL_141:

                v28 = v170;
              }
            }
            id v15 = v171;
            sub_100005CE4(v28, 3023, @"%@ %@", v131, v132, v133, v134, v135, (uint64_t)v171);

            v14 = v128;
            id v17 = v172;
            v19 = v173;
            id v18 = v168;
            goto LABEL_130;
          }
        }
        goto LABEL_19;
      }
      if (qword_1001F47D8 != -1) {
        dispatch_once(&qword_1001F47D8, &stru_1001C5E60);
      }
      id v17 = v172;
      v19 = v173;
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F47D8 != -1) {
          dispatch_once(&qword_1001F47D8, &stru_1001C5E60);
        }
        id v53 = (id)qword_1001F47D0;
        v54 = [v16 remoteIdentifier];
        [v54 identifierType];
LABEL_57:
        _NRLogWithArgs();

        id v17 = v172;
        v19 = v173;
      }
    }
    else
    {
      if (qword_1001F47D8 != -1) {
        dispatch_once(&qword_1001F47D8, &stru_1001C5E60);
      }
      id v17 = v172;
      v19 = v173;
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F47D8 != -1) {
          dispatch_once(&qword_1001F47D8, &stru_1001C5E60);
        }
        id v53 = (id)qword_1001F47D0;
        v54 = [v16 localIdentifier];
        [v54 identifierType];
        goto LABEL_57;
      }
    }
  }
LABEL_131:
}

- (BOOL)sendPacketData:(id)a3
{
  return 1;
}

- (NSString)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  v4 = v3;
  if (self->_state - 1 > 6) {
    CFStringRef v5 = @"Invalid";
  }
  else {
    CFStringRef v5 = *(&off_1001C5EC0 + (self->_state - 1));
  }
  [v3 appendFormat:@"NRPairingClient[%llu, %@, %@]", self->_identifier, v5, self->_nrUUID];

  return (NSString *)v4;
}

- (void)dealloc
{
  if (qword_1001F47D8 != -1) {
    dispatch_once(&qword_1001F47D8, &stru_1001C5E60);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F47D8 != -1) {
      dispatch_once(&qword_1001F47D8, &stru_1001C5E60);
    }
    _NRLogWithArgs();
  }
  sub_100008148((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)NRPairingClient;
  [(NRPairingClient *)&v3 dealloc];
}

@end