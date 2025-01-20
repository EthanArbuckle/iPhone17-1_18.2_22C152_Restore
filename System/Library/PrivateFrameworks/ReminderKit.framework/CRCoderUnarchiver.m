@interface CRCoderUnarchiver
+ (id)decodedDocumentFromData:(id)a3 replica:(id)a4;
+ (void)initialize;
- (BOOL)hasDecodableValueForKey:(id)a3;
- (BOOL)willModifySelfInInitForClass:(Class)a3;
- (CRDocument)document;
- (NSMutableArray)allocedDocObjects;
- (NSMutableArray)completionHandlers;
- (NSMutableArray)uuidArray;
- (NSMutableOrderedSet)keySet;
- (NSMutableOrderedSet)typeSetForDecoding;
- (NSUUID)replica;
- (const)currentDocObjectForDecodingPtr;
- (const)currentObjectIDForKey:(id)a3;
- (double)decodeDoubleForKey:(id)a3;
- (id)allocedObjectAtIndex:(unint64_t)a3 outNeedsInit:(BOOL *)a4;
- (id)decodeDocumentFromData:(id)a3 replica:(id)a4;
- (id)decodeObjectForKey:(id)a3;
- (id)decodeObjectForProtobufObjectID:(const void *)a3;
- (id)decodeStringForKey:(id)a3;
- (id)decodeUUIDForKey:(id)a3;
- (id)decodeUUIDFromUUIDIndex:(unint64_t)a3;
- (int)decodeInt32ForKey:(id)a3;
- (int64_t)decodeInt64ForKey:(id)a3;
- (unint64_t)decodeUInt64ForKey:(id)a3;
- (unint64_t)indexForKey:(id)a3;
- (unsigned)decodeUInt32ForKey:(id)a3;
- (void)addDecoderCompletionHandler:(id)a3 dependency:(id)a4 for:(id)a5;
- (void)currentDocument;
- (void)setAllocedDocObjects:(id)a3;
- (void)setCompletionHandlers:(id)a3;
- (void)setCurrentDocObjectForDecodingPtr:(const void *)a3;
- (void)setCurrentDocument:(void *)a3;
- (void)setDocument:(id)a3;
- (void)setKeySet:(id)a3;
- (void)setReplica:(id)a3;
- (void)setTypeSetForDecoding:(id)a3;
- (void)setUuidArray:(id)a3;
- (void)sortCompletionHandlers;
@end

@implementation CRCoderUnarchiver

+ (void)initialize
{
}

+ (id)decodedDocumentFromData:(id)a3 replica:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(CRCoderUnarchiver);
  v8 = [(CRCoderUnarchiver *)v7 decodeDocumentFromData:v5 replica:v6];

  return v8;
}

- (BOOL)willModifySelfInInitForClass:(Class)a3
{
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()]) {
    return 1;
  }
  uint64_t v5 = objc_opt_class();

  return [(objc_class *)a3 isSubclassOfClass:v5];
}

- (id)allocedObjectAtIndex:(unint64_t)a3 outNeedsInit:(BOOL *)a4
{
  if (a4) {
    *a4 = 1;
  }
  if (*(int *)([(CRCoderUnarchiver *)self currentDocument] + 64) <= a3)
  {
LABEL_22:
    id v14 = 0;
  }
  else
  {
    while (1)
    {
      v7 = [(CRCoderUnarchiver *)self allocedDocObjects];
      unint64_t v8 = [v7 count];

      v9 = [(CRCoderUnarchiver *)self allocedDocObjects];
      v10 = v9;
      if (v8 > a3) {
        break;
      }
      v11 = [MEMORY[0x1E4F1CA98] null];
      [v10 addObject:v11];
    }
    v12 = [v9 objectAtIndexedSubscript:a3];

    v13 = [MEMORY[0x1E4F1CA98] null];

    if (v12 == v13)
    {

      uint64_t v15 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<CRDT::Document_DocObject>::TypeHandler>((uint64_t)([(CRCoderUnarchiver *)self currentDocument] + 56), a3);
      id v14 = 0;
      v16 = off_1E61DB0D8;
      switch(*(_DWORD *)(v15 + 48))
      {
        case 1:
          goto LABEL_19;
        case 2:
          v16 = off_1E61DB0D0;
          goto LABEL_19;
        case 3:
          v16 = off_1E61DB0E0;
          goto LABEL_19;
        case 4:
          v16 = off_1E61DB0F8;
          goto LABEL_19;
        case 6:
          v16 = off_1E61DB0B8;
          goto LABEL_19;
        case 7:
          v16 = off_1E61DB108;
          goto LABEL_19;
        case 8:
          v16 = off_1E61DB118;
          goto LABEL_19;
        case 0xA:
          v16 = off_1E61DBCA0;
          goto LABEL_19;
        case 0xD:
          uint64_t v18 = *(void *)(v15 + 40);
          if ((*(unsigned char *)(v18 + 32) & 1) == 0) {
            goto LABEL_22;
          }
          uint64_t v20 = *(int *)(v18 + 64);
          v21 = [(CRCoderUnarchiver *)self typeSetForDecoding];
          v22 = [v21 objectAtIndex:v20];

          v23 = [(CRCoder *)self typeToClassDict];
          v24 = (objc_class *)[v23 objectForKeyedSubscript:v22];

          if ([(CRCoderUnarchiver *)self willModifySelfInInitForClass:v24])
          {
            if (a4) {
              *a4 = 0;
            }
            id v25 = (id)[[v24 alloc] initWithCRCoder:self];
          }
          else
          {
            id v25 = [v24 alloc];
          }
          id v26 = v25;

          id v14 = v26;
          if (!v26) {
            break;
          }
          goto LABEL_20;
        case 0xE:
          v16 = off_1E61DBC98;
          goto LABEL_19;
        case 0xF:
          v16 = off_1E61DB090;
          goto LABEL_19;
        case 0x10:
          v16 = off_1E61DB110;
LABEL_19:
          id v14 = objc_alloc(*v16);
          if (v14)
          {
LABEL_20:
            v17 = [(CRCoderUnarchiver *)self allocedDocObjects];
            [v17 setObject:v14 atIndexedSubscript:a3];
          }
          break;
        default:
          break;
      }
    }
    else
    {
      id v14 = v12;
    }
  }

  return v14;
}

