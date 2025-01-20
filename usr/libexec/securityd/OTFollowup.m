@interface OTFollowup
- (BOOL)clearFollowUp:(unsigned __int8)a3 activeAccount:(id)a4 error:(id *)a5;
- (BOOL)hasPosted:(unsigned __int8)a3;
- (BOOL)postFollowUp:(unsigned __int8)a3 activeAccount:(id)a4 error:(id *)a5;
- (NSMutableSet)postedCFUTypes;
- (OTFollowup)initWithFollowupController:(id)a3;
- (OctagonFollowUpControllerProtocol)cdpd;
- (double)followupEnd;
- (double)followupStart;
- (double)previousFollowupEnd;
- (id)createCDPFollowupContext:(unsigned __int8)a3;
- (id)sfaStatus;
- (id)sysdiagnoseStatus;
- (void)clearAllPostedFlags;
- (void)setCdpd:(id)a3;
- (void)setFollowupEnd:(double)a3;
- (void)setFollowupStart:(double)a3;
- (void)setPostedCFUTypes:(id)a3;
- (void)setPreviousFollowupEnd:(double)a3;
@end

@implementation OTFollowup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postedCFUTypes, 0);

  objc_storeStrong((id *)&self->_cdpd, 0);
}

- (void)setPostedCFUTypes:(id)a3
{
}

- (NSMutableSet)postedCFUTypes
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFollowupEnd:(double)a3
{
  self->_followupEnd = a3;
}

- (double)followupEnd
{
  return self->_followupEnd;
}

- (void)setFollowupStart:(double)a3
{
  self->_followupStart = a3;
}

- (double)followupStart
{
  return self->_followupStart;
}

- (void)setPreviousFollowupEnd:(double)a3
{
  self->_previousFollowupEnd = a3;
}

- (double)previousFollowupEnd
{
  return self->_previousFollowupEnd;
}

- (void)setCdpd:(id)a3
{
}

- (OctagonFollowUpControllerProtocol)cdpd
{
  return (OctagonFollowUpControllerProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (id)sfaStatus
{
  id v21 = +[NSMutableDictionary dictionary];
  if (objc_opt_class())
  {
    id v26 = 0;
    id v19 = [objc_alloc((Class)FLFollowUpController) initWithClientIdentifier:0];
    v2 = [v19 pendingFollowUpItems:&v26];
    id v3 = v26;
    if (v3)
    {
      v4 = sub_10000B070("octagon");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v3;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Fetching pending follow ups failed with: %@", buf, 0xCu);
      }
    }
    v18 = v3;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = v2;
    id v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v23;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v10 = [v9 notification];
          v11 = [v10 creationDate];

          if (v11) {
            uint64_t v12 = (uint64_t)+[CKKSAnalytics fuzzyDaysSinceDate:v11];
          }
          else {
            uint64_t v12 = 10000;
          }
          v13 = [v9 uniqueIdentifier];
          v14 = +[NSString stringWithFormat:@"OACFU-%@", v13];

          v15 = +[NSNumber numberWithInteger:v12];
          [v21 setObject:v15 forKeyedSubscript:v14];
        }
        id v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v6);
    }

    v16 = sub_10000B070("octagon");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v21;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Analytics CFUs are %@", buf, 0xCu);
    }
  }

  return v21;
}

- (id)sysdiagnoseStatus
{
  if (objc_opt_class())
  {
    v2 = +[NSMutableDictionary dictionary];
    id v3 = [objc_alloc((Class)FLFollowUpController) initWithClientIdentifier:0];
    id v22 = 0;
    v4 = [v3 pendingFollowUpItems:&v22];
    id v5 = v22;
    if (v5)
    {
      id v6 = sub_10000B070("octagon");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Fetching pending follow ups failed with: %@", buf, 0xCu);
      }

      uint64_t v7 = [v5 description];
      [v2 setObject:v7 forKeyedSubscript:@"error"];
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v14 = [v13 notification:v18];
          v15 = [v14 creationDate];

          v16 = [v13 uniqueIdentifier];
          [v2 setObject:v15 forKeyedSubscript:v16];
        }
        id v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v10);
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (BOOL)clearFollowUp:(unsigned __int8)a3 activeAccount:(id)a4 error:(id *)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = [(OTFollowup *)self createCDPFollowupContext:v6];
  if (qword_10035D098 != -1) {
    dispatch_once(&qword_10035D098, &stru_100303AB8);
  }
  if (byte_10035D090)
  {
    id v10 = sub_10000B070("followup");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v8 altDSID];
      uint64_t v12 = [v8 personaUniqueString];
      int v23 = 138412546;
      CFStringRef v24 = v11;
      __int16 v25 = 2112;
      id v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting altdsid (%@) on context for persona (%@)", (uint8_t *)&v23, 0x16u);
    }
    v13 = [v8 altDSID];
    [v9 setAltDSID:v13];
  }
  if (!v9) {
    goto LABEL_16;
  }
  v14 = sub_10000B070("followup");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if ((v6 - 1) > 3u) {
      CFStringRef v15 = @"none";
    }
    else {
      CFStringRef v15 = *(&off_100305568 + (v6 - 1));
    }
    int v23 = 138412290;
    CFStringRef v24 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Clearing follow ups (for Octagon) of type %@", (uint8_t *)&v23, 0xCu);
  }

  v16 = [(OTFollowup *)self cdpd];
  unsigned int v17 = [v16 clearFollowUpWithContext:v9 error:a5];

  if (v17)
  {
    long long v18 = [(OTFollowup *)self postedCFUTypes];
    long long v19 = v18;
    if ((v6 - 1) > 3u) {
      CFStringRef v20 = @"none";
    }
    else {
      CFStringRef v20 = *(&off_100305568 + (v6 - 1));
    }
    [v18 removeObject:v20];

    BOOL v21 = 1;
  }
  else
  {
LABEL_16:
    BOOL v21 = 0;
  }

  return v21;
}

