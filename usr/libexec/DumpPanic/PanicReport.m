@interface PanicReport
- (PanicReport)initWithPanicString:(id)a3 otherString:(id)a4 buildVersion:(id)a5 panicFlags:(unint64_t)a6 panicType:(id)a7 incidentID:(id)a8 rootsInstalled:(id)a9;
- (id)additionalIPSMetadata;
- (id)appleCareDetails;
- (id)createUUIDString:(unsigned int)a3;
- (id)getBuildVersionString;
- (id)incidentID;
- (id)logType;
- (id)panicString;
- (id)parseExtPaniclog;
- (id)problemType;
- (id)reportNamePrefix;
- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4;
- (void)processExtPaniclogFlags:(unsigned int)a3 data_id:(id)a4 data:(id)a5 additionalBuffers:(id)a6 addToExtPaniclog:(BOOL *)a7;
- (void)setForegroundAppHash:(id)a3;
- (void)setPanicInitiator:(id)a3;
- (void)setPanicString:(id)a3;
- (void)setSOCIdAndRev;
- (void)setUtilizationInfo:(id)a3;
- (void)useExtPaniclog:(id)a3;
- (void)useSocdContainer:(id)a3;
- (void)useSocdNandContainer:(id)a3;
- (void)useStoragePanicData:(id)a3;
@end

@implementation PanicReport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utilizationInfo, 0);
  objc_storeStrong((id *)&self->_foregroundAppHash, 0);
  objc_storeStrong((id *)&self->_panicInitiator, 0);
  objc_storeStrong((id *)&self->_extPaniclog, 0);
  objc_storeStrong((id *)&self->_socdNandContainer, 0);
  objc_storeStrong((id *)&self->_socdContainerArray, 0);
  objc_storeStrong((id *)&self->_storagePanicData, 0);
  objc_storeStrong((id *)&self->_rootsInstalled, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_otherString, 0);

  objc_storeStrong((id *)&self->_panicString, 0);
}

- (id)logType
{
  return *(id *)&self->OSAStackShotReport_opaque[OBJC_IVAR___OSAReport__logType];
}

- (id)incidentID
{
  v2 = *(void **)&self->OSAStackShotReport_opaque[OBJC_IVAR___OSAReport__incidentID];
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PanicReport;
    id v3 = [(PanicReport *)&v5 incidentID];
  }

  return v3;
}

- (id)panicString
{
  return self->_panicString;
}

- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4
{
  objc_super v5 = (void (**)(id, void *))a4;
  v119[0] = @"incident";
  v81 = [(PanicReport *)self incidentID];
  v120[0] = v81;
  v119[1] = @"crashReporterKey";
  v79 = +[OSASystemConfiguration sharedInstance];
  v77 = [v79 crashReporterKey];
  v120[1] = v77;
  v119[2] = @"product";
  v76 = +[OSASystemConfiguration sharedInstance];
  v75 = [v76 modelCode];
  v120[2] = v75;
  v119[3] = @"socId";
  v74 = +[NSString stringWithFormat:@"%x", self->_socId];
  v120[3] = v74;
  v119[4] = @"socRevision";
  v73 = +[NSString stringWithFormat:@"%x", self->_socRev];
  v120[4] = v73;
  v119[5] = @"build";
  v6 = [(PanicReport *)self getBuildVersionString];
  v120[5] = v6;
  v119[6] = @"kernel";
  v7 = [(id)objc_opt_class() kernelVersionDescription];
  v120[6] = v7;
  v119[7] = @"date";
  uint64_t v8 = OSADateFormat();
  v9 = (void *)v8;
  if (self->_isBtnReset) {
    CFStringRef v10 = @"string";
  }
  else {
    CFStringRef v10 = @"panicString";
  }
  CFStringRef panicString = (const __CFString *)self->_panicString;
  if (!panicString) {
    CFStringRef panicString = @"<mysterious>";
  }
  v120[7] = v8;
  v120[8] = panicString;
  v119[8] = v10;
  v119[9] = @"panicFlags";
  v12 = +[NSString stringWithFormat:@"0x%llx", self->_panicFlags];
  v120[9] = v12;
  v119[10] = @"codeSigningMonitor";
  v13 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [(id)objc_opt_class() codeSigningMonitor]);
  v120[10] = v13;
  v14 = +[NSDictionary dictionaryWithObjects:v120 forKeys:v119 count:11];
  v5[2](v5, v14);

  uint64_t v117 = kOSALogMetadataBugType;
  v15 = [(PanicReport *)self problemType];
  v118 = v15;
  v16 = +[NSDictionary dictionaryWithObjects:&v118 forKeys:&v117 count:1];
  v5[2](v5, v16);

  panicInitiator = self->_panicInitiator;
  if (panicInitiator)
  {
    CFStringRef v115 = @"panicInitiator";
    v116 = panicInitiator;
    v18 = +[NSDictionary dictionaryWithObjects:&v116 forKeys:&v115 count:1];
    v5[2](v5, v18);
  }
  if (self->_isInterruptedCoredump) {
    v5[2](v5, &off_100037B78);
  }
  if ([(NSString *)self->_otherString length])
  {
    CFStringRef v113 = @"otherString";
    otherString = self->_otherString;
    v19 = +[NSDictionary dictionaryWithObjects:&otherString forKeys:&v113 count:1];
    v5[2](v5, v19);
  }
  if (self->_foregroundAppHashSet)
  {
    foregroundAppHash = self->_foregroundAppHash;
    if (foregroundAppHash)
    {
      CFStringRef v111 = @"foregroundAppHash";
      v21 = +[NSString stringWithFormat:@"%@", foregroundAppHash];
      v112 = v21;
      v22 = +[NSDictionary dictionaryWithObjects:&v112 forKeys:&v111 count:1];
      v5[2](v5, v22);
    }
  }
  if ((self->_panicFlags & 0x40) != 0) {
    [*(id *)&self->OSAStackShotReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"nested panic occurred"];
  }
  utilizationInfo = self->_utilizationInfo;
  if (utilizationInfo)
  {
    CFStringRef v109 = @"PanicLogUtilizationMetrics";
    v110 = utilizationInfo;
    v24 = +[NSDictionary dictionaryWithObjects:&v110 forKeys:&v109 count:1];
    v5[2](v5, v24);
  }
  if (objc_opt_class())
  {
    CFStringRef v107 = @"repairStatus";
    v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llu", +[CRAuthRepairInspector getStatus]);
    v108 = v25;
    v26 = +[NSDictionary dictionaryWithObjects:&v108 forKeys:&v107 count:1];
    v5[2](v5, v26);
  }
  if ([(NSString *)self->_socdNandContainer length])
  {
    CFStringRef v105 = @"SOCDNandContainer";
    socdNandContainer = self->_socdNandContainer;
    v27 = +[NSDictionary dictionaryWithObjects:&socdNandContainer forKeys:&v105 count:1];
    v5[2](v5, v27);
  }
  if (os_variant_has_internal_diagnostics())
  {
    v28 = [(PanicReport *)self parseExtPaniclog];
    v29 = v28;
    if (v28)
    {
      v30 = self;
      v31 = [v28 objectForKeyedSubscript:@"extPaniclogData"];
      if (v31)
      {
        CFStringRef v103 = @"ExtensiblePaniclog";
        v32 = [v29 objectForKeyedSubscript:@"extPaniclogData"];
        v104 = v32;
        v33 = +[NSDictionary dictionaryWithObjects:&v104 forKeys:&v103 count:1];
        v5[2](v5, v33);
      }
      v34 = [v29 objectForKeyedSubscript:@"additionalData"];
      v35 = v34;
      if (v34)
      {
        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        id v36 = [v34 countByEnumeratingWithState:&v87 objects:v102 count:16];
        if (v36)
        {
          id v37 = v36;
          uint64_t v38 = *(void *)v88;
          do
          {
            for (i = 0; i != v37; i = (char *)i + 1)
            {
              if (*(void *)v88 != v38) {
                objc_enumerationMutation(v35);
              }
              uint64_t v40 = *(void *)(*((void *)&v87 + 1) + 8 * i);
              v41 = [v35 objectForKeyedSubscript:v40];
              uint64_t v100 = v40;
              v101 = v41;
              v42 = +[NSDictionary dictionaryWithObjects:&v101 forKeys:&v100 count:1];
              v5[2](v5, v42);
            }
            id v37 = [v35 countByEnumeratingWithState:&v87 objects:v102 count:16];
          }
          while (v37);
        }
      }

      self = v30;
    }
  }
  if ([(NSString *)self->_storagePanicData length])
  {
    storagePanicData = self->_storagePanicData;
    CFStringRef v98 = @"storagePanicData";
    v99 = storagePanicData;
    v44 = +[NSDictionary dictionaryWithObjects:&v99 forKeys:&v98 count:1];
    v5[2](v5, v44);
  }
  v78 = v5;
  id v82 = objc_alloc_init((Class)NSMutableArray);
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  v80 = self;
  v45 = self->_socdContainerArray;
  id v46 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v83 objects:v97 count:16];
  if (v46)
  {
    id v47 = v46;
    uint64_t v48 = *(void *)v84;
    do
    {
      for (j = 0; j != v47; j = (char *)j + 1)
      {
        if (*(void *)v84 != v48) {
          objc_enumerationMutation(v45);
        }
        v50 = *(void **)(*((void *)&v83 + 1) + 8 * (void)j);
        if ([v50 count])
        {
          id v51 = objc_alloc_init((Class)NSMutableDictionary);
          v52 = [v50 objectAtIndex:0];
          v53 = +[NSNull null];
          unsigned __int8 v54 = [v52 isEqual:v53];

          if ((v54 & 1) == 0)
          {
            v55 = [v50 objectAtIndex:0];
            if ([v55 length]) {
              [v51 setObject:v55 forKey:@"SOCDContainer"];
            }
          }
          v56 = [v50 objectAtIndex:1];
          v57 = +[NSNull null];
          unsigned __int8 v58 = [v56 isEqual:v57];

          if ((v58 & 1) == 0)
          {
            v59 = [v50 objectAtIndex:1];
            if ([v59 length]) {
              [v51 setObject:v59 forKey:@"SOCDPanicString"];
            }
          }
          if ([v51 count]) {
            [v82 addObject:v51];
          }
        }
      }
      id v47 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v83 objects:v97 count:16];
    }
    while (v47);
  }

  if ([v82 count])
  {
    CFStringRef v95 = @"SOCDContainers";
    id v96 = v82;
    v60 = +[NSDictionary dictionaryWithObjects:&v96 forKeys:&v95 count:1];
    v78[2](v78, v60);
  }
  id v61 = objc_alloc_init((Class)OSABinaryImageCatalog);
  v62 = v80;
  [(PanicReport *)v80 decodeKCDataWithBlock:v78 withTuning:&off_100037BA0 usingCatalog:v61];
  CFStringRef v93 = @"binaryImages";
  v63 = [v61 reportUsedImages];
  v94 = v63;
  v64 = +[NSDictionary dictionaryWithObjects:&v94 forKeys:&v93 count:1];
  v78[2](v78, v64);

  uint64_t v65 = OBJC_IVAR___OSAReport__notes;
  [v61 appendNotesTo:*(void *)&v80->OSAStackShotReport_opaque[OBJC_IVAR___OSAReport__notes]];
  if (os_variant_has_internal_diagnostics())
  {
    int v66 = sub_100011194();
    uint64_t v68 = v67;
    if ((v66 & 0x100) != 0) {
      [*(id *)&v80->OSAStackShotReport_opaque[v65] addObject:@"test automation device"];
    }
    if ((v66 & 0x10000) != 0) {
      [*(id *)&v80->OSAStackShotReport_opaque[v65] addObject:@"intentional panic"];
    }
    v62 = v80;
    if (v68)
    {
      v69 = *(void **)&v80->OSAStackShotReport_opaque[v65];
      v70 = +[NSString stringWithFormat:@"test plan id: %llu", v68];
      [v69 addObject:v70];
    }
  }
  if ([*(id *)&v62->OSAStackShotReport_opaque[v65] count])
  {
    uint64_t v71 = *(void *)&v62->OSAStackShotReport_opaque[v65];
    CFStringRef v91 = @"notes";
    uint64_t v92 = v71;
    v72 = +[NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
    v78[2](v78, v72);
  }
}

