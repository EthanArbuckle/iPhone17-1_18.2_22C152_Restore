@interface WiFiFindAndJoinRequest
- (BOOL)_canPerformRetry:(id)a3;
- (BOOL)_checkAndRequestChipResetIfNeeded;
- (BOOL)_runFindAndJoinOnInterface:(id)a3 outError:(id *)a4;
- (BOOL)runAsynchronouslyOnQueue:(id)a3 onInterface:(id)a4 withReply:(id)a5;
- (BOOL)runSynchronouslyOnQueue:(id)a3 onInterface:(id)a4 outError:(id *)a5;
- (CWFInterface)interface;
- (CWFScanResult)joinedNetwork;
- (NSDate)startedAt;
- (NSMutableArray)joinFailureList;
- (NSMutableArray)scanFailureList;
- (NSMutableSet)joinCandidates;
- (NSMutableSet)scannedChannels;
- (NSMutableSet)supported2GHzChannels;
- (NSMutableSet)supported5GHzChannels;
- (NSMutableSet)supported6GHzChannels;
- (NSString)networkName;
- (NSString)password;
- (OS_dispatch_semaphore)chipResetWaiter;
- (WiFiFindAndJoinRequest)initWithNetworkName:(id)a3;
- (double)timeout;
- (double)totalJoinTime;
- (double)totalScanTime;
- (id)_printSupportedChannels;
- (id)description;
- (unint64_t)channelBand;
- (unint64_t)channelNumber;
- (void)_chipResetDidComplete:(id)a3;
- (void)_populateSupportedChannels;
- (void)dealloc;
- (void)setChannelBand:(unint64_t)a3;
- (void)setChannelNumber:(unint64_t)a3;
- (void)setChipResetWaiter:(id)a3;
- (void)setInterface:(id)a3;
- (void)setJoinCandidates:(id)a3;
- (void)setJoinFailureList:(id)a3;
- (void)setJoinedNetwork:(id)a3;
- (void)setNetworkName:(id)a3;
- (void)setPassword:(id)a3;
- (void)setScanFailureList:(id)a3;
- (void)setScannedChannels:(id)a3;
- (void)setStartedAt:(id)a3;
- (void)setSupported2GHzChannels:(id)a3;
- (void)setSupported5GHzChannels:(id)a3;
- (void)setSupported6GHzChannels:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setTotalJoinTime:(double)a3;
- (void)setTotalScanTime:(double)a3;
- (void)submitMetric;
@end

@implementation WiFiFindAndJoinRequest

- (WiFiFindAndJoinRequest)initWithNetworkName:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)WiFiFindAndJoinRequest;
  id v3 = a3;
  v4 = [(WiFiFindAndJoinRequest *)&v25 init];
  -[WiFiFindAndJoinRequest setNetworkName:](v4, "setNetworkName:", v3, v25.receiver, v25.super_class);

  [(WiFiFindAndJoinRequest *)v4 setChannelNumber:0];
  [(WiFiFindAndJoinRequest *)v4 setChannelBand:0];
  [(WiFiFindAndJoinRequest *)v4 setStartedAt:0];
  [(WiFiFindAndJoinRequest *)v4 setTotalScanTime:0.0];
  [(WiFiFindAndJoinRequest *)v4 setTotalJoinTime:0.0];
  [(WiFiFindAndJoinRequest *)v4 setTimeout:60.0];
  [(WiFiFindAndJoinRequest *)v4 setChipResetWaiter:0];
  v5 = +[NSMutableArray array];
  [(WiFiFindAndJoinRequest *)v4 setScanFailureList:v5];

  v6 = +[NSMutableArray array];
  [(WiFiFindAndJoinRequest *)v4 setJoinFailureList:v6];

  v7 = +[NSMutableSet set];
  [(WiFiFindAndJoinRequest *)v4 setSupported2GHzChannels:v7];

  v8 = +[NSMutableSet set];
  [(WiFiFindAndJoinRequest *)v4 setSupported5GHzChannels:v8];

  v9 = +[NSMutableSet set];
  [(WiFiFindAndJoinRequest *)v4 setSupported6GHzChannels:v9];

  v10 = +[NSMutableSet set];
  [(WiFiFindAndJoinRequest *)v4 setScannedChannels:v10];

  v11 = +[NSMutableSet set];
  [(WiFiFindAndJoinRequest *)v4 setJoinCandidates:v11];

  v12 = +[NSNotificationCenter defaultCenter];
  [v12 addObserver:v4 selector:"_chipResetDidComplete:" name:@"WiFiChipResetCompleted" object:0];

  id v13 = [objc_alloc((Class)CWFInterface) initWithServiceType:1];
  [(WiFiFindAndJoinRequest *)v4 setInterface:v13];

  v14 = [(WiFiFindAndJoinRequest *)v4 interface];

  if (v14)
  {
    v15 = [(WiFiFindAndJoinRequest *)v4 interface];
    [v15 activate];
  }
  else
  {
    BOOL v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v17) {
      sub_1001961B4(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    v15 = v4;
    v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSMutableString stringWithFormat:@"< %@:%p ", v4, self];

  v6 = [(WiFiFindAndJoinRequest *)self networkName];
  [v5 appendFormat:@"SSID='%@' ", v6];

  [v5 appendFormat:@"Channel=%d ", -[WiFiFindAndJoinRequest channelNumber](self, "channelNumber")];
  [v5 appendFormat:@"Band=%d ", -[WiFiFindAndJoinRequest channelBand](self, "channelBand")];
  [(WiFiFindAndJoinRequest *)self timeout];
  [v5 appendFormat:@"Timeout=%d ", (int)v7];
  [v5 appendString:@">"];

  return v5;
}

