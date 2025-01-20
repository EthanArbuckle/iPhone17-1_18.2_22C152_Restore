@interface ICCRCoderUnarchiver
+ (id)decodedDocumentFromData:(id)a3 replica:(id)a4;
+ (void)initialize;
- (BOOL)hasDecodableValueForKey:(id)a3;
- (BOOL)willModifySelfInInitForClass:(Class)a3;
- (ICCRDocument)document;
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
- (id)decodeDataForKey:(id)a3;
- (id)decodeDocumentFromData:(id)a3 replica:(id)a4;
- (id)decodeKeys;
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

@implementation ICCRCoderUnarchiver

- (id)decodeDocumentFromData:(id)a3 replica:(id)a4
{
}

- (void)currentDocument
{
  return self->_currentDocument;
}

- (NSMutableOrderedSet)typeSetForDecoding
{
  return self->_typeSetForDecoding;
}

- (BOOL)willModifySelfInInitForClass:(Class)a3
{
  if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) != 0
    || ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) != 0
    || ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) != 0)
  {
    return 1;
  }
  uint64_t v5 = objc_opt_class();
  return [(objc_class *)a3 isSubclassOfClass:v5];
}

- (void)setCurrentDocObjectForDecodingPtr:(const void *)a3
{
  self->_currentDocObjectForDecodingPtr = a3;
}

- (id)decodeUUIDFromUUIDIndex:(unint64_t)a3
{
  uint64_t v5 = [(ICCRCoderUnarchiver *)self uuidArray];
  unint64_t v6 = [v5 count];

  if (v6 <= a3) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "index < self.uuidArray.count", "-[ICCRCoderUnarchiver decodeUUIDFromUUIDIndex:]", 1, 0, @"Index %ld out of bounds", a3);
  }
  v7 = [(ICCRCoderUnarchiver *)self uuidArray];
  v8 = [v7 objectAtIndexedSubscript:a3];

  return v8;
}

- (NSMutableArray)uuidArray
{
  return self->_uuidArray;
}

- (id)decodeObjectForProtobufObjectID:(const void *)a3
{
  if (*((_DWORD *)a3 + 12) == 6)
  {
    v3 = [(ICCRCoderUnarchiver *)self allocedObjectAtIndex:*((unsigned int *)a3 + 10) outNeedsInit:0];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)allocedObjectAtIndex:(unint64_t)a3 outNeedsInit:(BOOL *)a4
{
  if (a4) {
    *a4 = 1;
  }
  if (*(int *)([(ICCRCoderUnarchiver *)self currentDocument] + 64) <= a3)
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICCRCoderUnarchiver allocedObjectAtIndex:outNeedsInit:]" simulateCrash:1 showAlert:0 format:@"Index out of bounds"];
LABEL_7:
    v12 = 0;
    goto LABEL_45;
  }
  while (1)
  {
    v7 = [(ICCRCoderUnarchiver *)self allocedDocObjects];
    unint64_t v8 = [v7 count];

    v9 = [(ICCRCoderUnarchiver *)self allocedDocObjects];
    v10 = v9;
    if (v8 > a3) {
      break;
    }
    v11 = [MEMORY[0x1E4F1CA98] null];
    [v10 addObject:v11];
  }
  v12 = [v9 objectAtIndexedSubscript:a3];

  v13 = [MEMORY[0x1E4F1CA98] null];

  if (v12 != v13) {
    goto LABEL_45;
  }

  uint64_t v14 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<CRDT::Document_DocObject>::TypeHandler>((uint64_t)([(ICCRCoderUnarchiver *)self currentDocument] + 56), a3);
  v15 = off_1E64A3430;
  switch(*(_DWORD *)(v14 + 48))
  {
    case 1:
      v15 = off_1E64A3450;
      goto LABEL_33;
    case 2:
      v15 = off_1E64A3448;
      goto LABEL_33;
    case 3:
      v15 = off_1E64A3458;
      goto LABEL_33;
    case 4:
      v15 = off_1E64A3470;
      goto LABEL_33;
    case 5:
      goto LABEL_33;
    case 6:
      v15 = off_1E64A3408;
      goto LABEL_33;
    case 7:
      v15 = off_1E64A3480;
      goto LABEL_33;
    case 8:
      v15 = off_1E64A34A8;
      goto LABEL_33;
    case 9:
      v15 = off_1E64A3418;
      goto LABEL_33;
    case 0xA:
      if (a4) {
        *a4 = 0;
      }
      v16 = [[ICTTMergeableAttributedString alloc] initWithICCRCoder:self];
      goto LABEL_34;
    case 0xB:
      v15 = &off_1E64A34B8;
      goto LABEL_33;
    case 0xC:
      v15 = off_1E64A3428;
      goto LABEL_33;
    case 0xD:
      uint64_t v17 = *(void *)(v14 + 40);
      if ((*(unsigned char *)(v17 + 32) & 1) == 0)
      {
        [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"customObject.has_type()" functionName:"-[ICCRCoderUnarchiver allocedObjectAtIndex:outNeedsInit:]" simulateCrash:1 showAlert:0 format:@"Type not set"];
        if ((*(unsigned char *)(v17 + 32) & 1) == 0) {
          goto LABEL_44;
        }
      }
      uint64_t v18 = *(int *)(v17 + 64);
      v19 = [(ICCRCoderUnarchiver *)self typeSetForDecoding];
      v20 = [v19 objectAtIndex:v18];

      v21 = [(ICCRCoder *)self typeToClassDict];
      v22 = (objc_class *)[v21 objectForKeyedSubscript:v20];

      if (!v22)
      {
        [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"aClass", "-[ICCRCoderUnarchiver allocedObjectAtIndex:outNeedsInit:]", 1, 0, @"Did not find class for type: %@", v20 functionName simulateCrash showAlert format];
        goto LABEL_42;
      }
      if (![(ICCRCoderUnarchiver *)self willModifySelfInInitForClass:v22])
      {
LABEL_42:
        id v23 = [v22 alloc];
        goto LABEL_43;
      }
      if (a4) {
        *a4 = 0;
      }
      id v23 = (id)[[v22 alloc] initWithICCRCoder:self];
LABEL_43:
      v12 = v23;

      if (v12)
      {
LABEL_35:
        v24 = [(ICCRCoderUnarchiver *)self allocedDocObjects];
        [v24 setObject:v12 atIndexedSubscript:a3];
      }
      else
      {
LABEL_44:
        v12 = 0;
        objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCRCoderUnarchiver allocedObjectAtIndex:outNeedsInit:]", 1, 0, @"Failed to allocate memory at index %ld", a3);
      }
