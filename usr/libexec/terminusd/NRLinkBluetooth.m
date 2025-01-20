@interface NRLinkBluetooth
- (BOOL)cancelWithReason:(id)a3;
- (BOOL)resume;
- (BOOL)sendControlData:(id)a3;
- (BOOL)sendPacketData:(id)a3;
- (BOOL)start;
- (BOOL)suspend;
- (id)copyDescriptionInner;
- (id)copyShortDescriptionInner;
- (id)copyStatusString;
- (unsigned)metric;
- (void)acceptNewFlow:(id)a3 fromNexus:(id)a4 completionHandler:(id)a5;
- (void)checkProxyAgentWithForceUpdate:(BOOL)a3;
- (void)invalidateIKESessionForClass:(unsigned __int8)a3;
- (void)invalidateLink;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)refreshCompanionProxyAgent;
- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8;
- (void)setPacketReceiver:(id)a3;
@end

@implementation NRLinkBluetooth

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_counterForDataStallRemediation + 7), 0);
  objc_storeStrong((id *)((char *)&self->_lastWrittenUrgentLink + 7), 0);
  objc_storeStrong((id *)((char *)&self->_lastReadUrgentLink + 7), 0);
  objc_storeStrong((id *)((char *)&self->_lastWrittenDatagramLink + 7), 0);
  objc_storeStrong((id *)((char *)&self->_lastReadDatagramLink + 7), 0);
  objc_storeStrong((id *)((char *)&self->_lastWrittenLink + 7), 0);
  objc_storeStrong((id *)((char *)&self->_lastReadLink + 7), 0);
  objc_storeStrong((id *)((char *)&self->_lastWrittenNexus + 7), 0);
  objc_storeStrong((id *)((char *)&self->_lastReadNexus + 7), 0);
  objc_storeStrong((id *)((char *)&self->_recvIKEv2PointToPoint + 7), 0);
  objc_storeStrong((id *)((char *)&self->_randomUUID + 7), 0);
  objc_storeStrong((id *)((char *)&self->_remotePacketProxy + 7), 0);
  objc_storeStrong((id *)((char *)&self->_dummyPacketNexus + 7), 0);
  objc_storeStrong((id *)((char *)&self->_packetNexus + 7), 0);
  objc_storeStrong((id *)((char *)&self->_linkOutgoingData + 7), 0);
  objc_storeStrong((id *)((char *)&self->_urgentLinkReadBuffer + 7), 0);
  objc_storeStrong((id *)((char *)&self->_localPublicClassCKeysEncryptedWithIDS + 7), 0);
  objc_storeStrong((id *)((char *)&self->_initiatorLocalPublicClassDKeysEncryptedWithIDS + 7), 0);
  objc_storeStrong((id *)((char *)&self->_initiatorLocalPublicClassAKeys + 7), 0);
  objc_storeStrong((id *)((char *)&self->_initiatorLocalPublicClassCKeys + 7), 0);
  objc_storeStrong((id *)((char *)&self->_initiatorLocalPublicClassDKeys + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikePacketReceiver + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeSessionPairing + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeSessionClassA + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeSessionClassC + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeSessionClassD + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeListener + 7), 0);
  objc_storeStrong((id *)((char *)&self->_latencyContexts + 7), 0);
  objc_storeStrong((id *)((char *)&self->_receivedIKEPackets + 7), 0);
  objc_storeStrong((id *)((char *)&self->_urgentLinkWriteBuffer + 7), 0);
  objc_storeStrong((id *)((char *)&self->_dUrgentLinkInputSource + 7), 0);
  objc_storeStrong((id *)((char *)&self->_urgentLinkOutputRing + 7), 0);
  objc_storeStrong((id *)((char *)&self->_lastReadDatagramLinkOutputActivityCounter + 7), 0);
  objc_storeStrong((id *)((char *)&self->_dDatagramLinkInputSource + 7), 0);
  objc_storeStrong((id *)((char *)&self->_datagramLinkOutputRing + 7), 0);
  objc_storeStrong((id *)((char *)&self->_lastReadLinkOutputActivityCounter + 7), 0);
  objc_storeStrong((id *)((char *)&self->_dLinkInputSource + 7), 0);
  objc_storeStrong((id *)((char *)&self->_linkOutputRing + 7), 0);
  objc_storeStrong((id *)((char *)&self->_dNexusBKInputSource + 7), 0);
  objc_storeStrong((id *)((char *)&self->_nexusBKOutputRing + 7), 0);
  objc_storeStrong((id *)((char *)&self->_bytesToNexusVI + 7), 0);
  objc_storeStrong((id *)((char *)&self->_dNexusVIInputSource + 7), 0);
  objc_storeStrong((id *)((char *)&self->_nexusVIOutputRing + 7), 0);
  objc_storeStrong((id *)((char *)&self->_bytesToNexusVO + 7), 0);
  objc_storeStrong((id *)((char *)&self->_dNexusVOInputSource + 7), 0);
  objc_storeStrong((id *)((char *)&self->_nexusVOOutputRing + 7), 0);
  objc_storeStrong((id *)((char *)&self->_bytesToNexus + 7), 0);
  objc_storeStrong((id *)((char *)&self->_dNexusOutputSource + 7), 0);
  objc_storeStrong((id *)((char *)&self->_dNexusInputSource + 7), 0);
  objc_storeStrong((id *)((char *)&self->_nexusOutputRing + 7), 0);
  objc_storeStrong((id *)((char *)&self->_sentPrelude + 7), 0);
  objc_storeStrong((id *)((char *)&self->_remoteDeviceName + 7), 0);
  objc_storeStrong((id *)((char *)&self->_pipe + 7), 0);
  objc_storeStrong((id *)((char *)&self->_bluetoothUUID + 7), 0);

  objc_storeStrong((id *)((char *)&self->_handledUrgentLinkReadBufferBytes + 3), 0);
}

- (void)setPacketReceiver:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      v8 = (void *)_NRCopyLogObjectForNRUUID();
      uint64_t v22 = 9500;
      id v23 = [(NRLink *)self copyDescription];
      v20 = "";
      v21 = "-[NRLinkBluetooth setPacketReceiver:]";
      _NRLogWithArgs();
    }
    objc_storeStrong((id *)((char *)&self->_ikeSessionPairing + 7), a3);
    if ([*(id *)((char *)&self->_urgentLinkWriteBuffer + 7) count])
    {
      v9 = (void *)_NRCopyLogObjectForNRUUID();
      int v10 = _NRLogIsLevelEnabled();

      if (v10)
      {
        v11 = (void *)_NRCopyLogObjectForNRUUID();
        id v23 = [(NRLink *)self copyDescription];
        id v24 = [*(id *)((char *)&self->_urgentLinkWriteBuffer + 7) count];
        uint64_t v22 = 9504;
        v20 = "";
        v21 = "-[NRLinkBluetooth setPacketReceiver:]";
        _NRLogWithArgs();
      }
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = *(id *)((char *)&self->_urgentLinkWriteBuffer + 7);
    id v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v26;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)((char *)&self->_ikeSessionPairing + 7) receivePacketData:*(void *)(*((void *)&v25 + 1) + 8 * i), v20, v21, v22, v23, v24];
        }
        id v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v14);
    }

    [*(id *)((char *)&self->_urgentLinkWriteBuffer + 7) removeAllObjects];
  }
  else
  {
    id v17 = sub_100070988();
    int v18 = _NRLogIsLevelEnabled();

    if (v18)
    {
      id v19 = sub_100070988();
      _NRLogWithArgs();
    }
  }
}

- (BOOL)sendPacketData:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v13 = sub_100070988();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v15 = sub_100070988();
      _NRLogWithArgs();
    }
    goto LABEL_8;
  }
  int state = self->super._state;
  v6 = (void *)_NRCopyLogObjectForNRUUID();
  if (state == 255)
  {
    int v10 = _NRLogIsLevelEnabled();

    if (v10)
    {
      v11 = (void *)_NRCopyLogObjectForNRUUID();
      id v17 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();
    }
LABEL_8:
    char v9 = 0;
    goto LABEL_9;
  }
  int v7 = _NRLogIsLevelEnabled();

  if (v7)
  {
    v8 = (void *)_NRCopyLogObjectForNRUUID();
    id v16 = [(NRLink *)self copyDescription];
    [v4 length];
    _NRLogWithArgs();
  }
  char v9 = sub_100070BB0((uint64_t)self, v4);
LABEL_9:

  return v9;
}

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = (void (**)(void, void, void, void))v19;
  if (!v14)
  {
    id v118 = sub_100070988();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_36;
    }
