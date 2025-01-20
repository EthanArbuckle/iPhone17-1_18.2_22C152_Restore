@interface TRIPBMessage
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)resolveClassMethod:(SEL)a3;
+ (BOOL)resolveInstanceMethod:(SEL)a3;
+ (BOOL)supportsSecureCoding;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)descriptor;
+ (id)message;
+ (id)parseDelimitedFromCodedInputStream:(id)a3 extensionRegistry:(id)a4 error:(id *)a5;
+ (id)parseFromCodedInputStream:(id)a3 extensionRegistry:(id)a4 error:(id *)a5;
+ (id)parseFromData:(id)a3 error:(id *)a4;
+ (id)parseFromData:(id)a3 extensionRegistry:(id)a4 error:(id *)a5;
+ (void)initialize;
- (BOOL)hasExtension:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInitialized;
- (BOOL)parseUnknownField:(id)a3 extensionRegistry:(id)a4 tag:(unsigned int)a5;
- (TRIPBMessage)init;
- (TRIPBMessage)initWithCodedInputStream:(id)a3 extensionRegistry:(id)a4 error:(id *)a5;
- (TRIPBMessage)initWithCoder:(id)a3;
- (TRIPBMessage)initWithData:(id)a3 error:(id *)a4;
- (TRIPBMessage)initWithData:(id)a3 extensionRegistry:(id)a4 error:(id *)a5;
- (TRIPBUnknownFieldSet)unknownFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)data;
- (id)delimitedData;
- (id)description;
- (id)descriptor;
- (id)extensionsCurrentlySet;
- (id)getExistingExtension:(id)a3;
- (id)getExtension:(id)a3;
- (unint64_t)hash;
- (unint64_t)serializedSize;
- (void)addExtension:(id)a3 value:(id)a4;
- (void)addUnknownMapEntry:(int)a3 value:(id)a4;
- (void)clear;
- (void)clearExtension:(id)a3;
- (void)copyFieldsInto:(id)a3 zone:(_NSZone *)a4 descriptor:(id)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)internalClear:(BOOL)a3;
- (void)mergeDelimitedFromCodedInputStream:(id)a3 extensionRegistry:(id)a4;
- (void)mergeFrom:(id)a3;
- (void)mergeFromCodedInputStream:(id)a3 extensionRegistry:(id)a4;
- (void)mergeFromData:(id)a3 extensionRegistry:(id)a4;
- (void)parseMessageSet:(id)a3 extensionRegistry:(id)a4;
- (void)setExtension:(id)a3 index:(unint64_t)a4 value:(id)a5;
- (void)setExtension:(id)a3 value:(id)a4;
- (void)setUnknownFields:(id)a3;
- (void)writeDelimitedToCodedOutputStream:(id)a3;
- (void)writeDelimitedToOutputStream:(id)a3;
- (void)writeExtensionsToCodedOutputStream:(id)a3 range:(TRIPBExtensionRange)a4;
- (void)writeField:(id)a3 toCodedOutputStream:(id)a4;
- (void)writeToCodedOutputStream:(id)a3;
- (void)writeToOutputStream:(id)a3;
@end

@implementation TRIPBMessage

- (TRIPBMessage)initWithData:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  v8 = [(TRIPBMessage *)self init];
  v9 = v8;
  if (v8)
  {
    [(TRIPBMessage *)v8 mergeFromData:a3 extensionRegistry:a4];
    if (a5) {
      *a5 = 0;
    }
    if (![(TRIPBMessage *)v9 isInitialized])
    {

      v9 = 0;
      if (a5) {
        *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"TRIPBMessageErrorDomain" code:-101 userInfo:0];
      }
    }
  }
  return v9;
}

- (BOOL)isInitialized
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v4 = *(void **)([(TRIPBMessage *)self descriptor] + 8);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v32;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v32 != v6) {
        objc_enumerationMutation(v4);
      }
      v8 = *(void **)(*((void *)&v31 + 1) + 8 * v7);
      if ([v8 isRequired]
        && !TRIPBGetHasIvar((uint64_t)self, *(_DWORD *)(v8[1] + 20), *(_DWORD *)(v8[1] + 16)))
      {
        return 0;
      }
      if (*(unsigned __int8 *)(v8[1] + 30) - 15 > 1) {
        goto LABEL_39;
      }
      int v9 = [v8 fieldType];
      if (v9 == 1)
      {
        messageStorage = self->messageStorage_;
        if (messageStorage) {
          v12 = *(void **)((char *)messageStorage + *(unsigned int *)(v8[1] + 24));
        }
        else {
          v12 = 0;
        }
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v16 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v28;
LABEL_24:
          uint64_t v18 = 0;
          while (1)
          {
            if (*(void *)v28 != v17) {
              objc_enumerationMutation(v12);
            }
            if (![*(id *)(*((void *)&v27 + 1) + 8 * v18) isInitialized]) {
              return 0;
            }
            if (v16 == ++v18)
            {
              uint64_t v16 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
              if (v16) {
                goto LABEL_24;
              }
              goto LABEL_39;
            }
          }
        }
        goto LABEL_39;
      }
      if (v9)
      {
        int v13 = [v8 mapKeyDataType];
        v14 = self->messageStorage_;
        if (v14) {
          v15 = *(void **)((char *)v14 + *(unsigned int *)(v8[1] + 24));
        }
        else {
          v15 = 0;
        }
        if (v13 != 14)
        {
          if (v15 && ![v15 isInitialized]) {
            return 0;
          }
          goto LABEL_39;
        }
        if (v15)
        {
          char IsInitializedInternalHelper = TRIPBDictionaryIsInitializedInternalHelper(v15, v8);
LABEL_35:
          if ((IsInitializedInternalHelper & 1) == 0) {
            return 0;
          }
        }
      }
      else
      {
        if ([v8 isRequired]) {
          goto LABEL_12;
        }
        if (([v8 isOptional] & 1) == 0) {
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRIPBMessage.m", 1157, @"%@: Single message field %@ not required or optional?", objc_opt_class(), objc_msgSend(v8, "name"));
        }
        if (TRIPBGetHasIvar((uint64_t)self, *(_DWORD *)(v8[1] + 20), *(_DWORD *)(v8[1] + 16)))
        {
LABEL_12:
          char IsInitializedInternalHelper = objc_msgSend((id)TRIPBGetObjectIvarWithField((uint64_t)self, v8), "isInitialized");
          goto LABEL_35;
        }
      }
LABEL_39:
      if (++v7 == v5)
      {
        uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  extensionMap = self->extensionMap_;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __29__TRIPBMessage_isInitialized__block_invoke;
  v22[3] = &unk_1E576BAD8;
  v22[4] = &v23;
  [(NSMutableDictionary *)extensionMap enumerateKeysAndObjectsUsingBlock:v22];
  BOOL v20 = *((unsigned char *)v24 + 24) != 0;
  _Block_object_dispose(&v23, 8);
  return v20;
}

- (void)mergeFromCodedInputStream:(id)a3 extensionRegistry:(id)a4
{
  uint64_t v6 = [(TRIPBMessage *)self descriptor];
  int v51 = objc_msgSend((id)objc_msgSend(v6, "file"), "syntax");
  uint64_t v7 = (uint64_t *)((char *)a3 + 8);
  v8 = (void *)v6[1];
  unint64_t v9 = [v8 count];
  uint64_t Tag = TRIPBCodedInputStreamReadTag((uint64_t)a3 + 8);
  if (!Tag) {
    return;
  }
  uint64_t v11 = Tag;
  unint64_t v12 = 0;
  do
  {
    if (!v9)
    {
LABEL_19:
      if ([(TRIPBMessage *)self parseUnknownField:a3 extensionRegistry:a4 tag:v11])
      {
        goto LABEL_31;
      }
      return;
    }
    unint64_t v13 = v9;
    do
    {
      if (v12 >= v9) {
        unint64_t v12 = 0;
      }
      v14 = (void *)[v8 objectAtIndexedSubscript:v12];
      v15 = v14;
      uint64_t v16 = v14[1];
      if ((*(_WORD *)(v16 + 28) & 0xF04) != 0) {
        int v17 = 2;
      }
      else {
        int v17 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v16 + 30)];
      }
      if ((v17 | (8 * *(_DWORD *)(v16 + 16))) == v11)
      {
        int v19 = [v14 fieldType];
        if (v19 == 1)
        {
          if (![v15 isPackable]) {
            goto LABEL_30;
          }
LABEL_26:
          MergeRepeatedPackedFieldFromCodedInputStream(self, v15, v51, a3);
        }
        else
        {
          if (v19)
          {
            objc_msgSend(a3, "readMapEntry:extensionRegistry:field:parentMessage:", GetOrCreateMapIvarWithField(self, v15, v51), a4, v15, self);
            goto LABEL_31;
          }
          uint64_t v20 = v15[1];
          switch(*(unsigned char *)(v20 + 30))
          {
            case 0:
              BOOL v21 = ReadRawVarint64(v7) != 0;
              TRIPBSetBoolIvarWithFieldInternal(self, (uint64_t)v15, v21, v51);
              break;
            case 1:
              CheckSize((uint64_t)v7, 4);
              uint64_t v22 = *((void *)a3 + 3);
              int v23 = *(_DWORD *)(*((void *)a3 + 1) + v22);
              *((void *)a3 + 3) = v22 + 4;
              v24 = self;
              uint64_t v25 = (uint64_t)v15;
              goto LABEL_46;
            case 2:
              CheckSize((uint64_t)v7, 4);
              uint64_t v26 = *((void *)a3 + 3);
              int RawVarint64 = *(_DWORD *)(*((void *)a3 + 1) + v26);
              *((void *)a3 + 3) = v26 + 4;
              goto LABEL_42;
            case 3:
              CheckSize((uint64_t)v7, 4);
              uint64_t v28 = *((void *)a3 + 3);
              float v29 = *(float *)(*((void *)a3 + 1) + v28);
              *((void *)a3 + 3) = v28 + 4;
              TRIPBSetFloatIvarWithFieldInternal(self, (uint64_t)v15, v51, v29);
              break;
            case 4:
              CheckSize((uint64_t)v7, 8);
              uint64_t v30 = *((void *)a3 + 3);
              uint64_t v31 = *(void *)(*((void *)a3 + 1) + v30);
              *((void *)a3 + 3) = v30 + 8;
              goto LABEL_48;
            case 5:
              CheckSize((uint64_t)v7, 8);
              uint64_t v32 = *((void *)a3 + 3);
              uint64_t v33 = *(void *)(*((void *)a3 + 1) + v32);
              *((void *)a3 + 3) = v32 + 8;
              goto LABEL_44;
            case 6:
              CheckSize((uint64_t)v7, 8);
              uint64_t v34 = *((void *)a3 + 3);
              double v35 = *(double *)(*((void *)a3 + 1) + v34);
              *((void *)a3 + 3) = v34 + 8;
              TRIPBSetDoubleIvarWithFieldInternal(self, (uint64_t)v15, v51, v35);
              break;
            case 7:
              int RawVarint64 = ReadRawVarint64(v7);
              v36 = self;
              uint64_t v37 = (uint64_t)v15;
              goto LABEL_61;
            case 8:
              uint64_t v33 = ReadRawVarint64(v7);
              goto LABEL_44;
            case 9:
              unsigned int v38 = ReadRawVarint64(v7);
              int RawVarint64 = -(v38 & 1) ^ (v38 >> 1);
LABEL_42:
              v36 = self;
              uint64_t v37 = (uint64_t)v15;
              goto LABEL_61;
            case 0xA:
              unint64_t v39 = ReadRawVarint64(v7);
              uint64_t v33 = -(uint64_t)(v39 & 1) ^ (v39 >> 1);
LABEL_44:
              TRIPBSetInt64IvarWithFieldInternal(self, (uint64_t)v15, v33, v51);
              break;
            case 0xB:
              int v23 = ReadRawVarint64(v7);
              v24 = self;
              uint64_t v25 = (uint64_t)v15;
LABEL_46:
              TRIPBSetUInt32IvarWithFieldInternal(v24, v25, v23, v51);
              break;
            case 0xC:
              uint64_t v31 = ReadRawVarint64(v7);
LABEL_48:
              TRIPBSetUInt64IvarWithFieldInternal(self, (uint64_t)v15, v31, v51);
              break;
            case 0xD:
              uint64_t RetainedBytes = TRIPBCodedInputStreamReadRetainedBytes(v7);
              goto LABEL_51;
            case 0xE:
              uint64_t RetainedBytes = (uint64_t)TRIPBCodedInputStreamReadRetainedString(v7);
LABEL_51:
              v41 = (void *)RetainedBytes;
              v42 = self;
              uint64_t v43 = (uint64_t)v15;
              goto LABEL_65;
            case 0xF:
              if (!TRIPBGetHasIvar((uint64_t)self, *(_DWORD *)(v20 + 20), *(_DWORD *)(v20 + 16)))
              {
                id v50 = objc_alloc_init((Class)[v15 msgClass]);
                [a3 readMessage:v50 extensionRegistry:a4];
                goto LABEL_64;
              }
              messageStorage = self->messageStorage_;
              if (messageStorage) {
                uint64_t v45 = *(void *)((char *)messageStorage + *(unsigned int *)(v15[1] + 24));
              }
              else {
                uint64_t v45 = 0;
              }
              [a3 readMessage:v45 extensionRegistry:a4];
              break;
            case 0x10:
              if (TRIPBGetHasIvar((uint64_t)self, *(_DWORD *)(v20 + 20), *(_DWORD *)(v20 + 16)))
              {
                v46 = self->messageStorage_;
                uint64_t v47 = v15[1];
                if (v46) {
                  uint64_t v48 = *(void *)((char *)v46 + *(unsigned int *)(v47 + 24));
                }
                else {
                  uint64_t v48 = 0;
                }
                [a3 readGroup:*(unsigned int *)(v47 + 16) message:v48 extensionRegistry:a4];
              }
              else
              {
                id v50 = objc_alloc_init((Class)[v15 msgClass]);
                [a3 readGroup:*(unsigned int *)(v15[1] + 16) message:v50 extensionRegistry:a4];
LABEL_64:
                v42 = self;
                uint64_t v43 = (uint64_t)v15;
                v41 = v50;
LABEL_65:
                TRIPBSetRetainedObjectIvarWithFieldInternal(v42, v43, v41, v51);
              }
              break;
            case 0x11:
              uint64_t v49 = ReadRawVarint64(v7);
              if (v51 == 3 || [v15 isValidEnumValue:v49])
              {
                v36 = self;
                uint64_t v37 = (uint64_t)v15;
                int RawVarint64 = v49;
LABEL_61:
                TRIPBSetInt32IvarWithFieldInternal(v36, v37, RawVarint64, v51);
              }
              else
              {
                [(id)GetOrMakeUnknownFields(self) mergeVarintField:*(unsigned int *)(v15[1] + 16) value:v49];
              }
              break;
            default:
              break;
          }
        }
        ++v12;
        goto LABEL_31;
      }
      ++v12;
      --v13;
    }
    while (v13);
    unint64_t v18 = v9;
    while (1)
    {
      if (v12 >= v9) {
        unint64_t v12 = 0;
      }
      v15 = (void *)[v8 objectAtIndexedSubscript:v12];
      if ([v15 fieldType] == 1
        && *(unsigned __int8 *)(v15[1] + 30) - 13 >= 4
        && TRIPBFieldAlternateTag((uint64_t)v15) == v11)
      {
        break;
      }
      ++v12;
      if (!--v18) {
        goto LABEL_19;
      }
    }
    if (([v15 isPackable] & 1) == 0) {
      goto LABEL_26;
    }
