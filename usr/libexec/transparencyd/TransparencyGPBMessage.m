@interface TransparencyGPBMessage
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)resolveClassMethod:(SEL)a3;
+ (BOOL)resolveInstanceMethod:(SEL)a3;
+ (BOOL)supportsSecureCoding;
+ (TransparencyGPBMessage)allocWithZone:(_NSZone *)a3;
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
- (TransparencyGPBMessage)init;
- (TransparencyGPBMessage)initWithCodedInputStream:(id)a3 extensionRegistry:(id)a4 error:(id *)a5;
- (TransparencyGPBMessage)initWithCoder:(id)a3;
- (TransparencyGPBMessage)initWithData:(id)a3 error:(id *)a4;
- (TransparencyGPBMessage)initWithData:(id)a3 extensionRegistry:(id)a4 error:(id *)a5;
- (TransparencyGPBUnknownFieldSet)unknownFields;
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
- (void)writeExtensionsToCodedOutputStream:(id)a3 range:(TransparencyGPBExtensionRange)a4 sortedExtensions:(id)a5;
- (void)writeField:(id)a3 toCodedOutputStream:(id)a4;
- (void)writeToCodedOutputStream:(id)a3;
- (void)writeToOutputStream:(id)a3;
@end

@implementation TransparencyGPBMessage

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

+ (TransparencyGPBMessage)allocWithZone:(_NSZone *)a3
{
  NSUInteger v5 = *((unsigned int *)[a1 descriptor] + 6);

  return (TransparencyGPBMessage *)NSAllocateObject((Class)a1, v5, a3);
}

+ (id)descriptor
{
  id result = (id)qword_10032EB50;
  if (!qword_10032EB50)
  {
    qword_10032EB58 = [[TransparencyGPBFileDescriptor alloc] initWithPackage:@"internal" syntax:2];
    LODWORD(v3) = 0;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:objc_opt_class() rootClass:0 file:qword_10032EB58 fields:0 fieldCount:0 storageSize:0 flags:v3];
    qword_10032EB50 = (uint64_t)result;
  }
  return result;
}

+ (id)message
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (TransparencyGPBMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)TransparencyGPBMessage;
  id v2 = [(TransparencyGPBMessage *)&v5 init];
  if (v2)
  {
    uint64_t v3 = (objc_class *)objc_opt_class();
    v2->messageStorage_ = (TransparencyGPBMessage_Storage *)((char *)v2 + class_getInstanceSize(v3));
    v2->readOnlyLock_._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (TransparencyGPBMessage)initWithData:(id)a3 error:(id *)a4
{
  return [(TransparencyGPBMessage *)self initWithData:a3 extensionRegistry:0 error:a4];
}

- (TransparencyGPBMessage)initWithData:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  v8 = [(TransparencyGPBMessage *)self init];
  v9 = v8;
  if (v8)
  {
    [(TransparencyGPBMessage *)v8 mergeFromData:a3 extensionRegistry:a4];
    if (a5) {
      *a5 = 0;
    }
  }
  return v9;
}

- (TransparencyGPBMessage)initWithCodedInputStream:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  v8 = [(TransparencyGPBMessage *)self init];
  v9 = v8;
  if (v8)
  {
    [(TransparencyGPBMessage *)v8 mergeFromCodedInputStream:a3 extensionRegistry:a4];
    if (a5) {
      *a5 = 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  [(TransparencyGPBMessage *)self internalClear:0];
  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBMessage;
  [(TransparencyGPBMessage *)&v3 dealloc];
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
          uint64_t v17 = sub_1001683BC((uint64_t)v10, *(void *)(*((void *)&v43 + 1) + 8 * (void)v14));
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
              v38[2] = sub_10015D3C0;
              v38[3] = &unk_1002C2BB0;
              v38[4] = v22;
              v38[5] = a4;
              [v18 enumerateKeysAndObjectsUsingBlock:v38];
LABEL_36:
              id v12 = v37;
              id v33 = v18;
              sub_100168A48((uint64_t)v7, v15, v22);
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
          if (!sub_1001688EC((uint64_t)v10, *(_DWORD *)(v16 + 20), *(_DWORD *)(v16 + 16)))
          {
            *(void *)(v7[8] + *(unsigned int *)(v15[1] + 24)) = 0;
            goto LABEL_37;
          }
LABEL_27:
          v29 = (void *)sub_1001683BC((uint64_t)v10, (uint64_t)v15);
          id v30 = [v29 copyWithZone:a4];
          id v31 = v29;
          sub_100168A48((uint64_t)v7, v15, v30);
          goto LABEL_37;
        }
        if ((v28 - 13) <= 3 && sub_1001688EC((uint64_t)v10, *(_DWORD *)(v16 + 20), *(_DWORD *)(v16 + 16))) {
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
  id v5 = [(TransparencyGPBMessage *)self descriptor];
  v6 = [[[v5 messageClass] allocWithZone:a3] init];
  [(TransparencyGPBMessage *)self copyFieldsInto:v6 zone:a3 descriptor:v5];
  v6[1] = [(TransparencyGPBUnknownFieldSet *)self->unknownFields_ copyWithZone:a3];
  v6[2] = sub_10015D4A4(self->extensionMap_, (uint64_t)a3);
  return v6;
}

- (void)clear
{
}

- (void)internalClear:(BOOL)a3
{
  BOOL v24 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v23 = [(TransparencyGPBMessage *)self descriptor];
  v4 = (void *)v23[1];
  id v5 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v30;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v10 = v9[1];
        if ((*(_WORD *)(v10 + 28) & 0xF02) != 0)
        {
          uint64_t v11 = sub_1001683BC((uint64_t)self, *(void *)(*((void *)&v29 + 1) + 8 * i));
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
                uint64_t v13 = &OBJC_IVAR___TransparencyGPBAutocreatedArray__autocreator;
                goto LABEL_24;
              }
LABEL_27:

              continue;
            }
            uint64_t v13 = &OBJC_IVAR___TransparencyGPBInt32Array__autocreator;
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
              uint64_t v13 = &OBJC_IVAR___TransparencyGPBAutocreatedDictionary__autocreator;
              goto LABEL_24;
            }
            uint64_t v16 = 8;
          }
          uint64_t v17 = (TransparencyGPBMessage **)&v12[v16];
          if (*v17 == self) {
            *uint64_t v17 = 0;
          }
          goto LABEL_27;
        }
        int v14 = *(unsigned __int8 *)(v10 + 30);
        if ((v14 - 15) <= 1)
        {
          sub_100168954((uint64_t)self, *(void *)(*((void *)&v29 + 1) + 8 * i));
          v15 = (void *)sub_1001683BC((uint64_t)self, (uint64_t)v9);
LABEL_21:

          continue;
        }
        if ((v14 - 13) <= 3 && sub_1001688EC((uint64_t)self, *(_DWORD *)(v10 + 20), *(_DWORD *)(v10 + 16)))
        {
          v15 = sub_10015DAA0((uint64_t)self, v9);
          goto LABEL_21;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v6);
  }
  id v18 = [(NSMutableDictionary *)self->autocreatedExtensionMap_ allValues];

  self->autocreatedExtensionMap_ = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v19 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        sub_10015CAA0(*(void *)(*((void *)&v25 + 1) + 8 * (void)j));
      }
      id v20 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v20);
  }

  self->extensionMap_ = 0;
  self->unknownFields_ = 0;
  if (v24) {
    bzero(self->messageStorage_, *((unsigned int *)v23 + 6));
  }
}