- (BOOL)postFollowUp:(unsigned __int8)a3 activeAccount:(id)a4 error:(id *)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = [(OTFollowup *)self createCDPFollowupContext:v6];
  if (qword_10035D098 != -1) {
    dispatch_once(&qword_10035D098, &stru_100303AB8);
  }
  if (byte_10035D090)
  {
    id v10 = sub_10000B070("followup");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v8 altDSID];
      uint64_t v12 = [v8 personaUniqueString];
      *(_DWORD *)buf = 138412546;
      CFStringRef v25 = v11;
      __int16 v26 = 2112;
      v27 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting altdsid (%@) on context for persona (%@)", buf, 0x16u);
    }
    v13 = [v8 altDSID];
    [v9 setAltDSID:v13];
  }
  if (v9)
  {
    v14 = sub_10000B070("followup");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if ((v6 - 1) > 3u) {
        CFStringRef v15 = @"none";
      }
      else {
        CFStringRef v15 = *(&off_100305568 + (v6 - 1));
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Posting a follow up (for Octagon) of type %@", buf, 0xCu);
    }

    unsigned int v17 = [(OTFollowup *)self cdpd];
    id v23 = 0;
    unsigned int v16 = [v17 postFollowUpWithContext:v9 error:&v23];
    id v18 = v23;

    if (v16)
    {
      long long v19 = [(OTFollowup *)self postedCFUTypes];
      CFStringRef v20 = v19;
      if ((v6 - 1) > 3u) {
        CFStringRef v21 = @"none";
      }
      else {
        CFStringRef v21 = *(&off_100305568 + (v6 - 1));
      }
      [v19 addObject:v21];
    }
    else if (a5)
    {
      *a5 = v18;
    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (id)createCDPFollowupContext:(unsigned __int8)a3
{
  switch(a3)
  {
    case 1u:
      id v5 = +[CDPFollowUpContext contextForRecoveryKeyRepair];
      goto LABEL_9;
    case 2u:
      id v5 = +[CDPFollowUpContext contextForStateRepair];
      goto LABEL_9;
    case 3u:
      id v5 = +[CDPFollowUpContext contextForConfirmExistingSecret];
      goto LABEL_9;
    case 4u:
      id v5 = +[CDPFollowUpContext contextForSecureTerms];
LABEL_9:
      break;
    default:
      id v5 = 0;
      break;
  }
  return v5;
}

- (OTFollowup)initWithFollowupController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)OTFollowup;
  id v5 = [(OTFollowup *)&v10 init];
  uint64_t v6 = v5;
  if (v5)
  {
    [(OTFollowup *)v5 setCdpd:v4];
    uint64_t v7 = +[NSMutableSet set];
    postedCFUTypes = v6->_postedCFUTypes;
    v6->_postedCFUTypes = (NSMutableSet *)v7;
  }
  return v6;
}

- (void)clearAllPostedFlags
{
  id v2 = [(OTFollowup *)self postedCFUTypes];
  [v2 removeAllObjects];
}

- (BOOL)hasPosted:(unsigned __int8)a3
{
  id v4 = [(OTFollowup *)self postedCFUTypes];
  id v5 = v4;
  if ((a3 - 1) > 3u) {
    CFStringRef v6 = @"none";
  }
  else {
    CFStringRef v6 = *(&off_100305568 + (a3 - 1));
  }
  unsigned __int8 v7 = [v4 containsObject:v6];

  return v7;
}

@end