@interface MRAVReconnaissanceSession
- (BOOL)returnPartialResults;
- (BOOL)shouldWaitForUnanimousEndpoints;
- (BOOL)useWeakMatching;
- (BOOL)waitForCompleteClusters;
- (MRAVReconnaissanceSession)initWithOutputDeviceUIDs:(id)a3 outputDeviceGroupID:(id)a4 features:(unsigned int)a5;
- (MRAVReconnaissanceSession)initWithOutputDeviceUIDs:(id)a3 outputDeviceGroupID:(id)a4 features:(unsigned int)a5 details:(id)a6;
- (MRAVRoutingDiscoverySession)discoverySession;
- (MRRequestDetails)details;
- (NSArray)matchingLogicalDeviceIDs;
- (NSArray)matchingOutputDeviceUIDs;
- (NSString)matchingOutputDeviceGroupID;
- (id)_descriptionObjectFromResultOfOutputDevices:(void *)a3 endpoints:(void *)a4 unanimousEndpoint:;
- (unsigned)endpointFeatures;
- (void)_onQueue_beginSearchWithTimeout:(uint64_t)a1;
- (void)_onQueue_cancelSearch;
- (void)_onQueue_concludeSearch;
- (void)_onQueue_endSearch;
- (void)_onQueue_invokeCompletionWithMatchingDevices:(void *)a3 matchingEndpoints:(void *)a4 unanimousEndpoint:(void *)a5 error:;
- (void)_onQueue_processSearchLoop;
- (void)_onQueue_timeoutTimerFired;
- (void)_onQueue_updateCachedOutputDevices:(void *)a3 endpoints:;
- (void)beginSearchWithTimeout:(double)a3 completion:(id)a4;
- (void)beginSearchWithTimeout:(double)a3 endpointsCompletion:(id)a4;
- (void)beginSearchWithTimeout:(double)a3 mapCompletion:(id)a4;
- (void)cancelSearch;
- (void)dealloc;
- (void)setMatchingLogicalDeviceIDs:(id)a3;
- (void)setReturnPartialResults:(BOOL)a3;
- (void)setShouldWaitForUnanimousEndpoints:(BOOL)a3;
- (void)setUnanimousEndpoint:(uint64_t)a1;
- (void)setUseWeakMatching:(BOOL)a3;
- (void)setWaitForCompleteClusters:(BOOL)a3;
@end

@implementation MRAVReconnaissanceSession

- (void)_onQueue_processSearchLoop
{
  uint64_t v171 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  id v89 = *(id *)(a1 + 144);
  if ([*(id *)(a1 + 56) length]) {
    BOOL v105 = [*(id *)(a1 + 80) count] == 0;
  }
  else {
    BOOL v105 = 0;
  }
  uint64_t v98 = [*(id *)(a1 + 72) count];
  if (!*(unsigned char *)(a1 + 44)) {
    goto LABEL_145;
  }
  id v2 = *(id *)(a1 + 136);
  v94 = [MEMORY[0x1E4F1CA48] array];
  long long v159 = 0u;
  long long v160 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  obuint64_t j = v2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v157 objects:v170 count:16];
  if (!v3) {
    goto LABEL_24;
  }
  uint64_t v4 = *(void *)v158;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v158 != v4) {
        objc_enumerationMutation(obj);
      }
      v6 = *(void **)(*((void *)&v157 + 1) + 8 * i);
      v7 = [v6 groupID];
      if (!v7 && ![v6 isLocalDevice] || !*(unsigned char *)(a1 + 43))
      {

LABEL_18:
        if (([(id)a1 endpointFeatures] & 8) == 0
          || ([v6 isRemoteControllable] & 1) == 0
          && ([v6 canRelayCommunicationChannel] & 1) == 0)
        {
          [v94 addObject:v6];
        }
        continue;
      }
      if ([v6 isGroupLeader])
      {

        continue;
      }
      char v8 = [v6 isAirPlayReceiverSessionActive];

      if ((v8 & 1) == 0) {
        goto LABEL_18;
      }
    }
    uint64_t v3 = [obj countByEnumeratingWithState:&v157 objects:v170 count:16];
  }
  while (v3);