LABEL_45:
      return v12;
    case 0xE:
      v15 = off_1E64A3968;
      goto LABEL_33;
    case 0xF:
      v15 = off_1E64A33E0;
      goto LABEL_33;
    case 0x10:
      v15 = off_1E64A3488;
LABEL_33:
      v16 = (ICTTMergeableAttributedString *)objc_alloc(*v15);
LABEL_34:
      v12 = v16;
      if (v16) {
        goto LABEL_35;
      }
      goto LABEL_44;
    default:
      v25 = (void *)MEMORY[0x1E4F836F8];
      (*(void (**)(void **__return_ptr))(*(void *)v14 + 16))(__p);
      if (v29 >= 0) {
        v26 = __p;
      }
      else {
        v26 = (void **)__p[0];
      }
      objc_msgSend(v25, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCRCoderUnarchiver allocedObjectAtIndex:outNeedsInit:]", 1, 0, @"Unable to allocate memory for unknown object of type: %s", v26);
      if (v29 < 0) {
        operator delete(__p[0]);
      }
      goto LABEL_7;
  }
}

- (NSMutableArray)allocedDocObjects
{
  return self->_allocedDocObjects;
}

- (unint64_t)decodeUInt64ForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCRCoderUnarchiver *)self currentObjectIDForKey:v4];
  if (v5 && *((_DWORD *)v5 + 12) == 2)
  {
    unint64_t v6 = v5[5];
  }
  else
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no", "-[ICCRCoderUnarchiver decodeUInt64ForKey:]", 1, 0, @"Unable to find integer for key: %@", v4 functionName simulateCrash showAlert format];
    unint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)hasDecodableValueForKey:(id)a3
{
  return [(ICCRCoderUnarchiver *)self currentObjectIDForKey:a3] != 0;
}

- (int)decodeInt32ForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCRCoderUnarchiver *)self currentObjectIDForKey:v4];
  if (v5 && v5[12] == 1)
  {
    int v6 = v5[10];
  }
  else
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no", "-[ICCRCoderUnarchiver decodeInt32ForKey:]", 1, 0, @"Unable to find integer for key: %@", v4 functionName simulateCrash showAlert format];
    int v6 = 0;
  }

  return v6;
}

