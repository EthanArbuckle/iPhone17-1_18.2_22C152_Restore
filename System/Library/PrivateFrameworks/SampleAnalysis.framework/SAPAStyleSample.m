@interface SAPAStyleSample
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAPAStyleSample

+ (id)classDictionaryKey
{
  return @"PASample";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  id v6 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleSample" userInfo:0];
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  id v4 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleSample" userInfo:0];
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleSample" userInfo:0];
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (!a3)
  {
    v10 = @"NULL buffer";
    goto LABEL_8;
  }
  if (*(void *)a3 != 2171757396)
  {
    v10 = @"Bad SASample magic";
    goto LABEL_8;
  }
  id v5 = objc_alloc_init(SAPAStyleSample);
  if (!v5)
  {
    v10 = @"Could not create new sample from buffer";
LABEL_8:
    id v11 = +[SAException exceptionWithName:@"Decoding failure" reason:v10 userInfo:0];
    objc_exception_throw(v11);
  }
  id v6 = v5;
  uint64_t v7 = +[SATimestamp timestampWithMachAbsTime:0 machAbsTimeSec:0 machContTime:*((double *)a3 + 1) machContTimeSec:0.0 wallTime:*((double *)a3 + 2)];
  timestamp = v6->_timestamp;
  v6->_timestamp = (SATimestamp *)v7;

  return v6;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  if (!a3)
  {
    v31 = @"Passed NULL buffer";
    goto LABEL_24;
  }
  if (*(void *)a3 != 2171757396)
  {
    v31 = @"Bad SASample magic";
LABEL_24:
    id v32 = +[SAException exceptionWithName:@"Decoding failure" reason:v31 userInfo:0];
    objc_exception_throw(v32);
  }
  id v11 = v10;
  v12 = (char *)a3 + 32;
  uint64_t v13 = *((void *)a3 + 3);
  v14 = objc_opt_class();
  v33 = v9;
  v15 = SASerializableNewMutableArrayFromIndexList((uint64_t)v12, v13, v9, v11, v14);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v39;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v39 != v19) {
          objc_enumerationMutation(v15);
        }
        v21 = *(void **)(*((void *)&v38 + 1) + 8 * v20);
        if (v21)
        {
          id Property = objc_getProperty(*(id *)(*((void *)&v38 + 1) + 8 * v20), v17, 8, 1);
          -[SATaskState applyPAStyleSampleTimestamp:]((uint64_t)Property, self->_timestamp);
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          id v24 = objc_getProperty(v21, v23, 16, 1);
        }
        else
        {

          id v24 = 0;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
        }
        id v25 = v24;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v35 != v28) {
                objc_enumerationMutation(v25);
              }
              -[SAThreadState applyPAStyleSampleTimestamp:](*(void *)(*((void *)&v34 + 1) + 8 * i), self->_timestamp);
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
          }
          while (v27);
        }

        ++v20;
      }
      while (v20 != v18);
      uint64_t v30 = [v15 countByEnumeratingWithState:&v38 objects:v43 count:16];
      uint64_t v18 = v30;
    }
    while (v30);
  }
}

- (void).cxx_destruct
{
}

@end