- (void)dealloc
{
  [(WiFiFindAndJoinRequest *)self setInterface:0];
  v3.receiver = self;
  v3.super_class = (Class)WiFiFindAndJoinRequest;
  [(WiFiFindAndJoinRequest *)&v3 dealloc];
}

- (BOOL)_canPerformRetry:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 code] == (id)82)
  {
    BOOL v6 = 0;
  }
  else
  {
    double v7 = [(WiFiFindAndJoinRequest *)self startedAt];
    if (v7)
    {
      v8 = +[NSDate date];
      v9 = [(WiFiFindAndJoinRequest *)self startedAt];
      [v8 timeIntervalSinceDate:v9];
      double v11 = v10;
      [(WiFiFindAndJoinRequest *)self timeout];
      char v13 = v11 > v12;
    }
    else
    {
      char v13 = 0;
    }

    v14 = [(WiFiFindAndJoinRequest *)self scanFailureList];
    v15 = (char *)[v14 count];
    v16 = [(WiFiFindAndJoinRequest *)self joinFailureList];
    BOOL v17 = &v15[(void)[v16 count]];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100196230((uint64_t)v5, v13, (unint64_t)v17 < 0xB);
    }
    BOOL v6 = ((unint64_t)v17 < 0xB) & ~v13;
  }

  return v6;
}

- (BOOL)_checkAndRequestChipResetIfNeeded
{
  [(WiFiFindAndJoinRequest *)self timeout];
  double v4 = v3;
  v5 = +[NSDate date];
  BOOL v6 = [(WiFiFindAndJoinRequest *)self startedAt];
  [v5 timeIntervalSinceDate:v6];
  double v8 = v7;

  v9 = [(WiFiFindAndJoinRequest *)self chipResetWaiter];
  if (v9 || (double v10 = v4 - v8, v10 < 0.0))
  {

    goto LABEL_10;
  }
  double v11 = [(WiFiFindAndJoinRequest *)self scanFailureList];
  double v12 = (char *)[v11 count];
  char v13 = [(WiFiFindAndJoinRequest *)self joinFailureList];
  v14 = &v12[(void)[v13 count]];

  if ((unint64_t)v14 < 3)
  {
LABEL_10:
    LOBYTE(v20) = 1;
    return v20;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1001963F0(self, v10);
  }
  v15 = +[NSNotificationCenter defaultCenter];
  [v15 postNotificationName:@"WiFiChipResetRequested" object:0 userInfo:0];

  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  [(WiFiFindAndJoinRequest *)self setChipResetWaiter:v16];

  BOOL v17 = [(WiFiFindAndJoinRequest *)self chipResetWaiter];
  dispatch_time_t v18 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
  intptr_t v19 = dispatch_semaphore_wait(v17, v18);

  BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (!v19)
  {
    if (v20) {
      sub_1001962F8(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    goto LABEL_10;
  }
  if (v20)
  {
    sub_100196374(v20, v21, v22, v23, v24, v25, v26, v27);
    LOBYTE(v20) = 0;
  }
  return v20;
}

- (void)_chipResetDidComplete:(id)a3
{
  double v4 = [(WiFiFindAndJoinRequest *)self chipResetWaiter];

  if (v4)
  {
    v5 = [(WiFiFindAndJoinRequest *)self chipResetWaiter];
    dispatch_semaphore_signal(v5);
  }
}

- (void)_populateSupportedChannels
{
  double v3 = [(WiFiFindAndJoinRequest *)self interface];
  double v4 = [v3 supportedChannelsWithCountryCode:0];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v19;
    *(void *)&long long v7 = 136315650;
    long long v17 = v7;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        double v11 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v10);
        if (objc_msgSend(v11, "width", v17, (void)v18) == 20)
        {
          if ([v11 band] == 1)
          {
            double v12 = [(WiFiFindAndJoinRequest *)self supported2GHzChannels];
LABEL_13:
            char v13 = v12;
            [v12 addObject:v11];

            goto LABEL_14;
          }
          if ([v11 band] == 2)
          {
            double v12 = [(WiFiFindAndJoinRequest *)self supported5GHzChannels];
            goto LABEL_13;
          }
          if ([v11 band] == 3)
          {
            double v12 = [(WiFiFindAndJoinRequest *)self supported6GHzChannels];
            goto LABEL_13;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            unsigned int v14 = [v11 band];
            unsigned int v15 = [v11 channel];
            *(_DWORD *)buf = v17;
            uint64_t v23 = "-[WiFiFindAndJoinRequest _populateSupportedChannels]";
            __int16 v24 = 1024;
            unsigned int v25 = v14;
            __int16 v26 = 1024;
            unsigned int v27 = v15;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: unknown band %d for supported channel %d", buf, 0x18u);
          }
        }
LABEL_14:
        double v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v16 = [v5 countByEnumeratingWithState:&v18 objects:v28 count:16];
      id v8 = v16;
    }
    while (v16);
  }
}

