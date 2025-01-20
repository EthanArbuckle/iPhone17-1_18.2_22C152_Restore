@interface MFIMAPConnection
+ (OS_os_log)log;
+ (void)initialize;
+ (void)setReadSizeParameters;
- (BOOL)_connectSocketUsingAccount:(id)a3;
- (BOOL)_doBasicConnectionUsingAccount:(id)a3;
- (BOOL)_isFetchResponseValid:(id)a3;
- (BOOL)_sendMailboxCommand:(int64_t)a3 withArguments:(id)a4;
- (BOOL)_tryConnectionUsingAccount:(id)a3;
- (BOOL)appendData:(id)a3 toMailboxNamed:(id)a4 flags:(id)a5 dateReceived:(id)a6 appendInfo:(id *)a7 error:(id *)a8;
- (BOOL)appendData:(id)a3 toMailboxNamed:(id)a4 flags:(id)a5 dateReceived:(id)a6 newMessageInfo:(id *)a7;
- (BOOL)authenticateUsingAccount:(id)a3;
- (BOOL)authenticateUsingAccount:(id)a3 authenticator:(id)a4;
- (BOOL)closeAndLogout;
- (BOOL)connectUsingAccount:(id)a3;
- (BOOL)copyUIDs:(id)a3 toMailboxNamed:(id)a4 copyInfo:(id *)a5 error:(id *)a6;
- (BOOL)createMailbox:(id)a3;
- (BOOL)deleteMailbox:(id)a3;
- (BOOL)deleteMessagesOlderThanNumberOfDays:(int)a3;
- (BOOL)examineMailbox:(id)a3;
- (BOOL)expunge;
- (BOOL)expungeUIDs:(id)a3;
- (BOOL)gotBadResponse;
- (BOOL)hasValidConnection;
- (BOOL)isIdle;
- (BOOL)loginDisabled;
- (BOOL)loginWithAccount:(id)a3 password:(id)a4;
- (BOOL)logout;
- (BOOL)moveUIDs:(id)a3 toMailboxNamed:(id)a4 copyInfo:(id *)a5 error:(id *)a6;
- (BOOL)performCustomCommand:(id)a3 withArguments:(id)a4;
- (BOOL)renameMailbox:(id)a3 toMailbox:(id)a4;
- (BOOL)selectMailbox:(id)a3 withAccount:(id)a4;
- (BOOL)sendResponsesForCommand:(id)a3 toQueue:(id)a4;
- (BOOL)sendResponsesForCondStoreFlagFetchForUIDs:(id)a3 withSequenceIdentifier:(id *)a4 toQueue:(id)a5;
- (BOOL)sendResponsesForUIDFetchForUIDs:(id)a3 fields:(id)a4 toQueue:(id)a5;
- (BOOL)sendResponsesForUIDs:(id)a3 fields:(id)a4 flagSearchResults:(id)a5 toQueue:(id)a6;
- (BOOL)sendSkeletonResponsesForUIDs:(id)a3 includeTo:(BOOL)a4 toQueue:(id)a5;
- (BOOL)sendUidAndFlagResponsesForUIDs:(id)a3 sequenceIdentifierProvider:(id)a4 flagSearchResults:(id)a5 toQueue:(id)a6;
- (BOOL)sendUidResponsesForSearchArguments:(id)a3 toQueue:(id)a4;
- (BOOL)startTLSForAccount:(id)a3;
- (BOOL)storeFlagChange:(id)a3 forUIDs:(id)a4;
- (BOOL)storeFlags:(id)a3 state:(BOOL)a4 forMessageSet:(id)a5;
- (BOOL)storeFlags:(id)a3 state:(BOOL)a4 forUIDs:(id)a5;
- (BOOL)storeGmailLabels:(id)a3 state:(BOOL)a4 forUIDs:(id)a5;
- (BOOL)supportsCapability:(int64_t)a3;
- (EFCancelable)idleSubscriptionCancelable;
- (MFIMAPCommandPipeline)fetchPipeline;
- (MFIMAPConnection)init;
- (MFIMAPConnectionDelegate)delegate;
- (MFIMAPDownloadCache)downloadCache;
- (NSString)debugDescription;
- (NSString)ef_publicDescription;
- (double)connectTime;
- (id)_connectionLogPrefix;
- (id)_connectionStateDescription;
- (id)_copyNextServerResponseForCommand:(id)a3;
- (id)_copyNextTaggedOrContinuationResponseForCommand:(id)a3;
- (id)_dictionaryFromSourceUIDs:(id)a3 destinationUIDs:(id)a4;
- (id)_doListCommand:(int64_t)a3 withReference:(id)a4 mailboxName:(id)a5 options:(int64_t)a6 getSpecialUse:(BOOL)a7 statusDataItems:(id)a8 statusEntriesByMailbox:(id *)a9;
- (id)_doNamespaceCommand;
- (id)_errorForResponse:(id)a3 commandParams:(id)a4;
- (id)_fetchArgumentForMessageSkeletonsWithAllHeaders;
- (id)_fetchArgumentForMessageUidsAndFlags;
- (id)_indexSetForIMAPInlineSet:(id)a3;
- (id)_listingForMailbox:(id)a3 options:(int64_t)a4 getSpecialUse:(BOOL)a5 statusDataItems:(id)a6 statusEntriesByMailbox:(id *)a7 withCommand:(int64_t)a8;
- (id)_logStringForCommand:(id)a3;
- (id)_logStringForIDs:(id)a3;
- (id)_publicDescriptionForSearchString:(id)a3;
- (id)_readDataOfLength:(int64_t)a3;
- (id)_responseFromSendingCommand:(id)a3 andPossiblyCreateMailbox:(id)a4;
- (id)_responseFromSendingCommands:(id)a3;
- (id)_searchUidsForMessageIDs:(id)a3 excludeDeleted:(BOOL)a4;
- (id)_serverErrorForAccount:(id)a3 response:(id)a4 command:(id)a5;
- (id)_uidsForMessageIDs:(id)a3 excludeDeleted:(BOOL)a4;
- (id)capabilities;
- (id)copyArgumentForSearchTerm:(id)a3;
- (id)copyDiagnosticInformation;
- (id)copyInfoForMessageInfo:(id)a3;
- (id)eSearchIDSet:(id)a3 areMessageSequenceNumbers:(BOOL)a4 arguments:(id)a5 success:(BOOL *)a6 returning:(int64_t)a7;
- (id)eSearchIDSet:(id)a3 areMessageSequenceNumbers:(BOOL)a4 forTerms:(id)a5 success:(BOOL *)a6 returning:(int64_t)a7;
- (id)fetchMessageIdsForUids:(id)a3;
- (id)listingForMailbox:(id)a3 options:(int64_t)a4 getSpecialUse:(BOOL)a5 statusDataItems:(id)a6 statusEntriesByMailbox:(id *)a7;
- (id)mailboxListFilter;
- (id)messageSetForNumbers:(id)a3;
- (id)messageSetForRange:(id)a3;
- (id)messageSetForUIDs:(id)a3;
- (id)messageSetForUIDs:(id)a3 maxTokens:(unint64_t)a4 remainder:(id *)a5;
- (id)parenthesizedStringWithObjects:(id)a3;
- (id)parseIndexSetFromSequenceSet:(id)a3;
- (id)searchIDSet:(id)a3 forTerms:(id)a4 success:(BOOL *)a5;
- (id)searchUIDs:(id)a3 withFlagRequests:(id)a4;
- (id)searchUidSet:(id)a3 forTerms:(id)a4 success:(BOOL *)a5;
- (id)selectedMailbox;
- (id)separatorChar;
- (id)serverPathPrefix;
- (id)subscribedListingForMailbox:(id)a3 options:(int64_t)a4;
- (int)fillLiteralBuffer:(char *)a3 count:(unint64_t)a4 dataLength:(unint64_t)a5 nonSynchronizingLiteral:(BOOL *)a6;
- (int)tag;
- (int64_t)_doIMAPLoginForAccount:(id)a3 quotedUsername:(id)a4 password:(id)a5;
- (int64_t)connectionState;
- (unint64_t)_sendCommands:(id)a3 response:(id *)a4;
- (unint64_t)countForSearchOfIDSet:(id)a3 forTerms:(id)a4 success:(BOOL *)a5;
- (unint64_t)countForSearchOfUidSet:(id)a3 forTerms:(id)a4 success:(BOOL *)a5;
- (unint64_t)idleCommandSequenceNumber;
- (unsigned)getMailboxIDForUID:(unsigned int)a3;
- (unsigned)literalChunkSize;
- (unsigned)permanentFlags;
- (unsigned)readBufferSize;
- (void)_addCapabilities:(id)a3;
- (void)_clearCapabilities;
- (void)_enableCompressionIfSupported;
- (void)_fetchCapabilities;
- (void)_handleBytesAvailableInternal;
- (void)_sendApplePushForAccountIfSupported:(id)a3;
- (void)_sendClientInfoIfSupported;
- (void)_updateCapabilitiesForAccount:(id)a3 withAuthenticationResponse:(id)a4;
- (void)_updateSearchCapabilityWithAccount:(id)a3;
- (void)close;
- (void)dealloc;
- (void)didFinishCommands:(id)a3;
- (void)disconnect;
- (void)disconnectAndNotifyDelegate:(BOOL)a3;
- (void)fetchStatusForMailboxes:(id)a3 args:(id)a4;
- (void)finishIdle;
- (void)handleBytesAvailable;
- (void)locked_finishIdle;
- (void)locked_scheduleIdle;
- (void)locked_scheduleIdleResetAfterDelay:(double)a3;
- (void)locked_startIdle;
- (void)noop;
- (void)parseESearchResponseWithContext:(id)a3;
- (void)parseSearchReturn:(id)a3;
- (void)scheduleIdleReset;
- (void)setDelegate:(id)a3;
- (void)setIdleCommandSequenceNumber:(unint64_t)a3;
- (void)setIdleSubscriptionCancelable:(id)a3;
- (void)setMailboxListFilter:(id)a3;
- (void)setPermanentFlags:(unsigned int)a3;
- (void)setReadBufferSize:(unsigned int)a3;
- (void)setReadBufferSizeFromElapsedTime:(double)a3 bytesRead:(unint64_t)a4;
- (void)setTag:(int)a3;
- (void)unselect;
@end

@implementation MFIMAPConnection

- (BOOL)sendResponsesForCondStoreFlagFetchForUIDs:(id)a3 withSequenceIdentifier:(id *)a4 toQueue:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v36 = a5;
  v31 = self;
  v29 = v8;
  v32 = [(MFIMAPConnection *)self messageSetForNumbers:v8];
  v9 = NSString;
  if (a4 && [*a4 length]) {
    v10 = (__CFString *)*a4;
  }
  else {
    v10 = @"0";
  }
  [v9 stringWithFormat:@"(CHANGEDSINCE %@)", v10];
  v50[0] = v32;
  uint64_t v51 = v50[1] = @"(FLAGS)";
  v30 = (void *)v51;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:3];
  v35 = [[_MFIMAPCommandParameters alloc] initWithCommand:21 arguments:v33];
  v49 = v35;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
  v28 = a4;
  v34 = [(MFIMAPConnection *)self _responseFromSendingCommands:v11];

  v12 = v35;
  uint64_t v13 = [v34 responseType];
  if (v13 == 2)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    obuint64_t j = [(_MFIMAPCommandParameters *)v35 untaggedResponses];
    uint64_t v14 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (!v14)
    {

      goto LABEL_27;
    }
    unsigned __int8 v15 = 0;
    unint64_t v16 = 0;
    uint64_t v17 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v43 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if ([v19 responseType] == 17)
        {
          v20 = [v19 fetchResults];
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v21 = v20;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v47 count:16];
          if (v22)
          {
            uint64_t v23 = *(void *)v39;
            do
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v39 != v23) {
                  objc_enumerationMutation(v21);
                }
                unint64_t v25 = [*(id *)(*((void *)&v38 + 1) + 8 * j) modSequenceNumber];
                v15 |= v25 > v16;
                if (v25 > v16) {
                  unint64_t v16 = v25;
                }
              }
              uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v47 count:16];
            }
            while (v22);
          }

          [v36 addItem:v19];
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v14);

    v12 = v35;
    uint64_t v13 = 2;
    if (((v28 != 0) & v15) == 1)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%llu", v16);
      id *v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:
      v12 = v35;
      uint64_t v13 = 2;
    }
  }
  v46 = v12;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
  [(MFIMAPConnection *)v31 didFinishCommands:v26];

  return v13 == 2;
}

- (id)eSearchIDSet:(id)a3 areMessageSequenceNumbers:(BOOL)a4 arguments:(id)a5 success:(BOOL *)a6 returning:(int64_t)a7
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v35 = a5;
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v35, "count") + 2 * (v36 != 0));
  v12 = [[_MFIMAPCommandParameters alloc] initWithCommand:24 arguments:v11];
  if (!a7) {
    __assert_rtn("-[MFIMAPConnection(ESearch) eSearchIDSet:areMessageSequenceNumbers:arguments:success:returning:]", "ESearch.m", 27, "returning && \"Should have at least one return request on an esearch command.\"");
  }
  [v11 addObject:@"RETURN"];
  uint64_t v13 = objc_msgSend(@"("), "mutableCopy";
  uint64_t v14 = v13;
  if ((a7 & 1) == 0)
  {
    if ((a7 & 2) == 0)
    {
      if ((a7 & 4) == 0)
      {
        int v15 = 0;
        if ((a7 & 8) == 0) {
          goto LABEL_17;
        }
        goto LABEL_14;
      }
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  [v13 appendString:@"MIN"];
  if ((a7 & 2) != 0)
  {
    [v14 appendString:@" "];
LABEL_9:
    [v14 appendString:@"MAX"];
  }
  if ((a7 & 4) == 0) {
    goto LABEL_13;
  }
  [v14 appendString:@" "];
LABEL_12:
  [v14 appendString:@"ALL"];
LABEL_13:
  int v15 = 1;
  if ((a7 & 8) == 0) {
    goto LABEL_17;
  }
LABEL_14:
  if (v15) {
    [v14 appendString:@" "];
  }
  [v14 appendString:@"COUNT"];
LABEL_17:
  [v14 appendString:@""]);
  [v11 addObject:v14];
  if (v36)
  {
    if (!a4) {
      [v11 addObject:@"UID"];
    }
    [v11 addObject:v36];
  }
  [v11 addObjectsFromArray:v35];
  v39[0] = v12;
  unint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
  v32 = [(MFIMAPConnection *)self _responseFromSendingCommands:v16];

  uint64_t v17 = [v32 responseType];
  if (a6) {
    *a6 = v17 == 2;
  }
  if (v17 == 2
    && ([(_MFIMAPCommandParameters *)v12 untaggedResponses],
        v18 = objc_claimAutoreleasedReturnValue(),
        unint64_t v19 = [v18 count],
        v18,
        v19))
  {
    unint64_t v20 = 0;
    id v21 = 0;
    do
    {
      uint64_t v22 = [(_MFIMAPCommandParameters *)v12 untaggedResponses];
      uint64_t v23 = [v22 objectAtIndex:v20];

      if ([v23 responseType] == 20)
      {
        v24 = [v23 keyValuePairs];

        unint64_t v25 = [v24 objectForKey:@"IMAPESearchTagKey"];
        int v26 = [v25 intValue];
        LOBYTE(v26) = [(_MFIMAPCommandParameters *)v12 sequenceNumber] == v26;

        if (v26)
        {
          id v21 = v24;
        }
        else
        {
          v27 = MFLogGeneral();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A7EFF000, v27, OS_LOG_TYPE_INFO, "Got a response, but it was not for our tag.  Throwing out the results.", buf, 2u);
          }

          id v21 = 0;
        }
        v28 = [(_MFIMAPCommandParameters *)v12 untaggedResponses];
        [v28 removeObjectAtIndex:v20];

        --v19;
      }
      else
      {
        ++v20;
      }
    }
    while (v20 < v19);
  }
  else
  {
    id v21 = 0;
  }
  long long v38 = v12;
  v29 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v38, 1, v32);
  [(MFIMAPConnection *)self didFinishCommands:v29];

  id v30 = v21;
  return v30;
}

- (id)eSearchIDSet:(id)a3 areMessageSequenceNumbers:(BOOL)a4 forTerms:(id)a5 success:(BOOL *)a6 returning:(int64_t)a7
{
  unint64_t v20 = a6;
  int64_t v21 = a7;
  BOOL v8 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v13);
        }
        id v17 = -[MFIMAPConnection copyArgumentForSearchTerm:](self, "copyArgumentForSearchTerm:", *(void *)(*((void *)&v22 + 1) + 8 * i), v20, v21, (void)v22);
        [v12 addObject:v17];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }

  v18 = [(MFIMAPConnection *)self eSearchIDSet:v10 areMessageSequenceNumbers:v8 arguments:v12 success:v20 returning:v21];

  return v18;
}

- (id)parseIndexSetFromSequenceSet:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v3];
  unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  while (([v5 isAtEnd] & 1) == 0 && objc_msgSend(v5, "scanInteger:", &v11))
  {
    if ([v5 isAtEnd])
    {
      [v4 addIndex:v11];
    }
    else
    {
      uint64_t v6 = [v5 scanLocation];
      int v7 = [v3 characterAtIndex:v6];
      if (v7 == 44)
      {
        [v4 addIndex:v11];
LABEL_11:
        [v5 setScanLocation:v6 + 1];
      }
      else if (v7 == 58)
      {
        [v5 setScanLocation:v6 + 1];
        unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
        [v5 scanInteger:&v10];
        objc_msgSend(v4, "addIndexesInRange:");
        if (([v5 isAtEnd] & 1) == 0)
        {
          uint64_t v6 = [v5 scanLocation];
          goto LABEL_11;
        }
      }
      else
      {
        BOOL v8 = MFLogGeneral();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v10) = 0;
          _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_INFO, "Got invalid value in sequence set", (uint8_t *)&v10, 2u);
        }
      }
    }
  }

  return v4;
}

- (void)parseSearchReturn:(id)a3
{
  for (id i = a3; ; [i parseSpace])
  {
    unint64_t v4 = [i end];
    if (v4 <= [i start]) {
      break;
    }
    if ([i match:"MIN"])
    {
      if (([i parseSpace] & 1) == 0) {
        [i emitWarning:@"Expected space"];
      }
      v5 = (void *)[i copyNumber];
      if (!v5) {
        [i emitError:@"Expected number for minimum result"];
      }
      uint64_t v6 = [i response];
      [v6 setValue:v5 forKey:@"IMAPESearchMinKey"];
LABEL_25:

      continue;
    }
    if ([i match:"MAX"])
    {
      if (([i parseSpace] & 1) == 0) {
        [i emitWarning:@"Expected space"];
      }
      v5 = (void *)[i copyNumber];
      if (!v5) {
        [i emitError:@"Expected number for maximum result"];
      }
      uint64_t v6 = [i response];
      [v6 setValue:v5 forKey:@"IMAPESearchMaxKey"];
      goto LABEL_25;
    }
    if ([i match:"ALL"])
    {
      if (([i parseSpace] & 1) == 0) {
        [i emitWarning:@"Expected space"];
      }
      v5 = (void *)[i copyMessageSet];
      uint64_t v6 = [(MFIMAPConnection *)self parseIndexSetFromSequenceSet:v5];
      int v7 = [i response];
      [v7 setValue:v6 forKey:@"IMAPESearchAllKey"];

      goto LABEL_25;
    }
    if ([i match:"COUNT"])
    {
      if (([i parseSpace] & 1) == 0) {
        [i emitWarning:@"Expected space"];
      }
      v5 = (void *)[i copyNumber];
      if (!v5) {
        [i emitError:@"Expected number for count result"];
      }
      uint64_t v6 = [i response];
      [v6 setValue:v5 forKey:@"IMAPESearchCountKey"];
      goto LABEL_25;
    }
    [i emitError:@"Did not find a valid search return."];
  }
}

- (void)parseESearchResponseWithContext:(id)a3
{
  id v7 = a3;
  if (([v7 parseSpace] & 1) == 0) {
    [v7 emitWarning:@"Expected space"];
  }
  if ([v7 match:"(")]
  {
    if ([v7 match:"TAG"])
    {
      if (([v7 parseSpace] & 1) == 0) {
        [v7 emitWarning:@"Expected space"];
      }
      unint64_t v4 = (void *)[v7 copyQuotedString];
      v5 = [v7 response];
      [v5 setValue:v4 forKey:@"IMAPESearchTagKey"];
    }
    if (([v7 match:"]") & 1) == 0) {
      [v7 emitError:@"Expected right paren"];
    }
  }
  if ([v7 parseSpace])
  {
    if ([v7 match:"UID"])
    {
      if (([v7 parseSpace] & 1) == 0)
      {
        uint64_t v6 = [v7 end];
        if (v6 != [v7 start]) {
          [v7 emitWarning:@"Expected space"];
        }
      }
    }
    [(MFIMAPConnection *)self parseSearchReturn:v7];
  }
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__MFIMAPConnection_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_1 != -1) {
    dispatch_once(&log_onceToken_1, block);
  }
  v2 = (void *)log_log_1;
  return (OS_os_log *)v2;
}

void __23__MFIMAPConnection_log__block_invoke(uint64_t a1)
{
  v2 = (const char *)[(id)*MEMORY[0x1E4F77E48] UTF8String];
  NSStringFromClass(*(Class *)(a1 + 32));
  id v5 = objc_claimAutoreleasedReturnValue();
  os_log_t v3 = os_log_create(v2, (const char *)[v5 UTF8String]);
  unint64_t v4 = (void *)log_log_1;
  log_log_1 = (uint64_t)v3;
}

+ (void)initialize
{
  if (!sIMAPNeedsQuoteCharacterSet)
  {
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    Mutable = CFCharacterSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
    v8.location = 32;
    v8.length = 94;
    CFCharacterSetAddCharactersInRange(Mutable, v8);
    CFCharacterSetInvert(Mutable);
    CFCharacterSetAddCharactersInString(Mutable, @"(){ %*\\\"");
    sIMAPNeedsQuoteCharacterSet = (uint64_t)CFCharacterSetCreateCopy(v3, Mutable);
    CFRelease(Mutable);
  }
  if (!sIMAPNeedsLiteralCharacterSet)
  {
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v6 = CFCharacterSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
    v9.location = 1;
    v9.length = 126;
    CFCharacterSetAddCharactersInRange(v6, v9);
    CFCharacterSetInvert(v6);
    CFCharacterSetAddCharactersInString(v6, @"\r\n");
    sIMAPNeedsLiteralCharacterSet = (uint64_t)CFCharacterSetCreateCopy(v5, v6);
    CFRelease(v6);
  }
  [a1 setReadSizeParameters];
}