LABEL_109:
    id v128 = sub_100070988();
    _NRLogWithArgs();

    goto LABEL_36;
  }
  if (!v15)
  {
    id v120 = sub_100070988();
    int v121 = _NRLogIsLevelEnabled();

    if (!v121) {
      goto LABEL_36;
    }
    goto LABEL_109;
  }
  if (!v16)
  {
    id v122 = sub_100070988();
    int v123 = _NRLogIsLevelEnabled();

    if (!v123) {
      goto LABEL_36;
    }
    goto LABEL_109;
  }
  if (!v18)
  {
    id v124 = sub_100070988();
    int v125 = _NRLogIsLevelEnabled();

    if (!v125) {
      goto LABEL_36;
    }
    goto LABEL_109;
  }
  if (!v19)
  {
    id v126 = sub_100070988();
    int v127 = _NRLogIsLevelEnabled();

    if (!v127) {
      goto LABEL_36;
    }
    goto LABEL_109;
  }
  v21 = (void *)_NRCopyLogObjectForNRUUID();
  int v22 = _NRLogIsLevelEnabled();

  if (v22)
  {
    id v23 = (void *)_NRCopyLogObjectForNRUUID();
    id v141 = v16;
    id v142 = v17;
    uint64_t v134 = 9232;
    id v135 = [(NRLink *)self copyDescription];
    id v137 = v14;
    id v139 = v15;
    v131 = "";
    v133 = "-[NRLinkBluetooth requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]";
    _NRLogWithArgs();
  }
  if (self->super._state == 255) {
    goto LABEL_33;
  }
  id v24 = [v16 localIdentifier];
  id v25 = [v24 identifierType];

  if (v25 != (id)11)
  {
    v47 = (void *)_NRCopyLogObjectForNRUUID();
    int v48 = _NRLogIsLevelEnabled();

    if (v48)
    {
      v49 = (void *)_NRCopyLogObjectForNRUUID();
      id v50 = [(NRLink *)self copyDescription];
      v51 = [v16 localIdentifier];
      [v51 identifierType];
LABEL_32:
      _NRLogWithArgs();
    }
LABEL_33:
    id v54 = 0;
    goto LABEL_34;
  }
  long long v26 = [v16 remoteIdentifier];
  id v27 = [v26 identifierType];

  if (v27 != (id)11)
  {
    v52 = (void *)_NRCopyLogObjectForNRUUID();
    int v53 = _NRLogIsLevelEnabled();

    if (v53)
    {
      v49 = (void *)_NRCopyLogObjectForNRUUID();
      id v50 = [(NRLink *)self copyDescription];
      v51 = [v16 remoteIdentifier];
      [v51 identifierType];
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  v147 = v17;
  long long v28 = [v16 localIdentifier];
  v29 = [v16 remoteIdentifier];
  unsigned __int8 v30 = [v28 isEqual:v29];

  v31 = (id *)&unk_1001F4000;
  v146 = v18;
  v32 = &unk_1001F4000;
  if (v30) {
    goto LABEL_20;
  }
  v33 = [v16 localIdentifier];
  if (qword_1001F4C30 != -1) {
    dispatch_once(&qword_1001F4C30, &stru_1001C7E50);
  }
  id v34 = (id)qword_1001F4C28;
  if ([v33 isEqual:v34]) {
    goto LABEL_19;
  }
  [v16 localIdentifier];
  v35 = v145 = v33;
  if (qword_1001F4C40 != -1) {
    dispatch_once(&qword_1001F4C40, &stru_1001C7E70);
  }
  id v36 = (id)qword_1001F4C38;
  if ([v35 isEqual:v36])
  {

    v33 = v145;
LABEL_19:

    v31 = (id *)&unk_1001F4000;
    goto LABEL_20;
  }
  [v16 localIdentifier];
  v75 = id v143 = v14;
  id v76 = sub_10011E704();
  unsigned __int8 v144 = [v75 isEqual:v76];

  v32 = (void *)&unk_1001F4000;
  id v14 = v143;

  v31 = (id *)&unk_1001F4000;
  if ((v144 & 1) == 0)
  {
    v77 = (void *)_NRCopyLogObjectForNRUUID();
    int v78 = _NRLogIsLevelEnabled();

    if (v78)
    {
      v79 = (void *)_NRCopyLogObjectForNRUUID();
      id v80 = [(NRLink *)self copyDescription];
      v81 = [v16 localIdentifier];
      v140 = [v16 remoteIdentifier];
      _NRLogWithArgs();
    }
    goto LABEL_71;
  }
LABEL_20:
  v37 = [v16 localIdentifier:v131 v133 v134 v135 v137 v139 v141 v142];
  if (v32[390] != -1) {
    dispatch_once(&qword_1001F4C30, &stru_1001C7E50);
  }
  id v17 = v147;
  id v38 = v31[389];
  unsigned int v39 = [v37 isEqual:v38];

  if (v39)
  {
    id v18 = v146;
    if (v147)
    {
      uint64_t v40 = mach_absolute_time();
      uint64_t v41 = *(unint64_t *)((char *)&self->_counterForDataStallRemediation + 7);
      if (v41)
      {
        *(void *)(v41 + 48) = v40;
        v42 = *(id *)((char *)&self->_counterForDataStallRemediation + 7);
        if (v42) {
          ++v42[9];
        }
      }
      else
      {
        v42 = 0;
      }

      v43 = self;
      v44 = v15;
      v45 = v16;
      uint64_t v46 = 4;
      goto LABEL_58;
    }
    [(NRLink *)self reportEvent:3024, @"ClassD %@", v15 detailsFormat];
LABEL_112:
    id v54 = 0;
    goto LABEL_34;
  }
  v55 = [v16 localIdentifier];
  if (qword_1001F4C40 != -1) {
    dispatch_once(&qword_1001F4C40, &stru_1001C7E70);
  }
  id v56 = (id)qword_1001F4C38;
  unsigned int v57 = [v55 isEqual:v56];

  if (!v57)
  {
    v63 = [v16 localIdentifier];
    if (qword_1001F4C50 != -1) {
      dispatch_once(&qword_1001F4C50, &stru_1001C7E90);
    }
    id v64 = (id)qword_1001F4C48;
    unsigned int v65 = [v63 isEqual:v64];

    if (!v65)
    {
      v86 = [v16 localIdentifier];
      id v87 = sub_10011E83C();
      unsigned int v88 = [v86 isEqual:v87];

      if (v88)
      {
        uint64_t v89 = mach_absolute_time();
        uint64_t v90 = *(unint64_t *)((char *)&self->_counterForDataStallRemediation + 7);
        if (v90)
        {
          *(void *)(v90 + 112) = v89;
          v91 = *(id *)((char *)&self->_counterForDataStallRemediation + 7);
          if (v91) {
            ++v91[13];
          }
        }
        else
        {
          v91 = 0;
        }

        objc_storeStrong((id *)((char *)&self->_ikeSessionClassA + 7), a4);
        sub_100076950((uint64_t)self);
        id v92 = [objc_alloc((Class)NEIKEv2AuthenticationProtocol) initWithMethod:2];
        id v93 = sub_10011E83C();
        id v54 = sub_10011F450(0, v93, v92);

        v94 = sub_10013DC5C((uint64_t)NRDLocalDevice, self->super._nrUUID);
        v95 = sub_10013F298(v94);
        [v54 setSharedSecret:v95];

        v96 = [v54 sharedSecret];

        id v97 = sub_100070988();
        if (!v96)
        {
          int v129 = _NRLogIsLevelEnabled();

          if (v129)
          {
            id v130 = sub_100070988();
            _NRLogWithArgs();
          }
          goto LABEL_72;
        }
        int v98 = _NRLogIsLevelEnabled();

        if (v98)
        {
          id v99 = sub_100070988();
          _NRLogWithArgs();
        }
        int v68 = 0;
        char v66 = 1;
        int v67 = 1;
      }
      else
      {
        v100 = [v16 localIdentifier];
        id v101 = sub_10011E7A0();
        unsigned int v102 = [v100 isEqual:v101];

        if (!v102)
        {
          v114 = (void *)_NRCopyLogObjectForNRUUID();
          int v115 = _NRLogIsLevelEnabled();

          if (v115)
          {
            v116 = (void *)_NRCopyLogObjectForNRUUID();
            id v117 = [(NRLink *)self copyDescription];
            v138 = [v16 localIdentifier];
            _NRLogWithArgs();
          }
          id v54 = 0;
          id v18 = v146;
          goto LABEL_34;
        }
        uint64_t v103 = mach_absolute_time();
        uint64_t v104 = *(unint64_t *)((char *)&self->_counterForDataStallRemediation + 7);
        if (v104)
        {
          *(void *)(v104 + 112) = v103;
          v105 = *(id *)((char *)&self->_counterForDataStallRemediation + 7);
          if (v105) {
            ++v105[13];
          }
        }
        else
        {
          v105 = 0;
        }

        objc_storeStrong((id *)((char *)&self->_ikeSessionClassA + 7), a4);
        sub_100076950((uint64_t)self);
        id v106 = [objc_alloc((Class)NEIKEv2AuthenticationProtocol) initWithNonStandardDigitalSignature:2];
        id v107 = sub_10011E7A0();
        id v54 = sub_10011F450(0, v107, v106);

        id v108 = sub_100070988();
        int v109 = _NRLogIsLevelEnabled();

        if (v109)
        {
          id v110 = sub_100070988();
          _NRLogWithArgs();
        }
        int v67 = 0;
        char v66 = 1;
        int v68 = 1;
      }
      id v18 = v146;
      if (self->super._virtualInterface) {
        goto LABEL_60;
      }
      goto LABEL_95;
    }
    if (v147)
    {
      v43 = self;
      v44 = v15;
      v45 = v16;
      uint64_t v46 = 1;
      id v18 = v146;
LABEL_58:
      sub_1000761A0((void **)&v43->super.super.isa, v44, v45, v46, v18);
      id v54 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    }
    [(NRLink *)self reportEvent:3024, @"ClassA %@", v15 detailsFormat];
LABEL_71:
    id v54 = 0;
LABEL_72:
    id v18 = v146;
    id v17 = v147;
    goto LABEL_34;
  }
  id v18 = v146;
  if (!v147)
  {
    [(NRLink *)self reportEvent:3024, @"ClassC %@", v15 detailsFormat];
    goto LABEL_112;
  }
  self;
  if (qword_1001F4DE0 != -1) {
    dispatch_once(&qword_1001F4DE0, &stru_1001C8A30);
  }
  id v58 = (id)qword_1001F4DD8;
  v59 = v58;
  if (!v58) {
    goto LABEL_83;
  }
  dispatch_assert_queue_V2(*((dispatch_queue_t *)v58 + 2));
  if (!v59[10])
  {
    v59[10] = 1;
    if (v59[8] == 4)
    {
      sub_100158FD0((uint64_t)v59);
      if (v59[9])
      {
        v59[8] = 3;
        sub_100159248((uint64_t)v59);
      }
    }
  }
  if ((v59[8] & 0xFD) != 1)
  {
LABEL_83:
    [(NRLink *)self reportEvent:3020, @"ClassC %@", v15 detailsFormat];

    id v54 = 0;
    goto LABEL_34;
  }
  uint64_t v60 = mach_absolute_time();
  uint64_t v61 = *(unint64_t *)((char *)&self->_counterForDataStallRemediation + 7);
  if (v61)
  {
    *(void *)(v61 + 32) = v60;
    v62 = *(id *)((char *)&self->_counterForDataStallRemediation + 7);
    if (v62) {
      ++v62[8];
    }
  }
  else
  {
    v62 = 0;
  }

  sub_1000761A0((void **)&self->super.super.isa, v15, v16, 3, v146);
  id v54 = (id)objc_claimAutoreleasedReturnValue();

LABEL_59:
  char v66 = 0;
  int v67 = 0;
  int v68 = 0;
  if (!self->super._virtualInterface)
  {
LABEL_95:
    v111 = (void *)_NRCopyLogObjectForNRUUID();
    int v112 = _NRLogIsLevelEnabled();

    if (v112)
    {
      v113 = (void *)_NRCopyLogObjectForNRUUID();
      id v132 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();
    }
    goto LABEL_72;
  }
LABEL_60:
  if (v54)
  {
    if (v67)
    {
      nrUUID = self->super._nrUUID;
      v153[0] = _NSConcreteStackBlock;
      v153[1] = 3221225472;
      v153[2] = sub_100076E9C;
      v153[3] = &unk_1001C6DB8;
      v153[4] = self;
      id v54 = v54;
      id v154 = v54;
      v156 = v20;
      id v17 = v147;
      id v155 = v147;
      v70 = nrUUID;
      id v18 = v146;
      sub_1001464C8((uint64_t)NRDLocalDevice, v70, 1, v153);
    }
    else
    {
      if (v68)
      {
        v71 = (void *)_NRCopyLogObjectForNRUUID();
        int v72 = _NRLogIsLevelEnabled();

        if (v72)
        {
          v73 = (void *)_NRCopyLogObjectForNRUUID();
          id v136 = [(NRLink *)self copyDescription];
          _NRLogWithArgs();
        }
        v74 = self->super._nrUUID;
        v148[0] = _NSConcreteStackBlock;
        v148[1] = 3221225472;
        v148[2] = sub_10007720C;
        v148[3] = &unk_1001C6DE0;
        v148[4] = self;
        v152 = v20;
        id v149 = v15;
        id v54 = v54;
        id v150 = v54;
        id v17 = v147;
        id v151 = v147;
        sub_100147034((uint64_t)NRDLocalDevice, v74, 4, v148);
      }
      else
      {
        v82 = [(NRLink *)self nrUUID];
        v83 = sub_10013DC5C((uint64_t)NRDLocalDevice, v82);

        id v84 = sub_10011F1E0();
        [v84 setSequencePerTrafficClass:1];
        [v84 setReplayWindowSize:16];
        if (v66) {
          virtualInterface = 0;
        }
        else {
          virtualInterface = self->super._virtualInterface;
        }
        ((void (**)(void, id, id, NEVirtualInterface_s *))v20)[2](v20, v54, v84, virtualInterface);

        id v17 = v147;
      }
      id v18 = v146;
    }
    goto LABEL_35;
  }
  id v17 = v147;
LABEL_34:
  v20[2](v20, 0, 0, 0);
LABEL_35:

LABEL_36:
}

- (BOOL)sendControlData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [objc_alloc((Class)NEIKEv2PrivateNotify) initWithNotifyStatus:50702 notifyData:v4];
    BOOL v6 = v5 != 0;
    if (v5)
    {
      if (self) {
        ++*(unsigned int *)((char *)&self->_handledUrgentLinkWriteBufferBytes + 3);
      }
      objc_initWeak(&location, self);
      int v7 = *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7);
      id v20 = v5;
      v8 = +[NSArray arrayWithObjects:&v20 count:1];
      char v9 = [(NRLink *)self queue];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000817EC;
      v17[3] = &unk_1001C7A00;
      objc_copyWeak(&v18, &location);
      [v7 sendPrivateNotifies:v8 maxRetries:10 retryIntervalInMilliseconds:10000 callbackQueue:v9 callback:v17];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      id v14 = sub_100070988();
      int IsLevelEnabled = _NRLogIsLevelEnabled();

      if (IsLevelEnabled)
      {
        id v16 = sub_100070988();
        _NRLogWithArgs();
      }
    }
  }
  else
  {
    id v11 = sub_100070988();
    int v12 = _NRLogIsLevelEnabled();

    if (v12)
    {
      id v13 = sub_100070988();
      _NRLogWithArgs();
    }
    BOOL v6 = 0;
  }

  return v6;
}

- (void)acceptNewFlow:(id)a3 fromNexus:(id)a4 completionHandler:(id)a5
{
  int v10 = (void (**)(id, void))a5;
  BOOL v6 = (void *)_NRCopyLogObjectForNRUUID();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    v8 = (void *)_NRCopyLogObjectForNRUUID();
    id v9 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();
  }
  v10[2](v10, 0);
}

- (void)checkProxyAgentWithForceUpdate:(BOOL)a3
{
  v17.receiver = self;
  v17.super_class = (Class)NRLinkBluetooth;
  [(NRLink *)&v17 checkProxyAgentWithForceUpdate:a3];
  uint64_t v4 = [(NRLink *)self proxyAgentRegistration];
  if (v4)
  {
    id v5 = (void *)v4;
    unsigned int v6 = [(NRLink *)self state];

    if (v6 == 8)
    {
      if ([(NRLink *)self shouldCreateCompanionProxyAgent])
      {
        companionProxyAgent = self->super._companionProxyAgent;
        if (!companionProxyAgent)
        {
          v8 = [*(id *)((char *)&self->_linkOutgoingData + 7) interfaceName];
          if (v8 && *(CBScalablePipe **)((char *)&self->_pipe + 7))
          {
            id v9 = [NRCompanionProxyAgent alloc];
            int v10 = [(NRLink *)self queue];
            id v11 = (NRCompanionProxyAgent *)sub_100064188((id *)&v9->super.isa, v10, v8, *(void **)((char *)&self->_pipe + 7), self->super._nrUUID);
            int v12 = self->super._companionProxyAgent;
            self->super._companionProxyAgent = v11;

            [(NRLink *)self reportEvent:12001];
          }

          companionProxyAgent = self->super._companionProxyAgent;
        }
        if ((sub_1000644C0((uint64_t)companionProxyAgent) & 1) == 0)
        {
          id v13 = (void *)_NRCopyLogObjectForNRUUID();
          int IsLevelEnabled = _NRLogIsLevelEnabled();

          if (IsLevelEnabled)
          {
            id v15 = (void *)_NRCopyLogObjectForNRUUID();
            id v16 = [(NRLink *)self copyDescription];
            _NRLogWithArgs();
          }
        }
      }
    }
  }
  sub_100081AF8((uint64_t)self);
}