- (id)_printSupportedChannels
{
  double v3 = +[NSMutableString string];
  [v3 appendFormat:@"6GHz:("];
  double v4 = [(WiFiFindAndJoinRequest *)self supported6GHzChannels];
  id v5 = [v4 allObjects];
  id v6 = [v5 valueForKey:@"description"];
  long long v7 = [v6 componentsJoinedByString:@","];
  [v3 appendFormat:@"%@, ", v7];

  [v3 appendFormat:@","]);
  [v3 appendFormat:@"5GHz:("];
  id v8 = [(WiFiFindAndJoinRequest *)self supported5GHzChannels];
  uint64_t v9 = [v8 allObjects];
  double v10 = [v9 valueForKey:@"description"];
  double v11 = [v10 componentsJoinedByString:@","];
  [v3 appendFormat:@"%@, ", v11];

  [v3 appendFormat:@","]);
  [v3 appendFormat:@"2.4GHz:("];
  double v12 = [(WiFiFindAndJoinRequest *)self supported2GHzChannels];
  char v13 = [v12 allObjects];
  unsigned int v14 = [v13 valueForKey:@"description"];
  unsigned int v15 = [v14 componentsJoinedByString:@","];
  [v3 appendFormat:@"%@, ", v15];

  [v3 appendFormat:@""]);

  return v3;
}

- (BOOL)_runFindAndJoinOnInterface:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  long long v7 = +[NSMutableArray array];
  id v8 = +[NSMutableSet set];
  uint64_t v9 = [(WiFiFindAndJoinRequest *)self networkName];

  v140 = v6;
  if (!v9)
  {
    BOOL v130 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v130) {
      sub_1001964E4(v130, v131, v132, v133, v134, v135, v136, v137);
    }
    v147 = 0;
    v148 = 0;
    id v16 = 0;
    v141 = 0;
    v142 = 0;
    v74 = 0;
    goto LABEL_105;
  }
  [(WiFiFindAndJoinRequest *)self _populateSupportedChannels];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = [(WiFiFindAndJoinRequest *)self _printSupportedChannels];
    *(_DWORD *)buf = 136315650;
    v173 = "-[WiFiFindAndJoinRequest _runFindAndJoinOnInterface:outError:]";
    __int16 v174 = 2112;
    v175 = self;
    __int16 v176 = 2112;
    *(void *)v177 = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: request %@, supported channels:%@", buf, 0x20u);
  }
  if (![(WiFiFindAndJoinRequest *)self channelNumber]) {
    goto LABEL_17;
  }
  if (![(WiFiFindAndJoinRequest *)self channelBand]
    && [(WiFiFindAndJoinRequest *)self channelNumber] <= 0xE)
  {
    [(WiFiFindAndJoinRequest *)self setChannelBand:2];
  }
  unint64_t v12 = [(WiFiFindAndJoinRequest *)self channelBand];
  if (v12 == 2) {
    goto LABEL_15;
  }
  if (v12 == 6)
  {
    uint64_t v13 = 3;
    goto LABEL_16;
  }
  if (v12 != 5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100196700(self);
    }
LABEL_15:
    uint64_t v13 = 1;
    goto LABEL_16;
  }
  uint64_t v13 = 2;
LABEL_16:
  unsigned int v14 = +[CWFChannel channelWithNumber:[(WiFiFindAndJoinRequest *)self channelNumber] band:v13 width:20];
  [v7 addObject:v14];

