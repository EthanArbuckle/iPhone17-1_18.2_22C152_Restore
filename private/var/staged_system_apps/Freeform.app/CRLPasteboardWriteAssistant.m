@interface CRLPasteboardWriteAssistant
- (BOOL)excludeNativeData;
- (BOOL)skipMetadataObjectSerialization;
- (CRLPasteboardWriteAssistant)initWithContext:(id)a3;
- (CRLPasteboardWriteAssistantDelegate)delegate;
- (NSDictionary)contentDescription;
- (_TtC8Freeform19CRLPasteboardObject)pasteboardObject;
- (_TtC8Freeform19CRLPasteboardObject)promisedPasteboardObject;
- (id)crlPasteboardWithPasteboard:(id)a3;
- (id)pasteboardPropertyListForType:(id)a3;
- (id)writableTypesForPasteboard:(id)a3;
- (void)loadData;
- (void)serializeNativeDataForPasteboard:(id)a3;
- (void)setContentDescription:(id)a3;
- (void)setDataProvider:(id)a3 forTypes:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setExcludeNativeData:(BOOL)a3;
@end

@implementation CRLPasteboardWriteAssistant

- (CRLPasteboardWriteAssistant)initWithContext:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRLPasteboardWriteAssistant;
  v6 = [(CRLPasteboardWriteAssistant *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceContext, a3);
    v8 = [_TtC8Freeform19CRLPasteboardObject alloc];
    v9 = [v5 sourceContext];
    v10 = [(CRLPasteboardObject *)v8 initWithContext:v9];
    pasteboardObject = v7->_pasteboardObject;
    v7->_pasteboardObject = v10;

    uint64_t v12 = objc_opt_new();
    pasteboardStateTypes = v7->_pasteboardStateTypes;
    v7->_pasteboardStateTypes = (NSMutableSet *)v12;
  }
  return v7;
}

- (void)setDataProvider:(id)a3 forTypes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_shouldRefuseAdditionalDataProviders)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E05B8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101088498();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E05D8);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardWriteAssistant setDataProvider:forTypes:]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardWriteAssistant.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:64 isFatal:0 description:"Mapping data providers to types is not allowed after pasteboard writing has started"];
  }
  if (!self->_dataProviderMap)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    dataProviderMap = self->_dataProviderMap;
    self->_dataProviderMap = v11;
  }
  if (!self->_dataProviderTypes)
  {
    v13 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    dataProviderTypes = self->_dataProviderTypes;
    self->_dataProviderTypes = v13;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v7;
  id v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v21;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dataProviderMap, "setObject:forKeyedSubscript:", v6, v19, (void)v20);
        [(NSMutableOrderedSet *)self->_dataProviderTypes addObject:v19];
      }
      id v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v16);
  }
}

- (_TtC8Freeform19CRLPasteboardObject)pasteboardObject
{
  if (self->_didAttemptToSerializeNativeData && self->_serializeNativeDataSuccess)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E05F8);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector("promisedPasteboardObject");
      objc_claimAutoreleasedReturnValue();
      sub_101088520();
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0618);
    }
    v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardWriteAssistant pasteboardObject]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardWriteAssistant.mm"];
    id v7 = NSStringFromSelector("promisedPasteboardObject");
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 81, 0, "Pasteboard object has already been serialized. Call %{public}@ instead.", v7);
  }
  pasteboardObject = self->_pasteboardObject;

  return pasteboardObject;
}

- (void)setContentDescription:(id)a3
{
  id v5 = (NSDictionary *)a3;
  if (self->_contentDescription != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_contentDescription, a3);
    id v6 = [(CRLPasteboardWriteAssistant *)self delegate];
    [v6 distillPasteboardContentDescription:v7 intoPasteboardStateTypes:self->_pasteboardStateTypes];

    id v5 = v7;
  }
}

- (id)crlPasteboardWithPasteboard:(id)a3
{
  v3 = +[CRLPasteboard pasteboardWithPasteboard:a3];

  return v3;
}

- (void)serializeNativeDataForPasteboard:(id)a3
{
  id v5 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0638);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_10108859C();
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0658);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardWriteAssistant serializeNativeDataForPasteboard:]");
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardWriteAssistant.mm"];
    v10 = NSStringFromSelector(a2);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 101, 0, "%{public}@ needs to be invoked on the main thread for its implicit read lock", v10);
  }
  if (!self->_didWriteNativeDataToPasteboard)
  {
    v11 = [(CRLPasteboardWriteAssistant *)self crlPasteboardWithPasteboard:v5];
    uint64_t v12 = [_TtC8Freeform33CRLPasteboardObjectWriteAssistant alloc];
    v13 = [(CRLPasteboardSourceContext *)self->_sourceContext sourceStore];
    v14 = [(CRLPasteboardSourceContext *)self->_sourceContext sourceContext];
    id v15 = [(CRLPasteboardObjectWriteAssistant *)v12 initWithPasteboard:v11 store:v13 context:v14];

    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    pasteboardObject = self->_pasteboardObject;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001DBD00;
    v19[3] = &unk_1014E06A0;
    v19[4] = self;
    v19[5] = v11;
    v18 = v16;
    long long v20 = v18;
    [(CRLPasteboardObjectWriteAssistant *)v15 writePasteboardObject:pasteboardObject completionHandler:v19];
    dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    self->_didWriteNativeDataToPasteboard = 1;
  }
}