LABEL_30:
    MergeRepeatedNotPackedFieldFromCodedInputStream(self, v15, v51, (uint64_t *)a3, (uint64_t)a4);
LABEL_31:
    uint64_t v11 = TRIPBCodedInputStreamReadTag((uint64_t)v7);
  }
  while (v11);
}

- (void)copyFieldsInto:(id)a3 zone:(_NSZone *)a4 descriptor:(id)a5
{
  uint64_t v7 = a3;
  v8 = self;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  memcpy(*((void **)a3 + 8), self->messageStorage_, *((unsigned int *)a5 + 6));
  int v42 = objc_msgSend((id)objc_msgSend(a5, "file"), "syntax");
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  unint64_t v9 = (void *)*((void *)a5 + 1);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v50;
    uint64_t v37 = v44;
    unint64_t v39 = v8;
    v40 = v9;
    unsigned int v38 = v7;
    do
    {
      uint64_t v13 = 0;
      uint64_t v41 = v11;
      do
      {
        if (*(void *)v50 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v49 + 1) + 8 * v13);
        uint64_t v15 = v14[1];
        if ((*(_WORD *)(v15 + 28) & 0xF02) != 0)
        {
          messageStorage = v8->messageStorage_;
          if (messageStorage)
          {
            int v17 = *(void **)((char *)messageStorage + *(unsigned int *)(v15 + 24));
            if (v17)
            {
              uint64_t v18 = v12;
              unsigned int v19 = *(unsigned __int8 *)(v15 + 30) - 15;
              int v20 = [*(id *)(*((void *)&v49 + 1) + 8 * v13) fieldType];
              if (v19 <= 1)
              {
                if (v20 == 1)
                {
                  BOOL v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v17, "count"));
                  long long v45 = 0u;
                  long long v46 = 0u;
                  long long v47 = 0u;
                  long long v48 = 0u;
                  uint64_t v22 = [v17 countByEnumeratingWithState:&v45 objects:v53 count:16];
                  if (v22)
                  {
                    uint64_t v23 = v22;
                    uint64_t v24 = *(void *)v46;
                    do
                    {
                      for (uint64_t i = 0; i != v23; ++i)
                      {
                        if (*(void *)v46 != v24) {
                          objc_enumerationMutation(v17);
                        }
                        uint64_t v26 = objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * i), "copyWithZone:", a4, v37);
                        [v21 addObject:v26];
                      }
                      uint64_t v23 = [v17 countByEnumeratingWithState:&v45 objects:v53 count:16];
                    }
                    while (v23);
                    uint64_t v7 = v38;
                    v8 = v39;
                    unint64_t v9 = v40;
                  }
                  else
                  {
                    v8 = v39;
                  }
                  uint64_t v12 = v18;
                  goto LABEL_41;
                }
                uint64_t v12 = v18;
                if ([v14 mapKeyDataType] == 14)
                {
                  id v30 = objc_alloc(MEMORY[0x1E4F1CA60]);
                  uint64_t v31 = [v17 count];
                  uint64_t v32 = v30;
                  unint64_t v9 = v40;
                  BOOL v21 = (void *)[v32 initWithCapacity:v31];
                  v43[0] = MEMORY[0x1E4F143A8];
                  v43[1] = 3221225472;
                  v44[0] = __47__TRIPBMessage_copyFieldsInto_zone_descriptor___block_invoke;
                  v44[1] = &unk_1E576BAB0;
                  v44[2] = v21;
                  v44[3] = a4;
                  [v17 enumerateKeysAndObjectsUsingBlock:v43];
LABEL_41:
                  uint64_t v11 = v41;
                  id v36 = v17;
                  TRIPBSetRetainedObjectIvarWithFieldInternal(v7, (uint64_t)v14, v21, v42);
                  goto LABEL_42;
                }
                uint64_t v33 = [v17 deepCopyWithZone:a4];
LABEL_38:
                BOOL v21 = (void *)v33;
                goto LABEL_41;
              }
              if (v20 == 1)
              {
                uint64_t v12 = v18;
                if (*(unsigned __int8 *)(v14[1] + 30) - 13 > 3)
                {
LABEL_34:
                  uint64_t v33 = objc_msgSend(v17, "copyWithZone:", a4, v37);
                  goto LABEL_38;
                }
              }
              else
              {
                uint64_t v12 = v18;
                if ([v14 mapKeyDataType] != 14
                  || *(unsigned __int8 *)(v14[1] + 30) - 13 > 3)
                {
                  goto LABEL_34;
                }
              }
              uint64_t v33 = objc_msgSend(v17, "mutableCopyWithZone:", a4, v37);
              goto LABEL_38;
            }
          }
        }
        else
        {
          int v27 = *(unsigned __int8 *)(v15 + 30);
          if ((v27 - 15) > 1)
          {
            if ((v27 - 13) > 3
              || !TRIPBGetHasIvar((uint64_t)v8, *(_DWORD *)(v15 + 20), *(_DWORD *)(v15 + 16)))
            {
              goto LABEL_42;
            }
          }
          else if (!TRIPBGetHasIvar((uint64_t)v8, *(_DWORD *)(v15 + 20), *(_DWORD *)(v15 + 16)))
          {
            *(void *)(v7[8] + *(unsigned int *)(v14[1] + 24)) = 0;
            goto LABEL_42;
          }
          uint64_t v28 = v8->messageStorage_;
          if (v28) {
            float v29 = *(void **)((char *)v28 + *(unsigned int *)(v14[1] + 24));
          }
          else {
            float v29 = 0;
          }
          uint64_t v34 = objc_msgSend(v29, "copyWithZone:", a4, v37);
          id v35 = v29;
          TRIPBSetRetainedObjectIvarWithFieldInternal(v7, (uint64_t)v14, v34, v42);
          unint64_t v9 = v40;
        }
LABEL_42:
        ++v13;
      }
      while (v13 != v11);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v11);
  }
}

- (void)internalClear:(BOOL)a3
{
  BOOL v25 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v24 = [(TRIPBMessage *)self descriptor];
  v4 = (void *)v24[1];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v10 = v9[1];
        if ((*(_WORD *)(v10 + 28) & 0xF02) != 0)
        {
          messageStorage = self->messageStorage_;
          if (messageStorage)
          {
            uint64_t v12 = *(void **)((char *)messageStorage + *(unsigned int *)(v10 + 24));
            if (v12)
            {
              if ([*(id *)(*((void *)&v30 + 1) + 8 * i) fieldType] == 1)
              {
                if (*(unsigned __int8 *)(v9[1] + 30) - 13 <= 3)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
LABEL_23:
                    uint64_t v15 = v12 + 1;
                    uint64_t v16 = (TRIPBMessage *)v12[1];
LABEL_25:
                    if (v16 == self) {
                      void *v15 = 0;
                    }
                  }
LABEL_27:

                  continue;
                }
              }
              else if ([v9 mapKeyDataType] == 14 {
                     && *(unsigned __int8 *)(v9[1] + 30) - 13 <= 3)
              }
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  goto LABEL_23;
                }
                goto LABEL_27;
              }
              uint64_t v15 = v12 + 1;
              uint64_t v16 = (TRIPBMessage *)v12[1];
              goto LABEL_25;
            }
          }
        }
        else
        {
          int v13 = *(unsigned __int8 *)(v10 + 30);
          if ((v13 - 15) > 1)
          {
            if ((v13 - 13) <= 3
              && TRIPBGetHasIvar((uint64_t)self, *(_DWORD *)(v10 + 20), *(_DWORD *)(v10 + 16)))
            {
            }
          }
          else
          {
            TRIPBClearAutocreatedMessageIvarWithField((uint64_t)self, *(void *)(*((void *)&v30 + 1) + 8 * i));
            v14 = self->messageStorage_;
            if (v14) {
              v14 = *(TRIPBMessage_Storage **)((char *)v14 + *(unsigned int *)(v9[1] + 24));
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v6);
  }
  int v17 = (void *)[(NSMutableDictionary *)self->autocreatedExtensionMap_ allValues];

  self->autocreatedExtensionMap_ = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v26 + 1) + 8 * j);
        if (*(TRIPBMessage **)(v22 + 32) != self)
        {
          uint64_t v23 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "-[TRIPBMessage internalClear:]"), @"TRIPBMessage.m", 1119, @"Autocreated extension does not refer back to self.");
        }
        TRIPBClearMessageAutocreator(v22);
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v19);
  }

  self->extensionMap_ = 0;
  self->unknownFields_ = 0;
  if (v25) {
    bzero(self->messageStorage_, *((unsigned int *)v24 + 6));
  }
}

- (id)descriptor
{
  v2 = objc_opt_class();
  return (id)[v2 descriptor];
}

- (void)dealloc
{
  [(TRIPBMessage *)self internalClear:0];
  if (self->autocreator_)
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "-[TRIPBMessage dealloc]"), @"TRIPBMessage.m", 926, @"Autocreator was not cleared before dealloc.");
  }
  if (atomic_load((unint64_t *)&self->readOnlySemaphore_))
  {
    v4 = atomic_load((unint64_t *)&self->readOnlySemaphore_);
    dispatch_release(v4);
  }
  v6.receiver = self;
  v6.super_class = (Class)TRIPBMessage;
  [(TRIPBMessage *)&v6 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [(TRIPBMessage *)self descriptor];
  objc_super v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "messageClass"), "allocWithZone:", a3), "init");
  [(TRIPBMessage *)self copyFieldsInto:v6 zone:a3 descriptor:v5];
  v6[1] = [(TRIPBUnknownFieldSet *)self->unknownFields_ copyWithZone:a3];
  v6[2] = CloneExtensionMap(self->extensionMap_, (uint64_t)a3);
  return v6;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  NSUInteger v5 = *(unsigned int *)([a1 descriptor] + 24);
  return NSAllocateObject((Class)a1, v5, a3);
}

- (TRIPBMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)TRIPBMessage;
  v2 = [(TRIPBMessage *)&v5 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v2->messageStorage_ = (TRIPBMessage_Storage *)((char *)v2 + class_getInstanceSize(v3));
  }
  return v2;
}

- (void)mergeFromData:(id)a3 extensionRegistry:(id)a4
{
  objc_super v6 = [[TRIPBCodedInputStream alloc] initWithData:a3];
  [(TRIPBMessage *)self mergeFromCodedInputStream:v6 extensionRegistry:a4];
  [(TRIPBCodedInputStream *)v6 checkLastTagWas:0];
}

uint64_t __38__TRIPBMessage_resolveInstanceMethod___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return TRIPBGetHasOneof(a2, *(unsigned int *)(a1 + 32));
}

BOOL __38__TRIPBMessage_resolveInstanceMethod___block_invoke(uint64_t a1, uint64_t a2)
{
  return TRIPBGetHasIvar(a2, *(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 36));
}

+ (id)parseFromData:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  objc_super v5 = (void *)[objc_alloc((Class)a1) initWithData:a3 extensionRegistry:a4 error:a5];
  return v5;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  return (id)[a1 parseFromData:a3 extensionRegistry:0 error:a4];
}

uint64_t __38__TRIPBMessage_resolveInstanceMethod___block_invoke_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 64);
  if (v2) {
    v3 = *(void **)(v2 + *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  }
  else {
    v3 = 0;
  }
  return [v3 count];
}

+ (void)initialize
{
  uint64_t v3 = objc_opt_class();
  if (objc_opt_class() == v3)
  {
    [a1 descriptor];
    objc_opt_class();
  }
  else if ([a1 superclass] == v3)
  {
    [a1 descriptor];
  }
}

+ (id)descriptor
{
  id result = (id)_MergedGlobals_7;
  if (!_MergedGlobals_7)
  {
    qword_1EB3EE508 = [[TRIPBFileDescriptor alloc] initWithPackage:@"internal" syntax:2];
    LODWORD(v3) = 0;
    id result = +[TRIPBDescriptor allocDescriptorForClass:objc_opt_class() rootClass:0 file:qword_1EB3EE508 fields:0 fieldCount:0 storageSize:0 flags:v3];
    _MergedGlobals_7 = (uint64_t)result;
  }
  return result;
}

TRIPBAutocreatedArray *__38__TRIPBMessage_resolveInstanceMethod___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a2 + 64);
  if (!v4 || (ArrayForField = *(TRIPBAutocreatedArray **)(v4 + *(unsigned int *)(v3[1] + 24))) == 0)
  {
    TRIPBPrepareReadOnlySemaphore(a2);
    objc_super v6 = atomic_load((unint64_t *)(a2 + 56));
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v7 = *(void *)(a2 + 64);
    if (!v7 || (ArrayForField = *(TRIPBAutocreatedArray **)(v7 + *(unsigned int *)(v3[1] + 24))) == 0)
    {
      ArrayForField = CreateArrayForField(v3, (TRIPBMessage *)a2);
      TRIPBSetAutocreatedRetainedObjectIvarWithField(a2, (uint64_t)v3, (uint64_t)ArrayForField);
    }
    v8 = atomic_load((unint64_t *)(a2 + 56));
    dispatch_semaphore_signal(v8);
  }
  return ArrayForField;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 descriptor];
  if (!v5)
  {
    v48.receiver = a1;
    v48.super_class = (Class)&OBJC_METACLASS___TRIPBMessage;
    return objc_msgSendSuper2(&v48, sel_resolveInstanceMethod_, a3, v34.receiver, v34.super_class);
  }
  objc_super v6 = (void *)v5;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v7 = *(void **)(v5 + 8);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v44 objects:v55 count:16];
  if (!v8) {
    return objc_msgSendSuper2(&v34, sel_resolveInstanceMethod_, a3, a1, &OBJC_METACLASS___TRIPBMessage);
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v45;
LABEL_4:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v45 != v10) {
      objc_enumerationMutation(v7);
    }
    uint64_t v12 = *(void *)(*((void *)&v44 + 1) + 8 * v11);
    int v13 = *(int32x2_t **)(v12 + 8);
    v14 = *(const char **)(v12 + 24);
    if ((v13[3].i16[2] & 0xF02) == 0) {
      break;
    }
    if (v14 == a3)
    {
      if ([(id)v12 fieldType] == 1)
      {
        int v17 = v39;
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        uint64_t v18 = __38__TRIPBMessage_resolveInstanceMethod___block_invoke_4;
      }
      else
      {
        int v17 = v38;
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        uint64_t v18 = __38__TRIPBMessage_resolveInstanceMethod___block_invoke_5;
      }
      v17[2] = v18;
      v17[3] = &__block_descriptor_40_e8__16__0_8ls32l8;
      v17[4] = v12;
      uint64_t v20 = imp_implementationWithBlock(v17);
      BOOL v21 = sel_getArray;
      goto LABEL_72;
    }
    if (*(SEL *)(v12 + 32) == a3)
    {
      char v19 = objc_msgSend((id)objc_msgSend(v6, "file"), "syntax");
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __38__TRIPBMessage_resolveInstanceMethod___block_invoke_6;
      block[3] = &__block_descriptor_41_e11_v24__0_8_16ls32l8;
      block[4] = v12;
      char v37 = v19;
      uint64_t v20 = imp_implementationWithBlock(block);
      BOOL v21 = sel_setArray_;
      goto LABEL_72;
    }
    if (*(SEL *)(v12 + 40) == a3)
    {
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __38__TRIPBMessage_resolveInstanceMethod___block_invoke_7;
      v35[3] = &__block_descriptor_40_e8_Q16__0_8ls32l8;
      v35[4] = v12;
      uint64_t v20 = imp_implementationWithBlock(v35);
      BOOL v21 = sel_getArrayCount;
      goto LABEL_72;
    }