LABEL_24:

  v92 = [MEMORY[0x1E4F1CA48] array];
  long long v155 = 0u;
  long long v156 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  id v96 = v89;
  id v99 = (id)[v96 countByEnumeratingWithState:&v153 objects:v169 count:16];
  if (v99)
  {
    uint64_t v87 = *(void *)v154;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v154 != v87)
        {
          uint64_t v10 = v9;
          objc_enumerationMutation(v96);
          uint64_t v9 = v10;
        }
        uint64_t v90 = v9;
        v106 = *(void **)(*((void *)&v153 + 1) + 8 * v9);
        v11 = [MEMORY[0x1E4F1CA48] array];
        long long v151 = 0u;
        long long v152 = 0u;
        long long v149 = 0u;
        long long v150 = 0u;
        id v101 = obj;
        uint64_t v108 = [v101 countByEnumeratingWithState:&v149 objects:v168 count:16];
        if (v108)
        {
          uint64_t v103 = *(void *)v150;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v150 != v103)
              {
                uint64_t v13 = v12;
                objc_enumerationMutation(v101);
                uint64_t v12 = v13;
              }
              uint64_t v110 = v12;
              v14 = *(void **)(*((void *)&v149 + 1) + 8 * v12);
              long long v145 = 0u;
              long long v146 = 0u;
              long long v147 = 0u;
              long long v148 = 0u;
              v15 = [v106 outputDevices];
              uint64_t v16 = [v15 countByEnumeratingWithState:&v145 objects:v167 count:16];
              if (v16)
              {
                uint64_t v17 = *(void *)v146;
                do
                {
                  for (uint64_t j = 0; j != v16; ++j)
                  {
                    if (*(void *)v146 != v17) {
                      objc_enumerationMutation(v15);
                    }
                    v19 = *(void **)(*((void *)&v145 + 1) + 8 * j);
                    v20 = [v14 uid];
                    v21 = [v19 uid];
                    LODWORD(v19) = [v20 isEqualToString:v21];

                    if (v19) {
                      [v11 addObject:v14];
                    }
                  }
                  uint64_t v16 = [v15 countByEnumeratingWithState:&v145 objects:v167 count:16];
                }
                while (v16);
              }

              uint64_t v12 = v110 + 1;
            }
            while (v110 + 1 != v108);
            uint64_t v108 = [v101 countByEnumeratingWithState:&v149 objects:v168 count:16];
          }
          while (v108);
        }

        v22 = [MEMORY[0x1E4F779D8] pairWithFirst:v106 second:v11];
        [v92 addObject:v22];

        uint64_t v9 = v90 + 1;
      }
      while ((id)(v90 + 1) != v99);
      id v99 = (id)[v96 countByEnumeratingWithState:&v153 objects:v169 count:16];
    }
    while (v99);
  }

  v23 = (void *)MEMORY[0x1E4F779D8];
  v24 = [MEMORY[0x1E4F1CA98] null];
  v25 = [v23 pairWithFirst:v24 second:v94];
  [v92 addObject:v25];

  id v97 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  id v86 = v92;
  uint64_t v91 = [v86 countByEnumeratingWithState:&v141 objects:v166 count:16];
  if (v91)
  {
    uint64_t v88 = *(void *)v142;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v142 != v88)
        {
          uint64_t v27 = v26;
          objc_enumerationMutation(v86);
          uint64_t v26 = v27;
        }
        uint64_t v93 = v26;
        v28 = *(void **)(*((void *)&v141 + 1) + 8 * v26);
        id v102 = [v28 first];
        id v100 = [v28 second];
        long long v139 = 0u;
        long long v140 = 0u;
        long long v137 = 0u;
        long long v138 = 0u;
        uint64_t v107 = [v100 countByEnumeratingWithState:&v137 objects:v165 count:16];
        if (!v107)
        {
          if (v105) {
            goto LABEL_105;
          }
          uint64_t v29 = 0;
LABEL_100:
          if (v29 != [*(id *)(a1 + 80) count]
            || ([MEMORY[0x1E4F1CA98] null],
                id v57 = (id)objc_claimAutoreleasedReturnValue(),
                BOOL v58 = v102 == v57,
                v57,
                v56 = v102,
                v58))
          {
            if (!v29) {
              goto LABEL_105;
            }
            v56 = 0;
          }
LABEL_104:
          -[MRAVReconnaissanceSession setUnanimousEndpoint:](a1, v56);
          goto LABEL_105;
        }
        uint64_t v29 = 0;
        uint64_t v104 = *(void *)v138;
        char v109 = 1;
        do
        {
          uint64_t v30 = 0;
          do
          {
            if (*(void *)v138 != v104) {
              objc_enumerationMutation(v100);
            }
            v31 = *(void **)(*((void *)&v137 + 1) + 8 * v30);
            v32 = [v31 uid];
            v33 = [v31 groupID];
            v34 = (void *)MEMORY[0x1E4F1CAD0];
            v35 = [v31 clusterComposition];
            v36 = objc_msgSend(v35, "mr_map:", &__block_literal_global_110);
            v111 = [v34 setWithArray:v36];

            if (v105)
            {
              if (![v33 isEqualToString:*(void *)(a1 + 56)]) {
                goto LABEL_67;
              }
LABEL_65:
              [*(id *)(a1 + 112) setObject:v31 forKeyedSubscript:v32];
LABEL_66:
              ++v29;
              goto LABEL_67;
            }
            if (v98)
            {
              v37 = *(void **)(a1 + 72);
              v38 = [v31 logicalDeviceID];
              LODWORD(v37) = [v37 containsObject:v38];

              if (!v37) {
                goto LABEL_67;
              }
              v39 = *(void **)(a1 + 112);
              v40 = [v31 uid];
              [v39 setObject:v31 forKeyedSubscript:v40];

              goto LABEL_66;
            }
            v41 = *(void **)(a1 + 80);
            if (*(unsigned char *)(a1 + 40))
            {
              if (objc_msgSend(v41, "mr_containsObjectUsingWeakMatching:", v32)) {
                goto LABEL_65;
              }
              long long v135 = 0u;
              long long v136 = 0u;
              long long v133 = 0u;
              long long v134 = 0u;
              id v49 = v111;
              uint64_t v50 = [v49 countByEnumeratingWithState:&v133 objects:v164 count:16];
              if (v50)
              {
                uint64_t v51 = *(void *)v134;
                do
                {
                  for (uint64_t k = 0; k != v50; ++k)
                  {
                    if (*(void *)v134 != v51) {
                      objc_enumerationMutation(v49);
                    }
                    if (objc_msgSend(*(id *)(a1 + 80), "mr_containsObjectUsingWeakMatching:", *(void *)(*((void *)&v133 + 1) + 8 * k)))
                    {
                      [*(id *)(a1 + 112) setObject:v31 forKeyedSubscript:v32];
                      ++v29;
                    }
                  }
                  uint64_t v50 = [v49 countByEnumeratingWithState:&v133 objects:v164 count:16];
                }
                while (v50);
              }
            }
            else
            {
              if ([v41 containsObject:v32])
              {
                [*(id *)(a1 + 112) setObject:v31 forKeyedSubscript:v32];
                ++v29;
              }
              v44 = (void *)[v111 mutableCopy];
              [v44 intersectSet:*(void *)(a1 + 80)];
              long long v131 = 0u;
              long long v132 = 0u;
              long long v129 = 0u;
              long long v130 = 0u;
              id v45 = v44;
              uint64_t v46 = [v45 countByEnumeratingWithState:&v129 objects:v163 count:16];
              if (v46)
              {
                uint64_t v47 = *(void *)v130;
                do
                {
                  for (uint64_t m = 0; m != v46; ++m)
                  {
                    if (*(void *)v130 != v47) {
                      objc_enumerationMutation(v45);
                    }
                    [*(id *)(a1 + 112) setObject:v31 forKeyedSubscript:*(void *)(*((void *)&v129 + 1) + 8 * m)];
                  }
                  v29 += v46;
                  uint64_t v46 = [v45 countByEnumeratingWithState:&v129 objects:v163 count:16];
                }
                while (v46);
              }
            }
LABEL_67:
            if (((v29 != 0) & v109) == 1)
            {
              id v42 = [MEMORY[0x1E4F1CA98] null];
              BOOL v43 = v102 == v42;

              if (v43)
              {
                char v109 = 1;
              }
              else
              {
                [v97 addObject:v102];
                char v109 = 0;
              }
            }

            ++v30;
          }
          while (v30 != v107);
          uint64_t v53 = [v100 countByEnumeratingWithState:&v137 objects:v165 count:16];
          uint64_t v107 = v53;
        }
        while (v53);
        if (!v105) {
          goto LABEL_100;
        }
        if (v29)
        {
          id v54 = [MEMORY[0x1E4F1CA98] null];
          BOOL v55 = v102 == v54;

          v56 = v102;
          if (!v55) {
            goto LABEL_104;
          }
        }