- (MFIMAPConnection)init
{
  v8.receiver = self;
  v8.super_class = (Class)MFIMAPConnection;
  v2 = [(MFConnection *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:4096];
    data = v2->_data;
    v2->_data = (NSMutableData *)v3;

    v2->_expirationTime = 0.0;
    socket = v2->super._socket;
    v2->super._socket = 0;

    *((unsigned char *)v2 + 152) &= 0xF8u;
    selectedMailbox = v2->_selectedMailbox;
    v2->_selectedMailbox = 0;
  }
  return v2;
}

- (void)dealloc
{
  [(EFCancelable *)self->_idleSubscriptionCancelable cancel];
  v3.receiver = self;
  v3.super_class = (Class)MFIMAPConnection;
  [(MFConnection *)&v3 dealloc];
}

- (id)copyDiagnosticInformation
{
  [(MFIMAPConnection *)self mf_lock];
  v14.receiver = self;
  v14.super_class = (Class)MFIMAPConnection;
  id v3 = [(MFConnection *)&v14 copyDiagnosticInformation];
  unint64_t v4 = (void *)[v3 mutableCopy];
  CFAllocatorRef v5 = self;
  uint64_t v6 = v5;
  if ((*((_WORD *)v5 + 64) & 0x20) != 0)
  {
    objc_super v8 = [MEMORY[0x1E4F60D58] currentDevice];
    int v9 = [v8 isPlatform:2];

    if (v9) {
      id v7 = @"no";
    }
    else {
      id v7 = @"yes";
    }
  }
  else
  {

    id v7 = @"no";
  }
  [v4 appendFormat:@"    supports IDLE: %@\n", v7];
  BOOL v10 = [(MFIMAPConnection *)v6 isIdle];
  uint64_t v11 = [(MFIMAPConnection *)v6 idleCommandSequenceNumber];
  if (v10) {
    v12 = @"yes";
  }
  else {
    v12 = @"no";
  }
  [v4 appendFormat:@"    using IDLE: %@ (seq=%lu)\n", v12, v11];
  [(MFIMAPConnection *)v6 mf_unlock];

  return v4;
}

- (void)setDelegate:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained != obj)
  {
    if ((*(unsigned char *)&self->_delegateState & 0x40) != 0) {
      [WeakRetained willRemoveDelegation:self];
    }
    *(unsigned char *)&self->_delegateState = *(unsigned char *)&self->_delegateState & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v5 = 2;
    }
    else {
      char v5 = 0;
    }
    *(unsigned char *)&self->_delegateState = *(unsigned char *)&self->_delegateState & 0xFD | v5;
    if (objc_opt_respondsToSelector()) {
      char v6 = 8;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)&self->_delegateState = *(unsigned char *)&self->_delegateState & 0xF7 | v6;
    if (objc_opt_respondsToSelector()) {
      char v7 = 16;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&self->_delegateState = *(unsigned char *)&self->_delegateState & 0xEF | v7;
    if (objc_opt_respondsToSelector()) {
      char v8 = 32;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)&self->_delegateState = *(unsigned char *)&self->_delegateState & 0xDF | v8;
    if (objc_opt_respondsToSelector()) {
      char v9 = 64;
    }
    else {
      char v9 = 0;
    }
    *(unsigned char *)&self->_delegateState = *(unsigned char *)&self->_delegateState & 0xBF | v9;
    if (objc_opt_respondsToSelector()) {
      char v10 = 0x80;
    }
    else {
      char v10 = 0;
    }
    *(unsigned char *)&self->_delegateState = v10 & 0x80 | *(unsigned char *)&self->_delegateState & 0x7F;
    objc_storeWeak((id *)&self->_delegate, obj);
  }
}

- (MFIMAPCommandPipeline)fetchPipeline
{
  [(MFIMAPConnection *)self mf_lock];
  fetchPipeline = self->_fetchPipeline;
  if (!fetchPipeline)
  {
    unint64_t v4 = objc_alloc_init(MFIMAPCommandPipeline);
    char v5 = self->_fetchPipeline;
    self->_fetchPipeline = v4;

    fetchPipeline = self->_fetchPipeline;
  }
  char v6 = fetchPipeline;
  [(MFIMAPConnection *)self mf_unlock];
  return v6;
}

- (MFIMAPDownloadCache)downloadCache
{
  [(MFIMAPConnection *)self mf_lock];
  downloadCache = self->_downloadCache;
  if (!downloadCache)
  {
    unint64_t v4 = objc_alloc_init(MFIMAPDownloadCache);
    char v5 = self->_downloadCache;
    self->_downloadCache = v4;

    downloadCache = self->_downloadCache;
  }
  char v6 = downloadCache;
  [(MFIMAPConnection *)self mf_unlock];
  return v6;
}

- (id)mailboxListFilter
{
  return self->_mailboxListFilter;
}

- (void)setMailboxListFilter:(id)a3
{
}

- (void)_clearCapabilities
{
  capabilities = self->_capabilities;
  self->_capabilities = 0;

  *((unsigned char *)self + 130) = 0;
  *((_WORD *)self + 64) = 0;
}

- (void)_addCapabilities:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    capabilities = self->_capabilities;
    if (!capabilities)
    {
      char v6 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v4, "count"));
      char v7 = self->_capabilities;
      self->_capabilities = v6;

      capabilities = self->_capabilities;
    }
    [(NSMutableSet *)capabilities addObjectsFromArray:v4];
    uint64_t v8 = 0;
    long long v19 = xmmword_1E5D3BA00;
    long long v20 = *(_OWORD *)&off_1E5D3BA10;
    long long v21 = xmmword_1E5D3BA20;
    long long v22 = off_1E5D3BA30;
    long long v15 = xmmword_1E5D3B9C0;
    long long v16 = *(_OWORD *)&off_1E5D3B9D0;
    long long v17 = xmmword_1E5D3B9E0;
    long long v18 = *(_OWORD *)&off_1E5D3B9F0;
    long long v11 = xmmword_1E5D3B980;
    long long v12 = *(_OWORD *)&off_1E5D3B990;
    long long v13 = xmmword_1E5D3B9A0;
    long long v14 = *(_OWORD *)&off_1E5D3B9B0;
    do
    {
      if (-[NSMutableSet containsObject:](self->_capabilities, "containsObject:", *((void *)&v11 + v8), v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22))
      {
        int v9 = (1 << v8) | *((unsigned __int16 *)self + 64) | (*((unsigned __int8 *)self + 130) << 16);
        *((_WORD *)self + 64) |= 1 << v8;
        *((unsigned char *)self + 130) = BYTE2(v9);
      }
      ++v8;
    }
    while (v8 != 24);
    for (uint64_t i = 184; i != -8; i -= 8)
  }
}

- (void)_fetchCapabilities
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = [[_MFIMAPCommandParameters alloc] initWithCommand:0];
  v16[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  char v5 = [(MFIMAPConnection *)self _responseFromSendingCommands:v4];
  BOOL v6 = [v5 responseType] == 2;

  if (v6)
  {
    char v7 = [(_MFIMAPCommandParameters *)v3 untaggedResponses];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      uint64_t v9 = v8 - 1;
      do
      {
        char v10 = [(_MFIMAPCommandParameters *)v3 untaggedResponses];
        long long v11 = [v10 objectAtIndex:v9];

        if ([v11 responseType] == 7)
        {
          long long v12 = [v11 capabilities];
          [(MFIMAPConnection *)self _addCapabilities:v12];

          long long v13 = [(_MFIMAPCommandParameters *)v3 untaggedResponses];
          [v13 removeObjectAtIndex:v9];
        }
        --v9;
      }
      while (v9 != -1);
    }
  }
  long long v15 = v3;
  long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  [(MFIMAPConnection *)self didFinishCommands:v14];
}

- (void)_sendClientInfoIfSupported
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_DEBUG, "server does not support ID extension", v1, 2u);
}

- (void)_sendApplePushForAccountIfSupported:(id)a3
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v85 = a3;
  id v3 = MFUserAgent();
  char v4 = [v3 canRegisterForAPSPush];

  if ((v4 & 1) == 0) {
    goto LABEL_90;
  }
  if ((char)(32 * *((unsigned char *)self + 152)) <= 63)
  {
    char v5 = MFLogGeneral();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      goto LABEL_89;
    }
    *(_DWORD *)buf = 138412290;
    id v100 = v85;
    BOOL v6 = "#aps-push not registering for push on unauthenticated connection for account %@";
    goto LABEL_5;
  }
  if (![(MFIMAPConnection *)self supportsCapability:13])
  {
    long long v17 = MFLogGeneral();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v100 = v85;
      _os_log_impl(&dword_1A7EFF000, v17, OS_LOG_TYPE_INFO, "#aps-push connection doesn't support XAPPLEPUSHSERVICE for account %@", buf, 0xCu);
    }

    [v85 serverRegisteredMailboxes:0 withTopic:0 version:-1];
    goto LABEL_90;
  }
  if (([v85 shouldRegisterForPush] & 1) == 0)
  {
    char v5 = MFLogGeneral();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      goto LABEL_89;
    }
    *(_DWORD *)buf = 138412290;
    id v100 = v85;
    BOOL v6 = "#aps-push account %@ not registering for push";
LABEL_5:
    _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_INFO, v6, buf, 0xCu);
    goto LABEL_89;
  }
  char v7 = +[MFAPSManager sharedManager];
  uint64_t v8 = [v7 copyDeviceToken];

  v75 = v8;
  v78 = [v8 ef_hexString];
  if (!v78)
  {
    long long v18 = MFLogGeneral();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v100 = v85;
      _os_log_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_INFO, "#aps-push failed to get device token while registering for push on account %@", buf, 0xCu);
    }

    long long v19 = 0;
    long long v20 = 0;
    goto LABEL_88;
  }
  context = (void *)MEMORY[0x1AD0E3E00]();
  v74 = [v85 uniqueID];
  v70 = [v85 mailboxNamesForPushRegistration];
  v89 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"(");
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  obuint64_t j = v70;
  uint64_t v9 = [obj countByEnumeratingWithState:&v94 objects:v108 count:16];
  if (v9)
  {
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v95;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v95 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = MFIMAPStringFromMailboxName(*(void **)(*((void *)&v94 + 1) + 8 * i));
        long long v14 = (void *)v13;
        if (v10 + i) {
          long long v15 = @" ";
        }
        else {
          long long v15 = &stru_1EFF11268;
        }
        [v89 appendFormat:@"%@%@", v15, v13];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v94 objects:v108 count:16];
      v10 += i;
    }
    while (v9);
  }

  [v89 appendString:@""]);
  long long v16 = MFUserAgent();
  if ([v16 isMaild])
  {
    id v73 = (id)*MEMORY[0x1E4F77E48];
  }
  else
  {
    long long v21 = [MEMORY[0x1E4F28B50] mainBundle];
    id v73 = [v21 bundleIdentifier];
  }
  long long v22 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v23 = _IMAPCreateQuotedString(@"aps-version");
  v107[0] = v23;
  objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v85, "apsVersion"));
  id v86 = (id)objc_claimAutoreleasedReturnValue();
  v83 = _IMAPCreateQuotedString(v86);
  v107[1] = v83;
  long long v24 = _IMAPCreateQuotedString(@"aps-account-id");
  v107[2] = v24;
  long long v25 = _IMAPCreateQuotedString(v74);
  v107[3] = v25;
  int v26 = _IMAPCreateQuotedString(@"aps-device-token");
  v107[4] = v26;
  uint64_t v27 = _IMAPCreateQuotedString(v78);
  v107[5] = v27;
  v28 = _IMAPCreateQuotedString(@"aps-subtopic");
  v107[6] = v28;
  v29 = _IMAPCreateQuotedString(v73);
  v107[7] = v29;
  id v30 = _IMAPCreateQuotedString(@"mailboxes");
  v107[8] = v30;
  v107[9] = v89;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:10];
  v79 = [v22 arrayWithArray:v31];

  v72 = [v85 apsSenderArgument];
  if (v72)
  {
    v32 = MFLogGeneral();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v100 = v72;
      _os_log_impl(&dword_1A7EFF000, v32, OS_LOG_TYPE_INFO, "#aps-push Including Sender paramenter. Argument: {%{public}@}", buf, 0xCu);
    }

    id v33 = _IMAPCreateQuotedString(@"sender");
    [v79 addObject:v33];

    v34 = _IMAPCreateQuotedString(v72);
    [v79 addObject:v34];
  }
  id v35 = MFLogGeneral();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    id v36 = [v79 componentsJoinedByString:@" "];
    *(_DWORD *)buf = 138412546;
    id v100 = v85;
    __int16 v101 = 2112;
    v102 = v36;
    _os_log_impl(&dword_1A7EFF000, v35, OS_LOG_TYPE_INFO, "#aps-push account %@ registering for push: {%@}", buf, 0x16u);
  }
  v77 = [[_MFIMAPCommandParameters alloc] initWithCommand:35 arguments:v79];
  v106 = v77;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v106 count:1];
  v76 = [(MFIMAPConnection *)self _responseFromSendingCommands:v37];

  if ([v76 responseType] != 2)
  {
    v62 = MFLogGeneral();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      -[MFIMAPConnection _sendApplePushForAccountIfSupported:]();
    }

    long long v19 = 0;
    v63 = 0;
    [v85 setLastPushRegistration:CFAbsoluteTimeGetCurrent()];
    goto LABEL_87;
  }
  v84 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(obj, "count"));
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v38 = [(_MFIMAPCommandParameters *)v77 untaggedResponses];
  id v87 = v38;
  uint64_t v39 = [v38 countByEnumeratingWithState:&v90 objects:v105 count:16];
  if (!v39)
  {

    v63 = 0;
    uint64_t v55 = 0;
LABEL_75:
    v64 = MFLogGeneral();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      v65 = [(_MFIMAPCommandParameters *)v77 untaggedResponses];
      -[MFIMAPConnection _sendApplePushForAccountIfSupported:]((uint64_t)v85, v65, buf, v64);
    }

    long long v19 = 0;
    goto LABEL_78;
  }
  uint64_t v80 = 0;
  uint64_t v81 = 0;
  uint64_t v40 = *(void *)v91;
  do
  {
    for (uint64_t j = 0; j != v39; ++j)
    {
      if (*(void *)v91 != v40) {
        objc_enumerationMutation(v87);
      }
      long long v42 = *(void **)(*((void *)&v90 + 1) + 8 * j);
      if ([v42 responseType] == 21)
      {
        long long v43 = [v42 serverInfo];
        long long v44 = [v43 objectForKey:@"mailbox"];
        if (v44)
        {
          long long v45 = MFLogGeneral();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v100 = v85;
            __int16 v101 = 2112;
            v102 = v44;
            _os_log_impl(&dword_1A7EFF000, v45, OS_LOG_TYPE_INFO, "#aps-push account %@ will send pushes for mailbox '%@'", buf, 0x16u);
          }

          [v84 addObject:v44];
          goto LABEL_61;
        }
        v46 = [v43 objectForKey:@"aps-version"];
        uint64_t v47 = [v43 objectForKey:@"aps-topic"];
        v48 = (void *)v47;
        if (v46) {
          BOOL v49 = v47 == 0;
        }
        else {
          BOOL v49 = 1;
        }
        if (v49)
        {
          v50 = MFLogGeneral();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            id v100 = v85;
            __int16 v101 = 2112;
            v102 = v46;
            __int16 v103 = 2112;
            v104 = v42;
            uint64_t v51 = v50;
            uint64_t v52 = "#aps-push account %@ (version %@) sent unknown push response %@";
            goto LABEL_58;
          }
        }
        else
        {
          int v53 = [v46 intValue];
          if (v53 >= 1 && (uint64_t v54 = v53, [v85 apsVersion] >= v53))
          {
            v50 = v81;
            uint64_t v80 = v54;
            uint64_t v81 = [v48 copy];
          }
          else
          {
            v50 = MFLogGeneral();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              id v100 = v85;
              __int16 v101 = 2112;
              v102 = v46;
              __int16 v103 = 2112;
              v104 = v42;
              uint64_t v51 = v50;
              uint64_t v52 = "#aps-push account %@ (version %@) ignoring invalid version in push response '%@'";
LABEL_58:
              _os_log_error_impl(&dword_1A7EFF000, v51, OS_LOG_TYPE_ERROR, v52, buf, 0x20u);
            }
          }
        }

LABEL_61:
        continue;
      }
    }
    uint64_t v39 = [v87 countByEnumeratingWithState:&v90 objects:v105 count:16];
  }
  while (v39);

  uint64_t v55 = v80;
  if (v80 >= 2)
  {
    v56 = MFLogGeneral();
    BOOL v57 = os_log_type_enabled(v56, OS_LOG_TYPE_INFO);

    if (v57)
    {
      v58 = (void *)[obj mutableCopy];
      [v58 minusSet:v84];
      if ([v58 count])
      {
        v59 = MFLogGeneral();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          v60 = [v58 allObjects];
          v61 = [v60 componentsJoinedByString:@", "];
          *(_DWORD *)buf = 138412546;
          id v100 = v85;
          __int16 v101 = 2112;
          v102 = v61;
          _os_log_impl(&dword_1A7EFF000, v59, OS_LOG_TYPE_INFO, "#aps-push account %@ will NOT push these mailboxes {%@}", buf, 0x16u);
        }
      }
      else
      {
        v59 = MFLogGeneral();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v100 = v85;
          _os_log_impl(&dword_1A7EFF000, v59, OS_LOG_TYPE_INFO, "#aps-push account %@ will push all requested mailboxes", buf, 0xCu);
        }
      }
    }
    long long v19 = v84;
    uint64_t v55 = v80;
    v63 = (void *)v81;
    goto LABEL_86;
  }
  v63 = (void *)v81;
  if (v80 != 1) {
    goto LABEL_75;
  }
  long long v19 = v84;
LABEL_78:
  if ([v19 count])
  {
    uint64_t v66 = v55;
    v67 = MFLogGeneral();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
      [(MFIMAPConnection *)(uint64_t)self _sendApplePushForAccountIfSupported:v68];
    }

    [v19 removeAllObjects];
    uint64_t v55 = v66;
  }
LABEL_86:
  [v85 serverRegisteredMailboxes:v19 withTopic:v63 version:v55];
LABEL_87:
  v98 = v77;
  v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v98 count:1];
  [(MFIMAPConnection *)self didFinishCommands:v69];

  long long v20 = v63;
LABEL_88:

  char v5 = v75;
LABEL_89:

LABEL_90:
}

- (void)_enableCompressionIfSupported
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_DEBUG, "server supports deflate compression, sending COMPRESS request", v1, 2u);
}

- (BOOL)_connectSocketUsingAccount:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MFIMAPConnection;
  return [(MFConnection *)&v4 connectUsingAccount:a3];
}

- (BOOL)_doBasicConnectionUsingAccount:(id)a3
{
  v14[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->super._socket) {
    [(MFIMAPConnection *)self disconnectAndNotifyDelegate:0];
  }
  *((unsigned char *)self + 152) &= 0xF8u;
  self->_expirationTime = 0.0;
  if ([(MFIMAPConnection *)self _connectSocketUsingAccount:v4])
  {
    self->_connectTime = CFAbsoluteTimeGetCurrent();
    char v5 = [[_MFIMAPCommandParameters alloc] initWithCommand:0];
    id v6 = [(MFIMAPConnection *)self _copyNextServerResponseForCommand:v5];
    char v7 = v6;
    if (v6)
    {
      if ([v6 isUntagged])
      {
        uint64_t v8 = [v7 responseType];
        if (v8 == 5)
        {
          *((unsigned char *)self + 152) = *((unsigned char *)self + 152) & 0xF8 | 2;
        }
        else if (v8 == 2)
        {
          *((unsigned char *)self + 152) = *((unsigned char *)self + 152) & 0xF8 | 1;
          if ([v7 responseCode] == 14)
          {
            [(MFIMAPConnection *)self _clearCapabilities];
            uint64_t v9 = [v7 responseInfo];
            [(MFIMAPConnection *)self _addCapabilities:v9];
          }
        }
        goto LABEL_16;
      }
      uint64_t v11 = +[MFIMAPConnection log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        [(MFNWConnectionWrapper *)self->super._socket remoteHostname];
        objc_claimAutoreleasedReturnValue();
        -[MFIMAPConnection _doBasicConnectionUsingAccount:]();
      }
    }
    else
    {
      uint64_t v11 = +[MFIMAPConnection log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        [(MFNWConnectionWrapper *)self->super._socket remoteHostname];
        objc_claimAutoreleasedReturnValue();
        -[MFIMAPConnection _doBasicConnectionUsingAccount:]();
      }
    }

    [(MFIMAPConnection *)self disconnectAndNotifyDelegate:0];
LABEL_16:
    v14[0] = v5;
    long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [(MFIMAPConnection *)self didFinishCommands:v12];

    BOOL v10 = (char)(32 * *((unsigned char *)self + 152)) > 0;
    goto LABEL_17;
  }
  BOOL v10 = 0;
LABEL_17:

  return v10;
}

- (BOOL)_tryConnectionUsingAccount:(id)a3
{
  id v4 = a3;
  if (![(MFIMAPConnection *)self _doBasicConnectionUsingAccount:v4]) {
    goto LABEL_12;
  }
  if ([v4 usesSSL])
  {
    char v5 = [(MFNWConnectionWrapper *)self->super._socket securityProtocol];
    int v6 = [(id)*MEMORY[0x1E4F1D4C0] isEqualToString:v5];

    if (v6)
    {
      char v7 = *((unsigned char *)self + 152);
      if ((v7 & 7) == 2)
      {
        *((unsigned char *)self + 152) = v7 & 0xF8;
        uint64_t v8 = NSString;
        uint64_t v9 = MFLookupLocalizedString(@"TLS_NOT_SUPPORTED_FORMAT", @"The %@ server “%@” doesn’t support TLS (SSL) on port %u. Please check your account settings and try again.", @"Delayed");
        BOOL v10 = [(id)objc_opt_class() accountTypeString];
        uint64_t v11 = [v4 hostname];
        long long v12 = objc_msgSend(v8, "stringWithFormat:", v9, v10, v11, objc_msgSend(v4, "portNumber"));

        uint64_t v13 = +[MFActivityMonitor currentMonitor];
        long long v14 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1034 localizedDescription:v12];
        [v13 setError:v14];

        BOOL v15 = 0;
LABEL_11:

        goto LABEL_13;
      }
      if ([(MFIMAPConnection *)self startTLSForAccount:v4])
      {
        long long v12 = [v4 clientCertificates];
        if (v12) {
          [(MFNWConnectionWrapper *)self->super._socket setClientCertificates:v12];
        }
        BOOL v15 = [(MFConnection *)self enableSSL];
        [(MFIMAPConnection *)self _updateCapabilitiesForAccount:v4 withAuthenticationResponse:0];
        goto LABEL_11;
      }
LABEL_12:
      BOOL v15 = 0;
      goto LABEL_13;
    }
  }
  BOOL v15 = 1;
