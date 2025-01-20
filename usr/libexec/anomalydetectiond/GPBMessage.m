@interface GPBMessage
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)resolveClassMethod:(SEL)a3;
+ (BOOL)resolveInstanceMethod:(SEL)a3;
+ (BOOL)supportsSecureCoding;
+ (GPBMessage)allocWithZone:(_NSZone *)a3;
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
- (GPBMessage)init;
- (GPBMessage)initWithCodedInputStream:(id)a3 extensionRegistry:(id)a4 error:(id *)a5;
- (GPBMessage)initWithCoder:(id)a3;
- (GPBMessage)initWithData:(id)a3 error:(id *)a4;
- (GPBMessage)initWithData:(id)a3 extensionRegistry:(id)a4 error:(id *)a5;
- (GPBUnknownFieldSet)unknownFields;
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
- (void)writeExtensionsToCodedOutputStream:(id)a3 range:(GPBExtensionRange)a4 sortedExtensions:(id)a5;
- (void)writeField:(id)a3 toCodedOutputStream:(id)a4;
- (void)writeToCodedOutputStream:(id)a3;
- (void)writeToOutputStream:(id)a3;
@end

@implementation GPBMessage

+ (void)initialize
{
  id v3 = (id)objc_opt_class();
  if ((id)objc_opt_class() == v3)
  {
    [a1 descriptor];
    objc_opt_class();
  }
  else if ([a1 superclass] == v3)
  {
    [a1 descriptor];
  }
}

+ (GPBMessage)allocWithZone:(_NSZone *)a3
{
  NSUInteger v5 = *((unsigned int *)[a1 descriptor] + 6);

  return (GPBMessage *)NSAllocateObject((Class)a1, v5, a3);
}

+ (id)descriptor
{
  id result = (id)qword_1003DD740;
  if (!qword_1003DD740)
  {
    qword_1003DD748 = [[GPBFileDescriptor alloc] initWithPackage:@"internal" syntax:2];
    LODWORD(v3) = 0;
    id result = +[GPBDescriptor allocDescriptorForClass:objc_opt_class() rootClass:0 file:qword_1003DD748 fields:0 fieldCount:0 storageSize:0 flags:v3];
    qword_1003DD740 = (uint64_t)result;
  }
  return result;
}

+ (id)message
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (GPBMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)GPBMessage;
  id v2 = [(GPBMessage *)&v5 init];
  if (v2)
  {
    uint64_t v3 = (objc_class *)objc_opt_class();
    v2->messageStorage_ = (GPBMessage_Storage *)((char *)v2 + class_getInstanceSize(v3));
  }
  return v2;
}

- (GPBMessage)initWithData:(id)a3 error:(id *)a4
{
  return [(GPBMessage *)self initWithData:a3 extensionRegistry:0 error:a4];
}

- (GPBMessage)initWithData:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  v8 = [(GPBMessage *)self init];
  v9 = v8;
  if (v8)
  {
    [(GPBMessage *)v8 mergeFromData:a3 extensionRegistry:a4];
    if (a5) {
      *a5 = 0;
    }
  }
  return v9;
}

- (GPBMessage)initWithCodedInputStream:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  v8 = [(GPBMessage *)self init];
  v9 = v8;
  if (v8)
  {
    [(GPBMessage *)v8 mergeFromCodedInputStream:a3 extensionRegistry:a4];
    if (a5) {
      *a5 = 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  [(GPBMessage *)self internalClear:0];
  if (self->autocreator_) {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[GPBMessage dealloc]"), @"GPBMessage.m", 946, @"Autocreator was not cleared before dealloc.");
  }
  if (atomic_load((unint64_t *)&self->readOnlySemaphore_))
  {
    v4 = atomic_load((unint64_t *)&self->readOnlySemaphore_);
    dispatch_release(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)GPBMessage;
  [(GPBMessage *)&v5 dealloc];
}

- (void)copyFieldsInto:(id)a3 zone:(_NSZone *)a4 descriptor:(id)a5
{
  v7 = a3;
  memcpy(*((void **)a3 + 8), self->messageStorage_, *((unsigned int *)a5 + 6));
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v9 = (void *)*((void *)a5 + 1);
  v10 = self;
  id v11 = [v9 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v44;
    v34 = self;
    v35 = v7;
    v36 = v9;
    do
    {
      v14 = 0;
      id v37 = v12;
      do
      {
        if (*(void *)v44 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v43 + 1) + 8 * (void)v14);
        uint64_t v16 = v15[1];
        if ((*(_WORD *)(v16 + 28) & 0xF02) != 0)
        {
          uint64_t v17 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)v10, *(void *)(*((void *)&v43 + 1) + 8 * (void)v14));
          if (!v17) {
            goto LABEL_37;
          }
          v18 = (void *)v17;
          uint64_t v19 = v13;
          unsigned int v20 = *(unsigned __int8 *)(v15[1] + 30) - 15;
          unsigned int v21 = [v15 fieldType];
          if (v20 <= 1)
          {
            if (v21 == 1)
            {
              id v22 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v18 count]];
              long long v39 = 0u;
              long long v40 = 0u;
              long long v41 = 0u;
              long long v42 = 0u;
              id v23 = [v18 countByEnumeratingWithState:&v39 objects:v47 count:16];
              if (v23)
              {
                id v24 = v23;
                uint64_t v25 = *(void *)v40;
                do
                {
                  for (i = 0; i != v24; i = (char *)i + 1)
                  {
                    if (*(void *)v40 != v25) {
                      objc_enumerationMutation(v18);
                    }
                    id v27 = [*(id *)(*((void *)&v39 + 1) + 8 * i) copyWithZone:a4];
                    [v22 addObject:v27];
                  }
                  id v24 = [v18 countByEnumeratingWithState:&v39 objects:v47 count:16];
                }
                while (v24);
                v10 = v34;
                v7 = v35;
              }
              v9 = v36;
              uint64_t v13 = v19;
              goto LABEL_36;
            }
            uint64_t v13 = v19;
            if ([v15 mapKeyDataType] == 14)
            {
              id v22 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v18 count]];
              v38[0] = _NSConcreteStackBlock;
              v38[1] = 3221225472;
              v38[2] = sub_1002DD530;
              v38[3] = &unk_1003B9F40;
              v38[4] = v22;
              v38[5] = a4;
              [v18 enumerateKeysAndObjectsUsingBlock:v38];
LABEL_36:
              id v12 = v37;
              id v33 = v18;
              GPBSetRetainedObjectIvarWithFieldPrivate(v7, v15, v22);
              goto LABEL_37;
            }
            id v32 = [v18 deepCopyWithZone:a4];
LABEL_35:
            id v22 = v32;
            goto LABEL_36;
          }
          if (v21 == 1)
          {
            uint64_t v13 = v19;
            if (*(unsigned __int8 *)(v15[1] + 30) - 13 > 3)
            {
LABEL_33:
              id v32 = [v18 copyWithZone:a4];
              goto LABEL_35;
            }
          }
          else
          {
            uint64_t v13 = v19;
            if ([v15 mapKeyDataType] != 14
              || *(unsigned __int8 *)(v15[1] + 30) - 13 > 3)
            {
              goto LABEL_33;
            }
          }
          id v32 = [v18 mutableCopyWithZone:a4];
          goto LABEL_35;
        }
        int v28 = *(unsigned __int8 *)(v16 + 30);
        if ((v28 - 15) <= 1)
        {
          if (!GPBGetHasIvar((uint64_t)v10, *(_DWORD *)(v16 + 20), *(_DWORD *)(v16 + 16)))
          {
            *(void *)(v7[8] + *(unsigned int *)(v15[1] + 24)) = 0;
            goto LABEL_37;
          }
LABEL_27:
          v29 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)v10, (uint64_t)v15);
          id v30 = [v29 copyWithZone:a4];
          id v31 = v29;
          GPBSetRetainedObjectIvarWithFieldPrivate(v7, v15, v30);
          goto LABEL_37;
        }
        if ((v28 - 13) <= 3 && GPBGetHasIvar((uint64_t)v10, *(_DWORD *)(v16 + 20), *(_DWORD *)(v16 + 16))) {
          goto LABEL_27;
        }
LABEL_37:
        v14 = (char *)v14 + 1;
      }
      while (v14 != v12);
      id v12 = [v9 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v12);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [(GPBMessage *)self descriptor];
  v6 = [[[v5 messageClass] allocWithZone:a3] init];
  [(GPBMessage *)self copyFieldsInto:v6 zone:a3 descriptor:v5];
  v6[1] = [(GPBUnknownFieldSet *)self->unknownFields_ copyWithZone:a3];
  v6[2] = sub_1002DD614(self->extensionMap_, (uint64_t)a3);
  return v6;
}

- (void)clear
{
}

- (void)internalClear:(BOOL)a3
{
  BOOL v25 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v24 = [(GPBMessage *)self descriptor];
  v4 = (void *)v24[1];
  id v5 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v10 = v9[1];
        if ((*(_WORD *)(v10 + 28) & 0xF02) != 0)
        {
          uint64_t v11 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, *(void *)(*((void *)&v30 + 1) + 8 * i));
          if (!v11) {
            continue;
          }
          id v12 = (char *)v11;
          if ([v9 fieldType] == 1)
          {
            if (*(unsigned __int8 *)(v9[1] + 30) - 13 <= 3)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v13 = &OBJC_IVAR___GPBAutocreatedArray__autocreator;
                goto LABEL_24;
              }
LABEL_27:

              continue;
            }
            uint64_t v13 = &OBJC_IVAR___GPBInt32Array__autocreator;
LABEL_24:
            uint64_t v16 = *v13;
          }
          else
          {
            if ([v9 mapKeyDataType] == 14
              && *(unsigned __int8 *)(v9[1] + 30) - 13 <= 3)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_27;
              }
              uint64_t v13 = &OBJC_IVAR___GPBAutocreatedDictionary__autocreator;
              goto LABEL_24;
            }
            uint64_t v16 = 8;
          }
          uint64_t v17 = (GPBMessage **)&v12[v16];
          if (*v17 == self) {
            *uint64_t v17 = 0;
          }
          goto LABEL_27;
        }
        int v14 = *(unsigned __int8 *)(v10 + 30);
        if ((v14 - 15) <= 1)
        {
          GPBClearAutocreatedMessageIvarWithField((uint64_t)self, *(void *)(*((void *)&v30 + 1) + 8 * i));
          v15 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)v9);