LABEL_18:
    if (v9 == ++v11)
    {
      uint64_t v9 = [v7 countByEnumeratingWithState:&v44 objects:v55 count:16];
      if (v9) {
        goto LABEL_4;
      }
      return objc_msgSendSuper2(&v34, sel_resolveInstanceMethod_, a3, a1, &OBJC_METACLASS___TRIPBMessage);
    }
  }
  if (v14 == a3)
  {
    switch(v13[3].i8[6])
    {
      case 0:
        uint64_t v49 = MEMORY[0x1E4F143A8];
        uint64_t v50 = 3221225472;
        uint64_t v22 = &selRef_getBool;
        uint64_t v23 = &__block_descriptor_40_e8_B16__0_8ls32l8;
        uint64_t v24 = __ResolveIvarGet_block_invoke;
        goto LABEL_52;
      case 1:
        uint64_t v49 = MEMORY[0x1E4F143A8];
        uint64_t v50 = 3221225472;
        uint64_t v22 = &selRef_getFixed32;
        uint64_t v23 = &__block_descriptor_40_e8_I16__0_8ls32l8;
        uint64_t v24 = __ResolveIvarGet_block_invoke_2;
        goto LABEL_52;
      case 2:
        uint64_t v49 = MEMORY[0x1E4F143A8];
        uint64_t v50 = 3221225472;
        uint64_t v22 = &selRef_getSFixed32;
        uint64_t v23 = &__block_descriptor_40_e8_i16__0_8ls32l8;
        uint64_t v24 = __ResolveIvarGet_block_invoke_3;
        goto LABEL_52;
      case 3:
        uint64_t v49 = MEMORY[0x1E4F143A8];
        uint64_t v50 = 3221225472;
        uint64_t v22 = &selRef_getFloat;
        uint64_t v23 = &__block_descriptor_40_e8_f16__0_8ls32l8;
        uint64_t v24 = __ResolveIvarGet_block_invoke_4;
        goto LABEL_52;
      case 4:
        uint64_t v49 = MEMORY[0x1E4F143A8];
        uint64_t v50 = 3221225472;
        uint64_t v22 = &selRef_getFixed64;
        uint64_t v23 = &__block_descriptor_40_e8_Q16__0_8ls32l8;
        uint64_t v24 = __ResolveIvarGet_block_invoke_5;
        goto LABEL_52;
      case 5:
        uint64_t v49 = MEMORY[0x1E4F143A8];
        uint64_t v50 = 3221225472;
        uint64_t v22 = &selRef_getSFixed64;
        uint64_t v23 = &__block_descriptor_40_e8_q16__0_8ls32l8;
        uint64_t v24 = __ResolveIvarGet_block_invoke_6;
        goto LABEL_52;
      case 6:
        uint64_t v49 = MEMORY[0x1E4F143A8];
        uint64_t v50 = 3221225472;
        uint64_t v22 = &selRef_getDouble;
        uint64_t v23 = &__block_descriptor_40_e8_d16__0_8ls32l8;
        uint64_t v24 = __ResolveIvarGet_block_invoke_7;
        goto LABEL_52;
      case 7:
        uint64_t v49 = MEMORY[0x1E4F143A8];
        uint64_t v50 = 3221225472;
        uint64_t v22 = &selRef_getInt32;
        uint64_t v23 = &__block_descriptor_40_e8_i16__0_8ls32l8;
        uint64_t v24 = __ResolveIvarGet_block_invoke_8;
        goto LABEL_52;
      case 8:
        uint64_t v49 = MEMORY[0x1E4F143A8];
        uint64_t v50 = 3221225472;
        uint64_t v22 = &selRef_getInt64;
        uint64_t v23 = &__block_descriptor_40_e8_q16__0_8ls32l8;
        uint64_t v24 = __ResolveIvarGet_block_invoke_9;
        goto LABEL_52;
      case 9:
        uint64_t v49 = MEMORY[0x1E4F143A8];
        uint64_t v50 = 3221225472;
        uint64_t v22 = &selRef_getSInt32;
        uint64_t v23 = &__block_descriptor_40_e8_i16__0_8ls32l8;
        uint64_t v24 = __ResolveIvarGet_block_invoke_10;
        goto LABEL_52;
      case 0xA:
        uint64_t v49 = MEMORY[0x1E4F143A8];
        uint64_t v50 = 3221225472;
        uint64_t v22 = &selRef_getSInt64;
        uint64_t v23 = &__block_descriptor_40_e8_q16__0_8ls32l8;
        uint64_t v24 = __ResolveIvarGet_block_invoke_11;
        goto LABEL_52;
      case 0xB:
        uint64_t v49 = MEMORY[0x1E4F143A8];
        uint64_t v50 = 3221225472;
        uint64_t v22 = &selRef_getUInt32;
        uint64_t v23 = &__block_descriptor_40_e8_I16__0_8ls32l8;
        uint64_t v24 = __ResolveIvarGet_block_invoke_12;
        goto LABEL_52;
      case 0xC:
        uint64_t v49 = MEMORY[0x1E4F143A8];
        uint64_t v50 = 3221225472;
        uint64_t v22 = &selRef_getUInt64;
        uint64_t v23 = &__block_descriptor_40_e8_Q16__0_8ls32l8;
        uint64_t v24 = __ResolveIvarGet_block_invoke_13;
        goto LABEL_52;
      case 0xD:
        uint64_t v49 = MEMORY[0x1E4F143A8];
        uint64_t v50 = 3221225472;
        uint64_t v22 = &selRef_getBytes;
        uint64_t v23 = &__block_descriptor_40_e8__16__0_8ls32l8;
        uint64_t v24 = __ResolveIvarGet_block_invoke_14;
        goto LABEL_52;
      case 0xE:
        uint64_t v49 = MEMORY[0x1E4F143A8];
        uint64_t v50 = 3221225472;
        uint64_t v22 = &selRef_getString;
        uint64_t v23 = &__block_descriptor_40_e8__16__0_8ls32l8;
        uint64_t v24 = __ResolveIvarGet_block_invoke_15;
        goto LABEL_52;
      case 0xF:
        uint64_t v49 = MEMORY[0x1E4F143A8];
        uint64_t v50 = 3221225472;
        uint64_t v22 = &selRef_getMessage;
        uint64_t v23 = &__block_descriptor_40_e8__16__0_8ls32l8;
        uint64_t v24 = __ResolveIvarGet_block_invoke_16;
        goto LABEL_52;
      case 0x10:
        uint64_t v49 = MEMORY[0x1E4F143A8];
        uint64_t v50 = 3221225472;
        uint64_t v22 = &selRef_getGroup;
        uint64_t v23 = &__block_descriptor_40_e8__16__0_8ls32l8;
        uint64_t v24 = __ResolveIvarGet_block_invoke_17;
        goto LABEL_52;
      case 0x11:
        uint64_t v49 = MEMORY[0x1E4F143A8];
        uint64_t v50 = 3221225472;
        uint64_t v22 = &selRef_getEnum;
        uint64_t v23 = &__block_descriptor_40_e8_i16__0_8ls32l8;
        uint64_t v24 = __ResolveIvarGet_block_invoke_18;
LABEL_52:
        long long v51 = v24;
        long long v52 = v23;
        uint64_t v53 = v12;
        goto LABEL_71;
      default:
LABEL_34:
        uint64_t v20 = 0;
        BOOL v21 = 0;
        goto LABEL_72;
    }
  }
  if (*(SEL *)(v12 + 32) != a3)
  {
    if (*(SEL *)(v12 + 40) == a3)
    {
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      int32x2_t v28 = v13[2];
      void v43[2] = __38__TRIPBMessage_resolveInstanceMethod___block_invoke;
      v43[3] = &__block_descriptor_40_e8_B16__0_8l;
      v43[4] = vrev64_s32(v28);
      uint64_t v20 = imp_implementationWithBlock(v43);
      BOOL v21 = sel_getBool;
      goto LABEL_72;
    }
    if (*(SEL *)(v12 + 48) == a3)
    {
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __38__TRIPBMessage_resolveInstanceMethod___block_invoke_2;
      v42[3] = &__block_descriptor_40_e11_v20__0_8B16ls32l8;
      v42[4] = v12;
      uint64_t v20 = imp_implementationWithBlock(v42);
      BOOL v21 = sel_setBool_;
      goto LABEL_72;
    }
    uint64_t v15 = *(void *)(v12 + 16);
    if (v15 && *(SEL *)(v15 + 24) == a3)
    {
      __int32 v29 = v13[2].i32[1];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __38__TRIPBMessage_resolveInstanceMethod___block_invoke_3;
      v40[3] = &__block_descriptor_36_e8_I16__0_8l;
      __int32 v41 = v29;
      uint64_t v20 = imp_implementationWithBlock(v40);
      BOOL v21 = sel_getEnum;
      goto LABEL_72;
    }
    goto LABEL_18;
  }
  char v25 = objc_msgSend((id)objc_msgSend(v6, "file"), "syntax");
  switch(*(unsigned char *)(*(void *)(v12 + 8) + 30))
  {
    case 0:
      uint64_t v49 = MEMORY[0x1E4F143A8];
      uint64_t v50 = 3221225472;
      uint64_t v22 = &selRef_setBool_;
      long long v26 = &__block_descriptor_41_e11_v20__0_8B16ls32l8;
      long long v27 = __ResolveIvarSet_block_invoke;
      break;
    case 1:
      uint64_t v49 = MEMORY[0x1E4F143A8];
      uint64_t v50 = 3221225472;
      uint64_t v22 = &selRef_setFixed32_;
      long long v26 = &__block_descriptor_41_e11_v20__0_8I16ls32l8;
      long long v27 = __ResolveIvarSet_block_invoke_2;
      break;
    case 2:
      uint64_t v49 = MEMORY[0x1E4F143A8];
      uint64_t v50 = 3221225472;
      uint64_t v22 = &selRef_setSFixed32_;
      long long v26 = &__block_descriptor_41_e11_v20__0_8i16ls32l8;
      long long v27 = __ResolveIvarSet_block_invoke_3;
      break;
    case 3:
      uint64_t v49 = MEMORY[0x1E4F143A8];
      uint64_t v50 = 3221225472;
      uint64_t v22 = &selRef_setFloat_;
      long long v26 = &__block_descriptor_41_e11_v20__0_8f16ls32l8;
      long long v27 = __ResolveIvarSet_block_invoke_4;
      break;
    case 4:
      uint64_t v49 = MEMORY[0x1E4F143A8];
      uint64_t v50 = 3221225472;
      uint64_t v22 = &selRef_setFixed64_;
      long long v26 = &__block_descriptor_41_e11_v24__0_8Q16ls32l8;
      long long v27 = __ResolveIvarSet_block_invoke_5;
      break;
    case 5:
      uint64_t v49 = MEMORY[0x1E4F143A8];
      uint64_t v50 = 3221225472;
      uint64_t v22 = &selRef_setSFixed64_;
      long long v26 = &__block_descriptor_41_e11_v24__0_8q16ls32l8;
      long long v27 = __ResolveIvarSet_block_invoke_6;
      break;
    case 6:
      uint64_t v49 = MEMORY[0x1E4F143A8];
      uint64_t v50 = 3221225472;
      uint64_t v22 = &selRef_setDouble_;
      long long v26 = &__block_descriptor_41_e11_v24__0_8d16ls32l8;
      long long v27 = __ResolveIvarSet_block_invoke_7;
      break;
    case 7:
      uint64_t v49 = MEMORY[0x1E4F143A8];
      uint64_t v50 = 3221225472;
      uint64_t v22 = &selRef_setInt32_;
      long long v26 = &__block_descriptor_41_e11_v20__0_8i16ls32l8;
      long long v27 = __ResolveIvarSet_block_invoke_8;
      break;
    case 8:
      uint64_t v49 = MEMORY[0x1E4F143A8];
      uint64_t v50 = 3221225472;
      uint64_t v22 = &selRef_setInt64_;
      long long v26 = &__block_descriptor_41_e11_v24__0_8q16ls32l8;
      long long v27 = __ResolveIvarSet_block_invoke_9;
      break;
    case 9:
      uint64_t v49 = MEMORY[0x1E4F143A8];
      uint64_t v50 = 3221225472;
      uint64_t v22 = &selRef_setSInt32_;
      long long v26 = &__block_descriptor_41_e11_v20__0_8i16ls32l8;
      long long v27 = __ResolveIvarSet_block_invoke_10;
      break;
    case 0xA:
      uint64_t v49 = MEMORY[0x1E4F143A8];
      uint64_t v50 = 3221225472;
      uint64_t v22 = &selRef_setSInt64_;
      long long v26 = &__block_descriptor_41_e11_v24__0_8q16ls32l8;
      long long v27 = __ResolveIvarSet_block_invoke_11;
      break;
    case 0xB:
      uint64_t v49 = MEMORY[0x1E4F143A8];
      uint64_t v50 = 3221225472;
      uint64_t v22 = &selRef_setUInt32_;
      long long v26 = &__block_descriptor_41_e11_v20__0_8I16ls32l8;
      long long v27 = __ResolveIvarSet_block_invoke_12;
      break;
    case 0xC:
      uint64_t v49 = MEMORY[0x1E4F143A8];
      uint64_t v50 = 3221225472;
      uint64_t v22 = &selRef_setUInt64_;
      long long v26 = &__block_descriptor_41_e11_v24__0_8Q16ls32l8;
      long long v27 = __ResolveIvarSet_block_invoke_13;
      break;
    case 0xD:
      uint64_t v49 = MEMORY[0x1E4F143A8];
      uint64_t v50 = 3221225472;
      uint64_t v22 = &selRef_setBytes_;
      long long v26 = &__block_descriptor_41_e11_v24__0_8_16ls32l8;
      long long v27 = __ResolveIvarSet_block_invoke_14;
      break;
    case 0xE:
      uint64_t v49 = MEMORY[0x1E4F143A8];
      uint64_t v50 = 3221225472;
      uint64_t v22 = &selRef_setString_;
      long long v26 = &__block_descriptor_41_e11_v24__0_8_16ls32l8;
      long long v27 = __ResolveIvarSet_block_invoke_15;
      break;
    case 0xF:
      uint64_t v49 = MEMORY[0x1E4F143A8];
      uint64_t v50 = 3221225472;
      uint64_t v22 = &selRef_setMessage_;
      long long v26 = &__block_descriptor_41_e11_v24__0_8_16ls32l8;
      long long v27 = __ResolveIvarSet_block_invoke_16;
      break;
    case 0x10:
      uint64_t v49 = MEMORY[0x1E4F143A8];
      uint64_t v50 = 3221225472;
      uint64_t v22 = &selRef_setGroup_;
      long long v26 = &__block_descriptor_41_e11_v24__0_8_16ls32l8;
      long long v27 = __ResolveIvarSet_block_invoke_17;
      break;
    case 0x11:
      uint64_t v49 = MEMORY[0x1E4F143A8];
      uint64_t v50 = 3221225472;
      uint64_t v22 = &selRef_setEnum_;
      long long v26 = &__block_descriptor_41_e11_v20__0_8i16ls32l8;
      long long v27 = __ResolveIvarSet_block_invoke_18;
      break;
    default:
      goto LABEL_34;
  }
  long long v51 = v27;
  long long v52 = v26;
  uint64_t v53 = v12;
  char v54 = v25;