- (id)parseExtPaniclog
{
  id v34 = objc_alloc_init((Class)NSMutableDictionary);
  id v35 = objc_alloc_init((Class)NSMutableDictionary);
  id v36 = objc_alloc_init((Class)NSMutableDictionary);
  extPaniclog = self->_extPaniclog;
  if (!extPaniclog || [(NSData *)extPaniclog length] - 32769 < 0xFFFF8000) {
    goto LABEL_8;
  }
  -[NSData subdataWithRange:](self->_extPaniclog, "subdataWithRange:", 0, 4);
  id v4 = objc_claimAutoreleasedReturnValue();
  unsigned int v5 = *(_DWORD *)[v4 bytes];

  if (v5 != 2)
  {
    uint64_t v8 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v39 = v5;
      v9 = "Invalid version. Version in paniclog: %d\n";
      goto LABEL_27;
    }
LABEL_8:
    id v10 = 0;
    goto LABEL_9;
  }
  -[NSData subdataWithRange:](self->_extPaniclog, "subdataWithRange:", 4, 4);
  id v6 = objc_claimAutoreleasedReturnValue();
  unsigned int v7 = *(_DWORD *)[v6 bytes];

  if (v7 > 0x64)
  {
    uint64_t v8 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v39 = v7;
      v9 = "Invalid no_of_logs %d";
LABEL_27:
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v9, buf, 8u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (!v7) {
    goto LABEL_43;
  }
  uint64_t v12 = 8;
  while (1)
  {
    uint64_t v13 = [(PanicReport *)self createUUIDString:v12];
    if (!v13) {
      goto LABEL_43;
    }
    v33 = (void *)v13;
    -[NSData subdataWithRange:](self->_extPaniclog, "subdataWithRange:", (v12 + 16), 4);
    id v14 = objc_claimAutoreleasedReturnValue();
    uint64_t v15 = *(unsigned int *)[v14 bytes];

    size_t v16 = strnlen((const char *)[(NSData *)self->_extPaniclog bytes] + (v12 + 20), 0x1FuLL);
    id v17 = objc_alloc((Class)NSString);
    v18 = -[NSData subdataWithRange:](self->_extPaniclog, "subdataWithRange:", (v12 + 20), v16);
    id v19 = [v17 initWithData:v18 encoding:4];

    if (!v19)
    {
      v28 = qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Unable to create Data ID String", buf, 2u);
      }
      id v19 = 0;
      goto LABEL_36;
    }
    unsigned int v20 = v12 + v16 + 21;
    -[NSData subdataWithRange:](self->_extPaniclog, "subdataWithRange:", v20, 4);
    id v21 = objc_claimAutoreleasedReturnValue();
    uint64_t v22 = *(unsigned int *)[v21 bytes];

    if (v22 > 0x8000)
    {
      v29 = qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v39 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Data len is invalid: %d", buf, 8u);
      }
      goto LABEL_36;
    }
    unsigned int v23 = v20 + 4;
    v24 = -[NSData subdataWithRange:](self->_extPaniclog, "subdataWithRange:", v20 + 4, v22);
    v25 = [v24 base64EncodedStringWithOptions:0];

    if (!v25)
    {
      v30 = qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Unable to create Buffer data string", buf, 2u);
      }