LABEL_21:

          continue;
        }
        if ((v14 - 13) <= 3 && GPBGetHasIvar((uint64_t)self, *(_DWORD *)(v10 + 20), *(_DWORD *)(v10 + 16)))
        {
          v15 = GPBGetObjectIvarWithField((uint64_t)self, v9);
          goto LABEL_21;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v6);
  }
  id v18 = [(NSMutableDictionary *)self->autocreatedExtensionMap_ allValues];

  self->autocreatedExtensionMap_ = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v26 + 1) + 8 * (void)j);
        if (*(GPBMessage **)(v23 + 32) != self) {
          -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[GPBMessage internalClear:]"), @"GPBMessage.m", 1135, @"Autocreated extension does not refer back to self.");
        }
        GPBClearMessageAutocreator(v23);
      }
      id v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v20);
  }

  self->extensionMap_ = 0;
  self->unknownFields_ = 0;
  if (v25) {
    bzero(self->messageStorage_, *((unsigned int *)v24 + 6));
  }
}

- (BOOL)isInitialized
{
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v3 = (void *)*((void *)[(GPBMessage *)self descriptor] + 1);
  id v4 = [v3 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v30;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v30 != v5) {
        objc_enumerationMutation(v3);
      }
      uint64_t v7 = *(void **)(*((void *)&v29 + 1) + 8 * v6);
      if ([v7 isRequired]
        && !GPBGetHasIvar((uint64_t)self, *(_DWORD *)(v7[1] + 20), *(_DWORD *)(v7[1] + 16)))
      {
        return 0;
      }
      if (*(unsigned __int8 *)(v7[1] + 30) - 15 > 1) {
        goto LABEL_33;
      }
      unsigned int v8 = [v7 fieldType];
      if (v8 == 1)
      {
        v9 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)v7);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v10 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v26;
LABEL_15:
          uint64_t v12 = 0;
          while (1)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v9);
            }
            if (![*(id *)(*((void *)&v25 + 1) + 8 * v12) isInitialized]) {
              return 0;
            }
            if (v10 == (id)++v12)
            {
              id v10 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
              if (v10) {
                goto LABEL_15;
              }
              goto LABEL_33;
            }
          }
        }
        goto LABEL_33;
      }
      if (v8)
      {
        BOOL v13 = [v7 mapKeyDataType] == 14;
        int v14 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)v7);
        if (!v13)
        {
          if (v14 && ![v14 isInitialized]) {
            return 0;
          }
          goto LABEL_33;
        }
        if (v14)
        {
          unsigned __int8 IsInitializedInternalHelper = GPBDictionaryIsInitializedInternalHelper(v14, v7);
          goto LABEL_29;
        }
      }
      else
      {
        if ([v7 isRequired]) {
          goto LABEL_28;
        }
        if (([v7 isOptional] & 1) == 0) {
          -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"GPBMessage.m", 1173, @"%@: Single message field %@ not required or optional?", objc_opt_class(), [v7 name]);
        }
        if (GPBGetHasIvar((uint64_t)self, *(_DWORD *)(v7[1] + 20), *(_DWORD *)(v7[1] + 16)))
        {
LABEL_28:
          unsigned __int8 IsInitializedInternalHelper = [GPBGetMessageMessageField(self, v7) isInitialized];
LABEL_29:
          if ((IsInitializedInternalHelper & 1) == 0) {
            return 0;
          }
        }
      }
LABEL_33:
      if ((id)++v6 == v4)
      {
        id v4 = [v3 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  extensionMap = self->extensionMap_;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1002DE148;
  v20[3] = &unk_1003B9F68;
  v20[4] = &v21;
  [(NSMutableDictionary *)extensionMap enumerateKeysAndObjectsUsingBlock:v20];
  BOOL v17 = *((unsigned char *)v22 + 24) != 0;
  _Block_object_dispose(&v21, 8);
  return v17;
}

- (id)descriptor
{
  id v2 = objc_opt_class();

  return [v2 descriptor];
}

- (id)data
{
  uint64_t v3 = +[NSMutableData dataWithLength:[(GPBMessage *)self serializedSize]];
  id v4 = [[GPBCodedOutputStream alloc] initWithData:v3];
  [(GPBMessage *)self writeToCodedOutputStream:v4];

  return v3;
}

- (id)delimitedData
{
  unint64_t v3 = [(GPBMessage *)self serializedSize];
  id v4 = +[NSMutableData dataWithLength:GPBComputeRawVarint32SizeForInteger(v3) + v3];
  uint64_t v5 = [[GPBCodedOutputStream alloc] initWithData:v4];
  [(GPBMessage *)self writeDelimitedToCodedOutputStream:v5];

  return v4;
}

- (void)writeToOutputStream:(id)a3
{
  id v4 = [[GPBCodedOutputStream alloc] initWithOutputStream:a3];
  [(GPBMessage *)self writeToCodedOutputStream:v4];
}

- (void)writeToCodedOutputStream:(id)a3
{
  uint64_t v5 = [(GPBMessage *)self descriptor];
  uint64_t v6 = (void *)v5[1];
  uint64_t v7 = (char *)[v6 count];
  unsigned int v8 = [v5 extensionRanges];
  id v19 = v5;
  unsigned int v9 = [v5 extensionRangesCount];
  id v10 = [[-[NSMutableDictionary allKeys](self->extensionMap_) sortedArrayUsingSelector:@"compareByFieldNumber:"];
  if (v7) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = v9 == 0;
  }
  if (!v11)
  {
    id v12 = v10;
    unint64_t v13 = 0;
    int v14 = 0;
    do
    {
      if (v14 == v7)
      {
        [(GPBMessage *)self writeExtensionsToCodedOutputStream:a3 range:v8[v13] sortedExtensions:v12];
        int v14 = v7;
        ++v13;
      }
      else if (v13 == v9 {
             || (v15 = [v6 objectAtIndexedSubscript:v14],
      }
                 uint64_t v16 = &v8[v13],
                 *(_DWORD *)(v15[1] + 16) < *(_DWORD *)v16))
      {
        -[GPBMessage writeField:toCodedOutputStream:](self, "writeField:toCodedOutputStream:", [v6 objectAtIndexedSubscript:v14++], a3);
      }
      else
      {
        ++v13;
        [(GPBMessage *)self writeExtensionsToCodedOutputStream:a3 range:*v16 sortedExtensions:v12];
      }
    }
    while (v14 < v7 || v13 < v9);
  }
  unsigned __int8 v17 = [v19 isWireFormat];
  unknownFields = self->unknownFields_;
  if (v17)
  {
    [(GPBUnknownFieldSet *)unknownFields writeAsMessageSetTo:a3];
  }
  else
  {
    [(GPBUnknownFieldSet *)unknownFields writeToCodedOutputStream:a3];
  }
}

- (void)writeDelimitedToOutputStream:(id)a3
{
  id v4 = [[GPBCodedOutputStream alloc] initWithOutputStream:a3];
  [(GPBMessage *)self writeDelimitedToCodedOutputStream:v4];
}

- (void)writeDelimitedToCodedOutputStream:(id)a3
{
  [a3 writeRawVarintSizeTAs32:-[GPBMessage serializedSize](self, "serializedSize")];

  [(GPBMessage *)self writeToCodedOutputStream:a3];
}

- (void)writeField:(id)a3 toCodedOutputStream:(id)a4
{
  unsigned int v7 = [a3 fieldType];
  if (v7
    || GPBGetHasIvar((uint64_t)self, *(_DWORD *)(*((void *)a3 + 1) + 20), *(_DWORD *)(*((void *)a3 + 1) + 16)))
  {
    uint64_t v8 = *((void *)a3 + 1);
    uint64_t v9 = *(unsigned int *)(v8 + 16);
    switch(*(unsigned char *)(v8 + 30))
    {
      case 0:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v10 = GPBFieldTag((uint64_t)a3);
          }
          else {
            uint64_t v10 = 0;
          }
          uint64_t v55 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
          [a4 writeBoolArray:v9 values:v55 tag:v10];
        }
        else
        {
          if (v7) {
            goto LABEL_134;
          }
          unint64_t v28 = GPBGetMessageBoolField((uint64_t)self, a3);
          [a4 writeBool:v9 value:v28];
        }
        break;
      case 1:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v11 = GPBFieldTag((uint64_t)a3);
          }
          else {
            uint64_t v11 = 0;
          }
          uint64_t v56 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
          [a4 writeFixed32Array:v9 values:v56 tag:v11];
        }
        else
        {
          if (v7) {
            goto LABEL_134;
          }
          id v29 = GPBGetMessageUInt32Field((uint64_t)self, a3);
          [a4 writeFixed32:v9 value:v29];
        }
        break;
      case 2:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v12 = GPBFieldTag((uint64_t)a3);
          }
          else {
            uint64_t v12 = 0;
          }
          uint64_t v57 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
          [a4 writeSFixed32Array:v9 values:v57 tag:v12];
        }
        else
        {
          if (v7) {
            goto LABEL_134;
          }
          id v31 = GPBGetMessageInt32Field((uint64_t)self, a3);
          [a4 writeSFixed32:v9 value:v31];
        }
        break;
      case 3:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v13 = GPBFieldTag((uint64_t)a3);
          }
          else {
            uint64_t v13 = 0;
          }
          uint64_t v58 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
          [a4 writeFloatArray:v9 values:v58 tag:v13];
        }
        else
        {
          if (v7) {
            goto LABEL_134;
          }
          GPBGetMessageFloatField((uint64_t)self, a3);
          [a4 writeFloat:v9 value:v33];
        }
        break;
      case 4:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v14 = GPBFieldTag((uint64_t)a3);
          }
          else {
            uint64_t v14 = 0;
          }
          uint64_t v59 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
          [a4 writeFixed64Array:v9 values:v59 tag:v14];
        }
        else
        {
          if (v7) {
            goto LABEL_134;
          }
          id v35 = GPBGetMessageUInt64Field((uint64_t)self, a3);
          [a4 writeFixed64:v9 value:v35, v36];
        }
        break;
      case 5:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v15 = GPBFieldTag((uint64_t)a3);
          }
          else {
            uint64_t v15 = 0;
          }
          uint64_t v60 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
          [a4 writeSFixed64Array:v9 values:v60 tag:v15];
        }
        else
        {
          if (v7) {
            goto LABEL_134;
          }
          id v37 = GPBGetMessageInt64Field((uint64_t)self, a3);
          [a4 writeSFixed64:v9 value:v37];
        }
        break;
      case 6:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v16 = GPBFieldTag((uint64_t)a3);
          }
          else {
            uint64_t v16 = 0;
          }
          uint64_t v61 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
          [a4 writeDoubleArray:v9 values:v61 tag:v16];
        }
        else
        {
          if (v7) {
            goto LABEL_134;
          }
          GPBGetMessageDoubleField((uint64_t)self, a3);
          [a4 writeDouble:v9 value:v39];
        }
        break;
      case 7:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v17 = GPBFieldTag((uint64_t)a3);
          }
          else {
            uint64_t v17 = 0;
          }
          uint64_t v62 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
          [a4 writeInt32Array:v9 values:v62 tag:v17];
        }
        else
        {
          if (v7) {
            goto LABEL_134;
          }
          id v41 = GPBGetMessageInt32Field((uint64_t)self, a3);
          [a4 writeInt32:v9 value:v41, v42];
        }
        break;
      case 8:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v18 = GPBFieldTag((uint64_t)a3);
          }
          else {
            uint64_t v18 = 0;
          }
          uint64_t v63 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
          [a4 writeInt64Array:v9 values:v63 tag:v18];
        }
        else
        {
          if (v7) {
            goto LABEL_134;
          }
          id v43 = GPBGetMessageInt64Field((uint64_t)self, a3);
          [a4 writeInt64:v9 value:v43];
        }
        break;
      case 9:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v19 = GPBFieldTag((uint64_t)a3);
          }
          else {
            uint64_t v19 = 0;
          }
          uint64_t v64 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
          [a4 writeSInt32Array:v9 values:v64 tag:v19];
        }
        else
        {
          if (v7) {
            goto LABEL_134;
          }
          id v45 = GPBGetMessageInt32Field((uint64_t)self, a3);
          [a4 writeSInt32:v9 value:v45];
        }
        break;
      case 0xA:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v20 = GPBFieldTag((uint64_t)a3);
          }
          else {
            uint64_t v20 = 0;
          }
          uint64_t v65 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
          [a4 writeSInt64Array:v9 values:v65 tag:v20];
        }
        else
        {
          if (v7) {
            goto LABEL_134;
          }
          id v47 = GPBGetMessageInt64Field((uint64_t)self, a3);
          [a4 writeSInt64:v9 value:v47, v48];
        }
        break;
      case 0xB:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v21 = GPBFieldTag((uint64_t)a3);
          }
          else {
            uint64_t v21 = 0;
          }
          uint64_t v66 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
          [a4 writeUInt32Array:v9 values:v66 tag:v21];
        }
        else
        {
          if (v7) {
            goto LABEL_134;
          }
          id v49 = GPBGetMessageUInt32Field((uint64_t)self, a3);
          [a4 writeUInt32:v9 value:v49, v50];
        }
        break;
      case 0xC:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v22 = GPBFieldTag((uint64_t)a3);
          }
          else {
            uint64_t v22 = 0;
          }
          uint64_t v67 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
          [a4 writeUInt64Array:v9 values:v67 tag:v22];
        }
        else
        {
          if (v7) {
            goto LABEL_134;
          }
          id v51 = GPBGetMessageUInt64Field((uint64_t)self, a3);
          [a4 writeUInt64:v9 value:v51];
        }
        break;
      case 0xD:
        uint64_t v23 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
        if (v7 == 1)
        {
          [a4 writeBytesArray:v9 values:v23];
        }
        else
        {
          if (v7) {
            goto LABEL_128;
          }
          [a4 writeBytes:v9 value:v23];
        }
        break;
      case 0xE:
        uint64_t v23 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
        if (v7 == 1)
        {
          [a4 writeStringArray:v9 values:v23, v24];
        }
        else
        {
          if (v7) {
            goto LABEL_128;
          }
          [a4 writeString:v9 value:v23];
        }
        break;
      case 0xF:
        uint64_t v23 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
        if (v7 == 1)
        {
          [a4 writeMessageArray:v9 values:v23, v25];
        }
        else
        {
          if (v7) {
            goto LABEL_128;
          }
          [a4 writeMessage:v9 value:v23];
        }
        break;
      case 0x10:
        uint64_t v23 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
        if (v7 == 1)
        {
          [a4 writeGroupArray:v9 values:v23, v26];
        }
        else if (v7)
        {
LABEL_128:
          if ([a3 mapKeyDataType] != 14)
          {
            v54 = v23;
            goto LABEL_135;
          }
          GPBDictionaryWriteToStreamInternalHelper(a4, v23, a3);
        }
        else
        {
          [a4 writeGroup:v9 value:v23];
        }
        break;
      case 0x11:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v27 = GPBFieldTag((uint64_t)a3);
          }
          else {
            uint64_t v27 = 0;
          }
          uint64_t v68 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
          [a4 writeEnumArray:v9 values:v68 tag:v27];
        }
        else if (v7)
        {
LABEL_134:
          v54 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
LABEL_135:
          [v54 writeToCodedOutputStream:a4 asField:a3];
        }
        else
        {
          id v69 = GPBGetMessageInt32Field((uint64_t)self, a3);
          [a4 writeEnum:v9 value:v69];
        }
        break;
      default:
        return;
    }
  }
}