LABEL_105:
        objc_storeStrong((id *)(a1 + 120), v97);

        uint64_t v26 = v93 + 1;
      }
      while (v93 + 1 != v91);
      uint64_t v91 = [v86 countByEnumeratingWithState:&v141 objects:v166 count:16];
    }
    while (v91);
  }

  if (![(id)a1 waitForCompleteClusters])
  {
LABEL_110:
    if (v105)
    {
      id v63 = *(id *)(a1 + 128);
      if (v63)
      {
        v64 = v63;
        int v65 = [(id)a1 shouldWaitForUnanimousEndpoints];

        if (v65)
        {
          long long v118 = 0u;
          long long v119 = 0u;
          long long v116 = 0u;
          long long v117 = 0u;
          v66 = [*(id *)(a1 + 128) outputDevices];
          uint64_t v67 = [v66 countByEnumeratingWithState:&v116 objects:v162 count:16];
          if (v67)
          {
            uint64_t v68 = *(void *)v117;
            do
            {
              for (uint64_t n = 0; n != v67; ++n)
              {
                if (*(void *)v117 != v68) {
                  objc_enumerationMutation(v66);
                }
                v70 = *(void **)(*((void *)&v116 + 1) + 8 * n);
                if (([v70 isGroupLeader] & 1) == 0)
                {
                  if (![v70 canRelayCommunicationChannel]
                    || [v70 isRemoteControllable]
                    && ([v70 groupContainsGroupLeader] & 1) != 0)
                  {
                    continue;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    continue;
                  }
                }
                -[MRAVReconnaissanceSession _onQueue_concludeSearch](a1);
              }
              uint64_t v67 = [v66 countByEnumeratingWithState:&v116 objects:v162 count:16];
            }
            while (v67);
          }
        }
      }
      goto LABEL_144;
    }
    uint64_t v71 = [*(id *)(a1 + 112) count];
    if (v98)
    {
      if (v71 != 2 * [*(id *)(a1 + 72) count]
        && (!*(void *)(a1 + 176) || [*(id *)(a1 + 112) count] != *(void *)(a1 + 176)))
      {
        goto LABEL_144;
      }
    }
    else
    {
      if (v71 != [*(id *)(a1 + 80) count]) {
        goto LABEL_144;
      }
      id v73 = *(id *)(a1 + 128);
      if (v73)
      {
        v74 = v73;
        id v75 = *(id *)(a1 + 128);
        if ([v75 connectionType] != 1 && (objc_msgSend((id)a1, "endpointFeatures") & 8) != 0)
        {
          int v76 = [(id)a1 shouldWaitForUnanimousEndpoints];

          if (v76)
          {
            id v77 = *(id *)(a1 + 128);
            v78 = [v77 outputDevices];
            v79 = [*(id *)(a1 + 128) designatedGroupLeader];
            v80 = [v78 arrayByAddingObject:v79];

            long long v114 = 0u;
            long long v115 = 0u;
            long long v112 = 0u;
            long long v113 = 0u;
            id v81 = v80;
            uint64_t v82 = [v81 countByEnumeratingWithState:&v112 objects:v161 count:16];
            if (v82)
            {
              uint64_t v83 = *(void *)v113;
              while (2)
              {
                for (iuint64_t i = 0; ii != v82; ++ii)
                {
                  if (*(void *)v113 != v83) {
                    objc_enumerationMutation(v81);
                  }
                  v85 = *(void **)(*((void *)&v112 + 1) + 8 * ii);
                  if (([v85 isGroupLeader] & 1) == 0)
                  {
                    if (![v85 canRelayCommunicationChannel]
                      || [v85 isRemoteControllable]
                      && ([v85 groupContainsGroupLeader] & 1) != 0)
                    {
                      continue;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      continue;
                    }
                  }
                  -[MRAVReconnaissanceSession _onQueue_concludeSearch](a1);
                  goto LABEL_162;
                }
                uint64_t v82 = [v81 countByEnumeratingWithState:&v112 objects:v161 count:16];
                if (v82) {
                  continue;
                }
                break;
              }
            }
LABEL_162:

            goto LABEL_144;
          }
        }
        else
        {
        }
      }
    }
    -[MRAVReconnaissanceSession _onQueue_concludeSearch](a1);
    goto LABEL_144;
  }
  uint64_t v123 = 0;
  v124 = &v123;
  uint64_t v125 = 0x3032000000;
  v126 = __Block_byref_object_copy__51;
  v127 = __Block_byref_object_dispose__51;
  id v128 = *(id *)(a1 + 32);
  uint64_t v59 = [(id)v124[5] count];
  v122[0] = MEMORY[0x1E4F143A8];
  v122[1] = 3221225472;
  v122[2] = __55__MRAVReconnaissanceSession__onQueue_processSearchLoop__block_invoke_49;
  v122[3] = &unk_1E57DA0F8;
  v122[4] = &v123;
  int v60 = objc_msgSend(v97, "mr_all:", v122);
  v61 = [*(id *)(a1 + 112) allValues];
  v121[0] = MEMORY[0x1E4F143A8];
  v121[1] = 3221225472;
  v121[2] = __55__MRAVReconnaissanceSession__onQueue_processSearchLoop__block_invoke_52;
  v121[3] = &unk_1E57D7BB8;
  v121[4] = &v123;
  int v62 = objc_msgSend(v61, "mr_all:", v121);

  if (v60 & v62)
  {
    _Block_object_dispose(&v123, 8);

    goto LABEL_110;
  }
  if (v59 != [(id)v124[5] count])
  {
    v72 = _MRLogForCategory(0);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_194F3C000, v72, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Found incomplete clusters among matching devices. Waiting for discovery updates until they are complete.", buf, 2u);
    }
  }
  _Block_object_dispose(&v123, 8);