- (BOOL)isInitialized
{
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  objc_super v3 = (void *)*((void *)[(TransparencyGPBMessage *)self descriptor] + 1);
  id v4 = [v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v29;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v29 != v5) {
        objc_enumerationMutation(v3);
      }
      uint64_t v7 = *(void **)(*((void *)&v28 + 1) + 8 * v6);
      if ([v7 isRequired]
        && !sub_1001688EC((uint64_t)self, *(_DWORD *)(v7[1] + 20), *(_DWORD *)(v7[1] + 16)))
      {
        return 0;
      }
      if (*(unsigned __int8 *)(v7[1] + 30) - 15 > 1) {
        goto LABEL_31;
      }
      unsigned int v8 = [v7 fieldType];
      if (v8 == 1)
      {
        v9 = (void *)sub_1001683BC((uint64_t)self, (uint64_t)v7);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v10 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v25;
LABEL_15:
          uint64_t v12 = 0;
          while (1)
          {
            if (*(void *)v25 != v11) {
              objc_enumerationMutation(v9);
            }
            if (![*(id *)(*((void *)&v24 + 1) + 8 * v12) isInitialized]) {
              return 0;
            }
            if (v10 == (id)++v12)
            {
              id v10 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
              if (v10) {
                goto LABEL_15;
              }
              goto LABEL_31;
            }
          }
        }
        goto LABEL_31;
      }
      if (v8)
      {
        BOOL v13 = [v7 mapKeyDataType] == 14;
        int v14 = (void *)sub_1001683BC((uint64_t)self, (uint64_t)v7);
        if (!v13)
        {
          if (v14 && ![v14 isInitialized]) {
            return 0;
          }
          goto LABEL_31;
        }
        if (v14)
        {
          unsigned __int8 v15 = sub_10013E160(v14);
          goto LABEL_27;
        }
      }
      else if ([v7 isRequired] {
             || sub_1001688EC((uint64_t)self, *(_DWORD *)(v7[1] + 20), *(_DWORD *)(v7[1] + 16)))
      }
      {
        unsigned __int8 v15 = [sub_1001695B0((uint64_t)self, v7) isInitialized];
LABEL_27:
        if ((v15 & 1) == 0) {
          return 0;
        }
      }
LABEL_31:
      if ((id)++v6 == v4)
      {
        id v4 = [v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  extensionMap = self->extensionMap_;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10015DEB0;
  v19[3] = &unk_1002C2BD8;
  v19[4] = &v20;
  [(NSMutableDictionary *)extensionMap enumerateKeysAndObjectsUsingBlock:v19];
  BOOL v17 = *((unsigned char *)v21 + 24) != 0;
  _Block_object_dispose(&v20, 8);
  return v17;
}

- (id)descriptor
{
  id v2 = objc_opt_class();

  return [v2 descriptor];
}

- (id)data
{
  objc_super v3 = +[NSMutableData dataWithLength:[(TransparencyGPBMessage *)self serializedSize]];
  id v4 = [[TransparencyGPBCodedOutputStream alloc] initWithData:v3];
  [(TransparencyGPBMessage *)self writeToCodedOutputStream:v4];

  return v3;
}

- (id)delimitedData
{
  unint64_t v3 = [(TransparencyGPBMessage *)self serializedSize];
  id v4 = +[NSMutableData dataWithLength:sub_100139664(v3) + v3];
  uint64_t v5 = [[TransparencyGPBCodedOutputStream alloc] initWithData:v4];
  [(TransparencyGPBMessage *)self writeDelimitedToCodedOutputStream:v5];

  return v4;
}

- (void)writeToOutputStream:(id)a3
{
  id v4 = [[TransparencyGPBCodedOutputStream alloc] initWithOutputStream:a3];
  [(TransparencyGPBMessage *)self writeToCodedOutputStream:v4];
}

- (void)writeToCodedOutputStream:(id)a3
{
  uint64_t v5 = [(TransparencyGPBMessage *)self descriptor];
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
        [(TransparencyGPBMessage *)self writeExtensionsToCodedOutputStream:a3 range:v8[v13] sortedExtensions:v12];
        int v14 = v7;
        ++v13;
      }
      else if (v13 == v9 {
             || (unsigned __int8 v15 = [v6 objectAtIndexedSubscript:v14],
      }
                 uint64_t v16 = &v8[v13],
                 *(_DWORD *)(v15[1] + 16) < *(_DWORD *)v16))
      {
        -[TransparencyGPBMessage writeField:toCodedOutputStream:](self, "writeField:toCodedOutputStream:", [v6 objectAtIndexedSubscript:v14++], a3);
      }
      else
      {
        ++v13;
        [(TransparencyGPBMessage *)self writeExtensionsToCodedOutputStream:a3 range:*v16 sortedExtensions:v12];
      }
    }
    while (v14 < v7 || v13 < v9);
  }
  unsigned __int8 v17 = [v19 isWireFormat];
  unknownFields = self->unknownFields_;
  if (v17)
  {
    [(TransparencyGPBUnknownFieldSet *)unknownFields writeAsMessageSetTo:a3];
  }
  else
  {
    [(TransparencyGPBUnknownFieldSet *)unknownFields writeToCodedOutputStream:a3];
  }
}

- (void)writeDelimitedToOutputStream:(id)a3
{
  id v4 = [[TransparencyGPBCodedOutputStream alloc] initWithOutputStream:a3];
  [(TransparencyGPBMessage *)self writeDelimitedToCodedOutputStream:v4];
}

- (void)writeDelimitedToCodedOutputStream:(id)a3
{
  [a3 writeRawVarintSizeTAs32:-[TransparencyGPBMessage serializedSize](self, "serializedSize")];

  [(TransparencyGPBMessage *)self writeToCodedOutputStream:a3];
}