- (id)getExtension:(id)a3
{
  sub_1002DF46C((uint64_t)self, a3);
  uint64_t v5 = [(NSMutableDictionary *)self->extensionMap_ objectForKey:a3];
  if (v5) {
    return v5;
  }
  if ([a3 isRepeated]) {
    return 0;
  }
  if (*(unsigned __int8 *)(*((void *)a3 + 1) + 44) - 15 < 2)
  {
    GPBPrepareReadOnlySemaphore((uint64_t)self);
    uint64_t v6 = atomic_load((unint64_t *)&self->readOnlySemaphore_);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v5 = [(NSMutableDictionary *)self->autocreatedExtensionMap_ objectForKey:a3];
    if (!v5)
    {
      uint64_t v5 = objc_alloc_init((Class)[a3 msgClass]);
      v5[4] = self;
      v5[6] = a3;
      autocreatedExtensionMap = self->autocreatedExtensionMap_;
      if (!autocreatedExtensionMap)
      {
        autocreatedExtensionMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        self->autocreatedExtensionMap_ = autocreatedExtensionMap;
      }
      [(NSMutableDictionary *)autocreatedExtensionMap setObject:v5 forKey:a3];
    }
    uint64_t v8 = atomic_load((unint64_t *)&self->readOnlySemaphore_);
    dispatch_semaphore_signal(v8);
    return v5;
  }

  return [a3 defaultValue];
}

- (id)getExistingExtension:(id)a3
{
  return [(NSMutableDictionary *)self->extensionMap_ objectForKey:a3];
}

- (BOOL)hasExtension:(id)a3
{
  return [(NSMutableDictionary *)self->extensionMap_ objectForKey:a3] != 0;
}

- (id)extensionsCurrentlySet
{
  return [(NSMutableDictionary *)self->extensionMap_ allKeys];
}

- (void)writeExtensionsToCodedOutputStream:(id)a3 range:(GPBExtensionRange)a4 sortedExtensions:(id)a5
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = [a5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(a5);
        }
        uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unsigned int v14 = [v13 fieldNumber];
        if (v14 >= a4.var0)
        {
          if (v14 >= a4.var1) {
            return;
          }
          GPBWriteExtensionValueToOutputStream((uint64_t)v13, [(NSMutableDictionary *)self->extensionMap_ objectForKey:v13], a3);
        }
      }
      id v10 = [a5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)setExtension:(id)a3 value:(id)a4
{
  if (a4)
  {
    sub_1002DF46C((uint64_t)self, a3);
    if ([a3 isRepeated]) {
      +[NSException raise:NSInvalidArgumentException format:@"Must call addExtension() for repeated types."];
    }
    extensionMap = self->extensionMap_;
    if (!extensionMap)
    {
      extensionMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      self->extensionMap_ = extensionMap;
    }
    [(NSMutableDictionary *)extensionMap setObject:a4 forKey:a3];
    if (*(unsigned __int8 *)(*((void *)a3 + 1) + 44) - 15 <= 1
      && ([a3 isRepeated] & 1) == 0)
    {
      id v8 = [(NSMutableDictionary *)self->autocreatedExtensionMap_ objectForKey:a3];
      [(NSMutableDictionary *)self->autocreatedExtensionMap_ removeObjectForKey:a3];
      GPBClearMessageAutocreator((uint64_t)v8);
    }
    GPBBecomeVisibleToAutocreator(self);
  }
  else
  {
    -[GPBMessage clearExtension:](self, "clearExtension:");
  }
}

- (void)addExtension:(id)a3 value:(id)a4
{
  sub_1002DF46C((uint64_t)self, a3);
  if (([a3 isRepeated] & 1) == 0) {
    +[NSException raise:NSInvalidArgumentException format:@"Must call setExtension() for singular types."];
  }
  extensionMap = self->extensionMap_;
  if (!extensionMap)
  {
    extensionMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    self->extensionMap_ = extensionMap;
  }
  id v8 = [(NSMutableDictionary *)extensionMap objectForKey:a3];
  if (!v8)
  {
    id v8 = +[NSMutableArray array];
    [(NSMutableDictionary *)self->extensionMap_ setObject:v8 forKey:a3];
  }
  [v8 addObject:a4];

  GPBBecomeVisibleToAutocreator(self);
}

- (void)setExtension:(id)a3 index:(unint64_t)a4 value:(id)a5
{
  sub_1002DF46C((uint64_t)self, a3);
  if (([a3 isRepeated] & 1) == 0) {
    +[NSException raise:NSInvalidArgumentException format:@"Must call setExtension() for singular types."];
  }
  extensionMap = self->extensionMap_;
  if (!extensionMap)
  {
    extensionMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    self->extensionMap_ = extensionMap;
  }
  [extensionMap objectForKey:[-[NSMutableDictionary objectForKey:](extensionMap, "objectForKey:", a3) replaceObjectAtIndex:a4 withObject:a5];

  GPBBecomeVisibleToAutocreator(self);
}

- (void)clearExtension:(id)a3
{
  sub_1002DF46C((uint64_t)self, a3);
  if ([(NSMutableDictionary *)self->extensionMap_ objectForKey:a3])
  {
    [(NSMutableDictionary *)self->extensionMap_ removeObjectForKey:a3];
    GPBBecomeVisibleToAutocreator(self);
  }
}

- (void)mergeFromData:(id)a3 extensionRegistry:(id)a4
{
  uint64_t v6 = [[GPBCodedInputStream alloc] initWithData:a3];
  [(GPBMessage *)self mergeFromCodedInputStream:v6 extensionRegistry:a4];
  [(GPBCodedInputStream *)v6 checkLastTagWas:0];
}

- (void)mergeDelimitedFromCodedInputStream:(id)a3 extensionRegistry:(id)a4
{
  uint64_t v6 = (uint64_t *)((char *)a3 + 8);
  if (!GPBCodedInputStreamIsAtEnd((void *)a3 + 1))
  {
    id RetainedBytesNoCopy = GPBCodedInputStreamReadRetainedBytesNoCopy(v6);
    if (RetainedBytesNoCopy)
    {
      id v8 = RetainedBytesNoCopy;
      [(GPBMessage *)self mergeFromData:RetainedBytesNoCopy extensionRegistry:a4];
    }
  }
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  return [a1 parseFromData:a3 extensionRegistry:0 error:a4];
}

+ (id)parseFromData:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  id v5 = [objc_alloc((Class)a1) initWithData:a3 extensionRegistry:a4 error:a5];

  return v5;
}