- (void)setCompletionHandlers:(id)a3
{
}

- (ICCRDocument)document
{
  return self->_document;
}

- (void)setTypeSetForDecoding:(id)a3
{
}

- (void)setKeySet:(id)a3
{
}

- (void)setCurrentDocument:(void *)a3
{
  self->_currentDocument = a3;
}

- (void)setAllocedDocObjects:(id)a3
{
}

- (void)setUuidArray:(id)a3
{
}

- (void)setReplica:(id)a3
{
}

- (void)setDocument:(id)a3
{
}

- (const)currentObjectIDForKey:(id)a3
{
  id v4 = a3;
  if (*(_DWORD *)([(ICCRCoderUnarchiver *)self currentDocObjectForDecodingPtr] + 48) != 13) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"self.currentDocObjectForDecodingPtr->has_custom()" functionName:"-[ICCRCoderUnarchiver currentObjectIDForKey:]" simulateCrash:1 showAlert:0 format:@"Not a custom object"];
  }
  if (*(_DWORD *)([(ICCRCoderUnarchiver *)self currentDocObjectForDecodingPtr] + 48) != 13
    || ((uint64_t v5 = [(ICCRCoderUnarchiver *)self currentDocObjectForDecodingPtr],
         *((_DWORD *)v5 + 12) != 13)
      ? (uint64_t v6 = CRDT::Document_CustomObject::default_instance((CRDT::Document_CustomObject *)v5))
      : (uint64_t v6 = v5[5]),
        (v7 = [(ICCRCoderUnarchiver *)self indexForKey:v4], int v8 = v7, v7 == 0x7FFFFFFFFFFFFFFFLL)
     || *(int *)(v6 + 48) < 1))
  {
LABEL_15:
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
        goto LABEL_15;
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

- (const)currentDocObjectForDecodingPtr
{
  return self->_currentDocObjectForDecodingPtr;
}

- (unint64_t)indexForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCRCoderUnarchiver *)self keySet];

  if (!v5) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"self.keySet" functionName:"-[ICCRCoderUnarchiver indexForKey:]" simulateCrash:1 showAlert:0 format:@"keySet should have been allocated"];
  }
  uint64_t v6 = [(ICCRCoderUnarchiver *)self keySet];
  unint64_t v7 = [v6 indexOfObject:v4];

  return v7;
}

- (NSMutableOrderedSet)keySet
{
  return self->_keySet;
}

- (void)addDecoderCompletionHandler:(id)a3 dependency:(id)a4 for:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_alloc_init(ICCRCoderUnarchiverCompletionHandler);
  [(ICCRCoderUnarchiverCompletionHandler *)v10 setBlock:v12];
  [(ICCRCoderUnarchiverCompletionHandler *)v10 setDependency:v8];
  [(ICCRCoderUnarchiverCompletionHandler *)v10 setValue:v9];
  v11 = [(ICCRCoderUnarchiver *)self completionHandlers];
  [v11 addObject:v10];
}