- (id)decodeDocumentFromData:(id)a3 replica:(id)a4
{
}

- (const)currentObjectIDForKey:(id)a3
{
  id v4 = a3;
  if (*(_DWORD *)([(CRCoderUnarchiver *)self currentDocObjectForDecodingPtr] + 48) != 13
    || ((uint64_t v5 = [(CRCoderUnarchiver *)self currentDocObjectForDecodingPtr],
         *((_DWORD *)v5 + 12) != 13)
      ? (uint64_t v6 = CRDT::Document_CustomObject::default_instance((CRDT::Document_CustomObject *)v5))
      : (uint64_t v6 = v5[5]),
        (v7 = [(CRCoderUnarchiver *)self indexForKey:v4], int v8 = v7, v7 == 0x7FFFFFFFFFFFFFFFLL)
     || *(int *)(v6 + 48) < 1))
  {
LABEL_13:
    v12 = 0;
  }
  else
  {
    int v9 = 0;
    while (1)
    {
      uint64_t v10 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<CRDT::Document_CustomObject_MapEntry>::TypeHandler>(v6 + 40, v9);
      if ((~*(_DWORD *)(v10 + 32) & 3) == 0 && *(_DWORD *)(v10 + 48) == v8) {
        break;
      }
      if (++v9 >= *(_DWORD *)(v6 + 48)) {
        goto LABEL_13;
      }
    }
    v12 = *(const void **)(v10 + 40);
    if (!v12) {
      v12 = *(const void **)(CRDT::Document_CustomObject_MapEntry::default_instance((CRDT::Document_CustomObject_MapEntry *)v10)
    }
                           + 40);
  }

  return v12;
}