LABEL_17:
  v148 = 0;
  unsigned int v15 = 0;
  id v16 = 0;
  v141 = 0;
  v142 = 0;
  long long v17 = 0;
  *(void *)&long long v11 = 136315394;
  long long v138 = v11;
  v149 = v7;
  v139 = a4;
  while (2)
  {
    v147 = v15;
    for (i = v17; ; i = v146)
    {
      if (!objc_msgSend(v7, "count", v138))
      {
        long long v19 = [(WiFiFindAndJoinRequest *)self supported6GHzChannels];
        id v20 = [v19 count];

        if (v20)
        {
          v143 = i;
          long long v166 = 0u;
          long long v167 = 0u;
          long long v164 = 0u;
          long long v165 = 0u;
          long long v21 = [(WiFiFindAndJoinRequest *)self supported6GHzChannels];
          id v22 = [v21 countByEnumeratingWithState:&v164 objects:v183 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v165;
            do
            {
              for (j = 0; j != v23; j = (char *)j + 1)
              {
                if (*(void *)v165 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v26 = *(void *)(*((void *)&v164 + 1) + 8 * (void)j);
                unsigned int v27 = [(WiFiFindAndJoinRequest *)self scannedChannels];
                unsigned __int8 v28 = [v27 containsObject:v26];

                if ((v28 & 1) == 0) {
                  [v149 addObject:v26];
                }
              }
              id v23 = [v21 countByEnumeratingWithState:&v164 objects:v183 count:16];
            }
            while (v23);
          }

          long long v7 = v149;
          i = v143;
        }
      }
      if (![v7 count])
      {
        v29 = [(WiFiFindAndJoinRequest *)self supported5GHzChannels];
        id v30 = [v29 count];

        if (v30)
        {
          v144 = i;
          long long v162 = 0u;
          long long v163 = 0u;
          long long v160 = 0u;
          long long v161 = 0u;
          v31 = [(WiFiFindAndJoinRequest *)self supported5GHzChannels];
          id v32 = [v31 countByEnumeratingWithState:&v160 objects:v182 count:16];
          if (v32)
          {
            id v33 = v32;
            uint64_t v34 = *(void *)v161;
            do
            {
              for (k = 0; k != v33; k = (char *)k + 1)
              {
                if (*(void *)v161 != v34) {
                  objc_enumerationMutation(v31);
                }
                uint64_t v36 = *(void *)(*((void *)&v160 + 1) + 8 * (void)k);
                v37 = [(WiFiFindAndJoinRequest *)self scannedChannels];
                unsigned __int8 v38 = [v37 containsObject:v36];

                if ((v38 & 1) == 0) {
                  [v149 addObject:v36];
                }
              }
              id v33 = [v31 countByEnumeratingWithState:&v160 objects:v182 count:16];
            }
            while (v33);
          }

          long long v7 = v149;
          i = v144;
        }
      }
      if (![v7 count])
      {
        v39 = [(WiFiFindAndJoinRequest *)self supported2GHzChannels];
        id v40 = [v39 count];

        if (v40)
        {
          v145 = i;
          long long v159 = 0u;
          long long v157 = 0u;
          long long v158 = 0u;
          long long v156 = 0u;
          v41 = [(WiFiFindAndJoinRequest *)self supported2GHzChannels];
          id v42 = [v41 countByEnumeratingWithState:&v156 objects:v181 count:16];
          if (v42)
          {
            id v43 = v42;
            uint64_t v44 = *(void *)v157;
            do
            {
              for (m = 0; m != v43; m = (char *)m + 1)
              {
                if (*(void *)v157 != v44) {
                  objc_enumerationMutation(v41);
                }
                uint64_t v46 = *(void *)(*((void *)&v156 + 1) + 8 * (void)m);
                v47 = [(WiFiFindAndJoinRequest *)self scannedChannels];
                unsigned __int8 v48 = [v47 containsObject:v46];

                if ((v48 & 1) == 0) {
                  [v149 addObject:v46];
                }
              }
              id v43 = [v41 countByEnumeratingWithState:&v156 objects:v181 count:16];
            }
            while (v43);
          }

          long long v7 = v149;
          i = v145;
        }
      }
      id v49 = objc_alloc_init((Class)CWFScanParameters);

      v50 = [(WiFiFindAndJoinRequest *)self networkName];
      [v49 setSSID:v50];

      [v49 setBSSType:3];
      [v49 setPHYMode:1];
      [v49 setNumberOfScans:1];
      [v49 setIncludeHiddenNetworks:1];
      if ([v7 count]) {
        v51 = v7;
      }
      else {
        v51 = 0;
      }
      [v49 setChannels:v51];
      if ([v7 count]) {
        uint64_t v52 = 110;
      }
      else {
        uint64_t v52 = 45;
      }
      [v49 setDwellTime:v52];
      [v49 setScanFlags:2592];
      [v49 setScanType:1];
      uint64_t v53 = +[NSDate date];

      v54 = [(WiFiFindAndJoinRequest *)self interface];
      id v155 = 0;
      v147 = v49;
      v55 = [v54 performScanWithParameters:v49 error:&v155];
      v56 = (WiFiFindAndJoinRequest *)v155;

      if (v56)
      {
        v57 = [(WiFiFindAndJoinRequest *)self scanFailureList];
        [v57 addObject:v56];
LABEL_66:

        goto LABEL_67;
      }
      if (!v55 || ![v55 count])
      {
        v57 = [(WiFiFindAndJoinRequest *)self scanFailureList];
        v58 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:0];
        [v57 addObject:v58];

        goto LABEL_66;
      }
LABEL_67:
      v148 = v56;
      v59 = +[NSDate date];
      v146 = (void *)v53;
      [v59 timeIntervalSinceDate:v53];
      double v61 = v60;
      [(WiFiFindAndJoinRequest *)self totalScanTime];
      [(WiFiFindAndJoinRequest *)self setTotalScanTime:v61 + v62];

      long long v153 = 0u;
      long long v154 = 0u;
      long long v151 = 0u;
      long long v152 = 0u;
      id v16 = v55;
      id v63 = [v16 countByEnumeratingWithState:&v151 objects:v180 count:16];
      if (v63)
      {
        id v64 = v63;
        uint64_t v65 = *(void *)v152;
        do
        {
          for (n = 0; n != v64; n = (char *)n + 1)
          {
            if (*(void *)v152 != v65) {
              objc_enumerationMutation(v16);
            }
            v67 = *(void **)(*((void *)&v151 + 1) + 8 * (void)n);
            v68 = [v67 networkName];
            v69 = [(WiFiFindAndJoinRequest *)self networkName];
            unsigned int v70 = [v68 isEqualToString:v69];

            if (v70) {
              [v8 addObject:v67];
            }
          }
          id v64 = [v16 countByEnumeratingWithState:&v151 objects:v180 count:16];
        }
        while (v64);
      }

      long long v7 = v149;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v75 = [v149 valueForKey:@"description"];
        v76 = [v75 componentsJoinedByString:@","];
        unsigned int v77 = [v16 count];
        unsigned int v78 = [v8 count];
        *(_DWORD *)buf = 136316162;
        v173 = "-[WiFiFindAndJoinRequest _runFindAndJoinOnInterface:outError:]";
        __int16 v174 = 2112;
        v175 = v76;
        __int16 v176 = 1024;
        *(_DWORD *)v177 = v77;
        *(_WORD *)&v177[4] = 1024;
        *(_DWORD *)&v177[6] = v78;
        __int16 v178 = 2112;
        v179 = v148;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: scan completed, requested channels=%@, result count=%d, matches=%d, error=%@", buf, 0x2Cu);
      }
      if ([v8 count]) {
        break;
      }
      v71 = [(WiFiFindAndJoinRequest *)self scanFailureList];
      v72 = [v71 lastObject];
      unsigned int v73 = [(WiFiFindAndJoinRequest *)self _canPerformRetry:v72];

      v74 = v146;
      if (!v73)
      {
        BOOL v108 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        a4 = v139;
        if (v108) {
          sub_1001965B4(v108, v109, v110, v111, v112, v113, v114, v115);
        }
        goto LABEL_105;
      }
      [(WiFiFindAndJoinRequest *)self _checkAndRequestChipResetIfNeeded];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100196560(v170, &v171);
      }
      [v149 removeAllObjects];
    }
    if ([v149 count])
    {
      v79 = [(WiFiFindAndJoinRequest *)self scannedChannels];
      [v79 addObjectsFromArray:v149];
    }
    v80 = [(WiFiFindAndJoinRequest *)self joinCandidates];
    v81 = [v8 allObjects];
    [v80 addObjectsFromArray:v81];

    while (1)
    {
      v82 = [(WiFiFindAndJoinRequest *)self joinCandidates];
      id v83 = [v82 count];

      if (!v83) {
        break;
      }
      v84 = v141;
      id v85 = objc_alloc_init((Class)CWFAssocParameters);

      v86 = [(WiFiFindAndJoinRequest *)self joinCandidates];
      v87 = [v86 allObjects];
      v88 = [v87 firstObject];
      [v85 setScanResult:v88];

      [v85 setForceBSSID:1];
      v89 = [(WiFiFindAndJoinRequest *)self password];
      [v85 setPassword:v89];

      [v85 setRememberUponSuccessfulAssociation:1];
      [v85 setKnownNetworkProfile:0];
      v141 = +[NSDate date];

      v90 = [(WiFiFindAndJoinRequest *)self interface];
      id v150 = 0;
      v142 = v85;
      unsigned __int8 v91 = [v90 associateWithParameters:v85 error:&v150];
      v92 = (WiFiFindAndJoinRequest *)v150;

      v148 = v92;
      if (v92)
      {
        v93 = [(WiFiFindAndJoinRequest *)self joinFailureList];
        [v93 addObject:v92];
        long long v7 = v149;
        v74 = v146;
      }
      else
      {
        long long v7 = v149;
        v74 = v146;
        if (v91) {
          goto LABEL_92;
        }
        v93 = [(WiFiFindAndJoinRequest *)self joinFailureList];
        v94 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:97 userInfo:0];
        [v93 addObject:v94];
      }