LABEL_144:
LABEL_145:
}

- (MRAVReconnaissanceSession)initWithOutputDeviceUIDs:(id)a3 outputDeviceGroupID:(id)a4 features:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [[MRRequestDetails alloc] initWithName:@"ReconSession" requestID:0 reason:0];
  v11 = [(MRAVReconnaissanceSession *)self initWithOutputDeviceUIDs:v9 outputDeviceGroupID:v8 features:v5 details:v10];

  return v11;
}

- (MRAVReconnaissanceSession)initWithOutputDeviceUIDs:(id)a3 outputDeviceGroupID:(id)a4 features:(unsigned int)a5 details:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v42.receiver = self;
  v42.super_class = (Class)MRAVReconnaissanceSession;
  uint64_t v13 = [(MRAVReconnaissanceSession *)&v42 init];
  if (v13)
  {
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    qos_class_t v15 = qos_class_self();
    uint64_t v16 = dispatch_queue_attr_make_with_qos_class(v14, v15, 0);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.MediaRemote.MRAVReconnaissanceSession", v16);
    serialQueue = v13->_serialQueue;
    v13->_serialQueue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v13->_details, a6);
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    matchingDevicesFound = v13->_matchingDevicesFound;
    v13->_matchingDevicesFound = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    matchingEndpointsFound = v13->_matchingEndpointsFound;
    v13->_matchingEndpointsFound = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    localMatchingDevicesFound = v13->_localMatchingDevicesFound;
    v13->_localMatchingDevicesFound = v23;

    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v10];
    matchingOutputDeviceUIDsSet = v13->_matchingOutputDeviceUIDsSet;
    v13->_matchingOutputDeviceUIDsSet = (NSSet *)v25;

    uint64_t v27 = [v11 copy];
    matchingOutputDeviceGroupID = v13->_matchingOutputDeviceGroupID;
    v13->_matchingOutputDeviceGroupID = (NSString *)v27;

    uint64_t v29 = +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:v7];
    discoverySessiouint64_t n = v13->_discoverySession;
    v13->_discoverySessiouint64_t n = (MRAVRoutingDiscoverySession *)v29;

    v13->_shouldWaitForUnanimousEndpoints = (v7 & 8) != 0;
    v13->_updatesReceived = 0;
    v13->_returnPartialResults = [(NSString *)v13->_matchingOutputDeviceGroupID length] != 0;
    objc_initWeak(&location, v13);
    v31 = v13->_discoverySession;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __91__MRAVReconnaissanceSession_initWithOutputDeviceUIDs_outputDeviceGroupID_features_details___block_invoke;
    v39[3] = &unk_1E57D1860;
    objc_copyWeak(&v40, &location);
    uint64_t v32 = [(MRAVRoutingDiscoverySession *)v31 addEndpointsChangedCallback:v39];
    discoverySessionCallbackTokeuint64_t n = v13->_discoverySessionCallbackToken;
    v13->_discoverySessionCallbackTokeuint64_t n = (id)v32;

    v34 = v13->_discoverySession;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __91__MRAVReconnaissanceSession_initWithOutputDeviceUIDs_outputDeviceGroupID_features_details___block_invoke_3;
    v37[3] = &unk_1E57D1860;
    objc_copyWeak(&v38, &location);
    id v35 = [(MRAVRoutingDiscoverySession *)v34 addOutputDevicesChangedCallback:v37];
    objc_destroyWeak(&v38);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __91__MRAVReconnaissanceSession_initWithOutputDeviceUIDs_outputDeviceGroupID_features_details___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[2];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __91__MRAVReconnaissanceSession_initWithOutputDeviceUIDs_outputDeviceGroupID_features_details___block_invoke_2;
    v7[3] = &unk_1E57D0790;
    id v8 = WeakRetained;
    id v9 = v3;
    dispatch_async(v6, v7);
  }
}

void __91__MRAVReconnaissanceSession_initWithOutputDeviceUIDs_outputDeviceGroupID_features_details___block_invoke_2(uint64_t a1)
{
}

- (void)_onQueue_updateCachedOutputDevices:(void *)a3 endpoints:
{
  id v7 = a2;
  id v6 = a3;
  if (a1)
  {
    if (v7) {
      objc_storeStrong((id *)(a1 + 136), a2);
    }
    if (v6) {
      objc_storeStrong((id *)(a1 + 144), a3);
    }
    ++*(void *)(a1 + 152);
    objc_storeStrong((id *)(a1 + 160), *(id *)(a1 + 136));
    objc_storeStrong((id *)(a1 + 168), *(id *)(a1 + 144));
    -[MRAVReconnaissanceSession _onQueue_processSearchLoop](a1);
  }
}

void __91__MRAVReconnaissanceSession_initWithOutputDeviceUIDs_outputDeviceGroupID_features_details___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[2];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __91__MRAVReconnaissanceSession_initWithOutputDeviceUIDs_outputDeviceGroupID_features_details___block_invoke_4;
    v7[3] = &unk_1E57D0790;
    id v8 = WeakRetained;
    id v9 = v3;
    dispatch_async(v6, v7);
  }
}

void __91__MRAVReconnaissanceSession_initWithOutputDeviceUIDs_outputDeviceGroupID_features_details___block_invoke_4(uint64_t a1)
{
}

- (void)dealloc
{
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __36__MRAVReconnaissanceSession_dealloc__block_invoke;
  id v7 = &unk_1E57D0518;
  id v8 = self;
  msv_dispatch_sync_on_queue();
  [(MRAVRoutingDiscoverySession *)self->_discoverySession removeEndpointsChangedCallback:self->_discoverySessionCallbackToken];
  v3.receiver = self;
  v3.super_class = (Class)MRAVReconnaissanceSession;
  [(MRAVReconnaissanceSession *)&v3 dealloc];
}

void __36__MRAVReconnaissanceSession_dealloc__block_invoke(uint64_t a1)
{
}