- (BOOL)resume
{
  if (self->super._state == 255)
  {
    id v9 = (void *)_NRCopyLogObjectForNRUUID();
    BOOL v8 = 1;
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v11 = (void *)_NRCopyLogObjectForNRUUID();
      id v17 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)NRLinkBluetooth;
    if ([(NRLink *)&v18 resume])
    {
      companionProxyAgent = self->super._companionProxyAgent;
      if (companionProxyAgent)
      {
        if ((sub_1000644C0((uint64_t)companionProxyAgent) & 1) == 0)
        {
          uint64_t v4 = (void *)_NRCopyLogObjectForNRUUID();
          int v5 = _NRLogIsLevelEnabled();

          if (v5)
          {
            unsigned int v6 = (void *)_NRCopyLogObjectForNRUUID();
            uint64_t v15 = 1792;
            id v16 = [(NRLink *)self copyDescription];
            id v13 = "";
            id v14 = "-[NRLinkBluetooth resume]";
            _NRLogWithArgs();
          }
        }
      }
      [(NRLink *)self changeStateTo:8, @"(resume)", v13, v14, v15, v16 details];
      sub_1000819E8(self, 0);
      int v7 = [(NRLink *)self linkDelegate];
      [v7 linkIsReady:self];

      return 1;
    }
    else
    {
      return 0;
    }
  }
  return v8;
}

- (BOOL)suspend
{
  v19.receiver = self;
  v19.super_class = (Class)NRLinkBluetooth;
  [(NRLink *)&v19 suspend];
  if (self->super._state != 255)
  {
    companionProxyAgent = self->super._companionProxyAgent;
    if (companionProxyAgent)
    {
      if ((sub_1000638F4((uint64_t)companionProxyAgent) & 1) == 0)
      {
        uint64_t v4 = (void *)_NRCopyLogObjectForNRUUID();
        int IsLevelEnabled = _NRLogIsLevelEnabled();

        if (IsLevelEnabled)
        {
          unsigned int v6 = (void *)_NRCopyLogObjectForNRUUID();
          uint64_t v16 = 1759;
          id v17 = [(NRLink *)self copyDescription];
          id v14 = "";
          uint64_t v15 = "-[NRLinkBluetooth suspend]";
          _NRLogWithArgs();
        }
      }
    }
    if (*(unsigned int *)((char *)&self->_handledUrgentLinkWriteBufferBytes + 3))
    {
      int v7 = (void *)_NRCopyLogObjectForNRUUID();
      int v8 = _NRLogIsLevelEnabled();

      if (v8)
      {
        id v9 = (void *)_NRCopyLogObjectForNRUUID();
        uint64_t v16 = 1767;
        id v17 = [(NRLink *)self copyDescription];
        id v14 = "";
        uint64_t v15 = "-[NRLinkBluetooth suspend]";
        _NRLogWithArgs();
      }
      self->_shouldSuspend = 1;
    }
    else
    {
      sub_1000819E8(self, 1);
    }
    [(NRLink *)self changeStateTo:9, @"(suspend)", v14, v15, v16, v17 details];
    int v12 = [(NRLink *)self linkDelegate];
    [v12 linkIsSuspended:self];
    goto LABEL_14;
  }
  int v10 = (void *)_NRCopyLogObjectForNRUUID();
  int v11 = _NRLogIsLevelEnabled();

  if (v11)
  {
    int v12 = (void *)_NRCopyLogObjectForNRUUID();
    id v18 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();

LABEL_14:
  }
  return 1;
}

- (BOOL)cancelWithReason:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v49 = &v51;
    id v5 = [objc_alloc((Class)NSString) initWithFormat:v4 arguments:&v51];
    if ([(NRLink *)self changeStateTo:255 details:v5])
    {
      if (self)
      {
        uint64_t v6 = *(unint64_t *)((char *)&self->_counterForDataStallRemediation + 7);
        if (v6)
        {
          *(void *)(v6 + 24) = *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_TCP_ECT0 + 7)
                               + *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_TCP_ECT0 + 7);
          uint64_t v6 = *(unint64_t *)((char *)&self->_counterForDataStallRemediation + 7);
        }
        if (v6)
        {
          *(void *)(v6 + 80) = *(unint64_t *)((char *)&self->_packetsToNexusBK + 7)
                               + *(unint64_t *)((char *)&self->_packetsToNexus + 7)
                               + *(unint64_t *)((char *)&self->_packetsToNexusVI + 7)
                               + *(unint64_t *)((char *)&self->_packetsToNexusVO + 7);
          uint64_t v7 = *(unint64_t *)((char *)&self->_counterForDataStallRemediation + 7);
          if (v7) {
            *(void *)(v7 + 88) = *(unint64_t *)((char *)&self->_bytesFromNexusBK + 7)
          }
                                 + *(unint64_t *)((char *)&self->_bytesFromNexus + 7)
                                 + *(unint64_t *)((char *)&self->_bytesFromNexusVI + 7)
                                 + *(unint64_t *)((char *)&self->_bytesFromNexusVO + 7);
        }
        [(NRLink *)self linkTotalReadyTimeInSec];
        uint64_t v9 = *(unint64_t *)((char *)&self->_counterForDataStallRemediation + 7);
        if (v9) {
          *(void *)(v9 + 16) = v8;
        }
      }
      else
      {
        [0 linkTotalReadyTimeInSec];
      }
      int v10 = [(NRLink *)self linkDelegate];
      [v10 linkIsUnavailable:self];

      int v11 = (void *)_NRCopyLogObjectForNRUUID();
      int IsLevelEnabled = _NRLogIsLevelEnabled();

      if (IsLevelEnabled)
      {
        id v13 = (void *)_NRCopyLogObjectForNRUUID();
        id v38 = [(NRLink *)self copyDescription];
        id v41 = v5;
        uint64_t v36 = 1714;
        v32 = "";
        id v34 = "-[NRLinkBluetooth cancelWithReason:]";
        _NRLogWithArgs();
      }
      id v44 = v5;
      id v43 = [(NRLinkBluetooth *)self copyStatusString];
      id v14 = [v43 componentsSeparatedByString:@"\n"];
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v15 = [v14 countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v46;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v46 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v45 + 1) + 8 * i);
            id v20 = (void *)_NRCopyLogObjectForNRUUID();
            int v21 = _NRLogIsLevelEnabled();

            if (v21)
            {
              int v22 = (void *)_NRCopyLogObjectForNRUUID();
              id v39 = [(NRLink *)self copyDescription];
              uint64_t v42 = v19;
              uint64_t v37 = 1718;
              v33 = "";
              v35 = "-[NRLinkBluetooth cancelWithReason:]";
              _NRLogWithArgs();
            }
          }
          id v16 = [v14 countByEnumeratingWithState:&v45 objects:v50 count:16];
        }
        while (v16);
      }
      [(NRLinkBluetooth *)self invalidateLink];
      [*(id *)((char *)&self->_counterForDataStallRemediation + 7) submit];
      long long v26 = (void *)_NRCopyLogObjectForNRUUID();
      int v27 = _NRLogIsLevelEnabled();

      if (v27)
      {
        long long v28 = (void *)_NRCopyLogObjectForNRUUID();
        id v40 = [(NRLink *)self copyDescription];
        _NRLogWithArgs();
      }
      id v5 = v44;
      id v25 = v43;
      goto LABEL_27;
    }
    id v23 = (void *)_NRCopyLogObjectForNRUUID();
    int v24 = _NRLogIsLevelEnabled();

    if (v24)
    {
      id v25 = (void *)_NRCopyLogObjectForNRUUID();
      id v14 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();
LABEL_27:
    }
  }
  else
  {
    id v30 = sub_100070988();
    int v31 = _NRLogIsLevelEnabled();

    if (!v31) {
      goto LABEL_29;
    }
    id v5 = sub_100070988();
    _NRLogWithArgs();
  }

LABEL_29:
  return v4 != 0;
}

- (unsigned)metric
{
  return 10;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"hostState"])
  {
    id v10 = v9;
    if (qword_1001F49E8 != -1) {
      dispatch_once(&qword_1001F49E8, &stru_1001C6E00);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F49E8 != -1) {
        dispatch_once(&qword_1001F49E8, &stru_1001C6E00);
      }
      id v11 = (id)qword_1001F49E0;
      id v12 = [v10 hostState];
      if ((unint64_t)v12 >= 3) {
        id v13 = [objc_alloc((Class)NSString) initWithFormat:@"Unknown(%lld)", v12];
      }
      else {
        id v13 = (id)*((void *)&off_1001C6E20 + (void)v12);
      }
      id v20 = v10;
      id v21 = v13;
      uint64_t v18 = 1659;
      id v19 = v8;
      id v16 = "";
      uint64_t v17 = "-[NRLinkBluetooth observeValueForKeyPath:ofObject:change:context:]";
      _NRLogWithArgs();
    }
    id v14 = [(NRLink *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100082C04;
    block[3] = &unk_1001C8840;
    block[4] = self;
    id v23 = v10;
    id v15 = v10;
    dispatch_async(v14, block);
  }
  else
  {
    if (qword_1001F49E8 != -1) {
      dispatch_once(&qword_1001F49E8, &stru_1001C6E00);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F49E8 != -1) {
        dispatch_once(&qword_1001F49E8, &stru_1001C6E00);
      }
      _NRLogWithArgs();
    }
  }
}

- (void)refreshCompanionProxyAgent
{
  if (self->super._state == 255)
  {
    id v4 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v7 = (id)_NRCopyLogObjectForNRUUID();
      id v6 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();
    }
  }
  else
  {
    companionProxyAgent = self->super._companionProxyAgent;
    sub_100064F74((uint64_t)companionProxyAgent);
  }
}