+ (id)parseFromCodedInputStream:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  id v5 = [objc_alloc((Class)a1) initWithCodedInputStream:a3 extensionRegistry:a4 error:a5];

  return v5;
}

+ (id)parseDelimitedFromCodedInputStream:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  id v8 = objc_alloc_init((Class)a1);
  [v8 mergeDelimitedFromCodedInputStream:a3 extensionRegistry:a4];
  if (a5) {
    *a5 = 0;
  }
  return v8;
}

- (GPBUnknownFieldSet)unknownFields
{
  return self->unknownFields_;
}

- (void)setUnknownFields:(id)a3
{
  unknownFields = self->unknownFields_;
  if (unknownFields != a3)
  {

    self->unknownFields_ = (GPBUnknownFieldSet *)[a3 copy];
    GPBBecomeVisibleToAutocreator(self);
  }
}

- (void)parseMessageSet:(id)a3 extensionRegistry:(id)a4
{
  unsigned int v7 = (uint64_t *)((char *)a3 + 8);
  uint64_t Tag = GPBCodedInputStreamReadTag((uint64_t)a3 + 8);
  if (Tag)
  {
    uint64_t v9 = Tag;
    int v10 = GPBWireFormatMakeTag(2, 0);
    uint64_t UInt32 = 0;
    id v12 = 0;
    uint64_t v13 = 0;
    do
    {
      if (v9 == v10)
      {
        uint64_t UInt32 = GPBCodedInputStreamReadUInt32(v7);
        if (UInt32) {
          uint64_t v13 = [a4 extensionForDescriptor:-[GPBMessage descriptor](self, "descriptor") fieldNumber:UInt32];
        }
      }
      else if (v9 == GPBWireFormatMakeTag(3, 2))
      {
        id v12 = GPBCodedInputStreamReadRetainedBytesNoCopy(v7);
      }
      else if (![a3 skipField:v9])
      {
        break;
      }
      uint64_t v9 = GPBCodedInputStreamReadTag((uint64_t)v7);
    }
    while (v9);
  }
  else
  {
    uint64_t v13 = 0;
    id v12 = 0;
    uint64_t UInt32 = 0;
  }
  [a3 checkLastTagWas:GPBWireFormatMakeTag(1, 4)];
  if (v12 && UInt32)
  {
    if (v13)
    {
      long long v16 = [[GPBCodedInputStream alloc] initWithData:v12];
      GPBExtensionMergeFromInputStream(v13, (int)[v13 isPackable], (uint64_t *)v16, (uint64_t)a4, self);
    }
    else
    {
      unsigned int v14 = (void *)sub_1002DFE44(self);
      long long v15 = +[NSData dataWithData:v12];
      [v14 mergeMessageSetMessage:UInt32 data:v15];
    }
  }
}

- (BOOL)parseUnknownField:(id)a3 extensionRegistry:(id)a4 tag:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  int TagWireType = GPBWireFormatGetTagWireType(a5);
  int TagFieldNumber = GPBWireFormatGetTagFieldNumber(v5);
  id v11 = [(GPBMessage *)self descriptor];
  id v12 = [a4 extensionForDescriptor:v11 fieldNumber:TagFieldNumber];
  if (v12)
  {
    uint64_t v13 = v12;
    if ([v12 wireType] == TagWireType)
    {
      unsigned int v14 = [v13 isPackable];
LABEL_4:
      GPBExtensionMergeFromInputStream(v13, v14, (uint64_t *)a3, (uint64_t)a4, self);
LABEL_8:
      LOBYTE(v15) = 1;
      return v15;
    }
    if ([v13 isRepeated]
      && *(unsigned __int8 *)(v13[1] + 44) - 13 >= 4
      && [v13 alternateWireType] == TagWireType)
    {
      unsigned int v14 = [v13 isPackable] ^ 1;
      goto LABEL_4;
    }
  }
  else if ([v11 isWireFormat] && GPBWireFormatMakeTag(1, 3) == v5)
  {
    [(GPBMessage *)self parseMessageSet:a3 extensionRegistry:a4];
    goto LABEL_8;
  }
  unsigned int v15 = +[GPBUnknownFieldSet isFieldTag:v5];
  if (v15)
  {
    long long v16 = (void *)sub_1002DFE44(self);
    LOBYTE(v15) = [v16 mergeFieldFrom:v5 input:a3];
  }
  return v15;
}

- (void)addUnknownMapEntry:(int)a3 value:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v6 = (void *)sub_1002DFE44(self);

  [v6 addUnknownMapEntry:v5 value:a4];
}

- (void)mergeFromCodedInputStream:(id)a3 extensionRegistry:(id)a4
{
  uint64_t v6 = [(GPBMessage *)self descriptor];
  int v33 = [v6 file].syntax;
  unsigned int v7 = (void *)v6[1];
  id v8 = (char *)[v7 count];
  uint64_t Tag = GPBCodedInputStreamReadTag((uint64_t)a3 + 8);
  if (Tag)
  {
    uint64_t v10 = Tag;
    unint64_t v11 = 0;
    do
    {
      id v12 = v8;
      if (v8)
      {
        while (1)
        {
          if (v11 >= (unint64_t)v8) {
            unint64_t v11 = 0;
          }
          uint64_t v13 = [v7 objectAtIndexedSubscript:v11];
          if (GPBFieldTag((uint64_t)v13) == v10) {
            break;
          }
          ++v11;
          if (!--v12)
          {
            unsigned int v14 = v8;
            while (1)
            {
              if (v11 >= (unint64_t)v8) {
                unint64_t v11 = 0;
              }
              uint64_t v13 = [v7 objectAtIndexedSubscript:v11];
              if ([v13 fieldType] == 1
                && *(unsigned __int8 *)(v13[1] + 30) - 13 >= 4
                && GPBFieldAlternateTag((uint64_t)v13) == v10)
              {
                break;
              }
              ++v11;
              if (!--v14) {
                goto LABEL_15;
              }
            }
            if ([v13 isPackable]) {
              goto LABEL_25;
            }
LABEL_22:
            sub_1002E05D0(self, v13, v33, (uint64_t)a3);
            goto LABEL_57;
          }
        }
        unsigned int v15 = [v13 fieldType];
        if (v15 == 1)
        {
          if (![v13 isPackable])
          {
LABEL_25:
            sub_1002E0880(self, v13, v33, (uint64_t *)a3, (uint64_t)a4);
            goto LABEL_58;
          }
          goto LABEL_22;
        }
        if (v15)
        {
          [a3 readMapEntry:GPBGetMessageMapField_0(self, v13) extensionRegistry:a4 field:v13 parentMessage:self];
          goto LABEL_58;
        }
        uint64_t v16 = v13[1];
        switch(*(unsigned char *)(v16 + 30))
        {
          case 0:
            BOOL Bool = GPBCodedInputStreamReadBool((uint64_t *)a3 + 1);
            GPBSetBoolIvarWithFieldPrivate(self, (uint64_t)v13, Bool);
            break;
          case 1:
            int Fixed32 = GPBCodedInputStreamReadFixed32((void *)a3 + 1);
            goto LABEL_35;
          case 2:
            Sint Fixed32 = GPBCodedInputStreamReadSFixed32((void *)a3 + 1);
            goto LABEL_32;
          case 3:
            float Float = GPBCodedInputStreamReadFloat((void *)a3 + 1);
            GPBSetFloatIvarWithFieldPrivate(self, (uint64_t)v13, Float);
            break;
          case 4:
            uint64_t Fixed64 = GPBCodedInputStreamReadFixed64((void *)a3 + 1);
            goto LABEL_37;
          case 5:
            Suint64_t Fixed64 = GPBCodedInputStreamReadSFixed64((void *)a3 + 1);
            goto LABEL_47;
          case 6:
            double Double = GPBCodedInputStreamReadDouble((void *)a3 + 1);
            GPBSetDoubleIvarWithFieldPrivate(self, (uint64_t)v13, Double);
            break;
          case 7:
            Sint Fixed32 = GPBCodedInputStreamReadInt32((uint64_t *)a3 + 1);
            goto LABEL_32;
          case 8:
            Suint64_t Fixed64 = GPBCodedInputStreamReadInt64((uint64_t *)a3 + 1);
            goto LABEL_47;
          case 9:
            Sint Fixed32 = GPBCodedInputStreamReadSInt32((uint64_t *)a3 + 1);
LABEL_32:
            int v22 = SFixed32;
            uint64_t v23 = self;
            uint64_t v24 = (uint64_t)v13;
            goto LABEL_33;
          case 0xA:
            Suint64_t Fixed64 = GPBCodedInputStreamReadSInt64((uint64_t *)a3 + 1);
LABEL_47:
            GPBSetInt64IvarWithFieldPrivate(self, (uint64_t)v13, SFixed64);
            break;
          case 0xB:
            int Fixed32 = GPBCodedInputStreamReadUInt32((uint64_t *)a3 + 1);
LABEL_35:
            GPBSetUInt32IvarWithFieldPrivate(self, (uint64_t)v13, Fixed32);
            break;
          case 0xC:
            uint64_t Fixed64 = GPBCodedInputStreamReadUInt64((char *)a3 + 8);
LABEL_37:
            GPBSetUInt64IvarWithFieldPrivate(self, (uint64_t)v13, Fixed64);
            break;
          case 0xD:
            RetainedBytes = GPBCodedInputStreamReadRetainedBytes((uint64_t *)a3 + 1);
            goto LABEL_49;
          case 0xE:
            RetainedBytes = (void *)GPBCodedInputStreamReadRetainedString((uint64_t *)a3 + 1);
LABEL_49:
            unint64_t v28 = RetainedBytes;
            id v29 = self;
            uint64_t v30 = v13;
            goto LABEL_56;
          case 0xF:
            if (GPBGetHasIvar((uint64_t)self, *(_DWORD *)(v16 + 20), *(_DWORD *)(v16 + 16)))
            {
              [a3 readMessage:GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)v13) extensionRegistry:a4];
              break;
            }
            id v32 = objc_alloc_init((Class)[v13 msgClass]);
            [a3 readMessage:v32 extensionRegistry:a4];
            goto LABEL_55;
          case 0x10:
            if (GPBGetHasIvar((uint64_t)self, *(_DWORD *)(v16 + 20), *(_DWORD *)(v16 + 16)))
            {
              [a3 readGroup:*(unsigned int *)(v13[1] + 16) message:GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)v13) extensionRegistry:a4];
            }
            else
            {
              id v32 = objc_alloc_init((Class)[v13 msgClass]);
              [a3 readGroup:*(unsigned int *)(v13[1] + 16) message:v32 extensionRegistry:a4];
LABEL_55:
              id v29 = self;
              uint64_t v30 = v13;
              unint64_t v28 = v32;
LABEL_56:
              GPBSetRetainedObjectIvarWithFieldPrivate(v29, v30, v28);
            }
            break;
          case 0x11:
            uint64_t Enum = GPBCodedInputStreamReadEnum((uint64_t *)a3 + 1);
            if (v33 == 3 || [v13 isValidEnumValue:Enum])
            {
              uint64_t v23 = self;
              uint64_t v24 = (uint64_t)v13;
              int v22 = Enum;
LABEL_33:
              GPBSetInt32IvarWithFieldPrivate(v23, v24, v22);
            }
            else
            {
              [(id)sub_1002DFE44(self) mergeVarintField:*(unsigned int *)(v13[1] + 16) value:Enum];
            }
            break;
          default:
            break;
        }
