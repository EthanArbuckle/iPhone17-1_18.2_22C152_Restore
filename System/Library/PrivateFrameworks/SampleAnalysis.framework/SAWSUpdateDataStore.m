@interface SAWSUpdateDataStore
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (SAWSUpdateDataStore)init;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)dealloc;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
- (void)printFrameRateReportWithStartSampleIndex:(uint64_t)a3 endSampleIndex:(uint64_t)a4 startDisplayIndex:(void *)a5 sampleDataStore:(void *)a6 toStream:;
@end

@implementation SAWSUpdateDataStore

void __48__SAWSUpdateDataStore__getWSUpdateArraySnapshot__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:*(void *)(*(void *)(a1 + 32) + 8)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (SAWSUpdateDataStore)init
{
  v8.receiver = self;
  v8.super_class = (Class)SAWSUpdateDataStore;
  uint64_t v2 = [(SAWSUpdateDataStore *)&v8 init];
  uint64_t v3 = v2;
  if (v2)
  {
    wsUpdateArray = v2->_wsUpdateArray;
    v2->_wsUpdateArray = 0;

    dispatch_queue_t v5 = dispatch_queue_create("WS Update Callback Serial queue", 0);
    wsUpdateCallbackQueue = v3->_wsUpdateCallbackQueue;
    v3->_wsUpdateCallbackQueue = (OS_dispatch_queue *)v5;
  }
  return v3;
}