- (void)loadData
{
  if (!self->_didAttemptToSerializeNativeData
    && ![(CRLPasteboardWriteAssistant *)self excludeNativeData])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E06C0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101088618();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E06E0);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardWriteAssistant loadData]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardWriteAssistant.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:138 isFatal:0 description:"No attempt was made to serialize native data"];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = self->_dataProviderTypes;
  id v7 = [(NSMutableOrderedSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = -[CRLPasteboard dataForPasteboardType:](self->_nativeDataPasteboard, "dataForPasteboardType:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      id v7 = [(NSMutableOrderedSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (BOOL)skipMetadataObjectSerialization
{
  return 0;
}

- (_TtC8Freeform19CRLPasteboardObject)promisedPasteboardObject
{
  return self->_pasteboardObject;
}

- (id)writableTypesForPasteboard:(id)a3
{
  self->_shouldRefuseAdditionalDataProviders = 1;
  self->_shouldRefuseAdditionalPasteboardStateTypes = 1;
  [(CRLPasteboardWriteAssistant *)self serializeNativeDataForPasteboard:a3];
  v4 = +[NSMutableOrderedSet orderedSetWithCapacity:(char *)[(NSMutableOrderedSet *)self->_dataProviderTypes count] + 3];
  if (![(CRLPasteboardWriteAssistant *)self excludeNativeData])
  {
    id v5 = [(CRLPasteboardNativeDataProvider *)self->_nativeDataProvider promisedDataTypes];
    if (v5) {
      [v4 addObjectsFromArray:v5];
    }
    if (self->_contentDescription) {
      [v4 addObject:@"com.apple.freeform.CRLDescription"];
    }
    id v6 = [(NSMutableSet *)self->_pasteboardStateTypes allObjects];
    [v4 addObjectsFromArray:v6];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = self->_dataProviderTypes;
  id v8 = [(NSMutableOrderedSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        [v4 addObject:*(void *)(*((void *)&v13 + 1) + 8 * i) v13];
      }
      id v8 = [(NSMutableOrderedSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  long long v11 = [v4 array];

  return v11;
}

- (id)pasteboardPropertyListForType:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_dataProviderMap objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 pasteboardPromise:self propertyListForType:v4];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_18:

      goto LABEL_19;
    }
    id v8 = v7;
    id v9 = v4;
    if ((unint64_t)[v8 length] > 0x1200000)
    {
      int v10 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E0760);
      }
      long long v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101088728((uint64_t)v9, v10, v11);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E0780);
      }
      long long v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      long long v13 = +[NSString stringWithUTF8String:"void CRLPasteboardAssertNSData(CRLPasteboard *__strong, NSData *__strong, NSString *__strong)"];
      long long v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboard_Internal.h"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 13, 0, "Data for %{public}@ is too large for the pasteboard. It may be silently dropped.", v9);
    }
    id v7 = v8;
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"com.apple.freeform.CRLDescription"])
  {
    contentDescription = self->_contentDescription;
    id v24 = 0;
    id v7 = +[NSPropertyListSerialization dataWithPropertyList:contentDescription format:200 options:0 error:&v24];
    id v8 = v24;
    if (v7) {
      goto LABEL_17;
    }
    if (qword_101719A68 != -1) {
      dispatch_once(&qword_101719A68, &stru_1014E0700);
    }
    id v9 = off_10166B498;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      long long v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      long long v22 = [v8 domain];
      id v23 = [v8 code];
      *(_DWORD *)buf = 138544130;
      id v26 = v21;
      __int16 v27 = 2114;
      v28 = v22;
      __int16 v29 = 2048;
      id v30 = v23;
      __int16 v31 = 2112;
      id v32 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_ERROR, "Failed to serialize content description - Error: errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x2Au);
    }
LABEL_14:

LABEL_17:
    goto LABEL_18;
  }
  if ([(NSMutableSet *)self->_pasteboardStateTypes containsObject:v4])
  {
    id v7 = 0;
  }
  else
  {
    if (!self->_didAttemptToSerializeNativeData
      && ![(CRLPasteboardWriteAssistant *)self excludeNativeData])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E0720);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010886A0();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E0740);
      }
      uint64_t v17 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardWriteAssistant pasteboardPropertyListForType:]");
      uint64_t v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardWriteAssistant.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v18 file:v19 lineNumber:233 isFatal:0 description:"No attempt was made to serialize native data"];
    }
    id v7 = [(CRLPasteboardNativeDataProvider *)self->_nativeDataProvider fulfillPromisesForPasteboardType:v4];
  }
LABEL_19:

  return v7;
}

- (CRLPasteboardWriteAssistantDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRLPasteboardWriteAssistantDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)excludeNativeData
{
  return self->_excludeNativeData;
}

- (void)setExcludeNativeData:(BOOL)a3
{
  self->_excludeNativeData = a3;
}

- (NSDictionary)contentDescription
{
  return self->_contentDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentDescription, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pasteboardStateTypes, 0);
  objc_storeStrong((id *)&self->_nativeDataProvider, 0);
  objc_storeStrong((id *)&self->_nativeDataPasteboard, 0);
  objc_storeStrong((id *)&self->_dataProviderTypes, 0);
  objc_storeStrong((id *)&self->_dataProviderMap, 0);
  objc_storeStrong((id *)&self->_pasteboardObject, 0);

  objc_storeStrong((id *)&self->_sourceContext, 0);
}

@end