LABEL_36:

      goto LABEL_43;
    }
    char v37 = 1;
    [(PanicReport *)self processExtPaniclogFlags:v15 data_id:v19 data:v25 additionalBuffers:v36 addToExtPaniclog:&v37];
    if (!v37) {
      goto LABEL_24;
    }
    v26 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v19, @"Data ID", v25, @"Data", 0];
    if (!v26) {
      break;
    }
    id v27 = [v35 objectForKey:v33];
    if (!v27)
    {
      id v27 = objc_alloc_init((Class)NSMutableArray);
      if (!v27)
      {
        v32 = qword_10003A5D8;
        if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Unable to create array", buf, 2u);
        }

        goto LABEL_42;
      }
      [v35 setObject:v27 forKey:v33];
    }
    [v27 addObject:v26];

LABEL_24:
    uint64_t v12 = v22 + v23;
    if (!--v7) {
      goto LABEL_43;
    }
  }
  v31 = qword_10003A5D8;
  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Unable to create Data ID and Data dict", buf, 2u);
  }
LABEL_42:

LABEL_43:
  if ([v35 count]) {
    [v34 setObject:v35 forKey:@"extPaniclogData"];
  }
  if ([v36 count]) {
    [v34 setObject:v36 forKey:@"additionalData"];
  }
  if (![v34 count]) {
    goto LABEL_8;
  }
  id v10 = v34;