LABEL_92:
      v95 = +[NSDate date];
      [v95 timeIntervalSinceDate:v141];
      double v97 = v96;
      [(WiFiFindAndJoinRequest *)self totalJoinTime];
      [(WiFiFindAndJoinRequest *)self setTotalJoinTime:v97 + v98];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v104 = [v142 scanResult];
        *(_DWORD *)buf = 136315650;
        v173 = "-[WiFiFindAndJoinRequest _runFindAndJoinOnInterface:outError:]";
        __int16 v174 = 2112;
        v175 = v104;
        __int16 v176 = 2112;
        *(void *)v177 = v92;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: join completed, candidate=%@, error=%@", buf, 0x20u);
      }
      v99 = [(WiFiFindAndJoinRequest *)self joinCandidates];
      v100 = [v142 scanResult];
      [v99 removeObject:v100];

      if (v91)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v120 = [(WiFiFindAndJoinRequest *)self networkName];
          *(_DWORD *)buf = 136315650;
          v173 = "-[WiFiFindAndJoinRequest _runFindAndJoinOnInterface:outError:]";
          __int16 v174 = 2112;
          v175 = v120;
          __int16 v176 = 2112;
          *(void *)v177 = v92;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: join %@ succeeded (error=%@)", buf, 0x20u);
        }
        v121 = [v142 scanResult];
        [(WiFiFindAndJoinRequest *)self setJoinedNetwork:v121];

        BOOL v118 = 1;
        goto LABEL_110;
      }
      v101 = [(WiFiFindAndJoinRequest *)self joinFailureList];
      v102 = [v101 lastObject];
      unsigned int v103 = [(WiFiFindAndJoinRequest *)self _canPerformRetry:v102];

      if (!v103)
      {
        a4 = v139;
        goto LABEL_105;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v138;
        v173 = "-[WiFiFindAndJoinRequest _runFindAndJoinOnInterface:outError:]";
        __int16 v174 = 2112;
        v175 = v92;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: encountered join error %@, performing join retry...", buf, 0x16u);
      }
    }
    v105 = [(WiFiFindAndJoinRequest *)self joinFailureList];
    v106 = [v105 lastObject];
    unsigned int v107 = [(WiFiFindAndJoinRequest *)self _canPerformRetry:v106];

    if (v107)
    {
      [(WiFiFindAndJoinRequest *)self _checkAndRequestChipResetIfNeeded];
      long long v17 = v146;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100196630(v168, &v169);
      }
      [v7 removeAllObjects];
      unsigned int v15 = v147;
      continue;
    }
    break;
  }
  BOOL v122 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  a4 = v139;
  v74 = v146;
  if (v122) {
    sub_100196684(v122, v123, v124, v125, v126, v127, v128, v129);
  }