- (void)invalidateLink
{
  v3 = (void *)_NRCopyLogObjectForNRUUID();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    id v5 = (void *)_NRCopyLogObjectForNRUUID();
    uint64_t v79 = 1566;
    id v81 = [(NRLink *)self copyDescription];
    v75 = "";
    v77 = "-[NRLinkBluetooth invalidateLink]";
    _NRLogWithArgs();
  }
  v84.receiver = self;
  v84.super_class = (Class)NRLinkBluetooth;
  [(NRLink *)&v84 invalidateLink];
  id v6 = *(NSData **)((char *)&self->_localPublicClassAKeysEncryptedWithIDS + 7);
  if (v6)
  {
    free(v6);
    *(NSData **)((char *)&self->_localPublicClassAKeysEncryptedWithIDS + 7) = 0;
  }
  id v7 = *(void **)((char *)&self->_lastReadNexusOutputActivityCounter + 7);
  if (v7)
  {
    free(v7);
    *(unint64_t *)((char *)&self->_lastReadNexusOutputActivityCounter + 7) = 0;
  }
  if (self->_addedHostStateObserver)
  {
    id v8 = *(id *)((char *)&self->_bluetoothUUID + 7);
    id v9 = [v8 peer];
    [v9 removeObserver:self forKeyPath:@"hostState" context:0];

    self->_addedHostStateObserver = 0;
  }
  id v10 = *(NSObject **)((char *)&self->_nexusOutputRing + 7);
  if (v10)
  {
    if (self->_dNexusInputSourceSuspended)
    {
      self->_dNexusInputSourceSuspended = 0;
      ++*(OS_dispatch_group **)((char *)&self->_nexusGroup + 7);
      if (gNRPacketLoggingEnabled)
      {
        long long v45 = (void *)_NRCopyLogObjectForNRUUID();
        int v46 = _NRLogIsLevelEnabled();

        if (v46)
        {
          long long v47 = (void *)_NRCopyLogObjectForNRUUID();
          uint64_t v80 = 842;
          id v82 = [(NRLink *)self copyDescription];
          id v76 = "";
          int v78 = "NRLinkResumeNexusInputSource";
          _NRLogWithArgs();
        }
      }
      dispatch_resume(*(dispatch_object_t *)((char *)&self->_nexusOutputRing + 7));
      id v10 = *(NSObject **)((char *)&self->_nexusOutputRing + 7);
    }
    dispatch_source_cancel(v10);
    id v11 = *(channel_ring_desc **)((char *)&self->_nexusOutputRing + 7);
    *(channel_ring_desc **)((char *)&self->_nexusOutputRing + 7) = 0;
  }
  id v12 = *(NSObject **)((char *)&self->_dNexusInputSource + 7);
  if (v12)
  {
    if (self->_dNexusOutputSourceSuspended)
    {
      self->_dNexusOutputSourceSuspended = 0;
      ++*(unint64_t *)((char *)&self->_dNexusInputSourceActivityCounter + 7);
      if (gNRPacketLoggingEnabled)
      {
        long long v48 = (void *)_NRCopyLogObjectForNRUUID();
        int v49 = _NRLogIsLevelEnabled();

        if (v49)
        {
          id v50 = (void *)_NRCopyLogObjectForNRUUID();
          uint64_t v80 = 843;
          id v82 = [(NRLink *)self copyDescription];
          id v76 = "";
          int v78 = "NRLinkResumeNexusOutputSource";
          _NRLogWithArgs();
        }
      }
      dispatch_resume(*(dispatch_object_t *)((char *)&self->_dNexusInputSource + 7));
      id v12 = *(NSObject **)((char *)&self->_dNexusInputSource + 7);
    }
    dispatch_source_cancel(v12);
    id v13 = *(OS_dispatch_source **)((char *)&self->_dNexusInputSource + 7);
    *(OS_dispatch_source **)((char *)&self->_dNexusInputSource + 7) = 0;
  }
  if (*(NSData **)((char *)&self->_receivedPrelude + 7))
  {
    if (!*(OS_dispatch_source **)((char *)&self->_dNexusOutputSource + 7)) {
      os_channel_destroy();
    }
    *(NSData **)((char *)&self->_receivedPrelude + 7) = 0;
  }
  *(channel **)((char *)&self->_nexusChannel + 7) = 0;
  *(channel_ring_desc **)((char *)&self->_nexusInputRing + 7) = 0;
  id v14 = *(NSObject **)((char *)&self->_nexusVIOutputRing + 7);
  if (v14)
  {
    if (self->_dNexusVIInputSourceSuspended)
    {
      self->_dNexusVIInputSourceSuspended = 0;
      ++*(OS_dispatch_source **)((char *)&self->_dNexusVIOutputSource + 7);
      if (gNRPacketLoggingEnabled)
      {
        uint64_t v51 = (void *)_NRCopyLogObjectForNRUUID();
        int v52 = _NRLogIsLevelEnabled();

        if (v52)
        {
          int v53 = (void *)_NRCopyLogObjectForNRUUID();
          uint64_t v80 = 846;
          id v82 = [(NRLink *)self copyDescription];
          id v76 = "";
          int v78 = "NRLinkResumeNexusVIInputSource";
          _NRLogWithArgs();
        }
      }
      dispatch_resume(*(dispatch_object_t *)((char *)&self->_nexusVIOutputRing + 7));
      id v14 = *(NSObject **)((char *)&self->_nexusVIOutputRing + 7);
    }
    dispatch_source_cancel(v14);
    id v15 = *(channel_ring_desc **)((char *)&self->_nexusVIOutputRing + 7);
    *(channel_ring_desc **)((char *)&self->_nexusVIOutputRing + 7) = 0;
  }
  id v16 = *(NSObject **)((char *)&self->_dNexusVIInputSource + 7);
  if (v16)
  {
    if (self->_dNexusVIOutputSourceSuspended)
    {
      self->_dNexusVIOutputSourceSuspended = 0;
      ++*(unint64_t *)((char *)&self->_dNexusVIInputSourceActivityCounter + 7);
      if (gNRPacketLoggingEnabled)
      {
        id v54 = (void *)_NRCopyLogObjectForNRUUID();
        int v55 = _NRLogIsLevelEnabled();

        if (v55)
        {
          id v56 = (void *)_NRCopyLogObjectForNRUUID();
          uint64_t v80 = 847;
          id v82 = [(NRLink *)self copyDescription];
          id v76 = "";
          int v78 = "NRLinkResumeNexusVIOutputSource";
          _NRLogWithArgs();
        }
      }
      dispatch_resume(*(dispatch_object_t *)((char *)&self->_dNexusVIInputSource + 7));
      id v16 = *(NSObject **)((char *)&self->_dNexusVIInputSource + 7);
    }
    dispatch_source_cancel(v16);
    uint64_t v17 = *(OS_dispatch_source **)((char *)&self->_dNexusVIInputSource + 7);
    *(OS_dispatch_source **)((char *)&self->_dNexusVIInputSource + 7) = 0;
  }
  if (*(OS_dispatch_group **)((char *)&self->_nexusVIGroup + 7))
  {
    if (!*(unint64_t *)((char *)&self->_bytesToNexusVO + 7)) {
      os_channel_destroy();
    }
    *(OS_dispatch_group **)((char *)&self->_nexusVIGroup + 7) = 0;
  }
  *(channel **)((char *)&self->_nexusVIChannel + 7) = 0;
  *(channel_ring_desc **)((char *)&self->_nexusVIInputRing + 7) = 0;
  uint64_t v18 = *(NSObject **)((char *)&self->_nexusVOOutputRing + 7);
  if (v18)
  {
    if (self->_dNexusVOInputSourceSuspended)
    {
      self->_dNexusVOInputSourceSuspended = 0;
      ++*(OS_dispatch_source **)((char *)&self->_dNexusVOOutputSource + 7);
      if (gNRPacketLoggingEnabled)
      {
        unsigned int v57 = (void *)_NRCopyLogObjectForNRUUID();
        int v58 = _NRLogIsLevelEnabled();

        if (v58)
        {
          v59 = (void *)_NRCopyLogObjectForNRUUID();
          uint64_t v80 = 844;
          id v82 = [(NRLink *)self copyDescription];
          id v76 = "";
          int v78 = "NRLinkResumeNexusVOInputSource";
          _NRLogWithArgs();
        }
      }
      dispatch_resume(*(dispatch_object_t *)((char *)&self->_nexusVOOutputRing + 7));
      uint64_t v18 = *(NSObject **)((char *)&self->_nexusVOOutputRing + 7);
    }
    dispatch_source_cancel(v18);
    id v19 = *(channel_ring_desc **)((char *)&self->_nexusVOOutputRing + 7);
    *(channel_ring_desc **)((char *)&self->_nexusVOOutputRing + 7) = 0;
  }
  id v20 = *(NSObject **)((char *)&self->_dNexusVOInputSource + 7);
  if (v20)
  {
    if (self->_dNexusVOOutputSourceSuspended)
    {
      self->_dNexusVOOutputSourceSuspended = 0;
      ++*(unint64_t *)((char *)&self->_dNexusVOInputSourceActivityCounter + 7);
      if (gNRPacketLoggingEnabled)
      {
        uint64_t v60 = (void *)_NRCopyLogObjectForNRUUID();
        int v61 = _NRLogIsLevelEnabled();

        if (v61)
        {
          v62 = (void *)_NRCopyLogObjectForNRUUID();
          uint64_t v80 = 845;
          id v82 = [(NRLink *)self copyDescription];
          id v76 = "";
          int v78 = "NRLinkResumeNexusVOOutputSource";
          _NRLogWithArgs();
        }
      }
      dispatch_resume(*(dispatch_object_t *)((char *)&self->_dNexusVOInputSource + 7));
      id v20 = *(NSObject **)((char *)&self->_dNexusVOInputSource + 7);
    }
    dispatch_source_cancel(v20);
    id v21 = *(OS_dispatch_source **)((char *)&self->_dNexusVOInputSource + 7);
    *(OS_dispatch_source **)((char *)&self->_dNexusVOInputSource + 7) = 0;
  }
  if (*(OS_dispatch_group **)((char *)&self->_nexusVOGroup + 7))
  {
    if (!*(unint64_t *)((char *)&self->_bytesToNexus + 7)) {
      os_channel_destroy();
    }
    *(OS_dispatch_group **)((char *)&self->_nexusVOGroup + 7) = 0;
  }
  *(channel **)((char *)&self->_nexusVOChannel + 7) = 0;
  *(channel_ring_desc **)((char *)&self->_nexusVOInputRing + 7) = 0;
  int v22 = *(NSObject **)((char *)&self->_nexusBKOutputRing + 7);
  if (v22)
  {
    if (self->_dNexusBKInputSourceSuspended)
    {
      self->_dNexusBKInputSourceSuspended = 0;
      ++*(OS_dispatch_source **)((char *)&self->_dNexusBKOutputSource + 7);
      if (gNRPacketLoggingEnabled)
      {
        v63 = (void *)_NRCopyLogObjectForNRUUID();
        int v64 = _NRLogIsLevelEnabled();

        if (v64)
        {
          unsigned int v65 = (void *)_NRCopyLogObjectForNRUUID();
          uint64_t v80 = 848;
          id v82 = [(NRLink *)self copyDescription];
          id v76 = "";
          int v78 = "NRLinkResumeNexusBKInputSource";
          _NRLogWithArgs();
        }
      }
      dispatch_resume(*(dispatch_object_t *)((char *)&self->_nexusBKOutputRing + 7));
      int v22 = *(NSObject **)((char *)&self->_nexusBKOutputRing + 7);
    }
    dispatch_source_cancel(v22);
    id v23 = *(channel_ring_desc **)((char *)&self->_nexusBKOutputRing + 7);
    *(channel_ring_desc **)((char *)&self->_nexusBKOutputRing + 7) = 0;
  }
  int v24 = *(NSObject **)((char *)&self->_dNexusBKInputSource + 7);
  if (v24)
  {
    if (self->_dNexusBKOutputSourceSuspended)
    {
      self->_dNexusBKOutputSourceSuspended = 0;
      ++*(unint64_t *)((char *)&self->_dNexusBKInputSourceActivityCounter + 7);
      if (gNRPacketLoggingEnabled)
      {
        char v66 = (void *)_NRCopyLogObjectForNRUUID();
        int v67 = _NRLogIsLevelEnabled();

        if (v67)
        {
          int v68 = (void *)_NRCopyLogObjectForNRUUID();
          uint64_t v80 = 849;
          id v82 = [(NRLink *)self copyDescription];
          id v76 = "";
          int v78 = "NRLinkResumeNexusBKOutputSource";
          _NRLogWithArgs();
        }
      }
      dispatch_resume(*(dispatch_object_t *)((char *)&self->_dNexusBKInputSource + 7));
      int v24 = *(NSObject **)((char *)&self->_dNexusBKInputSource + 7);
    }
    dispatch_source_cancel(v24);
    id v25 = *(OS_dispatch_source **)((char *)&self->_dNexusBKInputSource + 7);
    *(OS_dispatch_source **)((char *)&self->_dNexusBKInputSource + 7) = 0;
  }
  if (*(OS_dispatch_group **)((char *)&self->_nexusBKGroup + 7))
  {
    if (!*(unint64_t *)((char *)&self->_bytesToNexusVI + 7)) {
      os_channel_destroy();
    }
    *(OS_dispatch_group **)((char *)&self->_nexusBKGroup + 7) = 0;
  }
  *(channel **)((char *)&self->_nexusBKChannel + 7) = 0;
  *(channel_ring_desc **)((char *)&self->_nexusBKInputRing + 7) = 0;
  long long v26 = *(NSObject **)((char *)&self->_linkOutputRing + 7);
  if (v26)
  {
    if (self->_dLinkInputSourceSuspended)
    {
      self->_dLinkInputSourceSuspended = 0;
      ++*(OS_dispatch_source **)((char *)&self->_dLinkOutputSource + 7);
      if (gNRPacketLoggingEnabled)
      {
        v69 = (void *)_NRCopyLogObjectForNRUUID();
        int v70 = _NRLogIsLevelEnabled();

        if (v70)
        {
          v71 = (void *)_NRCopyLogObjectForNRUUID();
          uint64_t v80 = 822;
          id v82 = [(NRLink *)self copyDescription];
          id v76 = "";
          int v78 = "NRLinkResumeLinkInputSource";
          _NRLogWithArgs();
        }
      }
      dispatch_resume(*(dispatch_object_t *)((char *)&self->_linkOutputRing + 7));
      long long v26 = *(NSObject **)((char *)&self->_linkOutputRing + 7);
    }
    dispatch_source_cancel(v26);
    int v27 = *(channel_ring_desc **)((char *)&self->_linkOutputRing + 7);
    *(channel_ring_desc **)((char *)&self->_linkOutputRing + 7) = 0;
  }
  long long v28 = *(NSObject **)((char *)&self->_dLinkInputSource + 7);
  if (v28)
  {
    if (self->_dLinkOutputSourceSuspended)
    {
      self->_dLinkOutputSourceSuspended = 0;
      ++*(unint64_t *)((char *)&self->_dLinkInputSourceActivityCounter + 7);
      if (gNRPacketLoggingEnabled)
      {
        int v72 = (void *)_NRCopyLogObjectForNRUUID();
        int v73 = _NRLogIsLevelEnabled();

        if (v73)
        {
          v74 = (void *)_NRCopyLogObjectForNRUUID();
          uint64_t v80 = 823;
          id v82 = [(NRLink *)self copyDescription];
          id v76 = "";
          int v78 = "NRLinkResumeLinkOutputSource";
          _NRLogWithArgs();
        }
      }
      dispatch_resume(*(dispatch_object_t *)((char *)&self->_dLinkInputSource + 7));
      long long v28 = *(NSObject **)((char *)&self->_dLinkInputSource + 7);
    }
    dispatch_source_cancel(v28);
    v29 = *(OS_dispatch_source **)((char *)&self->_dLinkInputSource + 7);
    *(OS_dispatch_source **)((char *)&self->_dLinkInputSource + 7) = 0;
  }
  id v30 = *(NSObject **)((char *)&self->_lastWrittenUrgentLink + 7);
  if (v30)
  {
    dispatch_source_cancel(v30);
    int v31 = *(NSDate **)((char *)&self->_lastWrittenUrgentLink + 7);
    *(NSDate **)((char *)&self->_lastWrittenUrgentLink + 7) = 0;
  }
  *(unint64_t *)((char *)&self->_writeCounter + 7) = 0;
  *(channel **)((char *)&self->_linkChannel + 7) = 0;
  *(channel_ring_desc **)((char *)&self->_linkInputRing + 7) = 0;
  v32 = *(void **)((char *)&self->_linkLogToken + 7);
  if (v32)
  {
    free(v32);
    *(unint64_t *)((char *)&self->_linkLogToken + 7) = 0;
  }
  v33 = *(void **)((char *)&self->_ntlLogToken + 7);
  if (v33)
  {
    free(v33);
    *(unint64_t *)((char *)&self->_ntlLogToken + 7) = 0;
  }
  -[NRLink setVirtualInterface:](self, "setVirtualInterface:", 0, v76, v78, v80, v82);
  id v34 = *(NSMutableData **)((char *)&self->_linkOutgoingData + 7);
  if (v34)
  {
    [v34 setAvailability:0];
    [*(id *)((char *)&self->_linkOutgoingData + 7) cancel];
    v35 = *(NSMutableData **)((char *)&self->_linkOutgoingData + 7);
    *(NSMutableData **)((char *)&self->_linkOutgoingData + 7) = 0;
  }
  uint64_t v36 = *(NEIPsecNexus **)((char *)&self->_dummyPacketNexus + 7);
  *(NEIPsecNexus **)((char *)&self->_dummyPacketNexus + 7) = 0;

  uint64_t v37 = *(NSUUID **)((char *)&self->_bluetoothUUID + 7);
  *(NSUUID **)((char *)&self->_bluetoothUUID + 7) = 0;

  sub_100083B0C((uint64_t)self, 0);
  sub_100084BC8((char *)self, 0);
  [(NRLinkBluetooth *)self invalidateIKESessionForClass:4];
  [(NRLinkBluetooth *)self invalidateIKESessionForClass:3];
  [(NRLinkBluetooth *)self invalidateIKESessionForClass:1];
  [(NRLink *)self invalidateIKESession:(char *)&self->_ikeSessionClassA + 7];
  id v38 = *(NSMutableArray **)((char *)&self->_latencyContexts + 7);
  if (v38)
  {
    [v38 cancel];
    id v39 = *(NSMutableArray **)((char *)&self->_latencyContexts + 7);
    *(NSMutableArray **)((char *)&self->_latencyContexts + 7) = 0;
  }
  companionProxyAgent = self->super._companionProxyAgent;
  if (companionProxyAgent)
  {
    sub_1000638F4((uint64_t)companionProxyAgent);
    id v41 = self->super._companionProxyAgent;
    self->super._companionProxyAgent = 0;
  }
  uint64_t v42 = (void *)_NRCopyLogObjectForNRUUID();
  int v43 = _NRLogIsLevelEnabled();

  if (v43)
  {
    id v44 = (void *)_NRCopyLogObjectForNRUUID();
    id v83 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();
  }
}