LABEL_9:

  return v10;
}

- (void)processExtPaniclogFlags:(unsigned int)a3 data_id:(id)a4 data:(id)a5 additionalBuffers:(id)a6 addToExtPaniclog:(BOOL *)a7
{
  if (a3)
  {
    [a6 setObject:a5 forKey:a4];
    *a7 = 0;
  }
}

- (id)createUUIDString:(unsigned int)a3
{
  id v5 = objc_alloc((Class)NSUUID);
  -[NSData subdataWithRange:](self->_extPaniclog, "subdataWithRange:", a3, 16);
  id v6 = objc_claimAutoreleasedReturnValue();
  id v7 = [v5 initWithUUIDBytes:[v6 bytes]];

  if (v7)
  {
    uint64_t v8 = [v7 UUIDString];
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      uint64_t v12 = qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v14 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to create UUID String", v14, 2u);
      }
    }
  }
  else
  {
    v11 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unable to create UUID object", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (id)reportNamePrefix
{
  if ([(PanicReport *)self ss_sequence] == -1)
  {
    if (self->_storagePanicData)
    {
      CFStringRef v3 = @"-base+storage_crash";
    }
    else if (self->_socdContainerArray)
    {
      CFStringRef v3 = @"-base+socd";
    }
    else
    {
      CFStringRef v3 = @"-base";
    }
  }
  else
  {
    CFStringRef v3 = @"-full";
  }
  if (self->_isBtnReset) {
    CFStringRef v4 = @"forceReset";
  }
  else {
    CFStringRef v4 = @"panic";
  }
  return +[NSString stringWithFormat:@"%@%@", v4, v3];
}

- (id)appleCareDetails
{
  return &__NSArray0__struct;
}

- (id)problemType
{
  if (self->_isBtnReset) {
    return @"151";
  }
  else {
    return @"210";
  }
}

- (void)useStoragePanicData:(id)a3
{
}

- (id)additionalIPSMetadata
{
  CFStringRef v3 = [(PanicReport *)self incidentID];
  CFStringRef v4 = +[NSMutableDictionary dictionaryWithObject:v3 forKey:kOSALogMetadataIncidentID];

  id v5 = [(PanicReport *)self getBuildVersionString];
  [v4 setObject:v5 forKeyedSubscript:@"os_version"];

  id v6 = self->_rootsInstalled;
  if (v6
    || (size_t v8 = 8, v9 = 0, !sysctlbyname("kern.roots_installed", &v9, &v8, 0, 0))
    && (+[NSNumber numberWithUnsignedLongLong:v9],
        (id v6 = (NSNumber *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v4 setObject:v6 forKeyedSubscript:@"roots_installed"];
  }

  return v4;
}

- (id)getBuildVersionString
{
  CFStringRef v3 = +[OSASystemConfiguration sharedInstance];
  CFStringRef v4 = [v3 productNameVersionBuildString];

  if ([(NSString *)self->_buildVersion length])
  {
    id v5 = +[OSASystemConfiguration sharedInstance];
    id v6 = [v5 productName];
    uint64_t v7 = +[NSString stringWithFormat:@"%@ %@", v6, self->_buildVersion];

    CFStringRef v4 = (void *)v7;
  }

  return v4;
}

- (void)setPanicInitiator:(id)a3
{
}

- (void)setPanicString:(id)a3
{
}

- (void)setForegroundAppHash:(id)a3
{
  self->_foregroundAppHashSet = 1;
}

- (void)useSocdContainer:(id)a3
{
}

- (void)useExtPaniclog:(id)a3
{
}

- (void)useSocdNandContainer:(id)a3
{
}

- (void)setUtilizationInfo:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_utilizationInfo, a3);
    id v5 = v6;
  }
}

