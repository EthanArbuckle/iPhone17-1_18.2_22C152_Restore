@interface TSDClockStatistics
- (TSDClockStatistics)initWithClockIdentifier:(unint64_t)a3;
- (unint64_t)clockIdentifier;
- (void)dealloc;
- (void)didBeginClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5;
- (void)didChangeClockMasterForClock:(id)a3;
- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4;
- (void)didEndClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5;
- (void)didGetStatsOfLocalPortNumber:(unint64_t)a3 mean:(unint64_t)a4 median:(unint64_t)a5 stddev:(unint64_t)a6 min:(unint64_t)a7 max:(unint64_t)a8 numberOfSamples:(unsigned int)a9 forClock:(id)a10;
- (void)didProcessSync:(id)a3;
- (void)didResetClock:(id)a3;
- (void)finalizeClock;
- (void)logStatistics;
@end

@implementation TSDClockStatistics

- (void)logStatistics
{
  uint64_t v3 = mach_absolute_time();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = self->_clock;
    id v5 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v6 = [(TSDKernelClock *)self->_clock clockIdentifier];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PTP Clock Statistics for 0x%016llx\n", buf, 0xCu);
    }

    id v7 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(TSDKernelClock *)v4 grandmasterIdentity];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    Grandmaster Identity: 0x%016llx\n", buf, 0xCu);
    }

    unsigned int v9 = [(TSDKernelClock *)v4 lockState];
    if (v9 > 2) {
      v10 = @"Unknown";
    }
    else {
      v10 = off_10003C858[v9];
    }
    id v14 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(__CFString *)v10 UTF8String];
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    Clock lock state: %s\n", buf, 0xCu);
    }

    unint64_t v385 = 0;
    unint64_t v384 = 0;
    uint64_t v383 = 0;
    uint64_t v382 = 0;
    unint64_t v381 = 0;
    uint64_t v380 = 0;
    unsigned __int16 v379 = 0;
    id v378 = 0;
    unsigned int v16 = [(TSDKernelClock *)v4 getMachAbsoluteRateRatioNumerator:&v385 denominator:&v384 machAnchor:&v383 andDomainAnchor:&v381 forGrandmasterIdentity:&v380 portNumber:&v379 withError:&v378];
    id v17 = v378;
    id v18 = &_os_log_default;
    BOOL v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v19)
      {
        *(_DWORD *)buf = 134218496;
        *(void *)&buf[4] = v385;
        *(_WORD *)&buf[12] = 2048;
        unint64_t v389 = v384;
        __int16 v390 = 2048;
        double v391 = (double)v385 / (double)v384;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    Mach Rate Ratio: %llu/%llu (%0.12f)\n", buf, 0x20u);
      }

      id v20 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v383;
        *(_WORD *)&buf[12] = 2048;
        unint64_t v389 = v381;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    Mach Anchors: %llu, %llu\n", buf, 0x16u);
      }

      id v21 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v380;
        *(_WORD *)&buf[12] = 1024;
        LODWORD(v389) = v379;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    Mach Sync Identity: 0x%016llx.%hu\n", buf, 0x12u);
      }
    }
    else if (v19)
    {
      id v27 = [v17 localizedDescription];
      id v28 = [v27 UTF8String];
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v28;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    Mach Sync Info: failed to get rate ratio and anchors with error \"%s\"\n", buf, 0xCu);
    }
    id v377 = v17;
    unsigned int v29 = [(TSDKernelClock *)v4 getTimeSyncTimeRateRatioNumerator:&v385 denominator:&v384 timeSyncAnchor:&v382 andDomainAnchor:&v381 forGrandmasterIdentity:&v380 portNumber:&v379 withError:&v377];
    id v287 = v377;

    id v30 = &_os_log_default;
    BOOL v31 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    v289 = self;
    if (v29)
    {
      if (v31)
      {
        *(_DWORD *)buf = 134218496;
        *(void *)&buf[4] = v385;
        *(_WORD *)&buf[12] = 2048;
        unint64_t v389 = v384;
        __int16 v390 = 2048;
        double v391 = (double)v385 / (double)v384;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    TimeSync Rate Ratio: %llu/%llu (%0.12f)\n", buf, 0x20u);
      }

      id v32 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v382;
        *(_WORD *)&buf[12] = 2048;
        unint64_t v389 = v381;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    TimeSync Anchors: %llu, %llu\n", buf, 0x16u);
      }

      id v33 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v380;
        *(_WORD *)&buf[12] = 1024;
        LODWORD(v389) = v379;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    TimeSync Sync Identity: 0x%016llx.%hu\n", buf, 0x12u);
      }
    }
    else if (v31)
    {
      id v40 = [v287 localizedDescription];
      id v41 = [v40 UTF8String];
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v41;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    TimeSync Sync Info: failed to get rate ratio and anchors with error \"%s\"\n", buf, 0xCu);
    }
    v42 = [(TSDKernelClock *)v4 ports];
    id obj = +[NSMutableDictionary dictionary];
    v351 = +[NSMutableDictionary dictionary];
    long long v373 = 0u;
    long long v374 = 0u;
    long long v375 = 0u;
    long long v376 = 0u;
    id v43 = v42;
    id v44 = [v43 countByEnumeratingWithState:&v373 objects:v387 count:16];
    id v336 = v43;
    if (v44)
    {
      id v45 = v44;
      uint64_t v46 = *(void *)v374;
      do
      {
        for (i = 0; i != v45; i = (char *)i + 1)
        {
          if (*(void *)v374 != v46) {
            objc_enumerationMutation(v43);
          }
          v48 = *(void **)(*((void *)&v373 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
          }
          v49 = [v48 statistics];
          if (v49)
          {
            v50 = v49;
            v51 = [v49 portIdentifier];
            [obj setObject:v50 forKeyedSubscript:v51];

            v52 = [v50 portIdentifier];
            [v351 setObject:v48 forKeyedSubscript:v52];

            id v43 = v336;
          }
        }
        id v45 = [v43 countByEnumeratingWithState:&v373 objects:v387 count:16];
      }
      while (v45);
    }

    v53 = v289;
    if (!v289->_firstStatistics)
    {
      v286 = v4;
      v54 = +[TSDClockManager sharedClockManager];
      unint64_t v338 = (unint64_t)[v54 machAbsoluteTicksToNanoseconds:v3 - v289->_lastStatisticsTime];

      long long v371 = 0u;
      long long v372 = 0u;
      long long v369 = 0u;
      long long v370 = 0u;
      id v55 = obj;
      id v297 = [v55 countByEnumeratingWithState:&v369 objects:v386 count:16];
      if (!v297) {
        goto LABEL_479;
      }
      uint64_t v296 = *(void *)v370;
      id v288 = v55;
      while (1)
      {
        uint64_t v56 = 0;
        do
        {
          if (*(void *)v370 != v296) {
            objc_enumerationMutation(v55);
          }
          uint64_t v350 = v56;
          uint64_t v57 = *(void *)(*((void *)&v369 + 1) + 8 * v56);
          v58 = [v351 objectForKeyedSubscript:v57];
          v59 = [v55 objectForKeyedSubscript:v57];
          id v60 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    Port:\n", buf, 2u);
          }

          switch([v59 portType])
          {
            case 0u:
              id v61 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_87;
              }
              *(_WORD *)buf = 0;
              v62 = "        Port Type: Unknown\n";
              break;
            case 1u:
              id v63 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_87;
              }
              *(_WORD *)buf = 0;
              v62 = "        Port Type: Ethernet\n";
              break;
            case 2u:
              id v64 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_87;
              }
              *(_WORD *)buf = 0;
              v62 = "        Port Type: Unicast Link Layer PtP\n";
              break;
            case 3u:
              id v65 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_87;
              }
              *(_WORD *)buf = 0;
              v62 = "        Port Type: Unicast UDPv4 PtP\n";
              break;
            case 4u:
              id v66 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_87;
              }
              *(_WORD *)buf = 0;
              v62 = "        Port Type: Unicast UDPv6 PtP\n";
              break;
            case 5u:
              id v67 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_87;
              }
              *(_WORD *)buf = 0;
              v62 = "        Port Type: Unicast Link Layer EtE\n";
              break;
            case 6u:
              id v68 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_87;
              }
              *(_WORD *)buf = 0;
              v62 = "        Port Type: Unicast UDPv4 EtE\n";
              break;
            case 7u:
              id v69 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_87;
              }
              *(_WORD *)buf = 0;
              v62 = "        Port Type: Unicast UDPv6 EtE\n";
              break;
            case 8u:
              id v70 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_87;
              }
              *(_WORD *)buf = 0;
              v62 = "        Port Type: Local Clock\n";
              break;
            default:
              goto LABEL_88;
          }
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v62, buf, 2u);
LABEL_87:

LABEL_88:
          id v71 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            id v72 = [v58 interfaceName];
            id v73 = [v72 UTF8String];
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = v73;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "        Interface: %s\n", buf, 0xCu);
          }
          id v74 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            id v75 = [v58 destinationAddressString];
            id v76 = [v75 UTF8String];
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = v76;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "        Destination Address: %s\n", buf, 0xCu);
          }
          id v77 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v78 = [v58 propagationDelay];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v78;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "        Propgation Delay: %u\n", buf, 8u);
          }

          id v79 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v80 = [v58 minimumPropagationDelay];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v80;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "        Minimum Propagation Delay: %u\n", buf, 8u);
          }

          id v81 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v82 = [v58 maximumPropagationDelay];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v82;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "        Maximum Propagation Delay: %u\n", buf, 8u);
          }

          id v83 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v84 = [v58 minimumRawDelay];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v84;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "        Minimum Raw Delay: %u\n", buf, 8u);
          }

          id v85 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v86 = [v58 maximumRawDelay];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v86;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "        Maximum Raw Delay: %u\n", buf, 8u);
          }

          id v87 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v88 = [v58 portNumber];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v88;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "        Local Clock Port Number: %hu\n", buf, 8u);
          }

          id v89 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            id v90 = [v58 remoteClockIdentity];
            *(_DWORD *)buf = 134217984;
            *(void *)&buf[4] = v90;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "        Remote Clock Identity: 0x%016llx\n", buf, 0xCu);
          }

          id v91 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v92 = [v58 remotePortNumber];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v92;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "        Remote Clock Port Number: %hu\n", buf, 8u);
          }

          switch([v58 portRole])
          {
            case 0u:
              id v93 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_120;
              }
              *(_WORD *)buf = 0;
              v94 = "        Port Role: Unknown\n";
              break;
            case 1u:
              id v97 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_120;
              }
              *(_WORD *)buf = 0;
              v94 = "        Port Role: Disabled\n";
              break;
            case 2u:
              id v95 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_120;
              }
              *(_WORD *)buf = 0;
              v94 = "        Port Role: Passive\n";
              break;
            case 3u:
              id v98 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_120;
              }
              *(_WORD *)buf = 0;
              v94 = "        Port Role: Slave\n";
              break;
            case 4u:
              id v96 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_120;
              }
              *(_WORD *)buf = 0;
              v94 = "        Port Role: Master\n";
              break;
            default:
              goto LABEL_121;
          }
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v94, buf, 2u);
LABEL_120:

LABEL_121:
          v99 = [(NSDictionary *)v53->_lastStatistics objectForKeyedSubscript:v57];

          if (v99)
          {
            v100 = [(NSDictionary *)v53->_lastStatistics objectForKeyedSubscript:v57];
            unsigned int v101 = [v100 portRole];
            if (v101 != [v59 portRole])
            {
              id v102 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "        Port Role changed since last statistics log. Ignore expected counts.\n", buf, 2u);
              }
            }
            if ([v59 portRole] == 3 || objc_msgSend(v59, "portRole") == 2)
            {
              unint64_t v103 = v338 / sub_100018820((int)[v58 remoteSyncLogMeanInterval]);
              unint64_t v104 = v338 / sub_100018820((int)[v58 remoteAnnounceLogMeanInterval]);
            }
            else
            {
              LODWORD(v104) = 0;
              LODWORD(v103) = 0;
            }
            v343 = v58;
            if ([v59 portRole] == 4)
            {
              unint64_t v355 = v338 / sub_100018820((int)[v58 localSyncLogMeanInterval]);
              unint64_t v364 = v338 / sub_100018820((int)[v58 localAnnounceLogMeanInterval]);
            }
            else
            {
              LODWORD(v364) = 0;
              LODWORD(v355) = 0;
            }
            unsigned int v341 = [v59 receivedSyncCounter];
            unsigned int v339 = [v100 receivedSyncCounter];
            unsigned int v105 = v341 - v339;
            unsigned int v106 = [v59 receivedFollowUpCounter];
            unsigned int v107 = [v100 receivedFollowUpCounter];
            unsigned int v300 = [v59 receivedAnnounceCounter];
            unsigned int v344 = [v100 receivedAnnounceCounter];
            unsigned int v299 = [v59 receivedSignalCounter];
            unsigned int v298 = [v100 receivedSignalCounter];
            unsigned int v302 = [v59 receivedPacketDiscardCounter];
            unsigned int v301 = [v100 receivedPacketDiscardCounter];
            unsigned int v304 = [v59 syncReceiptTimeoutCounter];
            unsigned int v303 = [v100 syncReceiptTimeoutCounter];
            unsigned int v306 = [v59 announceReceiptTimeoutCounter];
            unsigned int v305 = [v100 announceReceiptTimeoutCounter];
            unsigned int v308 = [v59 allowedLostResponsesExceededCounter];
            unsigned int v307 = [v100 allowedLostResponsesExceededCounter];
            unsigned int v347 = [v59 transmittedSyncCounter];
            unsigned int v352 = [v100 transmittedSyncCounter];
            unsigned int v310 = [v59 transmittedFollowUpCounter];
            unsigned int v309 = [v100 transmittedFollowUpCounter];
            unsigned int v361 = [v59 transmittedAnnounceCounter];
            unsigned int v358 = [v100 transmittedAnnounceCounter];
            unsigned int v312 = [v59 transmittedSignalCounter];
            unsigned int v311 = [v100 transmittedSignalCounter];
            unsigned int v314 = [v59 transmittedPacketDiscardCounter];
            unsigned int v313 = [v100 transmittedPacketDiscardCounter];
            unsigned int v316 = [v59 attemptedSyncCounter];
            unsigned int v315 = [v100 attemptedSyncCounter];
            unsigned int v321 = [v59 attemptedFollowUpCounter];
            unsigned int v318 = [v100 attemptedFollowUpCounter];
            unsigned int v327 = [v59 attemptedAnnounceCounter];
            unsigned int v324 = [v100 attemptedAnnounceCounter];
            unsigned int v333 = [v59 attemptedSignalCounter];
            unsigned int v330 = [v100 attemptedSignalCounter];
            unsigned int v293 = [v59 rawDelayExceededCounter];
            unsigned int v292 = [v100 rawDelayExceededCounter];
            unsigned int v295 = [v59 rawDelayMeasurementCounter];
            unsigned int v294 = [v100 rawDelayMeasurementCounter];
            unsigned int v108 = ((int)v103 + 9) / 0xAu;
            id v109 = &_os_log_default;
            BOOL v110 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            BOOL v111 = v341 - v339 < v103 - v108 && v103 >= v108;
            if (v111 || v105 > v108 + v103)
            {
              if (v110)
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)&buf[4] = v341 - v339;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v103;
                LOWORD(v389) = 1024;
                *(_DWORD *)((char *)&v389 + 2) = ((int)v103 + 9) / 0xAu;
                v112 = "        Received Sync Counter: %u out of expected bounds (%u ± %u)\n";
                uint32_t v113 = 20;
LABEL_142:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v112, buf, v113);
              }
            }
            else if (v110)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v341 - v339;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v103;
              v112 = "        Received Sync Counter: %u expected %u\n";
              uint32_t v113 = 14;
              goto LABEL_142;
            }
            unsigned int v114 = v106 - v107;

            id v115 = &_os_log_default;
            BOOL v116 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            BOOL v117 = v114 >= v105 - 1 || v341 == v339;
            unsigned int v290 = v341 - v339 + 1;
            unsigned int v291 = v105 - 1;
            if (v117 && v114 <= v105 + 1)
            {
              if (v116)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v114;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v341 - v339;
                v118 = "        Received FollowUp Counter: %u expected %u\n";
                goto LABEL_153;
              }
            }
            else if (v116)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v114;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v341 - v339;
              v118 = "        Received FollowUp Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_153:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v118, buf, 0xEu);
            }
            unsigned int v119 = v300 - v344;

            unsigned int v120 = ((int)v104 + 9) / 0xAu;
            id v121 = &_os_log_default;
            BOOL v122 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            BOOL v123 = v300 - v344 < v104 - v120 && v104 >= v120;
            if (v123 || v119 > v120 + v104)
            {
              if (v122)
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)&buf[4] = v300 - v344;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v104;
                LOWORD(v389) = 1024;
                *(_DWORD *)((char *)&v389 + 2) = ((int)v104 + 9) / 0xAu;
                v124 = "        Received Announce Counter: %u out of expected bounds (%u ± %u)\n";
                uint32_t v125 = 20;
LABEL_163:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v124, buf, v125);
              }
            }
            else if (v122)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v300 - v344;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v104;
              v124 = "        Received Announce Counter: %u expected %u\n";
              uint32_t v125 = 14;
              goto LABEL_163;
            }

            id v126 = &_os_log_default;
            BOOL v127 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            BOOL v128 = v299 - v298 >= v119 - 1 || v300 == v344;
            if (v128 && v299 - v298 <= v119 + 1)
            {
              if (v127)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v299 - v298;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v300 - v344;
                v129 = "        Received Signal Counter: %u expected %u\n";
                goto LABEL_174;
              }
            }
            else if (v127)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v299 - v298;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v300 - v344;
              v129 = "        Received Signal Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_174:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v129, buf, 0xEu);
            }

            id v130 = &_os_log_default;
            BOOL v131 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v302 == v301)
            {
              unsigned int v132 = v347;
              unsigned int v133 = v308;
              if (v131)
              {
                *(void *)buf = 67109120;
                v134 = "        Received Packet Discard Counter: %u\n";
                goto LABEL_180;
              }
            }
            else
            {
              unsigned int v132 = v347;
              unsigned int v133 = v308;
              if (v131)
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&buf[4] = v302 - v301;
                v134 = "        Received Packet Discard Counter: %u greater than 0\n";
LABEL_180:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v134, buf, 8u);
              }
            }

            id v135 = &_os_log_default;
            BOOL v136 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v304 == v303)
            {
              if (v136)
              {
                *(void *)buf = 67109120;
                v137 = "        Received Sync Receipt Timeout Counter: %u\n";
                goto LABEL_186;
              }
            }
            else if (v136)
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v304 - v303;
              v137 = "        Received Sync Receipt Timeout Counter: %u greater than 0\n";
LABEL_186:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v137, buf, 8u);
            }

            id v138 = &_os_log_default;
            BOOL v139 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v306 == v305)
            {
              if (v139)
              {
                *(void *)buf = 67109120;
                v140 = "        Received Announce Receipt Timeout Counter: %u\n";
                goto LABEL_192;
              }
            }
            else if (v139)
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v306 - v305;
              v140 = "        Received Announce Receipt Timeout Counter: %u greater than 0\n";
LABEL_192:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v140, buf, 8u);
            }

            id v141 = &_os_log_default;
            BOOL v142 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v133 == v307)
            {
              if (v142)
              {
                *(void *)buf = 67109120;
                v143 = "        Received Allowed Lost Responses Exceeded Counter: %u\n";
                goto LABEL_198;
              }
            }
            else if (v142)
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v133 - v307;
              v143 = "        Received Allowed Lost Responses Exceeded Counter: %u greater than 0\n";