- (void)sortCompletionHandlers
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v4 = [(ICCRCoderUnarchiver *)self completionHandlers];
  uint64_t v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  while (1)
  {
    uint64_t v6 = [(ICCRCoderUnarchiver *)self completionHandlers];
    BOOL v7 = [v6 count] == 0;

    if (v7) {
      break;
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v8 = [(ICCRCoderUnarchiver *)self completionHandlers];
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
    v16 = [(ICCRCoderUnarchiver *)self completionHandlers];
    [v16 removeObject:v15];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v17 = [(ICCRCoderUnarchiver *)self completionHandlers];
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
          id v23 = [v15 value];
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
  [(ICCRCoderUnarchiver *)self setCompletionHandlers:v5];
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

+ (void)initialize
{
}

+ (id)decodedDocumentFromData:(id)a3 replica:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = objc_alloc_init(ICCRCoderUnarchiver);
  id v8 = [(ICCRCoderUnarchiver *)v7 decodeDocumentFromData:v5 replica:v6];

  return v8;
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

- (id)decodeKeys
{
  if (*(_DWORD *)([(ICCRCoderUnarchiver *)self currentDocObjectForDecodingPtr] + 48) != 13) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"self.currentDocObjectForDecodingPtr->has_custom()" functionName:"-[ICCRCoderUnarchiver decodeKeys]" simulateCrash:1 showAlert:0 format:@"Not a custom object"];
  }
  if (*(_DWORD *)([(ICCRCoderUnarchiver *)self currentDocObjectForDecodingPtr] + 48) == 13)
  {
    id v3 = [MEMORY[0x1E4F1CA48] array];
    id v4 = [(ICCRCoderUnarchiver *)self currentDocObjectForDecodingPtr];
    if (*((_DWORD *)v4 + 12) == 13) {
      uint64_t v5 = v4[5];
    }
    else {
      uint64_t v5 = CRDT::Document_CustomObject::default_instance((CRDT::Document_CustomObject *)v4);
    }
    if (*(int *)(v5 + 48) >= 1)
    {
      int v7 = 0;
      do
      {
        uint64_t v8 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<CRDT::Document_CustomObject_MapEntry>::TypeHandler>(v5 + 40, v7);
        if ((~*(_DWORD *)(v8 + 32) & 3) == 0)
        {
          uint64_t v9 = *(int *)(v8 + 48);
          uint64_t v10 = [(ICCRCoderUnarchiver *)self keySet];
          uint64_t v11 = [v10 objectAtIndex:v9];
          objc_msgSend(v3, "ic_addNonNilObject:", v11);
        }
        ++v7;
      }
      while (v7 < *(_DWORD *)(v5 + 48));
    }
    id v6 = (void *)[v3 copy];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)decodeObjectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCRCoderUnarchiver *)self currentObjectIDForKey:v4];
  if (v5)
  {
    id v6 = [(ICCRCoderUnarchiver *)self decodeObjectForProtobufObjectID:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)decodeDataForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCRCoderUnarchiver *)self currentObjectIDForKey:v4];
  if (*((_DWORD *)v5 + 12) == 5)
  {
    id v6 = (uint64_t *)v5[5];
    if (*((char *)v6 + 23) < 0)
    {
      id v6 = (uint64_t *)*v6;
      uint64_t v7 = *(void *)(v5[5] + 8);
    }
    else
    {
      uint64_t v7 = *((unsigned __int8 *)v6 + 23);
    }
    uint64_t v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v6 length:v7];
  }
  else
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no", "-[ICCRCoderUnarchiver decodeDataForKey:]", 1, 0, @"Unable to find data for key: %@", v4 functionName simulateCrash showAlert format];
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)decodeStringForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCRCoderUnarchiver *)self currentObjectIDForKey:v4];
  if (*((_DWORD *)v5 + 12) == 4)
  {
    id v6 = (uint64_t *)v5[5];
    if (*((char *)v6 + 23) < 0) {
      id v6 = (uint64_t *)*v6;
    }
    uint64_t v7 = [NSString stringWithUTF8String:v6];
  }
  else
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no", "-[ICCRCoderUnarchiver decodeStringForKey:]", 1, 0, @"Unable to find string for key: %@", v4 functionName simulateCrash showAlert format];
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)decodeUUIDForKey:(id)a3
{
  id v3 = [(ICCRCoderUnarchiver *)self decodeStringForKey:a3];
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
  id v4 = a3;
  uint64_t v5 = [(ICCRCoderUnarchiver *)self currentObjectIDForKey:v4];
  if (*((_DWORD *)v5 + 12) == 3)
  {
    double v6 = v5[5];
  }
  else
  {
    double v6 = 0.0;
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no", "-[ICCRCoderUnarchiver decodeDoubleForKey:]", 1, 0, @"Unable to find double for key: %@", v4 functionName simulateCrash showAlert format];
  }

  return v6;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCRCoderUnarchiver *)self currentObjectIDForKey:v4];
  if (v5 && *((_DWORD *)v5 + 12) == 1)
  {
    int64_t v6 = v5[5];
  }
  else
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no", "-[ICCRCoderUnarchiver decodeInt64ForKey:]", 1, 0, @"Unable to find integer for key: %@", v4 functionName simulateCrash showAlert format];
    int64_t v6 = 0;
  }

  return v6;
}

- (unsigned)decodeUInt32ForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCRCoderUnarchiver *)self currentObjectIDForKey:v4];
  if (v5 && v5[12] == 2)
  {
    unsigned int v6 = v5[10];
  }
  else
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no", "-[ICCRCoderUnarchiver decodeUInt32ForKey:]", 1, 0, @"Unable to find integer for key: %@", v4 functionName simulateCrash showAlert format];
    unsigned int v6 = 0;
  }

  return v6;
}

- (NSUUID)replica
{
  return self->_replica;
}

@end