- (void)printFrameRateReportWithStartSampleIndex:(uint64_t)a3 endSampleIndex:(uint64_t)a4 startDisplayIndex:(void *)a5 sampleDataStore:(void *)a6 toStream:
{
  id v11 = a5;
  id v12 = a6;
  v13 = v12;
  if (a1)
  {
    if (!v12)
    {
      int v14 = *__error();
      v15 = _sa_logt();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BF22B000, v15, OS_LOG_TYPE_DEFAULT, "WARNING: Invalid stream. Bailing", buf, 2u);
      }

      *__error() = v14;
    }
    [v13 appendString:@"\n\n"];
    if (a3) {
      unint64_t v16 = a3;
    }
    else {
      unint64_t v16 = -1;
    }
    if (v16 < a2)
    {
      int v17 = *__error();
      v18 = _sa_logt();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BF22B000, v18, OS_LOG_TYPE_DEFAULT, "WARNING: Start index greater than end index. Bailing", buf, 2u);
      }

      *__error() = v17;
      v19 = @"Start Index > End Index. Could not print report\n";
      goto LABEL_71;
    }
    v20 = [v11 sampleTimestamps];
    unint64_t v21 = [v20 count];

    if (v21 <= a2)
    {
      v19 = @"No WS Updates\n";
LABEL_71:
      [v13 appendString:v19];
      goto LABEL_79;
    }
    v22 = [v11 sampleTimestamps];
    unint64_t v23 = [v22 count];

    if (v16 >= v23)
    {
      v24 = [v11 sampleTimestamps];
      a3 = [v24 count] - 1;
    }
    v25 = [v11 sampleTimestamps];
    v26 = [v25 objectAtIndexedSubscript:a2];
    [v26 machAbsTimeSeconds];
    double v28 = v27;

    v29 = [v11 sampleTimestamps];
    v30 = [v29 objectAtIndexedSubscript:a3];
    [v30 machAbsTimeSeconds];
    double v32 = v31;

    v33 = (void *)MEMORY[0x1C18A6A20]();
    id v34 = v13;
    self;
    [v34 appendString:@"----FPS Report Legend:-----\nRaw Instantaneous FPS:\n    30FPS delimiter:    '|'\n    10FPS delimiter:    '+'\n    1FPS delimiter:     '-'\n\nDefer+Work Instantaneous FPS:                'X'\nWork Instantaneous FPS:                      '^'\nEqual Work and Defer+Work Instantaneous FPS: '*'\n"];

    [v34 appendString:@"\n====Frame Rate Report:====\n\n"];
    *(void *)buf = 0;
    v86 = buf;
    uint64_t v87 = 0x3032000000;
    v88 = __Block_byref_object_copy__8;
    v89 = __Block_byref_object_dispose__8;
    id v90 = 0;
    v35 = *(NSObject **)(a1 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__SAWSUpdateDataStore__getWSUpdateArraySnapshot__block_invoke;
    block[3] = &unk_1E63FA2E8;
    block[4] = a1;
    block[5] = buf;
    dispatch_sync(v35, block);
    id v36 = *((id *)v86 + 5);
    _Block_object_dispose(buf, 8);

    if (v36 && [v36 count])
    {
      v77 = v33;
      v37 = +[SAWSUpdateTimeToIndexMapping arrayOfMappingsFromWSUpdataDataArray:v36 andSampleDataStore:v11];
      id v78 = v11;
      if (v37)
      {
        id v38 = v34;
        objc_msgSend(v38, "printWithFormat:", @"%29s", "Frame Length [SampleRange]");
        objc_msgSend(v38, "printWithFormat:", @"%29s", "WS Wait Length [SampleRange]");
        objc_msgSend(v38, "printWithFormat:", @"%29s", "Defer Length [SampleRange]");
        objc_msgSend(v38, "printWithFormat:", @"%29s", "WS Work Length [SampleRange]");
        objc_msgSend(v38, "printWithFormat:", @"%16s\n", "Frame Rate");

        if (![v36 count]) {
          goto LABEL_77;
        }
        uint64_t v39 = 0;
        uint64_t v79 = a4 - a2;
        v81 = v37;
        id v82 = v36;
        double v80 = v28;
        while (1)
        {
          v40 = [v36 objectAtIndexedSubscript:v39];
          v41 = [v37 objectAtIndexedSubscript:v39];
          v42 = v41;
          if (v40)
          {
            if (v40[4] < v28) {
              goto LABEL_66;
            }
            double v43 = v40[1];
          }
          else
          {
            double v43 = 0.0;
            if (v28 > 0.0) {
              goto LABEL_66;
            }
          }
          if (v43 > v32)
          {

            goto LABEL_77;
          }
          id v44 = v38;
          v45 = v40;
          id v46 = v42;
          v83 = v46;
          if (v40)
          {
            v47 = v46;
            double v48 = v32;
            double v49 = v45[1];
            double v50 = v45[2] - v49;
            if (v50 > 0.0333333333)
            {
              [v44 printWithFormat:@"|\nWS Idle: %.2fms\n|\n", v50 * 1000.0];
              double v49 = v45[1];
            }
            objc_msgSend(v44, "printWithFormat:", @"%13.2f ms", (v45[4] - v49) * 1000.0);
            [v47 printFrameIndexRangeToStream:v44 withTranslationDelta:v79];
            objc_msgSend(v44, "printWithFormat:", @"%13.2f ms", (v45[2] - v45[1]) * 1000.0);
            [v47 printWaitIndexRangeToStream:v44 withTranslationDelta:v79];
            objc_msgSend(v44, "printWithFormat:", @"%13.2f ms", (v45[3] - v45[2]) * 1000.0);
            [v47 printDeferIndexRangeToStream:v44 withTranslationDelta:v79];
            objc_msgSend(v44, "printWithFormat:", @"%13.2f ms", (v45[4] - v45[3]) * 1000.0);
            [v47 printWorkIndexRangeToStream:v44 withTranslationDelta:v79];
            id v51 = v44;
            v52 = v51;
            double v53 = (v45[4] - v45[1]) * 1000.0;
            if (v53 == 0.0) {
              double v54 = 1000.0;
            }
            else {
              double v54 = 1000.0 / v53;
            }
            double v55 = v45[3];
            double v56 = v45[4] - v55;
            double v57 = 1.0 / (v56 + v55 - v45[2]);
            if (v57 <= 60.0) {
              double v58 = v57;
            }
            else {
              double v58 = 60.0;
            }
            double v59 = 1.0 / v56;
            if (v59 <= 60.0) {
              double v60 = v59;
            }
            else {
              double v60 = 60.0;
            }
            objc_msgSend(v51, "printWithFormat:", @"%12.2f FPS", *(void *)&v54);
            int v61 = 0;
            double v62 = rint(v58);
            double v63 = rint(v60);
            double v64 = rint(v54);
            double v65 = 0.0;
            do
            {
              if (v63 == v65 && v62 == v65) {
                v67 = @"*";
              }
              else {
                v67 = @"X";
              }
              if (v62 == v65) {
                v68 = v67;
              }
              else {
                v68 = @"^";
              }
              if (v62 != v65 && v63 != v65)
              {
                if (v64 < v65)
                {
                  v68 = @" ";
                }
                else
                {
                  HIDWORD(v71) = -286331153 * v61;
                  LODWORD(v71) = HIDWORD(v71);
                  unsigned int v70 = v71 >> 1;
                  HIDWORD(v71) = -858993459 * v61;
                  LODWORD(v71) = HIDWORD(v71);
                  v72 = @"-";
                  if ((v71 >> 1) < 0x1999999A) {
                    v72 = @"+";
                  }
                  if (v70 < 0x8888889) {
                    v72 = @"|";
                  }
                  if (v45[2] - v45[1] <= 0.0333333333) {
                    v68 = v72;
                  }
                  else {
                    v68 = @" ";
                  }
                }
              }
              [v52 appendString:v68];
              double v65 = v65 + 1.0;
              ++v61;
            }
            while (v61 != 61);

            [v52 appendString:@"\n"];
            double v32 = v48;
            double v28 = v80;
          }
          else
          {
            int v73 = *__error();
            v74 = _sa_logt();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BF22B000, v74, OS_LOG_TYPE_DEFAULT, "WARNING: Missing data on current update", buf, 2u);
            }

            *__error() = v73;
          }

          v37 = v81;
          id v36 = v82;
LABEL_66:

          if (++v39 >= (unint64_t)[v36 count]) {
            goto LABEL_77;
          }
        }
      }
      int v75 = *__error();
      v76 = _sa_logt();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BF22B000, v76, OS_LOG_TYPE_DEFAULT, "WARNING: Invalid index mapping array. Bailing...", buf, 2u);
      }

      *__error() = v75;