LABEL_57:
        ++v11;
      }
      else
      {
LABEL_15:
        if (![(GPBMessage *)self parseUnknownField:a3 extensionRegistry:a4 tag:v10])return; {
      }
        }
LABEL_58:
      uint64_t v10 = GPBCodedInputStreamReadTag((uint64_t)a3 + 8);
    }
    while (v10);
  }
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  if (([v5 isSubclassOfClass:v6] & 1) == 0
    && ([v6 isSubclassOfClass:v5] & 1) == 0)
  {
    +[NSException raise:NSInvalidArgumentException, @"Classes must match %@ != %@", v5, v6 format];
  }
  GPBBecomeVisibleToAutocreator(self);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  unsigned int v7 = (void *)*((void *)[(id)objc_opt_class() descriptor] + 1);
  id v8 = [v7 countByEnumeratingWithState:&v66 objects:v72 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v67;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v67 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        unsigned int v13 = [v12 fieldType];
        if (v13 == 1)
        {
          uint64_t v18 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)a3, (uint64_t)v12);
          if (v18)
          {
            uint64_t v19 = v18;
            int v20 = *(unsigned __int8 *)(v12[1] + 30);
            if ((v20 - 13) > 3)
            {
              uint64_t v26 = GPBGetMessageRepeatedField_0(self, v12);
              if (v20 == 17) {
                [v26 addRawValuesFromArray:v19];
              }
              else {
                [v26 addValuesFromArray:v19];
              }
            }
            else
            {
              [GPBGetMessageRepeatedField_0(self, v12) addObjectsFromArray:v18];
            }
          }
        }
        else if (v13)
        {
          uint64_t v21 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)a3, (uint64_t)v12);
          if (!v21) {
            continue;
          }
          uint64_t v22 = v21;
          unsigned int v23 = [v12 mapKeyDataType];
          int v24 = *(unsigned __int8 *)(v12[1] + 30);
          if (v23 - 13 > 3 || (v24 - 13) > 3)
          {
            uint64_t v27 = GPBGetMessageMapField_0(self, v12);
            if (v24 == 17)
            {
              [v27 addRawEntriesFromDictionary:v22];
              continue;
            }
          }
          else
          {
            uint64_t v27 = GPBGetMessageMapField_0(self, v12);
          }
          [v27 addEntriesFromDictionary:v22];
        }
        else
        {
          uint64_t v14 = v12[1];
          int v16 = *(_DWORD *)(v14 + 16);
          unsigned int v15 = *(_DWORD *)(v14 + 20);
          if (GPBGetHasIvar((uint64_t)a3, v15, v16))
          {
            switch(*(unsigned char *)(v12[1] + 30))
            {
              case 0:
                int v32 = GPBGetMessageBoolField((uint64_t)a3, v12);
                GPBSetBoolIvarWithFieldPrivate(self, (uint64_t)v12, v32);
                break;
              case 1:
              case 0xB:
                int v29 = GPBGetMessageUInt32Field((uint64_t)a3, v12);
                GPBSetUInt32IvarWithFieldPrivate(self, (uint64_t)v12, v29);
                break;
              case 2:
              case 7:
              case 9:
              case 0x11:
                int v17 = GPBGetMessageInt32Field((uint64_t)a3, v12);
                GPBSetInt32IvarWithFieldPrivate(self, (uint64_t)v12, v17);
                break;
              case 3:
                float v33 = GPBGetMessageFloatField((uint64_t)a3, v12);
                GPBSetFloatIvarWithFieldPrivate(self, (uint64_t)v12, v33);
                break;
              case 4:
              case 0xC:
                id v30 = GPBGetMessageUInt64Field((uint64_t)a3, v12);
                GPBSetUInt64IvarWithFieldPrivate(self, (uint64_t)v12, (uint64_t)v30);
                break;
              case 5:
              case 8:
              case 0xA:
                id v28 = GPBGetMessageInt64Field((uint64_t)a3, v12);
                GPBSetInt64IvarWithFieldPrivate(self, (uint64_t)v12, (uint64_t)v28);
                break;
              case 6:
                double v34 = GPBGetMessageDoubleField((uint64_t)a3, v12);
                GPBSetDoubleIvarWithFieldPrivate(self, (uint64_t)v12, v34);
                break;
              case 0xD:
              case 0xE:
                id v31 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)a3, (uint64_t)v12);
                GPBSetObjectIvarWithFieldPrivate((uint64_t)self, (uint64_t)v12, v31);
                break;
              case 0xF:
              case 0x10:
                id obj = (id)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)a3, (uint64_t)v12);
                if (GPBGetHasIvar((uint64_t)self, v15, v16)) {
                  [GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)v12) mergeFrom:obj];
                }
                else {
                  GPBSetRetainedObjectIvarWithFieldPrivate(self, v12, [obj copy]);
                }
                break;
              default:
                continue;
            }
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v66 objects:v72 count:16];
    }
    while (v9);
  }
  unknownFields = self->unknownFields_;
  id v36 = [a3 unknownFields];
  if (unknownFields) {
    [(GPBUnknownFieldSet *)unknownFields mergeUnknownFields:v36];
  }
  else {
    [(GPBMessage *)self setUnknownFields:v36];
  }
  if ([*((id *)a3 + 2) count])
  {
    if (!self->extensionMap_)
    {
      uint64_t v52 = (void *)*((void *)a3 + 2);
      uint64_t v53 = NSZoneFromPointer(self);
      self->extensionMap_ = sub_1002DD614(v52, (uint64_t)v53);
      return;
    }
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id obja = (id)*((void *)a3 + 2);
    id v37 = [obja countByEnumeratingWithState:&v62 objects:v71 count:16];
    if (!v37) {
      return;
    }
    id v38 = v37;
    uint64_t v39 = *(void *)v63;
    uint64_t v54 = *(void *)v63;
    do
    {
      uint64_t v40 = 0;
      id v55 = v38;
      do
      {
        if (*(void *)v63 != v39) {
          objc_enumerationMutation(obja);
        }
        id v41 = *(void **)(*((void *)&v62 + 1) + 8 * (void)v40);
        id v42 = [*((id *)a3 + 2) objectForKey:v41];
        id v43 = [(NSMutableDictionary *)self->extensionMap_ objectForKey:v41];
        unsigned int v44 = *(unsigned __int8 *)(v41[1] + 44) - 15;
        if ([v41 isRepeated])
        {
          if (!v43)
          {
            id v43 = objc_alloc_init((Class)NSMutableArray);
            [(NSMutableDictionary *)self->extensionMap_ setObject:v43 forKey:v41];
          }
          if (v44 > 1)
          {
            [v43 addObjectsFromArray:v42];
            goto LABEL_71;
          }
          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          id v45 = [v42 countByEnumeratingWithState:&v58 objects:v70 count:16];
          if (v45)
          {
            id v46 = v45;
            uint64_t v47 = *(void *)v59;
            do
            {
              for (j = 0; j != v46; j = (char *)j + 1)
              {
                if (*(void *)v59 != v47) {
                  objc_enumerationMutation(v42);
                }
                id v49 = [*(id *)(*((void *)&v58 + 1) + 8 * (void)j) copy];
                [v43 addObject:v49];
              }
              id v46 = [v42 countByEnumeratingWithState:&v58 objects:v70 count:16];
            }
            while (v46);
          }
        }
        else
        {
          if (v44 > 1)
          {
            [(NSMutableDictionary *)self->extensionMap_ setObject:v42 forKey:v41];
            goto LABEL_71;
          }
          if (v43)
          {
            [v43 mergeFrom:v42];
          }
          else
          {
            id v50 = [v42 copy];
            [(NSMutableDictionary *)self->extensionMap_ setObject:v50 forKey:v41];
          }
        }
        uint64_t v39 = v54;
        id v38 = v55;
        if (([v41 isRepeated] & 1) == 0)
        {
          id v51 = [(NSMutableDictionary *)self->autocreatedExtensionMap_ objectForKey:v41];
          [(NSMutableDictionary *)self->autocreatedExtensionMap_ removeObjectForKey:v41];
          GPBClearMessageAutocreator((uint64_t)v51);
        }
LABEL_71:
        uint64_t v40 = (char *)v40 + 1;
      }
      while (v40 != v38);
      id v38 = [obja countByEnumeratingWithState:&v62 objects:v71 count:16];
    }
    while (v38);
  }
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    goto LABEL_39;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (uint64_t v5 = [(id)objc_opt_class() descriptor], objc_msgSend((id)objc_opt_class(), "descriptor") != v5))
  {
LABEL_4:
    LOBYTE(v6) = 0;
    return v6;
  }
  uint64_t v28 = *((void *)a3 + 8);
  messageStorage = self->messageStorage_;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = (id)v5[1];
  id v7 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v10);
        uint64_t v12 = *(void *)(v11 + 8);
        if ((*(_WORD *)(v12 + 28) & 0xF02) != 0)
        {
          unsigned int v13 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, *(void *)(*((void *)&v31 + 1) + 8 * (void)v10));
          uint64_t v14 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)a3, v11);
          if ([v13 count] || objc_msgSend(v14, "count"))
          {
            unsigned int v15 = v13;
            int v16 = v14;
LABEL_14:
            if (([v15 isEqual:v16] & 1) == 0) {
              goto LABEL_4;
            }
          }
        }
        else
        {
          int v18 = *(_DWORD *)(v12 + 16);
          unsigned int v17 = *(_DWORD *)(v12 + 20);
          int HasIvar = GPBGetHasIvar((uint64_t)self, v17, v18);
          int v20 = GPBGetHasIvar((uint64_t)a3, v17, v18);
          if (HasIvar) {
            BOOL v21 = v20 == 0;
          }
          else {
            BOOL v21 = 1;
          }
          if (!v21)
          {
            uint64_t v22 = *(void *)(v11 + 8);
            uint64_t v23 = *(unsigned int *)(v22 + 24);
            switch(*(unsigned char *)(v22 + 30))
            {
              case 0:
                BOOL v24 = GPBGetHasIvar((uint64_t)self, *(_DWORD *)(v22 + 24), 0);
                if (v24 != GPBGetHasIvar((uint64_t)a3, v23, 0)) {
                  goto LABEL_4;
                }
                goto LABEL_27;
              case 1:
              case 2:
              case 3:
              case 7:
              case 9:
              case 0xB:
              case 0x11:
                if (*(_DWORD *)((char *)messageStorage + v23) != *(_DWORD *)(v28 + v23)) {
                  goto LABEL_4;
                }
                goto LABEL_27;
              case 4:
              case 5:
              case 6:
              case 8:
              case 0xA:
              case 0xC:
                if (*(void *)((char *)messageStorage + v23) == *(void *)(v28 + v23)) {
                  goto LABEL_27;
                }
                goto LABEL_4;
              case 0xD:
              case 0xE:
              case 0xF:
              case 0x10:
                unsigned int v15 = *(void **)((char *)messageStorage + v23);
                int v16 = *(void **)(v28 + v23);
                goto LABEL_14;
              default:
                goto LABEL_27;
            }
          }
          if (HasIvar != v20) {
            goto LABEL_4;
          }
        }