- (void)_onQueue_cancelSearch
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (*(unsigned char *)(a1 + 44))
    {
      id v2 = _MRLogForCategory(0);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 138543362;
        uint64_t v5 = a1;
        _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Cancelling search for session %{public}@", (uint8_t *)&v4, 0xCu);
      }

      objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:25 description:@"Operation was manually canceled via a explict call to CancelSearch"];
      -[MRAVReconnaissanceSession _onQueue_invokeCompletionWithMatchingDevices:matchingEndpoints:unanimousEndpoint:error:]((id *)a1, MEMORY[0x1E4F1CC08], MEMORY[0x1E4F1CBF0], 0, v3);
    }
    -[MRAVReconnaissanceSession _onQueue_endSearch](a1);
  }
}

- (NSArray)matchingOutputDeviceUIDs
{
  return [(NSSet *)self->_matchingOutputDeviceUIDsSet allObjects];
}

- (NSString)matchingOutputDeviceGroupID
{
  return self->_matchingOutputDeviceGroupID;
}

- (unsigned)endpointFeatures
{
  return [(MRAVRoutingDiscoverySession *)self->_discoverySession endpointFeatures];
}

- (void)beginSearchWithTimeout:(double)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__MRAVReconnaissanceSession_beginSearchWithTimeout_completion___block_invoke;
  v8[3] = &unk_1E57DA058;
  id v9 = v6;
  id v7 = v6;
  [(MRAVReconnaissanceSession *)self beginSearchWithTimeout:v8 endpointsCompletion:a3];
}

uint64_t __63__MRAVReconnaissanceSession_beginSearchWithTimeout_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4, a5);
  }
  return result;
}

- (void)beginSearchWithTimeout:(double)a3 endpointsCompletion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__MRAVReconnaissanceSession_beginSearchWithTimeout_endpointsCompletion___block_invoke;
  v8[3] = &unk_1E57DA080;
  id v9 = v6;
  id v7 = v6;
  [(MRAVReconnaissanceSession *)self beginSearchWithTimeout:v8 mapCompletion:a3];
}

void __72__MRAVReconnaissanceSession_beginSearchWithTimeout_endpointsCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  if (*(void *)(a1 + 32))
  {
    id v9 = (void *)MEMORY[0x1E4F1CAD0];
    id v10 = a5;
    id v11 = a4;
    id v12 = a3;
    uint64_t v13 = [a2 allValues];
    id v16 = [v9 setWithArray:v13];

    uint64_t v14 = *(void *)(a1 + 32);
    qos_class_t v15 = [v16 allObjects];
    (*(void (**)(uint64_t, void *, id, id, id))(v14 + 16))(v14, v15, v12, v11, v10);
  }
}

- (void)beginSearchWithTimeout:(double)a3 mapCompletion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  id v8 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v9 = [(MRAVReconnaissanceSession *)self details];
  id v10 = [v9 requestID];
  id v11 = (void *)[v8 initWithFormat:@"%@<%@>", @"ReconnaissanceSession.search", v10];

  id v12 = [(MRAVReconnaissanceSession *)self matchingOutputDeviceUIDs];
  if ([v12 count]) {
    [(MRAVReconnaissanceSession *)self matchingOutputDeviceUIDs];
  }
  else {
  uint64_t v13 = [(MRAVReconnaissanceSession *)self matchingOutputDeviceGroupID];
  }

  if (v13)
  {
    uint64_t v14 = [(MRAVReconnaissanceSession *)self matchingOutputDeviceUIDs];
    if ([v14 count]) {
      [(MRAVReconnaissanceSession *)self matchingOutputDeviceUIDs];
    }
    else {
    qos_class_t v15 = [(MRAVReconnaissanceSession *)self matchingOutputDeviceGroupID];
    }
    [v11 appendFormat:@" for %@", v15];
  }
  id v16 = [(MRAVReconnaissanceSession *)self details];
  dispatch_queue_t v17 = [v16 reason];

  if (v17)
  {
    v18 = [(MRAVReconnaissanceSession *)self details];
    v19 = [v18 reason];
    [v11 appendFormat:@" because %@", v19];
  }
  v20 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v34 = v11;
    _os_log_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __66__MRAVReconnaissanceSession_beginSearchWithTimeout_mapCompletion___block_invoke;
  v29[3] = &unk_1E57DA0A8;
  id v30 = v7;
  v31 = self;
  id v32 = v6;
  id v21 = v6;
  id v22 = v7;
  v23 = (void *)MEMORY[0x1997190F0](v29);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MRAVReconnaissanceSession_beginSearchWithTimeout_mapCompletion___block_invoke_26;
  block[3] = &unk_1E57D1FA8;
  block[4] = self;
  id v27 = v23;
  double v28 = a3;
  id v25 = v23;
  dispatch_async(serialQueue, block);
}

void __66__MRAVReconnaissanceSession_beginSearchWithTimeout_mapCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v9 allValues];
  uint64_t v14 = [v13 firstObject];
  qos_class_t v15 = [v14 name];

  id v16 = [v9 allValues];
  dispatch_queue_t v17 = [v16 firstObject];
  v18 = [v17 uid];

  v19 = _MRLogForCategory(0);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    if (v15) {
      v20 = v15;
    }
    else {
      v20 = v18;
    }
    if (v12) {
      id v21 = v12;
    }
    else {
      id v21 = v20;
    }
    [*(id *)(a1 + 32) timeIntervalSinceNow];
    id v22 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    objc_super v42 = v21;
    __int16 v43 = 2048;
    double v44 = -v23;
    __int16 v45 = 2114;
    uint64_t v46 = v22;
    _os_log_impl(&dword_194F3C000, v19, OS_LOG_TYPE_DEFAULT, "WHAPRO: Discovery found %@ in %f seconds %{public}@", buf, 0x20u);
  }

  if (v12)
  {
    v24 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      __66__MRAVReconnaissanceSession_beginSearchWithTimeout_mapCompletion___block_invoke_cold_1(a1, (uint64_t)v12, v24);
    }
  }
  else
  {
    uint64_t v26 = *(void **)(a1 + 40);
    id v27 = [v9 allValues];
    double v28 = -[MRAVReconnaissanceSession _descriptionObjectFromResultOfOutputDevices:endpoints:unanimousEndpoint:](v26, v27, v10, v11);

    v24 = _MRLogForCategory(0xAuLL);
    BOOL v29 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v28)
    {
      if (v29)
      {
        v39 = [*(id *)(a1 + 40) details];
        id v30 = [v39 requestID];
        v31 = *(void **)(a1 + 40);
        id v38 = [v9 allValues];
        id v32 = -[MRAVReconnaissanceSession _descriptionObjectFromResultOfOutputDevices:endpoints:unanimousEndpoint:](v31, v38, v10, v11);
        v37 = [MEMORY[0x1E4F1C9C8] date];
        [v37 timeIntervalSinceDate:*(void *)(a1 + 32)];
        *(_DWORD *)buf = 138544130;
        objc_super v42 = @"ReconnaissanceSession.search";
        __int16 v43 = 2114;
        double v44 = *(double *)&v30;
        __int16 v45 = 2112;
        uint64_t v46 = v32;
        __int16 v47 = 2048;
        uint64_t v48 = v33;
        _os_log_impl(&dword_194F3C000, v24, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds", buf, 0x2Au);
      }
    }
    else if (v29)
    {
      id v40 = [*(id *)(a1 + 40) details];
      v34 = [v40 requestID];
      uint64_t v35 = [MEMORY[0x1E4F1C9C8] date];
      [v35 timeIntervalSinceDate:*(void *)(a1 + 32)];
      *(_DWORD *)buf = 138543874;
      objc_super v42 = @"ReconnaissanceSession.search";
      __int16 v43 = 2114;
      double v44 = *(double *)&v34;
      __int16 v45 = 2048;
      uint64_t v46 = v36;
      _os_log_impl(&dword_194F3C000, v24, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);
    }
  }

  uint64_t v25 = *(void *)(a1 + 48);
  if (v25) {
    (*(void (**)(uint64_t, id, id, id, __CFString *))(v25 + 16))(v25, v9, v10, v11, v12);
  }
}