LABEL_13:

  return v15;
}

- (BOOL)connectUsingAccount:(id)a3
{
  id v4 = a3;
  char v5 = [v4 hostname];
  uint64_t v6 = [v4 credentialAccessibility];
  if (v6)
  {
    if (v6 == 1)
    {
      char v7 = MFLookupLocalizedString(@"FAILED_FETCH_TITLE", @"Cannot Get Mail", @"Delayed");
      uint64_t v8 = [v4 missingPasswordErrorWithTitle:v7];
LABEL_9:
      BOOL v10 = (void *)v8;

      if (v10)
      {
        uint64_t v11 = +[MFActivityMonitor currentMonitor];
        [v11 setError:v10];
      }
      goto LABEL_11;
    }
    if (v6 == 2)
    {
      char v7 = MFLookupLocalizedString(@"FAILED_FETCH_TITLE", @"Cannot Get Mail", @"Delayed");
      uint64_t v8 = [v4 inaccessiblePasswordErrorWithTitle:v7];
      goto LABEL_9;
    }
LABEL_11:
    BOOL v9 = 0;
    goto LABEL_12;
  }
  if (!v5 || ![v5 length]) {
    goto LABEL_11;
  }
  [(MFIMAPConnection *)self mf_lock];
  BOOL v9 = [(MFIMAPConnection *)self _tryConnectionUsingAccount:v4];
  [(MFIMAPConnection *)self mf_unlock];
LABEL_12:

  return v9;
}

- (void)disconnectAndNotifyDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  [(MFIMAPConnection *)self mf_lock];
  socket = self->super._socket;
  if (socket)
  {
    [(MFNWConnectionWrapper *)socket unregisterForBytesAvailable];
    [(MFNWConnectionWrapper *)self->super._socket close];
    uint64_t v6 = self->super._socket;
    self->super._socket = 0;

    self->_expirationTime = 0.0;
  }
  [(MFConnection *)self endCompression];
  [(MFIMAPConnection *)self _clearCapabilities];
  separatorChar = self->_separatorChar;
  self->_separatorChar = 0;

  serverNamespace = self->_serverNamespace;
  self->_serverNamespace = 0;

  selectedMailbox = self->_selectedMailbox;
  self->_selectedMailbox = 0;

  [(NSMutableData *)self->_data setLength:0];
  *((unsigned char *)self + 152) &= 0xF8u;
  self->_commandNumber = 0;
  self->_idleCommandSequenceNumber = 0;
  [(MFIMAPConnection *)self mf_unlock];
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained && (*(unsigned char *)&self->_delegateState & 8) != 0) {
      [WeakRetained connectionDidDisconnect:self];
    }
  }
}

- (void)disconnect
{
}

- (int64_t)connectionState
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (!self->super._socket) {
    return 0;
  }
  [(MFIMAPConnection *)self mf_lock];
  if (self->_expirationTime != 0.0 && CFAbsoluteTimeGetCurrent() > self->_expirationTime) {
    [(MFIMAPConnection *)self noop];
  }
  socket = self->super._socket;
  if (socket && [(MFNWConnectionWrapper *)socket isValid])
  {
    BOOL v4 = 0;
    char v5 = *((unsigned char *)self + 152);
  }
  else
  {
    char v5 = *((unsigned char *)self + 152) & 0xF8;
    *((unsigned char *)self + 152) = v5;
    BOOL v4 = self->super._socket != 0;
  }
  if ((char)(32 * v5) >= 1 && [(MFNWConnectionWrapper *)self->super._socket isReadable] && !v4)
  {
    do
    {
      uint64_t v6 = [[_MFIMAPCommandParameters alloc] initWithCommand:0];
      id v7 = [(MFIMAPConnection *)self _copyNextServerResponseForCommand:v6];
      BOOL v4 = [v7 responseType] == 3 || objc_msgSend(v7, "responseType") == 6;
      v11[0] = v6;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      [(MFIMAPConnection *)self didFinishCommands:v8];
    }
    while (((v4 | ![(MFNWConnectionWrapper *)self->super._socket isReadable]) & 1) == 0);
  }
  int v9 = *((unsigned __int8 *)self + 152);
  [(MFIMAPConnection *)self mf_unlock];
  int64_t result = (uint64_t)(v9 << 29) >> 29;
  if (v4 && self->super._socket)
  {
    [(MFIMAPConnection *)self disconnectAndNotifyDelegate:1];
    return 0;
  }
  return result;
}

- (BOOL)hasValidConnection
{
  return [(MFIMAPConnection *)self connectionState] > 0;
}

- (BOOL)loginDisabled
{
  return [(MFIMAPConnection *)self supportsCapability:10];
}

- (int)fillLiteralBuffer:(char *)a3 count:(unint64_t)a4 dataLength:(unint64_t)a5 nonSynchronizingLiteral:(BOOL *)a6
{
  if (!a6)
  {
    long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"IMAPConnection.m", 935, @"Invalid parameter not satisfying: %@", @"outNonSynchronizingLiteral" object file lineNumber description];
  }
  __int16 v11 = *((_WORD *)self + 64);
  long long v12 = "+";
  if ((v11 & 2) != 0)
  {
    LOBYTE(v15) = 1;
  }
  else if (a5 > 0x1000)
  {
    LOBYTE(v15) = 0;
    long long v12 = "";
  }
  else
  {
    unsigned int v14 = v11 & 4;
    BOOL v13 = v14 == 0;
    unsigned int v15 = v14 >> 2;
    if (v13) {
      long long v12 = "";
    }
  }
  *a6 = v15;
  return snprintf(a3, a4, "{%lu%s}\r\n", a5, v12);
}

- (unint64_t)_sendCommands:(id)a3 response:(id *)a4
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v69 = a3;
  unint64_t v70 = [v69 count];
  uint64_t v88 = 0;
  v89 = &v88;
  uint64_t v90 = 0x2020000000;
  char v91 = 1;
  [(MFIMAPConnection *)self locked_finishIdle];
  [(NSMutableData *)self->_data setLength:0];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  obuint64_t j = v69;
  uint64_t v5 = [obj countByEnumeratingWithState:&v84 objects:v94 count:16];
  if (!v5)
  {
    uint64_t v6 = 0;
    id v7 = 0;
    unint64_t v79 = 0;
    NSUInteger v8 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_134;
  }
  uint64_t v6 = 0;
  id v7 = 0;
  unint64_t v79 = 0;
  uint64_t v73 = *(void *)v85;
  uint64_t v74 = v5;
  NSUInteger v8 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_3:
  uint64_t v76 = 0;
  while (1)
  {
    if (*(void *)v85 != v73) {
      objc_enumerationMutation(obj);
    }
    int v9 = *(void **)(*((void *)&v84 + 1) + 8 * v76);
    uint64_t v77 = [v9 command] == 32 ? objc_msgSend(v9, "sequenceNumber") : 0;
    if ([v9 command] != 29) {
      break;
    }
LABEL_12:
    __int16 v11 = [v9 arguments];
    unint64_t v80 = [v11 count];

    if ([v9 command] == 38)
    {
      if (!v80) {
        goto LABEL_127;
      }
      long long v12 = [v9 arguments];
      BOOL v13 = [v12 objectAtIndexedSubscript:0];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v78 = v7;
        goto LABEL_125;
      }
      data = self->_data;
      unsigned int v15 = v13;
      [(NSMutableData *)data mf_appendCString:[v15 UTF8String]];

      unint64_t v16 = 1;
    }
    else
    {
      -[NSMutableData mf_appendCString:](self->_data, "mf_appendCString:", _IMAPCommandTable[[v9 command]]);
      unint64_t v16 = 0;
    }
    if (v16 >= v80)
    {
      v78 = v7;
      goto LABEL_119;
    }
    v78 = v7;
    while (1)
    {
      long long v17 = [v9 arguments];
      long long v18 = [v17 objectAtIndex:v16];

      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0 || ([v18 hasPrefix:@""]) & 1) == 0)
      {
        [(NSMutableData *)self->_data appendBytes:" " length:1];
        if ((isKindOfClass & 1) == 0) {
          break;
        }
      }
      long long v20 = (void *)MFCreateDataWithString();
      if ([v9 command] == 5)
      {
        if (v16 != 1) {
          goto LABEL_31;
        }
      }
      else
      {
        uint64_t v22 = [v9 command];
        if (v16 != 1 || v22 != 4) {
          goto LABEL_31;
        }
      }
      NSUInteger v8 = [(NSMutableData *)self->_data length];
      uint64_t v6 = [v20 length];
LABEL_31:
      [(NSMutableData *)self->_data appendData:v20];

      ++v16;
LABEL_114:

      if (v16 == v80) {
        goto LABEL_119;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v21 = ++v16 == v80 && [v9 command] == 19;
      id v24 = v18;
      uint64_t v25 = [v24 length];
      if (v21) {
        v25 += [v24 numberOfNewlinesNeedingConversion:0];
      }
      v92[0] = -86;
      *(void *)&long long v26 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)buf = v26;
      *(_OWORD *)&buf[16] = v26;
      [(NSMutableData *)self->_data appendBytes:buf length:[(MFIMAPConnection *)self fillLiteralBuffer:buf count:32 dataLength:v25 - v77 nonSynchronizingLiteral:v92]];
      BOOL v27 = -[MFConnection writeData:dontLogBytesInRange:](self, "writeData:dontLogBytesInRange:", self->_data, v8, v6);
      *((unsigned char *)v89 + 24) = v27;
      if (v92[0]) {
        BOOL v28 = 0;
      }
      else {
        BOOL v28 = v27;
      }
      if (v28)
      {
        id v29 = [(MFIMAPConnection *)self _copyNextTaggedOrContinuationResponseForCommand:v9];
        if ([v29 responseType] != 1)
        {

          id v30 = 0;
          *((unsigned char *)v89 + 24) = 0;
          v78 = v29;
          goto LABEL_64;
        }
        id v30 = v29;
        if (!*((unsigned char *)v89 + 24))
        {
LABEL_64:
          [(NSMutableData *)self->_data setLength:0];
          BOOL v41 = *((unsigned char *)v89 + 24) == 0;

          goto LABEL_112;
        }
      }
      else
      {
        id v30 = 0;
        if (!v27) {
          goto LABEL_64;
        }
      }
      if (v92[0] || v30)
      {
        if (v21)
        {
          [(NSMutableData *)self->_data setLength:0];
          *((unsigned char *)v89 + 24) = 1;
          v81[0] = MEMORY[0x1E4F143A8];
          v81[1] = 3221225472;
          v81[2] = __43__MFIMAPConnection__sendCommands_response___block_invoke_3;
          v81[3] = &unk_1E5D3BBA8;
          v81[4] = self;
          v81[5] = &v88;
          [v24 enumerateConvertingNewlinesUsingBlock:v81];
        }
        else if ([v9 command] == 5)
        {
          v83[0] = MEMORY[0x1E4F143A8];
          v83[1] = 3221225472;
          v83[2] = __43__MFIMAPConnection__sendCommands_response___block_invoke;
          v83[3] = &unk_1E5D3BB80;
          v83[4] = self;
          v83[5] = &v88;
          [v24 enumerateByteRangesUsingBlock:v83];
        }
        else
        {
          v82[0] = MEMORY[0x1E4F143A8];
          v82[1] = 3221225472;
          v82[2] = __43__MFIMAPConnection__sendCommands_response___block_invoke_2;
          v82[3] = &unk_1E5D3BB80;
          v82[4] = self;
          v82[5] = &v88;
          [v24 enumerateByteRangesUsingBlock:v82];
        }
      }
      goto LABEL_64;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_118;
    }
    BOOL v23 = ++v16 == v80 && [v9 command] == 19;
    id v31 = v18;
    id v75 = v31;
    uint64_t v32 = [v31 length];
    if (v23)
    {
      id v33 = v31;
      NSUInteger v34 = v8;
      uint64_t v35 = [v33 bytes];
      uint64_t v36 = v6;
      if (v32 < 1)
      {
        char v38 = 0;
      }
      else
      {
        v37 = (char *)v35;
        char v38 = 0;
        uint64_t v39 = (char *)(v35 + v32);
        do
        {
          uint64_t v40 = (char *)memchr(v37, 10, v39 - v37);
          if (v40 && (v40 == v37 || *(v40 - 1) != 13))
          {
            ++v32;
            char v38 = 1;
          }
          if (v40) {
            v37 = v40 + 1;
          }
          else {
            v37 = v39;
          }
        }
        while (v37 < v39);
      }
      LOBYTE(v23) = v38;
      uint64_t v6 = v36;
      NSUInteger v8 = v34;
    }
    v92[0] = -86;
    *(void *)&long long v42 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v42 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v42;
    *(_OWORD *)&buf[16] = v42;
    [(NSMutableData *)self->_data appendBytes:buf length:[(MFIMAPConnection *)self fillLiteralBuffer:buf count:32 dataLength:v32 - v77 nonSynchronizingLiteral:v92]];
    BOOL v43 = -[MFConnection writeData:dontLogBytesInRange:](self, "writeData:dontLogBytesInRange:", self->_data, v8, v6);
    *((unsigned char *)v89 + 24) = v43;
    if (v92[0]) {
      BOOL v44 = 0;
    }
    else {
      BOOL v44 = v43;
    }
    if (v44)
    {
      id v45 = [(MFIMAPConnection *)self _copyNextTaggedOrContinuationResponseForCommand:v9];
      if ([v45 responseType] == 1)
      {
        v46 = v45;
        if (!*((unsigned char *)v89 + 24)) {
          goto LABEL_111;
        }
LABEL_75:
        if (v92[0] || v46)
        {
          if (!v23)
          {
            if ([v9 command] == 5) {
              BOOL v60 = -[MFConnection writeData:dontLogBytesInRange:](self, "writeData:dontLogBytesInRange:", v75, 0, [v75 length]);
            }
            else {
              BOOL v60 = [(MFConnection *)self writeData:v75];
            }
            *((unsigned char *)v89 + 24) = v60;
            goto LABEL_111;
          }
          id v47 = v75;
          v48 = (char *)[v47 bytes];
          uint64_t v49 = [v47 length];
          [(NSMutableData *)self->_data setLength:0];
          *((unsigned char *)v89 + 24) = 1;
          if (v49 >= 1)
          {
            v50 = &v48[v49];
            do
            {
              int64_t v51 = v50 - v48;
              uint64_t v52 = memchr(v48, 10, v50 - v48);
              int v53 = v52;
              if (v52)
              {
                int64_t v54 = v52 - v48;
                if (v52 == v48) {
                  goto LABEL_87;
                }
                int v55 = *(v52 - 1);
                v56 = self->_data;
                if (v55 != 13)
                {
                  [(NSMutableData *)v56 appendBytes:v48 length:v54];
LABEL_87:
                  [(NSMutableData *)self->_data appendBytes:&kIMAPLineEnding length:2];
                  goto LABEL_88;
                }
                int64_t v51 = v54 + 1;
              }
              else
              {
                v56 = self->_data;
              }
              [(NSMutableData *)v56 appendBytes:v48 length:v51];
LABEL_88:
              if (v53) {
                v48 = v53 + 1;
              }
              else {
                v48 = v50;
              }
              if ([(NSMutableData *)self->_data length] > 0xFFF || v48 >= v50)
              {
                BOOL v58 = [(MFConnection *)self writeData:self->_data];
                *((unsigned char *)v89 + 24) = v58;
                [(NSMutableData *)self->_data setLength:0];
              }
              if (*((unsigned char *)v89 + 24)) {
                BOOL v59 = v48 >= v50;
              }
              else {
                BOOL v59 = 1;
              }
            }
            while (!v59);
          }
        }
      }
      else
      {

        v46 = 0;
        *((unsigned char *)v89 + 24) = 0;
        v78 = v45;
      }
    }
    else
    {
      v46 = 0;
      if (v43) {
        goto LABEL_75;
      }
    }
LABEL_111:
    [(NSMutableData *)self->_data setLength:0];
    BOOL v41 = *((unsigned char *)v89 + 24) == 0;

LABEL_112:
    uint64_t v6 = 0;
    NSUInteger v8 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v41)
    {
      ++v79;
      goto LABEL_114;
    }
LABEL_118:

LABEL_119:
    if (!v78) {
      [(NSMutableData *)self->_data appendBytes:&kIMAPLineEnding length:2];
    }
    if (*((unsigned char *)v89 + 24) && [(NSMutableData *)self->_data length])
    {
      BOOL v13 = +[MFIMAPConnection log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v61 = [(MFIMAPConnection *)self _connectionLogPrefix];
        v62 = [(MFIMAPConnection *)self _logStringForCommand:v9];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v61;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v62;
        _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ WROTE: %{public}@", buf, 0x16u);
      }
LABEL_125:
    }
    id v7 = v78;
LABEL_127:
    if (++v76 == v74)
    {
      uint64_t v74 = [obj countByEnumeratingWithState:&v84 objects:v94 count:16];
      if (!v74) {
        goto LABEL_134;
      }
      goto LABEL_3;
    }
  }
  *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v10;
  *(_OWORD *)&buf[16] = v10;
  if ((unint64_t)[v9 command] < 0x27)
  {
    ++self->_commandNumber;
    objc_msgSend(v9, "setSequenceNumber:");
    __snprintf_chk(buf, 0x20uLL, 0, 0x20uLL, "%lu ", [v9 sequenceNumber]);
    [(NSMutableData *)self->_data mf_appendCString:buf];
    goto LABEL_12;
  }
  v63 = +[MFIMAPConnection log];
  if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v9, "command"));
    objc_claimAutoreleasedReturnValue();
    -[MFIMAPConnection _sendCommands:response:]();
  }

LABEL_134:
  if (*((unsigned char *)v89 + 24) && [(NSMutableData *)self->_data length])
  {
    BOOL v64 = -[MFConnection writeData:dontLogBytesInRange:](self, "writeData:dontLogBytesInRange:", self->_data, v8, v6);
    unint64_t v65 = v79;
    if (v64) {
      unint64_t v65 = v70;
    }
    unint64_t v79 = v65;
  }
  [(NSMutableData *)self->_data setLength:0];
  if (a4) {
    *a4 = v7;
  }
  self->_expirationTime = CFAbsoluteTimeGetCurrent() + 1500.0;
  if (v79 < v70)
  {
    uint64_t v66 = +[MFIMAPConnection log];
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
      -[MFIMAPConnection _sendCommands:response:]((uint64_t)self, v66, v67);
    }

    [(MFIMAPConnection *)self disconnectAndNotifyDelegate:1];
  }

  _Block_object_dispose(&v88, 8);
  return v79;
}

uint64_t __43__MFIMAPConnection__sendCommands_response___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "writeBytes:length:dontLogBytesInRange:", a2, a4, 0, a4);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  *a5 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
  return result;
}

uint64_t __43__MFIMAPConnection__sendCommands_response___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "writeBytes:length:dontLogBytesInRange:", a2, a4, 0x7FFFFFFFFFFFFFFFLL, 0);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  *a5 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
  return result;
}

uint64_t __43__MFIMAPConnection__sendCommands_response___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 208) length] > 0xFFF || a5 != 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) writeData:*(void *)(*(void *)(a1 + 32) + 208)];
    [*(id *)(*(void *)(a1 + 32) + 208) setLength:0];
  }
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (id)_copyNextServerResponseForCommand:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MFIMAPResponse alloc];
  uint64_t v6 = [v4 responseConsumer];
  id v7 = [(MFIMAPResponse *)v5 initWithConnection:self responseConsumer:v6];

  if (!v7 || [(MFIMAPResponse *)v7 responseType] == 6)
  {
    [(MFIMAPConnection *)self disconnectAndNotifyDelegate:1];

    id v7 = 0;
  }

  return v7;
}

- (id)_copyNextTaggedOrContinuationResponseForCommand:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 sequenceNumber];
  id v33 = EFStringWithUnsignedInteger();
  id v5 = [(MFIMAPConnection *)self _copyNextServerResponseForCommand:v4];
  if (!v5) {
    goto LABEL_38;
  }
  int v7 = 0;
  int v8 = 0;
  *(void *)&long long v6 = 138543618;
  long long v32 = v6;
  while (objc_msgSend(v5, "responseType", v32) != 1)
  {
    if (([v5 isUntagged] & 1) == 0)
    {
      int v9 = [v5 tag];
      char v10 = [v33 isEqualToString:v9];

      if (v10) {
        break;
      }
    }
    if ([v5 responseType] == 17)
    {
      ++v8;
    }
    else if ([v5 responseType] == 15)
    {
      ++v7;
    }
    else
    {
      __int16 v11 = +[MFIMAPConnection log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        long long v12 = [(MFIMAPConnection *)self _connectionLogPrefix];
        BOOL v13 = objc_msgSend(v5, "ef_publicDescription");
        *(_DWORD *)buf = v32;
        uint64_t v35 = v12;
        __int16 v36 = 2114;
        v37 = v13;
        _os_log_impl(&dword_1A7EFF000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ READ: %{public}@", buf, 0x16u);
      }
    }
    if (![v5 isUntagged]) {
      goto LABEL_20;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned int v15 = WeakRetained;
    if (!WeakRetained || (*(unsigned char *)&self->_delegateState & 1) == 0)
    {

LABEL_17:
      unint64_t v16 = [v4 untaggedResponses];
      BOOL v17 = v16 == 0;

      if (v17)
      {
        id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [v4 setUntaggedResponses:v18];
      }
      long long v19 = [v4 untaggedResponses];
      [v19 addObject:v5];

      goto LABEL_20;
    }
    char v21 = [WeakRetained connection:self shouldHandleUntaggedResponse:v5 forCommand:v4];

    if (v21) {
      goto LABEL_17;
    }
LABEL_20:
    id v20 = [(MFIMAPConnection *)self _copyNextServerResponseForCommand:v4];

    id v5 = v20;
    if (!v20) {
      goto LABEL_38;
    }
  }
  if (v8)
  {
    uint64_t v22 = +[MFIMAPConnection log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v23 = [(MFIMAPConnection *)self _connectionLogPrefix];
      *(_DWORD *)buf = v32;
      uint64_t v35 = v23;
      __int16 v36 = 1024;
      LODWORD(v37) = v8;
      _os_log_impl(&dword_1A7EFF000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ READ: %d untagged fetch responses", buf, 0x12u);
    }
  }
  if (v7)
  {
    id v24 = +[MFIMAPConnection log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = [(MFIMAPConnection *)self _connectionLogPrefix];
      *(_DWORD *)buf = v32;
      uint64_t v35 = v25;
      __int16 v36 = 1024;
      LODWORD(v37) = v7;
      _os_log_impl(&dword_1A7EFF000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ READ: %d untagged list responses", buf, 0x12u);
    }
  }
  long long v26 = +[MFIMAPConnection log];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v27 = [(MFIMAPConnection *)self _connectionLogPrefix];
    BOOL v28 = objc_msgSend(v5, "ef_publicDescription");
    *(_DWORD *)buf = v32;
    uint64_t v35 = v27;
    __int16 v36 = 2114;
    v37 = v28;
    _os_log_impl(&dword_1A7EFF000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ READ: %{public}@", buf, 0x16u);
  }
  id v29 = objc_loadWeakRetained((id *)&self->_delegate);
  id v30 = v29;
  if (v29 && (*(unsigned char *)&self->_delegateState & 2) != 0) {
    [v29 connection:self didReceiveResponse:v5 forCommand:v4];
  }

LABEL_38:
  return v5;
}

- (id)_errorForResponse:(id)a3 commandParams:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = +[MFActivityMonitor currentMonitor];
  if ([v7 command] == 13
    && ([(MFNWConnectionWrapper *)self->super._socket remoteHostname],
        (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    char v10 = NSString;
    __int16 v11 = MFLookupLocalizedString(@"IMAP_OPEN_FAILED_MSG_FORMAT", @"Mail was unable to open this mailbox on the server “%@”.", @"Delayed");
    long long v12 = objc_msgSend(v10, "stringWithFormat:", v11, v9);
    BOOL v13 = (void *)v9;
  }
  else
  {
    unsigned int v14 = NSString;
    __int16 v11 = MFLookupLocalizedString(@"IMAP_COMMAND_FAILED_FORMAT1", @"IMAP command “%@” failed.", @"Delayed");
    unsigned int v15 = objc_msgSend(NSString, "stringWithCString:encoding:", _IMAPCommandTable[objc_msgSend(v7, "command")], 1);
    long long v12 = objc_msgSend(v14, "stringWithFormat:", v11, v15);

    BOOL v13 = 0;
  }

  unint64_t v16 = _messageFromResponse(v6);
  if (!v16)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    BOOL v17 = [v7 untaggedResponses];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v26;
LABEL_8:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v17);
        }
        unint64_t v16 = _messageFromResponse(*(void **)(*((void *)&v25 + 1) + 8 * v20));
        if (v16) {
          break;
        }
        if (v18 == ++v20)
        {
          uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v18) {
            goto LABEL_8;
          }
          goto LABEL_14;
        }
      }
    }
    else
    {
LABEL_14:
      unint64_t v16 = 0;
    }
  }
  char v21 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:v16];
  [v21 useGenericDescription:v12];
  uint64_t v22 = [v8 error];
  BOOL v23 = v22 == 0;

  if (v23) {
    [v8 setError:v21];
  }

  return v21;
}

