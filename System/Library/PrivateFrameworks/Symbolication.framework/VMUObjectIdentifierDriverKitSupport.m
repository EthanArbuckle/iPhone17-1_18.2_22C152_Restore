@interface VMUObjectIdentifierDriverKitSupport
- (VMUObjectIdentifierDriverKitSupport)initWithObjectIdentifier:(id)a3;
- (id)_fieldsFromStructureLayout:(id *)a3 withOffset:(unint64_t)a4;
- (id)_fieldsOfLegacyOSObject:(id)a3;
- (id)_fieldsOfLocalDriverKitOSObject:(id)a3;
- (id)_fieldsOfOSObject:(id)a3 startOffset:(unint64_t)a4;
- (id)_fieldsOfRemoteDriverKitOSObject:(id)a3;
- (id)_labelForDriverKitOSClassLoadInformation:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)_labelForDriverKitOSMetaClass:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)classInfoForDriverKitMemory:(void *)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 translatedIsa:(unint64_t)a6 symbol:(_CSTypeRef)a7;
- (id)classInfoForDriverKitOSClassScan;
- (id)classInfoForDriverKitOSMetaClass;
- (id)classInfoForDriverKitOSMetaClassPrivate;
- (id)driverKitClassInfoForMemory:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForDriverKitMemory:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5 class:(id)a6;
- (void)dealloc;
@end

@implementation VMUObjectIdentifierDriverKitSupport

- (VMUObjectIdentifierDriverKitSupport)initWithObjectIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 taskIsDriverKit])
  {
    v23.receiver = self;
    v23.super_class = (Class)VMUObjectIdentifierDriverKitSupport;
    v5 = [(VMUObjectIdentifierDriverKitSupport *)&v23 init];
    v6 = v5;
    if (v5)
    {
      objc_storeWeak((id *)&v5->_objectIdentifier, v4);
      v7 = [v4 scanner];
      v6->_task = [v7 task];

      [v4 symbolicator];
      uint64_t SymbolOwnerWithNameAtTime = CSSymbolicatorGetSymbolOwnerWithNameAtTime();
      uint64_t v10 = v9;
      v11 = [v4 memoryReader];
      uint64_t StructureLayoutDescription = getStructureLayoutDescription(SymbolOwnerWithNameAtTime, v10, (uint64_t)"gOSMetaClassBasePrivateLayout", v11);

      v13 = [v4 memoryReader];
      uint64_t v14 = getStructureLayoutDescription(SymbolOwnerWithNameAtTime, v10, (uint64_t)"gOSMetaClassBaseRemotePrivateLayout", v13);

      if (StructureLayoutDescription)
      {
        v6->_vtableOffsetOfLocalDriverKitOSObject = *(void *)(StructureLayoutDescription + 24);
        uint64_t v15 = [(VMUObjectIdentifierDriverKitSupport *)v6 _fieldsFromStructureLayout:StructureLayoutDescription withOffset:0];
        privateFieldsOfLocalDriverKitOSObject = v6->_privateFieldsOfLocalDriverKitOSObject;
        v6->_privateFieldsOfLocalDriverKitOSObject = (NSArray *)v15;

        if (v14)
        {
          v6->_vtableOffsetOfRemoteDriverKitOSObject = *(void *)(StructureLayoutDescription + 24)
                                                     + *(void *)(v14 + 24);
          v17 = [(VMUObjectIdentifierDriverKitSupport *)v6 _fieldsFromStructureLayout:v14 withOffset:0];
          v18 = [(VMUObjectIdentifierDriverKitSupport *)v6 _fieldsFromStructureLayout:StructureLayoutDescription withOffset:*(void *)(v14 + 24)];
          [(NSArray *)v17 addObjectsFromArray:v18];

          privateFieldsOfRemoteDriverKitOSObject = v6->_privateFieldsOfRemoteDriverKitOSObject;
          v6->_privateFieldsOfRemoteDriverKitOSObject = v17;
        }
      }
      else
      {
        v6->_vtableOffsetOfLegacyOSObject = 88;
      }
      v6->_vtableOffsetsCount = 3;
      v21 = (unint64_t *)malloc_type_malloc(0x18uLL, 0x100004000313F17uLL);
      v6->_vtableOffsets = v21;
      unint64_t *v21 = v6->_vtableOffsetOfRemoteDriverKitOSObject;
      v21[1] = v6->_vtableOffsetOfLocalDriverKitOSObject;
      v21[2] = v6->_vtableOffsetOfLegacyOSObject;
    }
    self = v6;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)dealloc
{
  vtableOffsets = self->_vtableOffsets;
  if (vtableOffsets) {
    free(vtableOffsets);
  }
  v4.receiver = self;
  v4.super_class = (Class)VMUObjectIdentifierDriverKitSupport;
  [(VMUObjectIdentifierDriverKitSupport *)&v4 dealloc];
}