- (id)_descriptionObjectFromResultOfOutputDevices:(void *)a3 endpoints:(void *)a4 unanimousEndpoint:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (a1)
  {
    id v11 = v9;
    if (v9 || (uint64_t v12 = [v8 count], v11 = v8, v12) || (v13 = objc_msgSend(v7, "count"), v11 = v7, v13)) {
      a1 = v11;
    }
    else {
      a1 = 0;
    }
  }

  return a1;
}

void __66__MRAVReconnaissanceSession_beginSearchWithTimeout_mapCompletion___block_invoke_26(uint64_t a1, const char *a2)
{
  objc_super v3 = *(unsigned char **)(a1 + 32);
  if (!v3[44] || (-[MRAVReconnaissanceSession _onQueue_cancelSearch]((uint64_t)v3), (objc_super v3 = *(unsigned char **)(a1 + 32)) != 0))
  {
    objc_setProperty_nonatomic_copy(v3, a2, *(id *)(a1 + 40), 96);
    objc_super v3 = *(unsigned char **)(a1 + 32);
  }
  double v4 = *(double *)(a1 + 48);

  -[MRAVReconnaissanceSession _onQueue_beginSearchWithTimeout:]((uint64_t)v3, v4);
}

- (void)_onQueue_beginSearchWithTimeout:(uint64_t)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a2 < 0.0)
    {
      double v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:sel__onQueue_beginSearchWithTimeout_, a1, @"MRAVReconnaissanceSession.m", 218, @"Invalid parameter not satisfying: %@", @"timeout >= 0" object file lineNumber description];
    }
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v5 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v4;

    id v6 = (void *)MRMediaRemoteCopyDeviceUID();
    id LocalEndpoint = MRAVEndpointGetLocalEndpoint(0);
    int IsProxyGroupPlayer = MRAVEndpointIsProxyGroupPlayer(LocalEndpoint);
    id v9 = +[MRAVClusterController sharedController];
    uint64_t v10 = [v9 clusterStatus];

    id v11 = [*(id *)(a1 + 80) allObjects];
    uint64_t v12 = (void *)[v11 mutableCopy];

    if (([v12 containsObject:v6] & IsProxyGroupPlayer) == 1
      && ([(id)a1 endpointFeatures] & 8) != 0
      && v10 != 2)
    {
      [v12 removeObject:v6];
    }
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v12];
    uint64_t v14 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = v13;

    if ([*(id *)(a1 + 80) count]
      || [*(id *)(a1 + 56) length]
      || [*(id *)(a1 + 72) count])
    {
      qos_class_t v15 = _MRLogForCategory(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        double v28 = a2;
        __int16 v29 = 2114;
        uint64_t v30 = a1;
        _os_log_impl(&dword_194F3C000, v15, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Beginning search with timeout %f %{public}@", buf, 0x16u);
      }

      if (*(void *)(a1 + 104))
      {
        v24 = [MEMORY[0x1E4F28B00] currentHandler];
        [v24 handleFailureInMethod:sel__onQueue_beginSearchWithTimeout_, a1, @"MRAVReconnaissanceSession.m", 257, @"Invalid parameter not satisfying: %@", @"!_timeoutTimer" object file lineNumber description];
      }
      if (a2 > 0.0)
      {
        objc_initWeak((id *)buf, (id)a1);
        *(double *)(a1 + 8) = a2;
        id v16 = objc_alloc(MEMORY[0x1E4F77A30]);
        uint64_t v17 = *(void *)(a1 + 16);
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __61__MRAVReconnaissanceSession__onQueue_beginSearchWithTimeout___block_invoke;
        v25[3] = &unk_1E57D12D0;
        objc_copyWeak(&v26, (id *)buf);
        uint64_t v18 = [v16 initWithInterval:v17 queue:v25 block:a2];
        v19 = *(void **)(a1 + 104);
        *(void *)(a1 + 104) = v18;

        objc_destroyWeak(&v26);
        objc_destroyWeak((id *)buf);
      }
      [*(id *)(a1 + 64) setDiscoveryMode:3];
      *(unsigned char *)(a1 + 44) = 1;
      -[MRAVReconnaissanceSession _onQueue_processSearchLoop](a1);
    }
    else
    {
      if ([*(id *)(a1 + 24) count])
      {
        uint64_t v20 = +[MRAVLocalEndpoint sharedLocalEndpointForRoutingContextWithUID:0];
        id v21 = *(void **)(a1 + 128);
        *(void *)(a1 + 128) = v20;
      }
      id v22 = _MRLogForCategory(0);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_194F3C000, v22, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Recon force end: nothing to match", buf, 2u);
      }

      -[MRAVReconnaissanceSession _onQueue_invokeCompletionWithMatchingDevices:matchingEndpoints:unanimousEndpoint:error:]((id *)a1, MEMORY[0x1E4F1CC08], MEMORY[0x1E4F1CBF0], 0, 0);
    }
  }
}