LABEL_105:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v116 = [(WiFiFindAndJoinRequest *)self networkName];
    *(_DWORD *)buf = 136315650;
    v173 = "-[WiFiFindAndJoinRequest _runFindAndJoinOnInterface:outError:]";
    __int16 v174 = 2112;
    v175 = v116;
    __int16 v176 = 2112;
    *(void *)v177 = v148;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: find and join %@ failed with error %@", buf, 0x20u);
  }
  if (a4)
  {
    v117 = v148;
    BOOL v118 = 0;
    *a4 = [(WiFiFindAndJoinRequest *)v148 copy];
  }
  else
  {
    BOOL v118 = 0;
LABEL_110:
    v117 = v148;
  }
  [(WiFiFindAndJoinRequest *)self submitMetric];

  return v118;
}

- (void)submitMetric
{
  if (&_AnalyticsSendEventLazy)
  {
    double v3 = +[NSMutableDictionary dictionary];
    double v4 = [(WiFiFindAndJoinRequest *)self joinedNetwork];
    if (v4) {
      CFStringRef v5 = @"Success";
    }
    else {
      CFStringRef v5 = @"Fail";
    }
    [v3 setObject:v5 forKeyedSubscript:@"Status"];

    id v6 = [(WiFiFindAndJoinRequest *)self chipResetWaiter];
    if (v6) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    [v3 setObject:v7 forKeyedSubscript:@"DidPerformChipReset"];

    id v8 = +[NSDate date];
    uint64_t v9 = [(WiFiFindAndJoinRequest *)self startedAt];
    [v8 timeIntervalSinceDate:v9];
    long long v11 = +[NSNumber numberWithUnsignedLong:(unint64_t)(v10 * 1000.0)];
    [v3 setObject:v11 forKeyedSubscript:@"CompletionTimeMillisecs"];

    [(WiFiFindAndJoinRequest *)self totalScanTime];
    uint64_t v13 = +[NSNumber numberWithUnsignedLong:(unint64_t)(v12 * 1000.0)];
    [v3 setObject:v13 forKeyedSubscript:@"ScanTimeMillisecs"];

    [(WiFiFindAndJoinRequest *)self totalJoinTime];
    unsigned int v15 = +[NSNumber numberWithUnsignedLong:(unint64_t)(v14 * 1000.0)];
    [v3 setObject:v15 forKeyedSubscript:@"JoinTimeMillisecs"];

    id v16 = [(WiFiFindAndJoinRequest *)self supported2GHzChannels];
    long long v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v16 count]);
    [v3 setObject:v17 forKeyedSubscript:@"Supported2GHzChannelCount"];

    long long v18 = [(WiFiFindAndJoinRequest *)self supported5GHzChannels];
    long long v19 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v18 count]);
    [v3 setObject:v19 forKeyedSubscript:@"Supported5GHzChannelCount"];

    id v20 = [(WiFiFindAndJoinRequest *)self supported6GHzChannels];
    long long v21 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v20 count]);
    [v3 setObject:v21 forKeyedSubscript:@"Supported6GHzChannelCount"];

    id v22 = [(WiFiFindAndJoinRequest *)self scannedChannels];
    id v23 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v22 count]);
    [v3 setObject:v23 forKeyedSubscript:@"ScannedChannelCount"];

    uint64_t v24 = [(WiFiFindAndJoinRequest *)self scanFailureList];
    unsigned int v25 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v24 count]);
    [v3 setObject:v25 forKeyedSubscript:@"ScanFailureCount"];

    uint64_t v26 = [(WiFiFindAndJoinRequest *)self joinFailureList];
    unsigned int v27 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v26 count]);
    [v3 setObject:v27 forKeyedSubscript:@"JoinFailureCount"];

    unsigned __int8 v28 = +[NSNumber numberWithUnsignedInteger:[(WiFiFindAndJoinRequest *)self channelNumber]];
    [v3 setObject:v28 forKeyedSubscript:@"RequestedChannel"];

    v29 = +[NSNumber numberWithUnsignedInteger:[(WiFiFindAndJoinRequest *)self channelBand]];
    [v3 setObject:v29 forKeyedSubscript:@"RequestedBand"];

    id v30 = [(WiFiFindAndJoinRequest *)self joinedNetwork];
    if (v30)
    {
      v31 = [(WiFiFindAndJoinRequest *)self joinedNetwork];
      id v32 = [v31 channel];
      id v33 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v32 channel]);
      [v3 setObject:v33 forKeyedSubscript:@"JoinedChannel"];
    }
    else
    {
      [v3 setObject:0 forKeyedSubscript:@"JoinedChannel"];
    }

    uint64_t v34 = [(WiFiFindAndJoinRequest *)self joinedNetwork];
    if (v34)
    {
      v35 = [(WiFiFindAndJoinRequest *)self joinedNetwork];
      uint64_t v36 = [v35 channel];
      v37 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v36 band]);
      [v3 setObject:v37 forKeyedSubscript:@"JoinedBand"];
    }
    else
    {
      [v3 setObject:0 forKeyedSubscript:@"JoinedBand"];
    }

    unsigned __int8 v38 = [(WiFiFindAndJoinRequest *)self scanFailureList];
    if ([v38 count])
    {
      v39 = [(WiFiFindAndJoinRequest *)self scanFailureList];
      id v40 = [v39 valueForKey:@"description"];
      v41 = [v40 componentsJoinedByString:@","];
      [v3 setObject:v41 forKeyedSubscript:@"ScanFailures"];
    }
    else
    {
      [v3 setObject:0 forKeyedSubscript:@"ScanFailures"];
    }

    id v42 = [(WiFiFindAndJoinRequest *)self joinFailureList];
    if ([v42 count])
    {
      id v43 = [(WiFiFindAndJoinRequest *)self joinFailureList];
      uint64_t v44 = [v43 valueForKey:@"description"];
      v45 = [v44 componentsJoinedByString:@","];
      [v3 setObject:v45 forKeyedSubscript:@"JoinFailures"];
    }
    else
    {
      [v3 setObject:0 forKeyedSubscript:@"JoinFailures"];
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v49 = "-[WiFiFindAndJoinRequest submitMetric]";
      __int16 v50 = 2112;
      v51 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
    }
    v47 = v3;
    id v46 = v3;
    AnalyticsSendEventLazy();
  }
}