- (id)capabilities
{
  [(MFIMAPConnection *)self mf_lock];
  capabilities = self->_capabilities;
  if (!capabilities)
  {
    [(MFIMAPConnection *)self _fetchCapabilities];
    capabilities = self->_capabilities;
  }
  id v4 = [(NSMutableSet *)capabilities allObjects];
  [(MFIMAPConnection *)self mf_unlock];
  return v4;
}

- (BOOL)supportsCapability:(int64_t)a3
{
  [(MFIMAPConnection *)self mf_lock];
  if (!self->_capabilities) {
    [(MFIMAPConnection *)self _fetchCapabilities];
  }
  int locked = locked_supportsCapability(self, a3);
  [(MFIMAPConnection *)self mf_unlock];
  if (a3 == 16 && locked) {
    LOBYTE(locked) = (*((unsigned char *)self + 240) & 1) == 0;
  }
  return locked;
}

- (void)noop
{
  v9[1] = *MEMORY[0x1E4F143B8];
  [(MFIMAPConnection *)self mf_lock];
  uint64_t v3 = [(MFNWConnectionWrapper *)self->super._socket timeout];
  if ((int)v3 >= 11) {
    [(MFNWConnectionWrapper *)self->super._socket setTimeout:10];
  }
  id v4 = [[_MFIMAPCommandParameters alloc] initWithCommand:1];
  v9[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v6 = [(MFIMAPConnection *)self _responseFromSendingCommands:v5];

  if ((int)v3 > 10) {
    [(MFNWConnectionWrapper *)self->super._socket setTimeout:v3];
  }
  [(MFIMAPConnection *)self mf_unlock];
  int v8 = v4;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  [(MFIMAPConnection *)self didFinishCommands:v7];
}

- (BOOL)authenticateUsingAccount:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 password];
  [(MFIMAPConnection *)self mf_lock];
  if ((char)(32 * *((unsigned char *)self + 152)) > 32) {
    goto LABEL_4;
  }
  v33.receiver = self;
  v33.super_class = (Class)MFIMAPConnection;
  unsigned __int8 v6 = [(MFConnection *)&v33 authenticateUsingAccount:v4];
  id v7 = +[MFActivityMonitor currentMonitor];
  int v8 = [v7 error];
  uint64_t v9 = [v4 preferredAuthScheme];
  char v10 = [v9 name];
  int v11 = [v10 isEqualToString:*MEMORY[0x1E4F607A8]];

  if ((v6 & 1) == 0)
  {
    if ([(MFConnection *)self isValid])
    {
      if (v11)
      {
        BOOL v13 = [v4 username];
        unsigned int v14 = [v13 dataUsingEncoding:1];
        BOOL v15 = v14 == 0;

        if (v15)
        {
          uint64_t v22 = +[MFIMAPConnection log];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(0, "ef_publicDescription");
            objc_claimAutoreleasedReturnValue();
            -[MFIMAPConnection authenticateUsingAccount:]();
          }

          BOOL v23 = NSString;
          id v24 = MFLookupLocalizedString(@"FAILED_LOGIN", @"The user name or password for “%@” is incorrect.", @"Delayed");
          long long v25 = [v4 hostname];
          unint64_t v16 = objc_msgSend(v23, "stringWithFormat:", v24, v25);

          long long v26 = MFLookupLocalizedString(@"FAILED_FETCH_TITLE", @"Cannot Get Mail", @"Delayed");
          long long v27 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1032 localizedDescription:v16 title:v26 userInfo:0];

          goto LABEL_18;
        }
        if (!v5)
        {
          unint64_t v16 = MFLookupLocalizedString(@"FAILED_FETCH_TITLE", @"Cannot Get Mail", @"Delayed");
          uint64_t v17 = [v4 missingPasswordErrorWithTitle:v16];
          goto LABEL_17;
        }
        if ([(MFIMAPConnection *)self loginDisabled])
        {
          unint64_t v16 = MFLookupLocalizedString(@"FAILED_FETCH_TITLE", @"Cannot Get Mail", @"Delayed");
          uint64_t v17 = [v4 wrongPasswordOrUsernameErrorWithTitle:v16];
LABEL_17:
          long long v27 = (void *)v17;
LABEL_18:

          if (!v8 && v27)
          {
            long long v28 = +[MFIMAPConnection log];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v27, "ef_publicDescription");
              objc_claimAutoreleasedReturnValue();
              -[MFIMAPConnection authenticateUsingAccount:]();
            }

            id v29 = +[MFActivityMonitor currentMonitor];
            [v29 setError:v27];
          }
          goto LABEL_24;
        }
        if ([(MFIMAPConnection *)self loginWithAccount:v4 password:v5])
        {
          [v7 setError:0];
          goto LABEL_3;
        }
      }
      else if (!v8)
      {
        uint64_t v18 = NSString;
        long long v32 = MFLookupLocalizedString(@"AUTH_NOT_SUPPORTED_FORMAT", @"The %@ server “%@” doesn’t support %@ authentication. Please check your account settings and try again.", @"Delayed");
        id v31 = [(id)objc_opt_class() accountTypeString];
        uint64_t v19 = [v4 hostname];
        uint64_t v20 = [v4 preferredAuthScheme];
        char v21 = [v20 humanReadableName];
        unint64_t v16 = objc_msgSend(v18, "stringWithFormat:", v32, v31, v19, v21);

        uint64_t v17 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1034 localizedDescription:v16];
        goto LABEL_17;
      }
    }
LABEL_24:

    BOOL v12 = 0;
    goto LABEL_25;
  }
LABEL_3:

LABEL_4:
  [(MFIMAPConnection *)self _sendApplePushForAccountIfSupported:v4];
  [(MFIMAPConnection *)self _sendClientInfoIfSupported];
  [(MFIMAPConnection *)self _enableCompressionIfSupported];
  BOOL v12 = 1;
LABEL_25:
  [(MFIMAPConnection *)self mf_unlock];

  return v12;
}

- (id)_serverErrorForAccount:(id)a3 response:(id)a4 command:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [v7 errorForResponse:a4];
  char v10 = [v8 untaggedResponses];
  unint64_t v11 = [v10 count];

  if (!v9 && v11)
  {
    unint64_t v12 = 1;
    do
    {
      BOOL v13 = [v8 untaggedResponses];
      unsigned int v14 = [v13 objectAtIndex:v12 - 1];

      uint64_t v9 = [v7 errorForResponse:v14];

      if (v9) {
        break;
      }
    }
    while (v12++ < v11);
  }

  return v9;
}

- (void)_updateCapabilitiesForAccount:(id)a3 withAuthenticationResponse:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [(MFIMAPConnection *)self _clearCapabilities];
  if (v6 && [v6 responseCode] == 14)
  {
    id v7 = [v6 responseInfo];
    [(MFIMAPConnection *)self _addCapabilities:v7];
  }
  else
  {
    id v7 = [(MFIMAPConnection *)self capabilities];
  }
  [v8 _setCapabilities:v7];
}

- (int64_t)_doIMAPLoginForAccount:(id)a3 quotedUsername:(id)a4 password:(id)a5
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v8 = a4;
  id v9 = a5;
  char v10 = [_MFIMAPCommandParameters alloc];
  v31[0] = v8;
  v31[1] = v9;
  unint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  unint64_t v12 = [(_MFIMAPCommandParameters *)v10 initWithCommand:5 arguments:v11];

  uint64_t v30 = v12;
  BOOL v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  unsigned int v14 = [(MFIMAPConnection *)self _responseFromSendingCommands:v13];

  int64_t v15 = [v14 responseType];
  if (v15 == 2)
  {
    *((unsigned char *)self + 152) = *((unsigned char *)self + 152) & 0xF8 | 2;
    unint64_t v16 = 0;
    [(MFIMAPConnection *)self _updateCapabilitiesForAccount:v28 withAuthenticationResponse:v14];
  }
  else
  {
    uint64_t v17 = +[MFActivityMonitor currentMonitor];
    unint64_t v16 = [v17 error];

    if (v16) {
      goto LABEL_6;
    }
    unint64_t v16 = [(MFIMAPConnection *)self _serverErrorForAccount:v28 response:v14 command:v12];
    if (v16) {
      goto LABEL_6;
    }
    uint64_t v18 = NSString;
    uint64_t v19 = MFLookupLocalizedString(@"FAILED_LOGIN", @"The user name or password for “%@” is incorrect.", @"Delayed");
    uint64_t v20 = [v28 hostname];
    char v21 = objc_msgSend(v18, "stringWithFormat:", v19, v20);

    uint64_t v22 = MFLookupLocalizedString(@"FAILED_FETCH_TITLE", @"Cannot Get Mail", @"Delayed");
    unint64_t v16 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1032 localizedDescription:v21 title:v22 userInfo:0];

    if (v16)
    {
LABEL_6:
      char v23 = *((unsigned char *)self + 152);
      if ((char)(32 * v23) >= 33) {
        *((unsigned char *)self + 152) = v23 & 0xF8 | 1;
      }
      id v24 = [v14 userString];
      [v16 setMoreInfo:v24];

      long long v25 = +[MFActivityMonitor currentMonitor];
      [v25 setError:v16];
    }
  }
  id v29 = v12;
  long long v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  [(MFIMAPConnection *)self didFinishCommands:v26];

  return v15;
}

- (BOOL)loginWithAccount:(id)a3 password:(id)a4
{
  id v6 = a3;
  id v7 = (__CFString *)a4;
  [(MFIMAPConnection *)self mf_lock];
  if ((char)(32 * *((unsigned char *)self + 152)) <= 32)
  {
    id v9 = [v6 username];
    char v10 = _IMAPCreateQuotedString(v9);
    if (v7
      && (CFCharacterSetRef v11 = (const __CFCharacterSet *)sIMAPNeedsLiteralCharacterSet,
          v20.length = [(__CFString *)v7 length],
          v20.location = 0,
          CFStringFindCharacterFromSet(v7, v11, v20, 0, 0)))
    {
      unint64_t v12 = [(__CFString *)v7 dataUsingEncoding:4 allowLossyConversion:0];
      char v13 = 1;
    }
    else
    {
      unint64_t v12 = _IMAPCreateQuotedString(v7);
      char v13 = 0;
    }
    int v14 = (char)(32 * *((unsigned char *)self + 152));
    if (v14 > 63
      || ((v15 = [(MFIMAPConnection *)self _doIMAPLoginForAccount:v6 quotedUsername:v10 password:v12], int v14 = (char)(32 * *((unsigned char *)self + 152)), v14 <= 63)? (v16 = v15 == 3): (v16 = 0), !v16 ? (v17 = 1) : (v17 = v13), (v17 & 1) != 0))
    {
      uint64_t v18 = v12;
    }
    else
    {
      uint64_t v18 = [(__CFString *)v7 dataUsingEncoding:4 allowLossyConversion:0];

      [(MFIMAPConnection *)self _doIMAPLoginForAccount:v6 quotedUsername:v10 password:v18];
      LOBYTE(v14) = 32 * *((unsigned char *)self + 152);
    }
    BOOL v8 = (char)v14 > 32;
  }
  else
  {
    BOOL v8 = 1;
  }
  [(MFIMAPConnection *)self mf_unlock];

  return v8;
}

- (BOOL)logout
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if ((*((unsigned char *)self + 152) & 7) == 0) {
    return 1;
  }
  uint64_t v3 = [[_MFIMAPCommandParameters alloc] initWithCommand:2];
  [(MFIMAPConnection *)self mf_lock];
  v9[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  BOOL v5 = [(MFIMAPConnection *)self _sendCommands:v4 response:0] != 0;

  [(MFIMAPConnection *)self mf_unlock];
  [(MFIMAPConnection *)self disconnectAndNotifyDelegate:1];
  BOOL v8 = v3;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  [(MFIMAPConnection *)self didFinishCommands:v6];

  return v5;
}

- (id)separatorChar
{
  [(MFIMAPConnection *)self mf_lock];
  uint64_t v3 = self->_separatorChar;
  [(MFIMAPConnection *)self mf_unlock];
  if (!v3)
  {
    id v4 = [(MFIMAPConnection *)self _doListCommand:6 withReference:&stru_1EFF11268 mailboxName:&stru_1EFF11268 options:0 getSpecialUse:0 statusDataItems:0 statusEntriesByMailbox:0];

    if (v4)
    {
      [(MFIMAPConnection *)self mf_lock];
      separatorChar = self->_separatorChar;
      if (!separatorChar)
      {
        id v6 = (NSString *)[@"/" copy];
        id v7 = self->_separatorChar;
        self->_separatorChar = v6;

        separatorChar = self->_separatorChar;
      }
      uint64_t v3 = separatorChar;
      [(MFIMAPConnection *)self mf_unlock];
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  if (v3) {
    BOOL v8 = (__CFString *)v3;
  }
  else {
    BOOL v8 = &stru_1EFF11268;
  }
  id v9 = v8;

  return v9;
}

- (id)serverPathPrefix
{
  if (!self->_serverNamespace && [(MFIMAPConnection *)self supportsCapability:7]) {
    id v3 = [(MFIMAPConnection *)self _doNamespaceCommand];
  }
  serverNamespace = self->_serverNamespace;
  return serverNamespace;
}

- (id)_doNamespaceCommand
{
  v22[1] = *MEMORY[0x1E4F143B8];
  if ([(MFIMAPConnection *)self supportsCapability:7])
  {
    id v3 = [[_MFIMAPCommandParameters alloc] initWithCommand:30];
    v22[0] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    int64_t v15 = [(MFIMAPConnection *)self _responseFromSendingCommands:v4];

    if ([v15 responseType] == 2)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      BOOL v5 = [(_MFIMAPCommandParameters *)v3 untaggedResponses];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v17 != v7) {
              objc_enumerationMutation(v5);
            }
            id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if ([v9 responseType] == 22)
            {
              char v10 = [v9 privateNamespaces];
              CFCharacterSetRef v11 = [v10 firstObject];

              if (v11)
              {
                unint64_t v12 = [v11 objectForKeyedSubscript:0x1EFF1EDC8];
                if ([v12 length])
                {
                  objc_storeStrong((id *)&self->_serverNamespace, v12);

                  goto LABEL_19;
                }
              }
            }
          }
          uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
      unint64_t v12 = 0;
LABEL_19:
    }
    else
    {
      unint64_t v12 = 0;
    }
    CFRange v20 = v3;
    char v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    [(MFIMAPConnection *)self didFinishCommands:v13];
  }
  else
  {
    unint64_t v12 = 0;
  }
  return v12;
}

- (id)_doListCommand:(int64_t)a3 withReference:(id)a4 mailboxName:(id)a5 options:(int64_t)a6 getSpecialUse:(BOOL)a7 statusDataItems:(id)a8 statusEntriesByMailbox:(id *)a9
{
  BOOL v10 = a7;
  v88[1] = *MEMORY[0x1E4F143B8];
  id v72 = a4;
  int v14 = (__CFString *)a5;
  id v74 = a8;
  theString = v14;
  if (!v14)
  {
    id v79 = 0;
    id v75 = 0;
    goto LABEL_75;
  }
  uint64_t v76 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  uint64_t v81 = [[_MFIMAPCommandParameters alloc] initWithCommand:a3 arguments:v76];
  int64_t v15 = MFIMAPStringFromMailboxName(v72);
  [v76 addObject:v15];

  if (a6 == 1)
  {
    long long v16 = @"%";
LABEL_7:
    if ([(__CFString *)v14 length])
    {
      long long v17 = [(MFIMAPConnection *)self separatorChar];
      MutableCopy = CFStringCreateMutableCopy(0, [(__CFString *)v17 length]+ [(__CFString *)v14 length]+ [(__CFString *)v16 length], v14);
      long long v19 = MutableCopy;
      if (v17) {
        CFStringAppend(MutableCopy, v17);
      }
      CFStringAppend(v19, v16);
      CFRange v20 = MFIMAPStringFromMailboxName(v19);
      [v76 addObject:v20];

      CFRelease(v19);
    }
    else
    {
      MFIMAPStringFromMailboxName(v16);
      long long v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      [v76 addObject:v17];
    }
    goto LABEL_13;
  }
  if (a6 == 2)
  {
    long long v16 = @"*";
    goto LABEL_7;
  }
  MFIMAPStringFromMailboxName(v14);
  long long v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  [v76 addObject:v17];
LABEL_13:

  id v73 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v10) {
    [v73 addObject:@"SPECIAL-USE"];
  }
  if ([v74 count] && -[MFIMAPConnection supportsCapability:](self, "supportsCapability:", 22))
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v22 = [NSString alloc];
    char v23 = [(MFIMAPConnection *)self parenthesizedStringWithObjects:v74];
    id v24 = (void *)[v22 initWithFormat:@"STATUS %@", v23];

    [v73 addObject:v24];
    id v79 = v21;
  }
  else
  {
    id v79 = 0;
  }
  if ([v73 count])
  {
    id v25 = [NSString alloc];
    long long v26 = [v73 componentsJoinedByString:@" "];
    long long v27 = (void *)[v25 initWithFormat:@"RETURN (%@)", v26];

    [v76 addObject:v27];
  }
  v88[0] = v81;
  id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:1];
  id v29 = [(MFIMAPConnection *)self _responseFromSendingCommands:v28];
  v82 = self;
  BOOL v30 = [v29 responseType] == 2;

  if (v30)
  {
    id v31 = [(_MFIMAPCommandParameters *)v81 untaggedResponses];
    unint64_t v84 = [v31 count];

    id v75 = [MEMORY[0x1E4F1CA48] array];
    long long v32 = self;
    if (v84)
    {
      unint64_t v85 = 0;
      while (1)
      {
        objc_super v33 = [(_MFIMAPCommandParameters *)v81 untaggedResponses];
        uint64_t v34 = [v33 objectAtIndex:v85];

        uint64_t v35 = [v34 responseType];
        uint64_t v36 = v35;
        if ((unint64_t)(v35 - 15) <= 1) {
          break;
        }
        if (v79 && v35 == 13)
        {
          long long v42 = [v34 statusEntries];
          BOOL v43 = [v34 mailboxName];
          [v79 setObject:v42 forKeyedSubscript:v43];

          BOOL v44 = [(_MFIMAPCommandParameters *)v81 untaggedResponses];
          [v44 removeObjectAtIndex:v85];

LABEL_70:
          --v84;
          goto LABEL_71;
        }
        ++v85;
LABEL_71:

        long long v32 = v82;
        if (v85 >= v84) {
          goto LABEL_74;
        }
      }
      uint64_t v77 = [v34 mailboxAttributes];
      v83 = [v34 mailboxName];
      unint64_t v80 = [v34 separator];
      if (v80)
      {
        [(MFIMAPConnection *)v82 mf_lock];
        v37 = v82;
        if (!v82->_separatorChar)
        {
          uint64_t v38 = [v80 copy];
          separatorChar = v82->_separatorChar;
          v82->_separatorChar = (NSString *)v38;

          v37 = v82;
        }
        [(MFIMAPConnection *)v37 mf_unlock];
      }
      if (v83)
      {
        if ([v83 length]
          && (!-[__CFString length](theString, "length") || [v83 hasPrefix:theString]))
        {
          id v40 = v75;
          uint64_t v41 = [(__CFString *)theString length];
          if ([(NSString *)v82->_serverNamespace length]) {
            int v70 = [v83 hasPrefix:v82->_serverNamespace] ^ 1;
          }
          else {
            int v70 = 0;
          }
          if (v80)
          {
            objc_msgSend(v83, "rangeOfString:options:range:", v80, 8, v41, objc_msgSend(v83, "length") - v41);
            if (v45) {
              v41 += [v80 length];
            }
          }
          if (v41)
          {
            uint64_t v46 = [v83 substringFromIndex:v41];

            v83 = (void *)v46;
          }
          if (!v80)
          {
            long long v87 = v83;
            id v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
            unint64_t v51 = 1;
LABEL_51:
            uint64_t v53 = 0;
            uint64_t v52 = 0;
            while (2)
            {
              int64_t v54 = [v47 objectAtIndex:v53];
              uint64_t v55 = objc_msgSend(v40, "mf_indexOfMailboxDictionaryWithName:", v54);
              if (v55 == 0x7FFFFFFFFFFFFFFFLL)
              {

                goto LABEL_55;
              }
              uint64_t v56 = [v40 objectAtIndex:v55];

              uint64_t v52 = (void *)v56;
              if (!v56)
              {
LABEL_55:
                uint64_t v52 = [MEMORY[0x1E4F1CA60] dictionary];
                [v52 setObject:v54 forKey:@"MailboxName"];
                if (v53 + 1 < v51)
                {
                  BOOL v57 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:2];
                  [v52 setObject:v57 forKey:@"IMAPMailboxAttributes"];

                  BOOL v58 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:2];
                  [v52 setObject:v58 forKey:@"MailboxAttributes"];
                }
                objc_msgSend(v40, "ef_insertObject:usingSortFunction:context:allowDuplicates:", v52, _MFCompareMailboxDictionariesByName, 0, 1);
              }
              uint64_t v59 = [v52 objectForKey:@"MailboxChildren"];

              id v40 = (id)v59;
              if (!((v59 != 0) | (a6 != 2) | v77 & 1))
              {
                id v40 = [MEMORY[0x1E4F1CA48] array];
                [v52 setObject:v40 forKey:@"MailboxChildren"];
              }

              if (v51 == ++v53) {
                goto LABEL_61;
              }
              continue;
            }
          }
          id v47 = objc_msgSend(v83, "componentsSeparatedByString:");
          uint64_t v48 = [v47 count];
          if (v48)
          {
            uint64_t v49 = [v47 lastObject];
            unsigned int v50 = [v49 isEqualToString:&stru_1EFF11268];

            unint64_t v51 = v48 - v50;
            if (v48 != v50) {
              goto LABEL_51;
            }
          }
          uint64_t v52 = 0;
LABEL_61:
          BOOL v60 = v47;
          v61 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v77];
          [v52 setObject:v61 forKey:@"IMAPMailboxAttributes"];

          v62 = [v52 objectForKey:@"MailboxAttributes"];
          unsigned int v63 = [v62 unsignedIntValue] & 0xFFFFFFFD | (2 * ((v77 >> 1) & 1));
          if (v70) {
            uint64_t v64 = v63 | 0x80;
          }
          else {
            uint64_t v64 = v63;
          }
          unint64_t v65 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v64];
          [v52 setObject:v65 forKey:@"MailboxAttributes"];

          if (v36 == 15)
          {
            uint64_t v66 = [v34 extraAttributes];
            if ([v66 count]) {
              [v52 setObject:v66 forKey:@"MailboxExtraAttributes"];
            }
          }
        }
      }
      else
      {
        v83 = 0;
      }
      uint64_t v67 = [(_MFIMAPCommandParameters *)v81 untaggedResponses];
      [v67 removeObjectAtIndex:v85];

      goto LABEL_70;
    }
  }
  else
  {
    id v75 = 0;
    long long v32 = self;
  }