- (void)setUnanimousEndpoint:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 128), a2);
  }
}

- (void)_onQueue_invokeCompletionWithMatchingDevices:(void *)a3 matchingEndpoints:(void *)a4 unanimousEndpoint:(void *)a5 error:
{
  id v14 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a1)
  {
    uint64_t v12 = (void (**)(id, id, id, id, id))a1[12];
    objc_setProperty_nonatomic_copy(a1, v13, 0, 96);
    if (v12) {
      v12[2](v12, v14, v9, v10, v11);
    }
  }
}

void __61__MRAVReconnaissanceSession__onQueue_beginSearchWithTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[MRAVReconnaissanceSession _onQueue_timeoutTimerFired]((uint64_t)WeakRetained);
}

- (void)_onQueue_timeoutTimerFired
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (*(unsigned char *)(a1 + 44))
    {
      *(unsigned char *)(a1 + 44) = 0;
      id v2 = _MRLogForCategory(0);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v3 = *(void **)(a1 + 8);
        uint64_t v4 = *(void *)(a1 + 152);
        *(_DWORD *)buf = 134218498;
        v52 = v3;
        __int16 v53 = 2048;
        uint64_t v54 = v4;
        __int16 v55 = 2114;
        uint64_t v56 = a1;
        _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Session timed out after %f seconds with %llu updates %{public}@", buf, 0x20u);
      }

      uint64_t v5 = _MRLogForCategory(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Last endpoints:", buf, 2u);
      }

      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v6 = *(id *)(a1 + 168);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v46 != v9) {
              objc_enumerationMutation(v6);
            }
            id v11 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            uint64_t v12 = _MRLogForCategory(0);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v52 = v11;
              _os_log_impl(&dword_194F3C000, v12, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] %{public}@", buf, 0xCu);
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v45 objects:v50 count:16];
        }
        while (v8);
      }

      SEL v13 = _MRLogForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_194F3C000, v13, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Last output devices:", buf, 2u);
      }

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v14 = *(id *)(a1 + 160);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v42;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v42 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v41 + 1) + 8 * j);
            uint64_t v20 = _MRLogForCategory(0);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v52 = v19;
              _os_log_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] %{public}@", buf, 0xCu);
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v41 objects:v49 count:16];
        }
        while (v16);
      }

      id v21 = _MRLogForCategory(0);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = *(void **)(a1 + 112);
        *(_DWORD *)buf = 138543362;
        v52 = v22;
        _os_log_impl(&dword_194F3C000, v21, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Matching devices found: %{public}@", buf, 0xCu);
      }

      double v23 = _MRLogForCategory(0);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = *(void **)(a1 + 80);
        *(_DWORD *)buf = 138543362;
        v52 = v24;
        _os_log_impl(&dword_194F3C000, v23, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Matching UIDs set: %{public}@", buf, 0xCu);
      }

      uint64_t v25 = _MRLogForCategory(0);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = *(void **)(a1 + 72);
        *(_DWORD *)buf = 138543362;
        v52 = v26;
        _os_log_impl(&dword_194F3C000, v25, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Matching Logical Device IDs set: %{public}@", buf, 0xCu);
      }

      id v27 = _MRLogForCategory(0);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        double v28 = *(void **)(a1 + 128);
        *(_DWORD *)buf = 138543362;
        v52 = v28;
        _os_log_impl(&dword_194F3C000, v27, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Unanimous endpoint: %{public}@", buf, 0xCu);
      }

      __int16 v29 = _MRLogForCategory(0);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = *(id *)(a1 + 128);
        uint64_t v31 = NSStringFromMRAVEndpointConnectionType([v30 connectionType]);
        *(_DWORD *)buf = 138543362;
        v52 = v31;
        _os_log_impl(&dword_194F3C000, v29, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Unanimous endpoint connection type: %{public}@", buf, 0xCu);
      }
      id v32 = _MRLogForCategory(0);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = [(id)a1 endpointFeatures];
        *(_DWORD *)buf = 67109120;
        LODWORD(v52) = v33;
        _os_log_impl(&dword_194F3C000, v32, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Endpoint features: %u", buf, 8u);
      }

      v34 = _MRLogForCategory(0);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        int v35 = [(id)a1 shouldWaitForUnanimousEndpoints];
        *(_DWORD *)buf = 67109120;
        LODWORD(v52) = v35;
        _os_log_impl(&dword_194F3C000, v34, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Unanimous endpoint should wait: %{BOOL}u", buf, 8u);
      }

      Error = (void *)MRMediaRemoteCreateError(26);
      if (*(unsigned char *)(a1 + 41))
      {
        v37 = *(void **)(a1 + 112);
        id v38 = *(void **)(a1 + 120);
        v39 = *(void **)(a1 + 128);
        id v40 = (id *)a1;
      }
      else
      {
        v37 = (void *)MEMORY[0x1E4F1CC08];
        id v38 = (void *)MEMORY[0x1E4F1CBF0];
        id v40 = (id *)a1;
        v39 = 0;
      }
      -[MRAVReconnaissanceSession _onQueue_invokeCompletionWithMatchingDevices:matchingEndpoints:unanimousEndpoint:error:](v40, v37, v38, v39, Error);
    }
    -[MRAVReconnaissanceSession _onQueue_endSearch](a1);
  }
}

- (void)cancelSearch
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__MRAVReconnaissanceSession_cancelSearch__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

void __41__MRAVReconnaissanceSession_cancelSearch__block_invoke(uint64_t a1)
{
}

uint64_t __55__MRAVReconnaissanceSession__onQueue_processSearchLoop__block_invoke(uint64_t a1, void *a2)
{
  return [a2 uid];
}

uint64_t __55__MRAVReconnaissanceSession__onQueue_processSearchLoop__block_invoke_49(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 outputDevices];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__MRAVReconnaissanceSession__onQueue_processSearchLoop__block_invoke_2;
  v9[3] = &unk_1E57DA0D0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v5;
  id v6 = v3;
  uint64_t v7 = objc_msgSend(v4, "mr_all:", v9);

  return v7;
}