LABEL_27:
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v25 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      id v8 = v25;
    }
    while (v25);
  }
  if (!-[NSMutableDictionary count](self->extensionMap_, "count") && ![*((id *)a3 + 2) count]
    || (unsigned int v6 = [(NSMutableDictionary *)self->extensionMap_ isEqual:*((void *)a3 + 2)]) != 0)
  {
    if ((uint64_t v26 = (void *)*((void *)a3 + 1), ![(GPBUnknownFieldSet *)self->unknownFields_ countOfFields])
      && ![v26 countOfFields]
      || (unsigned int v6 = [(GPBUnknownFieldSet *)self->unknownFields_ isEqual:v26]) != 0)
    {
LABEL_39:
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(id)objc_opt_class() descriptor];
  messageStorage = self->messageStorage_;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = *(void **)(v3 + 8);
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = *(void *)(v9 + 8);
        if ((*(_WORD *)(v10 + 28) & 0xF02) != 0)
        {
          id v11 = [[GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, *(void *)(*((void *)&v18 + 1) + 8 * i))] count];
          if (v11) {
            unint64_t v3 = (unint64_t)v11 + 361 * v3 + 19 * *(unsigned int *)(*(void *)(v9 + 8) + 16);
          }
        }
        else if (GPBGetHasIvar((uint64_t)self, *(_DWORD *)(v10 + 20), *(_DWORD *)(v10 + 16)))
        {
          uint64_t v12 = *(void *)(v9 + 8);
          uint64_t v13 = *(unsigned int *)(v12 + 24);
          switch(*(unsigned char *)(v12 + 30))
          {
            case 0:
              unint64_t v3 = 19 * v3 + GPBGetHasIvar((uint64_t)self, v13, 0);
              continue;
            case 1:
            case 2:
            case 3:
            case 7:
            case 9:
            case 0xB:
            case 0x11:
              uint64_t v14 = *(unsigned int *)((char *)messageStorage + v13);
              goto LABEL_13;
            case 4:
            case 5:
            case 6:
            case 8:
            case 0xA:
            case 0xC:
              uint64_t v14 = *(void *)((char *)messageStorage + v13);
LABEL_13:
              unint64_t v3 = v14 + 19 * v3;
              continue;
            case 0xD:
            case 0xE:
              id v15 = [*(id *)((char *)messageStorage + v13) hash];
              goto LABEL_16;
            case 0xF:
            case 0x10:
              unint64_t v3 = *(unsigned int *)(v12 + 16) + 19 * v3;
              id v15 = [(id)objc_opt_class() descriptor];
LABEL_16:
              unint64_t v3 = (unint64_t)v15 + 19 * v3;
              break;
            default:
              continue;
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = GPBTextFormatForMessage(self, @"    ");
  return +[NSString stringWithFormat:@"<%@ %p>: {\n%@}", objc_opt_class(), self, v3];
}

- (unint64_t)serializedSize
{
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v60 = [(id)objc_opt_class() descriptor];
  unint64_t v3 = (void *)v60[1];
  uint64_t v4 = 0;
  id v5 = [v3 countByEnumeratingWithState:&v102 objects:v111 count:16];
  if (!v5) {
    goto LABEL_89;
  }
  uint64_t v6 = *(void *)v103;
  uint64_t v61 = *(void *)v103;
  long long v62 = v3;
  do
  {
    uint64_t v7 = 0;
    id v63 = v5;
    do
    {
      if (*(void *)v103 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v102 + 1) + 8 * (void)v7);
      unsigned int v9 = [v8 fieldType];
      uint64_t v10 = v8[1];
      int v11 = *(unsigned __int8 *)(v10 + 30);
      if (v9 == 1)
      {
        uint64_t v14 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)v8);
        id v15 = [v14 count];
        if (v15)
        {
          uint64_t v98 = 0;
          v99 = &v98;
          uint64_t v100 = 0x2020000000;
          uint64_t v101 = 0;
          switch(v11)
          {
            case 0:
              v97[0] = _NSConcreteStackBlock;
              v97[1] = 3221225472;
              v97[2] = sub_1002E27C8;
              v97[3] = &unk_1003B9F90;
              v97[4] = &v98;
              [v14 enumerateValuesWithBlock:v97];
              break;
            case 1:
              v96[0] = _NSConcreteStackBlock;
              v96[1] = 3221225472;
              v96[2] = sub_1002E2804;
              v96[3] = &unk_1003B9FB8;
              v96[4] = &v98;
              [v14 enumerateValuesWithBlock:v96];
              break;
            case 2:
              v95[0] = _NSConcreteStackBlock;
              v95[1] = 3221225472;
              v95[2] = sub_1002E2840;
              v95[3] = &unk_1003B9FE0;
              v95[4] = &v98;
              [v14 enumerateValuesWithBlock:v95];
              break;
            case 3:
              v94[0] = _NSConcreteStackBlock;
              v94[1] = 3221225472;
              v94[2] = sub_1002E287C;
              v94[3] = &unk_1003BA008;
              v94[4] = &v98;
              [v14 enumerateValuesWithBlock:v94];
              break;
            case 4:
              v93[0] = _NSConcreteStackBlock;
              v93[1] = 3221225472;
              v93[2] = sub_1002E28B4;
              v93[3] = &unk_1003BA030;
              v93[4] = &v98;
              [v14 enumerateValuesWithBlock:v93];
              break;
            case 5:
              v92[0] = _NSConcreteStackBlock;
              v92[1] = 3221225472;
              v92[2] = sub_1002E28F0;
              v92[3] = &unk_1003BA058;
              v92[4] = &v98;
              [v14 enumerateValuesWithBlock:v92];
              break;
            case 6:
              v91[0] = _NSConcreteStackBlock;
              v91[1] = 3221225472;
              v91[2] = sub_1002E292C;
              v91[3] = &unk_1003BA080;
              v91[4] = &v98;
              [v14 enumerateValuesWithBlock:v91];
              break;
            case 7:
              v90[0] = _NSConcreteStackBlock;
              v90[1] = 3221225472;
              v90[2] = sub_1002E2964;
              v90[3] = &unk_1003B9FE0;
              v90[4] = &v98;
              [v14 enumerateValuesWithBlock:v90];
              break;
            case 8:
              v89[0] = _NSConcreteStackBlock;
              v89[1] = 3221225472;
              v89[2] = sub_1002E29A0;
              v89[3] = &unk_1003BA058;
              v89[4] = &v98;
              [v14 enumerateValuesWithBlock:v89];
              break;
            case 9:
              v88[0] = _NSConcreteStackBlock;
              v88[1] = 3221225472;
              v88[2] = sub_1002E29DC;
              v88[3] = &unk_1003B9FE0;
              v88[4] = &v98;
              [v14 enumerateValuesWithBlock:v88];
              break;
            case 10:
              v87[0] = _NSConcreteStackBlock;
              v87[1] = 3221225472;
              v87[2] = sub_1002E2A18;
              v87[3] = &unk_1003BA058;
              v87[4] = &v98;
              [v14 enumerateValuesWithBlock:v87];
              break;
            case 11:
              v86[0] = _NSConcreteStackBlock;
              v86[1] = 3221225472;
              v86[2] = sub_1002E2A54;
              v86[3] = &unk_1003B9FB8;
              v86[4] = &v98;
              [v14 enumerateValuesWithBlock:v86];
              break;
            case 12:
              v85[0] = _NSConcreteStackBlock;
              v85[1] = 3221225472;
              v85[2] = sub_1002E2A90;
              v85[3] = &unk_1003BA030;
              v85[4] = &v98;
              [v14 enumerateValuesWithBlock:v85];
              break;
            case 13:
              long long v83 = 0u;
              long long v84 = 0u;
              long long v81 = 0u;
              long long v82 = 0u;
              id v17 = [v14 countByEnumeratingWithState:&v81 objects:v110 count:16];
              if (v17)
              {
                uint64_t v18 = *(void *)v82;
                do
                {
                  for (i = 0; i != v17; i = (char *)i + 1)
                  {
                    if (*(void *)v82 != v18) {
                      objc_enumerationMutation(v14);
                    }
                    long long v20 = GPBComputeBytesSizeNoTag(*(void **)(*((void *)&v81 + 1) + 8 * i));
                    v99[3] += (uint64_t)v20;
                  }
                  id v17 = [v14 countByEnumeratingWithState:&v81 objects:v110 count:16];
                }
                while (v17);
              }
              break;
            case 14:
              long long v79 = 0u;
              long long v80 = 0u;
              long long v77 = 0u;
              long long v78 = 0u;
              id v21 = [v14 countByEnumeratingWithState:&v77 objects:v109 count:16];
              if (v21)
              {
                uint64_t v22 = *(void *)v78;
                do
                {
                  for (j = 0; j != v21; j = (char *)j + 1)
                  {
                    if (*(void *)v78 != v22) {
                      objc_enumerationMutation(v14);
                    }
                    BOOL v24 = GPBComputeStringSizeNoTag(*(void **)(*((void *)&v77 + 1) + 8 * (void)j));
                    v99[3] += (uint64_t)v24;
                  }
                  id v21 = [v14 countByEnumeratingWithState:&v77 objects:v109 count:16];
                }
                while (v21);
              }
              break;
            case 15:
              long long v75 = 0u;
              long long v76 = 0u;
              long long v73 = 0u;
              long long v74 = 0u;
              id v25 = [v14 countByEnumeratingWithState:&v73 objects:v108 count:16];
              if (v25)
              {
                uint64_t v26 = *(void *)v74;
                do
                {
                  for (k = 0; k != v25; k = (char *)k + 1)
                  {
                    if (*(void *)v74 != v26) {
                      objc_enumerationMutation(v14);
                    }
                    uint64_t v28 = GPBComputeMessageSizeNoTag(*(void **)(*((void *)&v73 + 1) + 8 * (void)k));
                    v99[3] += (uint64_t)v28;
                  }
                  id v25 = [v14 countByEnumeratingWithState:&v73 objects:v108 count:16];
                }
                while (v25);
              }
              break;
            case 16:
              long long v71 = 0u;
              long long v72 = 0u;
              long long v69 = 0u;
              long long v70 = 0u;
              id v29 = [v14 countByEnumeratingWithState:&v69 objects:v107 count:16];
              if (v29)
              {
                uint64_t v30 = *(void *)v70;
                do
                {
                  for (m = 0; m != v29; m = (char *)m + 1)
                  {
                    if (*(void *)v70 != v30) {
                      objc_enumerationMutation(v14);
                    }
                    uint64_t v32 = GPBComputeGroupSizeNoTag(*(void *)(*((void *)&v69 + 1) + 8 * (void)m));
                    v99[3] += v32;
                  }
                  id v29 = [v14 countByEnumeratingWithState:&v69 objects:v107 count:16];
                }
                while (v29);
              }
              break;
            case 17:
              v68[0] = _NSConcreteStackBlock;
              v68[1] = 3221225472;
              v68[2] = sub_1002E2ACC;
              v68[3] = &unk_1003B9FE0;
              v68[4] = &v98;
              [v14 enumerateRawValuesWithBlock:v68];
              break;
            default:
              break;
          }
          uint64_t v33 = v99[3];
          uint64_t v34 = GPBComputeTagSize(*(_DWORD *)(v8[1] + 16));
          unsigned int v35 = [v8 isPackable];
          uint64_t v36 = v33 + v4;
          uint64_t v37 = v34 << (v11 == 16);
          uint64_t v6 = v61;
          if (v35) {
            uint64_t v4 = v37 + v36 + GPBComputeSizeTSizeAsInt32NoTag(v99[3]);
          }
          else {
            uint64_t v4 = v36 + v37 * (void)v15;
          }
          unint64_t v3 = v62;
          id v5 = v63;
          _Block_object_dispose(&v98, 8);
        }
      }
      else if (v9)
      {
        if ((v11 - 13) <= 3 && [v8 mapKeyDataType] == 14)
        {
          int v16 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)v8);
          if (!v16) {
            goto LABEL_69;
          }
          uint64_t v13 = GPBDictionaryComputeSizeInternalHelper(v16, (uint64_t)v8);
        }
        else
        {
          uint64_t v13 = (uint64_t)[GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)v8) computeSerializedSizeAsField:v8];
        }