- (id)_fieldsFromStructureLayout:(id *)a3 withOffset:(unint64_t)a4
{
  int v4 = a4;
  v7 = objc_opt_new();
  unint64_t var4 = a3->var4;
  if (var4)
  {
    var5 = a3->var5;
    do
    {
      mach_vm_address_t v10 = task_peek_string(self->_task, (mach_vm_address_t)var5->var0);
      mach_vm_address_t v11 = task_peek_string(self->_task, (mach_vm_address_t)var5->var1);
      v12 = [VMUMutableFieldInfo alloc];
      v13 = [NSString stringWithUTF8String:v10];
      uint64_t v14 = [NSString stringWithUTF8String:v11];
      uint64_t v15 = [(VMUFieldInfo *)v12 initWithName:v13 type:v14 scan:1 offset:(LODWORD(var5->var2) + v4) size:LODWORD(var5->var3)];

      [v7 addObject:v15];
      ++var5;
      --var4;
    }
    while (var4);
  }

  return v7;
}

- (id)_fieldsOfLegacyOSObject:(id)a3
{
  v29[19] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 pointerSize];
  v28 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"server" type:@"^{IOUserServer_IVars}" scan:1 offset:0 size:v4];
  v25 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"objectRefsListEntryNext" type:@"^v" scan:4 offset:8 size:v4];
  v24 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"objectRefsListEntryPrev" type:@"^v" scan:4 offset:16 size:v4];
  v27 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"objectRef" type:@"Q" scan:0 offset:24 size:8];
  v26 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"flags" type:@"Q" scan:0 offset:32 size:8];
  v20 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"sendRights" type:@"L" scan:0 offset:40 size:4];
  objc_super v23 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"remoteQueueCount" type:@"L" scan:0 offset:44 size:4];
  v19 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"remoteMethodsCount" type:@"L" scan:0 offset:48 size:4];
  v22 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"remoteQueues" type:@"^Q" scan:1 offset:56 size:v4];
  v21 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"remoteMethods" type:@"^Q" scan:1 offset:64 size:v4];
  v5 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"queueAlloc" type:@"L" scan:0 offset:72 size:4];
  v6 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"queueArray" type:@"^@\"IODispatchQueue\"" scan:1 offset:80 size:v4];
  v18 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"vtable" type:@"^" scan:0 offset:88 size:v4];
  v17 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"refcount" type:@"l" scan:0 offset:96 size:4];
  v7 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"reserved" type:@"l" scan:0 offset:100 size:4];
  v8 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"meta" type:@"@" scan:1 offset:104 size:v4];
  v16 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"metaClassPrivate" type:@"^{OSMetaClassPrivate}" scan:1 offset:112 size:v4];
  uint64_t v15 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"retainCount" type:@"i" scan:0 offset:120 size:4];
  uint64_t v9 = NSString;
  mach_vm_address_t v10 = [v3 className];

  mach_vm_address_t v11 = [v9 stringWithFormat:@"^{%@_IVars}", v10];

  v12 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"ivars" type:v11 scan:1 offset:128 size:v4];
  v29[0] = v28;
  v29[1] = v25;
  v29[2] = v24;
  v29[3] = v27;
  v29[4] = v26;
  v29[5] = v20;
  v29[6] = v23;
  v29[7] = v19;
  v29[8] = v22;
  v29[9] = v21;
  v29[10] = v5;
  v29[11] = v6;
  v29[12] = v18;
  v29[13] = v17;
  v29[14] = v7;
  v29[15] = v8;
  v29[16] = v16;
  v29[17] = v15;
  v29[18] = v12;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:19];

  return v14;
}