- (void)writeField:(id)a3 toCodedOutputStream:(id)a4
{
  unsigned int v7 = [a3 fieldType];
  if (v7
    || sub_1001688EC((uint64_t)self, *(_DWORD *)(*((void *)a3 + 1) + 20), *(_DWORD *)(*((void *)a3 + 1) + 16)))
  {
    uint64_t v8 = *((void *)a3 + 1);
    uint64_t v9 = *(unsigned int *)(v8 + 16);
    switch(*(unsigned char *)(v8 + 30))
    {
      case 0:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v10 = sub_10013CE54((uint64_t)a3);
          }
          else {
            uint64_t v10 = 0;
          }
          uint64_t v49 = sub_1001683BC((uint64_t)self, (uint64_t)a3);
          _[a4 writeBoolArray:v9 values:v49 tag:v10];
        }
        else
        {
          if (v7) {
            goto LABEL_134;
          }
          BOOL v28 = sub_100168F08((uint64_t)self, a3);
          [a4 writeBool:v9 value:v28];
        }
        break;
      case 1:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v11 = sub_10013CE54((uint64_t)a3);
          }
          else {
            uint64_t v11 = 0;
          }
          uint64_t v50 = sub_1001683BC((uint64_t)self, (uint64_t)a3);
          [a4 writeFixed32Array:v9 values:v50 tag:v11];
        }
        else
        {
          if (v7) {
            goto LABEL_134;
          }
          id v29 = sub_100168CD0((uint64_t)self, a3);
          [a4 writeFixed32:v9 value:v29];
        }
        break;
      case 2:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v12 = sub_10013CE54((uint64_t)a3);
          }
          else {
            uint64_t v12 = 0;
          }
          uint64_t v51 = sub_1001683BC((uint64_t)self, (uint64_t)a3);
          _[a4 writeSFixed32Array:v9 values:v51 tag:v12];
        }
        else
        {
          if (v7) {
            goto LABEL_134;
          }
          id v30 = sub_100168CD0((uint64_t)self, a3);
          [_objc_msgSend(a4, "writeSFixed32:value:", v9, v30, v31);
        }
        break;
      case 3:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v13 = sub_10013CE54((uint64_t)a3);
          }
          else {
            uint64_t v13 = 0;
          }
          uint64_t v52 = sub_1001683BC((uint64_t)self, (uint64_t)a3);
          _[a4 writeFloatArray:v9 values:v52 tag:v13];
        }
        else
        {
          if (v7) {
            goto LABEL_134;
          }
          *(float *)&double v32 = sub_100169280((uint64_t)self, a3);
          [a4 writeFloat:v9 value:v32];
        }
        break;
      case 4:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v14 = sub_10013CE54((uint64_t)a3);
          }
          else {
            uint64_t v14 = 0;
          }
          uint64_t v53 = sub_1001683BC((uint64_t)self, (uint64_t)a3);
          [a4 writeFixed64Array:v9 values:v53 tag:v14];
        }
        else
        {
          if (v7) {
            goto LABEL_134;
          }
          id v33 = sub_100169104((uint64_t)self, a3);
          [a4 writeFixed64:v9 value:v33];
        }
        break;
      case 5:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v15 = sub_10013CE54((uint64_t)a3);
          }
          else {
            uint64_t v15 = 0;
          }
          uint64_t v54 = sub_1001683BC((uint64_t)self, (uint64_t)a3);
          _[a4 writeSFixed64Array:v9 values:v54 tag:v15];
        }
        else
        {
          if (v7) {
            goto LABEL_134;
          }
          id v34 = sub_100169104((uint64_t)self, a3);
          [a4 writeSFixed64:v9 value:v34];
        }
        break;
      case 6:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v16 = sub_10013CE54((uint64_t)a3);
          }
          else {
            uint64_t v16 = 0;
          }
          uint64_t v55 = sub_1001683BC((uint64_t)self, (uint64_t)a3);
          _[a4 writeDoubleArray:v9 values:v55 tag:v16];
        }
        else
        {
          if (v7) {
            goto LABEL_134;
          }
          double v36 = sub_100169418((uint64_t)self, a3);
          [a4 writeDouble:v9 value:v36];
        }
        break;
      case 7:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v17 = sub_10013CE54((uint64_t)a3);
          }
          else {
            uint64_t v17 = 0;
          }
          uint64_t v56 = sub_1001683BC((uint64_t)self, (uint64_t)a3);
          _[a4 writeInt32Array:v9 values:v56 tag:v17];
        }
        else
        {
          if (v7) {
            goto LABEL_134;
          }
          id v37 = sub_100168CD0((uint64_t)self, a3);
          [a4 writeInt32:v9 value:v37];
        }
        break;
      case 8:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v18 = sub_10013CE54((uint64_t)a3);
          }
          else {
            uint64_t v18 = 0;
          }
          uint64_t v57 = sub_1001683BC((uint64_t)self, (uint64_t)a3);
          _[a4 writeInt64Array:v9 values:v57 tag:v18];
        }
        else
        {
          if (v7) {
            goto LABEL_134;
          }
          id v39 = sub_100169104((uint64_t)self, a3);
          [a4 writeInt64:v9 value:v39];
        }
        break;
      case 9:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v19 = sub_10013CE54((uint64_t)a3);
          }
          else {
            uint64_t v19 = 0;
          }
          uint64_t v58 = sub_1001683BC((uint64_t)self, (uint64_t)a3);
          _[a4 writeSInt32Array:v9 values:v58 tag:v19];
        }
        else
        {
          if (v7) {
            goto LABEL_134;
          }
          id v41 = sub_100168CD0((uint64_t)self, a3);
          [a4 writeSInt32:v9 value:v41];
        }
        break;
      case 0xA:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v20 = sub_10013CE54((uint64_t)a3);
          }
          else {
            uint64_t v20 = 0;
          }
          uint64_t v59 = sub_1001683BC((uint64_t)self, (uint64_t)a3);
          _[a4 writeSInt64Array:v9 values:v59 tag:v20];
        }
        else
        {
          if (v7) {
            goto LABEL_134;
          }
          id v43 = sub_100169104((uint64_t)self, a3);
          [a4 writeSInt64:v9 value:v43];
        }
        break;
      case 0xB:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v21 = sub_10013CE54((uint64_t)a3);
          }
          else {
            uint64_t v21 = 0;
          }
          uint64_t v60 = sub_1001683BC((uint64_t)self, (uint64_t)a3);
          _[a4 writeUInt32Array:v9 values:v60 tag:v21];
        }
        else
        {
          if (v7) {
            goto LABEL_134;
          }
          id v45 = sub_100168CD0((uint64_t)self, a3);
          [a4 writeUInt32:v9 value:v45];
        }
        break;
      case 0xC:
        if (v7 == 1)
        {
          if ([a3 isPackable]) {
            uint64_t v22 = sub_10013CE54((uint64_t)a3);
          }
          else {
            uint64_t v22 = 0;
          }
          uint64_t v61 = sub_1001683BC((uint64_t)self, (uint64_t)a3);
          [a4 writeUInt64Array:v9 values:v61 tag:v22];
        }
        else
        {
          if (v7) {
            goto LABEL_134;
          }
          id v46 = sub_100169104((uint64_t)self, a3);
          [a4 writeUInt64:v9 value:v46];
        }
        break;
      case 0xD:
        char v23 = (void *)sub_1001683BC((uint64_t)self, (uint64_t)a3);
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
        char v23 = (void *)sub_1001683BC((uint64_t)self, (uint64_t)a3);
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
        char v23 = (void *)sub_1001683BC((uint64_t)self, (uint64_t)a3);
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
        char v23 = (void *)sub_1001683BC((uint64_t)self, (uint64_t)a3);
        if (v7 == 1)
        {
          [a4 writeGroupArray:v9 values:v23, v26];
        }
        else if (v7)
        {
LABEL_128:
          if ([a3 mapKeyDataType] != 14)
          {
            v48 = v23;
            goto LABEL_135;
          }
          sub_10013E034(a4, v23, (uint64_t)a3);
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
            uint64_t v27 = sub_10013CE54((uint64_t)a3);
          }
          else {
            uint64_t v27 = 0;
          }
          uint64_t v62 = sub_1001683BC((uint64_t)self, (uint64_t)a3);
          _[a4 writeEnumArray:v9 values:v62 tag:v27];
        }
        else if (v7)
        {
LABEL_134:
          v48 = (void *)sub_1001683BC((uint64_t)self, (uint64_t)a3);
LABEL_135:
          [v48 writeToCodedOutputStream:a4 asField:a3];
        }
        else
        {
          id v63 = sub_100168CD0((uint64_t)self, a3);
          [a4 writeEnum:v9 value:v63];
        }
        break;
      default:
        return;
    }
  }
}

- (id)getExtension:(id)a3
{
  sub_10015F1C8((uint64_t)self, a3);
  uint64_t v5 = [(NSMutableDictionary *)self->extensionMap_ objectForKey:a3];
  if (v5) {
    return v5;
  }
  if ([a3 isRepeated]) {
    return 0;
  }
  if (*(unsigned __int8 *)(*((void *)a3 + 1) + 44) - 15 < 2)
  {
    os_unfair_lock_lock(&self->readOnlyLock_);
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
    os_unfair_lock_unlock(&self->readOnlyLock_);
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

- (void)writeExtensionsToCodedOutputStream:(id)a3 range:(TransparencyGPBExtensionRange)a4 sortedExtensions:(id)a5
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
          sub_10015B228((uint64_t)v13, [(NSMutableDictionary *)self->extensionMap_ objectForKey:v13], a3);
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
    sub_10015F1C8((uint64_t)self, a3);
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
      sub_10015CAA0((uint64_t)v8);
    }
    sub_10015C78C(self);
  }
  else
  {
    -[TransparencyGPBMessage clearExtension:](self, "clearExtension:");
  }
}

- (void)addExtension:(id)a3 value:(id)a4
{
  sub_10015F1C8((uint64_t)self, a3);
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

  sub_10015C78C(self);
}

- (void)setExtension:(id)a3 index:(unint64_t)a4 value:(id)a5
{
  sub_10015F1C8((uint64_t)self, a3);
  if (([a3 isRepeated] & 1) == 0) {
    +[NSException raise:NSInvalidArgumentException format:@"Must call setExtension() for singular types."];
  }
  extensionMap = self->extensionMap_;
  if (!extensionMap)
  {
    extensionMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    self->extensionMap_ = extensionMap;
  }
  [extensionMap objectForKey:a3][a4 replaceObjectAtIndex:a5];

  sub_10015C78C(self);
}

- (void)clearExtension:(id)a3
{
  sub_10015F1C8((uint64_t)self, a3);
  if ([(NSMutableDictionary *)self->extensionMap_ objectForKey:a3])
  {
    [(NSMutableDictionary *)self->extensionMap_ removeObjectForKey:a3];
    sub_10015C78C(self);
  }
}

- (void)mergeFromData:(id)a3 extensionRegistry:(id)a4
{
  uint64_t v6 = [[TransparencyGPBCodedInputStream alloc] initWithData:a3];
  [(TransparencyGPBMessage *)self mergeFromCodedInputStream:v6 extensionRegistry:a4];
  [(TransparencyGPBCodedInputStream *)v6 checkLastTagWas:0];
}