LABEL_198:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v143, buf, 8u);
            }
            unsigned int v144 = v132 - v352;

            unsigned int v145 = ((int)v355 + 9) / 0xAu;
            id v146 = &_os_log_default;
            BOOL v147 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            BOOL v148 = v132 - v352 < v355 - v145 && v355 >= v145;
            if (v148 || v144 > v145 + v355)
            {
              if (v147)
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)&buf[4] = v132 - v352;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v355;
                LOWORD(v389) = 1024;
                *(_DWORD *)((char *)&v389 + 2) = ((int)v355 + 9) / 0xAu;
                v149 = "        Transmitted Sync Counter: %u out of expected bounds (%u ± %u)\n";
                uint32_t v150 = 20;
LABEL_208:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v149, buf, v150);
              }
            }
            else if (v147)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v132 - v352;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v355;
              v149 = "        Transmitted Sync Counter: %u expected %u\n";
              uint32_t v150 = 14;
              goto LABEL_208;
            }

            id v151 = &_os_log_default;
            BOOL v152 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            BOOL v153 = v310 - v309 >= v144 - 1 || v132 == v352;
            if (v153 && v310 - v309 <= v144 + 1)
            {
              if (v152)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v310 - v309;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v132 - v352;
                v154 = "        Transmitted FollowUp Counter: %u expected %u\n";
                goto LABEL_219;
              }
            }
            else if (v152)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v310 - v309;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v132 - v352;
              v154 = "        Transmitted FollowUp Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_219:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v154, buf, 0xEu);
            }
            unsigned int v155 = v361 - v358;

            BOOL v156 = v361 - v358 < (int)v364 - 1 && v364 != 0;
            id v157 = &_os_log_default;
            BOOL v158 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v156 || v155 > (int)v364 + 1)
            {
              if (v158)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v361 - v358;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v364;
                v159 = "        Transmitted Announce Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_229:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v159, buf, 0xEu);
              }
            }
            else if (v158)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v361 - v358;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v364;
              v159 = "        Transmitted Announce Counter: %u expected %u\n";
              goto LABEL_229;
            }

            id v160 = &_os_log_default;
            BOOL v161 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            BOOL v162 = v312 - v311 >= v155 - 1 || v361 == v358;
            if (v162 && v312 - v311 <= v155 + 1)
            {
              if (v161)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v312 - v311;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v361 - v358;
                v163 = "        Transmitted Signal Counter: %u expected %u\n";
                goto LABEL_240;
              }
            }
            else if (v161)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v312 - v311;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v361 - v358;
              v163 = "        Transmitted Signal Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_240:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v163, buf, 0xEu);
            }

            id v164 = &_os_log_default;
            BOOL v165 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v314 == v313)
            {
              unsigned int v166 = v316;
              if (v165)
              {
                *(void *)buf = 67109120;
                v167 = "        Transmitted Packet Discard Counter: %u\n";
                goto LABEL_246;
              }
            }
            else
            {
              unsigned int v166 = v316;
              if (v165)
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&buf[4] = v314 - v313;
                v167 = "        Transmitted Packet Discard Counter: %u greater than 0\n";
LABEL_246:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v167, buf, 8u);
              }
            }
            unsigned int v168 = v166 - v315;

            id v169 = &_os_log_default;
            BOOL v170 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            BOOL v171 = v168 < v355 - v145 && v355 >= v145;
            if (v171 || v168 > v145 + v355)
            {
              if (v170)
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)&buf[4] = v168;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v355;
                LOWORD(v389) = 1024;
                *(_DWORD *)((char *)&v389 + 2) = ((int)v355 + 9) / 0xAu;
                v172 = "        Attempted Sync Counter: %u out of expected bounds (%u ± %u)\n";
                uint32_t v173 = 20;