uint64_t __55__MRAVReconnaissanceSession__onQueue_processSearchLoop__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 deviceSubtype] == 15
    && ([v3 clusterComposition],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        unint64_t v5 = [v4 count],
        unint64_t v6 = [v3 configuredClusterSize],
        v4,
        v5 < v6))
  {
    if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) containsObject:v3] & 1) == 0)
    {
      uint64_t v7 = _MRLogForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [v3 configuredClusterSize];
        uint64_t v9 = [*(id *)(a1 + 32) shortDescription];
        int v12 = 134218498;
        uint64_t v13 = v8;
        __int16 v14 = 2114;
        id v15 = v3;
        __int16 v16 = 2114;
        uint64_t v17 = v9;
        _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Found incomplete cluster (expected: %lu): %{public}@ in endpoint: %{public}@", (uint8_t *)&v12, 0x20u);
      }
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v3];
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 1;
  }

  return v10;
}

uint64_t __55__MRAVReconnaissanceSession__onQueue_processSearchLoop__block_invoke_52(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 deviceSubtype] == 15
    && ([v3 clusterComposition],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        unint64_t v5 = [v4 count],
        unint64_t v6 = [v3 configuredClusterSize],
        v4,
        v5 < v6))
  {
    if (([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) containsObject:v3] & 1) == 0)
    {
      uint64_t v7 = _MRLogForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 134218242;
        uint64_t v11 = [v3 configuredClusterSize];
        __int16 v12 = 2114;
        id v13 = v3;
        _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Found incomplete cluster device (expected: %lu): %{public}@", (uint8_t *)&v10, 0x16u);
      }
    }
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

- (void)_onQueue_concludeSearch
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (*(unsigned char *)(a1 + 44))
    {
      [*(id *)(a1 + 112) addEntriesFromDictionary:*(void *)(a1 + 24)];
      id v2 = _MRLogForCategory(0);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v3 = *(void *)(a1 + 112);
        int v6 = 138543362;
        uint64_t v7 = v3;
        _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Successfully found matching output devices: %{public}@", (uint8_t *)&v6, 0xCu);
      }

      uint64_t v4 = _MRLogForCategory(0);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 120);
        int v6 = 138543362;
        uint64_t v7 = v5;
        _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Successfully found matching endpoints: %{public}@", (uint8_t *)&v6, 0xCu);
      }

      -[MRAVReconnaissanceSession _onQueue_invokeCompletionWithMatchingDevices:matchingEndpoints:unanimousEndpoint:error:]((id *)a1, *(void **)(a1 + 112), *(void **)(a1 + 120), *(void **)(a1 + 128), 0);
    }
    -[MRAVReconnaissanceSession _onQueue_endSearch](a1);
  }
}

- (void)_onQueue_endSearch
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (*(void *)(a1 + 96))
    {
      uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
      [v3 handleFailureInMethod:sel__onQueue_endSearch, a1, @"MRAVReconnaissanceSession.m", 556, @"Invalid parameter not satisfying: %@", @"!self.completion" object file lineNumber description];
    }
    [*(id *)(a1 + 64) setDiscoveryMode:0];
    *(unsigned char *)(a1 + 44) = 0;
    [*(id *)(a1 + 104) invalidate];
    id v2 = *(void **)(a1 + 104);
    *(void *)(a1 + 104) = 0;
  }
}

- (MRRequestDetails)details
{
  return self->_details;
}

- (MRAVRoutingDiscoverySession)discoverySession
{
  return self->_discoverySession;
}

- (BOOL)useWeakMatching
{
  return self->_useWeakMatching;
}

- (void)setUseWeakMatching:(BOOL)a3
{
  self->_useWeakMatching = a3;
}

- (BOOL)returnPartialResults
{
  return self->_returnPartialResults;
}

- (void)setReturnPartialResults:(BOOL)a3
{
  self->_returnPartialResults = a3;
}

- (BOOL)waitForCompleteClusters
{
  return self->_waitForCompleteClusters;
}

- (void)setWaitForCompleteClusters:(BOOL)a3
{
  self->_waitForCompleteClusters = a3;
}

- (BOOL)shouldWaitForUnanimousEndpoints
{
  return self->_shouldWaitForUnanimousEndpoints;
}

- (void)setShouldWaitForUnanimousEndpoints:(BOOL)a3
{
  self->_shouldWaitForUnanimousEndpoints = a3;
}

- (NSArray)matchingLogicalDeviceIDs
{
  return self->_matchingLogicalDeviceIDs;
}

- (void)setMatchingLogicalDeviceIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastProcessedEndpoints, 0);
  objc_storeStrong((id *)&self->_lastProcessedOutputDevices, 0);
  objc_storeStrong((id *)&self->_availableEndpoints, 0);
  objc_storeStrong((id *)&self->_availableOutputDevices, 0);
  objc_storeStrong((id *)&self->_unanimousEndpoint, 0);
  objc_storeStrong((id *)&self->_matchingEndpointsFound, 0);
  objc_storeStrong((id *)&self->_matchingDevicesFound, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_discoverySessionCallbackToken, 0);
  objc_storeStrong((id *)&self->_matchingOutputDeviceUIDsSet, 0);
  objc_storeStrong((id *)&self->_matchingLogicalDeviceIDs, 0);
  objc_storeStrong((id *)&self->_discoverySession, 0);
  objc_storeStrong((id *)&self->_matchingOutputDeviceGroupID, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_knownIncompleteClusterMembers, 0);
  objc_storeStrong((id *)&self->_localMatchingDevicesFound, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __66__MRAVReconnaissanceSession_beginSearchWithTimeout_mapCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v6 = [*(id *)(a1 + 40) details];
  uint64_t v7 = [v6 requestID];
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  [v8 timeIntervalSinceDate:*(void *)(a1 + 32)];
  int v10 = 138544130;
  uint64_t v11 = @"ReconnaissanceSession.search";
  __int16 v12 = 2114;
  id v13 = v7;
  __int16 v14 = 2114;
  uint64_t v15 = a2;
  __int16 v16 = 2048;
  uint64_t v17 = v9;
  _os_log_error_impl(&dword_194F3C000, a3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", (uint8_t *)&v10, 0x2Au);
}

@end