- (void)invalidateIKESessionForClass:(unsigned __int8)a3
{
  int v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NRLinkBluetooth;
  -[NRLink invalidateIKESessionForClass:](&v5, "invalidateIKESessionForClass:");
  [(NRLink *)self invalidateIKESession:sub_1000790B8((uint64_t)self, v3)];
}

- (BOOL)start
{
  objc_super v5 = (char *)self;
  if (self->super._state == 8)
  {
    id v6 = [(NRLink *)self linkDelegate];
    [v6 linkIsReady:v5];

    LOBYTE(v5) = 1;
    return (char)v5;
  }
  if ([(NRLink *)self state] != 9)
  {
    if (v5[16] >= 2u)
    {
      if (qword_1001F49E8 != -1) {
        dispatch_once(&qword_1001F49E8, &stru_1001C6E00);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F49E8 != -1) {
          dispatch_once(&qword_1001F49E8, &stru_1001C6E00);
        }
        _NRLogWithArgs();
        LOBYTE(v5) = 0;
      }
      else
      {
        LOBYTE(v5) = 0;
      }
      return (char)v5;
    }
    [v5 reportEvent:3001];
    [v5 updateIKEv2Role:0];
    id v8 = [v5 queue];

    if (v8)
    {
      uint64_t v9 = (uint64_t)&OBJC_IVAR___NRLinkQuickRelay__receivedDatagrams;
      if (*(void *)(v5 + 335))
      {
        if (*(void *)(v5 + 327))
        {
          if (*(void *)(v5 + 343))
          {
            if ([v5 ikev2Role] == 2 || objc_msgSend(v5, "ikev2Role") == 1)
            {
              unsigned int v10 = [v5 ikev2Role];
              uint64_t v11 = 255;
              if (v10 != 1) {
                uint64_t v11 = 0;
              }
              memptr[0] = (void *)(0x101010101010101 * v11);
              memptr[1] = 0;
              arc4random_buf(&memptr[1], 8uLL);
              id v12 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:memptr];
            }
            else
            {
              id v12 = +[NSUUID UUID];
            }
            id v13 = *(void **)(v5 + 1359);
            *(void *)(v5 + 1359) = v12;

            id v14 = *(void **)(v5 + 1367);
            *(void *)(v5 + 1367) = &stru_1001C9648;

            uint64_t v15 = *(unsigned int *)(v5 + 263);
            if (v15)
            {
              id v16 = malloc_type_malloc(*(unsigned int *)(v5 + 263), 0xA172743EuLL);
              if (!v16) {
                goto LABEL_87;
              }
              *(void *)(v5 + 1311) = v16;
              *(_DWORD *)(v5 + 311) = 0;
              *(_DWORD *)(v5 + 315) = 0;
              if (gNRPacketLoggingEnabled)
              {
                v96 = (void *)_NRCopyLogObjectForNRUUID();
                int IsLevelEnabled = _NRLogIsLevelEnabled();

                if (IsLevelEnabled)
                {
                  int v98 = (void *)_NRCopyLogObjectForNRUUID();
                  id v222 = [v5 copyDescription];
                  _NRLogWithArgs();
                }
              }
              uint64_t v17 = 279;
              uint64_t v15 = *(unsigned int *)(v5 + 279);
              if (v15)
              {
                uint64_t v18 = malloc_type_malloc(*(unsigned int *)(v5 + 279), 0xA172743EuLL);
                if (v18)
                {
                  uint64_t v2 = 447;
                  *(void *)(v5 + 447) = v18;
                  uint64_t v3 = 287;
                  *(_DWORD *)(v5 + 287) = 0;
                  uint64_t v4 = 291;
                  *(_DWORD *)(v5 + 291) = 0;
                  if (gNRPacketLoggingEnabled)
                  {
                    id v99 = (void *)_NRCopyLogObjectForNRUUID();
                    int v100 = _NRLogIsLevelEnabled();

                    if (v100)
                    {
                      id v101 = (void *)_NRCopyLogObjectForNRUUID();
                      id v223 = [v5 copyDescription];
                      _NRLogWithArgs();
                    }
                  }
                  id v19 = objc_alloc_init((Class)NSMutableArray);
                  id v20 = *(void **)(v5 + 1199);
                  *(void *)(v5 + 1199) = v19;

                  v5[250] = 10;
                  memptr[0] = 0;
                  if (malloc_type_posix_memalign(memptr, 8uLL, 0x50uLL, 0xD5FEC036uLL) || !memptr[0])
                  {
                    id v102 = sub_100070988();
                    int v103 = _NRLogIsLevelEnabled();

                    if (v103)
                    {
                      id v104 = sub_100070988();
                      _NRLogWithArgs();
                    }
                  }
                  else
                  {
                    *(void **)(v5 + 1879) = memptr[0];
                    v5[256] = 10;
                    memptr[0] = 0;
                    if (!malloc_type_posix_memalign(memptr, 8uLL, 0x50uLL, 0xD5FEC036uLL) && memptr[0])
                    {
                      *(void **)(v5 + 1927) = memptr[0];
                      id v21 = *(id *)(v5 + 335);
                      uint64_t v15 = (uint64_t)v21;
                      uint64_t v22 = 246;
                      if (v5[246])
                      {
                        while (1)
                        {
                          uint64_t v248 = v4;
                          uint64_t v4 = v3;
                          uint64_t v250 = v22;
                          uint64_t v249 = v15;
                          uint64_t v3 = (uint64_t)v245;
                          uint64_t v9 = v5[208];
                          id v23 = v5;
                          int v24 = (char *)malloc_type_malloc(0x21uLL, 0xA172743EuLL);
                          if (v24)
                          {
                            id v25 = v24;
                            *(void *)int v24 = 0x53554E494D524554;
                            v24[8] = 1;
                            v24[9] = v9;
                            *((_WORD *)v24 + 5) = 4864;
                            v24[12] = 4;
                            *(_WORD *)(v24 + 13) = 4096;
                            memptr[0] = 0;
                            memptr[1] = 0;
                            [*(id *)(v5 + 1359) getUUIDBytes:memptr];
                            *(_OWORD *)(v25 + 15) = *(_OWORD *)memptr;
                            *(_WORD *)(v25 + 31) = ~(unsigned __int16)os_inet_checksum();

                            if (*(_DWORD *)&v5[v17] > 0x20u)
                            {
                              if (*(void *)(v23 + 351))
                              {
                                long long v26 = (void *)_NRCopyLogObjectForNRUUID();
                                int v27 = _NRLogIsLevelEnabled();

                                if (v27)
                                {
                                  long long v28 = (void *)_NRCopyLogObjectForNRUUID();
                                  id v240 = [v23 copyDescription];
                                  _NRLogWithArgs();
                                }
                              }
                              id v29 = [objc_alloc((Class)NSData) initWithBytes:v25 length:33];
                              id v30 = *(void **)(v23 + 351);
                              *(void *)(v23 + 351) = v29;

                              uint64_t v31 = *(void *)&v5[v2];
                              long long v32 = *(_OWORD *)v25;
                              long long v33 = *((_OWORD *)v25 + 1);
                              *(unsigned char *)(v31 + 32) = v25[32];
                              *(_OWORD *)uint64_t v31 = v32;
                              *(_OWORD *)(v31 + 16) = v33;
                              free(v25);
                              *(_DWORD *)&v5[v4] += 33;
                              id v34 = (void *)_NRCopyLogObjectForNRUUID();
                              int v35 = _NRLogIsLevelEnabled();

                              if (v35)
                              {
                                uint64_t v36 = (void *)_NRCopyLogObjectForNRUUID();
                                id v37 = [v23 copyDescription];
                                v242 = (void *)_NRCreateDataString();
                                _NRLogWithArgs();
                              }
                              [v23 changeStateTo:2];
                              id v38 = (void *)_NRCopyLogObjectForNRUUID();
                              int v39 = _NRLogIsLevelEnabled();

                              if (v39)
                              {
                                id v40 = (void *)_NRCopyLogObjectForNRUUID();
                                id v243 = [v23 copyDescription];
                                _NRLogWithArgs();
                              }
                              if (v5[v250]) {
                                sub_10007120C((uint64_t)v23, *(void **)(v23 + 351), &off_1001D4948);
                              }
                              id v41 = (void *)_NRCopyLogObjectForNRUUID();
                              int v42 = _NRLogIsLevelEnabled();

                              if (v42)
                              {
                                int v43 = (void *)_NRCopyLogObjectForNRUUID();
                                id v244 = [v23 copyDescription];
                                _NRLogWithArgs();
                              }
                              id v44 = *((void *)v23 + 1);
                              block[0] = _NSConcreteStackBlock;
                              block[1] = 3221225472;
                              block[2] = sub_1000A5464;
                              block[3] = &unk_1001C8BA8;
                              block[4] = v23;
                              dispatch_async(v44, block);
                              if (!v23[211])
                              {
                                id v45 = *(id *)(v23 + 335);
                                int v46 = [v45 peer];
                                [v46 addObserver:v23 forKeyPath:@"hostState" options:5 context:0];

                                v23[211] = 1;
                              }
                              LOBYTE(v5) = 1;
                              uint64_t v15 = v249;
                              goto LABEL_202;
                            }
                            id v148 = sub_100070988();
                            int v149 = _NRLogIsLevelEnabled();

                            if (v149)
                            {
                              id v150 = sub_100070988();
                              _NRLogWithArgs();
                            }
                            uint64_t v15 = _os_log_pack_size();
                            objc_super v5 = (char *)v245 - ((__chkstk_darwin(v15) + 15) & 0xFFFFFFFFFFFFFFF0);
                            __error();
                            uint64_t v151 = _os_log_pack_fill();
                            *(_DWORD *)uint64_t v151 = 136446466;
                            *(void *)(v151 + 4) = "-[NRLinkBluetooth start]";
                            *(_WORD *)(v151 + 12) = 1024;
                            *(_DWORD *)(v151 + 14) = 33;
                          }
                          else
                          {
                            id v109 = sub_100070988();
                            int v110 = _NRLogIsLevelEnabled();

                            if (v110)
                            {
                              id v111 = sub_100070988();
                              _NRLogWithArgs();
                            }
                            uint64_t v15 = _os_log_pack_size();
                            objc_super v5 = (char *)v245 - ((__chkstk_darwin(v15) + 15) & 0xFFFFFFFFFFFFFFF0);
                            __error();
                            uint64_t v112 = _os_log_pack_fill();
                            *(_DWORD *)uint64_t v112 = 136446466;
                            *(void *)(v112 + 4) = "strict_malloc";
                            *(_WORD *)(v112 + 12) = 2048;
                            *(void *)(v112 + 14) = 33;
                          }
LABEL_116:
                          sub_100070988();
                          _NRLogAbortWithPack();
LABEL_117:
                          int v113 = _NRLogIsLevelEnabled();

                          if (v113)
                          {
                            v114 = (void *)_NRCopyLogObjectForNRUUID();
                            id v224 = [v5 copyDescription];
                            _NRLogWithArgs();
                          }
                          memptr[0] = 0;
                          int v115 = os_channel_attr_get();
                          v116 = (void *)_NRCopyLogObjectForNRUUID();
                          if (v115)
                          {
                            int v117 = _NRLogIsLevelEnabled();

                            if (!v117) {
                              goto LABEL_201;
                            }
                            goto LABEL_199;
                          }
                          int v118 = _NRLogIsLevelEnabled();

                          if (v118)
                          {
                            v119 = (void *)_NRCopyLogObjectForNRUUID();
                            id v225 = [v5 copyDescription];
                            _NRLogWithArgs();
                          }
                          memptr[0] = 0;
                          int v120 = os_channel_attr_get();
                          int v121 = (void *)_NRCopyLogObjectForNRUUID();
                          if (v120)
                          {
                            int v122 = _NRLogIsLevelEnabled();

                            if (!v122) {
                              goto LABEL_201;
                            }
                            goto LABEL_199;
                          }
                          int v123 = _NRLogIsLevelEnabled();

                          if (v123)
                          {
                            id v124 = (void *)_NRCopyLogObjectForNRUUID();
                            id v226 = [v5 copyDescription];
                            _NRLogWithArgs();
                          }
                          memptr[0] = 0;
                          int v125 = os_channel_attr_get();
                          id v126 = (void *)_NRCopyLogObjectForNRUUID();
                          if (v125)
                          {
                            int v127 = _NRLogIsLevelEnabled();

                            if (!v127) {
                              goto LABEL_201;
                            }
                            goto LABEL_199;
                          }
                          int v128 = _NRLogIsLevelEnabled();

                          if (v128)
                          {
                            int v129 = (void *)_NRCopyLogObjectForNRUUID();
                            id v227 = [v5 copyDescription];
                            _NRLogWithArgs();
                          }
                          memptr[0] = 0;
                          int v130 = os_channel_attr_get();
                          v131 = (void *)_NRCopyLogObjectForNRUUID();
                          if (v130)
                          {
                            int v132 = _NRLogIsLevelEnabled();

                            if (!v132) {
                              goto LABEL_201;
                            }
                            goto LABEL_199;
                          }
                          int v133 = _NRLogIsLevelEnabled();

                          if (v133)
                          {
                            uint64_t v134 = (void *)_NRCopyLogObjectForNRUUID();
                            id v228 = [v5 copyDescription];
                            _NRLogWithArgs();
                          }
                          memptr[0] = 0;
                          int v135 = os_channel_attr_get();
                          id v136 = (void *)_NRCopyLogObjectForNRUUID();
                          if (v135)
                          {
                            int v137 = _NRLogIsLevelEnabled();

                            if (!v137) {
                              goto LABEL_201;
                            }
                            goto LABEL_199;
                          }
                          int v138 = _NRLogIsLevelEnabled();

                          if (v138)
                          {
                            id v139 = (void *)_NRCopyLogObjectForNRUUID();
                            id v229 = [v5 copyDescription];
                            _NRLogWithArgs();
                          }
                          memptr[0] = 0;
                          int v140 = os_channel_attr_get();
                          id v141 = (void *)_NRCopyLogObjectForNRUUID();
                          if (v140)
                          {
                            int v142 = _NRLogIsLevelEnabled();

                            if (!v142) {
                              goto LABEL_201;
                            }
                            goto LABEL_199;
                          }
                          int v143 = _NRLogIsLevelEnabled();

                          if (v143)
                          {
                            unsigned __int8 v144 = (void *)_NRCopyLogObjectForNRUUID();
                            id v230 = [v5 copyDescription];
                            _NRLogWithArgs();
                          }
                          memptr[0] = 0;
                          int v145 = os_channel_attr_get();
                          v146 = (void *)_NRCopyLogObjectForNRUUID();
                          if (v145)
                          {
                            int v147 = _NRLogIsLevelEnabled();

                            if (!v147) {
                              goto LABEL_201;
                            }
                            goto LABEL_199;
                          }
                          int v152 = _NRLogIsLevelEnabled();

                          if (v152)
                          {
                            v153 = (void *)_NRCopyLogObjectForNRUUID();
                            id v231 = [v5 copyDescription];
                            _NRLogWithArgs();
                          }
                          memptr[0] = 0;
                          int v154 = os_channel_attr_get();
                          id v155 = (void *)_NRCopyLogObjectForNRUUID();
                          if (v154)
                          {
                            int v156 = _NRLogIsLevelEnabled();

                            if (!v156) {
                              goto LABEL_201;
                            }
                            goto LABEL_199;
                          }
                          int v157 = _NRLogIsLevelEnabled();

                          if (v157)
                          {
                            v158 = (void *)_NRCopyLogObjectForNRUUID();
                            id v232 = [v5 copyDescription];
                            _NRLogWithArgs();
                          }
                          memptr[0] = 0;
                          int v159 = os_channel_attr_get();
                          v160 = (void *)_NRCopyLogObjectForNRUUID();
                          if (v159)
                          {
                            int v161 = _NRLogIsLevelEnabled();

                            if (!v161) {
                              goto LABEL_201;
                            }
                            goto LABEL_199;
                          }
                          int v162 = _NRLogIsLevelEnabled();

                          if (v162)
                          {
                            v163 = (void *)_NRCopyLogObjectForNRUUID();
                            id v233 = [v5 copyDescription];
                            _NRLogWithArgs();
                          }
                          memptr[0] = 0;
                          int v164 = os_channel_attr_get();
                          v165 = (void *)_NRCopyLogObjectForNRUUID();
                          if (v164)
                          {
                            int v166 = _NRLogIsLevelEnabled();

                            if (!v166) {
                              goto LABEL_201;
                            }
                            goto LABEL_199;
                          }
                          int v167 = _NRLogIsLevelEnabled();

                          if (v167)
                          {
                            v168 = (void *)_NRCopyLogObjectForNRUUID();
                            id v234 = [v5 copyDescription];
                            _NRLogWithArgs();
                          }
                          memptr[0] = 0;
                          int v169 = os_channel_attr_get();
                          v170 = (void *)_NRCopyLogObjectForNRUUID();
                          if (v169)
                          {
                            int v171 = _NRLogIsLevelEnabled();

                            if (!v171) {
                              goto LABEL_201;
                            }
                            goto LABEL_199;
                          }
                          int v172 = _NRLogIsLevelEnabled();

                          if (v172)
                          {
                            v173 = (void *)_NRCopyLogObjectForNRUUID();
                            id v235 = [v5 copyDescription];
                            _NRLogWithArgs();
                          }
                          memptr[0] = 0;
                          int v174 = os_channel_attr_get();
                          v175 = (void *)_NRCopyLogObjectForNRUUID();
                          if (v174)
                          {
                            int v176 = _NRLogIsLevelEnabled();

                            if (!v176) {
                              goto LABEL_201;
                            }
                            goto LABEL_199;
                          }
                          int v177 = _NRLogIsLevelEnabled();

                          if (v177)
                          {
                            v178 = (void *)_NRCopyLogObjectForNRUUID();
                            id v236 = [v5 copyDescription];
                            _NRLogWithArgs();
                          }
                          memptr[0] = 0;
                          int v179 = os_channel_attr_get();
                          v180 = (void *)_NRCopyLogObjectForNRUUID();
                          if (v179)
                          {
                            int v181 = _NRLogIsLevelEnabled();

                            if (!v181) {
                              goto LABEL_201;
                            }
                            goto LABEL_199;
                          }
                          int v182 = _NRLogIsLevelEnabled();

                          if (v182)
                          {
                            v183 = (void *)_NRCopyLogObjectForNRUUID();
                            id v237 = [v5 copyDescription];
                            _NRLogWithArgs();
                          }
                          memptr[0] = 0;
                          int v184 = os_channel_attr_get();
                          v185 = (void *)_NRCopyLogObjectForNRUUID();
                          if (v184)
                          {
                            int v186 = _NRLogIsLevelEnabled();

                            if (!v186) {
                              goto LABEL_201;
                            }
                            goto LABEL_199;
                          }
                          int v187 = _NRLogIsLevelEnabled();

                          if (v187)
                          {
                            v188 = (void *)_NRCopyLogObjectForNRUUID();
                            id v238 = [v5 copyDescription];
                            _NRLogWithArgs();
                          }
                          memptr[0] = 0;
                          int v189 = os_channel_attr_get();
                          v190 = (void *)_NRCopyLogObjectForNRUUID();
                          if (v189)
                          {
                            int v191 = _NRLogIsLevelEnabled();

                            if (!v191) {
                              goto LABEL_201;
                            }
                            goto LABEL_199;
                          }
                          int v192 = _NRLogIsLevelEnabled();

                          if (v192)
                          {
                            v193 = (void *)_NRCopyLogObjectForNRUUID();
                            id v239 = [v5 copyDescription];
                            _NRLogWithArgs();
                          }
                          memptr[0] = 0;
                          if (os_channel_attr_get())
                          {
                            v194 = (void *)_NRCopyLogObjectForNRUUID();
                            int v195 = _NRLogIsLevelEnabled();

                            if (!v195) {
                              goto LABEL_201;
                            }
                            goto LABEL_199;
                          }
                          if (os_channel_attr_set()) {
                            break;
                          }
                          if (os_channel_write_attr())
                          {
                            v198 = (void *)_NRCopyLogObjectForNRUUID();
                            int v199 = _NRLogIsLevelEnabled();

                            if (v199) {
                              goto LABEL_199;
                            }
                            goto LABEL_201;
                          }
                          os_channel_attr_destroy();
                          v200 = (void *)_NRCopyLogObjectForNRUUID();
                          int v201 = _NRLogIsLevelEnabled();

                          if (v201)
                          {
                            v202 = (void *)_NRCopyLogObjectForNRUUID();
                            id v203 = [v5 copyDescription];
                            _NRLogWithArgs();
                          }
                          uintptr_t v204 = v247;
                          dispatch_source_t v205 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v247, 0, *((dispatch_queue_t *)v5 + 1));
                          v206 = *(void **)(v5 + 983);
                          *(void *)(v5 + 983) = v205;

                          v207 = *(NSObject **)(v5 + 983);
                          if (!v207)
                          {
                            v214 = (void *)_NRCopyLogObjectForNRUUID();
                            int v215 = _NRLogIsLevelEnabled();

                            if (v215) {
                              goto LABEL_199;
                            }
                            goto LABEL_201;
                          }
                          handler[0] = _NSConcreteStackBlock;
                          handler[1] = 3221225472;
                          handler[2] = sub_1000A4FA8;
                          handler[3] = &unk_1001C8BA8;
                          handler[4] = v5;
                          dispatch_source_set_event_handler(v207, handler);
                          v208 = *(NSObject **)(v5 + 983);
                          v255[0] = _NSConcreteStackBlock;
                          v255[1] = 3221225472;
                          v255[2] = nullsub_10;
                          v255[3] = &unk_1001C8BA8;
                          id v209 = (id)v15;
                          id v256 = v209;
                          dispatch_source_set_cancel_handler(v208, v255);
                          dispatch_activate(*(dispatch_object_t *)(v5 + 983));
                          dispatch_source_t v210 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_write, v204, 0, *((dispatch_queue_t *)v5 + 1));
                          v211 = *(void **)(v5 + 991);
                          *(void *)(v5 + 991) = v210;

                          v212 = *(NSObject **)(v5 + 991);
                          if (!v212)
                          {
                            v216 = (void *)_NRCopyLogObjectForNRUUID();
                            int v217 = _NRLogIsLevelEnabled();

                            if (v217)
                            {
                              v218 = (void *)_NRCopyLogObjectForNRUUID();
                              id v241 = [v5 copyDescription];
                              _NRLogWithArgs();
                            }
                            goto LABEL_201;
                          }
                          v254[0] = _NSConcreteStackBlock;
                          v254[1] = 3221225472;
                          v254[2] = sub_1000A5204;
                          v254[3] = &unk_1001C8BA8;
                          v254[4] = v5;
                          dispatch_source_set_event_handler(v212, v254);
                          v213 = *(NSObject **)(v5 + 991);
                          v252[0] = _NSConcreteStackBlock;
                          v252[1] = 3221225472;
                          v252[2] = nullsub_11;
                          v252[3] = &unk_1001C8BA8;
                          id v253 = v209;
                          dispatch_source_set_cancel_handler(v213, v252);
                          v5[222] = 1;

                          uint64_t v22 = v250;
                          uint64_t v17 = v246;
                        }
                        v196 = (void *)_NRCopyLogObjectForNRUUID();
                        int v197 = _NRLogIsLevelEnabled();

                        if (v197)
                        {
LABEL_199:
                          unsigned int v65 = (void *)_NRCopyLogObjectForNRUUID();
                          id v66 = [v5 copyDescription];
                          goto LABEL_200;
                        }
                        goto LABEL_201;
                      }
                      id v47 = [v21 channel];
                      *(void *)(v5 + 959) = v47;
                      if (!v47)
                      {
                        int v55 = (void *)_NRCopyLogObjectForNRUUID();
                        int v56 = _NRLogIsLevelEnabled();

                        if (!v56) {
                          goto LABEL_201;
                        }
                        goto LABEL_70;
                      }
                      os_channel_ring_id();
                      uint64_t v48 = os_channel_rx_ring();
                      *(void *)(v5 + 967) = v48;
                      if (!v48)
                      {
                        unsigned int v57 = (void *)_NRCopyLogObjectForNRUUID();
                        int v58 = _NRLogIsLevelEnabled();

                        if (!v58) {
                          goto LABEL_201;
                        }
                        goto LABEL_70;
                      }
                      os_channel_ring_id();
                      uint64_t v49 = os_channel_tx_ring();
                      *(void *)(v5 + 975) = v49;
                      if (!v49)
                      {
                        v59 = (void *)_NRCopyLogObjectForNRUUID();
                        int v60 = _NRLogIsLevelEnabled();

                        if (!v60) {
                          goto LABEL_201;
                        }
                        goto LABEL_70;
                      }
                      unsigned int fd = os_channel_get_fd();
                      if ((fd & 0x80000000) != 0)
                      {
                        int v61 = (void *)_NRCopyLogObjectForNRUUID();
                        int v62 = _NRLogIsLevelEnabled();

                        if (!v62) {
                          goto LABEL_201;
                        }
                        goto LABEL_70;
                      }
                      unsigned int v247 = fd;
                      uint64_t v51 = os_channel_attr_create();
                      if (!v51)
                      {
                        v63 = (void *)_NRCopyLogObjectForNRUUID();
                        int v64 = _NRLogIsLevelEnabled();

                        if (!v64) {
                          goto LABEL_201;
                        }
                        goto LABEL_70;
                      }
                      uint64_t v52 = v51;
                      uint64_t v246 = 279;
                      if (os_channel_read_attr())
                      {
                        int v53 = (void *)_NRCopyLogObjectForNRUUID();
                        int v54 = _NRLogIsLevelEnabled();

                        if (!v54) {
                          goto LABEL_201;
                        }
LABEL_70:
                        unsigned int v65 = (void *)_NRCopyLogObjectForNRUUID();
                        id v66 = [v5 copyDescription];
LABEL_200:
                        _NRLogWithArgs();

LABEL_201:
                        LOBYTE(v5) = 0;
LABEL_202:

                        return (char)v5;
                      }
                      uint64_t v250 = 246;
                      memptr[0] = 0;
                      int v67 = os_channel_attr_get();
                      int v68 = (void *)_NRCopyLogObjectForNRUUID();
                      if (v67)
                      {
                        int v69 = _NRLogIsLevelEnabled();

                        if (!v69) {
                          goto LABEL_201;
                        }
                        goto LABEL_70;
                      }
                      v245[1] = v52;
                      int v70 = _NRLogIsLevelEnabled();

                      if (v70)
                      {
                        v71 = (void *)_NRCopyLogObjectForNRUUID();
                        id v219 = [v5 copyDescription];
                        _NRLogWithArgs();
                      }
                      memptr[0] = 0;
                      int v72 = os_channel_attr_get();
                      int v73 = (void *)_NRCopyLogObjectForNRUUID();
                      if (v72)
                      {
                        int v74 = _NRLogIsLevelEnabled();

                        if (!v74) {
                          goto LABEL_201;
                        }
                        goto LABEL_70;
                      }
                      int v75 = _NRLogIsLevelEnabled();

                      if (v75)
                      {
                        id v76 = (void *)_NRCopyLogObjectForNRUUID();
                        id v220 = [v5 copyDescription];
                        _NRLogWithArgs();
                      }
                      memptr[0] = 0;
                      int v77 = os_channel_attr_get();
                      uint64_t v9 = _NRCopyLogObjectForNRUUID();
                      if (v77)
                      {
                        int v78 = _NRLogIsLevelEnabled();

                        if (!v78) {
                          goto LABEL_201;
                        }
                        goto LABEL_70;
                      }
LABEL_90:
                      int v87 = _NRLogIsLevelEnabled();

                      if (v87)
                      {
                        unsigned int v88 = (void *)_NRCopyLogObjectForNRUUID();
                        id v221 = [v5 copyDescription];
                        _NRLogWithArgs();
                      }
                      memptr[0] = 0;
                      int v89 = os_channel_attr_get();
                      uint64_t v9 = _NRCopyLogObjectForNRUUID();
                      if (!v89) {
                        goto LABEL_117;
                      }
                      int v90 = _NRLogIsLevelEnabled();

                      if (!v90) {
                        goto LABEL_201;
                      }
                      goto LABEL_70;
                    }
                    id v105 = sub_100070988();
                    int v106 = _NRLogIsLevelEnabled();

                    if (v106)
                    {
                      id v107 = sub_100070988();
                      _NRLogWithArgs();
                    }
                  }
                  uint64_t v15 = _os_log_pack_size();
                  objc_super v5 = (char *)v245 - ((__chkstk_darwin(v15) + 15) & 0xFFFFFFFFFFFFFFF0);
                  __error();
                  uint64_t v108 = _os_log_pack_fill();
                  *(_DWORD *)uint64_t v108 = 136446722;
                  *(void *)(v108 + 4) = "strict_memalign";
                  *(_WORD *)(v108 + 12) = 2048;
                  *(void *)(v108 + 14) = 8;
                  *(_WORD *)(v108 + 22) = 2048;
                  *(void *)(v108 + 24) = 80;
                  goto LABEL_116;
                }
LABEL_87:
                id v83 = sub_100070988();
                int v84 = _NRLogIsLevelEnabled();

                if (v84)
                {
                  id v85 = sub_100070988();
                  _NRLogWithArgs();
                }
                objc_super v5 = (char *)_os_log_pack_size();
                __chkstk_darwin(v5);
                __error();
                uint64_t v86 = _os_log_pack_fill();
                *(_DWORD *)uint64_t v86 = 136446466;
                *(void *)(v86 + 4) = "strict_malloc";
                *(_WORD *)(v86 + 12) = 2048;
                *(void *)(v86 + 14) = v15;
                sub_100070988();
                _NRLogAbortWithPack();
                goto LABEL_90;
              }
            }
            id v79 = sub_100070988();
            int v80 = _NRLogIsLevelEnabled();

            if (v80)
            {
              id v81 = sub_100070988();
              _NRLogWithArgs();
            }
            uint64_t v15 = _os_log_pack_size();
            objc_super v5 = (char *)v245 - ((__chkstk_darwin(v15) + 15) & 0xFFFFFFFFFFFFFFF0);
            __error();
            uint64_t v82 = _os_log_pack_fill();
            *(_DWORD *)uint64_t v82 = 136446210;
            *(void *)(v82 + 4) = "strict_malloc";
            goto LABEL_116;
          }
          id v94 = sub_100070988();
          LODWORD(v5) = _NRLogIsLevelEnabled();

          if (!v5) {
            return (char)v5;
          }
        }
        else
        {
          id v93 = sub_100070988();
          LODWORD(v5) = _NRLogIsLevelEnabled();

          if (!v5) {
            return (char)v5;
          }
        }
      }
      else
      {
        id v92 = sub_100070988();
        LODWORD(v5) = _NRLogIsLevelEnabled();

        if (!v5) {
          return (char)v5;
        }
      }
    }
    else
    {
      id v91 = sub_100070988();
      LODWORD(v5) = _NRLogIsLevelEnabled();

      if (!v5) {
        return (char)v5;
      }
    }
    id v95 = sub_100070988();
    _NRLogWithArgs();

    LOBYTE(v5) = 0;
    return (char)v5;
  }

  return [v5 resume];
}