- (BOOL)runSynchronouslyOnQueue:(id)a3 onInterface:(id)a4 outError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_100022CC8;
  v18[4] = sub_100022BE0;
  id v19 = 0;
  double v10 = +[NSDate date];
  [(WiFiFindAndJoinRequest *)self setStartedAt:v10];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007F080;
  block[3] = &unk_1002406C0;
  block[4] = self;
  id v14 = v9;
  unsigned int v15 = &v20;
  id v16 = v18;
  long long v17 = a5;
  id v11 = v9;
  dispatch_sync(v8, block);
  LOBYTE(self) = *((unsigned char *)v21 + 24);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

  return (char)self;
}

- (BOOL)runAsynchronouslyOnQueue:(id)a3 onInterface:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSDate date];
  [(WiFiFindAndJoinRequest *)self setStartedAt:v11];

  double v12 = dispatch_get_global_queue(0, 0);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10007F23C;
  v17[3] = &unk_100240710;
  v17[4] = self;
  id v18 = v9;
  id v19 = v8;
  id v20 = v10;
  id v13 = v8;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(v12, v17);

  return 1;
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  self->_password = (NSString *)a3;
}

- (unint64_t)channelNumber
{
  return self->_channelNumber;
}

- (void)setChannelNumber:(unint64_t)a3
{
  self->_channelNumber = a3;
}