LABEL_77:

      id v11 = v78;
      v33 = v77;
    }
    else
    {
      [v34 appendString:@"No WS Updates\n"];
    }
  }
LABEL_79:
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SAWSUpdateDataStore;
  [(SAWSUpdateDataStore *)&v2 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wsUpdateCallbackQueue, 0);
  objc_storeStrong((id *)&self->_wsUpdateArray, 0);
}

+ (id)classDictionaryKey
{
  return @"PAWSUpdateDataStore";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  wsUpdateArray = self->_wsUpdateArray;
  if (wsUpdateArray) {
    return 8 * [(NSMutableArray *)wsUpdateArray count] + 16;
  }
  else {
    return 16;
  }
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_queue_t v5 = +[SAWSUpdateDataStore classDictionaryKey];
  BOOL v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    wsUpdateArray = self->_wsUpdateArray;
    if (wsUpdateArray)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      objc_super v8 = wsUpdateArray;
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v14;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v8);
            }
            objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "addSelfToSerializationDictionary:", v4, (void)v13);
          }
          while (v10 != v12);
          uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v10);
      }
    }
  }
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if ([(SAWSUpdateDataStore *)self sizeInBytesForSerializedVersion] != a4)
  {
    int v12 = *__error();
    long long v13 = _sa_logt();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = [(SAWSUpdateDataStore *)self debugDescription];
      *(_DWORD *)buf = 136315650;
      uint64_t v26 = [v14 UTF8String];
      __int16 v27 = 2048;
      unint64_t v28 = [(SAWSUpdateDataStore *)self sizeInBytesForSerializedVersion];
      __int16 v29 = 2048;
      unint64_t v30 = a4;
      _os_log_error_impl(&dword_1BF22B000, v13, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }
    *__error() = v12;
    id v15 = [(SAWSUpdateDataStore *)self debugDescription];
    char v16 = [v15 UTF8String];
    [(SAWSUpdateDataStore *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(897, "%s: size %lu != buffer length %lu", v17, v18, v19, v20, v21, v22, v16);

    _os_crash();
    __break(1u);
    goto LABEL_12;
  }
  if (!a3)
  {
LABEL_12:
    unint64_t v23 = @"Trying to serialize to a NULL location";
    goto LABEL_14;
  }
  if (!v8)
  {
    unint64_t v23 = @"No serialization dictionary provided";
LABEL_14:
    id v24 = +[SAException exceptionWithName:@"Encoding failure" reason:v23 userInfo:0];
    objc_exception_throw(v24);
  }
  *(void *)a3 = 840627559;
  *((void *)a3 + 1) = [(NSMutableArray *)self->_wsUpdateArray count];
  wsUpdateArray = self->_wsUpdateArray;
  if (wsUpdateArray && [(NSMutableArray *)wsUpdateArray count]) {
    char v10 = SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances((char *)a3 + 16, *((void *)a3 + 1), self->_wsUpdateArray, v8);
  }
  else {
    char v10 = 1;
  }

  return v10;
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (!a3)
  {
    dispatch_queue_t v5 = @"NULL buffer";
    goto LABEL_8;
  }
  if (*(void *)a3 != 840627559)
  {
    dispatch_queue_t v5 = @"Bad SASerializedWSUpdateDataStore magic";
LABEL_8:
    id v6 = +[SAException exceptionWithName:@"Decoding failure" reason:v5 userInfo:0];
    objc_exception_throw(v6);
  }
  return objc_alloc_init(SAWSUpdateDataStore);
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v17 = a5;
  id v9 = a6;
  if (!a3)
  {
    id v15 = @"NULL buffer";
    goto LABEL_10;
  }
  if (*(void *)a3 != 840627559)
  {
    id v15 = @"Bad SASerializedWSUpdateDataStore magic";
LABEL_10:
    id v16 = +[SAException exceptionWithName:@"Decoding failure" reason:v15 userInfo:0];
    objc_exception_throw(v16);
  }
  char v10 = v9;
  uint64_t v11 = *((void *)a3 + 1);
  if (v11)
  {
    int v12 = objc_opt_class();
    SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 16, v11, v17, v10, v12);
    long long v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    wsUpdateArray = self->_wsUpdateArray;
    self->_wsUpdateArray = v13;
  }
}

@end