- (id)copyShortDescriptionInner
{
  id v3 = objc_alloc((Class)NSString);
  v9.receiver = self;
  v9.super_class = (Class)NRLinkBluetooth;
  id v4 = [(NRLink *)&v9 copyShortDescriptionInner];
  uint64_t v5 = *(uint64_t *)((char *)&self->_pipe + 7);
  if ([*(id *)((char *)&self->_randomUUID + 7) length])
  {
    if (self->_isResponder) {
      id v6 = " R";
    }
    else {
      id v6 = " I";
    }
  }
  else
  {
    id v6 = "";
  }
  id v7 = [v3 initWithFormat:@"%@ %@%s%@", v4, v5, v6, *(NSUUID **)((char *)&self->_randomUUID + 7)];

  return v7;
}

- (id)copyDescriptionInner
{
  id v3 = objc_alloc((Class)NSMutableString);
  v10.receiver = self;
  v10.super_class = (Class)NRLinkBluetooth;
  id v4 = [(NRLink *)&v10 copyDescriptionInner];
  id v5 = [v3 initWithString:v4];

  [(NRLink *)self type];
  StringFromNRLinkType = (void *)createStringFromNRLinkType();
  [v5 appendFormat:@", %@", StringFromNRLinkType];

  if (self) {
    uint64_t v7 = *(uint64_t *)((char *)&self->_pipe + 7);
  }
  else {
    uint64_t v7 = 0;
  }
  [v5 appendFormat:@", %@", v7];
  if ([*(id *)((char *)&self->_randomUUID + 7) length])
  {
    if (self->_isResponder) {
      id v8 = " R";
    }
    else {
      id v8 = " I";
    }
  }
  else
  {
    id v8 = "";
  }
  [v5 appendFormat:@", %s", v8];
  [v5 appendFormat:@", %@", *(NSUUID **)((char *)&self->_randomUUID + 7)];
  return v5;
}