LABEL_71:
  uint64_t v20 = imp_implementationWithBlock(&v49);
  BOOL v21 = *v22;
LABEL_72:
  if (!v20) {
    return objc_msgSendSuper2(&v34, sel_resolveInstanceMethod_, a3, a1, &OBJC_METACLASS___TRIPBMessage);
  }
  BOOL v30 = 1;
  long long v31 = TRIPBMessageEncodingForSelector(v21, 1);
  long long v32 = (objc_class *)[v6 messageClass];
  if (!class_addMethod(v32, a3, v20, v31)) {
    return TRIPBClassHasSel(v32, a3);
  }
  return v30;
}

TRIPBAutocreatedDictionary *__38__TRIPBMessage_resolveInstanceMethod___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a2 + 64);
  if (!v4 || (MapForField = *(TRIPBAutocreatedDictionary **)(v4 + *(unsigned int *)(v3[1] + 24))) == 0)
  {
    TRIPBPrepareReadOnlySemaphore(a2);
    objc_super v6 = atomic_load((unint64_t *)(a2 + 56));
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v7 = *(void *)(a2 + 64);
    if (!v7 || (MapForField = *(TRIPBAutocreatedDictionary **)(v7 + *(unsigned int *)(v3[1] + 24))) == 0)
    {
      MapForField = CreateMapForField(v3, (TRIPBMessage *)a2);
      TRIPBSetAutocreatedRetainedObjectIvarWithField(a2, (uint64_t)v3, (uint64_t)MapForField);
    }
    uint64_t v8 = atomic_load((unint64_t *)(a2 + 56));
    dispatch_semaphore_signal(v8);
  }
  return MapForField;
}

+ (id)message
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (TRIPBMessage)initWithData:(id)a3 error:(id *)a4
{
  return [(TRIPBMessage *)self initWithData:a3 extensionRegistry:0 error:a4];
}

- (TRIPBMessage)initWithCodedInputStream:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  uint64_t v8 = [(TRIPBMessage *)self init];
  uint64_t v9 = v8;
  if (v8)
  {
    [(TRIPBMessage *)v8 mergeFromCodedInputStream:a3 extensionRegistry:a4];
    if (a5) {
      *a5 = 0;
    }
    if (![(TRIPBMessage *)v9 isInitialized])
    {

      uint64_t v9 = 0;
      if (a5) {
        *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"TRIPBMessageErrorDomain" code:-101 userInfo:0];
      }
    }
  }
  return v9;
}

void __47__TRIPBMessage_copyFieldsInto_zone_descriptor___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (id)[a3 copyWithZone:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setObject:v5 forKey:a2];
}

- (void)clear
{
}

uint64_t __29__TRIPBMessage_isInitialized__block_invoke(uint64_t result, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)(a2[1] + 44) - 15 <= 1)
  {
    uint64_t v6 = result;
    if ([a2 isRepeated])
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id result = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (!result) {
        return result;
      }
      uint64_t v7 = result;
      uint64_t v8 = *(void *)v11;
LABEL_5:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(a3);
        }
        id result = [*(id *)(*((void *)&v10 + 1) + 8 * v9) isInitialized];
        if (!result) {
          break;
        }
        if (v7 == ++v9)
        {
          id result = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
          uint64_t v7 = result;
          if (result) {
            goto LABEL_5;
          }
          return result;
        }
      }
    }
    else
    {
      id result = [a3 isInitialized];
      if (result) {
        return result;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(v6 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (id)data
{
  if (![(TRIPBMessage *)self isInitialized]) {
    return 0;
  }
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", -[TRIPBMessage serializedSize](self, "serializedSize"));
  uint64_t v4 = [[TRIPBCodedOutputStream alloc] initWithData:v3];
  [(TRIPBMessage *)self writeToCodedOutputStream:v4];

  return v3;
}

- (id)delimitedData
{
  unint64_t v3 = [(TRIPBMessage *)self serializedSize];
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (v3 >> 28) {
    uint64_t v6 = 5;
  }
  if (v3 >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (v3 < 0x80) {
    uint64_t v4 = 1;
  }
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:v4 + v3];
  uint64_t v8 = [[TRIPBCodedOutputStream alloc] initWithData:v7];
  [(TRIPBMessage *)self writeDelimitedToCodedOutputStream:v8];

  return v7;
}

- (void)writeToOutputStream:(id)a3
{
  uint64_t v4 = [[TRIPBCodedOutputStream alloc] initWithOutputStream:a3];
  [(TRIPBMessage *)self writeToCodedOutputStream:v4];
  [(TRIPBCodedOutputStream *)v4 flush];
}

- (void)writeToCodedOutputStream:(id)a3
{
  uint64_t v5 = [(TRIPBMessage *)self descriptor];
  uint64_t v6 = (void *)v5[1];
  unint64_t v7 = [v6 count];
  uint64_t v8 = [v5 extensionRanges];
  unsigned int v9 = [v5 extensionRangesCount];
  if (v7) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = v9 == 0;
  }
  if (!v10)
  {
    unint64_t v11 = 0;
    unint64_t v12 = 0;
    unint64_t v13 = v9;
    do
    {
      if (v12 == v7)
      {
        [(TRIPBMessage *)self writeExtensionsToCodedOutputStream:a3 range:*(void *)(v8 + 8 * v11)];
        unint64_t v12 = v7;
        ++v11;
      }
      else if (v11 == v13 {
             || (uint64_t v14 = [v6 objectAtIndexedSubscript:v12],
      }
                 uint64_t v15 = (void *)(v8 + 8 * v11),
                 *(_DWORD *)(*(void *)(v14 + 8) + 16) < *(_DWORD *)v15))
      {
        -[TRIPBMessage writeField:toCodedOutputStream:](self, "writeField:toCodedOutputStream:", [v6 objectAtIndexedSubscript:v12++], a3);
      }
      else
      {
        ++v11;
        [(TRIPBMessage *)self writeExtensionsToCodedOutputStream:a3 range:*v15];
      }
    }
    while (v12 < v7 || v11 < v13);
  }
  char v16 = [v5 isWireFormat];
  unknownFields = self->unknownFields_;
  if (v16)
  {
    [(TRIPBUnknownFieldSet *)unknownFields writeAsMessageSetTo:a3];
  }
  else
  {
    [(TRIPBUnknownFieldSet *)unknownFields writeToCodedOutputStream:a3];
  }
}

- (void)writeDelimitedToOutputStream:(id)a3
{
  uint64_t v4 = [[TRIPBCodedOutputStream alloc] initWithOutputStream:a3];
  [(TRIPBMessage *)self writeDelimitedToCodedOutputStream:v4];
  [(TRIPBCodedOutputStream *)v4 flush];
}

- (void)writeDelimitedToCodedOutputStream:(id)a3
{
  objc_msgSend(a3, "writeRawVarintSizeTAs32:", -[TRIPBMessage serializedSize](self, "serializedSize"));
  [(TRIPBMessage *)self writeToCodedOutputStream:a3];
}

- (void)writeField:(id)a3 toCodedOutputStream:(id)a4
{
  int v7 = [a3 fieldType];
  if (v7
    || TRIPBGetHasIvar((uint64_t)self, *(_DWORD *)(*((void *)a3 + 1) + 20), *(_DWORD *)(*((void *)a3 + 1) + 16)))
  {
    uint64_t v8 = *((void *)a3 + 1);
    uint64_t v9 = *(unsigned int *)(v8 + 16);
    switch(*(unsigned char *)(v8 + 30))
    {
      case 0:
        if (v7 == 1)
        {
          if ([a3 isPackable])
          {
            uint64_t v10 = *((void *)a3 + 1);
            if ((*(_WORD *)(v10 + 28) & 0xF04) != 0) {
              int v11 = 2;
            }
            else {
              int v11 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v10 + 30)];
            }
            uint64_t v65 = v11 | (8 * *(_DWORD *)(v10 + 16));
          }
          else
          {
            uint64_t v65 = 0;
          }
          messageStorage = self->messageStorage_;
          if (messageStorage) {
            uint64_t v82 = *(void *)((char *)messageStorage + *(unsigned int *)(*((void *)a3 + 1) + 24));
          }
          else {
            uint64_t v82 = 0;
          }
          [a4 writeBoolArray:v9 values:v82 tag:v65];
        }
        else
        {
          if (v7) {
            goto LABEL_122;
          }
          BOOL v43 = TRIPBGetMessageBoolField((uint64_t)self, a3);
          [a4 writeBool:v9 value:v43];
        }
        break;
      case 1:
        if (v7 == 1)
        {
          if ([a3 isPackable])
          {
            uint64_t v12 = *((void *)a3 + 1);
            if ((*(_WORD *)(v12 + 28) & 0xF04) != 0) {
              int v13 = 2;
            }
            else {
              int v13 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v12 + 30)];
            }
            uint64_t v66 = v13 | (8 * *(_DWORD *)(v12 + 16));
          }
          else
          {
            uint64_t v66 = 0;
          }
          v83 = self->messageStorage_;
          if (v83) {
            uint64_t v84 = *(void *)((char *)v83 + *(unsigned int *)(*((void *)a3 + 1) + 24));
          }
          else {
            uint64_t v84 = 0;
          }
          [a4 writeFixed32Array:v9 values:v84 tag:v66];
        }
        else
        {
          if (v7) {
            goto LABEL_122;
          }
          uint64_t v44 = TRIPBGetMessageUInt32Field((uint64_t)self, a3);
          [a4 writeFixed32:v9 value:v44];
        }
        break;
      case 2:
        if (v7 == 1)
        {
          if ([a3 isPackable])
          {
            uint64_t v14 = *((void *)a3 + 1);
            if ((*(_WORD *)(v14 + 28) & 0xF04) != 0) {
              int v15 = 2;
            }
            else {
              int v15 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v14 + 30)];
            }
            uint64_t v67 = v15 | (8 * *(_DWORD *)(v14 + 16));
          }
          else
          {
            uint64_t v67 = 0;
          }
          v85 = self->messageStorage_;
          if (v85) {
            uint64_t v86 = *(void *)((char *)v85 + *(unsigned int *)(*((void *)a3 + 1) + 24));
          }
          else {
            uint64_t v86 = 0;
          }
          [a4 writeSFixed32Array:v9 values:v86 tag:v67];
        }
        else
        {
          if (v7) {
            goto LABEL_122;
          }
          uint64_t v45 = TRIPBGetMessageInt32Field((uint64_t)self, a3);
          [a4 writeSFixed32:v9 value:v45];
        }
        break;
      case 3:
        if (v7 == 1)
        {
          if ([a3 isPackable])
          {
            uint64_t v16 = *((void *)a3 + 1);
            if ((*(_WORD *)(v16 + 28) & 0xF04) != 0) {
              int v17 = 2;
            }
            else {
              int v17 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v16 + 30)];
            }
            uint64_t v68 = v17 | (8 * *(_DWORD *)(v16 + 16));
          }
          else
          {
            uint64_t v68 = 0;
          }
          v87 = self->messageStorage_;
          if (v87) {
            uint64_t v88 = *(void *)((char *)v87 + *(unsigned int *)(*((void *)a3 + 1) + 24));
          }
          else {
            uint64_t v88 = 0;
          }
          [a4 writeFloatArray:v9 values:v88 tag:v68];
        }
        else
        {
          if (v7) {
            goto LABEL_122;
          }
          *(float *)&double v46 = TRIPBGetMessageFloatField((uint64_t)self, a3);
          [a4 writeFloat:v9 value:v46];
        }
        break;
      case 4:
        if (v7 == 1)
        {
          if ([a3 isPackable])
          {
            uint64_t v18 = *((void *)a3 + 1);
            if ((*(_WORD *)(v18 + 28) & 0xF04) != 0) {
              int v19 = 2;
            }
            else {
              int v19 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v18 + 30)];
            }
            uint64_t v69 = v19 | (8 * *(_DWORD *)(v18 + 16));
          }
          else
          {
            uint64_t v69 = 0;
          }
          v89 = self->messageStorage_;
          if (v89) {
            uint64_t v90 = *(void *)((char *)v89 + *(unsigned int *)(*((void *)a3 + 1) + 24));
          }
          else {
            uint64_t v90 = 0;
          }
          [a4 writeFixed64Array:v9 values:v90 tag:v69];
        }
        else
        {
          if (v7) {
            goto LABEL_122;
          }
          uint64_t v47 = TRIPBGetMessageUInt64Field((uint64_t)self, a3);
          [a4 writeFixed64:v9 value:v47];
        }
        break;
      case 5:
        if (v7 == 1)
        {
          if ([a3 isPackable])
          {
            uint64_t v20 = *((void *)a3 + 1);
            if ((*(_WORD *)(v20 + 28) & 0xF04) != 0) {
              int v21 = 2;
            }
            else {
              int v21 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v20 + 30)];
            }
            uint64_t v70 = v21 | (8 * *(_DWORD *)(v20 + 16));
          }
          else
          {
            uint64_t v70 = 0;
          }
          v91 = self->messageStorage_;
          if (v91) {
            uint64_t v92 = *(void *)((char *)v91 + *(unsigned int *)(*((void *)a3 + 1) + 24));
          }
          else {
            uint64_t v92 = 0;
          }
          [a4 writeSFixed64Array:v9 values:v92 tag:v70];
        }
        else
        {
          if (v7) {
            goto LABEL_122;
          }
          uint64_t v48 = TRIPBGetMessageInt64Field((uint64_t)self, a3);
          [a4 writeSFixed64:v9 value:v48];
        }
        break;
      case 6:
        if (v7 == 1)
        {
          if ([a3 isPackable])
          {
            uint64_t v22 = *((void *)a3 + 1);
            if ((*(_WORD *)(v22 + 28) & 0xF04) != 0) {
              int v23 = 2;
            }
            else {
              int v23 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v22 + 30)];
            }
            uint64_t v71 = v23 | (8 * *(_DWORD *)(v22 + 16));
          }
          else
          {
            uint64_t v71 = 0;
          }
          v93 = self->messageStorage_;
          if (v93) {
            uint64_t v94 = *(void *)((char *)v93 + *(unsigned int *)(*((void *)a3 + 1) + 24));
          }
          else {
            uint64_t v94 = 0;
          }
          [a4 writeDoubleArray:v9 values:v94 tag:v71];
        }
        else
        {
          if (v7) {
            goto LABEL_122;
          }
          double v49 = TRIPBGetMessageDoubleField((uint64_t)self, a3);
          [a4 writeDouble:v9 value:v49];
        }
        break;
      case 7:
        if (v7 == 1)
        {
          if ([a3 isPackable])
          {
            uint64_t v24 = *((void *)a3 + 1);
            if ((*(_WORD *)(v24 + 28) & 0xF04) != 0) {
              int v25 = 2;
            }
            else {
              int v25 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v24 + 30)];
            }
            uint64_t v72 = v25 | (8 * *(_DWORD *)(v24 + 16));
          }
          else
          {
            uint64_t v72 = 0;
          }
          v95 = self->messageStorage_;
          if (v95) {
            uint64_t v96 = *(void *)((char *)v95 + *(unsigned int *)(*((void *)a3 + 1) + 24));
          }
          else {
            uint64_t v96 = 0;
          }
          [a4 writeInt32Array:v9 values:v96 tag:v72];
        }
        else
        {
          if (v7) {
            goto LABEL_122;
          }
          uint64_t v50 = TRIPBGetMessageInt32Field((uint64_t)self, a3);
          [a4 writeInt32:v9 value:v50];
        }
        break;
      case 8:
        if (v7 == 1)
        {
          if ([a3 isPackable])
          {
            uint64_t v26 = *((void *)a3 + 1);
            if ((*(_WORD *)(v26 + 28) & 0xF04) != 0) {
              int v27 = 2;
            }
            else {
              int v27 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v26 + 30)];
            }
            uint64_t v73 = v27 | (8 * *(_DWORD *)(v26 + 16));
          }
          else
          {
            uint64_t v73 = 0;
          }
          v97 = self->messageStorage_;
          if (v97) {
            uint64_t v98 = *(void *)((char *)v97 + *(unsigned int *)(*((void *)a3 + 1) + 24));
          }
          else {
            uint64_t v98 = 0;
          }
          [a4 writeInt64Array:v9 values:v98 tag:v73];
        }
        else
        {
          if (v7) {
            goto LABEL_122;
          }
          uint64_t v51 = TRIPBGetMessageInt64Field((uint64_t)self, a3);
          [a4 writeInt64:v9 value:v51];
        }
        break;
      case 9:
        if (v7 == 1)
        {
          if ([a3 isPackable])
          {
            uint64_t v28 = *((void *)a3 + 1);
            if ((*(_WORD *)(v28 + 28) & 0xF04) != 0) {
              int v29 = 2;
            }
            else {
              int v29 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v28 + 30)];
            }
            uint64_t v74 = v29 | (8 * *(_DWORD *)(v28 + 16));
          }
          else
          {
            uint64_t v74 = 0;
          }
          v99 = self->messageStorage_;
          if (v99) {
            uint64_t v100 = *(void *)((char *)v99 + *(unsigned int *)(*((void *)a3 + 1) + 24));
          }
          else {
            uint64_t v100 = 0;
          }
          [a4 writeSInt32Array:v9 values:v100 tag:v74];
        }
        else
        {
          if (v7) {
            goto LABEL_122;
          }
          uint64_t v52 = TRIPBGetMessageInt32Field((uint64_t)self, a3);
          [a4 writeSInt32:v9 value:v52];
        }
        break;
      case 0xA:
        if (v7 == 1)
        {
          if ([a3 isPackable])
          {
            uint64_t v30 = *((void *)a3 + 1);
            if ((*(_WORD *)(v30 + 28) & 0xF04) != 0) {
              int v31 = 2;
            }
            else {
              int v31 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v30 + 30)];
            }
            uint64_t v75 = v31 | (8 * *(_DWORD *)(v30 + 16));
          }
          else
          {
            uint64_t v75 = 0;
          }
          v101 = self->messageStorage_;
          if (v101) {
            uint64_t v102 = *(void *)((char *)v101 + *(unsigned int *)(*((void *)a3 + 1) + 24));
          }
          else {
            uint64_t v102 = 0;
          }
          [a4 writeSInt64Array:v9 values:v102 tag:v75];
        }
        else
        {
          if (v7) {
            goto LABEL_122;
          }
          uint64_t v53 = TRIPBGetMessageInt64Field((uint64_t)self, a3);
          [a4 writeSInt64:v9 value:v53];
        }
        break;
      case 0xB:
        if (v7 == 1)
        {
          if ([a3 isPackable])
          {
            uint64_t v32 = *((void *)a3 + 1);
            if ((*(_WORD *)(v32 + 28) & 0xF04) != 0) {
              int v33 = 2;
            }
            else {
              int v33 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v32 + 30)];
            }
            uint64_t v76 = v33 | (8 * *(_DWORD *)(v32 + 16));
          }
          else
          {
            uint64_t v76 = 0;
          }
          v103 = self->messageStorage_;
          if (v103) {
            uint64_t v104 = *(void *)((char *)v103 + *(unsigned int *)(*((void *)a3 + 1) + 24));
          }
          else {
            uint64_t v104 = 0;
          }
          [a4 writeUInt32Array:v9 values:v104 tag:v76];
        }
        else
        {
          if (v7) {
            goto LABEL_122;
          }
          uint64_t v54 = TRIPBGetMessageUInt32Field((uint64_t)self, a3);
          [a4 writeUInt32:v9 value:v54];
        }
        break;
      case 0xC:
        if (v7 == 1)
        {
          if ([a3 isPackable])
          {
            uint64_t v34 = *((void *)a3 + 1);
            if ((*(_WORD *)(v34 + 28) & 0xF04) != 0) {
              int v35 = 2;
            }
            else {
              int v35 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v34 + 30)];
            }
            uint64_t v77 = v35 | (8 * *(_DWORD *)(v34 + 16));
          }
          else
          {
            uint64_t v77 = 0;
          }
          v105 = self->messageStorage_;
          if (v105) {
            uint64_t v106 = *(void *)((char *)v105 + *(unsigned int *)(*((void *)a3 + 1) + 24));
          }
          else {
            uint64_t v106 = 0;
          }
          [a4 writeUInt64Array:v9 values:v106 tag:v77];
        }
        else
        {
          if (v7) {
            goto LABEL_122;
          }
          uint64_t v55 = TRIPBGetMessageUInt64Field((uint64_t)self, a3);
          [a4 writeUInt64:v9 value:v55];
        }
        break;
      case 0xD:
        uint64_t v36 = self->messageStorage_;
        if (v36) {
          char v37 = *(void **)((char *)v36 + *(unsigned int *)(v8 + 24));
        }
        else {
          char v37 = 0;
        }
        if (v7 == 1)
        {
          uint64_t v58 = *(unsigned int *)(v8 + 16);
          [a4 writeBytesArray:v58 values:v37];
        }
        else
        {
          if (v7) {
            goto LABEL_158;
          }
          uint64_t v59 = *(unsigned int *)(v8 + 16);
          [a4 writeBytes:v59 value:v37];
        }
        break;
      case 0xE:
        unsigned int v38 = self->messageStorage_;
        if (v38) {
          char v37 = *(void **)((char *)v38 + *(unsigned int *)(v8 + 24));
        }
        else {
          char v37 = 0;
        }
        if (v7 == 1)
        {
          uint64_t v60 = *(unsigned int *)(v8 + 16);
          [a4 writeStringArray:v60 values:v37];
        }
        else
        {
          if (v7) {
            goto LABEL_158;
          }
          uint64_t v61 = *(unsigned int *)(v8 + 16);
          [a4 writeString:v61 value:v37];
        }
        break;
      case 0xF:
        unint64_t v39 = self->messageStorage_;
        if (v39) {
          char v37 = *(void **)((char *)v39 + *(unsigned int *)(v8 + 24));
        }
        else {
          char v37 = 0;
        }
        if (v7 == 1)
        {
          uint64_t v62 = *(unsigned int *)(v8 + 16);
          [a4 writeMessageArray:v62 values:v37];
        }
        else
        {
          if (v7) {
            goto LABEL_158;
          }
          uint64_t v63 = *(unsigned int *)(v8 + 16);
          [a4 writeMessage:v63 value:v37];
        }
        break;
      case 0x10:
        v40 = self->messageStorage_;
        if (v40) {
          char v37 = *(void **)((char *)v40 + *(unsigned int *)(v8 + 24));
        }
        else {
          char v37 = 0;
        }
        if (v7 == 1)
        {
          uint64_t v64 = *(unsigned int *)(v8 + 16);
          [a4 writeGroupArray:v64 values:v37];
        }
        else if (v7)
        {
LABEL_158:
          if ([a3 mapKeyDataType] != 14)
          {
            v57 = v37;
            goto LABEL_163;
          }
          TRIPBDictionaryWriteToStreamInternalHelper(a4, v37, a3);
        }
        else
        {
          uint64_t v80 = *(unsigned int *)(v8 + 16);
          [a4 writeGroup:v80 value:v37];
        }
        break;
      case 0x11:
        if (v7 == 1)
        {
          if ([a3 isPackable])
          {
            uint64_t v41 = *((void *)a3 + 1);
            if ((*(_WORD *)(v41 + 28) & 0xF04) != 0) {
              int v42 = 2;
            }
            else {
              int v42 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v41 + 30)];
            }
            uint64_t v78 = v42 | (8 * *(_DWORD *)(v41 + 16));
          }
          else
          {
            uint64_t v78 = 0;
          }
          v107 = self->messageStorage_;
          if (v107) {
            uint64_t v108 = *(void *)((char *)v107 + *(unsigned int *)(*((void *)a3 + 1) + 24));
          }
          else {
            uint64_t v108 = 0;
          }
          [a4 writeEnumArray:v9 values:v108 tag:v78];
        }
        else if (v7)
        {
LABEL_122:
          uint64_t v56 = self->messageStorage_;
          if (v56) {
            v57 = *(void **)((char *)v56 + *(unsigned int *)(v8 + 24));
          }
          else {
            v57 = 0;
          }
LABEL_163:
          [v57 writeToCodedOutputStream:a4 asField:a3];
        }
        else
        {
          uint64_t v79 = TRIPBGetMessageInt32Field((uint64_t)self, a3);
          [a4 writeEnum:v9 value:v79];
        }
        break;
      default:
        return;
    }
  }
}