LABEL_256:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v172, buf, v173);
              }
            }
            else if (v170)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v168;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v355;
              v172 = "        Attempted Sync Counter: %u expected %u\n";
              uint32_t v173 = 14;
              goto LABEL_256;
            }

            id v174 = &_os_log_default;
            BOOL v175 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            BOOL v176 = v321 - v318 >= v144 - 1 || v347 == v352;
            if (v176 && v321 - v318 <= v144 + 1)
            {
              if (v175)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v321 - v318;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v144;
                v177 = "        Attempted FollowUp Counter: %u expected %u\n";
                goto LABEL_267;
              }
            }
            else if (v175)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v321 - v318;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v144;
              v177 = "        Attempted FollowUp Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_267:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v177, buf, 0xEu);
            }

            id v178 = &_os_log_default;
            BOOL v179 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            BOOL v180 = v327 - v324 >= (int)v364 - 1 || v364 == 0;
            if (v180 && v327 - v324 <= (int)v364 + 1)
            {
              if (v179)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v327 - v324;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v364;
                v181 = "        Attempted Announce Counter: %u expected %u\n";
                goto LABEL_278;
              }
            }
            else if (v179)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v327 - v324;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v364;
              v181 = "        Attempted Announce Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_278:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v181, buf, 0xEu);
            }

            id v182 = &_os_log_default;
            BOOL v183 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            BOOL v184 = v333 - v330 >= v155 - 1 || v361 == v358;
            if (v184 && v333 - v330 <= v155 + 1)
            {
              if (v183)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v333 - v330;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v361 - v358;
                v185 = "        Attempted Signal Counter: %u expected %u\n";
                goto LABEL_289;
              }
            }
            else if (v183)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v333 - v330;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v361 - v358;
              v185 = "        Attempted Signal Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_289:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v185, buf, 0xEu);
            }

            id v186 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v293 - v292;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "        Raw Delay Exceeded Counter: %u\n", buf, 8u);
            }

            id v187 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v295 - v294;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "        Raw Delay Measurements Counter: %u\n", buf, 8u);
            }

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              unint64_t v345 = sub_100018820((int)[v58 localPDelayLogMeanInterval]);
              unint64_t v188 = v338 / sub_100018820((int)[v58 remotePDelayLogMeanInterval]);
              unsigned int v189 = [v59 receivedPDelayRequestCounter];
              unsigned int v190 = [v100 receivedPDelayRequestCounter];
              unsigned int v191 = v189 - v190;
              unsigned int v317 = [v59 transmittedPDelayResponseCounter];
              unsigned int v192 = [v100 transmittedPDelayResponseCounter];
              unsigned int v322 = [v59 transmittedPDelayResponseFollowUpCounter];
              unsigned int v319 = [v100 transmittedPDelayResponseFollowUpCounter];
              unsigned int v328 = [v59 attemptedPDelayResponseCounter];
              unsigned int v325 = [v100 attemptedPDelayResponseCounter];
              unsigned int v334 = [v59 attemptedPDelayResponseFollowUpCounter];
              unsigned int v331 = [v100 attemptedPDelayResponseFollowUpCounter];
              unsigned int v362 = [v59 transmittedPDelayRequestCounter];
              unsigned int v365 = [v100 transmittedPDelayRequestCounter];
              unsigned int v342 = [v59 attemptedPDelayRequestCounter];
              unsigned int v340 = [v100 attemptedPDelayRequestCounter];
              unsigned int v353 = [v59 receivedPDelayResponseCounter];
              unsigned int v348 = [v100 receivedPDelayResponseCounter];
              unsigned int v359 = [v59 receivedPDelayResponseFollowUpCounter];
              unsigned int v356 = [v100 receivedPDelayResponseFollowUpCounter];
              unsigned int v193 = ((int)v188 + 9) / 0xAu;
              id v194 = &_os_log_default;
              BOOL v195 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              BOOL v196 = v189 - v190 < v188 - v193 && v188 >= v193;
              if (v196 || v191 > v193 + v188)
              {
                if (v195)
                {
                  *(_DWORD *)buf = 67109632;
                  *(_DWORD *)&buf[4] = v189 - v190;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v188;
                  LOWORD(v389) = 1024;
                  *(_DWORD *)((char *)&v389 + 2) = ((int)v188 + 9) / 0xAu;
                  v197 = "        Received PDelay Request Counter: %u out of expected bounds (%u ± %u)\n";
                  uint32_t v198 = 20;
LABEL_318:
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v197, buf, v198);
                }
              }
              else if (v195)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v189 - v190;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v188;
                v197 = "        Received PDelay Request Counter: %u expected %u\n";
                uint32_t v198 = 14;
                goto LABEL_318;
              }
              unsigned int v210 = v317 - v192;

              unsigned int v211 = v191 - 1;
              id v212 = &_os_log_default;
              BOOL v213 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              BOOL v214 = v317 - v192 >= v191 - 1 || v189 == v190;
              unsigned int v215 = v191 + 1;
              if (v214 && v210 <= v215)
              {
                if (v213)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v210;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v189 - v190;
                  v216 = "        Transmitted PDelay Response Counter: %u expected %u\n";
                  goto LABEL_329;
                }
              }
              else if (v213)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v210;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v189 - v190;
                v216 = "        Transmitted PDelay Response Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_329:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v216, buf, 0xEu);
              }

              id v217 = &_os_log_default;
              BOOL v218 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              BOOL v219 = v322 - v319 >= v211 || v189 == v190;
              if (v219 && v322 - v319 <= v215)
              {
                if (v218)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v322 - v319;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v189 - v190;
                  v220 = "        Transmitted PDelay Response FollowUp Counter: %u expected %u\n";
                  goto LABEL_340;
                }
              }
              else if (v218)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v322 - v319;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v189 - v190;
                v220 = "        Transmitted PDelay Response FollowUp Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_340:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v220, buf, 0xEu);
              }

              id v221 = &_os_log_default;
              BOOL v222 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              BOOL v223 = v328 - v325 >= v211 || v189 == v190;
              if (v223 && v328 - v325 <= v215)
              {
                if (v222)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v328 - v325;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v189 - v190;
                  v224 = "        Attempted PDelay Response Counter: %u expected %u\n";
                  goto LABEL_351;
                }
              }
              else if (v222)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v328 - v325;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v189 - v190;
                v224 = "        Attempted PDelay Response Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_351:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v224, buf, 0xEu);
              }

              id v225 = &_os_log_default;
              BOOL v226 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              BOOL v227 = v334 - v331 >= v211 || v189 == v190;
              if (v227 && v334 - v331 <= v215)
              {
                unsigned int v228 = v362;
                if (v226)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v334 - v331;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v191;
                  v229 = "        Attempted PDelay Response FollowUp Counter: %u expected %u\n";
                  goto LABEL_362;
                }
              }
              else
              {
                unsigned int v228 = v362;
                if (v226)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v334 - v331;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v191;
                  v229 = "        Attempted PDelay Response FollowUp Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_362:
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v229, buf, 0xEu);
                }
              }
              unsigned int v230 = v228 - v365;
              unint64_t v231 = v338 / v345;

              unsigned int v232 = ((v338 / v345) + 9) / 0xA;
              unsigned int v233 = v338 / v345 - v232;
              id v234 = &_os_log_default;
              BOOL v235 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              BOOL v236 = v228 - v365 < v233 && v231 >= v232;
              unsigned int v237 = v232 + v231;
              if (v236 || v230 > v237)
              {
                if (v235)
                {
                  *(_DWORD *)buf = 67109632;
                  *(_DWORD *)&buf[4] = v228 - v365;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v338 / v345;
                  LOWORD(v389) = 1024;
                  *(_DWORD *)((char *)&v389 + 2) = (*(_DWORD *)&buf[10] + 9) / 0xAu;
                  v238 = "        Transmitted PDelay Request Counter: %u out of expected bounds (%u ± %u)\n";
                  uint32_t v239 = 20;
LABEL_372:
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v238, buf, v239);
                }
              }
              else if (v235)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v228 - v365;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v338 / v345;
                v238 = "        Transmitted PDelay Request Counter: %u expected %u\n";
                uint32_t v239 = 14;
                goto LABEL_372;
              }

              id v240 = &_os_log_default;
              BOOL v241 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              BOOL v242 = v342 - v340 < v233 && v231 >= v232;
              if (v242 || v342 - v340 > v237)
              {
                if (v241)
                {
                  *(_DWORD *)buf = 67109632;
                  *(_DWORD *)&buf[4] = v342 - v340;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v338 / v345;
                  LOWORD(v389) = 1024;
                  *(_DWORD *)((char *)&v389 + 2) = (*(_DWORD *)&buf[10] + 9) / 0xAu;
                  v243 = "        Attempted PDelay Request Counter: %u out of expected bounds (%u ± %u)\n";
                  uint32_t v244 = 20;
LABEL_382:
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v243, buf, v244);
                }
              }
              else if (v241)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v342 - v340;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v338 / v345;
                v243 = "        Attempted PDelay Request Counter: %u expected %u\n";
                uint32_t v244 = 14;
                goto LABEL_382;
              }

              id v245 = &_os_log_default;
              BOOL v246 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              BOOL v247 = v353 - v348 >= v230 - 1 || v228 == v365;
              unsigned int v248 = v230 + 1;
              if (v247 && v353 - v348 <= v248)
              {
                v58 = v343;
                if (v246)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v353 - v348;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v228 - v365;
                  v249 = "        Received PDelay Response Counter: %u expected %u\n";
                  goto LABEL_393;
                }
              }
              else
              {
                v58 = v343;
                if (v246)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v353 - v348;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v228 - v365;
                  v249 = "        Received PDelay Response Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_393:
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v249, buf, 0xEu);
                }
              }

              id v250 = &_os_log_default;
              BOOL v251 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              BOOL v252 = v359 - v356 >= v230 - 1 || v228 == v365;
              if (v252 && v359 - v356 <= v248)
              {
                if (v251)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v359 - v356;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v228 - v365;
                  v253 = "        Received PDelay Response FollowUp Counter: %u expected %u\n";
                  goto LABEL_404;
                }
