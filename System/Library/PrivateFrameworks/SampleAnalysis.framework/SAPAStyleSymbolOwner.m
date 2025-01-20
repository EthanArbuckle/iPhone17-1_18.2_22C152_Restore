@interface SAPAStyleSymbolOwner
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAPAStyleSymbolOwner

+ (id)classDictionaryKey
{
  return @"PASymbolOwner";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  id v6 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleSymbolOwner" userInfo:0];
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  id v4 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleSymbolOwner" userInfo:0];
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleSymbolOwner" userInfo:0];
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if ((unint64_t)(*(void *)a3 - 4293844428) >= 2 && *(void *)a3 != 287454020)
  {
    id v8 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Bad PASymbolOwner magic" userInfo:0];
    objc_exception_throw(v8);
  }
  id result = objc_alloc_init(SAPAStyleSymbolOwner);
  *((void *)result + 2) = *((void *)a3 + 4);
  if (*(void *)a3 < 0xFFEEDDCDuLL) {
    char v7 = 0;
  }
  else {
    char v7 = *((unsigned char *)a3 + 80);
  }
  *((unsigned char *)result + 8) = v7;
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  if ((unint64_t)(*(void *)a3 - 4293844428) >= 2 && *(void *)a3 != 287454020)
  {
LABEL_78:
    v84 = @"Bad PASymbolOwner magic";
    goto LABEL_80;
  }
  v12 = v10;
  unint64_t v13 = *((void *)a3 + 3);
  v14 = objc_opt_class();
  v15 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v13, v9, v12, v14, 0);
  if (v15)
  {
    unint64_t v16 = *((void *)a3 + 1);
    v17 = objc_opt_class();
    v18 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v16, v9, v12, v17, 0);
    unint64_t v19 = *((void *)a3 + 2);
    v20 = objc_opt_class();
    v21 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v19, v9, v12, v20, 0);
    unint64_t v22 = *((void *)a3 + 5);
    v23 = objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v22, v9, v12, v23, 0);
    id newValue = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v24 = *((void *)a3 + 6);
    v25 = objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v24, v9, v12, v25, 0);
    id v93 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v26 = *((void *)a3 + 7);
    v27 = objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v26, v9, v12, v27, 0);
    id v92 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v28 = *((void *)a3 + 8);
    v29 = objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v28, v9, v12, v29, 0);
    id v91 = (id)objc_claimAutoreleasedReturnValue();
    if ([v21 isAbsolutePath]) {
      v30 = v21;
    }
    else {
      v30 = 0;
    }
    v31 = +[SABinary binaryWithUUID:v15 absolutePath:v30];
    selfa = v31;
    if (self->_hasTextExecSegment
      && ((-[SABinary segmentWithCleanName:](v31, @"__TEXT_EXEC"),
           (v32 = objc_claimAutoreleasedReturnValue()) != 0)
       || (+[SASegment segmentWithBinary:name:length:]((uint64_t)SASegment, selfa, @"__TEXT_EXEC", self->_textSegmentLength), v32 = objc_claimAutoreleasedReturnValue(), -[SABinary addSegment:](selfa, v32), v31 = selfa, v32)))
    {
      v95 = v32;
      if (![v32 length])
      {
        unint64_t textSegmentLength = self->_textSegmentLength;
        if (textSegmentLength) {
          -[SASegment setLength:](v32, textSegmentLength);
        }
      }
      char v99 = 0;
    }
    else
    {
      if (![v31 length])
      {
        unint64_t v83 = self->_textSegmentLength;
        if (v83)
        {
          v34 = selfa;
          -[SABinary setLength:](selfa, v83);
          v95 = 0;
          char v99 = 1;
          goto LABEL_20;
        }
      }
      v95 = 0;
      char v99 = 1;
    }
    v34 = selfa;