LABEL_19:
        v4 += v13;
      }
      else if (GPBGetHasIvar((uint64_t)self, *(_DWORD *)(v10 + 20), *(_DWORD *)(v10 + 16)))
      {
        int v12 = *(_DWORD *)(v8[1] + 16);
        switch(v11)
        {
          case 0:
            GPBGetMessageBoolField((uint64_t)self, v8);
            uint64_t v13 = GPBComputeBoolSize(v12);
            goto LABEL_19;
          case 1:
            GPBGetMessageUInt32Field((uint64_t)self, v8);
            uint64_t v13 = GPBComputeFixed32Size(v12);
            goto LABEL_19;
          case 2:
            GPBGetMessageInt32Field((uint64_t)self, v8);
            uint64_t v13 = GPBComputeSFixed32Size(v12);
            goto LABEL_19;
          case 3:
            GPBGetMessageFloatField((uint64_t)self, v8);
            uint64_t v13 = GPBComputeFloatSize(v12);
            goto LABEL_19;
          case 4:
            GPBGetMessageUInt64Field((uint64_t)self, v8);
            uint64_t v13 = GPBComputeFixed64Size(v12);
            goto LABEL_19;
          case 5:
            GPBGetMessageInt64Field((uint64_t)self, v8);
            uint64_t v13 = GPBComputeSFixed64Size(v12);
            goto LABEL_19;
          case 6:
            GPBGetMessageDoubleField((uint64_t)self, v8);
            uint64_t v13 = GPBComputeDoubleSize(v12);
            goto LABEL_19;
          case 7:
            unsigned int v38 = GPBGetMessageInt32Field((uint64_t)self, v8);
            uint64_t v13 = GPBComputeInt32Size(v12, v38);
            goto LABEL_19;
          case 8:
            id v39 = GPBGetMessageInt64Field((uint64_t)self, v8);
            uint64_t v13 = GPBComputeInt64Size(v12, (unint64_t)v39);
            goto LABEL_19;
          case 9:
            int v40 = GPBGetMessageInt32Field((uint64_t)self, v8);
            uint64_t v13 = GPBComputeSInt32Size(v12, v40);
            goto LABEL_19;
          case 10:
            id v41 = GPBGetMessageInt64Field((uint64_t)self, v8);
            uint64_t v13 = GPBComputeSInt64Size(v12, (uint64_t)v41);
            goto LABEL_19;
          case 11:
            unsigned int v42 = GPBGetMessageUInt32Field((uint64_t)self, v8);
            uint64_t v13 = GPBComputeUInt32Size(v12, v42);
            goto LABEL_19;
          case 12:
            id v43 = GPBGetMessageUInt64Field((uint64_t)self, v8);
            uint64_t v13 = GPBComputeUInt64Size(v12, (unint64_t)v43);
            goto LABEL_19;
          case 13:
            unsigned int v44 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)v8);
            uint64_t v13 = (uint64_t)GPBComputeBytesSize(v12, v44);
            goto LABEL_19;
          case 14:
            id v45 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)v8);
            uint64_t v13 = (uint64_t)GPBComputeStringSize(v12, v45);
            goto LABEL_19;
          case 15:
            id v46 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)v8);
            uint64_t v13 = (uint64_t)GPBComputeMessageSize(v12, v46);
            goto LABEL_19;
          case 16:
            uint64_t v47 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)v8);
            uint64_t v13 = (uint64_t)GPBComputeGroupSize(v12, v47);
            goto LABEL_19;
          case 17:
            unsigned int v48 = GPBGetMessageInt32Field((uint64_t)self, v8);
            uint64_t v13 = GPBComputeEnumSize(v12, v48);
            goto LABEL_19;
          default:
            break;
        }
      }
LABEL_69:
      uint64_t v7 = (char *)v7 + 1;
    }
    while (v7 != v5);
    id v49 = [v3 countByEnumeratingWithState:&v102 objects:v111 count:16];
    id v5 = v49;
  }
  while (v49);