- (void)mergeDelimitedFromCodedInputStream:(id)a3 extensionRegistry:(id)a4
{
  uint64_t v6 = (uint64_t *)((char *)a3 + 8);
  if (!sub_100136E1C((void *)a3 + 1))
  {
    id v7 = sub_1001370B4(v6);
    if (v7)
    {
      id v8 = v7;
      [(TransparencyGPBMessage *)self mergeFromData:v7 extensionRegistry:a4];
    }
  }
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  return _[a1 parseFromData:a3 extensionRegistry:0 error:a4];
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

- (TransparencyGPBUnknownFieldSet)unknownFields
{
  return self->unknownFields_;
}

- (void)setUnknownFields:(id)a3
{
  unknownFields = self->unknownFields_;
  if (unknownFields != a3)
  {

    self->unknownFields_ = (TransparencyGPBUnknownFieldSet *)[a3 copy];
    sub_10015C78C(self);
  }
}

- (void)parseMessageSet:(id)a3 extensionRegistry:(id)a4
{
  id v7 = (uint64_t *)((char *)a3 + 8);
  uint64_t v8 = sub_100136D88((uint64_t)a3 + 8);
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = sub_10016B9DC(2, 0);
    uint64_t v11 = 0;
    id v12 = 0;
    uint64_t v13 = 0;
    do
    {
      if (v9 == v10)
      {
        uint64_t v11 = sub_100136C90(v7);
        if (v11) {
          uint64_t v13 = [a4 extensionForDescriptor:-[TransparencyGPBMessage descriptor](self, "descriptor") fieldNumber:v11];
        }
      }
      else if (v9 == sub_10016B9DC(3, 2))
      {
        id v12 = sub_1001370B4(v7);
      }
      else if (![a3 skipField:v9])
      {
        break;
      }
      uint64_t v9 = sub_100136D88((uint64_t)v7);
    }
    while (v9);
  }
  else
  {
    uint64_t v13 = 0;
    id v12 = 0;
    uint64_t v11 = 0;
  }
  [a3 checkLastTagWas:sub_10016B9DC(1, 4)];
  if (v12 && v11)
  {
    if (v13)
    {
      long long v16 = [[TransparencyGPBCodedInputStream alloc] initWithData:v12];
      sub_10015FBA0(v13, (int)[v13 isPackable], (uint64_t *)v16, (uint64_t)a4, self);
    }
    else
    {
      unsigned int v14 = (void *)sub_10015FD68(self);
      long long v15 = +[NSData dataWithData:v12];
      _[v14 mergeMessageSetMessage:v11 data:v15];
    }
  }
}

- (BOOL)parseUnknownField:(id)a3 extensionRegistry:(id)a4 tag:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  int v9 = sub_10016B9E4(a5);
  int v10 = sub_10016B9EC(v5);
  id v11 = [(TransparencyGPBMessage *)self descriptor];
  id v12 = [a4 extensionForDescriptor:v11 fieldNumber:v10];
  if (v12)
  {
    uint64_t v13 = v12;
    if ([v12 wireType] == v9)
    {
      unsigned int v14 = [v13 isPackable];
LABEL_4:
      sub_10015FBA0(v13, v14, (uint64_t *)a3, (uint64_t)a4, self);
LABEL_8:
      LOBYTE(v15) = 1;
      return v15;
    }
    if ([v13 isRepeated]
      && *(unsigned __int8 *)(v13[1] + 44) - 13 >= 4
      && [v13 alternateWireType] == v9)
    {
      unsigned int v14 = [v13 isPackable] ^ 1;
      goto LABEL_4;
    }
  }
  else if ([v11 isWireFormat] && sub_10016B9DC(1, 3) == v5)
  {
    [(TransparencyGPBMessage *)self parseMessageSet:a3 extensionRegistry:a4];
    goto LABEL_8;
  }
  unsigned int v15 = +[TransparencyGPBUnknownFieldSet isFieldTag:v5];
  if (v15)
  {
    long long v16 = (void *)sub_10015FD68(self);
    LOBYTE(v15) = [v16 mergeFieldFrom:v5 input:a3];
  }
  return v15;
}

- (void)addUnknownMapEntry:(int)a3 value:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v6 = (void *)sub_10015FD68(self);

  [v6 addUnknownMapEntry:v5 value:a4];
}