- (id)getExtension:(id)a3
{
  CheckExtension((uint64_t)self, a3);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->extensionMap_ objectForKey:a3];
  if (v5) {
    return v5;
  }
  if ([a3 isRepeated]) {
    return 0;
  }
  if (*(unsigned __int8 *)(*((void *)a3 + 1) + 44) - 15 < 2)
  {
    TRIPBPrepareReadOnlySemaphore((uint64_t)self);
    uint64_t v6 = atomic_load((unint64_t *)&self->readOnlySemaphore_);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v5 = (void *)[(NSMutableDictionary *)self->autocreatedExtensionMap_ objectForKey:a3];
    if (!v5)
    {
      uint64_t v5 = objc_alloc_init((Class)[a3 msgClass]);
      v5[4] = self;
      v5[6] = a3;
      autocreatedExtensionMap = self->autocreatedExtensionMap_;
      if (!autocreatedExtensionMap)
      {
        autocreatedExtensionMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        self->autocreatedExtensionMap_ = autocreatedExtensionMap;
      }
      [(NSMutableDictionary *)autocreatedExtensionMap setObject:v5 forKey:a3];
    }
    uint64_t v8 = atomic_load((unint64_t *)&self->readOnlySemaphore_);
    dispatch_semaphore_signal(v8);
    return v5;
  }
  return (id)[a3 defaultValue];
}

- (id)getExistingExtension:(id)a3
{
  return (id)[(NSMutableDictionary *)self->extensionMap_ objectForKey:a3];
}

- (BOOL)hasExtension:(id)a3
{
  return [(NSMutableDictionary *)self->extensionMap_ objectForKey:a3] != 0;
}

- (id)extensionsCurrentlySet
{
  extensionMap = self->extensionMap_;
  if (extensionMap) {
    return (id)[(NSMutableDictionary *)extensionMap allKeys];
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (void)writeExtensionsToCodedOutputStream:(id)a3 range:(TRIPBExtensionRange)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v7 = objc_msgSend((id)-[NSMutableDictionary allKeys](self->extensionMap_, "allKeys"), "sortedArrayUsingSelector:", sel_compareByFieldNumber_);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unsigned int v13 = [v12 fieldNumber];
        if (v13 >= a4.var0 && v13 < a4.var1) {
          TRIPBWriteExtensionValueToOutputStream((uint64_t)v12, (void *)[(NSMutableDictionary *)self->extensionMap_ objectForKey:v12], a3);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)setExtension:(id)a3 value:(id)a4
{
  if (a4)
  {
    CheckExtension((uint64_t)self, a3);
    if ([a3 isRepeated]) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Must call addExtension() for repeated types."];
    }
    extensionMap = self->extensionMap_;
    if (!extensionMap)
    {
      extensionMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      self->extensionMap_ = extensionMap;
    }
    [(NSMutableDictionary *)extensionMap setObject:a4 forKey:a3];
    if (*(unsigned __int8 *)(*((void *)a3 + 1) + 44) - 15 <= 1
      && ([a3 isRepeated] & 1) == 0)
    {
      id v8 = (id)[(NSMutableDictionary *)self->autocreatedExtensionMap_ objectForKey:a3];
      [(NSMutableDictionary *)self->autocreatedExtensionMap_ removeObjectForKey:a3];
      TRIPBClearMessageAutocreator((uint64_t)v8);
    }
    TRIPBBecomeVisibleToAutocreator(self);
  }
  else
  {
    -[TRIPBMessage clearExtension:](self, "clearExtension:");
  }
}

- (void)addExtension:(id)a3 value:(id)a4
{
  CheckExtension((uint64_t)self, a3);
  if (([a3 isRepeated] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Must call setExtension() for singular types."];
  }
  extensionMap = self->extensionMap_;
  if (!extensionMap)
  {
    extensionMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->extensionMap_ = extensionMap;
  }
  id v8 = (void *)[(NSMutableDictionary *)extensionMap objectForKey:a3];
  if (!v8)
  {
    id v8 = (void *)[MEMORY[0x1E4F1CA48] array];
    [(NSMutableDictionary *)self->extensionMap_ setObject:v8 forKey:a3];
  }
  [v8 addObject:a4];
  TRIPBBecomeVisibleToAutocreator(self);
}

- (void)setExtension:(id)a3 index:(unint64_t)a4 value:(id)a5
{
  CheckExtension((uint64_t)self, a3);
  if (([a3 isRepeated] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Must call setExtension() for singular types."];
  }
  extensionMap = self->extensionMap_;
  if (!extensionMap)
  {
    extensionMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->extensionMap_ = extensionMap;
  }
  objc_msgSend((id)-[NSMutableDictionary objectForKey:](extensionMap, "objectForKey:", a3), "replaceObjectAtIndex:withObject:", a4, a5);
  TRIPBBecomeVisibleToAutocreator(self);
}

- (void)clearExtension:(id)a3
{
  CheckExtension((uint64_t)self, a3);
  if ([(NSMutableDictionary *)self->extensionMap_ objectForKey:a3])
  {
    [(NSMutableDictionary *)self->extensionMap_ removeObjectForKey:a3];
    TRIPBBecomeVisibleToAutocreator(self);
  }
}

- (void)mergeDelimitedFromCodedInputStream:(id)a3 extensionRegistry:(id)a4
{
  uint64_t v4 = *((void *)a3 + 3);
  if (v4 != *((void *)a3 + 2) && v4 != *((void *)a3 + 4))
  {
    uint64_t RetainedBytesNoCopy = TRIPBCodedInputStreamReadRetainedBytesNoCopy((uint64_t *)a3 + 1);
    if (RetainedBytesNoCopy)
    {
      id v8 = (id)RetainedBytesNoCopy;
      [(TRIPBMessage *)self mergeFromData:RetainedBytesNoCopy extensionRegistry:a4];
    }
  }
}

+ (id)parseFromCodedInputStream:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithCodedInputStream:a3 extensionRegistry:a4 error:a5];
  return v5;
}

+ (id)parseDelimitedFromCodedInputStream:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  id v8 = objc_alloc_init((Class)a1);
  [v8 mergeDelimitedFromCodedInputStream:a3 extensionRegistry:a4];
  if (a5) {
    *a5 = 0;
  }
  if (!v8) {
    return 0;
  }
  int v9 = [v8 isInitialized];
  char v10 = v9;
  if (v9) {
    id result = v8;
  }
  else {
    id result = 0;
  }
  if (a5)
  {
    if ((v10 & 1) == 0)
    {
      uint64_t v12 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"TRIPBMessageErrorDomain" code:-101 userInfo:0];
      id result = 0;
      *a5 = v12;
    }
  }
  return result;
}