LABEL_89:
  unsigned int v50 = [v60 isWireFormat];
  unknownFields = self->unknownFields_;
  if (v50) {
    unint64_t v52 = [(GPBUnknownFieldSet *)unknownFields serializedSizeAsMessageSet];
  }
  else {
    unint64_t v52 = [(GPBUnknownFieldSet *)unknownFields serializedSize];
  }
  unint64_t v53 = v52;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  extensionMap = self->extensionMap_;
  id v55 = [(NSMutableDictionary *)extensionMap countByEnumeratingWithState:&v64 objects:v106 count:16];
  unint64_t v56 = v53 + v4;
  if (v55)
  {
    uint64_t v57 = *(void *)v65;
    do
    {
      for (n = 0; n != v55; n = (char *)n + 1)
      {
        if (*(void *)v65 != v57) {
          objc_enumerationMutation(extensionMap);
        }
        v56 += GPBComputeExtensionSerializedSizeIncludingTag(*(void *)(*((void *)&v64 + 1) + 8 * (void)n), [(NSMutableDictionary *)self->extensionMap_ objectForKey:*(void *)(*((void *)&v64 + 1) + 8 * (void)n)]);
      }
      id v55 = [(NSMutableDictionary *)extensionMap countByEnumeratingWithState:&v64 objects:v106 count:16];
    }
    while (v55);
  }
  return v56;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  id v4 = a1;
  id v5 = [a1 descriptor];
  if (!v5)
  {
    v44.receiver = v4;
    v44.super_class = (Class)&OBJC_METACLASS___GPBMessage;
    return [super resolveInstanceMethod:a3];
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v29 = v5;
  uint64_t v6 = (void *)*((void *)v5 + 1);
  id v7 = [v6 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (!v7)
  {
LABEL_74:
    v31.receiver = v4;
    v31.super_class = (Class)&OBJC_METACLASS___GPBMessage;
    return [super resolveInstanceMethod:a3];
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v41;
  id v30 = v4;
LABEL_4:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v41 != v9) {
      objc_enumerationMutation(v6);
    }
    uint64_t v11 = *(void *)(*((void *)&v40 + 1) + 8 * v10);
    int v12 = *(int32x2_t **)(v11 + 8);
    uint64_t v13 = *(const char **)(v11 + 24);
    if ((v12[3].i16[2] & 0xF02) == 0) {
      break;
    }
    if (v13 == a3)
    {
      if ([(id)v11 fieldType] == 1)
      {
        int v16 = v35;
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        id v17 = sub_1002E3E24;
      }
      else
      {
        int v16 = v34;
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        id v17 = sub_1002E3EC0;
      }
      id v4 = v30;
      v16[2] = v17;
      v16[3] = &unk_1003BA100;
      v16[4] = v11;
      uint64_t v18 = imp_implementationWithBlock(v16);
      long long v19 = "getArray";
      if (!v18) {
        goto LABEL_74;
      }
      goto LABEL_36;
    }
    if (*(SEL *)(v11 + 32) == a3)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1002E3F80;
      block[3] = &unk_1003BA120;
      block[4] = v11;
      uint64_t v18 = imp_implementationWithBlock(block);
      long long v19 = "setArray:";
      goto LABEL_35;
    }
    if (*(SEL *)(v11 + 40) == a3)
    {
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1002E3F90;
      v32[3] = &unk_1003BA140;
      v32[4] = v11;
      uint64_t v18 = imp_implementationWithBlock(v32);
      long long v19 = "getArrayCount";
      goto LABEL_35;
    }
LABEL_18:
    if (v8 == (id)++v10)
    {
      id v8 = [v6 countByEnumeratingWithState:&v40 objects:v50 count:16];
      id v4 = v30;
      if (v8) {
        goto LABEL_4;
      }
      goto LABEL_74;
    }
  }
  if (v13 != a3)
  {
    if (*(SEL *)(v11 + 32) == a3)
    {
      id v4 = v30;
      switch(v12[3].i8[6])
      {
        case 0:
          id v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setBool_;
          id v21 = &unk_1003BA0C0;
          uint64_t v22 = sub_1002E4C50;
          goto LABEL_73;
        case 1:
          id v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setFixed32_;
          id v21 = &unk_1003BA220;
          uint64_t v22 = sub_1002E4C60;
          goto LABEL_73;
        case 2:
          id v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setSFixed32_;
          id v21 = &unk_1003BA240;
          uint64_t v22 = sub_1002E4C70;
          goto LABEL_73;
        case 3:
          id v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setFloat_;
          id v21 = &unk_1003BA260;
          uint64_t v22 = sub_1002E4C80;
          goto LABEL_73;
        case 4:
          id v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setFixed64_;
          id v21 = &unk_1003BA280;
          uint64_t v22 = sub_1002E4C90;
          goto LABEL_73;
        case 5:
          id v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setSFixed64_;
          id v21 = &unk_1003BA2A0;
          uint64_t v22 = sub_1002E4CA0;
          goto LABEL_73;
        case 6:
          id v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setDouble_;
          id v21 = &unk_1003BA2C0;
          uint64_t v22 = sub_1002E4CB0;
          goto LABEL_73;
        case 7:
          id v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setInt32_;
          id v21 = &unk_1003BA240;
          uint64_t v22 = sub_1002E4CC0;
          goto LABEL_73;
        case 8:
          id v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setInt64_;
          id v21 = &unk_1003BA2A0;
          uint64_t v22 = sub_1002E4CD0;
          goto LABEL_73;
        case 9:
          id v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setSInt32_;
          id v21 = &unk_1003BA240;
          uint64_t v22 = sub_1002E4CE0;
          goto LABEL_73;
        case 0xA:
          id v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setSInt64_;
          id v21 = &unk_1003BA2A0;
          uint64_t v22 = sub_1002E4CF0;
          goto LABEL_73;
        case 0xB:
          id v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setUInt32_;
          id v21 = &unk_1003BA220;
          uint64_t v22 = sub_1002E4D00;
          goto LABEL_73;
        case 0xC:
          id v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setUInt64_;
          id v21 = &unk_1003BA280;
          uint64_t v22 = sub_1002E4D10;
          goto LABEL_73;
        case 0xD:
          id v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setBytes_;
          id v21 = &unk_1003BA120;
          uint64_t v22 = sub_1002E4D20;
          goto LABEL_73;
        case 0xE:
          id v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setString_;
          id v21 = &unk_1003BA120;
          uint64_t v22 = sub_1002E4D68;
          goto LABEL_73;
        case 0xF:
          id v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setMessage_;
          id v21 = &unk_1003BA120;
          uint64_t v22 = sub_1002E4DB0;
          goto LABEL_73;
        case 0x10:
          id v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setGroup_;
          id v21 = &unk_1003BA120;
          uint64_t v22 = sub_1002E4DC0;
          goto LABEL_73;
        case 0x11:
          id v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setEnum_;
          id v21 = &unk_1003BA240;
          uint64_t v22 = sub_1002E4DD0;
          goto LABEL_73;
        default:
          goto LABEL_38;
      }
    }
    if (*(SEL *)(v11 + 40) == a3)
    {
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      int32x2_t v23 = v12[2];
      v39[2] = sub_1002E3D28;
      v39[3] = &unk_1003BA0A0;
      v39[4] = vrev64_s32(v23);
      uint64_t v18 = imp_implementationWithBlock(v39);
      long long v19 = "getBool";
      goto LABEL_35;
    }
    if (*(SEL *)(v11 + 48) == a3)
    {
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_1002E3D38;
      v38[3] = &unk_1003BA0C0;
      v38[4] = v11;
      uint64_t v18 = imp_implementationWithBlock(v38);
      long long v19 = "setBool:";
      goto LABEL_35;
    }
    uint64_t v14 = *(void *)(v11 + 16);
    if (v14 && *(SEL *)(v14 + 24) == a3)
    {
      __int32 v24 = v12[2].i32[1];
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_1002E3E14;
      v36[3] = &unk_1003BA0E0;
      __int32 v37 = v24;
      uint64_t v18 = imp_implementationWithBlock(v36);
      long long v19 = "getEnum";
LABEL_35:
      id v4 = v30;
      if (!v18) {
        goto LABEL_74;
      }
      goto LABEL_36;
    }
    goto LABEL_18;
  }
  id v4 = v30;
  switch(v12[3].i8[6])
  {
    case 0:
      id v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getBool;
      id v21 = &unk_1003BA160;
      uint64_t v22 = sub_1002E4B30;
      break;
    case 1:
      id v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getFixed32;
      id v21 = &unk_1003BA180;
      uint64_t v22 = sub_1002E4B40;
      break;
    case 2:
      id v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getSFixed32;
      id v21 = &unk_1003BA1A0;
      uint64_t v22 = sub_1002E4B50;
      break;
    case 3:
      id v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getFloat;
      id v21 = &unk_1003BA1C0;
      uint64_t v22 = sub_1002E4B60;
      break;
    case 4:
      id v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getFixed64;
      id v21 = &unk_1003BA140;
      uint64_t v22 = sub_1002E4B70;
      break;
    case 5:
      id v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getSFixed64;
      id v21 = &unk_1003BA1E0;
      uint64_t v22 = sub_1002E4B80;
      break;
    case 6:
      id v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getDouble;
      id v21 = &unk_1003BA200;
      uint64_t v22 = sub_1002E4B90;
      break;
    case 7:
      id v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getInt32;
      id v21 = &unk_1003BA1A0;
      uint64_t v22 = sub_1002E4BA0;
      break;
    case 8:
      id v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getInt64;
      id v21 = &unk_1003BA1E0;
      uint64_t v22 = sub_1002E4BB0;
      break;
    case 9:
      id v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getSInt32;
      id v21 = &unk_1003BA1A0;
      uint64_t v22 = sub_1002E4BC0;
      break;
    case 0xA:
      id v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getSInt64;
      id v21 = &unk_1003BA1E0;
      uint64_t v22 = sub_1002E4BD0;
      break;
    case 0xB:
      id v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getUInt32;
      id v21 = &unk_1003BA180;
      uint64_t v22 = sub_1002E4BE0;
      break;
    case 0xC:
      id v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getUInt64;
      id v21 = &unk_1003BA140;
      uint64_t v22 = sub_1002E4BF0;
      break;
    case 0xD:
      id v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getBytes;
      id v21 = &unk_1003BA100;
      uint64_t v22 = sub_1002E4C00;
      break;
    case 0xE:
      id v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getString;
      id v21 = &unk_1003BA100;
      uint64_t v22 = sub_1002E4C10;
      break;
    case 0xF:
      id v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getMessage;
      id v21 = &unk_1003BA100;
      uint64_t v22 = sub_1002E4C20;
      break;
    case 0x10:
      id v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getGroup;
      id v21 = &unk_1003BA100;
      uint64_t v22 = sub_1002E4C30;
      break;
    case 0x11:
      id v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getEnum;
      id v21 = &unk_1003BA1A0;
      uint64_t v22 = sub_1002E4C40;
      break;
    default:
LABEL_38:
      uint64_t v18 = 0;
      long long v19 = 0;
      goto LABEL_35;
  }
LABEL_73:
  uint64_t v47 = v22;
  unsigned int v48 = v21;
  uint64_t v49 = v11;
  uint64_t v18 = imp_implementationWithBlock(&v45);
  long long v19 = *v20;
  if (!v18) {
    goto LABEL_74;
  }
LABEL_36:
  BOOL v25 = 1;
  uint64_t v26 = GPBMessageEncodingForSelector(v19, 1);
  uint64_t v27 = (objc_class *)[v29 messageClass];
  if (class_addMethod(v27, a3, v18, v26)) {
    return v25;
  }
  return GPBClassHasSel(v27, a3);
}

+ (BOOL)resolveClassMethod:(SEL)a3
{
  if (GPBResolveExtensionClassMethod((objc_class *)a1, a3)) {
    return 1;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___GPBMessage;
  return [super resolveClassMethod:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GPBMessage)initWithCoder:(id)a3
{
  id v4 = [(GPBMessage *)self init];
  if (v4)
  {
    id v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"GPBData"];
    if ([v5 length]) {
      [(GPBMessage *)v4 mergeFromData:v5 extensionRegistry:0];
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = [(GPBMessage *)self data];
  if ([v4 length])
  {
    [a3 encodeObject:v4 forKey:@"GPBData"];
  }
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

@end