LABEL_475:

LABEL_476:
                id v55 = v288;
                v53 = v289;
                goto LABEL_477;
              }
              if (!v251) {
                goto LABEL_475;
              }
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v359 - v356;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v228 - v365;
              v253 = "        Received PDelay Response FollowUp Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_404:
              uint32_t v254 = 14;
LABEL_474:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v253, buf, v254);
              goto LABEL_475;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_476;
            }
            if ([v59 portRole] == 4) {
              unsigned int v199 = v144;
            }
            else {
              unsigned int v199 = 0;
            }
            if ([v59 portRole] == 3) {
              unsigned int v200 = v341 - v339;
            }
            else {
              unsigned int v200 = 0;
            }
            unsigned int v360 = v200;
            unsigned int v201 = [v59 receivedDelayRequestCounter];
            unsigned int v202 = [v100 receivedDelayRequestCounter];
            unsigned int v203 = v201 - v202;
            unsigned int v204 = [v59 transmittedDelayResponseCounter];
            unsigned int v205 = [v100 transmittedDelayResponseCounter];
            unsigned int v323 = [v59 attemptedDelayResponseCounter];
            unsigned int v320 = [v100 attemptedDelayResponseCounter];
            unsigned int v329 = [v59 transmittedDelayRequestCounter];
            unsigned int v326 = [v100 transmittedDelayRequestCounter];
            unsigned int v335 = [v59 attemptedDelayRequestCounter];
            unsigned int v332 = [v100 attemptedDelayRequestCounter];
            unsigned int v349 = [v59 receivedDelayResponseCounter];
            unsigned int v346 = [v100 receivedDelayResponseCounter];
            unsigned int v357 = [v59 supersededSyncCounter];
            unsigned int v354 = [v100 supersededSyncCounter];
            unsigned int v366 = [v59 supersededDelayCounter];
            unsigned int v363 = [v100 supersededDelayCounter];
            BOOL v206 = v201 - v202 < v199 - 1 && v199 != 0;
            id v207 = &_os_log_default;
            BOOL v208 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v206 || v203 > v199 + 1)
            {
              if (v208)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v201 - v202;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v199;
                v209 = "        Received Delay Request Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_407:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v209, buf, 0xEu);
              }
            }
            else if (v208)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v201 - v202;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v199;
              v209 = "        Received Delay Request Counter: %u expected %u\n";
              goto LABEL_407;
            }
            unsigned int v255 = v204 - v205;

            id v256 = &_os_log_default;
            BOOL v257 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            BOOL v258 = v204 - v205 >= v203 - 1 || v201 == v202;
            unsigned int v259 = v203 + 1;
            if (v258 && v255 <= v259)
            {
              if (v257)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v255;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v201 - v202;
                v260 = "        Transmitted Delay Response Counter: %u expected %u\n";
                goto LABEL_418;
              }
            }
            else if (v257)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v255;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v201 - v202;
              v260 = "        Transmitted Delay Response Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_418:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v260, buf, 0xEu);
            }

            id v261 = &_os_log_default;
            BOOL v262 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            BOOL v263 = v323 - v320 >= v203 - 1 || v201 == v202;
            if (v263 && v323 - v320 <= v259)
            {
              v58 = v343;
              unsigned int v264 = v291;
              if (v262)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v323 - v320;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v203;
                v265 = "        Attempted Delay Response Counter: %u expected %u\n";
                goto LABEL_429;
              }
            }
            else
            {
              v58 = v343;
              unsigned int v264 = v291;
              if (v262)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v323 - v320;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v203;
                v265 = "        Attempted Delay Response Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_429:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v265, buf, 0xEu);
              }
            }

            id v266 = &_os_log_default;
            BOOL v267 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            BOOL v268 = v329 - v326 >= v264 || v341 == v339;
            if (v268 && v329 - v326 <= v290)
            {
              if (v267)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v329 - v326;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v341 - v339;
                v269 = "        Transmitted Delay Request Counter: %u expected %u\n";
                goto LABEL_440;
              }
            }
            else if (v267)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v329 - v326;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v341 - v339;
              v269 = "        Transmitted Delay Request Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_440:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v269, buf, 0xEu);
            }

            id v270 = &_os_log_default;
            BOOL v271 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            BOOL v272 = v335 - v332 >= v264 || v341 == v339;
            if (v272 && v335 - v332 <= v290)
            {
              if (v271)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v335 - v332;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v341 - v339;
                v273 = "        Attempted Delay Request Counter: %u expected %u\n";
                goto LABEL_451;
              }
            }
            else if (v271)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v335 - v332;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v341 - v339;
              v273 = "        Attempted Delay Request Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_451:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v273, buf, 0xEu);
            }

            BOOL v274 = v349 - v346 < v360 - 1 && v360 != 0;
            id v275 = &_os_log_default;
            BOOL v276 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v274 || v349 - v346 > v360 + 1)
            {
              if (v276)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v349 - v346;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v360;
                v277 = "        Received Delay Response Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_461:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v277, buf, 0xEu);
              }
            }
            else if (v276)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v349 - v346;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v360;
              v277 = "        Received Delay Response Counter: %u expected %u\n";
              goto LABEL_461;
            }

            id v278 = &_os_log_default;
            BOOL v279 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v357 == v354)
            {
              unsigned int v280 = v366;
              if (v279)
              {
                *(void *)buf = 67109120;
                v281 = "        Superseded Sync Counter: %u expected 0\n";
                goto LABEL_467;
              }
            }
            else
            {
              unsigned int v280 = v366;
              if (v279)
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&buf[4] = v357 - v354;
                v281 = "        Superseded Sync Counter: %u out of expected bounds (0)\n";
LABEL_467:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v281, buf, 8u);
              }
            }

            id v282 = &_os_log_default;
            BOOL v283 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v280 == v363)
            {
              if (!v283) {
                goto LABEL_475;
              }
              *(void *)buf = 67109120;
              v253 = "        Superseded Delay Counter: %u expected 0\n";
            }
            else
            {
              if (!v283) {
                goto LABEL_475;
              }
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v280 - v363;
              v253 = "        Superseded Delay Counter: %u out of expected bounds (0)\n";
            }
            uint32_t v254 = 8;
            goto LABEL_474;
          }