LABEL_74:
  long long v86 = v81;
  uint64_t v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
  [(MFIMAPConnection *)v32 didFinishCommands:v68];

LABEL_75:
  if (a9) {
    *a9 = v79;
  }

  return v75;
}

- (id)_listingForMailbox:(id)a3 options:(int64_t)a4 getSpecialUse:(BOOL)a5 statusDataItems:(id)a6 statusEntriesByMailbox:(id *)a7 withCommand:(int64_t)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  int64_t v15 = [(MFIMAPConnection *)self _doListCommand:a8 withReference:&stru_1EFF11268 mailboxName:v14 options:a4 getSpecialUse:v11 statusDataItems:a6 statusEntriesByMailbox:a7];
  mailboxListFilter = self->_mailboxListFilter;
  if (mailboxListFilter) {
    [(MFIMAPMailboxListFilter *)mailboxListFilter filterMailboxList:v15 forMailbox:v14 options:a4];
  }

  return v15;
}

- (id)listingForMailbox:(id)a3 options:(int64_t)a4 getSpecialUse:(BOOL)a5 statusDataItems:(id)a6 statusEntriesByMailbox:(id *)a7
{
  uint64_t v7 = [(MFIMAPConnection *)self _listingForMailbox:a3 options:a4 getSpecialUse:a5 statusDataItems:a6 statusEntriesByMailbox:a7 withCommand:6];
  return v7;
}

- (id)subscribedListingForMailbox:(id)a3 options:(int64_t)a4
{
  id v4 = [(MFIMAPConnection *)self _listingForMailbox:a3 options:a4 getSpecialUse:0 statusDataItems:0 statusEntriesByMailbox:0 withCommand:7];
  return v4;
}

- (void)close
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = [[_MFIMAPCommandParameters alloc] initWithCommand:18];
  [(MFIMAPConnection *)self mf_lock];
  v10[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  BOOL v5 = [(MFIMAPConnection *)self _responseFromSendingCommands:v4];
  BOOL v6 = [v5 responseType] == 2;

  if (v6)
  {
    *((unsigned char *)self + 152) = *((unsigned char *)self + 152) & 0xF8 | 2;
    selectedMailbox = self->_selectedMailbox;
    self->_selectedMailbox = 0;
  }
  [(MFIMAPConnection *)self mf_unlock];
  id v9 = v3;
  BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  [(MFIMAPConnection *)self didFinishCommands:v8];
}

- (BOOL)closeAndLogout
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v3 = [[_MFIMAPCommandParameters alloc] initWithCommand:18];
  v8[0] = v3;
  id v4 = [[_MFIMAPCommandParameters alloc] initWithCommand:2];
  v8[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];

  [(MFIMAPConnection *)self mf_lock];
  unint64_t v6 = [(MFIMAPConnection *)self _sendCommands:v5 response:0];
  [(MFIMAPConnection *)self disconnectAndNotifyDelegate:1];
  [(MFIMAPConnection *)self mf_unlock];
  [(MFIMAPConnection *)self didFinishCommands:v5];

  return v6 != 0;
}

- (void)unselect
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([(MFIMAPConnection *)self supportsCapability:9])
  {
    id v3 = [[_MFIMAPCommandParameters alloc] initWithCommand:25];
    [(MFIMAPConnection *)self mf_lock];
    v10[0] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    BOOL v5 = [(MFIMAPConnection *)self _responseFromSendingCommands:v4];
    BOOL v6 = [v5 responseType] == 2;

    if (v6)
    {
      *((unsigned char *)self + 152) = *((unsigned char *)self + 152) & 0xF8 | 2;
      selectedMailbox = self->_selectedMailbox;
      self->_selectedMailbox = 0;
    }
    [(MFIMAPConnection *)self mf_unlock];
    id v9 = v3;
    BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
    [(MFIMAPConnection *)self didFinishCommands:v8];
  }
  else
  {
    [(MFIMAPConnection *)self close];
  }
}

- (void)handleBytesAvailable
{
  streamEventQueue = self->_streamEventQueue;
  if (!streamEventQueue)
  {
    id v4 = objc_alloc_init(MFInvocationQueue);
    BOOL v5 = self->_streamEventQueue;
    self->_streamEventQueue = v4;

    streamEventQueue = self->_streamEventQueue;
  }
  objc_msgSend(MEMORY[0x1E4F1CA18], "mf_invocationWithSelector:target:", sel__handleBytesAvailableInternal, self);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MFInvocationQueue addInvocation:](streamEventQueue, "addInvocation:");
}

- (void)_handleBytesAvailableInternal
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(MFIMAPConnection *)self mf_lock];
  if ([(MFConnection *)self hasBytesAvailable])
  {
    *(void *)&long long v3 = 134218242;
    long long v9 = v3;
    do
    {
      id v4 = [[MFIMAPResponse alloc] initWithConnection:self responseConsumer:0];
      if ([(MFIMAPResponse *)v4 isUntagged] && (*(unsigned char *)&self->_delegateState & 2) != 0)
      {
        if ([(MFIMAPConnection *)self isIdle])
        {
          BOOL v5 = +[MFIMAPConnection log];
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v9;
            BOOL v11 = self;
            __int16 v12 = 2112;
            char v13 = v4;
            _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "Idle: connection <%p> received response while idling: %@", buf, 0x16u);
          }
        }
        id v6 = [[_MFIMAPCommandParameters alloc] initWithCommand:28];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        BOOL v8 = WeakRetained;
        if (WeakRetained && (*(unsigned char *)&self->_delegateState & 2) != 0) {
          [WeakRetained connection:self didReceiveResponse:v4 forCommand:v6];
        }
      }
    }
    while ([(MFConnection *)self hasBytesAvailable]);
  }
  [(MFIMAPConnection *)self mf_unlock];
}

- (void)locked_startIdle
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __36__MFIMAPConnection_locked_startIdle__block_invoke;
  v21[3] = &unk_1E5D3BBD0;
  v21[4] = self;
  long long v3 = [MEMORY[0x1E4F60D70] lazyFutureWithBlock:v21];
  if (![(MFIMAPConnection *)self isIdle]
    && [(MFIMAPConnection *)self supportsCapability:5])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    BOOL v5 = WeakRetained;
    if (WeakRetained && (*(unsigned char *)&self->_delegateState & 0x80000000) != 0)
    {
      int v8 = [WeakRetained shouldStartIdleForConnection:self];

      if (v8)
      {
        long long v9 = +[MFIMAPConnection log];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v10 = [(MFIMAPConnection *)self delegate];
          *(_DWORD *)buf = 134218242;
          id v25 = self;
          __int16 v26 = 2112;
          long long v27 = v10;
          _os_log_impl(&dword_1A7EFF000, v9, OS_LOG_TYPE_DEFAULT, "Idle: connection <%p> starting IDLE state for delegate %@", buf, 0x16u);
        }
        id v6 = [[_MFIMAPCommandParameters alloc] initWithCommand:28];
        char v23 = v6;
        BOOL v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
        id v20 = 0;
        unint64_t v12 = [(MFIMAPConnection *)self _sendCommands:v11 response:&v20];
        id v13 = v20;

        if (v12)
        {
          id v14 = [(MFIMAPConnection *)self _copyNextTaggedOrContinuationResponseForCommand:v6];

          if ([v14 responseType] == 1)
          {
            self->_idleCommandSequenceNumber = [(_MFIMAPCommandParameters *)v6 sequenceNumber];
            id v13 = v14;
            id v15 = (id)[v3 result:0];
          }
          else
          {
            id v13 = v14;
          }
        }
        id v22 = v6;
        long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
        [(MFIMAPConnection *)self didFinishCommands:v16];

        if ([(MFIMAPConnection *)self isIdle])
        {
          [(MFIMAPConnection *)self locked_scheduleIdleResetAfterDelay:1740.0];
        }
        else
        {
          long long v17 = +[MFIMAPConnection log];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            long long v18 = [(MFIMAPConnection *)self delegate];
            *(_DWORD *)buf = 134218242;
            id v25 = self;
            __int16 v26 = 2112;
            long long v27 = v18;
            _os_log_impl(&dword_1A7EFF000, v17, OS_LOG_TYPE_DEFAULT, "Idle: connection <%p> failed to enter IDLE state: %@", buf, 0x16u);
          }
        }

        goto LABEL_21;
      }
    }
    else
    {
    }
    id v6 = +[MFIMAPConnection log];
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(MFIMAPConnection *)self delegate];
      *(_DWORD *)buf = 134218242;
      id v25 = self;
      __int16 v26 = 2112;
      long long v27 = v7;
      _os_log_impl(&dword_1A7EFF000, &v6->super, OS_LOG_TYPE_DEFAULT, "Idle: connection <%p> delegate rejected starting IDLE state: %@", buf, 0x16u);
    }
LABEL_21:
  }
  id v19 = (id)[v3 result:0];
}

id __36__MFIMAPConnection_locked_startIdle__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__MFIMAPConnection_locked_startIdle__block_invoke_2;
  v5[3] = &unk_1E5D3B5C0;
  v5[4] = v1;
  [v2 registerForBytesAvailableWithHandler:v5];
  long long v3 = [MEMORY[0x1E4F1CA98] null];
  return v3;
}

uint64_t __36__MFIMAPConnection_locked_startIdle__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleBytesAvailable];
}

- (void)locked_finishIdle
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(MFNWConnectionWrapper *)self->super._socket unregisterForBytesAvailable];
  long long v3 = [(MFIMAPConnection *)self idleSubscriptionCancelable];
  [v3 cancel];

  if ([(MFIMAPConnection *)self isIdle])
  {
    id v4 = +[MFIMAPConnection log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = [(MFIMAPConnection *)self delegate];
      *(_DWORD *)buf = 134218242;
      BOOL v10 = self;
      __int16 v11 = 2112;
      unint64_t v12 = v5;
      _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_DEFAULT, "Idle: connection <%p> leaving IDLE state for delegate: %@", buf, 0x16u);
    }
    id v6 = [[_MFIMAPCommandParameters alloc] initWithCommand:29 sequenceNumber:self->_idleCommandSequenceNumber];
    self->_idleCommandSequenceNumber = 0;
    int v8 = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
    [(MFIMAPConnection *)self _sendCommands:v7 response:0];
  }
}

- (void)finishIdle
{
  [(MFIMAPConnection *)self mf_lock];
  [(MFIMAPConnection *)self locked_finishIdle];
  [(MFIMAPConnection *)self mf_unlock];
}

- (BOOL)isIdle
{
  return self->_idleCommandSequenceNumber != 0;
}

- (void)locked_scheduleIdle
{
  if ([(MFIMAPConnection *)self hasValidConnection])
  {
    long long v3 = self;
    if ((*((_WORD *)v3 + 64) & 0x20) != 0)
    {
      uint64_t v7 = v3;
      id v4 = [MEMORY[0x1E4F60D58] currentDevice];
      char v5 = [v4 isPlatform:2];

      if ((v5 & 1) == 0)
      {
        socket = v7->super._socket;
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __39__MFIMAPConnection_locked_scheduleIdle__block_invoke;
        void v8[3] = &unk_1E5D3B5C0;
        v8[4] = v7;
        [(MFNWConnectionWrapper *)socket registerForBytesAvailableWithHandler:v8];
        if (v7->_selectedMailbox) {
          [(MFIMAPConnection *)v7 locked_scheduleIdleResetAfterDelay:2.0];
        }
      }
    }
    else
    {
    }
  }
}

uint64_t __39__MFIMAPConnection_locked_scheduleIdle__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleBytesAvailable];
}

- (void)scheduleIdleReset
{
  [(MFIMAPConnection *)self mf_lock];
  if ([(MFIMAPConnection *)self hasValidConnection])
  {
    if ((*((_WORD *)self + 64) & 0x20) != 0)
    {
      long long v3 = [MEMORY[0x1E4F60D58] currentDevice];
      char v4 = [v3 isPlatform:2];

      if ((v4 & 1) == 0)
      {
        if (self->_selectedMailbox) {
          [(MFIMAPConnection *)self locked_scheduleIdleResetAfterDelay:2.0];
        }
      }
    }
  }
  [(MFIMAPConnection *)self mf_unlock];
}

- (void)locked_scheduleIdleResetAfterDelay:(double)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  char v5 = [(MFIMAPConnection *)self idleSubscriptionCancelable];
  [v5 cancel];

  id v6 = [MEMORY[0x1E4F60F28] globalAsyncSchedulerWithQualityOfService:17];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__MFIMAPConnection_locked_scheduleIdleResetAfterDelay___block_invoke;
  void v8[3] = &unk_1E5D3BBF8;
  objc_copyWeak(v9, &location);
  v9[1] = *(id *)&a3;
  uint64_t v7 = [v6 afterDelay:v8 performBlock:a3];
  [(MFIMAPConnection *)self setIdleSubscriptionCancelable:v7];

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __55__MFIMAPConnection_locked_scheduleIdleResetAfterDelay___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v3 = +[MFIMAPConnection log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = *(void **)(a1 + 40);
    char v5 = [WeakRetained delegate];
    int v12 = 134218498;
    id v13 = WeakRetained;
    __int16 v14 = 2048;
    id v15 = v4;
    __int16 v16 = 2112;
    long long v17 = v5;
    _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_DEFAULT, "Idle: connection <%p> timer fired for delayed IDLE reset after %0.2fs delay: %@", (uint8_t *)&v12, 0x20u);
  }
  objc_msgSend(WeakRetained, "mf_lock");
  id v6 = WeakRetained;
  uint64_t v7 = v6;
  if ((v6[64] & 0x20) != 0)
  {
    int v8 = [MEMORY[0x1E4F60D58] currentDevice];
    char v9 = [v8 isPlatform:2];

    if ((v9 & 1) == 0)
    {
      BOOL v10 = +[MFIMAPConnection log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v11 = [v7 delegate];
        int v12 = 134218242;
        id v13 = v7;
        __int16 v14 = 2112;
        id v15 = v11;
        _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_DEFAULT, "Idle: connection <%p> resetting IDLE state: %@", (uint8_t *)&v12, 0x16u);
      }
      objc_msgSend(v7, "locked_finishIdle");
      objc_msgSend(v7, "locked_startIdle");
    }
  }
  else
  {
  }
  objc_msgSend(v7, "mf_unlock");
}

- (BOOL)expunge
{
  v11[1] = *MEMORY[0x1E4F143B8];
  long long v3 = [[_MFIMAPCommandParameters alloc] initWithCommand:16];
  v11[0] = v3;
  char v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  char v5 = [(MFIMAPConnection *)self _responseFromSendingCommands:v4];

  if ([v5 responseType] == 4)
  {
    id v6 = [(MFIMAPConnection *)self _errorForResponse:v5 commandParams:v3];
  }
  else
  {
    id v6 = 0;
  }
  BOOL v10 = v3;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  [(MFIMAPConnection *)self didFinishCommands:v7];

  if (v6)
  {
    int v8 = +[MFActivityMonitor currentMonitor];
    [v8 setError:v6];
  }
  return 0;
}

- (BOOL)expungeUIDs:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(MFIMAPConnection *)self supportsCapability:3])
  {
    +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1029 localizedDescription:@"*** Server doesn't support UIDPLUS"];
    long long v17 = v12 = 0;
    if (!v17) {
      goto LABEL_11;
    }
LABEL_9:
    uint64_t v18 = +[MFActivityMonitor currentMonitor];
    [v18 setError:v17];

    goto LABEL_11;
  }
  if (![v4 count])
  {
    BOOL v12 = 1;
    goto LABEL_11;
  }
  char v5 = [(MFIMAPConnection *)self messageSetForUIDs:v4];
  id v6 = [_MFIMAPCommandParameters alloc];
  v22[0] = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  int v8 = [(_MFIMAPCommandParameters *)v6 initWithCommand:17 arguments:v7];

  id v21 = v8;
  char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  BOOL v10 = [(MFIMAPConnection *)self _responseFromSendingCommands:v9];

  uint64_t v11 = [v10 responseType];
  BOOL v12 = v11 == 2;
  id v20 = v8;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  [(MFIMAPConnection *)self didFinishCommands:v13];

  if (v11 != 2
    && (+[MFActivityMonitor currentMonitor],
        __int16 v14 = objc_claimAutoreleasedReturnValue(),
        [v14 error],
        id v15 = objc_claimAutoreleasedReturnValue(),
        BOOL v16 = v15 == 0,
        v15,
        v14,
        v16))
  {
    long long v17 = [(MFIMAPConnection *)self _errorForResponse:v10 commandParams:v8];
  }
  else
  {
    long long v17 = 0;
  }

  if (v17) {
    goto LABEL_9;
  }
LABEL_11:

  return v12;
}

- (void)fetchStatusForMailboxes:(id)a3 args:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(MFIMAPConnection *)self parenthesizedStringWithObjects:a4];
  int v8 = self;
  id v23 = v6;
  id v22 = v7;
  char v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:30];
  uint64_t v10 = [v23 count];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v11 addObject:&stru_1EFF11268];
  if (v22) {
    [v11 addObject:v22];
  }
  if (v10)
  {
    uint64_t v12 = 0;
    while (1)
    {
      id v13 = [v23 objectAtIndexedSubscript:v12];
      __int16 v14 = [(MFIMAPConnection *)v8 separatorChar];
      if ([v13 hasPrefix:v14])
      {
        uint64_t v15 = objc_msgSend(v13, "substringFromIndex:", objc_msgSend(v14, "length"));

        id v13 = (void *)v15;
      }
      BOOL v16 = MFIMAPStringFromMailboxName(v13);
      [v11 replaceObjectAtIndex:0 withObject:v16];

      long long v17 = [_MFIMAPCommandParameters alloc];
      uint64_t v18 = (void *)[v11 copy];
      id v19 = [(_MFIMAPCommandParameters *)v17 initWithCommand:8 arguments:v18];
      [v9 addObject:v19];

      if (v12 == 29 || v10 - 1 == v12)
      {
        id v20 = [(MFIMAPConnection *)v8 _responseFromSendingCommands:v9];
        uint64_t v21 = [v20 responseType];

        [(MFIMAPConnection *)v8 didFinishCommands:v9];
        [v9 removeAllObjects];
        if (v21 != 2) {
          break;
        }
      }
      ++v12;

      if (v10 == v12) {
        goto LABEL_13;
      }
    }
  }
LABEL_13:
}

- (BOOL)examineMailbox:(id)a3
{
  return _processSelectCommand(self, 9, a3);
}

- (BOOL)selectMailbox:(id)a3 withAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = _processSelectCommand(self, 13, v6);
  if (v8) {
    [(MFIMAPConnection *)self _updateSearchCapabilityWithAccount:v7];
  }

  return v8;
}

- (id)selectedMailbox
{
  return self->_selectedMailbox;
}

- (BOOL)createMailbox:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = MFIMAPStringFromMailboxName(v4);
  v9[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  BOOL v7 = [(MFIMAPConnection *)self _sendMailboxCommand:10 withArguments:v6];
  if (v7) {
    [(MFIMAPConnection *)self _sendMailboxCommand:14 withArguments:v6];
  }

  return v7;
}

- (BOOL)deleteMailbox:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = MFIMAPStringFromMailboxName(v4);
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  [(MFIMAPConnection *)self _sendMailboxCommand:15 withArguments:v6];
  LOBYTE(self) = [(MFIMAPConnection *)self _sendMailboxCommand:11 withArguments:v6];

  return (char)self;
}

- (BOOL)renameMailbox:(id)a3 toMailbox:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = MFIMAPStringFromMailboxName(v6);

  char v9 = MFIMAPStringFromMailboxName(v7);

  v17[0] = v8;
  v17[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  BOOL v11 = [(MFIMAPConnection *)self _sendMailboxCommand:12 withArguments:v10];
  if (v11)
  {
    BOOL v16 = v8;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    [(MFIMAPConnection *)self _sendMailboxCommand:15 withArguments:v12];

    uint64_t v15 = v9;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    [(MFIMAPConnection *)self _sendMailboxCommand:14 withArguments:v13];
  }
  return v11;
}