- (void)mergeFromCodedInputStream:(id)a3 extensionRegistry:(id)a4
{
  uint64_t v6 = (void *)*((void *)[(TransparencyGPBMessage *)self descriptor] + 1);
  id v7 = (char *)[v6 count];
  uint64_t v8 = sub_100136D88((uint64_t)a3 + 8);
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = 0;
    do
    {
      id v11 = v7;
      if (v7)
      {
        while (1)
        {
          if (v10 >= (unint64_t)v7) {
            unint64_t v10 = 0;
          }
          id v12 = [v6 objectAtIndexedSubscript:v10];
          if (sub_10013CE54((uint64_t)v12) == v9) {
            break;
          }
          ++v10;
          if (!--v11)
          {
            uint64_t v13 = v7;
            while (1)
            {
              if (v10 >= (unint64_t)v7) {
                unint64_t v10 = 0;
              }
              id v12 = [v6 objectAtIndexedSubscript:v10];
              if ([v12 fieldType] == 1
                && *(unsigned __int8 *)(v12[1] + 30) - 13 >= 4
                && sub_10013CEB0((uint64_t)v12) == v9)
              {
                break;
              }
              ++v10;
              if (!--v13) {
                goto LABEL_15;
              }
            }
            if ([v12 isPackable]) {
              goto LABEL_25;
            }
LABEL_22:
            sub_1001604E0(self, v12, (uint64_t)a3);
            goto LABEL_57;
          }
        }
        unsigned int v14 = [v12 fieldType];
        if (v14 == 1)
        {
          if (![v12 isPackable])
          {
LABEL_25:
            sub_100160718(self, v12, (uint64_t *)a3, (uint64_t)a4);
            goto LABEL_58;
          }
          goto LABEL_22;
        }
        if (v14)
        {
          [a3 readMapEntry:sub_100160A68((uint64_t)self, v12) extensionRegistry:a4 field:v12 parentMessage:self];
          goto LABEL_58;
        }
        uint64_t v15 = v12[1];
        switch(*(unsigned char *)(v15 + 30))
        {
          case 0:
            BOOL v16 = sub_100136D68((uint64_t *)a3 + 1);
            sub_100168FC0(self, (uint64_t)v12, v16);
            break;
          case 1:
            int v17 = sub_100136CE4((void *)a3 + 1);
            goto LABEL_35;
          case 2:
            int v18 = sub_100136CE4((void *)a3 + 1);
            goto LABEL_32;
          case 3:
            float v19 = sub_100136BC8((void *)a3 + 1);
            sub_10016931C(self, (uint64_t)v12, v19);
            break;
          case 4:
            uint64_t v20 = sub_100136CA8((void *)a3 + 1);
            goto LABEL_37;
          case 5:
            uint64_t v20 = sub_100136CA8((void *)a3 + 1);
            goto LABEL_37;
          case 6:
            double v25 = sub_100136B8C((void *)a3 + 1);
            sub_1001694B4(self, (uint64_t)v12, v25);
            break;
          case 7:
            int v18 = sub_100136C90((uint64_t *)a3 + 1);
            goto LABEL_32;
          case 8:
            uint64_t v20 = sub_100136C04((char *)a3 + 8);
            goto LABEL_37;
          case 9:
            int v18 = sub_100136D20((uint64_t *)a3 + 1);
LABEL_32:
            int v21 = v18;
            uint64_t v22 = self;
            uint64_t v23 = (uint64_t)v12;
            goto LABEL_33;
          case 0xA:
            uint64_t v20 = sub_100136D44((uint64_t *)a3 + 1);
            goto LABEL_37;
          case 0xB:
            int v17 = sub_100136C90((uint64_t *)a3 + 1);
LABEL_35:
            sub_100168E08(self, (uint64_t)v12, v17);
            break;
          case 0xC:
            uint64_t v20 = sub_100136C04((char *)a3 + 8);
LABEL_37:
            sub_100169188(self, (uint64_t)v12, v20);
            break;
          case 0xD:
            uint64_t v24 = sub_10013703C((uint64_t *)a3 + 1);
            goto LABEL_49;
          case 0xE:
            uint64_t v24 = (void *)sub_100136F38((uint64_t *)a3 + 1);
LABEL_49:
            uint64_t v26 = v24;
            uint64_t v27 = self;
            BOOL v28 = v12;
            goto LABEL_56;
          case 0xF:
            if (sub_1001688EC((uint64_t)self, *(_DWORD *)(v15 + 20), *(_DWORD *)(v15 + 16)))
            {
              [a3 readMessage:sub_1001683BC((uint64_t)self, (uint64_t)v12) extensionRegistry:a4];
              break;
            }
            id v30 = objc_alloc_init((Class)[v12 msgClass]);
            [a3 readMessage:v30 extensionRegistry:a4];
            goto LABEL_55;
          case 0x10:
            if (sub_1001688EC((uint64_t)self, *(_DWORD *)(v15 + 20), *(_DWORD *)(v15 + 16)))
            {
              [a3 readGroup:*(unsigned int *)(v12[1] + 16) message:sub_1001683BC((uint64_t)self, (uint64_t)v12) extensionRegistry:a4];
            }
            else
            {
              id v30 = objc_alloc_init((Class)[v12 msgClass]);
              [a3 readGroup:*(unsigned int *)(v12[1] + 16) message:v30 extensionRegistry:a4];
LABEL_55:
              uint64_t v27 = self;
              BOOL v28 = v12;
              uint64_t v26 = v30;
LABEL_56:
              sub_100168A48((uint64_t)v27, v28, v26);
            }
            break;
          case 0x11:
            uint64_t v29 = sub_100136C90((uint64_t *)a3 + 1);
            if ((*(_WORD *)(v12[1] + 28) & 0x1000) != 0 && ![v12 isValidEnumValue:v29])
            {
              [(id)sub_10015FD68(self) mergeVarintField:*(unsigned int *)(v12[1] + 16) value:v29];
            }
            else
            {
              uint64_t v22 = self;
              uint64_t v23 = (uint64_t)v12;
              int v21 = v29;
LABEL_33:
              sub_100168E08(v22, v23, v21);
            }
            break;
          default:
            break;
        }
LABEL_57:
        ++v10;
      }
      else
      {
LABEL_15:
        if (![(TransparencyGPBMessage *)self parseUnknownField:a3 extensionRegistry:a4 tag:v9])return; {
      }
        }
LABEL_58:
      uint64_t v9 = sub_100136D88((uint64_t)a3 + 8);
    }
    while (v9);
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
  sub_10015C78C(self);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v7 = (void *)*((void *)[(id)objc_opt_class() descriptor] + 1);
  id v8 = [v7 countByEnumeratingWithState:&v64 objects:v70 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v65;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v65 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        unsigned int v13 = [v12 fieldType];
        if (v13 == 1)
        {
          uint64_t v18 = sub_1001683BC((uint64_t)a3, (uint64_t)v12);
          if (v18)
          {
            uint64_t v19 = v18;
            int v20 = *(unsigned __int8 *)(v12[1] + 30);
            if ((v20 - 13) > 3)
            {
              uint64_t v26 = sub_10016119C((uint64_t)self, v12);
              if (v20 == 17) {
                [v26 addRawValuesFromArray:v19];
              }
              else {
                [v26 addValuesFromArray:v19];
              }
            }
            else
            {
              [sub_10016119C((uint64_t)self, v12) addObjectsFromArray:v18];
            }
          }
        }
        else if (v13)
        {
          uint64_t v21 = sub_1001683BC((uint64_t)a3, (uint64_t)v12);
          if (!v21) {
            continue;
          }
          uint64_t v22 = v21;
          unsigned int v23 = [v12 mapKeyDataType];
          int v24 = *(unsigned __int8 *)(v12[1] + 30);
          if (v23 - 13 > 3 || (v24 - 13) > 3)
          {
            uint64_t v27 = sub_100160A68((uint64_t)self, v12);
            if (v24 == 17)
            {
              [v27 addRawEntriesFromDictionary:v22];
              continue;
            }
          }
          else
          {
            uint64_t v27 = sub_100160A68((uint64_t)self, v12);
          }
          [v27 addEntriesFromDictionary:v22];
        }
        else
        {
          uint64_t v14 = v12[1];
          int v16 = *(_DWORD *)(v14 + 16);
          unsigned int v15 = *(_DWORD *)(v14 + 20);
          if (sub_1001688EC((uint64_t)a3, v15, v16))
          {
            switch(*(unsigned char *)(v12[1] + 30))
            {
              case 0:
                BOOL v30 = sub_100168F08((uint64_t)a3, v12);
                sub_100168FC0(self, (uint64_t)v12, v30);
                break;
              case 1:
              case 2:
              case 7:
              case 9:
              case 0xB:
              case 0x11:
                int v17 = sub_100168CD0((uint64_t)a3, v12);
                sub_100168E08(self, (uint64_t)v12, v17);
                break;
              case 3:
                float v31 = sub_100169280((uint64_t)a3, v12);
                sub_10016931C(self, (uint64_t)v12, v31);
                break;
              case 4:
              case 5:
              case 8:
              case 0xA:
              case 0xC:
                id v28 = sub_100169104((uint64_t)a3, v12);
                sub_100169188(self, (uint64_t)v12, (uint64_t)v28);
                break;
              case 6:
                double v32 = sub_100169418((uint64_t)a3, v12);
                sub_1001694B4(self, (uint64_t)v12, v32);
                break;
              case 0xD:
              case 0xE:
                uint64_t v29 = (void *)sub_1001683BC((uint64_t)a3, (uint64_t)v12);
                sub_100168A04((uint64_t)self, v12, v29);
                break;
              case 0xF:
              case 0x10:
                id obj = (id)sub_1001683BC((uint64_t)a3, (uint64_t)v12);
                if (sub_1001688EC((uint64_t)self, v15, v16)) {
                  [((id)sub_1001683BC((uint64_t)self, (uint64_t)v12)) mergeFrom:obj];
                }
                else {
                  sub_100168A48((uint64_t)self, v12, [obj copy]);
                }
                break;
              default:
                continue;
            }
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v64 objects:v70 count:16];
    }
    while (v9);
  }
  unknownFields = self->unknownFields_;
  id v34 = [a3 unknownFields];
  if (unknownFields) {
    [(TransparencyGPBUnknownFieldSet *)unknownFields mergeUnknownFields:v34];
  }
  else {
    [(TransparencyGPBMessage *)self setUnknownFields:v34];
  }
  if ([*((id *)a3 + 2) count])
  {
    if (!self->extensionMap_)
    {
      uint64_t v50 = (void *)*((void *)a3 + 2);
      uint64_t v51 = NSZoneFromPointer(self);
      self->extensionMap_ = sub_10015D4A4(v50, (uint64_t)v51);
      return;
    }
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id obja = (id)*((void *)a3 + 2);
    id v35 = [obja countByEnumeratingWithState:&v60 objects:v69 count:16];
    if (!v35) {
      return;
    }
    id v36 = v35;
    uint64_t v37 = *(void *)v61;
    uint64_t v52 = *(void *)v61;
    do
    {
      uint64_t v38 = 0;
      id v53 = v36;
      do
      {
        if (*(void *)v61 != v37) {
          objc_enumerationMutation(obja);
        }
        id v39 = *(void **)(*((void *)&v60 + 1) + 8 * (void)v38);
        id v40 = [*((id *)a3 + 2) objectForKey:v39];
        id v41 = [(NSMutableDictionary *)self->extensionMap_ objectForKey:v39];
        unsigned int v42 = *(unsigned __int8 *)(v39[1] + 44) - 15;
        if ([v39 isRepeated])
        {
          if (!v41)
          {
            id v41 = objc_alloc_init((Class)NSMutableArray);
            [(NSMutableDictionary *)self->extensionMap_ setObject:v41 forKey:v39];
          }
          if (v42 > 1)
          {
            [v41 addObjectsFromArray:v40];
            goto LABEL_69;
          }
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          id v43 = [v40 countByEnumeratingWithState:&v56 objects:v68 count:16];
          if (v43)
          {
            id v44 = v43;
            uint64_t v45 = *(void *)v57;
            do
            {
              for (j = 0; j != v44; j = (char *)j + 1)
              {
                if (*(void *)v57 != v45) {
                  objc_enumerationMutation(v40);
                }
                id v47 = [*(id *)(*((void *)&v56 + 1) + 8 * (void)j) copy];
                [v41 addObject:v47];
              }
              id v44 = [v40 countByEnumeratingWithState:&v56 objects:v68 count:16];
            }
            while (v44);
          }
        }
        else
        {
          if (v42 > 1)
          {
            [(NSMutableDictionary *)self->extensionMap_ setObject:v40 forKey:v39];
            goto LABEL_69;
          }
          if (v41)
          {
            [v41 mergeFrom:v40];
          }
          else
          {
            id v48 = [v40 copy];
            [(NSMutableDictionary *)self->extensionMap_ setObject:v48 forKey:v39];
          }
        }
        uint64_t v37 = v52;
        id v36 = v53;
        if (([v39 isRepeated] & 1) == 0)
        {
          id v49 = [(NSMutableDictionary *)self->autocreatedExtensionMap_ objectForKey:v39];
          [(NSMutableDictionary *)self->autocreatedExtensionMap_ removeObjectForKey:v39];
          sub_10015CAA0((uint64_t)v49);
        }
LABEL_69:
        uint64_t v38 = (char *)v38 + 1;
      }
      while (v38 != v36);
      id v36 = [obja countByEnumeratingWithState:&v60 objects:v69 count:16];
    }
    while (v36);
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
          unsigned int v13 = (void *)sub_1001683BC((uint64_t)self, *(void *)(*((void *)&v31 + 1) + 8 * (void)v10));
          uint64_t v14 = (void *)sub_1001683BC((uint64_t)a3, v11);
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
          int v19 = sub_1001688EC((uint64_t)self, v17, v18);
          int v20 = sub_1001688EC((uint64_t)a3, v17, v18);
          if (v19) {
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
                BOOL v24 = sub_1001688EC((uint64_t)self, *(_DWORD *)(v22 + 24), 0);
                if (v24 != sub_1001688EC((uint64_t)a3, v23, 0)) {
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
          if (v19 != v20) {
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
    if ((uint64_t v26 = (void *)*((void *)a3 + 1),
          ![(TransparencyGPBUnknownFieldSet *)self->unknownFields_ countOfFields])
      && ![v26 countOfFields]
      || (unsigned int v6 = [(TransparencyGPBUnknownFieldSet *)self->unknownFields_ isEqual:v26]) != 0)
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
          id v11 = [[(id)sub_1001683BC((uint64_t)self, *(void *)(*((void *)&v18 + 1) + 8 * i))] count];
          if (v11) {
            unint64_t v3 = (unint64_t)v11 + 361 * v3 + 19 * *(unsigned int *)(*(void *)(v9 + 8) + 16);
          }
        }
        else if (sub_1001688EC((uint64_t)self, *(_DWORD *)(v10 + 20), *(_DWORD *)(v10 + 16)))
        {
          uint64_t v12 = *(void *)(v9 + 8);
          uint64_t v13 = *(unsigned int *)(v12 + 24);
          switch(*(unsigned char *)(v12 + 30))
          {
            case 0:
              unint64_t v3 = 19 * v3 + sub_1001688EC((uint64_t)self, v13, 0);
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
  unint64_t v3 = sub_1001696B0(self, @"    ");
  return +[NSString stringWithFormat:@"<%@ %p>: {\n%@}", objc_opt_class(), self, v3];
}

- (unint64_t)serializedSize
{
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v58 = [(id)objc_opt_class() descriptor];
  unint64_t v3 = (void *)v58[1];
  uint64_t v4 = 0;
  id v5 = [v3 countByEnumeratingWithState:&v100 objects:v109 count:16];
  if (!v5) {
    goto LABEL_85;
  }
  uint64_t v6 = *(void *)v101;
  uint64_t v59 = *(void *)v101;
  long long v60 = v3;
  do
  {
    uint64_t v7 = 0;
    id v61 = v5;
    do
    {
      if (*(void *)v101 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v100 + 1) + 8 * (void)v7);
      unsigned int v9 = [v8 fieldType];
      uint64_t v10 = v8[1];
      int v11 = *(unsigned __int8 *)(v10 + 30);
      if (v9 == 1)
      {
        uint64_t v14 = (void *)sub_1001683BC((uint64_t)self, (uint64_t)v8);
        id v15 = [v14 count];
        if (v15)
        {
          uint64_t v96 = 0;
          v97 = &v96;
          uint64_t v98 = 0x2020000000;
          uint64_t v99 = 0;
          switch(v11)
          {
            case 0:
              v95[0] = _NSConcreteStackBlock;
              v95[1] = 3221225472;
              v95[2] = sub_100162664;
              v95[3] = &unk_1002C2510;
              v95[4] = &v96;
              [v14 enumerateValuesWithBlock:v95];
              break;
            case 1:
              v94[0] = _NSConcreteStackBlock;
              v94[1] = 3221225472;
              v94[2] = sub_1001626A0;
              v94[3] = &unk_1002C2498;
              v94[4] = &v96;
              [v14 enumerateValuesWithBlock:v94];
              break;
            case 2:
              v93[0] = _NSConcreteStackBlock;
              v93[1] = 3221225472;
              v93[2] = sub_1001626DC;
              v93[3] = &unk_1002C2420;
              v93[4] = &v96;
              [v14 enumerateValuesWithBlock:v93];
              break;
            case 3:
              v92[0] = _NSConcreteStackBlock;
              v92[1] = 3221225472;
              v92[2] = sub_100162718;
              v92[3] = &unk_1002C22B8;
              v92[4] = &v96;
              [v14 enumerateValuesWithBlock:v92];
              break;
            case 4:
              v91[0] = _NSConcreteStackBlock;
              v91[1] = 3221225472;
              v91[2] = sub_100162750;
              v91[3] = &unk_1002C2330;
              v91[4] = &v96;
              [v14 enumerateValuesWithBlock:v91];
              break;
            case 5:
              v90[0] = _NSConcreteStackBlock;
              v90[1] = 3221225472;
              v90[2] = sub_10016278C;
              v90[3] = &unk_1002C23A8;
              v90[4] = &v96;
              [v14 enumerateValuesWithBlock:v90];
              break;
            case 6:
              v89[0] = _NSConcreteStackBlock;
              v89[1] = 3221225472;
              v89[2] = sub_1001627C8;
              v89[3] = &unk_1002C2240;
              v89[4] = &v96;
              [v14 enumerateValuesWithBlock:v89];
              break;
            case 7:
              v88[0] = _NSConcreteStackBlock;
              v88[1] = 3221225472;
              v88[2] = sub_100162800;
              v88[3] = &unk_1002C2420;
              v88[4] = &v96;
              [v14 enumerateValuesWithBlock:v88];
              break;
            case 8:
              v87[0] = _NSConcreteStackBlock;
              v87[1] = 3221225472;
              v87[2] = sub_10016283C;
              v87[3] = &unk_1002C23A8;
              v87[4] = &v96;
              [v14 enumerateValuesWithBlock:v87];
              break;
            case 9:
              v86[0] = _NSConcreteStackBlock;
              v86[1] = 3221225472;
              v86[2] = sub_100162878;
              v86[3] = &unk_1002C2420;
              v86[4] = &v96;
              [v14 enumerateValuesWithBlock:v86];
              break;
            case 10:
              v85[0] = _NSConcreteStackBlock;
              v85[1] = 3221225472;
              v85[2] = sub_1001628B4;
              v85[3] = &unk_1002C23A8;
              v85[4] = &v96;
              [v14 enumerateValuesWithBlock:v85];
              break;
            case 11:
              v84[0] = _NSConcreteStackBlock;
              v84[1] = 3221225472;
              v84[2] = sub_1001628F0;
              v84[3] = &unk_1002C2498;
              v84[4] = &v96;
              [v14 enumerateValuesWithBlock:v84];
              break;
            case 12:
              v83[0] = _NSConcreteStackBlock;
              v83[1] = 3221225472;
              v83[2] = sub_10016292C;
              v83[3] = &unk_1002C2330;
              v83[4] = &v96;
              [v14 enumerateValuesWithBlock:v83];
              break;
            case 13:
              long long v81 = 0u;
              long long v82 = 0u;
              long long v79 = 0u;
              long long v80 = 0u;
              id v17 = [v14 countByEnumeratingWithState:&v79 objects:v108 count:16];
              if (v17)
              {
                uint64_t v18 = *(void *)v80;
                do
                {
                  for (i = 0; i != v17; i = (char *)i + 1)
                  {
                    if (*(void *)v80 != v18) {
                      objc_enumerationMutation(v14);
                    }
                    long long v20 = sub_10013B0C8(*(void **)(*((void *)&v79 + 1) + 8 * i));
                    v97[3] += (uint64_t)v20;
                  }
                  id v17 = [v14 countByEnumeratingWithState:&v79 objects:v108 count:16];
                }
                while (v17);
              }
              break;
            case 14:
              long long v77 = 0u;
              long long v78 = 0u;
              long long v75 = 0u;
              long long v76 = 0u;
              id v21 = [v14 countByEnumeratingWithState:&v75 objects:v107 count:16];
              if (v21)
              {
                uint64_t v22 = *(void *)v76;
                do
                {
                  for (j = 0; j != v21; j = (char *)j + 1)
                  {
                    if (*(void *)v76 != v22) {
                      objc_enumerationMutation(v14);
                    }
                    BOOL v24 = sub_10013B020(*(void **)(*((void *)&v75 + 1) + 8 * (void)j));
                    v97[3] += (uint64_t)v24;
                  }
                  id v21 = [v14 countByEnumeratingWithState:&v75 objects:v107 count:16];
                }
                while (v21);
              }
              break;
            case 15:
              long long v73 = 0u;
              long long v74 = 0u;
              long long v71 = 0u;
              long long v72 = 0u;
              id v25 = [v14 countByEnumeratingWithState:&v71 objects:v106 count:16];
              if (v25)
              {
                uint64_t v26 = *(void *)v72;
                do
                {
                  for (k = 0; k != v25; k = (char *)k + 1)
                  {
                    if (*(void *)v72 != v26) {
                      objc_enumerationMutation(v14);
                    }
                    uint64_t v28 = sub_10013B078(*(void **)(*((void *)&v71 + 1) + 8 * (void)k));
                    v97[3] += (uint64_t)v28;
                  }
                  id v25 = [v14 countByEnumeratingWithState:&v71 objects:v106 count:16];
                }
                while (v25);
              }
              break;
            case 16:
              long long v69 = 0u;
              long long v70 = 0u;
              long long v67 = 0u;
              long long v68 = 0u;
              id v29 = [v14 countByEnumeratingWithState:&v67 objects:v105 count:16];
              if (v29)
              {
                uint64_t v30 = *(void *)v68;
                do
                {
                  for (m = 0; m != v29; m = (char *)m + 1)
                  {
                    if (*(void *)v68 != v30) {
                      objc_enumerationMutation(v14);
                    }
                    id v32 = [*(id *)(*((void *)&v67 + 1) + 8 * (void)m) serializedSize];
                    v97[3] += (uint64_t)v32;
                  }
                  id v29 = [v14 countByEnumeratingWithState:&v67 objects:v105 count:16];
                }
                while (v29);
              }
              break;
            case 17:
              v66[0] = _NSConcreteStackBlock;
              v66[1] = 3221225472;
              v66[2] = sub_100162968;
              v66[3] = &unk_1002C2420;
              v66[4] = &v96;
              [v14 enumerateRawValuesWithBlock:v66];
              break;
            default:
              break;
          }
          uint64_t v33 = v97[3];
          uint64_t v34 = sub_10013B168(*(_DWORD *)(v8[1] + 16));
          unsigned int v35 = [v8 isPackable];
          uint64_t v36 = v33 + v4;
          uint64_t v37 = v34 << (v11 == 16);
          uint64_t v6 = v59;
          if (v35) {
            uint64_t v4 = v37 + v36 + sub_10013940C(v97[3]);
          }
          else {
            uint64_t v4 = v36 + v37 * (void)v15;
          }
          unint64_t v3 = v60;
          id v5 = v61;
          _Block_object_dispose(&v96, 8);
        }
      }
      else if (v9)
      {
        if ((v11 - 13) <= 3 && [v8 mapKeyDataType] == 14)
        {
          int v16 = (void *)sub_1001683BC((uint64_t)self, (uint64_t)v8);
          if (!v16) {
            goto LABEL_69;
          }
          uint64_t v13 = sub_10013DF08(v16, (uint64_t)v8);
        }
        else
        {
          uint64_t v13 = (uint64_t)[(id)sub_1001683BC((uint64_t)self, (uint64_t)v8) computeSerializedSizeAsField:v8];
        }
LABEL_19:
        v4 += v13;
      }
      else if (sub_1001688EC((uint64_t)self, *(_DWORD *)(v10 + 20), *(_DWORD *)(v10 + 16)))
      {
        int v12 = *(_DWORD *)(v8[1] + 16);
        switch(v11)
        {
          case 0:
            sub_100168F08((uint64_t)self, v8);
            uint64_t v13 = sub_10013B310(v12);
            goto LABEL_19;
          case 1:
          case 2:
            sub_100168CD0((uint64_t)self, v8);
            uint64_t v13 = sub_10013B1B8(v12);
            goto LABEL_19;
          case 3:
            sub_100169280((uint64_t)self, v8);
            uint64_t v13 = sub_10013B1B8(v12);
            goto LABEL_19;
          case 4:
          case 5:
            sub_100169104((uint64_t)self, v8);
            uint64_t v13 = sub_10013B118(v12);
            goto LABEL_19;
          case 6:
            sub_100169418((uint64_t)self, v8);
            uint64_t v13 = sub_10013B118(v12);
            goto LABEL_19;
          case 7:
          case 17:
            unsigned int v38 = sub_100168CD0((uint64_t)self, v8);
            uint64_t v13 = sub_10013B270(v12, v38);
            goto LABEL_19;
          case 8:
          case 12:
            id v39 = sub_100169104((uint64_t)self, v8);
            uint64_t v13 = sub_10013B208(v12, (unint64_t)v39);
            goto LABEL_19;
          case 9:
            int v40 = sub_100168CD0((uint64_t)self, v8);
            uint64_t v13 = sub_10013B644(v12, v40);
            goto LABEL_19;
          case 10:
            id v41 = sub_100169104((uint64_t)self, v8);
            uint64_t v13 = sub_10013B6E0(v12, (uint64_t)v41);
            goto LABEL_19;
          case 11:
            unsigned int v42 = sub_100168CD0((uint64_t)self, v8);
            uint64_t v13 = sub_10013B5B0(v12, v42);
            goto LABEL_19;
          case 13:
            id v43 = (void *)sub_1001683BC((uint64_t)self, (uint64_t)v8);
            uint64_t v13 = (uint64_t)sub_10013B510(v12, v43);
            goto LABEL_19;
          case 14:
            id v44 = (void *)sub_1001683BC((uint64_t)self, (uint64_t)v8);
            uint64_t v13 = (uint64_t)sub_10013B360(v12, v44);
            goto LABEL_19;
          case 15:
            uint64_t v45 = (void *)sub_1001683BC((uint64_t)self, (uint64_t)v8);
            uint64_t v13 = (uint64_t)sub_10013B470(v12, v45);
            goto LABEL_19;
          case 16:
            id v46 = (void *)sub_1001683BC((uint64_t)self, (uint64_t)v8);
            uint64_t v13 = (uint64_t)sub_10013B404(v12, v46);
            goto LABEL_19;
          default:
            break;
        }
      }
LABEL_69:
      uint64_t v7 = (char *)v7 + 1;
    }
    while (v7 != v5);
    id v47 = [v3 countByEnumeratingWithState:&v100 objects:v109 count:16];
    id v5 = v47;
  }
  while (v47);
LABEL_85:
  unsigned int v48 = [v58 isWireFormat];
  unknownFields = self->unknownFields_;
  if (v48) {
    unint64_t v50 = [(TransparencyGPBUnknownFieldSet *)unknownFields serializedSizeAsMessageSet];
  }
  else {
    unint64_t v50 = [(TransparencyGPBUnknownFieldSet *)unknownFields serializedSize];
  }
  unint64_t v51 = v50;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  extensionMap = self->extensionMap_;
  id v53 = [(NSMutableDictionary *)extensionMap countByEnumeratingWithState:&v62 objects:v104 count:16];
  unint64_t v54 = v51 + v4;
  if (v53)
  {
    uint64_t v55 = *(void *)v63;
    do
    {
      for (n = 0; n != v53; n = (char *)n + 1)
      {
        if (*(void *)v63 != v55) {
          objc_enumerationMutation(extensionMap);
        }
        v54 += sub_10015BAF8(*(void *)(*((void *)&v62 + 1) + 8 * (void)n), [(NSMutableDictionary *)self->extensionMap_ objectForKey:*(void *)(*((void *)&v62 + 1) + 8 * (void)n)]);
      }
      id v53 = [(NSMutableDictionary *)extensionMap countByEnumeratingWithState:&v62 objects:v104 count:16];
    }
    while (v53);
  }
  return v54;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  id v4 = a1;
  id v5 = [a1 descriptor];
  if (!v5)
  {
    v44.receiver = v4;
    v44.super_class = (Class)&OBJC_METACLASS___TransparencyGPBMessage;
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
    v31.super_class = (Class)&OBJC_METACLASS___TransparencyGPBMessage;
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
        id v17 = sub_100163CC0;
      }
      else
      {
        int v16 = v34;
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        id v17 = sub_100163D5C;
      }
      id v4 = v30;
      v16[2] = v17;
      v16[3] = &unk_1002C2C58;
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
      block[2] = sub_100163E1C;
      block[3] = &unk_1002C2C78;
      block[4] = v11;
      uint64_t v18 = imp_implementationWithBlock(block);
      long long v19 = "setArray:";
      goto LABEL_35;
    }
    if (*(SEL *)(v11 + 40) == a3)
    {
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100163E2C;
      v32[3] = &unk_1002C2C98;
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
          uint64_t v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setBool_;
          id v21 = &unk_1002C2C18;
          uint64_t v22 = sub_100164DC8;
          goto LABEL_73;
        case 1:
          uint64_t v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setFixed32_;
          id v21 = &unk_1002C2D78;
          uint64_t v22 = sub_100164DD8;
          goto LABEL_73;
        case 2:
          uint64_t v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setSFixed32_;
          id v21 = &unk_1002C2D98;
          uint64_t v22 = sub_100164DE8;
          goto LABEL_73;
        case 3:
          uint64_t v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setFloat_;
          id v21 = &unk_1002C2DB8;
          uint64_t v22 = sub_100164DF8;
          goto LABEL_73;
        case 4:
          uint64_t v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setFixed64_;
          id v21 = &unk_1002C2DD8;
          uint64_t v22 = sub_100164E08;
          goto LABEL_73;
        case 5:
          uint64_t v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setSFixed64_;
          id v21 = &unk_1002C2DF8;
          uint64_t v22 = sub_100164E18;
          goto LABEL_73;
        case 6:
          uint64_t v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setDouble_;
          id v21 = &unk_1002C2E18;
          uint64_t v22 = sub_100164E28;
          goto LABEL_73;
        case 7:
          uint64_t v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setInt32_;
          id v21 = &unk_1002C2D98;
          uint64_t v22 = sub_100164E38;
          goto LABEL_73;
        case 8:
          uint64_t v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setInt64_;
          id v21 = &unk_1002C2DF8;
          uint64_t v22 = sub_100164E48;
          goto LABEL_73;
        case 9:
          uint64_t v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setSInt32_;
          id v21 = &unk_1002C2D98;
          uint64_t v22 = sub_100164E58;
          goto LABEL_73;
        case 0xA:
          uint64_t v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setSInt64_;
          id v21 = &unk_1002C2DF8;
          uint64_t v22 = sub_100164E68;
          goto LABEL_73;
        case 0xB:
          uint64_t v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setUInt32_;
          id v21 = &unk_1002C2D78;
          uint64_t v22 = sub_100164E78;
          goto LABEL_73;
        case 0xC:
          uint64_t v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setUInt64_;
          id v21 = &unk_1002C2DD8;
          uint64_t v22 = sub_100164E88;
          goto LABEL_73;
        case 0xD:
          uint64_t v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setBytes_;
          id v21 = &unk_1002C2C78;
          uint64_t v22 = sub_100164E98;
          goto LABEL_73;
        case 0xE:
          uint64_t v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setString_;
          id v21 = &unk_1002C2C78;
          uint64_t v22 = sub_100164EE0;
          goto LABEL_73;
        case 0xF:
          uint64_t v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setMessage_;
          id v21 = &unk_1002C2C78;
          uint64_t v22 = sub_100164F28;
          goto LABEL_73;
        case 0x10:
          uint64_t v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setGroup_;
          id v21 = &unk_1002C2C78;
          uint64_t v22 = sub_100164F38;
          goto LABEL_73;
        case 0x11:
          uint64_t v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          long long v20 = &selRef_setEnum_;
          id v21 = &unk_1002C2D98;
          uint64_t v22 = sub_100164F48;
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
      v39[2] = sub_100163BC4;
      v39[3] = &unk_1002C2BF8;
      v39[4] = vrev64_s32(v23);
      uint64_t v18 = imp_implementationWithBlock(v39);
      long long v19 = "getBool";
      goto LABEL_35;
    }
    if (*(SEL *)(v11 + 48) == a3)
    {
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100163BD4;
      v38[3] = &unk_1002C2C18;
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
      v36[2] = sub_100163CB0;
      v36[3] = &unk_1002C2C38;
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
      uint64_t v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getBool;
      id v21 = &unk_1002C2CB8;
      uint64_t v22 = sub_100164CA8;
      break;
    case 1:
      uint64_t v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getFixed32;
      id v21 = &unk_1002C2CD8;
      uint64_t v22 = sub_100164CB8;
      break;
    case 2:
      uint64_t v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getSFixed32;
      id v21 = &unk_1002C2CF8;
      uint64_t v22 = sub_100164CC8;
      break;
    case 3:
      uint64_t v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getFloat;
      id v21 = &unk_1002C2D18;
      uint64_t v22 = sub_100164CD8;
      break;
    case 4:
      uint64_t v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getFixed64;
      id v21 = &unk_1002C2C98;
      uint64_t v22 = sub_100164CE8;
      break;
    case 5:
      uint64_t v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getSFixed64;
      id v21 = &unk_1002C2D38;
      uint64_t v22 = sub_100164CF8;
      break;
    case 6:
      uint64_t v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getDouble;
      id v21 = &unk_1002C2D58;
      uint64_t v22 = sub_100164D08;
      break;
    case 7:
      uint64_t v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getInt32;
      id v21 = &unk_1002C2CF8;
      uint64_t v22 = sub_100164D18;
      break;
    case 8:
      uint64_t v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getInt64;
      id v21 = &unk_1002C2D38;
      uint64_t v22 = sub_100164D28;
      break;
    case 9:
      uint64_t v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getSInt32;
      id v21 = &unk_1002C2CF8;
      uint64_t v22 = sub_100164D38;
      break;
    case 0xA:
      uint64_t v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getSInt64;
      id v21 = &unk_1002C2D38;
      uint64_t v22 = sub_100164D48;
      break;
    case 0xB:
      uint64_t v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getUInt32;
      id v21 = &unk_1002C2CD8;
      uint64_t v22 = sub_100164D58;
      break;
    case 0xC:
      uint64_t v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getUInt64;
      id v21 = &unk_1002C2C98;
      uint64_t v22 = sub_100164D68;
      break;
    case 0xD:
      uint64_t v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getBytes;
      id v21 = &unk_1002C2C58;
      uint64_t v22 = sub_100164D78;
      break;
    case 0xE:
      uint64_t v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getString;
      id v21 = &unk_1002C2C58;
      uint64_t v22 = sub_100164D88;
      break;
    case 0xF:
      uint64_t v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getMessage;
      id v21 = &unk_1002C2C58;
      uint64_t v22 = sub_100164D98;
      break;
    case 0x10:
      uint64_t v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getGroup;
      id v21 = &unk_1002C2C58;
      uint64_t v22 = sub_100164DA8;
      break;
    case 0x11:
      uint64_t v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      long long v20 = &selRef_getEnum;
      id v21 = &unk_1002C2CF8;
      uint64_t v22 = sub_100164DB8;
      break;
    default:
LABEL_38:
      uint64_t v18 = 0;
      long long v19 = 0;
      goto LABEL_35;
  }
LABEL_73:
  id v47 = v22;
  unsigned int v48 = v21;
  uint64_t v49 = v11;
  uint64_t v18 = imp_implementationWithBlock(&v45);
  long long v19 = *v20;
  if (!v18) {
    goto LABEL_74;
  }
LABEL_36:
  BOOL v25 = 1;
  uint64_t v26 = sub_10016966C(v19, 1);
  uint64_t v27 = (objc_class *)[v29 messageClass];
  if (class_addMethod(v27, a3, v18, v26)) {
    return v25;
  }
  return sub_10016A9A0(v27, a3);
}

+ (BOOL)resolveClassMethod:(SEL)a3
{
  if (sub_100165104((objc_class *)a1, a3)) {
    return 1;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___TransparencyGPBMessage;
  return [super resolveClassMethod:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TransparencyGPBMessage)initWithCoder:(id)a3
{
  id v4 = [(TransparencyGPBMessage *)self init];
  if (v4)
  {
    id v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"TransparencyGPBData"];
    if ([v5 length]) {
      [(TransparencyGPBMessage *)v4 mergeFromData:v5 extensionRegistry:0];
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = [(TransparencyGPBMessage *)self data];
  if ([v4 length])
  {
    [a3 encodeObject:v4 forKey:@"TransparencyGPBData"];
  }
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

@end