LABEL_477:

          uint64_t v56 = v350 + 1;
        }
        while (v297 != (id)(v350 + 1));
        id v297 = [v55 countByEnumeratingWithState:&v369 objects:v386 count:16];
        if (!v297)
        {
LABEL_479:

          v4 = v286;
          id v43 = v336;
          break;
        }
      }
    }
    v53->_firstStatistics = 0;
    v53->_lastStatisticsTime = v3;
    objc_storeStrong((id *)&v53->_lastStatistics, obj);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v11 = [(TSDKernelClock *)self->_clock clockIdentifier];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Clock Statistics for 0x%016llx\n", buf, 0xCu);
    }
    unsigned int v12 = [(TSDKernelClock *)self->_clock lockState];
    if (v12 > 2) {
      v13 = @"Unknown";
    }
    else {
      v13 = off_10003C858[v12];
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = [(__CFString *)v13 UTF8String];
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v22;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    Clock lock state: %s\n", buf, 0xCu);
    }
    unint64_t v385 = 0;
    unint64_t v384 = 0;
    uint64_t v383 = 0;
    uint64_t v382 = 0;
    unint64_t v381 = 0;
    clock = self->_clock;
    id v368 = 0;
    unsigned int v24 = [(TSDKernelClock *)clock getMachAbsoluteRateRatioNumerator:&v385 denominator:&v384 machAnchor:&v383 andDomainAnchor:&v381 withError:&v368];
    id v25 = v368;
    BOOL v26 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v24)
    {
      if (v26)
      {
        *(_DWORD *)buf = 134218496;
        *(void *)&buf[4] = v385;
        *(_WORD *)&buf[12] = 2048;
        unint64_t v389 = v384;
        __int16 v390 = 2048;
        double v391 = (double)v385 / (double)v384;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    Mach Rate Ratio: %llu/%llu (%0.12f)\n", buf, 0x20u);
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v383;
        *(_WORD *)&buf[12] = 2048;
        unint64_t v389 = v381;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    Mach Anchors: %llu, %llu\n", buf, 0x16u);
      }
    }
    else if (v26)
    {
      id v34 = [v25 localizedDescription];
      id v35 = [v34 UTF8String];
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v35;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    Mach Sync Info: failed to get rate ratio and anchors with error \"%s\"\n", buf, 0xCu);
    }
    v36 = self->_clock;
    id v367 = v25;
    unsigned int v37 = [(TSDKernelClock *)v36 getTimeSyncTimeRateRatioNumerator:&v385 denominator:&v384 timeSyncAnchor:&v382 andDomainAnchor:&v381 withError:&v367];
    id v38 = v367;

    BOOL v39 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v37)
    {
      if (v39)
      {
        *(_DWORD *)buf = 134218496;
        *(void *)&buf[4] = v385;
        *(_WORD *)&buf[12] = 2048;
        unint64_t v389 = v384;
        __int16 v390 = 2048;
        double v391 = (double)v385 / (double)v384;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    TimeSync Rate Ratio: %llu/%llu (%0.12f)\n", buf, 0x20u);
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v382;
        *(_WORD *)&buf[12] = 2048;
        unint64_t v389 = v381;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    TimeSync Anchors: %llu, %llu\n", buf, 0x16u);
      }
    }
    else if (v39)
    {
      id v284 = [v38 localizedDescription];
      id v285 = [v284 UTF8String];
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v285;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "    TimeSync Sync Info: failed to get rate ratio and anchors with error \"%s\"\n", buf, 0xCu);
    }
  }
}

- (void)didProcessSync:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_hasSyncedSinceLocked)
  {
    uint64_t v27 = 0;
    id v28 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    unsigned __int16 v22 = 0;
    id v21 = 0;
    unsigned int v6 = [v4 getMachAbsoluteRateRatioNumerator:&v28 denominator:&v27 machAnchor:&v26 andDomainAnchor:&v24 forGrandmasterIdentity:&v23 portNumber:&v22 withError:&v21];
    id v7 = v21;
    BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        unint64_t v9 = [(TSDClockStatistics *)self clockIdentifier];
        *(_DWORD *)buf = 134219520;
        unint64_t v30 = v9;
        __int16 v31 = 2048;
        id v32 = v28;
        __int16 v33 = 2048;
        uint64_t v34 = v27;
        __int16 v35 = 2048;
        uint64_t v36 = v26;
        __int16 v37 = 2048;
        uint64_t v38 = v24;
        __int16 v39 = 2048;
        uint64_t v40 = v23;
        __int16 v41 = 1024;
        int v42 = v22;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: First MachSync %llu,%llu,%llu,%llu,0x%016llx,%hu\n", buf, 0x44u);
      }
    }
    else if (v8)
    {
      unint64_t v10 = [(TSDClockStatistics *)self clockIdentifier];
      id v11 = [v7 localizedDescription];
      id v12 = [v11 UTF8String];
      *(_DWORD *)buf = 134218242;
      unint64_t v30 = v10;
      __int16 v31 = 2080;
      id v32 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: failed to get mach rate ratio and anchors with error \"%s\"\n", buf, 0x16u);
    }
    id v20 = v7;
    unsigned int v13 = [v5 getTimeSyncTimeRateRatioNumerator:&v28 denominator:&v27 timeSyncAnchor:&v25 andDomainAnchor:&v24 forGrandmasterIdentity:&v23 portNumber:&v22 withError:&v20];
    id v14 = v20;

    BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        unint64_t v16 = [(TSDClockStatistics *)self clockIdentifier];
        *(_DWORD *)buf = 134219520;
        unint64_t v30 = v16;
        __int16 v31 = 2048;
        id v32 = v28;
        __int16 v33 = 2048;
        uint64_t v34 = v27;
        __int16 v35 = 2048;
        uint64_t v36 = v25;
        __int16 v37 = 2048;
        uint64_t v38 = v24;
        __int16 v39 = 2048;
        uint64_t v40 = v23;
        __int16 v41 = 1024;
        int v42 = v22;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: First TimeSync %llu,%llu,%llu,%llu,0x%016llx,%hu\n", buf, 0x44u);
      }
    }
    else if (v15)
    {
      unint64_t v17 = [(TSDClockStatistics *)self clockIdentifier];
      id v18 = [v14 localizedDescription];
      id v19 = [v18 UTF8String];
      *(_DWORD *)buf = 134218242;
      unint64_t v30 = v17;
      __int16 v31 = 2080;
      id v32 = v19;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: failed to get timesync rate ratio and anchors with error \"%s\"\n", buf, 0x16u);
    }
    self->_hasSyncedSinceLocked = 1;
  }
}