- (id)copyStatusString
{
  id v3 = objc_alloc((Class)NSMutableString);
  id v4 = [(NRLink *)self description];
  id v5 = [v3 initWithString:v4];

  [v5 appendFormat:@"\n %35s = %@", "nrUUID", self->super._nrUUID];
  [v5 appendFormat:@"\n %35s = %@", "bluetoothUUID", *(void *)((char *)&self->_handledUrgentLinkReadBufferBytes + 3)];
  [v5 appendFormat:@"\n %35s = %@", "pipe", *(NSUUID **)((char *)&self->_bluetoothUUID + 7)];
  [v5 appendFormat:@"\n %35s = %@", "urgentPipe", *(unint64_t *)((char *)&self->_lastReadDatagramLinkOutputActivityCounter + 7)];
  [v5 appendFormat:@"\n %35s = %@", "datagramPipe", *(unint64_t *)((char *)&self->_lastReadLinkOutputActivityCounter + 7)];
  [v5 appendFormat:@"\n %35s = %p", @"linkChannel", *(unint64_t *)((char *)&self->_writeCounter + 7)];
  [v5 appendFormat:@"\n %35s = %p", @"linkInputRing", *(channel **)((char *)&self->_linkChannel + 7)];
  [v5 appendFormat:@"\n %35s = %p", @"linkOutputRing", *(channel_ring_desc **)((char *)&self->_linkInputRing + 7)];
  [v5 appendFormat:@"\n %35s = %p", @"dLinkInputSource", *(channel_ring_desc **)((char *)&self->_linkOutputRing + 7)];
  [v5 appendFormat:@"\n %35s = %p", @"dLinkOutputSource", *(OS_dispatch_source **)((char *)&self->_dLinkInputSource + 7)];
  [v5 appendFormat:@"\n %35s = %p", @"datagramLinkChannel", *(CBScalablePipe **)((char *)&self->_datagramPipe + 7)];
  [v5 appendFormat:@"\n %35s = %p", @"datagramLinkInputRing", *(channel **)((char *)&self->_datagramLinkChannel + 7)];
  [v5 appendFormat:@"\n %35s = %p", @"datagramLinkOutputRing", *(channel_ring_desc **)((char *)&self->_datagramLinkInputRing + 7)];
  [v5 appendFormat:@"\n %35s = %p", @"dDatagramLinkInputSource", *(channel_ring_desc **)((char *)&self->_datagramLinkOutputRing + 7)];
  [v5 appendFormat:@"\n %35s = %p", @"dDatagramLinkOutputSource", *(OS_dispatch_source **)((char *)&self->_dDatagramLinkInputSource + 7)];
  if (self->_datagramPipeNeeded) {
    id v6 = "YES";
  }
  else {
    id v6 = "NO";
  }
  [v5 appendFormat:@"\n %35s = %s", @"datagramPipeNeeded", v6];
  if (self->super._virtualInterface)
  {
    uint64_t v7 = (void *)NEVirtualInterfaceCopyName();
    [v5 appendFormat:@"\n %35s = %@", "virtualInterfaceName", v7];
  }
  [v5 appendFormat:@"\n %35s = %@", "ikeSessionClassD", *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7)];
  [v5 appendFormat:@"\n %35s = %@", "ikeSessionClassC", *(NEIKEv2Session **)((char *)&self->_ikeSessionClassD + 7)];
  [v5 appendFormat:@"\n %35s = %@", "ikeSessionClassA", *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7)];
  IPv6AddrString = (void *)createIPv6AddrString();
  [v5 appendFormat:@"\n %35s = %@", "localAddrClassD", IPv6AddrString];

  objc_super v9 = (void *)createIPv6AddrString();
  [v5 appendFormat:@"\n %35s = %@", "remoteAddrClassD", v9];

  objc_super v10 = (void *)createIPv6AddrString();
  [v5 appendFormat:@"\n %35s = %@", "localAddrClassC", v10];

  uint64_t v11 = (void *)createIPv6AddrString();
  [v5 appendFormat:@"\n %35s = %@", "remoteAddrClassC", v11];

  [v5 appendFormat:@"\n %35s = %llu", @"packetsFromNexus", *(unint64_t *)((char *)&self->_syncNexusOutput + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"packetsToNexus", *(unint64_t *)((char *)&self->_packetsFromNexus + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"bytesFromNexus", *(unint64_t *)((char *)&self->_packetsToNexus + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"bytesToNexus", *(unint64_t *)((char *)&self->_bytesFromNexus + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"bytesFromNexusVO", *(unint64_t *)((char *)&self->_packetsToNexusVO + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"bytesToNexusVO", *(unint64_t *)((char *)&self->_bytesFromNexusVO + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"bytesFromNexusVI", *(unint64_t *)((char *)&self->_packetsToNexusVI + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"bytesToNexusVI", *(unint64_t *)((char *)&self->_bytesFromNexusVI + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"bytesFromNexusBK", *(unint64_t *)((char *)&self->_packetsToNexusBK + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"bytesToNexusBK", *(unint64_t *)((char *)&self->_bytesFromNexusBK + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"bytesFromLink", *(NSString **)((char *)&self->_jointUUIDHash + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"bytesToLink", *(unint64_t *)((char *)&self->_bytesFromLink + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"datagramBytesFromLink", *(unint64_t *)((char *)&self->_bytesToLink + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"datagramBytesToLink", *(unint64_t *)((char *)&self->_datagramBytesFromLink + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"urgentBytesFromLink", *(unint64_t *)((char *)&self->_datagramBytesToLink + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"urgentBytesToLink", *(unint64_t *)((char *)&self->_urgentBytesFromLink + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"syncNexusInput", *(unint64_t *)((char *)&self->_nexusOutputAvailWake + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"syncNexusOutput", *(unint64_t *)((char *)&self->_syncNexusInput + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"syncNexusVOInput", *(unint64_t *)((char *)&self->_nexusVOOutputAvailWake + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"syncNexusVOOutput", *(unint64_t *)((char *)&self->_syncNexusVOInput + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"syncNexusVIInput", *(unint64_t *)((char *)&self->_nexusVIOutputAvailWake + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"syncNexusVIOutput", *(unint64_t *)((char *)&self->_syncNexusVIInput + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"syncNexusBKInput", *(unint64_t *)((char *)&self->_nexusBKOutputAvailWake + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"syncNexusBKOutput", *(unint64_t *)((char *)&self->_syncNexusBKInput + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"syncLinkInput", *(unint64_t *)((char *)&self->_urgentBytesToLink + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"syncLinkOutput", *(unint64_t *)((char *)&self->_syncLinkInput + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"syncDatagramLinkInput", *(unint64_t *)((char *)&self->_syncLinkOutput + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"syncDatagramLinkOutput", *(unint64_t *)((char *)&self->_syncDatagramLinkInput + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"syncUrgentLinkInput", *(unint64_t *)((char *)&self->_syncDatagramLinkOutput + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"syncUrgentLinkOutput", *(unint64_t *)((char *)&self->_syncUrgentLinkInput + 7)];
  [v5 appendFormat:@"\n %35s = %u", @"filledInLinkWriteBufferBytes", *(unsigned int *)((char *)&self->_urgentLinkWriteBufferLength + 3)];
  [v5 appendFormat:@"\n %35s = %u", @"handledLinkWriteBufferBytes", *(unsigned int *)((char *)&self->_filledInLinkWriteBufferBytes + 3)];
  [v5 appendFormat:@"\n %35s = %u", @"filledInUrgentLinkWriteBufferBytes", *(unsigned int *)((char *)&self->_controlPacketCounter + 3)];
  [v5 appendFormat:@"\n %35s = %u", @"handledUrgentLinkWriteBufferBytes", *(unsigned int *)((char *)&self->_filledInUrgentLinkWriteBufferBytes + 3)];
  if (self->_hasUrgentPrelude) {
    id v12 = "YES";
  }
  else {
    id v12 = "NO";
  }
  [v5 appendFormat:@"\n %35s = %s", @"hasUrgentPrelude", v12];
  [v5 appendFormat:@"\n %35s = %llu", @"linkInputAvailWake", *(unint64_t *)((char *)&self->_syncUrgentLinkOutput + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"linkOutputAvailWake", *(unint64_t *)((char *)&self->_linkInputAvailWake + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"datagramLinkInputAvailWake", *(unint64_t *)((char *)&self->_linkOutputAvailWake + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"datagramLinkOutputAvailWake", *(unint64_t *)((char *)&self->_datagramLinkInputAvailWake + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"nexusInputAvailWake", *(char **)((char *)&self->_linkWriteBuffer + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"nexusOutputAvailWake", *(unint64_t *)((char *)&self->_nexusInputAvailWake + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"nexusVOInputAvailWake", *(unint64_t *)((char *)&self->_lastReadNexusVOOutputActivityCounter + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"nexusVOOutputAvailWake", *(unint64_t *)((char *)&self->_nexusVOInputAvailWake + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"nexusVIInputAvailWake", *(unint64_t *)((char *)&self->_lastReadNexusVIOutputActivityCounter + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"nexusVIOutputAvailWake", *(unint64_t *)((char *)&self->_nexusVIInputAvailWake + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"nexusBKInputAvailWake", *(unint64_t *)((char *)&self->_lastReadNexusBKOutputActivityCounter + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"nexusBKOutputAvailWake", *(unint64_t *)((char *)&self->_nexusBKInputAvailWake + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"pendingBytesToLink", [*(id *)((char *)&self->_urgentLinkReadBuffer + 7) length]];
  [v5 appendFormat:@"\n %35s = %lld (%u - %u)", @"pendingBytesFromLink", *(unsigned int *)((char *)&self->_controlDataSendQueueLen + 3)- (unint64_t)*(unsigned int *)((char *)&self->_filledInLinkReadBufferBytes + 3), *(unsigned int *)((char *)&self->_controlDataSendQueueLen + 3), *(unsigned int *)((char *)&self->_filledInLinkReadBufferBytes + 3)];
  [v5 appendFormat:@"\n %35s = %llu", @"sentUncompressedIP", *(unint64_t *)((char *)&self->_urgentLinkOutputAvailWake + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"sentEncapsulated6LoWPAN", *(unint64_t *)((char *)&self->_sentUncompressedIP + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"sentKnownIPv6Hdr_ESP", *(unint64_t *)((char *)&self->_sentEncapsulated6LoWPAN + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"sentKnownIPv6Hdr_ESP_ECT0", *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_ESP + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"sentKnownIPv6Hdr_ESP_ClassC", *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_ESP_ECT0 + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"sentKnownIPv6Hdr_ESP_ClassC_ECT0", *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_ESP_ClassC + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"sentKnownIPv6Hdr_TCP", *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_ESP_ClassC_ECT0 + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"sentKnownIPv6Hdr_TCP_ECT0", *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_TCP + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"sentIKEv2PointToPoint", *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_TCP_ECT0 + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"recvUncompressedIP", *(unint64_t *)((char *)&self->_sentIKEv2PointToPoint + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"recvEncapsulated6LoWPAN", *(unint64_t *)((char *)&self->_recvUncompressedIP + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"recvKnownIPv6Hdr_ESP", *(unint64_t *)((char *)&self->_recvEncapsulated6LoWPAN + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"recvKnownIPv6Hdr_ESP_ECT0", *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_ESP + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"recvKnownIPv6Hdr_ESP_ClassC", *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_ESP_ECT0 + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"recvKnownIPv6Hdr_ESP_ClassC_ECT0", *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_ESP_ClassC + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"recvKnownIPv6Hdr_TCP", *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_ESP_ClassC_ECT0 + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"recvKnownIPv6Hdr_TCP_ECT0", *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_TCP + 7)];
  [v5 appendFormat:@"\n %35s = %llu", @"recvIKEv2PointToPoint", *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_TCP_ECT0 + 7)];
  id v13 = (void *)_NRCopyTimeStringForDate();
  [v5 appendFormat:@"\n %35s = %@", "lastReadNexus", v13];

  id v14 = (void *)_NRCopyTimeStringForDate();
  [v5 appendFormat:@"\n %35s = %@", "lastWrittenNexus", v14];

  uint64_t v15 = (void *)_NRCopyTimeStringForDate();
  [v5 appendFormat:@"\n %35s = %@", "lastReadLink", v15];

  id v16 = (void *)_NRCopyTimeStringForDate();
  [v5 appendFormat:@"\n %35s = %@", "lastWrittenLink", v16];

  uint64_t v17 = (void *)_NRCopyTimeStringForDate();
  [v5 appendFormat:@"\n %35s = %@", "lastReadUrgentLink", v17];

  uint64_t v18 = (void *)_NRCopyTimeStringForDate();
  [v5 appendFormat:@"\n %35s = %@", "lastWrittenUrgentLink", v18];

  [v5 appendFormat:@"\n %35s = %u", @"nexusRecvWindow", [*(id *)((char *)&self->_dummyPacketNexus + 7) receiveWindowPacketCount]];
  if (self->_dLinkInputSourceSuspended) {
    id v19 = "YES";
  }
  else {
    id v19 = "NO";
  }
  [v5 appendFormat:@"\n %35s = %s", @"dLinkInputSourceSuspended", v19];
  if (self->_dLinkOutputSourceSuspended) {
    id v20 = "YES";
  }
  else {
    id v20 = "NO";
  }
  [v5 appendFormat:@"\n %35s = %s", @"dLinkOutputSourceSuspended", v20];
  if (self->_dUrgentLinkInputSourceSuspended) {
    id v21 = "YES";
  }
  else {
    id v21 = "NO";
  }
  [v5 appendFormat:@"\n %35s = %s", @"dUrgentLinkInputSourceSuspended", v21];
  if (self->_dUrgentLinkOutputSourceSuspended) {
    uint64_t v22 = "YES";
  }
  else {
    uint64_t v22 = "NO";
  }
  [v5 appendFormat:@"\n %35s = %s", @"dUrgentLinkOutputSourceSuspended", v22];
  if (self->_dDatagramLinkInputSourceSuspended) {
    id v23 = "YES";
  }
  else {
    id v23 = "NO";
  }
  [v5 appendFormat:@"\n %35s = %s", @"dDatagramLinkInputSourceSuspended", v23];
  if (self->_dDatagramLinkOutputSourceSuspended) {
    int v24 = "YES";
  }
  else {
    int v24 = "NO";
  }
  [v5 appendFormat:@"\n %35s = %s", @"dDatagramLinkOutputSourceSuspended", v24];
  if (self->_dNexusInputSourceSuspended) {
    id v25 = "YES";
  }
  else {
    id v25 = "NO";
  }
  [v5 appendFormat:@"\n %35s = %s", @"dNexusInputSourceSuspended", v25];
  if (self->_dNexusOutputSourceSuspended) {
    long long v26 = "YES";
  }
  else {
    long long v26 = "NO";
  }
  [v5 appendFormat:@"\n %35s = %s", "dNexusOutputSourceSuspended", v26];
  if (self->_dNexusVOInputSourceSuspended) {
    int v27 = "YES";
  }
  else {
    int v27 = "NO";
  }
  [v5 appendFormat:@"\n %35s = %s", @"dNexusVOInputSourceSuspended", v27];
  if (self->_dNexusVOOutputSourceSuspended) {
    long long v28 = "YES";
  }
  else {
    long long v28 = "NO";
  }
  [v5 appendFormat:@"\n %35s = %s", @"dNexusVOOutputSourceSuspended", v28];
  if (self->_dNexusVIInputSourceSuspended) {
    id v29 = "YES";
  }
  else {
    id v29 = "NO";
  }
  [v5 appendFormat:@"\n %35s = %s", @"dNexusVIInputSourceSuspended", v29];
  if (self->_dNexusVIOutputSourceSuspended) {
    id v30 = "YES";
  }
  else {
    id v30 = "NO";
  }
  [v5 appendFormat:@"\n %35s = %s", @"dNexusVIOutputSourceSuspended", v30];
  if (self->_dNexusBKInputSourceSuspended) {
    uint64_t v31 = "YES";
  }
  else {
    uint64_t v31 = "NO";
  }
  [v5 appendFormat:@"\n %35s = %s", @"dNexusBKInputSourceSuspended", v31];
  if (self->_dNexusBKOutputSourceSuspended) {
    long long v32 = "YES";
  }
  else {
    long long v32 = "NO";
  }
  [v5 appendFormat:@"\n %35s = %s", @"dNexusBKOutputSourceSuspended", v32];
  return v5;
}

@end