- (id)_fieldsOfOSObject:(id)a3 startOffset:(unint64_t)a4
{
  v19[7] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 pointerSize];
  v18 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"vtable" type:@"^" scan:0 offset:a4 size:v6];
  v17 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"refcount" type:@"l" scan:0 offset:(a4 + 8) size:4];
  v7 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"reserved" type:@"l" scan:0 offset:(a4 + 12) size:4];
  v8 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"meta" type:@"@" scan:1 offset:(a4 + 16) size:v6];
  uint64_t v9 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"metaClassPrivate" type:@"^{OSMetaClassPrivate}" scan:1 offset:(a4 + 24) size:v6];
  mach_vm_address_t v10 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"extra" type:@"i" scan:0 offset:(a4 + 32) size:4];
  mach_vm_address_t v11 = NSString;
  v12 = [v5 displayName];

  v13 = [v11 stringWithFormat:@"^{%@_IVars}", v12];

  id v14 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"ivars" type:v13 scan:1 offset:(a4 + 40) size:v6];
  v19[0] = v18;
  v19[1] = v17;
  v19[2] = v7;
  v19[3] = v8;
  v19[4] = v9;
  v19[5] = v10;
  v19[6] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:7];

  return v15;
}

- (id)_fieldsOfRemoteDriverKitOSObject:(id)a3
{
  unint64_t vtableOffsetOfRemoteDriverKitOSObject = self->_vtableOffsetOfRemoteDriverKitOSObject;
  uint64_t v6 = self->_privateFieldsOfRemoteDriverKitOSObject;
  v7 = [(VMUObjectIdentifierDriverKitSupport *)self _fieldsOfOSObject:a3 startOffset:vtableOffsetOfRemoteDriverKitOSObject];
  v8 = [(NSArray *)v6 arrayByAddingObjectsFromArray:v7];

  return v8;
}

- (id)_fieldsOfLocalDriverKitOSObject:(id)a3
{
  unint64_t vtableOffsetOfLocalDriverKitOSObject = self->_vtableOffsetOfLocalDriverKitOSObject;
  uint64_t v6 = self->_privateFieldsOfLocalDriverKitOSObject;
  v7 = [(VMUObjectIdentifierDriverKitSupport *)self _fieldsOfOSObject:a3 startOffset:vtableOffsetOfLocalDriverKitOSObject];
  v8 = [(NSArray *)v6 arrayByAddingObjectsFromArray:v7];

  return v8;
}

- (id)classInfoForDriverKitOSClassScan
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectIdentifier);
  id v3 = [WeakRetained classInfoWithNonobjectType:@"struct OSClassScan" binaryPath:@"DriverKit"];

  return v3;
}

- (id)classInfoForDriverKitOSMetaClassPrivate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectIdentifier);
  id v3 = [WeakRetained classInfoWithNonobjectType:@"struct OSMetaClassPrivate" binaryPath:@"DriverKit"];

  return v3;
}

- (id)classInfoForDriverKitOSMetaClass
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectIdentifier);
  id v3 = [WeakRetained classInfoWithNonobjectType:@"OSMetaClass" binaryPath:@"DriverKit"];

  return v3;
}

- (id)classInfoForDriverKitMemory:(void *)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 translatedIsa:(unint64_t)a6 symbol:(_CSTypeRef)a7
{
  Name = (const char *)CSSymbolGetName();
  if (!Name)
  {
LABEL_4:
    v12 = 0;
    goto LABEL_23;
  }
  mach_vm_address_t v11 = (char *)Name;
  if (strncmp(Name, "vtable for ", 0xBuLL))
  {
    if (!a5 && strstr(v11, "_Class"))
    {
      if (a4 < 0x28) {
        [(VMUObjectIdentifierDriverKitSupport *)self classInfoForDriverKitOSClassScan];
      }
      else {
      v12 = [(VMUObjectIdentifierDriverKitSupport *)self classInfoForDriverKitOSMetaClassPrivate];
      }
      goto LABEL_23;
    }
    goto LABEL_4;
  }
  v13 = [NSString stringWithUTF8String:v11 + 11];
  if ([v13 hasSuffix:@"MetaClass"])
  {
    v12 = [(VMUObjectIdentifierDriverKitSupport *)self classInfoForDriverKitOSMetaClass];
  }
  else
  {
    if (a5)
    {
      CSSymbolGetSymbolOwner();
      id v14 = [NSString stringWithUTF8String:CSSymbolOwnerGetPath()];
      v12 = +[VMUClassInfo classInfoWithClassName:v13 binaryPath:v14 type:128];

      if (self->_vtableOffsetOfRemoteDriverKitOSObject == a5)
      {
        uint64_t v15 = [(VMUObjectIdentifierDriverKitSupport *)self _fieldsOfRemoteDriverKitOSObject:v12];
      }
      else if (self->_vtableOffsetOfLocalDriverKitOSObject == a5)
      {
        uint64_t v15 = [(VMUObjectIdentifierDriverKitSupport *)self _fieldsOfLocalDriverKitOSObject:v12];
      }
      else
      {
        if (self->_vtableOffsetOfLegacyOSObject != a5) {
          goto LABEL_22;
        }
        uint64_t v15 = [(VMUObjectIdentifierDriverKitSupport *)self _fieldsOfLegacyOSObject:v12];
      }
      v16 = (void *)v15;
      if (v15)
      {
        [v12 setFields:v15];
      }
      goto LABEL_22;
    }
    v12 = 0;
  }
LABEL_22:

LABEL_23:

  return v12;
}