- (BOOL)_sendMailboxCommand:(int64_t)a3 withArguments:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [[_MFIMAPCommandParameters alloc] initWithCommand:a3 arguments:v6];
  v18[0] = v7;
  int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  char v9 = [(MFIMAPConnection *)self _responseFromSendingCommands:v8];

  uint64_t v10 = [v9 responseType];
  if (v10 != 2)
  {
    BOOL v11 = +[MFActivityMonitor currentMonitor];
    uint64_t v12 = [v11 error];
    BOOL v13 = v12 == 0;

    if (v13) {
      id v14 = [(MFIMAPConnection *)self _errorForResponse:v9 commandParams:v7];
    }
  }
  long long v17 = v7;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  [(MFIMAPConnection *)self didFinishCommands:v15];

  return v10 == 2;
}

- (id)copyArgumentForSearchTerm:(id)a3
{
  long long v3 = (__CFString *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFCharacterSetRef v4 = (const __CFCharacterSet *)sIMAPNeedsLiteralCharacterSet;
    v8.length = [(__CFString *)v3 length];
    v8.id location = 0;
    if (CFStringFindCharacterFromSet(v3, v4, v8, 0, 0))
    {
      uint64_t v5 = [(__CFString *)v3 dataUsingEncoding:4 allowLossyConversion:0];
LABEL_8:
      id v6 = (void *)v5;
      goto LABEL_9;
    }
    id v6 = _IMAPCreateQuotedString(v3);
    if (!v6)
    {
LABEL_7:
      uint64_t v5 = [(__CFString *)v3 copy];
      goto LABEL_8;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_7;
    }
    id v6 = 0;
  }
LABEL_9:

  return v6;
}

- (id)searchUidSet:(id)a3 forTerms:(id)a4 success:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(MFIMAPConnection *)self supportsCapability:15])
  {
    uint64_t v10 = [(MFIMAPConnection *)self eSearchIDSet:v8 areMessageSequenceNumbers:0 forTerms:v9 success:a5 returning:4];
    BOOL v11 = [v10 objectForKey:@"IMAPESearchAllKey"];
    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
      BOOL v13 = (void *)MEMORY[0x1AD0E3E00]();
      for (uint64_t i = [v11 firstIndex];
            i != 0x7FFFFFFFFFFFFFFFLL;
            uint64_t i = [v11 indexGreaterThanIndex:i])
      {
        uint64_t v15 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:i];
        [v12 addObject:v15];
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    id v19 = 0;
    char v16 = _doUidSearch(self, v8, v9, &v19, a5, 0);
    id v17 = v19;
    uint64_t v12 = v17;
    if ((v16 & 1) == 0)
    {

      uint64_t v12 = 0;
    }
  }

  return v12;
}

- (id)searchIDSet:(id)a3 forTerms:(id)a4 success:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(MFIMAPConnection *)self supportsCapability:15])
  {
    uint64_t v10 = [(MFIMAPConnection *)self eSearchIDSet:v8 areMessageSequenceNumbers:1 forTerms:v9 success:a5 returning:4];
    BOOL v11 = [v10 objectForKey:@"IMAPESearchAllKey"];
    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
      BOOL v13 = (void *)MEMORY[0x1AD0E3E00]();
      for (uint64_t i = [v11 firstIndex];
            i != 0x7FFFFFFFFFFFFFFFLL;
            uint64_t i = [v11 indexGreaterThanIndex:i])
      {
        uint64_t v15 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:i];
        [v12 addObject:v15];
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    id v19 = 0;
    char v16 = _doUidSearch(self, v8, v9, &v19, a5, 1);
    id v17 = v19;
    uint64_t v12 = v17;
    if ((v16 & 1) == 0)
    {

      uint64_t v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)countForSearchOfIDSet:(id)a3 forTerms:(id)a4 success:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(MFIMAPConnection *)self supportsCapability:15])
  {
    uint64_t v10 = [(MFIMAPConnection *)self eSearchIDSet:v8 areMessageSequenceNumbers:1 forTerms:v9 success:a5 returning:8];
    BOOL v11 = [v10 objectForKey:@"IMAPESearchCountKey"];
    uint64_t v12 = v11;
    if (v11)
    {
      unint64_t v13 = [v11 unsignedIntValue];
    }
    else
    {
      if (a5) {
        *a5 = 0;
      }
      unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v10 = [(MFIMAPConnection *)self searchIDSet:v8 forTerms:v9 success:a5];
    unint64_t v13 = [v10 count];
  }

  return v13;
}

- (unint64_t)countForSearchOfUidSet:(id)a3 forTerms:(id)a4 success:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(MFIMAPConnection *)self supportsCapability:15])
  {
    uint64_t v10 = [(MFIMAPConnection *)self eSearchIDSet:v8 areMessageSequenceNumbers:0 forTerms:v9 success:a5 returning:8];
    BOOL v11 = [v10 objectForKey:@"IMAPESearchCountKey"];
    uint64_t v12 = v11;
    if (v11)
    {
      unint64_t v13 = [v11 unsignedIntValue];
    }
    else
    {
      if (a5) {
        *a5 = 0;
      }
      unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v10 = [(MFIMAPConnection *)self searchUidSet:v8 forTerms:v9 success:a5];
    unint64_t v13 = [v10 count];
  }

  return v13;
}

- (void)_updateSearchCapabilityWithAccount:(id)a3
{
  id v4 = a3;
  [(MFIMAPConnection *)self mf_lock];
  BOOL verifiedESearchResponse = self->_verifiedESearchResponse;
  [(MFIMAPConnection *)self mf_unlock];
  if (!verifiedESearchResponse && [(MFIMAPConnection *)self supportsCapability:15])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __55__MFIMAPConnection__updateSearchCapabilityWithAccount___block_invoke;
    v10[3] = &unk_1E5D3BC20;
    v10[4] = self;
    char v6 = [v4 verifyESearchSupportWithBlock:v10];
    [(MFIMAPConnection *)self mf_lock];
    if ((v6 & 1) == 0)
    {
      id v7 = +[MFIMAPConnection log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[MFIMAPConnection _updateSearchCapabilityWithAccount:](v7);
      }

      int v8 = *((unsigned __int16 *)self + 64);
      unsigned int v9 = v8 & 0xFFFF7FFF | (*((unsigned __int8 *)self + 130) << 16);
      *((_WORD *)self + 64) = v8 & 0x7FFF;
      *((unsigned char *)self + 130) = BYTE2(v9);
    }
    self->_BOOL verifiedESearchResponse = 1;
    [(MFIMAPConnection *)self mf_unlock];
  }
}

BOOL __55__MFIMAPConnection__updateSearchCapabilityWithAccount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) countForSearchOfIDSet:@"1:*" forTerms:&unk_1EFF4FFE0 success:0];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v4 = v2;
  uint64_t v5 = [*(id *)(a1 + 32) eSearchIDSet:@"1:*" areMessageSequenceNumbers:1 forTerms:&unk_1EFF4FFE0 success:0 returning:4];
  char v6 = [v5 objectForKeyedSubscript:@"IMAPESearchAllKey"];
  id v7 = v6;
  if (v6) {
    BOOL v3 = v4 == [v6 count];
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (unsigned)getMailboxIDForUID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc(MEMORY[0x1E4F1C978]);
  char v6 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v3);
  id v7 = objc_msgSend(v5, "initWithObjects:", @"UID", v6, 0);

  int v8 = [[_MFIMAPCommandParameters alloc] initWithCommand:31 arguments:v7];
  v23[0] = v8;
  unsigned int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  id v10 = [(MFIMAPConnection *)self _responseFromSendingCommands:v9];

  BOOL v11 = [(_MFIMAPCommandParameters *)v8 untaggedResponses];
  BOOL v12 = [v11 count] == 1;

  if (v12)
  {
    unint64_t v13 = [(_MFIMAPCommandParameters *)v8 untaggedResponses];
    id v14 = [v13 objectAtIndex:0];

    uint64_t v15 = [v14 searchResults];
    if ([v15 count] == 1)
    {
      char v16 = [v15 objectAtIndex:0];
      unsigned int v17 = [v16 unsignedIntValue];

      if (v17) {
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  uint64_t v18 = MFLogGeneral();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_DEFAULT, "#Warning Invalid response from SEARCH command", buf, 2u);
  }

  unsigned int v17 = 0;
LABEL_9:
  id v22 = v8;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  [(MFIMAPConnection *)self didFinishCommands:v19];

  return v17;
}

- (BOOL)storeFlags:(id)a3 state:(BOOL)a4 forMessageSet:(id)a5
{
  BOOL v6 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = @"-FLAGS.SILENT";
  if (v6) {
    id v10 = @"+FLAGS.SILENT";
  }
  id v26 = v9;
  long long v27 = v10;
  id v23 = v27;
  BOOL v11 = [(MFIMAPConnection *)self parenthesizedStringWithObjects:v8];
  uint64_t v28 = v11;
  BOOL v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:3];

  unint64_t v13 = [[_MFIMAPCommandParameters alloc] initWithCommand:22 arguments:v12];
  id v25 = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  uint64_t v15 = [(MFIMAPConnection *)self _responseFromSendingCommands:v14];
  uint64_t v16 = [v15 responseType];

  if (v16 == 2)
  {
    unsigned int v17 = objc_alloc_init(MFIMAPResponse);
    uint64_t v18 = [[MFIMAPFetchResult alloc] initWithType:10];
    [(MFIMAPFetchResult *)v18 setFlagsArray:v8];
    [(MFIMAPResponse *)v17 setResponseType:24];
    [(MFIMAPResponse *)v17 setUidFlagsChange:v6];
    [(MFIMAPResponse *)v17 setUids:v9];
    [(MFIMAPResponse *)v17 setFlagsFetchResult:v18];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v20 = WeakRetained;
    if (WeakRetained && (*(unsigned char *)&self->_delegateState & 1) != 0) {
      [WeakRetained connection:self shouldHandleUntaggedResponse:v17 forCommand:v13];
    }
  }
  id v24 = v13;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  [(MFIMAPConnection *)self didFinishCommands:v21];

  return v16 == 2;
}

- (BOOL)storeFlags:(id)a3 state:(BOOL)a4 forUIDs:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([v8 count])
  {
    id v10 = [(MFIMAPConnection *)self messageSetForNumbers:v9];
    BOOL v11 = [(MFIMAPConnection *)self storeFlags:v8 state:v6 forMessageSet:v10];
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)deleteMessagesOlderThanNumberOfDays:(int)a3
{
  v26[3] = *MEMORY[0x1E4F143B8];
  if (a3 <= 0)
  {
    unint64_t v13 = [(MFIMAPConnection *)self messageSetForRange:0xFFFFFFFF00000001];
    v26[0] = v13;
    v26[1] = @"+FLAGS.SILENT";
    v26[2] = @"(\\Deleted)";
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];

    id v7 = [[_MFIMAPCommandParameters alloc] initWithCommand:22 arguments:v5];
    id v25 = v7;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
    id v15 = [(MFIMAPConnection *)self _responseFromSendingCommands:v14];

    id v24 = v7;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    [(MFIMAPConnection *)self didFinishCommands:v9];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    BOOL v6 = [MEMORY[0x1E4F1C9C8] date];
    id v7 = [v5 dateByAddingUnit:16 value:1 - a3 toDate:v6 options:0];

    v23[0] = @"BEFORE";
    id v8 = MFIMAPDateSearchStringForDate(v7);
    v23[1] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];

    id v10 = [(MFIMAPConnection *)self searchUidSet:0 forTerms:v9 success:0];
    unint64_t v11 = [v10 count];
    if (v11)
    {
      BOOL v12 = MFCreateArrayForMessageFlags(2, 1);
      if (v11 > 0x64)
      {
        id v22 = v5;
        Mutable = CFArrayCreateMutable(0, 100, 0);
        CFIndex v17 = 0;
        unsigned int v18 = 100;
        do
        {
          CFArrayRemoveAllValues(Mutable);
          if (v11 - v17 >= 0x64) {
            v19.length = 100;
          }
          else {
            v19.length = v11 - v17;
          }
          v19.id location = v17;
          CFArrayAppendArray(Mutable, (CFArrayRef)v10, v19);
          [(MFIMAPConnection *)self storeFlags:v12 state:1 forUIDs:Mutable];
          CFIndex v17 = v18;
          BOOL v20 = v11 > v18;
          v18 += 100;
        }
        while (v20);
        id v5 = v22;
        CFRelease(Mutable);
      }
      else
      {
        [(MFIMAPConnection *)self storeFlags:v12 state:1 forUIDs:v10];
      }
    }
  }

  return 1;
}

- (id)_responseFromSendingCommand:(id)a3 andPossiblyCreateMailbox:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v23[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  id v9 = [(MFIMAPConnection *)self _responseFromSendingCommands:v8];

  if ([v9 responseType] == 4)
  {
    BOOL v10 = [v9 responseCode] == 8;
    if (v9)
    {
LABEL_12:
      if (!v10) {
        goto LABEL_18;
      }
      goto LABEL_16;
    }
  }
  else
  {
    BOOL v10 = 0;
    if (v9) {
      goto LABEL_12;
    }
  }
  if (v10) {
    goto LABEL_12;
  }
  unint64_t v11 = [v6 untaggedResponses];
  unint64_t v12 = [v11 count];

  if (!v12)
  {
    id v9 = 0;
    goto LABEL_18;
  }
  uint64_t v13 = 0;
  while (1)
  {
    id v14 = [v6 untaggedResponses];
    id v15 = [v14 objectAtIndex:v13];

    if ([v15 responseType] == 4 && objc_msgSend(v15, "responseCode") == 8) {
      break;
    }

    if (++v13 >= v12) {
      goto LABEL_18;
    }
  }
  uint64_t v16 = [v6 untaggedResponses];
  [v16 removeObjectAtIndex:v13];

LABEL_16:
  id v22 = v6;
  CFIndex v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  [(MFIMAPConnection *)self didFinishCommands:v17];

  if ([(MFIMAPConnection *)self createMailbox:v7])
  {
    id v21 = v6;
    unsigned int v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    uint64_t v19 = [(MFIMAPConnection *)self _responseFromSendingCommands:v18];

    id v9 = (void *)v19;
  }
LABEL_18:

  return v9;
}

- (BOOL)copyUIDs:(id)a3 toMailboxNamed:(id)a4 copyInfo:(id *)a5 error:(id *)a6
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (!v11)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"IMAPConnection.m", 2669, @"Invalid parameter not satisfying: %@", @"uids" object file lineNumber description];
  }
  uint64_t v13 = [(MFIMAPConnection *)self messageSetForUIDs:v11];
  if ([v13 length])
  {
    v24[0] = v13;
    id v14 = MFIMAPStringFromMailboxName(v12);
    v24[1] = v14;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];

    uint64_t v16 = [[_MFIMAPCommandParameters alloc] initWithCommand:23 arguments:v15];
    CFIndex v17 = [(MFIMAPConnection *)self _responseFromSendingCommand:v16 andPossiblyCreateMailbox:v12];
    id v23 = v16;
    unsigned int v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    [(MFIMAPConnection *)self didFinishCommands:v18];

    if (a5)
    {
      uint64_t v19 = MFUIDPlusInfoFromResponse(v17);
      *a5 = [(MFIMAPConnection *)self copyInfoForMessageInfo:v19];
    }
    BOOL v20 = [v17 responseType] == 2;
  }
  else if (a6)
  {
    +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:0];
    BOOL v20 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)moveUIDs:(id)a3 toMailboxNamed:(id)a4 copyInfo:(id *)a5 error:(id *)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v11 = a4;
  if (!v11)
  {
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"IMAPConnection.m", 2693, @"Invalid parameter not satisfying: %@", @"mailboxName" object file lineNumber description];
  }
  if ([(MFIMAPConnection *)self supportsCapability:20])
  {
    id v31 = [(MFIMAPConnection *)self messageSetForUIDs:v32];
    if ([v31 length])
    {
      v39[0] = v31;
      id v12 = MFIMAPStringFromMailboxName(v11);
      v39[1] = v12;
      BOOL v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];

      uint64_t v13 = [[_MFIMAPCommandParameters alloc] initWithCommand:37 arguments:v30];
      uint64_t v29 = [(MFIMAPConnection *)self _responseFromSendingCommand:v13 andPossiblyCreateMailbox:v11];
      uint64_t v14 = [v29 responseType];
      BOOL v15 = v14 == 2;
      if (a5)
      {
        if (v14 == 2)
        {
          uint64_t v16 = MFUIDPlusInfoFromResponse(v29);
          id v17 = [(MFIMAPConnection *)self copyInfoForMessageInfo:v16];

          if (!v17)
          {
            long long v35 = 0u;
            long long v36 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            unsigned int v18 = [(_MFIMAPCommandParameters *)v13 untaggedResponses];
            id v17 = (id)[v18 countByEnumeratingWithState:&v33 objects:v38 count:16];
            if (v17)
            {
              uint64_t v19 = *(void *)v34;
              while (2)
              {
                for (uint64_t i = 0; i != v17; uint64_t i = (char *)i + 1)
                {
                  if (*(void *)v34 != v19) {
                    objc_enumerationMutation(v18);
                  }
                  id v21 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                  if ([v21 responseType] == 2 && objc_msgSend(v21, "responseCode") == 16)
                  {
                    id v24 = MFUIDPlusInfoFromResponse(v21);
                    id v17 = [(MFIMAPConnection *)self copyInfoForMessageInfo:v24];

                    goto LABEL_28;
                  }
                }
                id v17 = (id)[v18 countByEnumeratingWithState:&v33 objects:v38 count:16];
                if (v17) {
                  continue;
                }
                break;
              }
            }
LABEL_28:
          }
        }
        else
        {
          id v17 = 0;
        }
        id v25 = v17;
        *a5 = v25;
      }
      v37 = v13;
      id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
      [(MFIMAPConnection *)self didFinishCommands:v26];
    }
    else if (a6)
    {
      +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:0];
      BOOL v15 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else if (a6)
  {
    id v22 = +[MFIMAPConnection log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = [(MFIMAPConnection *)self ef_publicDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v23;
      _os_log_impl(&dword_1A7EFF000, v22, OS_LOG_TYPE_DEFAULT, "<%{public}@> Server does not support move.", buf, 0xCu);
    }
    +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1034 localizedDescription:0];
    BOOL v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)copyInfoForMessageInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F60860]);
    id v6 = [v4 objectForKeyedSubscript:@"UIDVALIDITY"];
    objc_msgSend(v5, "setUidValidity:", objc_msgSend(v6, "unsignedIntValue"));

    id v7 = [v4 objectForKeyedSubscript:@"Source UIDS"];
    id v8 = [v4 objectForKeyedSubscript:@"Destination UIDS"];
    id v9 = [(MFIMAPConnection *)self _dictionaryFromSourceUIDs:v7 destinationUIDs:v8];
    [v5 setSourceUIDsToDestinationUIDs:v9];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_dictionaryFromSourceUIDs:(id)a3 destinationUIDs:(id)a4
{
  id v5 = (__CFString *)a3;
  id v6 = (__CFString *)a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = -[__CFString length](v5, "length", 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL);
  long long v27 = v5;
  uint64_t v30 = 0;
  uint64_t v31 = v8;
  if (CFStringGetCharactersPtr(v5)) {
    CStringPtr = 0;
  }
  else {
    CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
  }
  uint64_t v29 = CStringPtr;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = v8;
  uint64_t v36 = 0;
  uint64_t v10 = [(__CFString *)v6 length];
  unsigned int v18 = v6;
  uint64_t v21 = 0;
  uint64_t v22 = v10;
  if (CFStringGetCharactersPtr(v6)) {
    id v11 = 0;
  }
  else {
    id v11 = CFStringGetCStringPtr(v6, 0x600u);
  }
  BOOL v20 = v11;
  uint64_t v23 = 0;
  long long v24 = 0uLL;
  long long v25 = (unint64_t)v10;
  uint64_t v12 = IMAPNextUidFromSet(buffer);
  for (int i = IMAPNextUidFromSet((UniChar *)&v17); v12 && i; int i = IMAPNextUidFromSet((UniChar *)&v17))
  {
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:");
    BOOL v15 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v12];
    [v7 setObject:v14 forKeyedSubscript:v15];

    uint64_t v12 = IMAPNextUidFromSet(buffer);
  }
  if (v12 | i && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[MFIMAPConnection _dictionaryFromSourceUIDs:destinationUIDs:]();
  }

  return v7;
}

- (id)_indexSetForIMAPInlineSet:(id)a3
{
  uint64_t v3 = (__CFString *)a3;
  id v4 = objc_opt_new();
  uint64_t v5 = [(__CFString *)v3 length];
  uint64_t v10 = v3;
  uint64_t v13 = 0;
  uint64_t v14 = v5;
  if (CFStringGetCharactersPtr(v3)) {
    CStringPtr = 0;
  }
  else {
    CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
  }
  uint64_t v12 = CStringPtr;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = v5;
  uint64_t v19 = 0;
  while (1)
  {
    unsigned int v7 = IMAPNextUidFromSet((UniChar *)&v9);
    if (!v7) {
      break;
    }
    [v4 addIndex:v7];
  }

  return v4;
}

- (BOOL)appendData:(id)a3 toMailboxNamed:(id)a4 flags:(id)a5 dateReceived:(id)a6 appendInfo:(id *)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  unsigned int v17 = [(MFIMAPConnection *)self permanentFlags];
  uint64_t v18 = MFMessageFlagsForECMessageFlags(v15);
  uint64_t v19 = IMAPCreateArrayForMessageFlags(v18, [(MFIMAPConnection *)self permanentFlags], v17 >> 31);
  id v27 = 0;
  BOOL v20 = [(MFIMAPConnection *)self appendData:v13 toMailboxNamed:v14 flags:v19 dateReceived:v16 newMessageInfo:&v27];
  id v21 = v27;
  if (a7)
  {
    id v22 = objc_alloc_init(MEMORY[0x1E4F60858]);
    uint64_t v23 = [v21 objectForKeyedSubscript:@"UIDVALIDITY"];
    objc_msgSend(v22, "setUidValidity:", objc_msgSend(v23, "unsignedIntValue"));

    long long v24 = [v21 objectForKeyedSubscript:@"Source UIDS"];
    objc_msgSend(v22, "setNewMessageUID:", objc_msgSend(v24, "unsignedIntegerValue"));

    id v25 = v22;
    *a7 = v25;
  }
  return v20;
}