- (TRIPBUnknownFieldSet)unknownFields
{
  return self->unknownFields_;
}

- (void)setUnknownFields:(id)a3
{
  unknownFields = self->unknownFields_;
  if (unknownFields != a3)
  {

    self->unknownFields_ = (TRIPBUnknownFieldSet *)[a3 copy];
    TRIPBBecomeVisibleToAutocreator(self);
  }
}

- (void)parseMessageSet:(id)a3 extensionRegistry:(id)a4
{
  int v7 = 0;
  id v8 = 0;
  uint64_t RawVarint64 = 0;
  char v10 = (uint64_t *)((char *)a3 + 8);
LABEL_2:
  uint64_t v11 = RawVarint64;
  while (1)
  {
    uint64_t Tag = TRIPBCodedInputStreamReadTag((uint64_t)v10);
    if (!Tag) {
      break;
    }
    if (Tag == 26)
    {
      id v8 = (id)TRIPBCodedInputStreamReadRetainedBytesNoCopy(v10);
    }
    else if (Tag == 16)
    {
      uint64_t RawVarint64 = ReadRawVarint64(v10);
      uint64_t v11 = 0;
      if (RawVarint64)
      {
        int v7 = objc_msgSend(a4, "extensionForDescriptor:fieldNumber:", -[TRIPBMessage descriptor](self, "descriptor"), RawVarint64);
        goto LABEL_2;
      }
    }
    else if (([a3 skipField:Tag] & 1) == 0)
    {
      break;
    }
  }
  [a3 checkLastTagWas:12];
  if (v8 && v11)
  {
    if (v7)
    {
      long long v15 = [[TRIPBCodedInputStream alloc] initWithData:v8];
      TRIPBExtensionMergeFromInputStream(v7, [v7 isPackable], (uint64_t *)v15, (uint64_t)a4, self);
    }
    else
    {
      UnknownFields = (void *)GetOrMakeUnknownFields(self);
      uint64_t v14 = [MEMORY[0x1E4F1C9B8] dataWithData:v8];
      [UnknownFields mergeMessageSetMessage:v11 data:v14];
    }
  }
}

- (BOOL)parseUnknownField:(id)a3 extensionRegistry:(id)a4 tag:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v9 = a5 >> 3;
  id v10 = [(TRIPBMessage *)self descriptor];
  uint64_t v11 = (void *)[a4 extensionForDescriptor:v10 fieldNumber:v9];
  if (v11)
  {
    uint64_t v12 = v11;
    if ([v11 wireType] == (v5 & 7))
    {
      int v13 = [v12 isPackable];
LABEL_4:
      TRIPBExtensionMergeFromInputStream(v12, v13, (uint64_t *)a3, (uint64_t)a4, self);
LABEL_8:
      LOBYTE(v15) = 1;
      return v15;
    }
    if ([v12 isRepeated]
      && *(unsigned __int8 *)(v12[1] + 44) - 13 >= 4
      && [v12 alternateWireType] == (v5 & 7))
    {
      int v13 = [v12 isPackable] ^ 1;
      goto LABEL_4;
    }
  }
  else
  {
    int v14 = [v10 isWireFormat];
    if (v5 == 11 && v14)
    {
      [(TRIPBMessage *)self parseMessageSet:a3 extensionRegistry:a4];
      goto LABEL_8;
    }
  }
  int v15 = +[TRIPBUnknownFieldSet isFieldTag:v5];
  if (v15)
  {
    UnknownFields = (void *)GetOrMakeUnknownFields(self);
    LOBYTE(v15) = [UnknownFields mergeFieldFrom:v5 input:a3];
  }
  return v15;
}

- (void)addUnknownMapEntry:(int)a3 value:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  UnknownFields = (void *)GetOrMakeUnknownFields(self);
  [UnknownFields addUnknownMapEntry:v5 value:a4];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  if (([v5 isSubclassOfClass:v6] & 1) == 0 && (objc_msgSend(v6, "isSubclassOfClass:", v5) & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Classes must match %@ != %@", v5, v6 format];
  }
  TRIPBBecomeVisibleToAutocreator(self);
  uint64_t v68 = self;
  int v7 = (void *)[(id)objc_opt_class() descriptor];
  int v8 = objc_msgSend((id)objc_msgSend(v7, "file"), "syntax");
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v9 = (void *)v7[1];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v77 objects:v83 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v78 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        int v15 = [v14 fieldType];
        if (v15 == 1)
        {
          uint64_t v21 = *((void *)a3 + 8);
          if (v21)
          {
            uint64_t v22 = v14[1];
            uint64_t v23 = *(void *)(v21 + *(unsigned int *)(v22 + 24));
            if (v23)
            {
              int v24 = *(unsigned __int8 *)(v22 + 30);
              if ((v24 - 13) > 3)
              {
                ArrayIvarWithField = GetOrCreateArrayIvarWithField(v68, v14, v8);
                if (v24 == 17) {
                  [(TRIPBAutocreatedArray *)ArrayIvarWithField addRawValuesFromArray:v23];
                }
                else {
                  [(TRIPBAutocreatedArray *)ArrayIvarWithField addValuesFromArray:v23];
                }
              }
              else
              {
                [(TRIPBAutocreatedArray *)GetOrCreateArrayIvarWithField(v68, v14, v8) addObjectsFromArray:v23];
              }
            }
          }
        }
        else if (v15)
        {
          uint64_t v25 = *((void *)a3 + 8);
          if (v25)
          {
            uint64_t v26 = *(void *)(v25 + *(unsigned int *)(v14[1] + 24));
            if (v26)
            {
              int v27 = [v14 mapKeyDataType];
              int v28 = *(unsigned __int8 *)(v14[1] + 30);
              if ((v27 - 13) > 3 || (v28 - 13) > 3)
              {
                MapIvarWithField = GetOrCreateMapIvarWithField(v68, v14, v8);
                if (v28 == 17)
                {
                  [(TRIPBAutocreatedDictionary *)MapIvarWithField addRawEntriesFromDictionary:v26];
                  continue;
                }
              }
              else
              {
                MapIvarWithField = GetOrCreateMapIvarWithField(v68, v14, v8);
              }
              [(TRIPBAutocreatedDictionary *)MapIvarWithField addEntriesFromDictionary:v26];
            }
          }
        }
        else
        {
          uint64_t v16 = v14[1];
          int v18 = *(_DWORD *)(v16 + 16);
          unsigned int v17 = *(_DWORD *)(v16 + 20);
          if (TRIPBGetHasIvar((uint64_t)a3, v17, v18))
          {
            uint64_t v19 = v14[1];
            switch(*(unsigned char *)(v19 + 30))
            {
              case 0:
                BOOL v38 = TRIPBGetMessageBoolField((uint64_t)a3, v14);
                TRIPBSetBoolIvarWithFieldInternal(v68, (uint64_t)v14, v38, v8);
                break;
              case 1:
              case 0xB:
                int v33 = TRIPBGetMessageUInt32Field((uint64_t)a3, v14);
                TRIPBSetUInt32IvarWithFieldInternal(v68, (uint64_t)v14, v33, v8);
                break;
              case 2:
              case 7:
              case 9:
              case 0x11:
                int v20 = TRIPBGetMessageInt32Field((uint64_t)a3, v14);
                TRIPBSetInt32IvarWithFieldInternal(v68, (uint64_t)v14, v20, v8);
                break;
              case 3:
                float v39 = TRIPBGetMessageFloatField((uint64_t)a3, v14);
                TRIPBSetFloatIvarWithFieldInternal(v68, (uint64_t)v14, v8, v39);
                break;
              case 4:
              case 0xC:
                uint64_t v34 = TRIPBGetMessageUInt64Field((uint64_t)a3, v14);
                TRIPBSetUInt64IvarWithFieldInternal(v68, (uint64_t)v14, v34, v8);
                break;
              case 5:
              case 8:
              case 0xA:
                uint64_t v32 = TRIPBGetMessageInt64Field((uint64_t)a3, v14);
                TRIPBSetInt64IvarWithFieldInternal(v68, (uint64_t)v14, v32, v8);
                break;
              case 6:
                double v40 = TRIPBGetMessageDoubleField((uint64_t)a3, v14);
                TRIPBSetDoubleIvarWithFieldInternal(v68, (uint64_t)v14, v8, v40);
                break;
              case 0xD:
              case 0xE:
                uint64_t v35 = *((void *)a3 + 8);
                if (v35) {
                  uint64_t v36 = *(void **)(v35 + *(unsigned int *)(v19 + 24));
                }
                else {
                  uint64_t v36 = 0;
                }
                uint64_t v41 = v68;
                id v42 = v36;
                goto LABEL_48;
              case 0xF:
              case 0x10:
                uint64_t v37 = *((void *)a3 + 8);
                if (v37) {
                  obuint64_t j = *(id *)(v37 + *(unsigned int *)(v19 + 24));
                }
                else {
                  obuint64_t j = 0;
                }
                uint64_t v41 = v68;
                if (TRIPBGetHasIvar((uint64_t)v68, v17, v18))
                {
                  messageStorage = v68->messageStorage_;
                  if (messageStorage) {
                    uint64_t v44 = *(void **)((char *)messageStorage + *(unsigned int *)(v14[1] + 24));
                  }
                  else {
                    uint64_t v44 = 0;
                  }
                  [v44 mergeFrom:obj];
                }
                else
                {
                  id v42 = (id)[obj copy];
LABEL_48:
                  TRIPBSetRetainedObjectIvarWithFieldInternal(v41, (uint64_t)v14, v42, v8);
                }
                break;
              default:
                continue;
            }
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v77 objects:v83 count:16];
    }
    while (v11);
  }
  uint64_t v45 = v68;
  unknownFields = v68->unknownFields_;
  uint64_t v47 = [a3 unknownFields];
  if (unknownFields) {
    [(TRIPBUnknownFieldSet *)unknownFields mergeUnknownFields:v47];
  }
  else {
    [(TRIPBMessage *)v68 setUnknownFields:v47];
  }
  if ([*((id *)a3 + 2) count])
  {
    if (!v68->extensionMap_)
    {
      uint64_t v63 = (void *)*((void *)a3 + 2);
      uint64_t v64 = MEMORY[0x1996FEC50](v68);
      v68->extensionMap_ = (NSMutableDictionary *)CloneExtensionMap(v63, v64);
      return;
    }
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id obja = (id)*((void *)a3 + 2);
    uint64_t v48 = [obja countByEnumeratingWithState:&v73 objects:v82 count:16];
    if (!v48) {
      return;
    }
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v74;
    uint64_t v65 = *(void *)v74;
    do
    {
      for (uint64_t j = 0; j != v49; ++j)
      {
        if (*(void *)v74 != v50) {
          objc_enumerationMutation(obja);
        }
        uint64_t v52 = *(void **)(*((void *)&v73 + 1) + 8 * j);
        uint64_t v53 = (void *)[*((id *)a3 + 2) objectForKey:v52];
        id v54 = (id)[(NSMutableDictionary *)v45->extensionMap_ objectForKey:v52];
        unsigned int v55 = *(unsigned __int8 *)(v52[1] + 44) - 15;
        if ([v52 isRepeated])
        {
          if (!v54)
          {
            id v54 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [(NSMutableDictionary *)v45->extensionMap_ setObject:v54 forKey:v52];
          }
          if (v55 > 1)
          {
            [v54 addObjectsFromArray:v53];
            continue;
          }
          long long v71 = 0u;
          long long v72 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          uint64_t v56 = [v53 countByEnumeratingWithState:&v69 objects:v81 count:16];
          if (v56)
          {
            uint64_t v57 = v56;
            uint64_t v58 = *(void *)v70;
            do
            {
              for (uint64_t k = 0; k != v57; ++k)
              {
                if (*(void *)v70 != v58) {
                  objc_enumerationMutation(v53);
                }
                uint64_t v60 = (void *)[*(id *)(*((void *)&v69 + 1) + 8 * k) copy];
                [v54 addObject:v60];
              }
              uint64_t v57 = [v53 countByEnumeratingWithState:&v69 objects:v81 count:16];
            }
            while (v57);
          }
        }
        else
        {
          if (v55 > 1)
          {
            [(NSMutableDictionary *)v45->extensionMap_ setObject:v53 forKey:v52];
            continue;
          }
          if (v54)
          {
            [v54 mergeFrom:v53];
          }
          else
          {
            uint64_t v61 = (void *)[v53 copy];
            [(NSMutableDictionary *)v45->extensionMap_ setObject:v61 forKey:v52];
          }
        }
        uint64_t v45 = v68;
        uint64_t v50 = v65;
        if (([v52 isRepeated] & 1) == 0)
        {
          id v62 = (id)[(NSMutableDictionary *)v68->autocreatedExtensionMap_ objectForKey:v52];
          [(NSMutableDictionary *)v68->autocreatedExtensionMap_ removeObjectForKey:v52];
          TRIPBClearMessageAutocreator((uint64_t)v62);
        }
      }
      uint64_t v49 = [obja countByEnumeratingWithState:&v73 objects:v82 count:16];
    }
    while (v49);
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (a3 == self) {
    goto LABEL_45;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (uint64_t v5 = [(id)objc_opt_class() descriptor], objc_msgSend((id)objc_opt_class(), "descriptor") != v5))
  {
LABEL_4:
    LOBYTE(v6) = 0;
    return v6;
  }
  uint64_t v31 = *((void *)a3 + 8);
  messageStorage = self->messageStorage_;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  int v7 = *(void **)(v5 + 8);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v33 + 1) + 8 * v11);
        uint64_t v13 = *(void *)(v12 + 8);
        if ((*(_WORD *)(v13 + 28) & 0xF02) != 0)
        {
          int v14 = self->messageStorage_;
          if (v14) {
            int v15 = *(void **)((char *)v14 + *(unsigned int *)(v13 + 24));
          }
          else {
            int v15 = 0;
          }
          uint64_t v21 = *((void *)a3 + 8);
          if (v21) {
            uint64_t v22 = *(void **)(v21 + *(unsigned int *)(v13 + 24));
          }
          else {
            uint64_t v22 = 0;
          }
          if ([v15 count] || objc_msgSend(v22, "count"))
          {
            uint64_t v23 = v15;
            int v24 = v22;
LABEL_27:
            if (([v23 isEqual:v24] & 1) == 0) {
              goto LABEL_4;
            }
          }
        }
        else
        {
          int v17 = *(_DWORD *)(v13 + 16);
          unsigned int v16 = *(_DWORD *)(v13 + 20);
          int HasIvar = TRIPBGetHasIvar((uint64_t)self, v16, v17);
          int v19 = TRIPBGetHasIvar((uint64_t)a3, v16, v17);
          if (HasIvar) {
            BOOL v20 = v19 == 0;
          }
          else {
            BOOL v20 = 1;
          }
          if (!v20)
          {
            uint64_t v25 = *(void *)(v12 + 8);
            uint64_t v26 = *(unsigned int *)(v25 + 24);
            switch(*(unsigned char *)(v25 + 30))
            {
              case 0:
                BOOL v27 = TRIPBGetHasIvar((uint64_t)self, *(_DWORD *)(v25 + 24), 0);
                if (v27 != TRIPBGetHasIvar((uint64_t)a3, v26, 0)) {
                  goto LABEL_4;
                }
                goto LABEL_28;
              case 1:
              case 2:
              case 3:
              case 7:
              case 9:
              case 0xB:
              case 0x11:
                if (*(_DWORD *)((char *)messageStorage + v26) != *(_DWORD *)(v31 + v26)) {
                  goto LABEL_4;
                }
                goto LABEL_28;
              case 4:
              case 5:
              case 6:
              case 8:
              case 0xA:
              case 0xC:
                if (*(void *)((char *)messageStorage + v26) != *(void *)(v31 + v26)) {
                  goto LABEL_4;
                }
                goto LABEL_28;
              case 0xD:
              case 0xE:
              case 0xF:
              case 0x10:
                uint64_t v23 = *(void **)((char *)messageStorage + v26);
                int v24 = *(void **)(v31 + v26);
                goto LABEL_27;
              default:
                goto LABEL_28;
            }
          }
          if (HasIvar != v19) {
            goto LABEL_4;
          }
        }