LABEL_20:
    v35 = [v34 name];

    if (!v35) {
      -[SABinary setName:](v34, v18);
    }
    v36 = [v34 path];

    v38 = v34;
    if (!v36 && v34)
    {
      objc_setProperty_atomic_copy(v34, v37, v21, 80);
      v38 = selfa;
    }
    v39 = [v38 bundleIdentifier];

    v41 = selfa;
    if (!v39 && selfa)
    {
      objc_setProperty_atomic_copy(selfa, v40, newValue, 88);
      v41 = selfa;
    }
    v42 = [v41 bundleVersion];

    v44 = selfa;
    if (!v42 && selfa)
    {
      objc_setProperty_atomic_copy(selfa, v43, v93, 96);
      v44 = selfa;
    }
    v45 = [v44 bundleShortVersion];

    v47 = selfa;
    if (!v45 && selfa)
    {
      objc_setProperty_atomic_copy(selfa, v46, v92, 104);
      v47 = selfa;
    }
    v48 = v47;
    v49 = [v47 binaryVersion];

    if (!v49 && v48) {
      objc_setProperty_atomic_copy(v48, v50, v91, 112);
    }
    uint64_t v51 = *(void *)a3;
    if (*(void *)a3 < 0xFFEEDDCCuLL) {
      goto LABEL_78;
    }
    if (v51 == 4293844428)
    {
      uint64_t v52 = 80;
    }
    else
    {
      if (v51 != 4293844429)
      {
        v84 = @"Bad PASerializedSymbolOwner magic";
LABEL_80:
        id v85 = +[SAException exceptionWithName:@"Decoding failure" reason:v84 userInfo:0];
        objc_exception_throw(v85);
      }
      uint64_t v52 = 81;
    }
    uint64_t v53 = *((void *)a3 + 9);
    if (v53)
    {
      v86 = v21;
      v87 = v18;
      v88 = v15;
      v54 = (char *)a3 + v52;
      v55 = objc_opt_class();
      v89 = v12;
      id v90 = v9;
      SASerializableNewMutableArrayFromIndexList((uint64_t)v54, v53, v9, v12, v55);
      long long v106 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v100 = [obj countByEnumeratingWithState:&v106 objects:v111 count:16];
      if (v100)
      {
        uint64_t v98 = *(void *)v107;
        do
        {
          uint64_t v57 = 0;
          do
          {
            if (*(void *)v107 != v98) {
              objc_enumerationMutation(obj);
            }
            v58 = *(void **)(*((void *)&v106 + 1) + 8 * v57);
            if (v99)
            {
              if (v58)
              {
                int64_t v60 = v58[2];
                unint64_t v59 = v58[3];
                id Property = objc_getProperty(*(id *)(*((void *)&v106 + 1) + 8 * v57), v56, 8, 1);
              }
              else
              {
                unint64_t v59 = 0;
                int64_t v60 = 0;
                id Property = 0;
              }
              uint64_t v62 = -[SABinary addSymbolWithOffsetIntoBinary:length:name:](selfa, v60, v59, Property);
            }
            else
            {
              if (v58)
              {
                unint64_t v65 = v58[2];
                unint64_t v64 = v58[3];
                id v66 = objc_getProperty(*(id *)(*((void *)&v106 + 1) + 8 * v57), v56, 8, 1);
              }
              else
              {
                unint64_t v64 = 0;
                unint64_t v65 = 0;
                id v66 = 0;
              }
              uint64_t v62 = -[SASegment addNonInlineSymbolWithOffsetIntoSegment:length:name:](v95, v65, v64, v66);
            }
            v67 = (void *)v62;
            long long v104 = 0u;
            long long v105 = 0u;
            long long v102 = 0u;
            long long v103 = 0u;
            uint64_t v101 = v57;
            if (v58) {
              id v68 = objc_getProperty(v58, v63, 32, 1);
            }
            else {
              id v68 = 0;
            }
            id v69 = v68;
            uint64_t v70 = [v69 countByEnumeratingWithState:&v102 objects:v110 count:16];
            if (v70)
            {
              uint64_t v72 = v70;
              uint64_t v73 = *(void *)v103;
              do
              {
                for (uint64_t i = 0; i != v72; ++i)
                {
                  if (*(void *)v103 != v73) {
                    objc_enumerationMutation(v69);
                  }
                  uint64_t v75 = *(void *)(*((void *)&v102 + 1) + 8 * i);
                  if (v75 && objc_getProperty(*(id *)(*((void *)&v102 + 1) + 8 * i), v71, 32, 1))
                  {
                    unint64_t v76 = *(void *)(v75 + 16);
                    uint64_t v77 = *(void *)(v75 + 24);
                    int v79 = *(_DWORD *)(v75 + 8);
                    int v78 = *(_DWORD *)(v75 + 12);
                    id v80 = objc_getProperty((id)v75, v71, 32, 1);
                    id v81 = -[SASymbol addNonInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:](v67, v76, v77, v79, v78, v80);
                  }
                }
                uint64_t v72 = [v69 countByEnumeratingWithState:&v102 objects:v110 count:16];
              }
              while (v72);
            }

            uint64_t v57 = v101 + 1;
          }
          while (v101 + 1 != v100);
          uint64_t v82 = [obj countByEnumeratingWithState:&v106 objects:v111 count:16];
          uint64_t v100 = v82;
        }
        while (v82);
      }

      v12 = v89;
      id v9 = v90;
      v18 = v87;
      v15 = v88;
      v21 = v86;
    }
  }
}

@end