- (unint64_t)channelBand
{
  return self->_channelBand;
}

- (void)setChannelBand:(unint64_t)a3
{
  self->_channelBand = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (CWFScanResult)joinedNetwork
{
  return self->_joinedNetwork;
}

- (void)setJoinedNetwork:(id)a3
{
}

- (NSDate)startedAt
{
  return self->_startedAt;
}

- (void)setStartedAt:(id)a3
{
}

- (NSMutableArray)scanFailureList
{
  return self->_scanFailureList;
}

- (void)setScanFailureList:(id)a3
{
}

- (NSMutableArray)joinFailureList
{
  return self->_joinFailureList;
}

- (void)setJoinFailureList:(id)a3
{
}

- (CWFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (OS_dispatch_semaphore)chipResetWaiter
{
  return self->_chipResetWaiter;
}

- (void)setChipResetWaiter:(id)a3
{
}

- (NSMutableSet)supported6GHzChannels
{
  return self->_supported6GHzChannels;
}

- (void)setSupported6GHzChannels:(id)a3
{
}

- (NSMutableSet)supported5GHzChannels
{
  return self->_supported5GHzChannels;
}

- (void)setSupported5GHzChannels:(id)a3
{
}

- (NSMutableSet)supported2GHzChannels
{
  return self->_supported2GHzChannels;
}

- (void)setSupported2GHzChannels:(id)a3
{
}

- (NSMutableSet)scannedChannels
{
  return self->_scannedChannels;
}

- (void)setScannedChannels:(id)a3
{
}

- (NSMutableSet)joinCandidates
{
  return self->_joinCandidates;
}

- (void)setJoinCandidates:(id)a3
{
}

- (double)totalScanTime
{
  return self->_totalScanTime;
}

- (void)setTotalScanTime:(double)a3
{
  self->_totalScanTime = a3;
}

- (double)totalJoinTime
{
  return self->_totalJoinTime;
}

- (void)setTotalJoinTime:(double)a3
{
  self->_totalJoinTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinCandidates, 0);
  objc_storeStrong((id *)&self->_scannedChannels, 0);
  objc_storeStrong((id *)&self->_supported2GHzChannels, 0);
  objc_storeStrong((id *)&self->_supported5GHzChannels, 0);
  objc_storeStrong((id *)&self->_supported6GHzChannels, 0);
  objc_storeStrong((id *)&self->_chipResetWaiter, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_joinFailureList, 0);
  objc_storeStrong((id *)&self->_scanFailureList, 0);
  objc_storeStrong((id *)&self->_startedAt, 0);
  objc_storeStrong((id *)&self->_joinedNetwork, 0);

  objc_storeStrong((id *)&self->_networkName, 0);
}

@end