LABEL_28:
        ++v11;
      }
      while (v9 != v11);
      uint64_t v28 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
      uint64_t v9 = v28;
    }
    while (v28);
  }
  if (!-[NSMutableDictionary count](self->extensionMap_, "count") && ![*((id *)a3 + 2) count]
    || (int v6 = [(NSMutableDictionary *)self->extensionMap_ isEqual:*((void *)a3 + 2)]) != 0)
  {
    if ((int v29 = (void *)*((void *)a3 + 1),
          ![(TRIPBUnknownFieldSet *)self->unknownFields_ countOfFields])
      && ![v29 countOfFields]
      || (int v6 = [(TRIPBUnknownFieldSet *)self->unknownFields_ isEqual:v29]) != 0)
    {
LABEL_45:
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (unint64_t)hash
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(id)objc_opt_class() descriptor];
  messageStorage = self->messageStorage_;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = *(void **)(v3 + 8);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = *(void *)(v10 + 8);
        if ((*(_WORD *)(v11 + 28) & 0xF02) != 0)
        {
          uint64_t v12 = self->messageStorage_;
          if (v12) {
            uint64_t v13 = *(void **)((char *)v12 + *(unsigned int *)(v11 + 24));
          }
          else {
            uint64_t v13 = 0;
          }
          uint64_t v17 = [v13 count];
          if (v17) {
            unint64_t v3 = v17 + 19 * (*(unsigned int *)(*(void *)(v10 + 8) + 16) + 19 * v3);
          }
        }
        else if (TRIPBGetHasIvar((uint64_t)self, *(_DWORD *)(v11 + 20), *(_DWORD *)(v11 + 16)))
        {
          uint64_t v14 = *(void *)(v10 + 8);
          uint64_t v15 = *(unsigned int *)(v14 + 24);
          switch(*(unsigned char *)(v14 + 30))
          {
            case 0:
              unint64_t v3 = 19 * v3 + TRIPBGetHasIvar((uint64_t)self, v15, 0);
              continue;
            case 1:
            case 2:
            case 3:
            case 7:
            case 9:
            case 0xB:
            case 0x11:
              uint64_t v16 = *(unsigned int *)((char *)messageStorage + v15);
              goto LABEL_16;
            case 4:
            case 5:
            case 6:
            case 8:
            case 0xA:
            case 0xC:
              uint64_t v16 = *(void *)((char *)messageStorage + v15);
LABEL_16:
              unint64_t v3 = v16 + 19 * v3;
              continue;
            case 0xD:
            case 0xE:
              uint64_t v18 = [*(id *)((char *)messageStorage + v15) hash];
              goto LABEL_19;
            case 0xF:
            case 0x10:
              unint64_t v3 = *(unsigned int *)(v14 + 16) + 19 * v3;
              uint64_t v18 = [(id)objc_opt_class() descriptor];
LABEL_19:
              unint64_t v3 = v18 + 19 * v3;
              break;
            default:
              continue;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = TRIPBTextFormatForMessage(self, @"    ");
  return (id)[NSString stringWithFormat:@"<%@ %p>: {\n%@}", objc_opt_class(), self, v3];
}

- (unint64_t)serializedSize
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  uint64_t v82 = (void *)[(id)objc_opt_class() descriptor];
  obuint64_t j = (id)v82[1];
  uint64_t v89 = [obj countByEnumeratingWithState:&v128 objects:v137 count:16];
  if (!v89)
  {
    uint64_t v3 = 0;
    goto LABEL_201;
  }
  uint64_t v3 = 0;
  uint64_t v88 = *(void *)v129;
  v83 = self;
  do
  {
    for (uint64_t i = 0; i != v89; ++i)
    {
      if (*(void *)v129 != v88) {
        objc_enumerationMutation(obj);
      }
      uint64_t v5 = *(void **)(*((void *)&v128 + 1) + 8 * i);
      int v6 = [v5 fieldType];
      uint64_t v7 = v5[1];
      int v8 = *(unsigned __int8 *)(v7 + 30);
      if (v6 == 1)
      {
        messageStorage = self->messageStorage_;
        if (messageStorage) {
          uint64_t v14 = *(void **)((char *)messageStorage + *(unsigned int *)(v7 + 24));
        }
        else {
          uint64_t v14 = 0;
        }
        uint64_t v20 = [v14 count];
        if (v20)
        {
          uint64_t v84 = v20;
          uint64_t v85 = v3;
          uint64_t v124 = 0;
          v125 = &v124;
          uint64_t v126 = 0x2020000000;
          uint64_t v127 = 0;
          int v87 = v8;
          switch(v8)
          {
            case 0:
              v123[0] = MEMORY[0x1E4F143A8];
              v123[1] = 3221225472;
              v123[2] = __30__TRIPBMessage_serializedSize__block_invoke;
              v123[3] = &unk_1E576BE58;
              v123[4] = &v124;
              [v14 enumerateValuesWithBlock:v123];
              break;
            case 1:
              v122[0] = MEMORY[0x1E4F143A8];
              v122[1] = 3221225472;
              v122[2] = __30__TRIPBMessage_serializedSize__block_invoke_2;
              v122[3] = &unk_1E576BE30;
              v122[4] = &v124;
              [v14 enumerateValuesWithBlock:v122];
              break;
            case 2:
              v121[0] = MEMORY[0x1E4F143A8];
              v121[1] = 3221225472;
              v121[2] = __30__TRIPBMessage_serializedSize__block_invoke_3;
              v121[3] = &unk_1E576BE08;
              v121[4] = &v124;
              [v14 enumerateValuesWithBlock:v121];
              break;
            case 3:
              v120[0] = MEMORY[0x1E4F143A8];
              v120[1] = 3221225472;
              v120[2] = __30__TRIPBMessage_serializedSize__block_invoke_4;
              v120[3] = &unk_1E576BD90;
              v120[4] = &v124;
              [v14 enumerateValuesWithBlock:v120];
              break;
            case 4:
              v119[0] = MEMORY[0x1E4F143A8];
              v119[1] = 3221225472;
              v119[2] = __30__TRIPBMessage_serializedSize__block_invoke_5;
              v119[3] = &unk_1E576BDB8;
              v119[4] = &v124;
              [v14 enumerateValuesWithBlock:v119];
              break;
            case 5:
              v118[0] = MEMORY[0x1E4F143A8];
              v118[1] = 3221225472;
              v118[2] = __30__TRIPBMessage_serializedSize__block_invoke_6;
              v118[3] = &unk_1E576BDE0;
              v118[4] = &v124;
              [v14 enumerateValuesWithBlock:v118];
              break;
            case 6:
              v117[0] = MEMORY[0x1E4F143A8];
              v117[1] = 3221225472;
              v117[2] = __30__TRIPBMessage_serializedSize__block_invoke_7;
              v117[3] = &unk_1E576BD68;
              v117[4] = &v124;
              [v14 enumerateValuesWithBlock:v117];
              break;
            case 7:
              v116[0] = MEMORY[0x1E4F143A8];
              v116[1] = 3221225472;
              v116[2] = __30__TRIPBMessage_serializedSize__block_invoke_8;
              v116[3] = &unk_1E576BE08;
              v116[4] = &v124;
              [v14 enumerateValuesWithBlock:v116];
              break;
            case 8:
              v115[0] = MEMORY[0x1E4F143A8];
              v115[1] = 3221225472;
              v115[2] = __30__TRIPBMessage_serializedSize__block_invoke_9;
              v115[3] = &unk_1E576BDE0;
              v115[4] = &v124;
              [v14 enumerateValuesWithBlock:v115];
              break;
            case 9:
              v114[0] = MEMORY[0x1E4F143A8];
              v114[1] = 3221225472;
              v114[2] = __30__TRIPBMessage_serializedSize__block_invoke_10;
              v114[3] = &unk_1E576BE08;
              v114[4] = &v124;
              [v14 enumerateValuesWithBlock:v114];
              break;
            case 10:
              v113[0] = MEMORY[0x1E4F143A8];
              v113[1] = 3221225472;
              v113[2] = __30__TRIPBMessage_serializedSize__block_invoke_11;
              v113[3] = &unk_1E576BDE0;
              v113[4] = &v124;
              [v14 enumerateValuesWithBlock:v113];
              break;
            case 11:
              v112[0] = MEMORY[0x1E4F143A8];
              v112[1] = 3221225472;
              v112[2] = __30__TRIPBMessage_serializedSize__block_invoke_12;
              v112[3] = &unk_1E576BE30;
              v112[4] = &v124;
              [v14 enumerateValuesWithBlock:v112];
              break;
            case 12:
              v111[0] = MEMORY[0x1E4F143A8];
              v111[1] = 3221225472;
              v111[2] = __30__TRIPBMessage_serializedSize__block_invoke_13;
              v111[3] = &unk_1E576BDB8;
              v111[4] = &v124;
              [v14 enumerateValuesWithBlock:v111];
              break;
            case 13:
              long long v109 = 0u;
              long long v110 = 0u;
              long long v107 = 0u;
              long long v108 = 0u;
              uint64_t v30 = [v14 countByEnumeratingWithState:&v107 objects:v136 count:16];
              if (v30)
              {
                uint64_t v31 = *(void *)v108;
                do
                {
                  for (uint64_t j = 0; j != v30; ++j)
                  {
                    if (*(void *)v108 != v31) {
                      objc_enumerationMutation(v14);
                    }
                    uint64_t v33 = [*(id *)(*((void *)&v107 + 1) + 8 * j) length];
                    if (v33 >> 28) {
                      uint64_t v34 = 5;
                    }
                    else {
                      uint64_t v34 = 4;
                    }
                    if (v33 < 0x200000) {
                      uint64_t v34 = 3;
                    }
                    if (v33 < 0x4000) {
                      uint64_t v34 = 2;
                    }
                    if (v33 < 0x80) {
                      uint64_t v34 = 1;
                    }
                    v125[3] += v34 + v33;
                  }
                  uint64_t v30 = [v14 countByEnumeratingWithState:&v107 objects:v136 count:16];
                }
                while (v30);
              }
              break;
            case 14:
              long long v105 = 0u;
              long long v106 = 0u;
              long long v103 = 0u;
              long long v104 = 0u;
              uint64_t v21 = [v14 countByEnumeratingWithState:&v103 objects:v135 count:16];
              if (v21)
              {
                uint64_t v22 = *(void *)v104;
                do
                {
                  for (uint64_t k = 0; k != v21; ++k)
                  {
                    if (*(void *)v104 != v22) {
                      objc_enumerationMutation(v14);
                    }
                    uint64_t v24 = [*(id *)(*((void *)&v103 + 1) + 8 * k) lengthOfBytesUsingEncoding:4];
                    if (v24 >> 28) {
                      uint64_t v25 = 5;
                    }
                    else {
                      uint64_t v25 = 4;
                    }
                    if (v24 < 0x200000) {
                      uint64_t v25 = 3;
                    }
                    if (v24 < 0x4000) {
                      uint64_t v25 = 2;
                    }
                    if (v24 < 0x80) {
                      uint64_t v25 = 1;
                    }
                    v125[3] += v25 + v24;
                  }
                  uint64_t v21 = [v14 countByEnumeratingWithState:&v103 objects:v135 count:16];
                }
                while (v21);
              }
              break;
            case 15:
              long long v101 = 0u;
              long long v102 = 0u;
              long long v99 = 0u;
              long long v100 = 0u;
              uint64_t v35 = [v14 countByEnumeratingWithState:&v99 objects:v134 count:16];
              if (v35)
              {
                uint64_t v36 = *(void *)v100;
                do
                {
                  for (uint64_t m = 0; m != v35; ++m)
                  {
                    if (*(void *)v100 != v36) {
                      objc_enumerationMutation(v14);
                    }
                    uint64_t v38 = [*(id *)(*((void *)&v99 + 1) + 8 * m) serializedSize];
                    if (v38 >> 28) {
                      uint64_t v39 = 5;
                    }
                    else {
                      uint64_t v39 = 4;
                    }
                    if (v38 < 0x200000) {
                      uint64_t v39 = 3;
                    }
                    if (v38 < 0x4000) {
                      uint64_t v39 = 2;
                    }
                    if (v38 < 0x80) {
                      uint64_t v39 = 1;
                    }
                    v125[3] += v39 + v38;
                  }
                  uint64_t v35 = [v14 countByEnumeratingWithState:&v99 objects:v134 count:16];
                }
                while (v35);
              }
              break;
            case 16:
              long long v97 = 0u;
              long long v98 = 0u;
              long long v95 = 0u;
              long long v96 = 0u;
              uint64_t v26 = [v14 countByEnumeratingWithState:&v95 objects:v133 count:16];
              if (v26)
              {
                uint64_t v27 = *(void *)v96;
                do
                {
                  for (uint64_t n = 0; n != v26; ++n)
                  {
                    if (*(void *)v96 != v27) {
                      objc_enumerationMutation(v14);
                    }
                    uint64_t v29 = [*(id *)(*((void *)&v95 + 1) + 8 * n) serializedSize];
                    v125[3] += v29;
                  }
                  uint64_t v26 = [v14 countByEnumeratingWithState:&v95 objects:v133 count:16];
                }
                while (v26);
              }
              break;
            case 17:
              v94[0] = MEMORY[0x1E4F143A8];
              v94[1] = 3221225472;
              v94[2] = __30__TRIPBMessage_serializedSize__block_invoke_14;
              v94[3] = &unk_1E576BE08;
              v94[4] = &v124;
              [v14 enumerateRawValuesWithBlock:v94];
              break;
            default:
              break;
          }
          uint64_t v40 = v125[3];
          unsigned int v41 = 8 * *(_DWORD *)(v5[1] + 16);
          if (v41 >> 28) {
            uint64_t v42 = 5;
          }
          else {
            uint64_t v42 = 4;
          }
          if (v41 < 0x200000) {
            uint64_t v42 = 3;
          }
          if (v41 < 0x4000) {
            uint64_t v42 = 2;
          }
          if (v41 >= 0x80) {
            uint64_t v43 = v42;
          }
          else {
            uint64_t v43 = 1;
          }
          int v44 = [v5 isPackable];
          uint64_t v45 = v40 + v85;
          uint64_t v46 = v43 << (v87 == 16);
          if (v44)
          {
            uint64_t v47 = v46 + v45;
            unsigned int v48 = *((_DWORD *)v125 + 6);
            if (v48 >> 28) {
              uint64_t v49 = 5;
            }
            else {
              uint64_t v49 = 4;
            }
            if (v48 < 0x200000) {
              uint64_t v49 = 3;
            }
            if (v48 < 0x4000) {
              uint64_t v49 = 2;
            }
            if (v48 < 0x80) {
              uint64_t v49 = 1;
            }
            BOOL v70 = (v48 & 0x80000000) == 0;
            uint64_t v50 = 10;
            if (v70) {
              uint64_t v50 = v49;
            }
            uint64_t v3 = v47 + v50;
          }
          else
          {
            uint64_t v3 = v45 + v46 * v84;
          }
          self = v83;
          _Block_object_dispose(&v124, 8);
        }
      }
      else if (v6)
      {
        if ((v8 - 13) > 3 || [v5 mapKeyDataType] != 14)
        {
          uint64_t v18 = self->messageStorage_;
          if (v18) {
            int v19 = *(void **)((char *)v18 + *(unsigned int *)(v5[1] + 24));
          }
          else {
            int v19 = 0;
          }
          uint64_t v17 = [v19 computeSerializedSizeAsField:v5];
          goto LABEL_27;
        }
        uint64_t v15 = self->messageStorage_;
        if (v15)
        {
          uint64_t v16 = *(void **)((char *)v15 + *(unsigned int *)(v5[1] + 24));
          if (v16)
          {
            uint64_t v17 = TRIPBDictionaryComputeSizeInternalHelper(v16, (uint64_t)v5);
LABEL_27:
            v3 += v17;
            continue;
          }
        }
      }
      else if (TRIPBGetHasIvar((uint64_t)self, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16)))
      {
        uint64_t v9 = v5[1];
        int v10 = *(_DWORD *)(v9 + 16);
        switch(v10)
        {
          case 0:
            TRIPBGetMessageBoolField((uint64_t)self, v5);
            unsigned int v11 = 8 * v10;
            if ((8 * v10) < 0x80)
            {
              uint64_t v12 = 2;
              goto LABEL_196;
            }
            if (v11 < 0x4000)
            {
              uint64_t v12 = 3;
              goto LABEL_196;
            }
            if (v11 < 0x200000)
            {
              uint64_t v12 = 4;
              goto LABEL_196;
            }
            BOOL v70 = v11 >> 28 == 0;
            uint64_t v12 = 5;
            goto LABEL_194;
          case 1:
            TRIPBGetMessageUInt32Field((uint64_t)self, v5);
            goto LABEL_129;
          case 2:
            TRIPBGetMessageInt32Field((uint64_t)self, v5);
            goto LABEL_129;
          case 3:
            TRIPBGetMessageFloatField((uint64_t)self, v5);
LABEL_129:
            unsigned int v51 = 8 * v10;
            if ((8 * v10) < 0x80)
            {
              uint64_t v12 = 5;
              goto LABEL_196;
            }
            if (v51 < 0x4000)
            {
              uint64_t v12 = 6;
              goto LABEL_196;
            }
            if (v51 < 0x200000)
            {
              uint64_t v12 = 7;
              goto LABEL_196;
            }
            BOOL v70 = v51 >> 28 == 0;
            uint64_t v12 = 8;
            goto LABEL_194;
          case 4:
            TRIPBGetMessageUInt64Field((uint64_t)self, v5);
            goto LABEL_136;
          case 5:
            TRIPBGetMessageInt64Field((uint64_t)self, v5);
            goto LABEL_136;
          case 6:
            TRIPBGetMessageDoubleField((uint64_t)self, v5);
LABEL_136:
            unsigned int v52 = 8 * v10;
            if ((8 * v10) >= 0x80)
            {
              if (v52 >= 0x4000)
              {
                if (v52 >= 0x200000)
                {
                  BOOL v70 = v52 >> 28 == 0;
                  uint64_t v12 = 12;
LABEL_194:
                  if (!v70) {
                    ++v12;
                  }
                }
                else
                {
                  uint64_t v12 = 11;
                }
              }
              else
              {
                uint64_t v12 = 10;
              }
            }
            else
            {
              uint64_t v12 = 9;
            }
LABEL_196:
            v3 += v12;
            break;
          case 7:
            unsigned int v53 = TRIPBGetMessageInt32Field((uint64_t)self, v5);
            uint64_t v17 = TRIPBComputeInt32Size(v10, v53);
            goto LABEL_27;
          case 8:
            unint64_t v56 = TRIPBGetMessageInt64Field((uint64_t)self, v5);
            goto LABEL_154;
          case 9:
            int v54 = TRIPBGetMessageInt32Field((uint64_t)self, v5);
            uint64_t v17 = TRIPBComputeSInt32Size(v10, v54);
            goto LABEL_27;
          case 10:
            uint64_t v68 = TRIPBGetMessageInt64Field((uint64_t)self, v5);
            uint64_t v17 = TRIPBComputeSInt64Size(v10, v68);
            goto LABEL_27;
          case 11:
            unsigned int v55 = TRIPBGetMessageUInt32Field((uint64_t)self, v5);
            uint64_t v17 = TRIPBComputeUInt32Size(v10, v55);
            goto LABEL_27;
          case 12:
            unint64_t v56 = TRIPBGetMessageUInt64Field((uint64_t)self, v5);
LABEL_154:
            unsigned int v66 = 8 * v10;
            if ((8 * v10) >= 0x80)
            {
              if (v66 >= 0x4000)
              {
                if (v66 >= 0x200000)
                {
                  if (v66 >> 28) {
                    uint64_t v67 = 5;
                  }
                  else {
                    uint64_t v67 = 4;
                  }
                }
                else
                {
                  uint64_t v67 = 3;
                }
              }
              else
              {
                uint64_t v67 = 2;
              }
            }
            else
            {
              uint64_t v67 = 1;
            }
            uint64_t v71 = TRIPBComputeRawVarint64Size(v56);
            goto LABEL_192;
          case 13:
            uint64_t v57 = self->messageStorage_;
            if (v57) {
              uint64_t v58 = *(void **)((char *)v57 + *(unsigned int *)(v9 + 24));
            }
            else {
              uint64_t v58 = 0;
            }
            uint64_t v17 = TRIPBComputeBytesSize(v10, v58);
            goto LABEL_27;
          case 14:
            uint64_t v59 = self->messageStorage_;
            if (v59) {
              uint64_t v60 = *(void **)((char *)v59 + *(unsigned int *)(v9 + 24));
            }
            else {
              uint64_t v60 = 0;
            }
            uint64_t v17 = TRIPBComputeStringSize(v10, v60);
            goto LABEL_27;
          case 15:
            uint64_t v61 = self->messageStorage_;
            if (v61) {
              id v62 = *(void **)((char *)v61 + *(unsigned int *)(v9 + 24));
            }
            else {
              id v62 = 0;
            }
            uint64_t v17 = TRIPBComputeMessageSize(v10, v62);
            goto LABEL_27;
          case 16:
            uint64_t v63 = self->messageStorage_;
            if (v63) {
              uint64_t v64 = *(void **)((char *)v63 + *(unsigned int *)(v9 + 24));
            }
            else {
              uint64_t v64 = 0;
            }
            unsigned int v69 = 8 * v10;
            if ((8 * v10) >= 0x80)
            {
              if (v69 >= 0x4000)
              {
                if (v69 >= 0x200000)
                {
                  if (v69 >> 28) {
                    uint64_t v67 = 10;
                  }
                  else {
                    uint64_t v67 = 8;
                  }
                }
                else
                {
                  uint64_t v67 = 6;
                }
              }
              else
              {
                uint64_t v67 = 4;
              }
            }
            else
            {
              uint64_t v67 = 2;
            }
            uint64_t v71 = [v64 serializedSize];
LABEL_192:
            v3 += v67 + v71;
            continue;
          case 17:
            unsigned int v65 = TRIPBGetMessageInt32Field((uint64_t)self, v5);
            uint64_t v17 = TRIPBComputeEnumSize(v10, v65);
            goto LABEL_27;
          default:
            continue;
        }
      }
    }
    uint64_t v89 = [obj countByEnumeratingWithState:&v128 objects:v137 count:16];
  }
  while (v89);
LABEL_201:
  int v72 = [v82 isWireFormat];
  unknownFields = self->unknownFields_;
  if (v72) {
    uint64_t v74 = [(TRIPBUnknownFieldSet *)unknownFields serializedSizeAsMessageSet];
  }
  else {
    uint64_t v74 = [(TRIPBUnknownFieldSet *)unknownFields serializedSize];
  }
  uint64_t v75 = v74;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  extensionMap = self->extensionMap_;
  uint64_t v77 = [(NSMutableDictionary *)extensionMap countByEnumeratingWithState:&v90 objects:v132 count:16];
  unint64_t v78 = v75 + v3;
  if (v77)
  {
    uint64_t v79 = *(void *)v91;
    do
    {
      for (iuint64_t i = 0; ii != v77; ++ii)
      {
        if (*(void *)v91 != v79) {
          objc_enumerationMutation(extensionMap);
        }
        v78 += TRIPBComputeExtensionSerializedSizeIncludingTag(*(void *)(*((void *)&v90 + 1) + 8 * ii), (void *)[(NSMutableDictionary *)self->extensionMap_ objectForKey:*(void *)(*((void *)&v90 + 1) + 8 * ii)]);
      }
      uint64_t v77 = [(NSMutableDictionary *)extensionMap countByEnumeratingWithState:&v90 objects:v132 count:16];
    }
    while (v77);
  }
  return v78;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke(uint64_t result)
{
  return result;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 4;
  return result;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke_3(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 4;
  return result;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke_4(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 4;
  return result;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke_5(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 8;
  return result;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke_6(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 8;
  return result;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke_7(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 8;
  return result;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke_8(uint64_t result, unsigned int a2)
{
  uint64_t v2 = 10;
  uint64_t v3 = 1;
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (a2 >> 28) {
    uint64_t v6 = 5;
  }
  if (a2 >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (a2 >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (a2 >= 0x80) {
    uint64_t v3 = v4;
  }
  if ((a2 & 0x80000000) == 0) {
    uint64_t v2 = v3;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v2;
  return result;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke_9(uint64_t a1, unint64_t a2)
{
  uint64_t result = TRIPBComputeRawVarint64Size(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke_10(uint64_t result, int a2)
{
  unsigned int v2 = (2 * a2) ^ (a2 >> 31);
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if (v2 >> 28) {
    uint64_t v5 = 5;
  }
  if (v2 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v2 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v2 >= 0x80) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 1;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v6;
  return result;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke_11(uint64_t a1, uint64_t a2)
{
  uint64_t result = TRIPBComputeRawVarint64Size((2 * a2) ^ (a2 >> 63));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke_12(uint64_t result, unsigned int a2)
{
  uint64_t v2 = 1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if (a2 >> 28) {
    uint64_t v5 = 5;
  }
  if (a2 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (a2 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (a2 >= 0x80) {
    uint64_t v2 = v3;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v2;
  return result;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke_13(uint64_t a1, unint64_t a2)
{
  uint64_t result = TRIPBComputeRawVarint64Size(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke_14(uint64_t result, unsigned int a2)
{
  uint64_t v2 = 1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if (a2 >> 28) {
    uint64_t v5 = 5;
  }
  if (a2 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (a2 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (a2 >= 0x80) {
    uint64_t v2 = v3;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v2;
  return result;
}

uint64_t __38__TRIPBMessage_resolveInstanceMethod___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    uint64_t v7 = objc_opt_class();
    if (*(void *)(*(void *)(a1 + 32) + 48)) {
      int v8 = *(const char **)(*(void *)(a1 + 32) + 48);
    }
    else {
      int v8 = 0;
    }
    [v5 raise:v6, @"%@: %@ can only be set to NO (to clear field).", v7, NSStringFromSelector(v8) format];
  }
  uint64_t v9 = *(void *)(a1 + 32);
  return TRIPBClearMessageField(a2, v9);
}

void *__38__TRIPBMessage_resolveInstanceMethod___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(unsigned __int8 *)(a1 + 40);
  id v6 = a3;
  return TRIPBSetRetainedObjectIvarWithFieldInternal(a2, v4, v6, v5);
}

+ (BOOL)resolveClassMethod:(SEL)a3
{
  if (TRIPBResolveExtensionClassMethod((objc_class *)objc_msgSend((id)objc_msgSend(a1, "descriptor"), "messageClass"), a3))return 1; {
  v6.receiver = a1;
  }
  v6.super_class = (Class)&OBJC_METACLASS___TRIPBMessage;
  return objc_msgSendSuper2(&v6, sel_resolveClassMethod_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIPBMessage)initWithCoder:(id)a3
{
  uint64_t v4 = [(TRIPBMessage *)self init];
  if (v4)
  {
    int v5 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"TRIPBData"];
    if ([v5 length]) {
      [(TRIPBMessage *)v4 mergeFromData:v5 extensionRegistry:0];
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = [(TRIPBMessage *)self data];
  if ([v4 length])
  {
    [a3 encodeObject:v4 forKey:@"TRIPBData"];
  }
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

@end