- (void)setSOCIdAndRev
{
  sub_10000EF44((uint64_t)"chosen", "chip-id", &self->_socId);

  sub_10000EF44((uint64_t)"arm-io", "chip-revision", &self->_socRev);
}

- (PanicReport)initWithPanicString:(id)a3 otherString:(id)a4 buildVersion:(id)a5 panicFlags:(unint64_t)a6 panicType:(id)a7 incidentID:(id)a8 rootsInstalled:(id)a9
{
  id v30 = a3;
  id v29 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  uint64_t v32 = 0;
  unsigned int v20 = (PanicReport *)[(PanicReport *)self initForPid:0 process:0 withReason:0 exceptionCode:&v32 exceptionCodeCount:1 stackshotFlags:0];
  id v21 = v20;
  if (v20)
  {
    if (v18) {
      -[PanicReport setIncidentID:](v20, "setIncidentID:", v18, v29, v30);
    }
    objc_storeStrong((id *)&v21->_panicString, a3);
    objc_storeStrong((id *)&v21->_otherString, a4);
    objc_storeStrong((id *)&v21->_buildVersion, a5);
    v21->_panicFlags = a6;
    v21->_isBtnReset = (a6 & 0x80) != 0;
    v21->_isInterruptedCoredump = [v17 isEqual:@"interrupted coredump panic"];
    objc_storeStrong((id *)&v21->_rootsInstalled, a9);
    if (&_AnalyticsSendEventLazy)
    {
      if (v21->_isBtnReset)
      {
        AnalyticsSendEventLazy();
      }
      else
      {
        id v31 = v17;
        AnalyticsSendEventLazy();
      }
    }
    socdContainerArray = v21->_socdContainerArray;
    v21->_socdContainerArray = 0;

    socdNandContainer = v21->_socdNandContainer;
    v21->_socdNandContainer = 0;

    extPaniclog = v21->_extPaniclog;
    v21->_extPaniclog = 0;

    panicInitiator = v21->_panicInitiator;
    v21->_panicInitiator = 0;

    foregroundAppHash = v21->_foregroundAppHash;
    v21->_foregroundAppHash = 0;

    v21->_foregroundAppHashSet = 0;
    utilizationInfo = v21->_utilizationInfo;
    v21->_utilizationInfo = 0;
  }
  return v21;
}

@end