- (BOOL)storeFlagChange:(id)a3 forUIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(MFIMAPConnection *)self permanentFlags];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  MFGetFlagsAndMaskForFlagChange(v6, &v15, &v14);
  long long v9 = IMAPCreateArrayForMessageFlags(v14 & v15, v8, v8 >> 31);
  uint64_t v10 = IMAPCreateArrayForMessageFlags(v14 & ~v15, v8, v8 >> 31);
  id v11 = [(MFIMAPConnection *)self messageSetForUIDs:v7];
  if ([v9 count]
    && v11
    && ![(MFIMAPConnection *)self storeFlags:v9 state:1 forMessageSet:v11])
  {
    BOOL v12 = 0;
  }
  else if ([v10 count])
  {
    BOOL v12 = [(MFIMAPConnection *)self storeFlags:v10 state:0 forMessageSet:v11];
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (BOOL)storeGmailLabels:(id)a3 state:(BOOL)a4 forUIDs:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(MFIMAPConnection *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MFIMAPConnection storeGmailLabels:state:forUIDs:]", "IMAPConnection.m", 2826, "0");
}

- (BOOL)appendData:(id)a3 toMailboxNamed:(id)a4 flags:(id)a5 dateReceived:(id)a6 newMessageInfo:(id *)a7
{
  id v30 = a3;
  id v12 = a4;
  id v13 = a5;
  id v29 = a6;
  uint64_t v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  uint64_t v15 = [[_MFIMAPCommandParameters alloc] initWithCommand:19 arguments:v14];
  if (a7) {
    *a7 = 0;
  }
  id v16 = MFIMAPStringFromMailboxName(v12);
  [v14 addObject:v16];

  if (v13)
  {
    unsigned int v17 = [(MFIMAPConnection *)self parenthesizedStringWithObjects:v13];
    [v14 addObject:v17];
  }
  id v18 = v29;
  if (_MFIMAPDateStringForDate_onceToken != -1) {
    dispatch_once(&_MFIMAPDateStringForDate_onceToken, &__block_literal_global_907);
  }
  uint64_t v19 = [(id)_MFIMAPDateStringForDate_formatter stringFromDate:v18];

  if (v19) {
    [v14 addObject:v19];
  }
  [v14 addObject:v30];
  BOOL v20 = [(MFIMAPConnection *)self _responseFromSendingCommand:v15 andPossiblyCreateMailbox:v12];
  id v21 = v20;
  if (a7 && [v20 responseType] == 2 && objc_msgSend(v21, "responseCode") == 15)
  {
    uint64_t v28 = [v21 responseInfo];
    id v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    uint64_t v23 = [v28 objectAtIndexedSubscript:0];
    [v22 setObject:v23 forKeyedSubscript:@"UIDVALIDITY"];

    long long v24 = [v28 objectAtIndexedSubscript:1];
    [v22 setObject:v24 forKeyedSubscript:@"Source UIDS"];

    id v25 = v22;
    *a7 = v25;
  }
  BOOL v26 = [v21 responseType] == 2;

  return v26;
}

- (id)fetchMessageIdsForUids:(id)a3
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v26, "count"));
  id v4 = [v26 allObjects];
  uint64_t v23 = self;
  uint64_t v5 = [(MFIMAPConnection *)self messageSetForNumbers:v4];

  id v22 = (void *)v5;
  v37[0] = v5;
  v37[1] = @"(BODY.PEEK[HEADER.FIELDS (MESSAGE-ID)])";
  long long v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  id v25 = [[_MFIMAPCommandParameters alloc] initWithCommand:21 arguments:v24];
  uint64_t v36 = v25;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  id v7 = [(MFIMAPConnection *)v23 _responseFromSendingCommands:v6];
  LODWORD(v5) = [v7 responseType] == 2;

  if (v5)
  {
    [(_MFIMAPCommandParameters *)v25 untaggedResponses];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v31;
      uint64_t v27 = *MEMORY[0x1E4F606F0];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if ([v11 responseType] == 17)
          {
            id v12 = [v11 fetchResultWithType:4];
            id v13 = [v11 fetchResultWithType:8];
            uint64_t v14 = [v12 fetchData];
            if (v14)
            {
              uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F73540]) initWithData:v14];
              objc_msgSend(v15, "mf_convertNetworkLineEndingsToUnix");
              id v16 = v15;

              unsigned int v17 = (void *)[objc_alloc(MEMORY[0x1E4F73550]) initWithHeaderData:v16 encoding:0xFFFFFFFFLL];
              id v18 = (void *)[v17 copyFirstStringValueForKey:v27];
              uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", objc_msgSend(v13, "uid"));
              [v28 setObject:v18 forKeyedSubscript:v19];
            }
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v8);
    }
  }
  uint64_t v34 = v25;
  BOOL v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  [(MFIMAPConnection *)v23 didFinishCommands:v20];

  return v28;
}

- (BOOL)performCustomCommand:(id)a3 withArguments:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    id v7 = (void *)[v6 mutableCopy];
    [v7 insertObject:v19 atIndex:0];
  }
  else
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v19, 0);
  }
  uint64_t v8 = [[_MFIMAPCommandParameters alloc] initWithCommand:38 arguments:v7];
  v21[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  uint64_t v10 = [(MFIMAPConnection *)self _responseFromSendingCommands:v9];

  uint64_t v11 = [v10 responseType];
  if (v11 != 2)
  {
    id v12 = +[MFActivityMonitor currentMonitor];
    id v13 = [v12 error];
    BOOL v14 = v13 == 0;

    if (v14)
    {
      uint64_t v15 = _messageFromResponse(v10);
      id v16 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1033 localizedDescription:v15];
      [v12 setError:v16];
    }
  }
  BOOL v20 = v8;
  unsigned int v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  [(MFIMAPConnection *)self didFinishCommands:v17];

  return v11 == 2;
}

- (void)setReadBufferSizeFromElapsedTime:(double)a3 bytesRead:(unint64_t)a4
{
  if (a3 > 0.0 && a4 >= 0x401)
  {
    double v5 = a3 - *(double *)&sIMAPFetchTargetTime;
    if (a3 - *(double *)&sIMAPFetchTargetTime < 0.0) {
      double v5 = -(a3 - *(double *)&sIMAPFetchTargetTime);
    }
    if (v5 > *(double *)&sIMAPFetchTargetTime * 0.5)
    {
      unsigned int v7 = [(MFIMAPConnection *)self readBufferSize];
      double v8 = *(double *)&sIMAPFetchTargetTime;
      if (*(double *)&sIMAPFetchTargetTime <= a3)
      {
        if (v7 >> 1 <= sIMAPMinFetchChunkSize) {
          uint64_t v9 = sIMAPMinFetchChunkSize;
        }
        else {
          uint64_t v9 = v7 >> 1;
        }
      }
      else if (2 * v7 >= sIMAPMaxFetchChunkSize)
      {
        uint64_t v9 = sIMAPMaxFetchChunkSize;
      }
      else
      {
        uint64_t v9 = 2 * v7;
      }
      -[MFIMAPConnection setReadBufferSize:](self, "setReadBufferSize:", v9, v8);
    }
  }
}

- (unsigned)readBufferSize
{
  unsigned int readBufferSize = self->_readBufferSize;
  if (!readBufferSize)
  {
    unsigned int readBufferSize = 0x2000;
    self->_unsigned int readBufferSize = 0x2000;
  }
  return readBufferSize;
}

- (void)setReadBufferSize:(unsigned int)a3
{
  self->_unsigned int readBufferSize = a3;
}

+ (void)setReadSizeParameters
{
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v2 = [v5 integerForKey:@"MinFetchChunkSize"];
  if (v2) {
    sIMAPMinFetchChunkSize = v2;
  }
  int v3 = [v5 integerForKey:@"MaxFetchChunkSize"];
  if (v3) {
    sIMAPMaxFetchChunkSize = v3;
  }
  [v5 floatForKey:@"FetchDeltaTarget"];
  if (v4 != 0.0) {
    *(double *)&sIMAPFetchTargetTime = v4;
  }
}

- (id)messageSetForRange:(id)a3
{
  if (a3.var1 == 0xFFFFFFFFLL) {
    uint64_t v4 = 0x7FFFFFFFFFFFFFFELL - a3.var0;
  }
  else {
    uint64_t v4 = a3.var1 - a3.var0 + 1;
  }
  id v5 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", a3.var0, v4);
  id v6 = [(MFIMAPConnection *)self messageSetForUIDs:v5];

  return v6;
}

- (id)messageSetForNumbers:(id)a3
{
  uint64_t v4 = uidSetForUIDArray(a3);
  id v5 = [(MFIMAPConnection *)self messageSetForUIDs:v4];

  return v5;
}

- (id)messageSetForUIDs:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(MFIMAPConnection *)self messageSetForUIDs:v4 maxTokens:-1 remainder:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)messageSetForUIDs:(id)a3 maxTokens:(unint64_t)a4 remainder:(id *)a5
{
  id v7 = a3;
  double v8 = [MEMORY[0x1E4F28E78] stringWithCapacity:200];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__2;
  uint64_t v23 = __Block_byref_object_dispose__2;
  id v24 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__MFIMAPConnection_messageSetForUIDs_maxTokens_remainder___block_invoke;
  v13[3] = &unk_1E5D3BC48;
  uint64_t v15 = v29;
  id v16 = &v19;
  unsigned int v17 = &v25;
  unint64_t v18 = a4;
  id v9 = v8;
  id v14 = v9;
  [v7 enumerateRangesUsingBlock:v13];
  if (a5) {
    *a5 = (id) v20[5];
  }
  if (*((unsigned char *)v26 + 24)) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v9;
  }
  id v11 = v10;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v29, 8);

  return v11;
}

void __58__MFIMAPConnection_messageSetForUIDs_maxTokens_remainder___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void *)(v6 + 24);
  if ((unint64_t)(v7 + 4) <= *(void *)(a1 + 64))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(unsigned char *)(v9 + 24))
    {
      *(unsigned char *)(v9 + 24) = 0;
      if (!a3) {
        return;
      }
    }
    else
    {
      *(void *)(v6 + 24) = v7 + 1;
      [*(id *)(a1 + 32) appendString:@","];
      if (!a3) {
        return;
      }
    }
    if (a3 == 1)
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"%llu", a2, v13);
    }
    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += 3;
      if (HIDWORD(a3)) {
        objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"%llu:*", a2, v13);
      }
      else {
        objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"%llu:%llu", a2, a3 + a2 - 1);
      }
    }
  }
  else
  {
    double v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v8)
    {
      objc_msgSend(v8, "addIndexesInRange:", a2, a3);
    }
    else
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", a2, a3);
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
  }
}

- (id)parenthesizedStringWithObjects:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 count];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"(");
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      double v8 = [v4 objectAtIndex:i];
      if (i) {
        [v6 appendString:@" "];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v6 appendString:v8];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(MFIMAPConnection *)self parenthesizedStringWithObjects:v8];
        }
        else {
        uint64_t v9 = [v8 description];
        }
        [v6 appendString:v9];
      }
    }
  }
  [v6 appendString:@""]);

  return v6;
}

- (BOOL)authenticateUsingAccount:(id)a3 authenticator:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA48];
  double v8 = [v6 authenticationScheme];
  uint64_t v9 = [v8 name];
  uint64_t v10 = [v7 arrayWithObject:v9];

  if ([(MFIMAPConnection *)self supportsCapability:17]
    && [v6 supportsInitialClientResponse])
  {
    uint64_t v11 = [v6 responseForServerData:0];
    id v12 = objc_msgSend(v11, "mf_encodeBase64WithoutLineBreaks");

    if (v12)
    {
      uint64_t v13 = (void *)[[NSString alloc] initWithData:v12 encoding:1];
      [v10 addObject:v13];
    }
    else
    {
      id v14 = MFLogGeneral();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v6;
        _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_DEFAULT, "#Warning %@ claimed to support initial response data, and didn't supply an initial response", buf, 0xCu);
      }
    }
  }
  uint64_t v15 = [[_MFIMAPCommandParameters alloc] initWithCommand:4 arguments:v10];
  [(MFIMAPConnection *)self mf_lock];
  uint64_t v38 = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  id v36 = 0;
  unint64_t v17 = [(MFIMAPConnection *)self _sendCommands:v16 response:&v36];
  id v18 = v36;

  if (!v17)
  {
LABEL_24:
    id v19 = v18;
    goto LABEL_46;
  }
  [v6 setAuthenticationState:1];
  while (1)
  {
    if ([v6 authenticationState] == 3) {
      goto LABEL_24;
    }
    id v19 = [(MFIMAPConnection *)self _copyNextTaggedOrContinuationResponseForCommand:v15];

    if (!v19)
    {
      [v6 setAuthenticationState:3];
      goto LABEL_46;
    }
    uint64_t v20 = [v19 responseType];
    if (v20 != 1) {
      break;
    }
    uint64_t v21 = [v19 userData];
    id v22 = [v6 responseForServerData:v21];

    if (v22)
    {
      if ([v6 usesBase64EncodeResponseData])
      {
        uint64_t v23 = objc_msgSend(v22, "mf_encodeBase64WithoutLineBreaks");

        id v22 = (void *)v23;
      }
      [(NSMutableData *)self->_data setData:v22];
    }
    else
    {
      [(NSMutableData *)self->_data setLength:0];
    }
    [(NSMutableData *)self->_data appendBytes:&kIMAPLineEnding length:2];
    int v24 = [v6 justSentPlainTextPassword];
    data = self->_data;
    if (v24) {
      BOOL v26 = -[MFConnection writeData:dontLogBytesInRange:](self, "writeData:dontLogBytesInRange:", data, 0, [(NSMutableData *)data length] - 2);
    }
    else {
      BOOL v26 = [(MFConnection *)self writeData:data];
    }
    if (!v26)
    {
      if ([v6 authenticationState] == 1) {
        [v6 setAuthenticationState:3];
      }
      goto LABEL_45;
    }

    id v18 = v19;
  }
  if (v20 == 2)
  {
    [v6 setAuthenticationState:4];
    *((unsigned char *)self + 152) = *((unsigned char *)self + 152) & 0xF8 | 2;
    if (!self->super._securityLayer)
    {
      char v28 = [v6 securityLayer];
      securityLayer = self->super._securityLayer;
      self->super._securityLayer = v28;
    }
    [(MFIMAPConnection *)self _updateCapabilitiesForAccount:v35 withAuthenticationResponse:v19];
    goto LABEL_46;
  }
  if (v20 == 3)
  {
    long long v30 = MFLogGeneral();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      [v19 userString];
      objc_claimAutoreleasedReturnValue();
      -[MFIMAPConnection authenticateUsingAccount:authenticator:]();
    }
    goto LABEL_40;
  }
  if (v20 != 4)
  {
    long long v30 = +[MFIMAPConnection log];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v19;
      _os_log_error_impl(&dword_1A7EFF000, v30, OS_LOG_TYPE_ERROR, "*** Unexpected response during authentication: %@", buf, 0xCu);
    }
LABEL_40:

    [v6 setAuthenticationState:3];
    goto LABEL_46;
  }
  uint64_t v27 = MFLogGeneral();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    [v19 userString];
    objc_claimAutoreleasedReturnValue();
    -[MFIMAPConnection authenticateUsingAccount:authenticator:]();
  }

  [v6 setAuthenticationState:2];
  if ([v19 responseCode] == 18)
  {
    [v6 setInvalidCredentialsError];
    goto LABEL_46;
  }
  id v22 = [(MFIMAPConnection *)self _serverErrorForAccount:v35 response:v19 command:v15];
  if (v22)
  {
    long long v31 = +[MFActivityMonitor currentMonitor];
    [v31 setError:v22];
  }
LABEL_45:

LABEL_46:
  [(MFIMAPConnection *)self mf_unlock];
  v37 = v15;
  long long v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  [(MFIMAPConnection *)self didFinishCommands:v32];

  if ([v6 authenticationState] == 3) {
    [(MFIMAPConnection *)self disconnectAndNotifyDelegate:0];
  }
  BOOL v33 = [v6 authenticationState] == 4;

  return v33;
}

- (BOOL)startTLSForAccount:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MFIMAPConnection *)self mf_lock];
  if ([(MFIMAPConnection *)self supportsCapability:0])
  {
    uint64_t v5 = [[_MFIMAPCommandParameters alloc] initWithCommand:3];
    v26[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    uint64_t v7 = [(MFIMAPConnection *)self _responseFromSendingCommands:v6];
    BOOL v8 = [v7 responseType] == 2;

    if (!v8)
    {
      uint64_t v9 = NSString;
      uint64_t v10 = MFLookupLocalizedString(@"TLS_FAILED_FORMAT", @"Starting TLS failed on %@ server “%@”. Please check your account settings and try again.", @"Delayed");
      uint64_t v11 = [(id)objc_opt_class() accountTypeString];
      id v12 = [v4 hostname];
      uint64_t v13 = objc_msgSend(v9, "stringWithFormat:", v10, v11, v12);

      id v14 = +[MFActivityMonitor currentMonitor];
      uint64_t v15 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1033 localizedDescription:v13];
      [v14 setError:v15];
    }
    uint64_t v25 = v5;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
    [(MFIMAPConnection *)self didFinishCommands:v16];
  }
  else
  {
    unint64_t v17 = NSString;
    id v18 = MFLookupLocalizedString(@"TLS_NOT_SUPPORTED_FORMAT", @"The %@ server “%@” doesn’t support TLS (SSL) on port %u. Please check your account settings and try again.", @"Delayed");
    id v19 = [(id)objc_opt_class() accountTypeString];
    uint64_t v20 = [v4 hostname];
    uint64_t v21 = objc_msgSend(v17, "stringWithFormat:", v18, v19, v20, objc_msgSend(v4, "portNumber"));

    id v22 = +[MFActivityMonitor currentMonitor];
    uint64_t v23 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1034 localizedDescription:v21];
    [v22 setError:v23];

    BOOL v8 = 0;
  }
  [(MFIMAPConnection *)self mf_unlock];

  return v8;
}

- (NSString)debugDescription
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v3 = +[MFIMAPConnection log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v22 = NSString;
    uint64_t v21 = objc_opt_class();
    uint64_t v14 = [(MFIMAPConnection *)self _connectionStateDescription];
    unsigned __int8 v15 = atomic_load((unsigned __int8 *)&self->super._isFetching);
    if (v15) {
      id v16 = ", Fetching";
    }
    else {
      id v16 = "";
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v20 = v16;
    id v18 = (void *)v14;
    id v19 = [v22 stringWithFormat:@"<%@:%p> [%@%s] delegate=%p mailbox=<%@>", v21, self, v14, v20, WeakRetained, self->_selectedMailbox];
    *(_DWORD *)buf = 138412290;
    int v24 = v19;
    _os_log_debug_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_DEBUG, "debugDescription for _connectionState: %@", buf, 0xCu);
  }
  BOOL v4 = self->_selectedMailbox == 0;
  uint64_t v5 = NSString;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(MFIMAPConnection *)self _connectionStateDescription];
  unsigned __int8 v8 = atomic_load((unsigned __int8 *)&self->super._isFetching);
  if (v8) {
    uint64_t v9 = ", Fetching";
  }
  else {
    uint64_t v9 = "";
  }
  id v10 = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v11 = v10;
  if (v4) {
    [v5 stringWithFormat:@"<%@:%p> [%@%s] delegate=%p", v6, self, v7, v9, v10];
  }
  else {
  id v12 = [v5 stringWithFormat:@"<%@:%p> [%@%s] delegate=%p mailbox=<%@>", v6, self, v7, v9, v10, self->_selectedMailbox];
  }

  return (NSString *)v12;
}

- (id)_connectionStateDescription
{
  int v2 = *((unsigned __int8 *)self + 152);
  uint64_t v3 = (uint64_t)(v2 << 29) >> 29;
  if ((v2 & 4) != 0)
  {
    uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:v3];
    BOOL v4 = [v5 stringValue];
  }
  else
  {
    BOOL v4 = _connectionStateDescription__StateStrings[v3];
  }
  return v4;
}

- (NSString)ef_publicDescription
{
  uint64_t v3 = [MEMORY[0x1E4F60D58] currentDevice];
  int v4 = [v3 isInternal];

  if (v4)
  {
    uint64_t v5 = [(MFIMAPConnection *)self debugDescription];
  }
  else
  {
    uint64_t v6 = NSString;
    uint64_t v7 = [(MFIMAPConnection *)self _connectionLogPrefix];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v5 = [v6 stringWithFormat:@"%@ delegate=%p", v7, WeakRetained];
  }
  return (NSString *)v5;
}

- (id)_connectionLogPrefix
{
  selectedMailbox = self->_selectedMailbox;
  int v4 = NSString;
  uint64_t v5 = [(MFConnection *)self accountLogString];
  [(MFIMAPConnection *)self _connectionStateDescription];
  if (selectedMailbox) {
    uint64_t v6 = {;
  }
    uint64_t v7 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:self->_selectedMailbox];
    unsigned __int8 v8 = [v4 stringWithFormat:@"<%p:%@> [%@ (%@)]", self, v5, v6, v7];
  }
  else {
    uint64_t v6 = {;
  }
    unsigned __int8 v8 = [v4 stringWithFormat:@"<%p:%@> [%@]", self, v5, v6];
  }

  return v8;
}

- (unsigned)literalChunkSize
{
  return 4096;
}

- (id)_readDataOfLength:(int64_t)a3
{
  [(NSMutableData *)self->_data setLength:0];
  if (a3 < 1)
  {
    if (a3 < 0 && [(MFConnection *)self readLineIntoData:self->_data])
    {
      uint64_t v6 = [(NSMutableData *)self->_data bytes];
      if (v6)
      {
        uint64_t v8 = v6;
        NSUInteger v9 = [(NSMutableData *)self->_data length];
        NSUInteger v7 = v9 - 2;
        if (v9 >= 2 && *(unsigned char *)(v9 + v8 - 1) == 10 && *(unsigned char *)(v8 + v7) == 13) {
          -[NSMutableData setLength:](self->_data, "setLength:");
        }
      }
      if ([(NSMutableData *)self->_data length])
      {
        id v10 = (unsigned char *)[(NSMutableData *)self->_data bytes];
        if (v10)
        {
          uint64_t v11 = v10;
          if (!*v10)
          {
            NSUInteger v12 = [(NSMutableData *)self->_data length];
            uint64_t v13 = 0;
            do
            {
              NSUInteger v14 = v13 + 1;
              if (v11[v13 + 1]) {
                BOOL v15 = 1;
              }
              else {
                BOOL v15 = v14 >= v12;
              }
              ++v13;
            }
            while (!v15);
            NSUInteger v16 = v12 - v14;
            memmove([(NSMutableData *)self->_data mutableBytes], &v11[v14], v12 - v14);
            [(NSMutableData *)self->_data setLength:v16];
          }
        }
      }
      goto LABEL_3;
    }
  }
  else if ([(MFConnection *)self readBytesIntoData:self->_data desiredLength:a3])
  {
LABEL_3:
    data = self->_data;
    goto LABEL_22;
  }
  data = 0;
LABEL_22:
  return data;
}

- (id)_fetchArgumentForMessageUidsAndFlags
{
  return @"(UID FLAGS)";
}