- (id)decodeObjectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRCoderUnarchiver *)self currentObjectIDForKey:v4];
  if (v5)
  {
    uint64_t v6 = [(CRCoderUnarchiver *)self decodeObjectForProtobufObjectID:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)decodeObjectForProtobufObjectID:(const void *)a3
{
  if (*((_DWORD *)a3 + 12) == 6)
  {
    v3 = [(CRCoderUnarchiver *)self allocedObjectAtIndex:*((unsigned int *)a3 + 10) outNeedsInit:0];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)decodeStringForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRCoderUnarchiver *)self currentObjectIDForKey:v4];
  if (*((_DWORD *)v5 + 12) == 4)
  {
    uint64_t v6 = (uint64_t *)v5[5];
    if (*((char *)v6 + 23) < 0) {
      uint64_t v6 = (uint64_t *)*v6;
    }
    unint64_t v7 = [NSString stringWithUTF8String:v6];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)decodeUUIDForKey:(id)a3
{
  v3 = [(CRCoderUnarchiver *)self decodeStringForKey:a3];
  if ([v3 length]) {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (double)decodeDoubleForKey:(id)a3
{
  v3 = [(CRCoderUnarchiver *)self currentObjectIDForKey:a3];
  double result = 0.0;
  if (*((_DWORD *)v3 + 12) == 3) {
    return v3[5];
  }
  return result;
}

- (int)decodeInt32ForKey:(id)a3
{
  v3 = [(CRCoderUnarchiver *)self currentObjectIDForKey:a3];
  if (v3)
  {
    if (v3[12] == 1) {
      LODWORD(v3) = v3[10];
    }
    else {
      LODWORD(v3) = 0;
    }
  }
  return (int)v3;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  int64_t result = [(CRCoderUnarchiver *)self currentObjectIDForKey:a3];
  if (result)
  {
    if (*(_DWORD *)(result + 48) == 1) {
      return *(void *)(result + 40);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (unsigned)decodeUInt32ForKey:(id)a3
{
  v3 = [(CRCoderUnarchiver *)self currentObjectIDForKey:a3];
  if (v3)
  {
    if (v3[12] == 2) {
      LODWORD(v3) = v3[10];
    }
    else {
      LODWORD(v3) = 0;
    }
  }
  return v3;
}

- (unint64_t)decodeUInt64ForKey:(id)a3
{
  unint64_t result = [(CRCoderUnarchiver *)self currentObjectIDForKey:a3];
  if (result)
  {
    if (*(_DWORD *)(result + 48) == 2) {
      return *(void *)(result + 40);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (id)decodeUUIDFromUUIDIndex:(unint64_t)a3
{
  id v4 = [(CRCoderUnarchiver *)self uuidArray];
  uint64_t v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (BOOL)hasDecodableValueForKey:(id)a3
{
  return [(CRCoderUnarchiver *)self currentObjectIDForKey:a3] != 0;
}

- (void)addDecoderCompletionHandler:(id)a3 dependency:(id)a4 for:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_alloc_init(CRCoderUnarchiverCompletionHandler);
  [(CRCoderUnarchiverCompletionHandler *)v10 setBlock:v12];
  [(CRCoderUnarchiverCompletionHandler *)v10 setDependency:v8];
  [(CRCoderUnarchiverCompletionHandler *)v10 setValue:v9];
  v11 = [(CRCoderUnarchiver *)self completionHandlers];
  [v11 addObject:v10];
}

- (void)sortCompletionHandlers
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v4 = [(CRCoderUnarchiver *)self completionHandlers];
  uint64_t v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  while (1)
  {
    uint64_t v6 = [(CRCoderUnarchiver *)self completionHandlers];
    BOOL v7 = [v6 count] == 0;

    if (v7) {
      break;
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v8 = [(CRCoderUnarchiver *)self completionHandlers];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (!v9) {
      goto LABEL_24;
    }
    uint64_t v10 = *(void *)v31;
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v31 != v10) {
        objc_enumerationMutation(v8);
      }
      id v12 = *(void **)(*((void *)&v30 + 1) + 8 * v11);
      v13 = [v12 dependency];
      BOOL v14 = v13 == 0;

      if (v14) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (!v9)
        {
LABEL_24:

LABEL_25:
          id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"No topological sort of completion handlers." userInfo:0];
          objc_exception_throw(v25);
        }
        goto LABEL_5;
      }
    }
    id v15 = v12;

    if (!v15) {
      goto LABEL_25;
    }
    [v5 addObject:v15];
    v16 = [(CRCoderUnarchiver *)self completionHandlers];
    [v16 removeObject:v15];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v17 = [(CRCoderUnarchiver *)self completionHandlers];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v17);
          }
          v21 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v22 = [v21 dependency];
          v23 = [v15 value];
          BOOL v24 = v22 == v23;

          if (v24) {
            [v21 setDependency:0];
          }
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v18);
    }
  }
  [(CRCoderUnarchiver *)self setCompletionHandlers:v5];
}

- (unint64_t)indexForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRCoderUnarchiver *)self keySet];
  unint64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (NSUUID)replica
{
  return self->_replica;
}

- (void)setReplica:(id)a3
{
}

- (CRDocument)document
{
  return self->_document;
}

- (void)setDocument:(id)a3
{
}

- (void)currentDocument
{
  return self->_currentDocument;
}

- (void)setCurrentDocument:(void *)a3
{
  self->_currentDocument = a3;
}

- (NSMutableArray)allocedDocObjects
{
  return self->_allocedDocObjects;
}

- (void)setAllocedDocObjects:(id)a3
{
}

- (const)currentDocObjectForDecodingPtr
{
  return self->_currentDocObjectForDecodingPtr;
}

- (void)setCurrentDocObjectForDecodingPtr:(const void *)a3
{
  self->_currentDocObjectForDecodingPtr = a3;
}

- (NSMutableOrderedSet)typeSetForDecoding
{
  return self->_typeSetForDecoding;
}

- (void)setTypeSetForDecoding:(id)a3
{
}

- (NSMutableOrderedSet)keySet
{
  return self->_keySet;
}

- (void)setKeySet:(id)a3
{
}

- (NSMutableArray)uuidArray
{
  return self->_uuidArray;
}

- (void)setUuidArray:(id)a3
{
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_uuidArray, 0);
  objc_storeStrong((id *)&self->_keySet, 0);
  objc_storeStrong((id *)&self->_typeSetForDecoding, 0);
  objc_storeStrong((id *)&self->_allocedDocObjects, 0);
  objc_storeStrong((id *)&self->_document, 0);

  objc_storeStrong((id *)&self->_replica, 0);
}

@end