- (TSDClockStatistics)initWithClockIdentifier:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)TSDClockStatistics;
  id v4 = [(TSDClockStatistics *)&v12 init];
  id v5 = v4;
  if (v4)
  {
    if (a3 == -1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        id v14 = "clockIdentifier != TSNullClockIdentifier";
        __int16 v15 = 2048;
        uint64_t v16 = 0;
        __int16 v17 = 2048;
        uint64_t v18 = 0;
        __int16 v19 = 2080;
        id v20 = &unk_100030E47;
        __int16 v21 = 2080;
        unsigned __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockStatistics.m";
        __int16 v23 = 1024;
        int v24 = 103;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
      }
      id v7 = v5;
      id v5 = 0;
    }
    else
    {
      v4->_clockIdentifier = a3;
      v4->_firstStatistics = 1;
      unsigned int v6 = +[TSDClockManager sharedClockManager];
      id v7 = [v6 clockWithClockIdentifier:-[TSDClockStatistics clockIdentifier](v5, "clockIdentifier")];

      if (v7)
      {
        objc_storeStrong((id *)&v5->_clock, v7);
        BOOL v8 = dispatch_get_global_queue(0, 0);
        id v11 = v7;
        v5->_stateDumpHandler = os_state_add_handler();

        -[TSDKernelClock addClient:](v5->_clock, "addClient:", v5, _NSConcreteStackBlock, 3221225472, sub_10001868C, &unk_10003C838);
        unint64_t v9 = v11;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          id v14 = "clock != nil";
          __int16 v15 = 2048;
          uint64_t v16 = 0;
          __int16 v17 = 2048;
          uint64_t v18 = 0;
          __int16 v19 = 2080;
          id v20 = &unk_100030E47;
          __int16 v21 = 2080;
          unsigned __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockStatistics.m";
          __int16 v23 = 1024;
          int v24 = 110;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        }
        unint64_t v9 = v5;
        id v5 = 0;
      }
    }
  }
  return v5;
}

- (void)finalizeClock
{
  [(TSDKernelClock *)self->_clock removeClient:self];
  [(TSDKernelClock *)self->_clock finalizeNotifications];
  clock = self->_clock;
  self->_clock = 0;
}

- (void)didResetClock:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    unint64_t v5 = [(TSDClockStatistics *)self clockIdentifier];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: reset clock\n", (uint8_t *)&v4, 0xCu);
  }
}

- (void)didChangeClockMasterForClock:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    unint64_t v5 = [(TSDClockStatistics *)self clockIdentifier];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: master clock changed\n", (uint8_t *)&v4, 0xCu);
  }
}

- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4
{
  id v6 = a4;
  if (a3 > 2) {
    id v7 = @"Unknown";
  }
  else {
    id v7 = off_10003C858[a3];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218498;
    unint64_t v9 = [(TSDClockStatistics *)self clockIdentifier];
    __int16 v10 = 1024;
    int v11 = a3;
    __int16 v12 = 2080;
    id v13 = [(__CFString *)v7 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: set lock state to %u (%s)\n", (uint8_t *)&v8, 0x1Cu);
  }
  if (a3 == 2) {
    self->_hasSyncedSinceLocked = 0;
  }
}

- (void)didBeginClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5
{
  int v5 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218496;
    unint64_t v9 = [(TSDClockStatistics *)self clockIdentifier];
    __int16 v10 = 2048;
    unint64_t v11 = a3;
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: begin grandmaster change GMID 0x%016llx local port %hu\n", (uint8_t *)&v8, 0x1Cu);
  }
}

- (void)didEndClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5
{
  int v5 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218496;
    unint64_t v9 = [(TSDClockStatistics *)self clockIdentifier];
    __int16 v10 = 2048;
    unint64_t v11 = a3;
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: end grandmaster change GMID 0x%016llx local port %hu\n", (uint8_t *)&v8, 0x1Cu);
  }
}

- (void)didGetStatsOfLocalPortNumber:(unint64_t)a3 mean:(unint64_t)a4 median:(unint64_t)a5 stddev:(unint64_t)a6 min:(unint64_t)a7 max:(unint64_t)a8 numberOfSamples:(unsigned int)a9 forClock:(id)a10
{
  id v14 = [a10 portWithPortNumber:(unsigned __int16)a3];
  unint64_t v15 = (unint64_t)[v14 remoteClockIdentity];
  unsigned __int8 v16 = BYTE5(v15);
  unint64_t v17 = v15 >> 40;
  v32[0] = @"LocalLinkType";
  __int16 v31 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v14 localLinkType]);
  v33[0] = v31;
  v32[1] = @"RemoteLinkType";
  unint64_t v30 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v14 remoteLinkType]);
  v33[1] = v30;
  v32[2] = @"LocalTimestampingMode";
  unsigned int v29 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v14 localTimestampingMode]);
  v33[2] = v29;
  v32[3] = @"RemoteTimestampingMode";
  id v28 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v14 remoteTimestampingMode]);
  v33[3] = v28;
  v32[4] = @"PortType";
  uint64_t v18 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v14 portType]);
  v33[4] = v18;
  v32[5] = @"MinimumDelay";
  __int16 v19 = +[NSNumber numberWithDouble:(double)a7 / 1000.0];
  v33[5] = v19;
  v32[6] = @"MaximumDelay";
  id v20 = +[NSNumber numberWithDouble:(double)a8 / 1000.0];
  v33[6] = v20;
  v32[7] = @"MeanDelay";
  __int16 v21 = +[NSNumber numberWithDouble:(double)a4 / 1000.0];
  v33[7] = v21;
  v32[8] = @"MedianDelay";
  unsigned __int16 v22 = +[NSNumber numberWithDouble:(double)a5 / 1000.0];
  v33[8] = v22;
  v32[9] = @"StandardDeviation";
  __int16 v23 = +[NSNumber numberWithDouble:(double)a6 / 1000.0];
  v33[9] = v23;
  v32[10] = @"NumberOfSamples";
  int v24 = +[NSNumber numberWithUnsignedInt:a9];
  v33[10] = v24;
  v32[11] = @"RemoteOUI";
  uint64_t v25 = +[NSString stringWithFormat:@"%02x-%02x-%02x", WORD1(v17), BYTE1(v17), v16];
  v33[11] = v25;
  uint64_t v26 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:12];

  AnalyticsSendEvent();
}

- (void)dealloc
{
  if (self->_stateDumpHandler) {
    os_state_remove_handler();
  }
  v3.receiver = self;
  v3.super_class = (Class)TSDClockStatistics;
  [(TSDClockStatistics *)&v3 dealloc];
}

- (unint64_t)clockIdentifier
{
  return self->_clockIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastStatistics, 0);

  objc_storeStrong((id *)&self->_clock, 0);
}

@end