- (id)_fetchArgumentForMessageSkeletonsWithAllHeaders
{
  [(MFIMAPConnection *)self mf_lock];
  lastRequiredHeaders = self->_lastRequiredHeaders;
  if (!lastRequiredHeaders)
  {
    int v4 = objc_msgSend(@"(INTERNALDATE UID RFC822.SIZE FLAGS "), "mutableCopyWithZone:", 0;
    if ([(MFIMAPConnection *)self supportsCapability:16]) {
      [v4 appendString:@"MODSEQ "];
    }
    if ([(MFIMAPConnection *)self supportsCapability:19]) {
      [v4 appendString:@"X-GM-MSGID "];
    }
    [v4 appendString:@"BODY.PEEK[HEADER]"]);
    uint64_t v5 = self->_lastRequiredHeaders;
    self->_lastRequiredHeaders = (NSString *)v4;

    lastRequiredHeaders = self->_lastRequiredHeaders;
  }
  uint64_t v6 = lastRequiredHeaders;
  [(MFIMAPConnection *)self mf_unlock];
  return v6;
}

- (BOOL)_isFetchResponseValid:(id)a3
{
  return 1;
}

- (id)_responseFromSendingCommands:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1AD0E3E00]();
  [(MFIMAPConnection *)self mf_lock];
  id v18 = 0;
  unint64_t v6 = [(MFIMAPConnection *)self _sendCommands:v4 response:&v18];
  id v7 = v18;
  uint64_t v8 = v7;
  if (v6)
  {
    unint64_t v9 = v6 - 1;
    id v10 = [v4 objectAtIndexedSubscript:v9];
    uint64_t v11 = [v10 sequenceNumber];

    do
    {
      NSUInteger v12 = [v4 objectAtIndexedSubscript:v9];
      id v13 = [(MFIMAPConnection *)self _copyNextTaggedOrContinuationResponseForCommand:v12];

      if (!v13) {
        break;
      }
      NSUInteger v14 = [v13 tag];
      int v15 = [v14 intValue];

      BOOL v16 = v11 == v15;
      uint64_t v8 = v13;
    }
    while (!v16);
  }
  else
  {
    id v13 = v7;
  }
  [(MFIMAPConnection *)self locked_scheduleIdle];
  [(MFIMAPConnection *)self mf_unlock];

  return v13;
}

- (BOOL)sendResponsesForCommand:(id)a3 toQueue:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(MFIMAPConnection *)self mf_lock];
  v22[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  unint64_t v9 = [(MFIMAPConnection *)self _sendCommands:v8 response:0];

  if (v9)
  {
    id v10 = +[MFActivityMonitor currentMonitor];
    uint64_t v11 = [v6 sequenceNumber];
    char v12 = 1;
    while ((v12 & 1) != 0)
    {
      id v13 = (void *)MEMORY[0x1AD0E3E00]();
      id v14 = [(MFIMAPConnection *)self _copyNextServerResponseForCommand:v6];
      char v15 = [v10 shouldCancel];
      if (v14) {
        char v16 = v15;
      }
      else {
        char v16 = 1;
      }
      if ((v16 & 1) != 0
        || ([v14 isUntagged] & 1) == 0
        && ([v14 tag],
            id v18 = objc_claimAutoreleasedReturnValue(),
            BOOL v19 = v11 == [v18 intValue],
            v18,
            v19))
      {
        char v17 = 0;
      }
      else
      {
        char v12 = [v7 addItem:v14];
        char v17 = 1;
      }

      if ((v17 & 1) == 0)
      {
        BOOL v20 = v12 & 1;
        goto LABEL_16;
      }
    }
    BOOL v20 = 0;
LABEL_16:
  }
  else
  {
    BOOL v20 = 1;
  }
  [(MFIMAPConnection *)self locked_scheduleIdle];
  [(MFIMAPConnection *)self mf_unlock];

  return v20;
}

- (BOOL)sendResponsesForUIDFetchForUIDs:(id)a3 fields:(id)a4 toQueue:(id)a5
{
  void v21[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[MFActivityMonitor currentMonitor];
  char v12 = uidSetForUIDArray(v8);
  char v13 = 1;
  while ([v12 count] && (objc_msgSend(v11, "shouldCancel") & 1) == 0)
  {
    id v20 = 0;
    id v14 = [(MFIMAPConnection *)self messageSetForUIDs:v12 maxTokens:500 remainder:&v20];
    id v15 = v20;

    char v16 = [_MFIMAPCommandParameters alloc];
    v21[0] = v14;
    v21[1] = v9;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    id v18 = [(_MFIMAPCommandParameters *)v16 initWithCommand:21 arguments:v17];

    LOBYTE(v17) = [(MFIMAPConnection *)self sendResponsesForCommand:v18 toQueue:v10];
    v13 &= v17;
    char v12 = v15;
  }

  return v13 & 1;
}

- (BOOL)sendSkeletonResponsesForUIDs:(id)a3 includeTo:(BOOL)a4 toQueue:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(MFIMAPConnection *)self _fetchArgumentForMessageSkeletonsWithAllHeaders];
  LOBYTE(self) = [(MFIMAPConnection *)self sendResponsesForUIDFetchForUIDs:v7 fields:v9 toQueue:v8];

  return (char)self;
}

- (BOOL)sendUidAndFlagResponsesForUIDs:(id)a3 sequenceIdentifierProvider:(id)a4 flagSearchResults:(id)a5 toQueue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v12 || ![(MFIMAPConnection *)self supportsCapability:16])
  {
    char v16 = [(MFIMAPConnection *)self _fetchArgumentForMessageUidsAndFlags];
    LOBYTE(self) = [(MFIMAPConnection *)self sendResponsesForUIDs:v10 fields:v16 flagSearchResults:v12 toQueue:v13];
  }
  else
  {
    id v14 = [v11 sequenceIdentifierForUIDs:v10];
    id v18 = v14;
    LODWORD(self) = [(MFIMAPConnection *)self sendResponsesForCondStoreFlagFetchForUIDs:v10 withSequenceIdentifier:&v18 toQueue:v13];
    id v15 = v18;

    [v13 flush];
    if (self && [v15 length] && (objc_msgSend(v15, "isEqualToString:", v14) & 1) == 0) {
      [v11 setSequenceIdentifier:v15 forUIDs:v10];
    }
  }
  return (char)self;
}

- (BOOL)sendUidResponsesForSearchArguments:(id)a3 toQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v22 = 0;
  if ([(MFIMAPConnection *)self supportsCapability:15])
  {
    id v8 = +[MFActivityMonitor currentMonitor];
    id v9 = [(MFIMAPConnection *)self eSearchIDSet:0 areMessageSequenceNumbers:0 arguments:v6 success:&v22 returning:4];
    uint64_t v10 = [v9 objectForKey:@"IMAPESearchAllKey"];
    id v11 = (void *)v10;
    if (v22 && v10)
    {
      context = (void *)MEMORY[0x1AD0E3E00]();
      id v12 = [MEMORY[0x1E4F1CA48] array];
      for (uint64_t i = [v11 firstIndex]; ; uint64_t i = objc_msgSend(v11, "indexGreaterThanIndex:", i))
      {
        char v14 = [v8 shouldCancel];
        char v15 = i == 0x7FFFFFFFFFFFFFFFLL ? 1 : v14;
        if (v15) {
          break;
        }
        char v16 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:i];
        [v12 addObject:v16];
      }
      if (([v8 shouldCancel] & 1) == 0)
      {
        BOOL v19 = objc_alloc_init(MFIMAPResponse);
        [(MFIMAPResponse *)v19 setResponseType:14];
        [(MFIMAPResponse *)v19 setSearchResults:v12];
        [v7 addItem:v19];
      }
    }

    BOOL v18 = v22 != 0;
  }
  else
  {
    uint64_t v17 = [[_MFIMAPCommandParameters alloc] initWithCommand:24 arguments:v6];
    BOOL v18 = [(MFIMAPConnection *)self sendResponsesForCommand:v17 toQueue:v7];
  }
  return v18;
}

- (id)searchUIDs:(id)a3 withFlagRequests:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v21 = v6;
  id v22 = a4;
  id v7 = [(MFIMAPConnection *)self _fetchArgumentForMessageUidsAndFlags];
  int v8 = [@"(UID FLAGS)" isEqualToString:v7];

  if (v8)
  {
    BOOL v19 = [v6 objectAtIndex:0];
    id v20 = [v6 lastObject];
    id v9 = [NSString stringWithFormat:@"%@:%@", v19, v20];
    uint64_t v10 = objc_alloc_init(MFIMAPConnectionFlagSearchResults);
    char v27 = 1;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = v22;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v11);
          }
          char v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          char v16 = [v15 searchTerms];
          uint64_t v17 = [(MFIMAPConnection *)self searchUidSet:v9 forTerms:v16 success:&v27];

          if (!v27)
          {

            uint64_t v10 = 0;
            goto LABEL_13;
          }
          -[MFIMAPConnectionFlagSearchResults cacheStateForUIDs:mask:existenceSetsFlag:](v10, "cacheStateForUIDs:mask:existenceSetsFlag:", v17, [v15 mask], objc_msgSend(v15, "isPositiveMatch"));
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)sendResponsesForUIDs:(id)a3 fields:(id)a4 flagSearchResults:(id)a5 toQueue:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v12)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v14);
          }
          BOOL v18 = objc_msgSend(v12, "copyResponseForUID:", objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "integerValue", (void)v21));
          if (v18) {
            [v13 addItem:v18];
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v15);
    }

    BOOL v19 = 1;
  }
  else
  {
    BOOL v19 = [(MFIMAPConnection *)self sendResponsesForUIDFetchForUIDs:v10 fields:v11 toQueue:v13];
  }

  return v19;
}

- (void)didFinishCommands:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v4)
  {
    uint64_t v21 = *(void *)v24;
    do
    {
      uint64_t v22 = v4;
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v7 = [v6 untaggedResponses];
        unint64_t v8 = [v7 count];

        if (v8)
        {
          char v9 = 0;
          unint64_t v10 = 0;
          do
          {
            id v11 = [v6 untaggedResponses];
            id v12 = [v11 objectAtIndexedSubscript:v10];

            switch([v12 responseType])
            {
              case 2:
                if ([v12 responseCode] != 12) {
                  goto LABEL_30;
                }
                id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
                if (WeakRetained && (*(unsigned char *)&self->_delegateState & 0x20) != 0)
                {
                  id v14 = [v12 responseInfo];
                  -[NSObject setHighestModSequence:](WeakRetained, "setHighestModSequence:", [v14 unsignedLongLongValue]);
                }
                goto LABEL_29;
              case 3:
                uint64_t v17 = MFLogGeneral();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  [(MFIMAPConnection *)self _errorForResponse:v12 commandParams:v6];
                  objc_claimAutoreleasedReturnValue();
                  -[MFIMAPConnection didFinishCommands:]();
                }

                self->_gotBadResponse = 1;
                goto LABEL_30;
              case 4:
                id WeakRetained = +[MFIMAPConnection log];
                if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
                {
                  BOOL v19 = _IMAPCommandTable[[v6 command]];
                  *(_DWORD *)buf = 136315394;
                  char v28 = v19;
                  __int16 v29 = 2112;
                  long long v30 = v12;
                  _os_log_error_impl(&dword_1A7EFF000, WeakRetained, OS_LOG_TYPE_ERROR, "Unhandled response to command %s: %@", buf, 0x16u);
                }
                goto LABEL_29;
              case 6:
                uint64_t v15 = +[MFIMAPConnection log];
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v16 = _IMAPCommandTable[[v6 command]];
                  *(_DWORD *)buf = 136315394;
                  char v28 = v16;
                  __int16 v29 = 2112;
                  long long v30 = v12;
                  _os_log_impl(&dword_1A7EFF000, v15, OS_LOG_TYPE_DEFAULT, "MFIMAPConnection was lost during processing of command %s: %@.", buf, 0x16u);
                }

                char v9 = 1;
                goto LABEL_30;
              case 7:
                id WeakRetained = [v12 capabilities];
                if (WeakRetained)
                {
                  [(MFIMAPConnection *)self mf_lock];
                  [(MFIMAPConnection *)self _clearCapabilities];
                  [(MFIMAPConnection *)self _addCapabilities:WeakRetained];
                  [(MFIMAPConnection *)self mf_unlock];
                }
                goto LABEL_29;
              case 9:
                id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
                if (WeakRetained && (*(unsigned char *)&self->_delegateState & 0x10) != 0) {
                  -[NSObject setServerMessageCount:](WeakRetained, "setServerMessageCount:", [v12 number]);
                }
LABEL_29:

                goto LABEL_30;
              case 10:
              case 11:
              case 17:
LABEL_30:
                BOOL v18 = [v6 untaggedResponses];
                [v18 removeObjectAtIndex:v10];

                --v8;
                break;
              default:
                ++v10;
                break;
            }
          }
          while (v10 < v8);
          if (v9) {
            [(MFIMAPConnection *)self disconnectAndNotifyDelegate:1];
          }
        }
        [v6 setUntaggedResponses:0];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v4);
  }
}

- (id)_logStringForIDs:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if ((unint64_t)[v3 length] >= 0x65)
  {
    uint64_t v5 = NSString;
    id v6 = [v3 substringToIndex:100];
    uint64_t v4 = [v5 stringWithFormat:@"%@ ...", v6];
  }
  return v4;
}

- (id)_logStringForCommand:(id)a3
{
  id v4 = a3;
  if ([v4 command] == 38) {
    uint64_t v5 = "";
  }
  else {
    uint64_t v5 = _IMAPCommandTable[[v4 command]];
  }
  id v6 = &stru_1EFF11268;
  uint64_t v7 = [v4 command];
  switch(v7)
  {
    case 20:
    case 21:
      unint64_t v8 = [v4 arguments];
      unint64_t v9 = [v8 count];

      unint64_t v10 = [v4 arguments];
      id v11 = [v10 firstObject];

      if ((unint64_t)[v11 length] >= 0x65)
      {
        id v12 = NSString;
        id v13 = [v11 substringToIndex:100];
        uint64_t v14 = [v12 stringWithFormat:@"%@ ...", v13];

        id v11 = (void *)v14;
      }
      uint64_t v15 = @" ...";
      if (v9 <= 2) {
        uint64_t v15 = &stru_1EFF11268;
      }
      uint64_t v16 = v15;
      uint64_t v17 = NSString;
      BOOL v18 = [v4 arguments];
      BOOL v19 = [v18 objectAtIndexedSubscript:1];
      uint64_t v20 = [v17 stringWithFormat:@"%@ %@%@", v11, v19, v16];
      goto LABEL_11;
    case 22:
      char v27 = [v4 arguments];
      char v28 = [v27 firstObject];
      id v11 = [(MFIMAPConnection *)self _logStringForIDs:v28];

      __int16 v29 = NSString;
      uint64_t v16 = [v4 arguments];
      BOOL v18 = [(__CFString *)v16 objectAtIndexedSubscript:1];
      id v6 = [v29 stringWithFormat:@"%@ %@", v11, v18];
      goto LABEL_17;
    case 23:
    case 37:
      uint64_t v21 = [v4 arguments];
      uint64_t v22 = [v21 firstObject];
      id v11 = [(MFIMAPConnection *)self _logStringForIDs:v22];

      long long v23 = NSString;
      long long v24 = (void *)MEMORY[0x1E4F60E00];
      uint64_t v16 = [v4 arguments];
      BOOL v18 = [(__CFString *)v16 objectAtIndexedSubscript:1];
      BOOL v19 = [v24 partiallyRedactedStringForString:v18];
      uint64_t v20 = [v23 stringWithFormat:@"%@ %@", v11, v19];
LABEL_11:
      id v6 = (__CFString *)v20;

LABEL_17:
      goto LABEL_18;
    case 24:
    case 31:
      id v11 = [v4 arguments];
      uint64_t v16 = [(MFIMAPConnection *)self _publicDescriptionForSearchString:v11];
      uint64_t v25 = [(__CFString *)v16 componentsJoinedByString:@" "];
      goto LABEL_15;
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
      goto LABEL_20;
    case 38:
      id v11 = [v4 arguments];
      id v6 = [v11 objectAtIndexedSubscript:0];
      goto LABEL_19;
    default:
      if (v7 != 13) {
        goto LABEL_20;
      }
      long long v26 = (void *)MEMORY[0x1E4F60E00];
      id v11 = [v4 arguments];
      uint64_t v16 = [v11 objectAtIndexedSubscript:0];
      uint64_t v25 = [v26 partiallyRedactedStringForString:v16];
LABEL_15:
      id v6 = (__CFString *)v25;
LABEL_18:

LABEL_19:
LABEL_20:
      long long v30 = [NSString stringWithFormat:@"%lu %s %@", objc_msgSend(v4, "sequenceNumber"), v5, v6];

      return v30;
  }
}

- (id)_publicDescriptionForSearchString:(id)a3
{
  id v3 = objc_msgSend(a3, "ef_map:", &__block_literal_global_522);
  return v3;
}

id __54__MFIMAPConnection__publicDescriptionForSearchString___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v2 hasPrefix:@"\""])
  {
    id v3 = (void *)MEMORY[0x1E4F60E00];
    id v4 = [v2 substringFromIndex:1];
    id v5 = [v3 partiallyRedactedStringForString:v4];
  }
  else
  {
    id v5 = v2;
  }

  return v5;
}

- (double)connectTime
{
  return self->_connectTime;
}

- (BOOL)gotBadResponse
{
  return self->_gotBadResponse;
}

- (int)tag
{
  return self->_tag;
}

- (void)setTag:(int)a3
{
  self->_tag = a3;
}

- (MFIMAPConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MFIMAPConnectionDelegate *)WeakRetained;
}

- (unint64_t)idleCommandSequenceNumber
{
  return self->_idleCommandSequenceNumber;
}

- (void)setIdleCommandSequenceNumber:(unint64_t)a3
{
  self->_idleCommandSequenceNumber = a3;
}

- (EFCancelable)idleSubscriptionCancelable
{
  return self->_idleSubscriptionCancelable;
}

- (void)setIdleSubscriptionCancelable:(id)a3
{
}

- (unsigned)permanentFlags
{
  return self->_permanentFlags;
}

- (void)setPermanentFlags:(unsigned int)a3
{
  self->_permanentFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleSubscriptionCancelable, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fetchPipeline, 0);
  objc_storeStrong((id *)&self->_downloadCache, 0);
  objc_storeStrong((id *)&self->_streamEventQueue, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_lastRequiredHeaders, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_selectedMailbox, 0);
  objc_storeStrong((id *)&self->_serverNamespace, 0);
  objc_storeStrong((id *)&self->_separatorChar, 0);
  objc_storeStrong((id *)&self->_mailboxListFilter, 0);
}

- (id)_searchUidsForMessageIDs:(id)a3 excludeDeleted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 count];
  unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4 * v7];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__MFIMAPConnection_ReferenceSearching___searchUidsForMessageIDs_excludeDeleted___block_invoke;
  v13[3] = &unk_1E5D3BCB0;
  uint64_t v15 = v7 - 1;
  id v9 = v8;
  id v14 = v9;
  [v6 enumerateObjectsUsingBlock:v13];
  if (v4) {
    [v9 addObject:@"UNDELETED"];
  }
  char v12 = 0;
  unint64_t v10 = [(MFIMAPConnection *)self searchIDSet:0 forTerms:v9 success:&v12];

  return v10;
}

void __80__MFIMAPConnection_ReferenceSearching___searchUidsForMessageIDs_excludeDeleted___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if (*(void *)(a1 + 40) > a3) {
    [*(id *)(a1 + 32) addObject:@"OR"];
  }
  [*(id *)(a1 + 32) addObject:@"HEADER"];
  [*(id *)(a1 + 32) addObject:@"Message-ID"];
  [*(id *)(a1 + 32) addObject:v5];
}

- (id)_uidsForMessageIDs:(id)a3 excludeDeleted:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = [a3 allObjects];
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v6, "count"));
  objc_msgSend(v6, "ef_subarraysOfSize:", 5);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        char v12 = -[MFIMAPConnection _searchUidsForMessageIDs:excludeDeleted:](self, "_searchUidsForMessageIDs:excludeDeleted:", *(void *)(*((void *)&v14 + 1) + 8 * i), v4, (void)v14);
        [v7 addObjectsFromArray:v12];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v7;
}

- (void)_sendApplePushForAccountIfSupported:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, a2, a3, "#aps-push account %@ received mailbox responses but version 1 response, ignoring mailboxes", (uint8_t *)&v3);
}

- (void)_sendApplePushForAccountIfSupported:(uint8_t *)buf .cold.2(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "#aps-push account %@ specified bad version/topic in response: %@", buf, 0x16u);
}

- (void)_sendApplePushForAccountIfSupported:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_3();
  _os_log_error_impl(&dword_1A7EFF000, v0, OS_LOG_TYPE_ERROR, "#aps-push account %@ rejected XAPPLEPUSHSERVICE request: %@", v1, 0x16u);
}

- (void)_doBasicConnectionUsingAccount:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, v3, (uint64_t)v3, "*** Failed to read initial response from %@", v4);
}

- (void)_doBasicConnectionUsingAccount:.cold.2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, v3, (uint64_t)v3, "*** Expected untagged initial response from %@", v4);
}

- (void)_sendCommands:(uint64_t)a3 response:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138543362;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, a2, a3, "%{public}@ failed to write commands", (uint8_t *)&v3);
}

- (void)_sendCommands:response:.cold.2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, v3, (uint64_t)v3, "*** Invalid IMAP command %@", v4);
}

- (void)authenticateUsingAccount:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, v3, (uint64_t)v3, "LOGIN failed with error %{public}@", v4);
}

- (void)authenticateUsingAccount:.cold.2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, v3, (uint64_t)v3, "LOGIN failed due to non-ascii username: %{public}@", v4);
}

- (void)_updateSearchCapabilityWithAccount:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "inconsistent esearch counts detected, ignoring esearch capability", v1, 2u);
}

- (void)_dictionaryFromSourceUIDs:destinationUIDs:.cold.1()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_3();
  _os_log_error_impl(&dword_1A7EFF000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "IMAPConnection: source UIDs count is different from destination UIDs (source: %@; destination: %@)",
    v0,
    0x16u);
}

- (void)authenticateUsingAccount:authenticator:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  *uint64_t v1 = 138412290;
  *int v3 = v2;
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, v5, (uint64_t)v3, "IMAP protocol error: %@", v4);
}

- (void)authenticateUsingAccount:authenticator:.cold.2()
{
  OUTLINED_FUNCTION_1_5();
  *uint64_t v1 = 138412290;
  *int v3 = v2;
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, v5, (uint64_t)v3, "IMAP auth failure: %@", v4);
}

- (void)didFinishCommands:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  *uint64_t v1 = 138412290;
  *int v3 = v2;
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, v5, (uint64_t)v3, "%@", v4);
}

@end