- (id)driverKitClassInfoForMemory:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  unint64_t vtableOffsetsCount = self->_vtableOffsetsCount;
  if (vtableOffsetsCount)
  {
    unint64_t v10 = 0;
    p_objectIdentifier = &self->_objectIdentifier;
    do
    {
      unint64_t v12 = self->_vtableOffsets[v10];
      if (v12 + 8 <= a4)
      {
        id WeakRetained = objc_loadWeakRetained((id *)p_objectIdentifier);
        id v14 = [WeakRetained _classInfoForMemory:a3 length:a4 atOffset:v12 remoteAddress:a5];

        if (v14) {
          goto LABEL_8;
        }
        unint64_t vtableOffsetsCount = self->_vtableOffsetsCount;
      }
      ++v10;
    }
    while (v10 < vtableOffsetsCount);
  }
  id v14 = 0;
LABEL_8:

  return v14;
}

- (id)_labelForDriverKitOSClassLoadInformation:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (HIDWORD(*(void *)a3)) {
    BOOL v5 = (*(void *)a3 & 7) == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5
    && (id WeakRetained = objc_loadWeakRetained((id *)&self->_objectIdentifier),
        [WeakRetained symbolicator],
        CSSymbolicatorGetSymbolWithAddressAtTime(),
        WeakRetained,
        (CSIsNull() & 1) == 0))
  {
    Name = (void *)CSSymbolGetName();
    if (Name)
    {
      Name = [NSString stringWithUTF8String:Name];
    }
  }
  else
  {
    Name = 0;
  }

  return Name;
}

- (id)_labelForDriverKitOSMetaClass:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (self->_vtableOffsetsCount)
  {
    uint64_t v7 = 0;
    p_objectIdentifier = &self->_objectIdentifier;
    while (1)
    {
      if (HIDWORD(*(void *)((char *)a3 + self->_vtableOffsets[v7]))
        && (*(void *)((unsigned char *)a3 + self->_vtableOffsets[v7]) & 7) == 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)p_objectIdentifier);
        [WeakRetained symbolicator];
        CSSymbolicatorGetSymbolWithAddressAtTime();

        if ((CSIsNull() & 1) == 0)
        {
          Name = (const char *)CSSymbolGetName();
          if (Name)
          {
            unint64_t v12 = Name;
            if (!strncmp(Name, "vtable for ", 0xBuLL)) {
              break;
            }
          }
        }
      }
      if (++v7 >= (unint64_t)self->_vtableOffsetsCount) {
        goto LABEL_12;
      }
    }
    v13 = [NSString stringWithUTF8String:v12 + 11];
  }
  else
  {
LABEL_12:
    v13 = 0;
  }

  return v13;
}

- (id)labelForDriverKitMemory:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5 class:(id)a6
{
  id v10 = a6;
  mach_vm_address_t v11 = [v10 className];
  if ([v11 isEqualToString:@"struct OSClassScan"])
  {

LABEL_4:
    uint64_t v14 = [(VMUObjectIdentifierDriverKitSupport *)self _labelForDriverKitOSClassLoadInformation:a3 length:a4 remoteAddress:a5];
LABEL_5:
    uint64_t v15 = (void *)v14;
    goto LABEL_6;
  }
  unint64_t v12 = [v10 className];
  int v13 = [v12 isEqualToString:@"struct OSMetaClassPrivate"];

  if (v13) {
    goto LABEL_4;
  }
  v17 = [v10 className];
  int v18 = [v17 isEqualToString:@"OSMetaClass"];

  if (v18)
  {
    uint64_t v14 = [(VMUObjectIdentifierDriverKitSupport *)self _labelForDriverKitOSMetaClass:a3 length:a4 remoteAddress:a5];
    goto LABEL_5;
  }
  uint64_t v15 = 0;
LABEL_6:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateFieldsOfLocalDriverKitOSObject, 0);
  objc_storeStrong((id *)&self->_privateFieldsOfRemoteDriverKitOSObject, 0);

  objc_destroyWeak((id *)&self->_objectIdentifier);
}

@end