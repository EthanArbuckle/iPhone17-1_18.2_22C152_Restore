@interface VMUClassInfo
+ (VMUClassInfo)classInfoWithClassName:(id)a3 binaryPath:(id)a4 type:(unsigned int)a5;
+ (id)_genericBlockByrefInfo;
+ (id)descriptionForTypeEncoding:(const char *)a3 ivarName:(const char *)a4;
+ (unint64_t)sizeofClassStructure;
+ (void)initialize;
- (BOOL)hasCppConstructorOrDestructor;
- (BOOL)hasSpecificLayout;
- (BOOL)hasVariantLayout;
- (BOOL)isARR;
- (BOOL)isCoreMediaFigObject;
- (BOOL)isDerivedFromStackBacktrace;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMetaClass;
- (BOOL)isRealized;
- (BOOL)isRootClass;
- (BOOL)usesSwiftRefcounting;
- (NSString)binaryName;
- (NSString)binaryPath;
- (NSString)className;
- (NSString)displayName;
- (NSString)fullIvarDescription;
- (NSString)shortIvarDescription;
- (NSString)typeName;
- (VMUClassInfo)genericInfo;
- (VMUClassInfo)initWithClass:(unint64_t)a3 type:(unsigned int)a4 infoMap:(id)a5 objectIdentifier:(id)a6 reader:(id)a7;
- (VMUClassInfo)initWithClassName:(id)a3 binaryPath:(id)a4 type:(unsigned int)a5;
- (VMUClassInfo)initWithClosureContext:(unint64_t)a3 typeInfo:(swift_typeinfo *)a4 infoMap:(id)a5 swiftFieldMetadataContext:(libSwiftRemoteMirrorWrapper *)a6;
- (VMUClassInfo)initWithCoder:(id)a3;
- (VMUClassInfo)initWithRealizedClass:(unint64_t)a3 type:(unsigned int)a4 infoMap:(id)a5 objectIdentifier:(id)a6 reader:(id)a7;
- (VMUClassInfo)initWithSerializer:(id)a3 classMap:(id)a4 version:(unsigned int)a5 error:(id *)a6;
- (VMUClassInfo)superclassInfo;
- (id)_copyWithInstanceSize:(unsigned int)a3 superclassOffset:(unsigned int)a4 asVariant:(BOOL)a5 mutable:(BOOL)a6;
- (id)_initWithClass:(unint64_t)a3 type:(unsigned int)a4 realizedOnly:(BOOL)a5 infoMap:(id)a6 objectIdentifier:(id)a7 reader:(id)a8;
- (id)debugDescription;
- (id)description;
- (id)fieldAtOrBeforeOffset:(unsigned int)a3;
- (id)firstFieldWithName:(id)a3;
- (id)initSwiftClassWithName:(id)a3 classInfoType:(unsigned int)a4 size:(unint64_t)a5;
- (id)instanceSpecificInfoForObject:(unint64_t)a3 ofSize:(unsigned int)a4 memoryReader:(id)a5;
- (id)instanceSpecificInfoForObject:(unint64_t)a3 ofSize:(unsigned int)a4 withScanner:(id)a5 memoryReader:(id)a6;
- (id)mutableCopy;
- (id)scanDescriptionWithSize:(unsigned int)a3;
- (unint64_t)hash;
- (unint64_t)remoteIsa;
- (unsigned)_ivarGapForClass;
- (unsigned)_objcABIFromObjectIdentifier:(id)a3;
- (unsigned)_totalIvarCount;
- (unsigned)defaultScanType;
- (unsigned)infoType;
- (unsigned)instanceSize;
- (unsigned)ivarCount;
- (unsigned)ivarGapForClassHierarchy;
- (unsigned)pointerSize;
- (unsigned)superclassOffset;
- (void)_addComplexAction:(id)a3 withEvaluator:(id)a4;
- (void)_addFields:(id)a3;
- (void)_addVariantAction:(id)a3 withEvaluator:(id)a4;
- (void)_adjustInstanceSize;
- (void)_applyExtendedLayout:(const char *)a3 withSize:(unsigned int)a4;
- (void)_demangleClassName;
- (void)_determineBinaryPathUsingObjectIdentifier:(id)a3 remoteClassNameLoc:(unint64_t)a4;
- (void)_freeLocalIvarList;
- (void)_identifyObjCClassStructureBlocksForIsa:(unint64_t)a3 isMetaclass:(BOOL)a4 withScanner:(id)a5 addressIdentifierBlock:(id)a6;
- (void)_logDescriptionWithSuperclasses:(BOOL)a3 indentation:(int)a4 toLogger:(id)a5;
- (void)_parseIvarsAndLayouts;
- (void)_processARRLayout:(const char *)a3 scanType:(unsigned int)a4;
- (void)_replaceField:(id)a3 withFields:(id)a4;
- (void)_replaceFieldRecursively:(id)a3 atOffset:(unsigned int)a4 withField:(id)a5;
- (void)_setBinaryPath:(id)a3 sanitize:(BOOL)a4;
- (void)_setClassNameWithAddress:(unint64_t)a3 targetTask:(id)a4;
- (void)_setDefaultScanType:(unsigned int)a3;
- (void)_setDisplayName:(id)a3;
- (void)_setFields:(id)a3;
- (void)_setInfoType:(unsigned int)a3;
- (void)_setInstanceSize:(unsigned int)a3;
- (void)_setIsCoreMediaFigObject:(BOOL)a3;
- (void)_setIsRootClass:(BOOL)a3;
- (void)_setIsa:(unint64_t)a3;
- (void)_setSuperclassInfo:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateAllFieldsWithBlock:(id)a3;
- (void)enumerateAllPointerFieldsWithBlock:(void *)result;
- (void)enumerateClassHierarchyWithBlock:(id)a3;
- (void)enumerateExternalValuesFromObject:(unint64_t)a3 withSize:(unsigned int)a4 block:(id)a5;
- (void)enumerateScanningLocationsForSize:(unsigned int)a3 withBlock:(id)a4;
- (void)enumerateStoredEntriesForObject:(unint64_t)a3 ofSize:(unsigned int)a4 externalValues:(id)a5 block:(id)a6;
- (void)enumerateSublayoutsForSize:(unsigned int)a3 withBlock:(id)a4;
- (void)enumerateTypeFieldsWithBlock:(id)a3;
- (void)identifyObjCClassStructureBlocksWithScanner:(id)a3 addressIdentifierBlock:(id)a4;
- (void)serializeWithClassMap:(id)a3 simpleSerializer:(id)a4 version:(unsigned int)a5;
- (void)setIsDerivedFromStackBacktrace:(BOOL)a3;
@end

@implementation VMUClassInfo

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:4];
  }
}

+ (id)_genericBlockByrefInfo
{
  if (+[VMUClassInfo _genericBlockByrefInfo]::onceToken != -1) {
    dispatch_once(&+[VMUClassInfo _genericBlockByrefInfo]::onceToken, &__block_literal_global_10);
  }
  v2 = (void *)+[VMUClassInfo _genericBlockByrefInfo]::s_genericBlockByrefInfo;

  return v2;
}

void __38__VMUClassInfo__genericBlockByrefInfo__block_invoke()
{
  v0 = [[VMUClassInfo alloc] initWithClassName:@"__NSExactBlockVariable__" binaryPath:@"/usr/lib/system/libsystem_blocks.dylib" type:0x80000000];
  v1 = (void *)+[VMUClassInfo _genericBlockByrefInfo]::s_genericBlockByrefInfo;
  +[VMUClassInfo _genericBlockByrefInfo]::s_genericBlockByrefInfo = (uint64_t)v0;
}

- (void)_processARRLayout:(const char *)a3 scanType:(unsigned int)a4
{
  if (a3)
  {
    v4 = a3;
    unsigned int v5 = *(unsigned __int8 *)a3;
    if (*a3)
    {
      uint64_t v6 = *(void *)&a4;
      unint64_t v8 = 0;
      int v9 = 0;
      unsigned int remotePointerSize = self->_remotePointerSize;
      do
      {
        int v11 = v5 & 0xF;
        int v12 = v9 + (v5 >> 4);
        if (v8 < self->_ivarCount)
        {
          unsigned int v13 = self->_superclassOffset + v12 * remotePointerSize;
          do
          {
            if ([self->_localIvarList[v8] offset] >= v13 + remotePointerSize * v11) {
              break;
            }
            if ([self->_localIvarList[v8] offset] >= v13) {
              [self->_localIvarList[v8] setScanType:v6];
            }
            ++v8;
          }
          while (v8 < self->_ivarCount);
          unint64_t v8 = v8;
        }
        int v9 = v12 + v11;
        unsigned int v14 = *(unsigned __int8 *)++v4;
        unsigned int v5 = v14;
      }
      while (v14);
    }
  }
}

- (void)_parseIvarsAndLayouts
{
  if ([(VMUClassInfo *)self isARR])
  {
    [(VMUClassInfo *)self _processARRLayout:self->_strongLayout scanType:2];
    weakLayout = self->_weakLayout;
    [(VMUClassInfo *)self _processARRLayout:weakLayout scanType:4];
  }
}

- (void)_demangleClassName
{
  if (self->_remoteType == 8)
  {
    p_remoteClassName = &self->_remoteClassName;
    v3 = demangleSwiftClassName([(NSString *)self->_remoteClassName UTF8String]);
    if (v3)
    {
      v4 = v3;
      objc_storeStrong((id *)p_remoteClassName, v3);
      v3 = v4;
    }
  }
}

- (void)_setClassNameWithAddress:(unint64_t)a3 targetTask:(id)a4
{
  id v10 = a4;
  uint64_t v6 = [v10 memoryCache];
  uint64_t v7 = [v6 peekStringAtAddress:a3];

  if (v7)
  {
    unint64_t v8 = (NSString *)[[NSString alloc] initWithUTF8String:v7];
    remoteClassName = self->_remoteClassName;
    self->_remoteClassName = v8;

    [(VMUClassInfo *)self _demangleClassName];
  }
}

- (NSString)displayName
{
  uint64_t v2 = 64;
  if (!self->_displayName) {
    uint64_t v2 = 56;
  }
  return (NSString *)*(id *)((char *)&self->super.isa + v2);
}

- (void)_setDisplayName:(id)a3
{
  v4 = (NSString *)a3;
  if (self->_displayName != v4)
  {
    uint64_t v7 = v4;
    unsigned int v5 = (NSString *)[(NSString *)v4 copy];
    displayName = self->_displayName;
    self->_displayName = v5;

    v4 = v7;
  }
}

- (void)_setBinaryPath:(id)a3 sanitize:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (NSString *)a3;
  if (self->_remoteBinaryPath != v6)
  {
    int v9 = v6;
    if (v4)
    {
      VMUSanitizePath(v6);
      uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v7 = v6;
    }
    remoteBinaryPath = self->_remoteBinaryPath;
    self->_remoteBinaryPath = v7;

    uint64_t v6 = v9;
  }
}

- (void)_setSuperclassInfo:(id)a3
{
  unsigned int v5 = (VMUClassInfo *)a3;
  if (self->_superclassLayout != v5)
  {
    id v10 = v5;
    objc_storeStrong((id *)&self->_superclassLayout, a3);
    unsigned int superclassOffset = self->_superclassOffset;
    unsigned int v7 = [(VMUClassInfo *)v10 instanceSize];
    if (superclassOffset <= v7) {
      unsigned int v8 = v7;
    }
    else {
      unsigned int v8 = superclassOffset;
    }
    unsigned int instanceSize = self->_instanceSize;
    if (instanceSize <= v8) {
      unsigned int instanceSize = v8;
    }
    self->_unsigned int superclassOffset = v8;
    self->_unsigned int instanceSize = instanceSize;
    unsigned int v5 = v10;
  }
}

- (void)_setIsCoreMediaFigObject:(BOOL)a3
{
  self->_isCoreMediaFigObject = a3;
}

- (void)_setDefaultScanType:(unsigned int)a3
{
  self->_defaultScanType = a3;
}

- (unsigned)defaultScanType
{
  return self->_defaultScanType;
}

- (void)_setInstanceSize:(unsigned int)a3
{
  self->_unsigned int instanceSize = a3;
}

- (void)_setIsRootClass:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_ro_flags = self->_ro_flags & 0xFFFFFFFD | v3;
}

- (void)_setInfoType:(unsigned int)a3
{
  self->_remoteType = a3;
}

- (BOOL)hasVariantLayout
{
  char hasVariantLayout = self->_hasVariantLayout;
  if (!hasVariantLayout)
  {
    char hasVariantLayout = 1;
    if (!self->_variantEvaluators)
    {
      if ([(VMUClassInfo *)self->_superclassLayout hasVariantLayout]) {
        char hasVariantLayout = 1;
      }
      else {
        char hasVariantLayout = -1;
      }
    }
    self->_char hasVariantLayout = hasVariantLayout;
  }
  return hasVariantLayout == 1;
}

- (BOOL)hasSpecificLayout
{
  char hasSpecificLayout = self->_hasSpecificLayout;
  if (!hasSpecificLayout)
  {
    if ([(VMUClassInfo *)self hasVariantLayout]
      || [(VMUClassInfo *)self->_superclassLayout hasSpecificLayout])
    {
      char hasSpecificLayout = 1;
    }
    else
    {
      char hasSpecificLayout = 1;
      if (self->_remoteType != 0x80000000)
      {
        unsigned int v5 = [(NSString *)self->_remoteClassName UTF8String];
        if (!v5) {
          unsigned int v5 = "";
        }
        if (!strcmp(v5, "NSBlock")) {
          char hasSpecificLayout = 1;
        }
        else {
          char hasSpecificLayout = -1;
        }
      }
    }
    self->_char hasSpecificLayout = hasSpecificLayout;
  }
  return hasSpecificLayout == 1;
}

+ (VMUClassInfo)classInfoWithClassName:(id)a3 binaryPath:(id)a4 type:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)[objc_alloc((Class)a1) initWithClassName:v8 binaryPath:v9 type:v5];

  return (VMUClassInfo *)v10;
}

- (VMUClassInfo)initWithClassName:(id)a3 binaryPath:(id)a4 type:(unsigned int)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VMUClassInfo;
  id v10 = [(VMUClassInfo *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    remoteClassName = v10->_remoteClassName;
    v10->_remoteClassName = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    remoteBinaryPath = v10->_remoteBinaryPath;
    v10->_remoteBinaryPath = (NSString *)v13;

    v10->_unsigned int remotePointerSize = 8;
    v10->_defaultScanType = 1;
    v10->_remoteType = a5;
  }

  return v10;
}

- (VMUClassInfo)initWithClosureContext:(unint64_t)a3 typeInfo:(swift_typeinfo *)a4 infoMap:(id)a5 swiftFieldMetadataContext:(libSwiftRemoteMirrorWrapper *)a6
{
  id v24 = a5;
  v29.receiver = self;
  v29.super_class = (Class)VMUClassInfo;
  id v10 = [(VMUClassInfo *)&v29 init];
  uint64_t v11 = v10;
  if (v10)
  {
    remoteClassName = v10->_remoteClassName;
    v10->_remoteClassName = (NSString *)@"Closure context";

    v11->_unsigned int remotePointerSize = 8;
    *(void *)&v11->_defaultScanType = 0x4000000001;
    v11->_unsigned int instanceSize = a4->var1;
    if (debugSwiftSubfieldIsEnabled::dispatchToken != -1) {
      dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_29);
    }
    if (debugSwiftSubfieldIsEnabled::isEnabled) {
      _debugSwiftAsyncPrintf(0, "Getting fields for closure context at %p\n", (const void *)a3);
    }
    uint64_t v13 = objc_opt_new();
    if (a4->var4)
    {
      uint64_t v14 = 0;
      while (1)
      {
        long long v27 = 0u;
        long long v28 = 0u;
        vmu_swift_reflection_childOfInstance((uint64_t)a6->var0, a3, v14, (uint64_t)&v27);
        if (_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::dispatchToken != -1) {
          dispatch_once(&_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::dispatchToken, &__block_literal_global_462);
        }
        if (_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::isEnabled)
        {
          v26[0] = v27;
          v26[1] = v28;
          _debugSwiftSubfieldDumpSwiftChildInfo(1, "childOfInstance()", (uint64_t)v26, (uint64_t)a6->var0);
        }
        if (DWORD2(v27) < 2 * v11->_remotePointerSize) {
          break;
        }
        char v25 = 0;
        v15 = _createFieldInfoFromChild((uint64_t *)a6, (const char *)v27, DWORD2(v27), SHIDWORD(v27), v28, *((uint64_t *)&v28 + 1), v24, v11->_remoteClassName, &v25, 1);
        if (v15)
        {
          [v13 addObject:v15];
        }
        else if (v25)
        {
          goto LABEL_26;
        }

        uint64_t v14 = (v14 + 1);
        if (v14 >= a4->var4) {
          goto LABEL_27;
        }
      }
      if (debugSwiftSubfieldIsEnabled::dispatchToken != -1) {
        dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_29);
      }
      if (debugSwiftSubfieldIsEnabled::isEnabled)
      {
        objc_super v16 = " (VERY BAD)";
        if (!DWORD2(v27)) {
          objc_super v16 = "";
        }
        v17 = (const char *)v27;
        if (!(void)v27) {
          v17 = "?";
        }
        _debugSwiftAsyncPrintf(1, "nonsensically small offset for field \"%s\" of +%u%s; ignoring all fields in this closure context\n",
          v17,
          DWORD2(v27),
          v16);
      }
LABEL_26:
      [v13 removeAllObjects];
    }
LABEL_27:
    unsigned int v18 = [v13 count];
    v11->_ivarCount = v18;
    if (v18)
    {
      v11->_localIvarList = (id *)malloc_type_calloc(v18 + 1, 8uLL, 0x80040B8603338uLL);
      if (v11->_ivarCount)
      {
        unint64_t v19 = 0;
        do
        {
          uint64_t v20 = [v13 objectAtIndexedSubscript:v19];
          localIvarList = v11->_localIvarList;
          id v22 = localIvarList[v19];
          localIvarList[v19] = (id)v20;

          ++v19;
        }
        while (v19 < v11->_ivarCount);
      }
    }
    if (debugSwiftSubfieldIsEnabled::dispatchToken != -1) {
      dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_29);
    }
    if (debugSwiftSubfieldIsEnabled::isEnabled) {
      _debugSwiftAsyncPrintf(0, "\n");
    }
  }
  return v11;
}

- (id)initSwiftClassWithName:(id)a3 classInfoType:(unsigned int)a4 size:(unint64_t)a5
{
  unsigned int v5 = a5;
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VMUClassInfo;
  id v10 = [(VMUClassInfo *)&v15 init];
  uint64_t v11 = v10;
  if (v10)
  {
    p_remoteClassName = (void **)&v10->_remoteClassName;
    objc_storeStrong((id *)&v10->_remoteClassName, a3);
    if (!v9 && a4 == 64)
    {
      uint64_t v13 = *p_remoteClassName;
      *p_remoteClassName = @"malloc-block (possibly Swift)";
    }
    v11->_unsigned int remotePointerSize = 8;
    v11->_defaultScanType = 1;
    v11->_remoteType = a4;
    v11->_unsigned int instanceSize = v5;
  }

  return v11;
}

- (unsigned)_objcABIFromObjectIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    unsigned int v5 = [v3 objcABI];
  }
  else
  {
    if (-[VMUClassInfo _objcABIFromObjectIdentifier:]::onceToken != -1) {
      dispatch_once(&-[VMUClassInfo _objcABIFromObjectIdentifier:]::onceToken, &__block_literal_global_46);
    }
    unsigned int v5 = -[VMUClassInfo _objcABIFromObjectIdentifier:]::analysisProcessObjcABI;
  }

  return v5;
}

uint64_t __45__VMUClassInfo__objcABIFromObjectIdentifier___block_invoke()
{
  v0 = dlopen("/usr/lib/libobjc.A.dylib", 17);
  v1 = (int *)dlsym(v0, "objc_class_abi_version");
  if (v1) {
    -[VMUClassInfo _objcABIFromObjectIdentifier:]::analysisProcessObjcABI = *v1;
  }

  return dlclose(v0);
}

- (id)_initWithClass:(unint64_t)a3 type:(unsigned int)a4 realizedOnly:(BOOL)a5 infoMap:(id)a6 objectIdentifier:(id)a7 reader:(id)a8
{
  BOOL v103 = a5;
  uint64_t v13 = (VMUClassInfoMap *)a6;
  id v14 = a7;
  objc_super v15 = (char *)a8;
  v104.receiver = self;
  v104.super_class = (Class)VMUClassInfo;
  objc_super v16 = [(VMUClassInfo *)&v104 init];
  if (!v16) {
    goto LABEL_46;
  }
  if (!v14) {
    goto LABEL_44;
  }
  v17 = (libSwiftRemoteMirrorWrapper *)[v14 swiftMirror];
  int v18 = [v16 _objcABIFromObjectIdentifier:v14];
  v16[4] = 8;
  if (!a3) {
    goto LABEL_44;
  }
  unint64_t v19 = (unint64_t *)MEMORY[0x1E4F14B00];
  if (*MEMORY[0x1E4F14B00] >= a3 || !v15) {
    goto LABEL_44;
  }
  *((void *)v16 + 1) = a3;
  v16[10] = 1;
  v16[11] = a4;
  if (a4 == 4)
  {
    unint64_t v20 = (*((uint64_t (**)(char *, unint64_t, uint64_t))v15 + 2))(v15, a3, 96);
    unint64_t v21 = v20;
    if (*v19 >= v20)
    {
      uint64_t v102 = 0;
LABEL_18:
      v16[7] = 16;
      goto LABEL_87;
    }
    uint64_t v22 = *(void *)(v20 + 8);
    v23 = [v14 vmuTask];
    uint64_t v102 = v22;
    [v16 _setClassNameWithAddress:v22 targetTask:v23];

    if (*((void *)v16 + 7))
    {
      uint64_t v24 = [v14 figBaseObjectFinalizeAddress];
      if (v24)
      {
        char v25 = [v14 vmuTask];
        uint64_t v26 = -[VMUTask ptrauthStripFunctionPointer:]((uint64_t)v25, *(void *)(v21 + 32));

        if (v26 == v24) {
          *((unsigned char *)v16 + 147) = 1;
        }
      }
      goto LABEL_18;
    }
    goto LABEL_44;
  }
  int v27 = v18;
  if (a4 != 8 && a4 != 1)
  {
    uint64_t v102 = 0;
    goto LABEL_87;
  }
  long long v28 = [v14 vmuTask];
  int v29 = [v28 isExclaveCore];

  if (v29)
  {
    if (a4 == 8)
    {
      v16[8] = -2147483520;
      v16[11] = 8;
      v30 = vmu_swift_reflection_interop_lookupMetadata(*(void *)[v14 swiftMirror], (const void *)a3);
      vmu_swift_reflection_infoForMetadata(*(void *)[v14 swiftMirror], (uint64_t)v30, v31);
    }
    goto LABEL_44;
  }
  uint64_t v32 = (*((uint64_t (**)(char *, unint64_t, uint64_t))v15 + 2))(v15, a3, 40);
  if (!v32) {
    goto LABEL_44;
  }
  uint64_t v99 = v32;
  uint64_t v33 = *(void *)(v32 + 32);
  v34 = [v14 vmuTask];
  uint64_t v35 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v34, v33);

  if (v17) {
    uint64_t v36 = v17->var1 | 1;
  }
  else {
    uint64_t v36 = 1;
  }
  if ((v36 & v35) != 0) {
    v16[11] = 8;
  }
  v37 = [v14 vmuTask];
  uint64_t v38 = VMUGetClassDataROofClass(v37, v15, v27, a3);

  if (!v38) {
    goto LABEL_44;
  }
  uint64_t v39 = (*((uint64_t (**)(char *, uint64_t, uint64_t))v15 + 2))(v15, v38, 72);
  if (!v39) {
    goto LABEL_44;
  }
  uint64_t v40 = *(void *)(v39 + 24);
  uint64_t v41 = *(void *)(v39 + 48);
  v16[8] = *(_DWORD *)v39;
  v16[6] = *(_DWORD *)(v39 + 4);
  uint64_t v96 = v39;
  v16[7] = *(_DWORD *)(v39 + 8);
  uint64_t v102 = v40;
  if (v40)
  {
    v42 = [v14 vmuTask];
    [v16 _setClassNameWithAddress:v102 targetTask:v42];
  }
  if (v16[11] == 8)
  {
    uint64_t v43 = (*((uint64_t (**)(char *, unint64_t, uint64_t))v15 + 2))(v15, a3, 72);
    if (!v43)
    {
LABEL_44:

LABEL_45:
      objc_super v16 = 0;
      goto LABEL_46;
    }
    if (!*((void *)v16 + 7))
    {
      if (v17->var0)
      {
        v78 = vmu_swift_reflection_interop_lookupMetadata((uint64_t)v17->var0, (const void *)a3);
        if (v78)
        {
          uint64_t v80 = vmu_swift_reflection_interop_typeRefForMetadata((uint64_t)v17->var0, (uint64_t)v78, v77);
          if (v80)
          {
            uint64_t v101 = v41;
            v81 = vmu_swift_reflection_interop_copyDemangledNameForTypeRef((uint64_t)v17->var0, v80, v79);
            if (v81) {
              objc_storeStrong((id *)v16 + 7, v81);
            }

            uint64_t v41 = v101;
          }
        }
      }
    }
    *((unsigned char *)v16 + 146) = (*(unsigned char *)(v43 + 40) & 2) != 0;
  }
  if (!*((void *)v16 + 7))
  {
    v44 = NSString;
    id v45 = [v16 typeName];
    uint64_t v46 = [v44 stringWithFormat:@"<UNNAMED_%s_class_%#llx>", [v45 UTF8String], a3];
    v47 = (void *)*((void *)v16 + 7);
    *((void *)v16 + 7) = v46;
  }
  v16[5] = 0;
  if (v16[11] == 8)
  {
    if (v17 && v17->var0)
    {
      v48 = _swiftFieldsForClass(*((const void **)v16 + 1), *((NSString **)v16 + 7), v17, v13);
      unsigned int v49 = [v48 count];
      v16[5] = v49;
      if (v49)
      {
        *((void *)v16 + 6) = malloc_type_calloc(v49 + 1, 8uLL, 0x80040B8603338uLL);
        if (v16[5])
        {
          unint64_t v50 = 0;
          do
          {
            uint64_t v51 = [v48 objectAtIndexedSubscript:v50];
            uint64_t v52 = *((void *)v16 + 6);
            v53 = *(void **)(v52 + 8 * v50);
            *(void *)(v52 + 8 * v50) = v51;

            ++v50;
          }
          while (v50 < v16[5]);
        }
      }
    }
    else if ((-[VMUClassInfo _initWithClass:type:realizedOnly:infoMap:objectIdentifier:reader:]::swiftMirrorMissing & 1) == 0)
    {
      v55 = [v14 scanner];

      if (v55)
      {
        NSLog(&cfstr_SwiftReflectio_30.isa);
        NSLog(&cfstr_WeakReferences.isa);
        -[VMUClassInfo _initWithClass:type:realizedOnly:infoMap:objectIdentifier:reader:]::swiftMirrorMissing = 1;
      }
    }
  }
  v56 = [v14 vmuTask];
  if (!v41 || v16[5]) {
    goto LABEL_82;
  }
  v100 = (uint64_t (**)(char *, const char *, uint64_t))(v15 + 16);
  v57 = (int *)(*((uint64_t (**)(char *, uint64_t, uint64_t))v15 + 2))(v15, v41, 48);
  if (!v57)
  {

    goto LABEL_45;
  }
  unsigned int v58 = v57[1];
  v16[5] = v58;
  int v92 = *v57;
  v95 = v56;
  *((void *)v16 + 6) = malloc_type_calloc(v58 + 1, 8uLL, 0x80040B8603338uLL);
  if (!v16[5])
  {
    unsigned int v94 = 0;
    goto LABEL_81;
  }
  unsigned int v59 = 0;
  uint64_t v98 = 0;
  unsigned int v94 = 0;
  uint64_t v93 = v41 + 8;
  while (1)
  {
    unsigned int v97 = v59;
    uint64_t v60 = v93 + v59;
    v61 = v15;
    id v62 = v95;
    uint64_t v63 = (*((uint64_t (**)(char *, uint64_t, uint64_t))v15 + 2))(v61, v60, 40);
    if (!v63) {
      break;
    }
    v64 = v62;
    v65 = [v62 memoryCache];
    v66 = (const char *)[v65 peekStringAtAddress:*(void *)(v63 + 8)];

    v67 = (int *)(*v100)(v61, *(const char **)v63, 4);
    if (v67) {
      int v68 = *v67;
    }
    else {
      int v68 = 0;
    }
    v69 = *(const char **)(v63 + 16);
    if (v69) {
      v69 = (const char *)(*v100)(v61, v69, 1);
    }
    LocalIvar = (unsigned int *)_createLocalIvar(v66, v69, v68, *(_DWORD *)(v63 + 28), 0);

    if (!LocalIvar) {
      goto LABEL_80;
    }
    uint64_t v71 = LocalIvar[7];
    if (v71 || v16[11] != 8)
    {
      Name = ivar_getName((Ivar)LocalIvar);
      if (!*(void *)LocalIvar || (ptrdiff_t Offset = ivar_getOffset((Ivar)LocalIvar), !Offset))
      {
        if (!Name || strcmp(Name, "isa")) {
          goto LABEL_70;
        }
        ptrdiff_t Offset = 0;
      }
      v74 = -[VMUFieldInfo initWithObjcIvar:size:offset:ivarName:isARC:is64Bit:]([VMUMutableFieldInfo alloc], "initWithObjcIvar:size:offset:ivarName:isARC:is64Bit:", LocalIvar, v71, Offset, Name, [v16 isARR], 1);
      uint64_t v75 = *((void *)v16 + 6);
      v76 = *(void **)(v75 + 8 * v94);
      *(void *)(v75 + 8 * v94) = v74;

      ++v94;
    }
LABEL_70:
    _destroyLocalIvar((objc_ivar *)LocalIvar);
    unsigned int v59 = v97 + v92;
    if (++v98 >= (unint64_t)v16[5]) {
      goto LABEL_81;
    }
  }

LABEL_80:
  v82 = [v16 className];
  NSLog(&cfstr_MissingIvarAtI.isa, v98, v82);

LABEL_81:
  v16[5] = v94;
  v56 = v95;
  *((void *)v16 + 17) = copy_remote_layout_at(*(void *)(v96 + 16), v15);
  *((void *)v16 + 16) = copy_remote_layout_at(*(void *)(v96 + 56), v15);
  [v16 _parseIvarsAndLayouts];
LABEL_82:
  if (([v16 isRootClass] & 1) == 0)
  {
    uint64_t v83 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v56, *(void *)(v99 + 8));
    if (v83)
    {
      uint64_t v84 = [(VMUClassInfoMap *)v13 classInfoForAddress:v83];
      v85 = (void *)*((void *)v16 + 10);
      *((void *)v16 + 10) = v84;

      if (!*((void *)v16 + 10))
      {
        uint64_t v86 = [objc_alloc((Class)objc_opt_class()) _initWithClass:v83 type:1 realizedOnly:v103 infoMap:v13 objectIdentifier:v14 reader:v15];
        v87 = (void *)*((void *)v16 + 10);
        *((void *)v16 + 10) = v86;
      }
    }
  }

LABEL_87:
  unsigned int v88 = v16[6];
  unsigned int v89 = [*((id *)v16 + 10) instanceSize];
  if (v88 <= v89) {
    unsigned int v90 = v89;
  }
  else {
    unsigned int v90 = v88;
  }
  unsigned int v91 = v16[7];
  if (v91 <= v90) {
    unsigned int v91 = v90;
  }
  v16[6] = v90;
  v16[7] = v91;
  [v16 _determineBinaryPathUsingObjectIdentifier:v14 remoteClassNameLoc:v102];
  [(VMUClassInfoMap *)v13 addClassInfo:v16 forAddress:a3];
LABEL_46:

  return v16;
}

- (void)_determineBinaryPathUsingObjectIdentifier:(id)a3 remoteClassNameLoc:(unint64_t)a4
{
  id v6 = a3;
  [v6 symbolicator];
  if ((CSIsNull() & 1) == 0)
  {
    uint64_t v24 = 0;
    char v25 = &v24;
    uint64_t v26 = 0x3032000000;
    int v27 = __Block_byref_object_copy__6;
    long long v28 = __Block_byref_object_dispose__6;
    id v29 = 0;
    if ([(VMUClassInfo *)self infoType] == 8)
    {
      unsigned int v7 = [(VMUClassInfo *)self className];
      uint64_t v8 = [v7 rangeOfString:@"."];

      if (v8)
      {
        if (v8 != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v9 = [(VMUClassInfo *)self className];
          id v10 = [v9 substringToIndex:v8];

          uint64_t v11 = [v6 moduleNameToBinaryPathDict];
          uint64_t v12 = [v11 objectForKeyedSubscript:v10];
          uint64_t v13 = (void *)v25[5];
          v25[5] = v12;

          id v14 = (void *)v25[5];
          if (!v14)
          {
            id v15 = v10;
            [v15 UTF8String];
            CSSymbolicatorForeachSymbolOwnerWithNameAtTime();
            uint64_t v16 = v25[5];
            if (!v16)
            {
              v25[5] = (uint64_t)&stru_1EFE27F38;

              uint64_t v16 = v25[5];
            }
            v17 = [v6 moduleNameToBinaryPathDict];
            [v17 setObject:v16 forKeyedSubscript:v15];

            id v14 = (void *)v25[5];
          }
          if ([v14 length])
          {
            [(VMUClassInfo *)self _setBinaryPath:v25[5] sanitize:1];
LABEL_26:

            goto LABEL_27;
          }
        }
      }
    }
    CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
    if (CSIsNull())
    {
      if ([(NSString *)self->_remoteClassName isEqualToString:@"CGSEventAppendix"])
      {
        CSSymbolicatorGetSymbolOwnerWithNameAtTime();
      }
      else if (a4)
      {
        CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
      }
    }
    if ((CSIsNull() & 1) != 0
      || ([NSString stringWithUTF8String:CSSymbolOwnerGetPath()],
          uint64_t v18 = objc_claimAutoreleasedReturnValue(),
          unint64_t v19 = (void *)v25[5],
          v25[5] = v18,
          v19,
          ![(id)v25[5] length]))
    {
      unint64_t v20 = self->_superclassLayout;
      if (v20)
      {
        id v10 = v20;
        while (1)
        {
          unint64_t v21 = [v10 binaryPath];

          if (v21) {
            break;
          }
          uint64_t v22 = [v10 superclassInfo];

          id v10 = (void *)v22;
          if (!v22) {
            goto LABEL_27;
          }
        }
        v23 = [v10 binaryPath];
        [(VMUClassInfo *)self _setBinaryPath:v23 sanitize:0];

        goto LABEL_26;
      }
    }
    else
    {
      [(VMUClassInfo *)self _setBinaryPath:v25[5] sanitize:1];
    }
LABEL_27:
    _Block_object_dispose(&v24, 8);
  }
}

void __77__VMUClassInfo__determineBinaryPathUsingObjectIdentifier_remoteClassNameLoc___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSString stringWithUTF8String:CSSymbolOwnerGetPath()];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (VMUClassInfo)initWithClass:(unint64_t)a3 type:(unsigned int)a4 infoMap:(id)a5 objectIdentifier:(id)a6 reader:(id)a7
{
  return (VMUClassInfo *)[(VMUClassInfo *)self _initWithClass:a3 type:*(void *)&a4 realizedOnly:0 infoMap:a5 objectIdentifier:a6 reader:a7];
}

- (VMUClassInfo)initWithRealizedClass:(unint64_t)a3 type:(unsigned int)a4 infoMap:(id)a5 objectIdentifier:(id)a6 reader:(id)a7
{
  return (VMUClassInfo *)[(VMUClassInfo *)self _initWithClass:a3 type:*(void *)&a4 realizedOnly:1 infoMap:a5 objectIdentifier:a6 reader:a7];
}

- (void)_freeLocalIvarList
{
  if (self->_ivarCount)
  {
    unint64_t v3 = 0;
    do
    {
      localIvarList = self->_localIvarList;
      id v5 = localIvarList[v3];
      localIvarList[v3] = 0;

      ++v3;
    }
    while (v3 < self->_ivarCount);
  }
  id v6 = self->_localIvarList;
  if (v6)
  {
    free(v6);
    self->_localIvarList = 0;
  }
}

- (void)dealloc
{
  weakLayout = (char *)self->_weakLayout;
  if (weakLayout)
  {
    free(weakLayout);
    self->_weakLayout = 0;
  }
  strongLayout = (char *)self->_strongLayout;
  if (strongLayout)
  {
    free(strongLayout);
    self->_strongLayout = 0;
  }
  [(VMUClassInfo *)self _freeLocalIvarList];
  v5.receiver = self;
  v5.super_class = (Class)VMUClassInfo;
  [(VMUClassInfo *)&v5 dealloc];
}

- (id)mutableCopy
{
  return [(VMUClassInfo *)self _copyWithInstanceSize:self->_instanceSize superclassOffset:self->_superclassOffset asVariant:0 mutable:1];
}

- (void)_identifyObjCClassStructureBlocksForIsa:(unint64_t)a3 isMetaclass:(BOOL)a4 withScanner:(id)a5 addressIdentifierBlock:(id)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  uint64_t v11 = (void (**)(id, unint64_t, BOOL, BOOL))a6;
  if (a3)
  {
    unsigned int remoteType = self->_remoteType;
    if (remoteType == 8 || remoteType == 1)
    {
      id v14 = [v10 objectIdentifier];
      id v15 = [v14 memoryReader];
      int v55 = [v14 objcABI];
      uint64_t v16 = (void *)v15[2](v15, a3, 40);
      v17 = v16;
      if (!v16)
      {
LABEL_36:

        goto LABEL_37;
      }
      v53 = v14;
      v54 = v15;
      if (!v7) {
        -[VMUClassInfo _identifyObjCClassStructureBlocksForIsa:isMetaclass:withScanner:addressIdentifierBlock:](self, "_identifyObjCClassStructureBlocksForIsa:isMetaclass:withScanner:addressIdentifierBlock:", [v14 translateIsaPointer:*v16], 1, v10, v11);
      }
      uint64_t v18 = v17[4];
      unint64_t v19 = [v14 vmuTask];
      uint64_t v20 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v19, v18);

      uint64_t v21 = [v14 swiftMirror];
      if (v21) {
        uint64_t v22 = *(void *)(v21 + 8) | 1;
      }
      else {
        uint64_t v22 = 1;
      }
      v11[2](v11, a3, (v22 & v20) != 0, v7);
      uint64_t v23 = v20 & 0x7FFFFFFFFFF8;
      v11[2](v11, v23, 2, v7);
      [v10 setClassStructureFieldScanValueAtSourceAddress:a3 + 32 toCorrectedAddress:v23];
      uint64_t v24 = v17[2] & 0xFFFFFFFFFFFFLL;
      v11[2](v11, v24, 4, v7);
      [v10 setClassStructureFieldScanValueAtSourceAddress:a3 + 16 toCorrectedAddress:v24];
      char v25 = [v14 vmuTask];
      unint64_t v26 = VMUGetClassDataExtOfClass(v25, v54, v55, a3);

      v11[2](v11, v26, 3, v7);
      int v27 = [v14 vmuTask];
      uint64_t v28 = VMUGetClassDataROofClass(v27, v54, v55, a3);

      id v29 = [v10 vmuTask];
      v30 = v29;
      if (v28 && [v29 addressIsInSharedCache:v28] == NO) {
        v11[2](v11, v28, 5, v7);
      }
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __103__VMUClassInfo__identifyObjCClassStructureBlocksForIsa_isMetaclass_withScanner_addressIdentifierBlock___block_invoke;
      v56[3] = &unk_1E5D23FF8;
      id v52 = v30;
      id v57 = v52;
      v61 = v11;
      BOOL v63 = v7;
      id v31 = v54;
      id v62 = v31;
      unsigned int v58 = self;
      id v32 = v14;
      id v59 = v32;
      id v33 = v10;
      id v60 = v33;
      v34 = (void (**)(void, void, void, void))MEMORY[0x1AD0DA230](v56);
      id v35 = [v32 vmuTask];
      id v36 = v31;
      v37 = (VMUTaskMemoryScanner *)v33;
      if (v55)
      {
        uint64_t v38 = _classDataExtV1ofClass(v35, v36, a3);
        if (v38) {
          unint64_t v39 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v35, *(void *)(v38 + 8));
        }
        else {
          unint64_t v39 = 0;
        }
        unint64_t v41 = maskPointerToMethodList(a3 + 8, v39, v37);
      }
      else
      {
        uint64_t v40 = _classDataRWV0ofClass(v35, v36, a3);
        if (v40) {
          unint64_t v41 = *(void *)(v40 + 16);
        }
        else {
          unint64_t v41 = 0;
        }
      }

      v34[2](v34, v41, 6, 7);
      id v42 = [v32 vmuTask];
      id v43 = v36;
      if (v55)
      {
        uint64_t v44 = _classDataExtV1ofClass(v42, v43, a3);
        if (v44)
        {
          uint64_t v45 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v42, *(void *)(v44 + 16));
          goto LABEL_29;
        }
      }
      else
      {
        uint64_t v46 = _classDataRWV0ofClass(v42, v43, a3);
        if (v46)
        {
          uint64_t v45 = *(void *)(v46 + 24);
          goto LABEL_29;
        }
      }
      uint64_t v45 = 0;
LABEL_29:

      v34[2](v34, v45, 8, 9);
      id v47 = [v32 vmuTask];
      id v48 = v43;
      if (v55)
      {
        id v14 = v53;
        id v15 = (uint64_t (**)(void, void, void))v54;
        uint64_t v49 = _classDataExtV1ofClass(v47, v48, a3);
        if (v49)
        {
          uint64_t v50 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v47, *(void *)(v49 + 24));
LABEL_35:

          v34[2](v34, v50, 10, 11);
          goto LABEL_36;
        }
      }
      else
      {
        id v15 = (uint64_t (**)(void, void, void))v54;
        uint64_t v51 = _classDataRWV0ofClass(v47, v48, a3);
        id v14 = v53;
        if (v51)
        {
          uint64_t v50 = *(void *)(v51 + 32);
          goto LABEL_35;
        }
      }
      uint64_t v50 = 0;
      goto LABEL_35;
    }
  }
LABEL_37:
}

uint64_t __103__VMUClassInfo__identifyObjCClassStructureBlocksForIsa_isMetaclass_withScanner_addressIdentifierBlock___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    result = [*(id *)(result + 32) addressIsInSharedCache:a2];
    if ((result & 1) == 0)
    {
      if (a2)
      {
        unint64_t v5 = a2 & 0xFFFFFFFFFFFFFFFELL;
        result = (*(uint64_t (**)(void))(*(void *)(v3 + 64) + 16))();
        if (result != -1)
        {
          result = (*(uint64_t (**)(void))(*(void *)(v3 + 72) + 16))();
          if (result)
          {
            int v6 = *(_DWORD *)result;
            if (*(_DWORD *)result)
            {
              unint64_t v7 = v5 + *(unsigned int *)(*(void *)(v3 + 40) + 16);
              result = (*(uint64_t (**)(void))(*(void *)(v3 + 72) + 16))();
              if (result)
              {
                uint64_t v8 = result;
                uint64_t v9 = 0;
                do
                {
                  if (*(void *)(v8 + 8 * v9))
                  {
                    result = [*(id *)(v3 + 32) addressIsInSharedCache];
                    if ((result & 1) == 0)
                    {
                      id v10 = [*(id *)(v3 + 48) vmuTask];
                      unint64_t v11 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v10, *(void *)(v8 + 8 * v9));

                      maskPointerToMethodList(v7 + (*(_DWORD *)(*(void *)(v3 + 40) + 16) * v9), v11, *(VMUTaskMemoryScanner **)(v3 + 56));
                      result = (*(uint64_t (**)(void))(*(void *)(v3 + 64) + 16))();
                    }
                  }
                  ++v9;
                }
                while (v6 != v9);
              }
            }
          }
        }
      }
      else
      {
        BOOL v4 = *(uint64_t (**)(void))(*(void *)(v3 + 64) + 16);
        return v4();
      }
    }
  }
  return result;
}

- (void)identifyObjCClassStructureBlocksWithScanner:(id)a3 addressIdentifierBlock:(id)a4
{
}

- (void)serializeWithClassMap:(id)a3 simpleSerializer:(id)a4 version:(unsigned int)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [v8 serialize64:self->_remoteIsa];
  long long v10 = *(_OWORD *)&self->_remotePointerSize;
  uint64_t v11 = *(void *)&self->_ro_flags;
  unsigned int remoteType = self->_remoteType;
  [v8 _serializeValues:&v10 count:7];
  if (self->_ivarCount)
  {
    unint64_t v9 = 0;
    do
      [v8 serialize32:[v7 indexForFieldInfo:self->_localIvarList[v9++]]];
    while (v9 < self->_ivarCount);
  }
  [v8 serializeString:self->_remoteClassName];
  [v8 serializeString:self->_displayName];
  [v8 serializeString:self->_remoteBinaryPath];
  [v8 serialize32:[v7 indexForClassInfo:self->_superclassLayout]];
}

- (VMUClassInfo)initWithSerializer:(id)a3 classMap:(id)a4 version:(unsigned int)a5 error:(id *)a6
{
  v55[7] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v54.receiver = self;
  v54.super_class = (Class)VMUClassInfo;
  uint64_t v12 = [(VMUClassInfo *)&v54 init];
  if (!v12) {
    goto LABEL_29;
  }
  uint64_t v53 = 0;
  if (!a6) {
    a6 = (id *)&v53;
  }
  v12->_remoteIsa = [v10 deserialize64WithError:a6];
  if (*a6) {
    goto LABEL_8;
  }
  p_ivarCount = &v12->_ivarCount;
  v55[0] = &v12->_remotePointerSize;
  v55[1] = &v12->_ivarCount;
  p_unsigned int instanceSize = &v12->_instanceSize;
  v55[2] = &v12->_superclassOffset;
  v55[3] = &v12->_instanceSize;
  v55[4] = &v12->_ro_flags;
  v55[5] = &v12->_rw_flags;
  v55[6] = &v12->_remoteType;
  uint64_t v15 = [v10 _deserializeValues:7 error:a6];
  id v16 = *a6;
  if (*a6) {
    goto LABEL_8;
  }
  do
  {
    *(_DWORD *)v55[(void)v16] = *(_DWORD *)(v15 + 4 * (void)v16);
    id v16 = (char *)v16 + 1;
  }
  while (v16 != (id)7);
  if (*a6) {
    goto LABEL_8;
  }
  v12->_localIvarList = (id *)malloc_type_calloc(*p_ivarCount + 1, 8uLL, 0x80040B8603338uLL);
  if (a5 < 4)
  {
    if (a5 == 3)
    {
      if (*p_ivarCount)
      {
        uint64_t v24 = 0;
        do
        {
          char v25 = [[VMUFieldInfo alloc] initWithSerializer:v10 classMap:v11 version:3 error:a6];
          localIvarList = v12->_localIvarList;
          id v27 = localIvarList[v24];
          localIvarList[v24] = v25;

          if (*a6) {
            goto LABEL_8;
          }
        }
        while (++v24 < (unint64_t)*p_ivarCount);
      }
    }
    else
    {
      unsigned int superclassOffset = *p_instanceSize;
      if (*p_instanceSize <= v12->_superclassOffset) {
        unsigned int superclassOffset = v12->_superclassOffset;
      }
      *p_unsigned int instanceSize = superclassOffset;
      v12->_weakLayout = (const char *)[v10 copyDeserializedNullTerminatedBytesWithError:a6];
      if (*a6) {
        goto LABEL_8;
      }
      v12->_strongLayout = (const char *)[v10 copyDeserializedNullTerminatedBytesWithError:a6];
      if (*a6) {
        goto LABEL_8;
      }
      if (*p_ivarCount)
      {
        uint64_t v52 = 0;
        do
        {
          unint64_t v39 = (int *)[v10 _deserializeValues:2 error:a6];
          if (*a6) {
            goto LABEL_8;
          }
          int v40 = *v39;
          int v41 = v39[1];
          uint64_t v42 = [v10 copyDeserializedNullTerminatedBytesWithError:a6];
          if (*a6) {
            goto LABEL_8;
          }
          id v43 = (const char *)v42;
          uint64_t v44 = (const char *)[v10 copyDeserializedNullTerminatedBytesWithError:a6];
          if (*a6) {
            goto LABEL_8;
          }
          LocalIvar = (unsigned int *)_createLocalIvar(v43, v44, v40, v41, 1);
          uint64_t v51 = [VMUMutableFieldInfo alloc];
          uint64_t v46 = LocalIvar[7];
          ptrdiff_t Offset = ivar_getOffset((Ivar)LocalIvar);
          uint64_t v48 = [(VMUFieldInfo *)v51 initWithObjcIvar:LocalIvar size:v46 offset:Offset ivarName:ivar_getName((Ivar)LocalIvar) isARC:[(VMUClassInfo *)v12 isARR] is64Bit:v12->_remotePointerSize == 8];
          uint64_t v49 = v12->_localIvarList;
          id v50 = v49[v52];
          v49[v52] = (id)v48;

          _destroyLocalIvar((objc_ivar *)LocalIvar);
        }
        while (++v52 < (unint64_t)v12->_ivarCount);
      }
      [(VMUClassInfo *)v12 _parseIvarsAndLayouts];
    }
  }
  else if (*p_ivarCount)
  {
    int v18 = 0;
    int v19 = 0;
    do
    {
      uint64_t v20 = [v10 deserialize32WithError:a6];
      if (*a6) {
        goto LABEL_8;
      }
      uint64_t v21 = v20;
      uint64_t v22 = (void *)MEMORY[0x1AD0D9F90]();
      uint64_t v23 = [v11 fieldInfoForIndex:v21];
      if (v23) {
        objc_storeStrong(&v12->_localIvarList[v19++], v23);
      }
      else {
        NSLog(&cfstr_BadFieldIndexI.isa);
      }
    }
    while (++v18 < *p_ivarCount);
  }
  uint64_t v28 = [v10 copyDeserializedStringWithError:a6];
  remoteClassName = v12->_remoteClassName;
  v12->_remoteClassName = (NSString *)v28;

  if (!*a6)
  {
    if (a5 < 3
      || (uint64_t v30 = [v10 copyDeserializedStringWithError:a6],
          displayName = v12->_displayName,
          v12->_displayName = (NSString *)v30,
          displayName,
          !*a6))
    {
      uint64_t v32 = [v10 copyDeserializedStringWithError:a6];
      remoteBinaryPath = v12->_remoteBinaryPath;
      v12->_remoteBinaryPath = (NSString *)v32;

      if (!*a6)
      {
        uint64_t v34 = [v10 deserialize32WithError:a6];
        if (!*a6)
        {
          uint64_t v35 = [v11 classInfoForIndex:v34];
          superclassLayout = v12->_superclassLayout;
          v12->_superclassLayout = (VMUClassInfo *)v35;

          v12->_defaultScanType = 1;
          [(VMUClassInfo *)v12 _demangleClassName];
LABEL_29:
          v17 = v12;
          goto LABEL_30;
        }
      }
    }
  }
LABEL_8:
  v17 = 0;
LABEL_30:

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[VMUClassInfo encodeWithCoder:]", "VMUClassInfo.mm", 2014, "0");
}

- (VMUClassInfo)initWithCoder:(id)a3
{
  BOOL v4 = (NSCoder *)a3;
  v30.receiver = self;
  v30.super_class = (Class)VMUClassInfo;
  unint64_t v5 = [(VMUClassInfo *)&v30 init];
  int v6 = v5;
  id v7 = v5;
  if (v5)
  {
    [(NSCoder *)v4 decodeValueOfObjCType:"Q" at:&v5->_remoteIsa size:8];
    -[NSCoder decodeValueOfObjCType:at:size:](v4, "decodeValueOfObjCType:at:size:", "I");
    [(NSCoder *)v4 decodeValueOfObjCType:"I" at:&v6->_ivarCount size:4];
    [(NSCoder *)v4 decodeValueOfObjCType:"I" at:&v6->_superclassOffset size:4];
    [(NSCoder *)v4 decodeValueOfObjCType:"I" at:&v6->_instanceSize size:4];
    [(NSCoder *)v4 decodeValueOfObjCType:"I" at:&v6->_ro_flags size:4];
    [(NSCoder *)v4 decodeValueOfObjCType:"I" at:&v6->_rw_flags size:4];
    [(NSCoder *)v4 decodeValueOfObjCType:"i" at:&v6->_remoteType size:4];
    unsigned int instanceSize = v6->_instanceSize;
    if (instanceSize <= v6->_superclassOffset) {
      unsigned int instanceSize = v6->_superclassOffset;
    }
    v6->_unsigned int instanceSize = instanceSize;
    v7->_weakLayout = (const char *)_decodeNullTerminatedBytes(v4);
    v7->_strongLayout = (const char *)_decodeNullTerminatedBytes(v4);
    v7->_localIvarList = (id *)malloc_type_calloc(v7->_ivarCount + 1, 8uLL, 0x80040B8603338uLL);
    if (v7->_ivarCount)
    {
      unint64_t v9 = 0;
      do
      {
        id v10 = v4;
        int v32 = 0;
        [(NSCoder *)v10 decodeValueOfObjCType:"I" at:&v32 size:4];
        id v11 = _decodeNullTerminatedBytes(v10);
        uint64_t v12 = _decodeNullTerminatedBytes(v10);
        int v31 = 0;
        [(NSCoder *)v10 decodeValueOfObjCType:"I" at:&v31 size:4];
        int v13 = v31;
        int v14 = v32;
        uint64_t v15 = malloc_type_malloc(0x28uLL, 0x1050040749D65F6uLL);
        v15[1] = v11;
        v15[2] = v12;
        id v16 = malloc_type_malloc(4uLL, 0x100004052888210uLL);
        void *v15 = v16;
        *id v16 = v14;
        *((_DWORD *)v15 + 7) = v13;
        *((unsigned char *)v15 + 32) = 1;

        v17 = [VMUMutableFieldInfo alloc];
        uint64_t v18 = *((unsigned int *)v15 + 7);
        ptrdiff_t Offset = ivar_getOffset((Ivar)v15);
        uint64_t v20 = [(VMUFieldInfo *)v17 initWithObjcIvar:v15 size:v18 offset:Offset ivarName:ivar_getName((Ivar)v15) isARC:[(VMUClassInfo *)v7 isARR] is64Bit:v6->_remotePointerSize == 8];
        localIvarList = v7->_localIvarList;
        id v22 = localIvarList[v9];
        localIvarList[v9] = (id)v20;

        _destroyLocalIvar((objc_ivar *)v15);
        ++v9;
      }
      while (v9 < v7->_ivarCount);
    }
    [(VMUClassInfo *)v7 _parseIvarsAndLayouts];
    uint64_t v23 = [(NSCoder *)v4 decodeObject];
    remoteClassName = v7->_remoteClassName;
    v7->_remoteClassName = (NSString *)v23;

    uint64_t v25 = [(NSCoder *)v4 decodeObject];
    remoteBinaryPath = v7->_remoteBinaryPath;
    v7->_remoteBinaryPath = (NSString *)v25;

    uint64_t v27 = [(NSCoder *)v4 decodeObject];
    superclassLayout = v7->_superclassLayout;
    v7->_superclassLayout = (VMUClassInfo *)v27;

    v7->_defaultScanType = 1;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSString *)self->_remoteClassName hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v5 = (VMUClassInfo *)a3;
  int v6 = v5;
  if (v5 == self)
  {
    char v10 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = v6;
        uint64_t v8 = [(VMUClassInfo *)v7 remoteIsa];
        unint64_t remoteIsa = self->_remoteIsa;
        if (remoteIsa | v8)
        {
          char v10 = remoteIsa == v8;
LABEL_19:

          goto LABEL_20;
        }
        unsigned int remoteType = self->_remoteType;
        if (remoteType != [(VMUClassInfo *)v7 infoType])
        {
          char v10 = 0;
          goto LABEL_19;
        }
        remoteClassName = self->_remoteClassName;
        int v13 = [(VMUClassInfo *)v7 className];
        if (remoteClassName == v13
          || (int v14 = self->_remoteClassName,
              [(VMUClassInfo *)v7 className],
              id v3 = objc_claimAutoreleasedReturnValue(),
              [(NSString *)v14 isEqualToString:v3]))
        {
          uint64_t v15 = [(VMUClassInfo *)self binaryPath];
          id v16 = [(VMUClassInfo *)v7 binaryPath];
          if (v15 == v16)
          {

            char v10 = 1;
          }
          else
          {
            v17 = [(VMUClassInfo *)self binaryPath];
            uint64_t v18 = [(VMUClassInfo *)v7 binaryPath];
            char v10 = [v17 isEqualToString:v18];
          }
          if (remoteClassName == v13) {
            goto LABEL_18;
          }
        }
        else
        {
          char v10 = 0;
        }

LABEL_18:
        goto LABEL_19;
      }
    }
    char v10 = 0;
  }
LABEL_20:

  return v10;
}

- (void)_logDescriptionWithSuperclasses:(BOOL)a3 indentation:(int)a4 toLogger:(id)a5
{
  BOOL v6 = a3;
  int v40 = (void (**)(id, void *))a5;
  int v37 = a4;
  if (a4)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%d", -[VMUClassInfo instanceSize](self, "instanceSize")];
    unint64_t v9 = "";
  }
  else
  {
    uint64_t v8 = [NSString stringWithFormat:@"instance size %d, allocation size %d", -[VMUClassInfo instanceSize](self, "instanceSize"), malloc_good_size(-[VMUClassInfo instanceSize](self, "instanceSize"))];
    unint64_t v9 = "Class: ";
  }
  unint64_t v39 = (void *)v8;
  char v10 = NSString;
  uint64_t v38 = [(VMUClassInfo *)self className];
  BOOL v36 = v6;
  displayName = self->_displayName;
  if (displayName) {
    uint64_t v12 = " as '";
  }
  else {
    uint64_t v12 = "";
  }
  uint64_t v13 = [(NSString *)displayName UTF8String];
  if (v13) {
    int v14 = (const char *)v13;
  }
  else {
    int v14 = "";
  }
  if (self->_displayName) {
    uint64_t v15 = "'";
  }
  else {
    uint64_t v15 = "";
  }
  id v16 = [(VMUClassInfo *)self typeName];
  uint64_t v17 = [v16 UTF8String];
  BOOL v18 = [(VMUClassInfo *)self isARR];
  BOOL v19 = [(VMUClassInfo *)self hasSpecificLayout];
  uint64_t v20 = "MRC";
  if (v18) {
    uint64_t v20 = "ARC";
  }
  uint64_t v21 = ", Specific";
  if (!v19) {
    uint64_t v21 = "";
  }
  uint64_t v35 = v9;
  uint64_t v22 = (2 * v37);
  uint64_t v23 = [v10 stringWithFormat:@"%*s'%@'%s%s%s [%@] - %s, %s%s {", v22, v35, v38, v12, v14, v15, v39, v17, v20, v21];
  v40[2](v40, v23);

  if (v36)
  {
    superclassLayout = self->_superclassLayout;
    if (superclassLayout) {
      [(VMUClassInfo *)superclassLayout _logDescriptionWithSuperclasses:1 indentation:(v37 + 1) toLogger:v40];
    }
  }
  unsigned int v25 = [(VMUClassInfo *)self->_superclassLayout instanceSize];
  if (self->_ivarCount)
  {
    unsigned int v26 = v25;
    unint64_t v27 = 0;
    do
    {
      int v28 = [self->_localIvarList[v27] offset];
      unsigned int v29 = [self->_localIvarList[v27] offset];
      if (v29 >= v26) {
        unsigned int v30 = v26;
      }
      else {
        unsigned int v30 = v29;
      }
      uint64_t v31 = v28 - v30;
      if (v31)
      {
        int v32 = [NSString stringWithFormat:@"%*s<< %u alignment bytes >>", (v22 + 3), "", v31];
        v40[2](v40, v32);
      }
      id v33 = _formatIvar((VMUFieldInfo *)self->_localIvarList[v27], (v22 + 5));
      v40[2](v40, v33);

      LODWORD(v33) = [self->_localIvarList[v27] offset];
      unsigned int v26 = [self->_localIvarList[v27++] size] + v33;
    }
    while (v27 < self->_ivarCount);
  }
  uint64_t v34 = [NSString stringWithFormat:@"%*s}", v22, ""];
  v40[2](v40, v34);
}

- (void)enumerateSublayoutsForSize:(unsigned int)a3 withBlock:(id)a4
{
  -[VMUClassInfo enumerateSublayoutsForSize:withBlock:](self->_superclassLayout, "enumerateSublayoutsForSize:withBlock:");
  if (self->_ivarCount)
  {
    unint64_t v7 = 0;
    do
      -[VMUFieldInfo enumerateSublayoutsForSize:parentOffset:remotePointerSize:withBlock:]((uint64_t)self->_localIvarList[v7++], a3, 0, self->_remotePointerSize, (uint64_t)a4);
    while (v7 < self->_ivarCount);
  }
}

- (id)_copyWithInstanceSize:(unsigned int)a3 superclassOffset:(unsigned int)a4 asVariant:(BOOL)a5 mutable:(BOOL)a6
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  uint64_t v12 = (char *)objc_alloc_init((Class)objc_opt_class());
  uint64_t v13 = v12;
  if (v8) {
    unint64_t remoteIsa = 0;
  }
  else {
    unint64_t remoteIsa = self->_remoteIsa;
  }
  *((void *)v12 + 1) = remoteIsa;
  *((_DWORD *)v12 + 4) = self->_remotePointerSize;
  *((_DWORD *)v12 + 5) = self->_ivarCount;
  if (self->_ivarCount)
  {
    uint64_t v15 = (void *)MEMORY[0x1AD0D9F90]();
    *((void *)v13 + 6) = malloc_type_calloc(self->_ivarCount + 1, 8uLL, 0x80040B8603338uLL);
    if (self->_ivarCount)
    {
      uint64_t v16 = 0;
      unint64_t v17 = 0;
      do
      {
        localIvarList = self->_localIvarList;
        id v19 = localIvarList[v16];
        if (v7)
        {
          BOOL v6 = (void *)[localIvarList[v16] mutableCopy];
          id v19 = v6;
        }
        objc_storeStrong((id *)(*((void *)v13 + 6) + v16 * 8), v19);
        if (v7) {

        }
        ++v17;
        ++v16;
      }
      while (v17 < self->_ivarCount);
    }
  }
  *((_DWORD *)v13 + 6) = a4;
  *((_DWORD *)v13 + 7) = a3;
  *((_DWORD *)v13 + 8) = self->_ro_flags;
  *(void *)(v13 + 36) = *(void *)&self->_rw_flags;
  *((_DWORD *)v13 + 11) = self->_remoteType;
  uint64_t v20 = [(NSString *)self->_remoteClassName copy];
  uint64_t v21 = (void *)*((void *)v13 + 7);
  *((void *)v13 + 7) = v20;

  uint64_t v22 = [(NSString *)self->_displayName copy];
  uint64_t v23 = (void *)*((void *)v13 + 8);
  *((void *)v13 + 8) = v22;

  uint64_t v24 = [(NSString *)self->_remoteBinaryPath copy];
  unsigned int v25 = (void *)*((void *)v13 + 9);
  *((void *)v13 + 9) = v24;

  objc_storeStrong((id *)v13 + 10, self->_superclassLayout);
  if (v8) {
    unsigned int v26 = self;
  }
  else {
    unsigned int v26 = 0;
  }
  if (self->_genericLayout) {
    genericLayout = self->_genericLayout;
  }
  else {
    genericLayout = v26;
  }
  objc_storeStrong((id *)v13 + 11, genericLayout);
  v13[146] = self->_usesSwiftRefcounting;
  return v13;
}

- (void)_applyExtendedLayout:(const char *)a3 withSize:(unsigned int)a4
{
  if (a3)
  {
    uint64_t v29 = 0;
    unsigned int v30 = &v29;
    uint64_t v31 = 0x2020000000;
    int v32 = 0;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __46__VMUClassInfo__applyExtendedLayout_withSize___block_invoke;
    v28[3] = &unk_1E5D24020;
    v28[4] = &v29;
    _processExtendedLayout((unint64_t)a3, v28);
    unsigned int superclassOffset = self->_superclassOffset;
    BOOL v8 = a4 >= superclassOffset;
    unsigned int v9 = a4 - superclassOffset;
    if (v8)
    {
      unsigned int v10 = v9 / self->_remotePointerSize;
      if (*((_DWORD *)v30 + 6) > v10) {
        unsigned int v10 = *((_DWORD *)v30 + 6);
      }
      *((_DWORD *)v30 + 6) = v10;
      uint64_t ivarCount = self->_ivarCount;
      unsigned int v12 = v10 + 1;
      uint64_t v13 = (id *)malloc_type_realloc(self->_localIvarList, 8 * (ivarCount + v10 + 1), 0x80040B8603338uLL);
      int v14 = v13;
      if (v13)
      {
        bzero(&v13[ivarCount], 8 * v12);
        self->_localIvarList = v14;
        uint64_t v24 = 0;
        unsigned int v25 = &v24;
        uint64_t v26 = 0x2020000000;
        unsigned int v27 = self->_superclassOffset;
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __46__VMUClassInfo__applyExtendedLayout_withSize___block_invoke_2;
        v23[3] = &unk_1E5D24048;
        v23[4] = self;
        v23[5] = &v24;
        _processExtendedLayout((unint64_t)a3, v23);
        for (unsigned int i = self->_ivarCount; i < *((_DWORD *)v30 + 6); ++i)
        {
          uint64_t v16 = [VMUMutableFieldInfo alloc];
          unint64_t v17 = [(VMUFieldInfo *)v16 initWithName:@"[capture]" type:0 scan:1 offset:*((unsigned int *)v25 + 6) size:self->_remotePointerSize];
          [(VMUMutableFieldInfo *)v17 setIsCapture:1];
          localIvarList = self->_localIvarList;
          uint64_t v19 = self->_ivarCount;
          id v20 = localIvarList[v19];
          localIvarList[v19] = v17;
          uint64_t v21 = v17;

          unsigned int remotePointerSize = self->_remotePointerSize;
          ++self->_ivarCount;
          *((_DWORD *)v25 + 6) += remotePointerSize;
        }
        _Block_object_dispose(&v24, 8);
      }
      else
      {
        self->_localIvarList = 0;
      }
    }
    _Block_object_dispose(&v29, 8);
  }
}

uint64_t __46__VMUClassInfo__applyExtendedLayout_withSize___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) += a4;
  return result;
}

void __46__VMUClassInfo__applyExtendedLayout_withSize___block_invoke_2(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (a4)
  {
    int v4 = a4;
    if (a3) {
      BOOL v8 = @"[__block capture]";
    }
    else {
      BOOL v8 = @"[capture]";
    }
    do
    {
      unsigned int v9 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:v8 type:0 scan:a2 offset:*(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) size:*(unsigned int *)(*(void *)(a1 + 32) + 16)];
      [(VMUMutableFieldInfo *)v9 setIsCapture:1];
      if (a3) {
        [(VMUMutableFieldInfo *)v9 setIsByref:1];
      }
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(v10 + 48);
      uint64_t v12 = *(unsigned int *)(v10 + 20);
      uint64_t v13 = *(void **)(v11 + 8 * v12);
      *(void *)(v11 + 8 * v12) = v9;
      int v14 = v9;

      ++*(_DWORD *)(*(void *)(a1 + 32) + 20);
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += *(_DWORD *)(*(void *)(a1 + 32) + 16);

      --v4;
    }
    while (v4);
  }
}

- (id)instanceSpecificInfoForObject:(unint64_t)a3 ofSize:(unsigned int)a4 memoryReader:(id)a5
{
  unint64_t v5 = [(VMUClassInfo *)self instanceSpecificInfoForObject:a3 ofSize:*(void *)&a4 withScanner:0 memoryReader:a5];

  return v5;
}

- (id)instanceSpecificInfoForObject:(unint64_t)a3 ofSize:(unsigned int)a4 withScanner:(id)a5 memoryReader:(id)a6
{
  if (!a6
    || self->_genericLayout
    || (uint64_t v9 = *(void *)&a4, ![(VMUClassInfo *)self hasSpecificLayout]))
  {
    int v14 = self;
    goto LABEL_7;
  }
  uint64_t v11 = self->_superclassLayout;
  uint64_t v12 = [(VMUClassInfo *)self->_superclassLayout hasVariantLayout];
  if (v12)
  {
    uint64_t v13 = [(VMUClassInfo *)self->_superclassLayout instanceSpecificInfoForObject:a3 ofSize:v9 withScanner:a5 memoryReader:a6];

    uint64_t v11 = (VMUClassInfo *)v13;
    goto LABEL_12;
  }
  if (!self->_variantEvaluators && !self->_complexVariantEvaluators)
  {
    id v43 = self;
    unsigned int remoteType = v43->_remoteType;
    if (remoteType != 0x80000000)
    {
      if (remoteType == 8 || remoteType == 1)
      {
        uint64_t v45 = (uint64_t (**)(void *, uint64_t, uint64_t))((char *)a6 + 16);
        uint64_t v46 = (int *)(*((uint64_t (**)(id, unint64_t, uint64_t))a6 + 2))(a6, a3 + 8, 4);
        if (v46)
        {
          int v47 = *v46;
          if (*v46 >> 30 == 3)
          {
            unint64_t v48 = a3 + 24;
            unsigned int remotePointerSize = v43->_remotePointerSize;
            id v50 = a6;
            uint64_t v51 = v50;
            uint64_t v52 = (uint64_t (*)(id, unint64_t, uint64_t))*((void *)a6 + 2);
            if (remotePointerSize == 8)
            {
              uint64_t v53 = (void *)v52(v50, v48, 8);
              uint64_t v54 = v53 ? *v53 : 0;
            }
            else
            {
              uint64_t v71 = (_DWORD *)v52(v50, v48, 4);
              unsigned int v72 = v71 ? *v71 : 0;
              uint64_t v54 = v72;
            }

            if (v54)
            {
              int v14 = [a5 _cachedVariantForGenericInfo:v43 variantKey:v54];

              if (v14) {
                goto LABEL_34;
              }
              if ((v47 & 0x2000000) != 0) {
                uint64_t v80 = 40;
              }
              else {
                uint64_t v80 = 24;
              }
              v81 = (unsigned int *)(*v45)(v51, v54 + 8, 4);
              if (v81)
              {
                uint64_t v82 = *v81;
                if (v82 > v9)
                {
                  int v14 = v43;
                  goto LABEL_34;
                }
              }
              else
              {
                uint64_t v82 = 0;
              }
              int v14 = [(VMUClassInfo *)v43 _copyWithInstanceSize:v82 superclassOffset:3 * v43->_remotePointerSize + 8 asVariant:1 mutable:0];
              uint64_t v85 = v80 + v54;
              unsigned int v86 = v43->_remotePointerSize;
              id v87 = v51;
              unsigned int v88 = v87;
              unsigned int v89 = *v45;
              if (v86 == 8)
              {
                unsigned int v90 = (unint64_t *)v89(v87, v85, 8);
                if (v90)
                {
                  unint64_t v91 = *v90;
LABEL_92:

                  if (v91 > 0xFFF)
                  {
                    uint64_t v93 = (void *)copy_remote_layout_at(v91, v88);
                    [(VMUClassInfo *)v14 _applyExtendedLayout:v93 withSize:v82];
                    if (v93) {
                      free(v93);
                    }
                  }
                  else
                  {
                    [(VMUClassInfo *)v14 _applyExtendedLayout:v91 withSize:v82];
                  }
                  [a5 _registerVariant:v14 forGenericInfo:v43 variantKey:v54];
                  goto LABEL_34;
                }
              }
              else
              {
                int v92 = (unsigned int *)v89(v87, v85, 4);
                if (v92)
                {
                  unint64_t v91 = *v92;
                  goto LABEL_92;
                }
              }
              unint64_t v91 = 0;
              goto LABEL_92;
            }
          }
        }
      }
LABEL_76:
      int v14 = v43;
      goto LABEL_34;
    }
    int v55 = (int *)(*((uint64_t (**)(id, unint64_t, uint64_t))a6 + 2))(a6, a3 + 16, 4);
    if (v55) {
      int v56 = *v55;
    }
    else {
      int v56 = 0;
    }
    id v57 = (unsigned int *)(*((uint64_t (**)(id, unint64_t, uint64_t))a6 + 2))(a6, a3 + 20, 4);
    if (v57)
    {
      uint64_t v58 = *v57;
      if (v58 > v9) {
        goto LABEL_76;
      }
    }
    else
    {
      uint64_t v58 = 0;
    }
    uint64_t v59 = v58;
    unsigned int v60 = v43->_remotePointerSize;
    int v61 = 2 * v60;
    uint64_t v62 = 2 * v60 + 8;
    unsigned int v63 = v56 & 0xF0000000;
    if ((v56 & 0xF0000000) == 0)
    {
      int v14 = [(VMUClassInfo *)v43 _copyWithInstanceSize:v59 superclassOffset:v62 asVariant:1 mutable:0];

      goto LABEL_34;
    }
    if (v63 != 0x10000000)
    {
      uint64_t v73 = (v61 + 8);
      uint64_t v74 = v59;
      uint64_t v75 = v59 | v56 & 0xF2000000;
      int v14 = [a5 _cachedVariantForGenericInfo:v43 variantKey:v75];

      if (!v14)
      {
        uint64_t v76 = v73;
        if ((v56 & 0x2000000) != 0) {
          uint64_t v76 = (v73 + 2 * v43->_remotePointerSize);
        }
        unsigned int v77 = (v63 - 0x20000000) >> 28;
        if (v77 == 1)
        {
          int v79 = 1;
          unsigned int v78 = 256;
        }
        else if (v77 == 2)
        {
          unsigned int v78 = 1;
          int v79 = 1;
        }
        else
        {
          int v79 = 0;
          unsigned int v78 = 32;
        }
        unsigned int v94 = [(VMUClassInfo *)v43 _copyWithInstanceSize:v59 superclassOffset:v76 asVariant:1 mutable:0];
        int v14 = v94;
        if (v79)
        {
          [(VMUClassInfo *)v94 _applyExtendedLayout:v78 withSize:v59];
        }
        else
        {
          v95 = malloc_type_calloc(1uLL, 2uLL, 0xFB333CDFuLL);
          unsigned char *v95 = v78;
          [(VMUClassInfo *)v14 _applyExtendedLayout:v95 withSize:v74];
          free(v95);
        }
        [a5 _registerVariant:v14 forGenericInfo:v43 variantKey:v75];
      }
      goto LABEL_34;
    }
    uint64_t v64 = v62 + (v61 & (v56 << 6 >> 31));
    uint64_t v65 = v64 + a3;
    id v66 = a6;
    v67 = v66;
    int v68 = (uint64_t (*)(id, uint64_t, uint64_t))*((void *)a6 + 2);
    if (v60 == 8)
    {
      v69 = (unint64_t *)v68(v66, v65, 8);
      if (v69)
      {
        unint64_t v70 = *v69;
        goto LABEL_80;
      }
    }
    else
    {
      uint64_t v83 = (unsigned int *)v68(v66, v65, 4);
      if (v83)
      {
        unint64_t v70 = *v83;
        goto LABEL_80;
      }
    }
    unint64_t v70 = 0;
LABEL_80:

    int v14 = [(VMUClassInfo *)v43 _copyWithInstanceSize:v59 superclassOffset:(v43->_remotePointerSize + v64) asVariant:1 mutable:0];
    if (v70 > 0xFFF)
    {
      uint64_t v84 = (void *)copy_remote_layout_at(v70, v67);
      [(VMUClassInfo *)v14 _applyExtendedLayout:v84 withSize:v59];
      if (v84) {
        free(v84);
      }
    }
    else
    {
      [(VMUClassInfo *)v14 _applyExtendedLayout:v70 withSize:v59];
    }
    goto LABEL_34;
  }
LABEL_12:
  v120[6] = a6;
  v121 = 0;
  variantEvaluators = self->_variantEvaluators;
  v120[0] = MEMORY[0x1E4F143A8];
  v120[1] = 3221225472;
  v120[2] = __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_2;
  v120[3] = &__block_descriptor_56_e48_B16__0___B__Q__VMUTaskMemoryScanner_____v__QQ__8lu40l8u48l8;
  v120[4] = a3;
  v120[5] = a5;
  int v17 = __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke(v12, variantEvaluators, &v121, v120);
  uint64_t v116 = 0;
  v117 = &v116;
  uint64_t v118 = 0x2020000000;
  uint64_t v119 = 0;
  uint64_t v119 = [@"seed" hash];
  uint64_t v115 = 0;
  complexVariantEvaluators = self->_complexVariantEvaluators;
  v114[0] = MEMORY[0x1E4F143A8];
  v114[1] = 3221225472;
  v114[2] = __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_3;
  v114[3] = &unk_1E5D24090;
  v114[5] = a3;
  v114[6] = a6;
  v114[4] = &v116;
  int v19 = __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke(v119, complexVariantEvaluators, &v115, v114);
  v113[0] = MEMORY[0x1E4F143A8];
  v113[1] = 3221225472;
  v113[2] = __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_4;
  v113[3] = &__block_descriptor_48_e5_v8__0l;
  v113[4] = v121;
  v113[5] = v115;
  uint64_t v20 = MEMORY[0x1AD0DA230](v113);
  uint64_t v21 = (void (**)(void))v20;
  if (((v17 | v19) & 1) != 0 || v11 != self->_superclassLayout)
  {
    uint64_t v107 = 0;
    v108 = &v107;
    uint64_t v109 = 0x3032000000;
    v110 = __Block_byref_object_copy__6;
    v111 = __Block_byref_object_dispose__6;
    id v112 = 0;
    uint64_t v22 = (void *)MEMORY[0x1AD0D9F90]();
    uint64_t v96 = MEMORY[0x1E4F143A8];
    uint64_t v97 = 3221225472;
    uint64_t v98 = __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_5;
    uint64_t v99 = &unk_1E5D24128;
    v100 = self;
    uint64_t v102 = &v107;
    BOOL v103 = v121;
    uint64_t v104 = v115;
    unint64_t v105 = a3;
    id v106 = a6;
    uint64_t v23 = v11;
    uint64_t v101 = v23;
    uint64_t v24 = (void (**)(void))MEMORY[0x1AD0DA230](&v96);
    if (!v121)
    {
      unint64_t v25 = 0;
      goto LABEL_24;
    }
    unint64_t v25 = 0;
    uint64_t v26 = (unsigned __int8 *)v121 + 3;
    unint64_t v27 = (*v121 + 7);
    uint64_t v28 = (v27 >> 3) + 4;
    unint64_t v29 = (v27 >> 3) + 8;
    do
    {
      uint64_t v30 = *(v26 - 3) + 16 * v25;
      unint64_t v31 = *(v26 - 2)
          + 16
          * ((v30 ^ ((unint64_t)(v30 & 0xF0000000) >> 24)) & ~(unint64_t)(v30 & 0xF0000000));
      unint64_t v32 = *(v26 - 1)
          + 16
          * ((v31 ^ ((unint64_t)(v31 & 0xF0000000) >> 24)) & ~(unint64_t)(v31 & 0xF0000000));
      unsigned int v33 = *v26;
      v26 += 4;
      unint64_t v34 = v33
          + 16
          * ((v32 ^ ((unint64_t)(v32 & 0xF0000000) >> 24)) & ~(unint64_t)(v32 & 0xF0000000));
      unint64_t v25 = (v34 ^ ((unint64_t)(v34 & 0xF0000000) >> 24)) & ~(unint64_t)(v34 & 0xF0000000);
      v29 -= 4;
    }
    while (v29 > 7);
    if (v29 != 5)
    {
      if (v29 != 6)
      {
        if (v29 != 7)
        {
LABEL_24:
          uint64_t v38 = v117;
          unint64_t v39 = v25 + 37 * v117[3];
          v117[3] = v39;
          if (v23 == self->_superclassLayout)
          {
            uint64_t v41 = 0;
          }
          else
          {
            unsigned int v40 = [a5 _indexForClassInfo:v23 withClassInfo:v96 withClassInfo:v97 withClassInfo:v98 withClassInfo:v99 withClassInfo:v100];
            uint64_t v38 = v117;
            unint64_t v39 = v117[3];
            uint64_t v41 = v40;
          }
          v38[3] = v41 + 37 * v39;
          [a5 _cachedVariantForGenericInfo:self variantKey:v96 v97:v98 v99:v100];
          int v14 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v21[2](v21);
            uint64_t v42 = v14;
          }
          else
          {
            v24[2](v24);
            [a5 _registerVariant:v108[5] forGenericInfo:self variantKey:v117[3]];
          }

          if (!v14)
          {
            v21[2](v21);
            int v14 = (VMUClassInfo *)(id)v108[5];
          }
          _Block_object_dispose(&v107, 8);

          goto LABEL_33;
        }
        uint64_t v35 = *((unsigned __int8 *)v121 + v28 - 3) + 16 * v25;
        unint64_t v25 = (v35 ^ ((unint64_t)(v35 & 0xF0000000) >> 24)) & ~(unint64_t)(v35 & 0xF0000000);
      }
      uint64_t v36 = *((unsigned __int8 *)v121 + v28 - 2) + 16 * v25;
      unint64_t v25 = (v36 ^ ((unint64_t)(v36 & 0xF0000000) >> 24)) & ~(unint64_t)(v36 & 0xF0000000);
    }
    uint64_t v37 = *((unsigned __int8 *)v121 + v28 - 1) + 16 * v25;
    unint64_t v25 = (v37 ^ ((unint64_t)(v37 & 0xF0000000) >> 24)) & ~(unint64_t)(v37 & 0xF0000000);
    goto LABEL_24;
  }
  (*(void (**)(uint64_t))(v20 + 16))(v20);
  int v14 = self;
LABEL_33:

  _Block_object_dispose(&v116, 8);
LABEL_34:

LABEL_7:

  return v14;
}

uint64_t __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  BOOL v7 = a4;
  if (v6
    && (unsigned int v8 = [v6 count],
        uint64_t v9 = malloc_type_calloc(1uLL, ((v8 + 7) >> 3) + 4, 0xFF42C4F3uLL),
        *uint64_t v9 = v8,
        *a3 = v9,
        v8))
  {
    unint64_t v10 = 0;
    char v11 = 0;
    uint64_t v12 = v8;
    do
    {
      uint64_t v13 = [v6 objectAtIndexedSubscript:v10];
      if (v7[2](v7, v13))
      {
        char v11 = 1;
        if (v10 < *(unsigned int *)*a3) {
          *(unsigned char *)((v10 >> 3) + *a3 + 4) |= 1 << (v10 & 7);
        }
      }

      ++v10;
    }
    while (v12 != v10);
  }
  else
  {
    char v11 = 0;
  }

  return v11 & 1;
}

uint64_t __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_2(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void, void))(a2 + 16))(a2, a1[4], a1[5], a1[6]);
}

uint64_t __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = 0;
  uint64_t v4 = (*((uint64_t (**)(id, void, void, uint64_t *))v3 + 2))(v3, a1[5], a1[6], &v6);
  *(void *)(*(void *)(a1[4] + 8) + 24) = v6 + 37 * *(void *)(*(void *)(a1[4] + 8) + 24);

  return v4;
}

void __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_4(uint64_t a1)
{
  free(*(void **)(a1 + 32));
  uint64_t v2 = *(void **)(a1 + 40);

  free(v2);
}

uint64_t __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _copyWithInstanceSize:*(unsigned int *)(*(void *)(a1 + 32) + 28) superclassOffset:*(unsigned int *)(*(void *)(a1 + 32) + 24) asVariant:1 mutable:1];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  unint64_t v5 = *(unsigned int **)(a1 + 56);
  if (v5)
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    unint64_t v34 = __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_6;
    uint64_t v35 = &unk_1E5D240D8;
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v36 = *(void *)(a1 + 32);
    uint64_t v37 = v6;
    BOOL v7 = v33;
    unsigned int v8 = *v5;
    if (*v5)
    {
      unsigned int v9 = 0;
      int v10 = 1;
      do
      {
        char v11 = (char *)v5 + (v9 >> 3);
        unsigned int v12 = v11[4];
        unsigned int v13 = v10;
        if (v11[4])
        {
          do
          {
            if (v12) {
              v34((uint64_t)v7, v13 - 1);
            }
            if (v12 < 2) {
              break;
            }
            v12 >>= 1;
            BOOL v14 = v13++ >= v8;
          }
          while (!v14);
        }
        v9 += 8;
        v10 += 8;
      }
      while (v9 < v8);
    }
  }
  uint64_t v15 = *(unsigned int **)(a1 + 64);
  if (v15)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    unint64_t v27 = __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_7;
    uint64_t v28 = &unk_1E5D24100;
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v29 = *(void *)(a1 + 32);
    uint64_t v30 = v16;
    uint64_t v17 = *(void *)(a1 + 80);
    uint64_t v31 = *(void *)(a1 + 72);
    uint64_t v32 = v17;
    BOOL v18 = v26;
    unsigned int v19 = *v15;
    if (*v15)
    {
      unsigned int v20 = 0;
      int v21 = 1;
      do
      {
        uint64_t v22 = (char *)v15 + (v20 >> 3);
        unsigned int v23 = v22[4];
        unsigned int v24 = v21;
        if (v22[4])
        {
          do
          {
            if (v23) {
              v27(v18, v24 - 1);
            }
            if (v23 < 2) {
              break;
            }
            v23 >>= 1;
            BOOL v14 = v24++ >= v19;
          }
          while (!v14);
        }
        v20 += 8;
        v21 += 8;
      }
      while (v20 < v19);
    }
  }
  return [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setSuperclassInfo:*(void *)(a1 + 40)];
}

void __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_6(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 104) objectAtIndexedSubscript:a2];
  v3[2](v3, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_7(void *a1, unsigned int a2)
{
  id v3 = [*(id *)(a1[4] + 120) objectAtIndexedSubscript:a2];
  (*((void (**)(id, void, void, void))v3 + 2))(v3, *(void *)(*(void *)(a1[5] + 8) + 40), a1[6], a1[7]);
}

- (void)enumerateStoredEntriesForObject:(unint64_t)a3 ofSize:(unsigned int)a4 externalValues:(id)a5 block:(id)a6
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v40 = a5;
  int v10 = (void (**)(id, void, uint64_t, uint64_t))a6;
  if (self->_remoteType == 32)
  {
    uint64_t v42 = v10;
    uint64_t v62 = 0;
    unsigned int v63 = &v62;
    uint64_t v64 = 0x2020000000;
    uint64_t v65 = 0;
    uint64_t v58 = 0;
    uint64_t v59 = &v58;
    uint64_t v60 = 0x2020000000;
    int v61 = 0;
    uint64_t v52 = 0;
    uint64_t v53 = &v52;
    uint64_t v54 = 0x3032000000;
    int v55 = __Block_byref_object_copy__6;
    int v56 = __Block_byref_object_dispose__6;
    id v57 = 0;
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __76__VMUClassInfo_enumerateStoredEntriesForObject_ofSize_externalValues_block___block_invoke;
    v50[3] = &unk_1E5D24150;
    unsigned int v51 = a4;
    v50[4] = &v62;
    v50[5] = &v52;
    v50[6] = &v58;
    v50[7] = a3;
    [(VMUClassInfo *)self enumerateAllFieldsWithBlock:v50];
    unint64_t v39 = a3;
    unsigned int v41 = a4;
    if (v40)
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v11 = v40;
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = [v11 countByEnumeratingWithState:&v46 objects:v66 count:16];
      if (v14)
      {
        uint64_t v43 = 0;
        uint64_t v44 = 0;
        uint64_t v15 = 0;
        uint64_t v45 = 0;
        uint64_t v16 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v47 != v16) {
              objc_enumerationMutation(v11);
            }
            id v18 = *(id *)(*((void *)&v46 + 1) + 8 * i);
            unsigned int v19 = [v18 field];
            int v20 = [v19 isStorageImplPointer];

            if (v20)
            {
              uint64_t v12 = [v18 value];
            }
            else
            {
              int v21 = [v18 field];
              int v22 = [v21 isStorageBitmapPointer];

              if (v22)
              {
                uint64_t v13 = [v18 value];
              }
              else
              {
                unsigned int v23 = [v18 field];
                int v24 = [v23 isKeysPointer];

                if (v24)
                {
                  uint64_t v44 = [v18 value];
                }
                else
                {
                  unint64_t v25 = [v18 field];
                  int v26 = [v25 isValuesPointer];

                  if (v26)
                  {
                    uint64_t v43 = [v18 value];
                  }
                  else if (v15 {
                         || ([v18 field],
                  }
                             unint64_t v27 = objc_claimAutoreleasedReturnValue(),
                             int v28 = [v27 isKeyField],
                             v27,
                             !v28))
                  {
                    if (!v45)
                    {
                      uint64_t v29 = [v18 field];
                      int v30 = [v29 isValueField];

                      if (v30)
                      {
                        uint64_t v45 = [v18 field];
                      }
                      else
                      {
                        uint64_t v45 = 0;
                      }
                    }
                  }
                  else
                  {
                    uint64_t v15 = [v18 field];
                  }
                }
              }
            }
          }
          uint64_t v14 = [v11 countByEnumeratingWithState:&v46 objects:v66 count:16];
        }
        while (v14);
      }
      else
      {
        uint64_t v43 = 0;
        uint64_t v44 = 0;
        uint64_t v15 = 0;
        uint64_t v45 = 0;
      }
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      uint64_t v43 = 0;
      uint64_t v44 = 0;
      uint64_t v15 = 0;
      uint64_t v45 = 0;
    }
    if (v53[5])
    {
      uint64_t v31 = *((unsigned int *)v59 + 6);
      if (v31)
      {
        if (v63[3])
        {
          unsigned int v32 = 1;
          do
          {
            if ([(id)v53[5] size] + v31 > v41) {
              break;
            }
            v42[2](v42, v53[5], v31, [(id)v53[5] size]);
            uint64_t v31 = [(id)v53[5] stride] + v31;
          }
          while (v63[3] > (unint64_t)v32++);
        }
      }
    }
    if (v12 && v63[3])
    {
      uint64_t v34 = 0;
      unsigned int v35 = 0;
      uint64_t v36 = v43 - v12;
      uint64_t v37 = v44 - v12;
      unint64_t v38 = v13 - v12;
      while ((v34 & 7) != 0)
      {
        if (v35) {
          goto LABEL_43;
        }
LABEL_47:
        v35 >>= 1;
        v37 += [v15 stride];
        v36 += [v45 stride];
        if (++v34 >= (unint64_t)v63[3]) {
          goto LABEL_48;
        }
      }
      if (v38 >= v41) {
        goto LABEL_48;
      }
      unsigned int v35 = *(unsigned __int8 *)(v39 + v38++);
      if ((v35 & 1) == 0) {
        goto LABEL_47;
      }
LABEL_43:
      if (v37 + (unint64_t)[v15 size] <= v41) {
        ((void (**)(id, void *, uint64_t, uint64_t))v42)[2](v42, v15, v37, [v15 size]);
      }
      if (v36 + (unint64_t)[v45 size] <= v41) {
        ((void (**)(id, void *, uint64_t, uint64_t))v42)[2](v42, v45, v36, [v45 size]);
      }
      goto LABEL_47;
    }
LABEL_48:

    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v62, 8);
    int v10 = v42;
  }
}

void __76__VMUClassInfo_enumerateStoredEntriesForObject_ofSize_externalValues_block___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 isArraySize]
    && (unint64_t)[v5 offset] + 8 <= *(unsigned int *)(a1 + 64))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(void *)(v4
                                                                            + [v5 offset]);
  }
  else if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) {
         && [v5 isArrayEntries])
  }
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 offset];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (void)enumerateExternalValuesFromObject:(unint64_t)a3 withSize:(unsigned int)a4 block:(id)a5
{
  unsigned int v8 = (void (**)(id, void, void *))a5;
  if (self->_remoteType == 32)
  {
    uint64_t v17 = v8;
    unsigned int v9 = objc_opt_new();
    if (self->_ivarCount)
    {
      unint64_t v10 = 0;
      uint64_t v11 = 0;
      unint64_t v12 = a4;
      do
      {
        id v13 = self->_localIvarList[v10];
        if ((([v13 isStorageImplPointer] & 1) != 0
           || ([v13 isStorageBitmapPointer] & 1) != 0
           || ([v13 isKeysPointer] & 1) != 0
           || [v13 isValuesPointer])
          && (unint64_t)[v13 offset] + 8 <= v12)
        {
          uint64_t v14 = *(void *)(a3 + [v13 offset]);
          uint64_t v15 = [[VMUFieldValue alloc] initWithField:v13 value:v14];
          [v9 addObject:v15];
          if ([v13 isStorageImplPointer]) {
            uint64_t v11 = v14;
          }
        }
        if (([v13 isKeyField] & 1) != 0 || [v13 isValueField])
        {
          uint64_t v16 = [[VMUFieldValue alloc] initWithField:v13 value:0];
          [v9 addObject:v16];
        }
        ++v10;
      }
      while (v10 < self->_ivarCount);
      if (v11 && [v9 count]) {
        v17[2](v17, v11, v9);
      }
    }

    unsigned int v8 = v17;
  }
}

- (VMUClassInfo)genericInfo
{
  if (self->_genericLayout) {
    self = self->_genericLayout;
  }
  return self;
}

- (unsigned)_totalIvarCount
{
  unsigned int ivarCount = self->_ivarCount;
  return [(VMUClassInfo *)self->_superclassLayout _totalIvarCount] + ivarCount;
}

- (unsigned)_ivarGapForClass
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  id v3 = [(VMUClassInfo *)self superclassInfo];
  int v4 = [v3 instanceSize];

  int v15 = v4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __32__VMUClassInfo__ivarGapForClass__block_invoke;
  v11[3] = &unk_1E5D24178;
  v11[4] = &v16;
  v11[5] = &v12;
  [(VMUClassInfo *)self enumerateTypeFieldsWithBlock:v11];
  unsigned int v5 = [(VMUClassInfo *)self instanceSize];
  unsigned int v6 = *((_DWORD *)v13 + 6);
  BOOL v7 = v5 >= v6;
  unsigned int v8 = v5 - v6;
  if (!v7) {
    unsigned int v8 = 0;
  }
  unsigned int v9 = *((_DWORD *)v17 + 6) + v8;
  *((_DWORD *)v17 + 6) = v9;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v9;
}

void __32__VMUClassInfo__ivarGapForClass__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  int v3 = [v7 offset];
  unsigned int v4 = [v7 offset];
  unsigned int v5 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v4 < v5) {
    unsigned int v5 = v4;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += v3 - v5;
  int v6 = [v7 offset];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 size] + v6;
}

- (unsigned)ivarGapForClassHierarchy
{
  unsigned int v3 = [(VMUClassInfo *)self pointerSize];
  unsigned int v4 = self;
  unsigned int v5 = v4;
  int v6 = 0;
  if (v4)
  {
    int v7 = 0;
    int v8 = 0;
    int v9 = -v3;
    unsigned int v10 = (v3 - 1) & 0xFFFFFFFC;
    uint64_t v11 = v4;
    do
    {
      unsigned int v12 = [(VMUClassInfo *)v11 _ivarGapForClass];
      uint64_t v13 = [(VMUClassInfo *)v11 superclassInfo];
      unsigned int v14 = v12 + v7;
      if ((v10 & (v12 + v7)) != 0) {
        int v15 = 0;
      }
      else {
        int v15 = v8;
      }
      if (v8) {
        int v7 = 0;
      }
      else {
        int v7 = v10 & (v12 + v7);
      }
      if (v8) {
        int v16 = v15;
      }
      else {
        int v16 = 0;
      }
      if (v11 == v5) {
        int v17 = -1;
      }
      else {
        int v17 = v9;
      }
      int v18 = v14 & v17;
      if (v11 == v5) {
        int v8 = v7;
      }
      else {
        int v8 = 0;
      }
      int v6 = v18 + v6 - v16;

      uint64_t v11 = (VMUClassInfo *)v13;
    }
    while (v13);
  }
  int v19 = malloc_good_size([(VMUClassInfo *)v5 instanceSize]);
  return v19 - malloc_good_size([(VMUClassInfo *)v5 instanceSize] - v6);
}

- (void)enumerateClassHierarchyWithBlock:(id)a3
{
  unsigned int v4 = (void (**)(id, VMUClassInfo *))a3;
  -[VMUClassInfo enumerateClassHierarchyWithBlock:](self->_superclassLayout, "enumerateClassHierarchyWithBlock:");
  v4[2](v4, self);
}

- (void)enumerateAllFieldsWithBlock:(id)a3
{
  id v4 = a3;
  -[VMUClassInfo enumerateAllFieldsWithBlock:](self->_superclassLayout, "enumerateAllFieldsWithBlock:");
  [(VMUClassInfo *)self enumerateTypeFieldsWithBlock:v4];
}

- (void)enumerateTypeFieldsWithBlock:(id)a3
{
  id v4 = (void (**)(id, id, uint64_t, char *))a3;
  char v10 = 0;
  unsigned int v5 = [(VMUClassInfo *)self _totalIvarCount];
  unsigned int ivarCount = self->_ivarCount;
  if (ivarCount)
  {
    uint64_t v7 = 0;
    uint64_t v8 = v5 - ivarCount;
    do
      v4[2](v4, self->_localIvarList[v7], v8 + v7, &v10);
    while (++v7 < (unint64_t)self->_ivarCount && v10 == 0);
  }
}

- (void)enumerateAllPointerFieldsWithBlock:(void *)result
{
  if (result)
  {
    uint64_t v2 = result;
    result = (void *)-[VMUClassInfo enumerateAllPointerFieldsWithBlock:](result[10], a2);
    if (*((_DWORD *)v2 + 5))
    {
      uint64_t v3 = 0;
      uint64_t v21 = a2 + 16;
      do
      {
        id v4 = *(void **)(v2[6] + 8 * v3);
        unsigned int v5 = [v4 offset:v21] % *((_DWORD *)v2 + 4);
        int v6 = [v4 offset];
        uint64_t v23 = v3;
        if (v5)
        {
          int v7 = *((_DWORD *)v2 + 4);
          unsigned int v8 = [v4 offset];
          v6 += v7 + v8 / *((_DWORD *)v2 + 4) * *((_DWORD *)v2 + 4) - v8;
        }
        int v9 = [v4 offset];
        result = (void *)[v4 size];
        unsigned int v10 = result + v9;
        while (*((_DWORD *)v2 + 4) + v6 <= v10)
        {
          uint64_t v11 = v6 - [v4 offset];
          int v24 = 0;
          result = (id)[v4 getLeafFieldAtOffset:v11 leafOffset:&v24];
          if (result)
          {
            unsigned int v12 = result;
            int v13 = v24 + v6;
            int v14 = [result size];
            int v15 = v24;
            if ((v13 + v14) % *((_DWORD *)v2 + 4))
            {
              int v16 = [v12 size];
              int v17 = *((_DWORD *)v2 + 4);
              int v18 = v24 + v6;
              int v19 = [v12 size];
              v6 += v15
                  + v16
                  + v17
                  + (v18 + v19) / *((_DWORD *)v2 + 4) * *((_DWORD *)v2 + 4)
                  - (v18
                   + v19);
            }
            else
            {
              v6 += v15 + [v12 size];
            }
            result = (void *)[v12 scanType];
            if (result == 1)
            {
              result = (void *)[v12 scannableSize];
              if (result >= *((_DWORD *)v2 + 4))
              {
                if (*((_DWORD *)v2 + 11) == 8
                  || (result = (void *)[v12 typeNameMayDescribeReferencedAllocation], result))
                {
                  int v20 = [v12 offset];
                  result = (void *)[v12 size];
                  if ((result + v20) > *((_DWORD *)v2 + 7)) {
                    break;
                  }
                  result = (void *)(*(uint64_t (**)(uint64_t, void *, void *, uint64_t))(a2 + 16))(a2, v4, v12, v11);
                }
              }
            }
          }
          else
          {
            v6 += *((_DWORD *)v2 + 4);
          }
        }
        uint64_t v3 = v23 + 1;
      }
      while (v23 + 1 < (unint64_t)*((unsigned int *)v2 + 5));
    }
  }
  return result;
}

- (void)enumerateScanningLocationsForSize:(unsigned int)a3 withBlock:(id)a4
{
  id v6 = a4;
  if (self->_remoteType != 32)
  {
    unsigned int superclassOffset = self->_superclassOffset;
    if (superclassOffset >= a3) {
      uint64_t v8 = a3;
    }
    else {
      uint64_t v8 = superclassOffset;
    }
    [(VMUClassInfo *)self->_superclassLayout enumerateScanningLocationsForSize:v8 withBlock:v6];
    if (self->_ivarCount) {
      int v9 = [*self->_localIvarList offset];
    }
    else {
      int v9 = 0x7FFFFFFF;
    }
    unsigned int instanceSize = self->_instanceSize;
    signed int v30 = instanceSize;
    if (instanceSize <= a3) {
      unsigned int instanceSize = a3;
    }
    unsigned int remotePointerSize = self->_remotePointerSize;
    uint64_t v12 = (remotePointerSize + self->_superclassOffset - 1) & -remotePointerSize;
    int v29 = instanceSize - remotePointerSize;
    if ((int)v12 <= (int)(instanceSize - remotePointerSize))
    {
      int v13 = 0;
      id v14 = 0;
      id v28 = v6;
      while (1)
      {
        int v15 = (void *)MEMORY[0x1AD0D9F90]();
        if ((int)v12 >= v9)
        {
          do
          {
            int v16 = v14;
            id v14 = self->_localIvarList[v13];

            int v17 = [v14 offset];
            int v18 = [v14 scannableSize];
            if (++v13 >= self->_ivarCount) {
              int v9 = 0x7FFFFFFF;
            }
            else {
              int v9 = [self->_localIvarList[v13] offset];
            }
          }
          while ((int)v12 >= v9);
          signed int v30 = v18 + v17;
        }
        int v19 = [v14 offset:v28];
        int v31 = 0;
        int v20 = [v14 getLeafFieldAtOffset:(v12 - v19) leafOffset:&v31];
        if (v30 < (signed int)(self->_remotePointerSize + v12)
          || v14
          && (int v21 = [v14 offset],
              int v22 = v31,
              unsigned int v23 = v22 + v21 + [v20 size],
              id v6 = v28,
              v23 < self->_remotePointerSize + (int)v12))
        {
          if ((int)v12 >= (signed int)self->_instanceSize)
          {
            unsigned int defaultScanType = self->_defaultScanType;
            if (defaultScanType)
            {
              if (defaultScanType == 1) {
                unsigned int remotePointerSize = 1;
              }
              (*((void (**)(id, void, uint64_t))v6 + 2))(v6, 0, v12);
              char v25 = 0;
              id v6 = v28;
            }
            else
            {
              char v25 = 1;
            }
            goto LABEL_31;
          }
        }
        else
        {
          if (v20) {
            unsigned __int8 v26 = [v20 scanType];
          }
          else {
            unsigned __int8 v26 = self->_defaultScanType;
          }
          (*((void (**)(id, void *, uint64_t, void))v6 + 2))(v6, v20, v12, v26);
        }
        char v25 = 0;
LABEL_31:

        uint64_t v12 = remotePointerSize + v12;
        if ((int)v12 > v29) {
          char v27 = 1;
        }
        else {
          char v27 = v25;
        }
        if (v27)
        {

          break;
        }
      }
    }
  }
}

- (id)fieldAtOrBeforeOffset:(unsigned int)a3
{
  if (self->_instanceSize >= a3)
  {
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x3032000000;
    unsigned int v10 = __Block_byref_object_copy__6;
    uint64_t v11 = __Block_byref_object_dispose__6;
    id v12 = 0;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __38__VMUClassInfo_fieldAtOrBeforeOffset___block_invoke;
    v5[3] = &unk_1E5D241A0;
    unsigned int v6 = a3;
    v5[4] = &v7;
    [(VMUClassInfo *)self enumerateAllFieldsWithBlock:v5];
    id v3 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void __38__VMUClassInfo_fieldAtOrBeforeOffset___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  unsigned int v7 = [v9 offset];
  unsigned int v8 = *(_DWORD *)(a1 + 40);
  if (v7)
  {
    if (v7 <= v8)
    {
LABEL_3:
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      goto LABEL_7;
    }
  }
  else if (!v8)
  {
    goto LABEL_3;
  }
  if (v7 > v8) {
    *a4 = 1;
  }
LABEL_7:
}

- (id)firstFieldWithName:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__6;
  int v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__VMUClassInfo_firstFieldWithName___block_invoke;
  v8[3] = &unk_1E5D241C8;
  id v9 = v4;
  unsigned int v10 = &v11;
  id v5 = v4;
  [(VMUClassInfo *)self enumerateAllFieldsWithBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __35__VMUClassInfo_firstFieldWithName___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  unsigned int v7 = [v9 ivarName];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)_adjustInstanceSize
{
  unsigned int ivarCount = self->_ivarCount;
  if (ivarCount)
  {
    id v6 = self->_localIvarList[ivarCount - 1];
    int v4 = [v6 offset];
    unsigned int v5 = [v6 size] + v4;
    if (self->_instanceSize < v5) {
      self->_unsigned int instanceSize = v5;
    }
  }
}

- (void)_addFields:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 count];
  uint64_t ivarCount = self->_ivarCount;
  unsigned int v7 = (id *)malloc_type_realloc(self->_localIvarList, 8 * (ivarCount + v5), 0x80040B8603338uLL);
  int v8 = v7;
  if (v7)
  {
    bzero(&v7[ivarCount], 8 * v5);
    self->_localIvarList = v8;
    self->_ivarCount += v5;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __27__VMUClassInfo__addFields___block_invoke;
    v9[3] = &unk_1E5D241F0;
    v9[4] = self;
    int v10 = ivarCount;
    [v4 enumerateObjectsUsingBlock:v9];
    [(VMUClassInfo *)self _adjustInstanceSize];
  }
  else
  {
    self->_localIvarList = 0;
  }
}

void __27__VMUClassInfo__addFields___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
}

- (void)_replaceField:(id)a3 withFields:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_ivarCount)
  {
    uint64_t v8 = 0;
    while (![self->_localIvarList[v8] isEqual:v6])
    {
      if (++v8 >= (unint64_t)self->_ivarCount) {
        goto LABEL_13;
      }
    }
    unsigned int v9 = [v7 count];
    localIvarList = self->_localIvarList;
    unsigned int v11 = v9 - 1;
    if (v9 > 1)
    {
      uint64_t ivarCount = self->_ivarCount;
      uint64_t v13 = (id *)malloc_type_realloc(self->_localIvarList, 8 * (ivarCount + v11), 0x80040B8603338uLL);
      localIvarList = v13;
      if (!v13)
      {
        self->_localIvarList = 0;
        goto LABEL_13;
      }
      bzero(&v13[ivarCount], 8 * (v9 - 1));
      self->_localIvarList = localIvarList;
    }
    self->_ivarCount += v11;
    id v14 = localIvarList[v8];
    localIvarList[v8] = 0;

    if (v9 != 1)
    {
      memmove(&self->_localIvarList[v9] + v8, &self->_localIvarList[v8 + 1], 8 * (self->_ivarCount - v9 - v8));
      if (v9) {
        bzero(&self->_localIvarList[v8], 8 * v9);
      }
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __41__VMUClassInfo__replaceField_withFields___block_invoke;
    v15[3] = &unk_1E5D241F0;
    v15[4] = self;
    int v16 = v8;
    [v7 enumerateObjectsUsingBlock:v15];
  }
LABEL_13:
}

void __41__VMUClassInfo__replaceField_withFields___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
}

- (void)_replaceFieldRecursively:(id)a3 atOffset:(unsigned int)a4 withField:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  if (self->_ivarCount)
  {
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      id v11 = self->_localIvarList[v9];
      unsigned int v12 = [v11 offset];
      if (a4 - (unint64_t)v12 < [v11 size]) {
        break;
      }

      ++v10;
      ++v9;
      if (v10 >= self->_ivarCount) {
        goto LABEL_12;
      }
    }
    if ([v11 offset] == a4 && [v11 isEqual:v14])
    {
      objc_storeStrong(&self->_localIvarList[v9], a5);
    }
    else
    {
      uint64_t v13 = [v11 subFieldArray];

      if (v13) {
        [v11 replaceFieldRecursively:v14 atOffset:a4 - [v11 offset] withField:v8];
      }
    }
  }
LABEL_12:
}

- (void)_setFields:(id)a3
{
  id v9 = a3;
  [(VMUClassInfo *)self _freeLocalIvarList];
  unsigned int v4 = [v9 count];
  self->_uint64_t ivarCount = v4;
  if (v4)
  {
    self->_localIvarList = (id *)malloc_type_calloc(v4 + 1, 8uLL, 0x80040B8603338uLL);
    if (self->_ivarCount)
    {
      unint64_t v5 = 0;
      do
      {
        uint64_t v6 = [v9 objectAtIndexedSubscript:v5];
        localIvarList = self->_localIvarList;
        id v8 = localIvarList[v5];
        localIvarList[v5] = (id)v6;

        ++v5;
      }
      while (v5 < self->_ivarCount);
    }
  }
  [(VMUClassInfo *)self _adjustInstanceSize];
}

- (void)_addVariantAction:(id)a3 withEvaluator:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  variantEvaluators = self->_variantEvaluators;
  if (!variantEvaluators)
  {
    id v8 = (NSMutableArray *)objc_opt_new();
    id v9 = self->_variantEvaluators;
    self->_variantEvaluators = v8;

    unint64_t v10 = (NSMutableArray *)objc_opt_new();
    variantActions = self->_variantActions;
    self->_variantActions = v10;

    variantEvaluators = self->_variantEvaluators;
  }
  *(_WORD *)&self->_char hasSpecificLayout = 257;
  unsigned int v12 = (void *)MEMORY[0x1AD0DA230](v6);
  [(NSMutableArray *)variantEvaluators addObject:v12];

  uint64_t v13 = self->_variantActions;
  id v14 = (void *)MEMORY[0x1AD0DA230](v15);
  [(NSMutableArray *)v13 addObject:v14];
}

- (void)_addComplexAction:(id)a3 withEvaluator:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  complexVariantEvaluators = self->_complexVariantEvaluators;
  if (!complexVariantEvaluators)
  {
    id v8 = (NSMutableArray *)objc_opt_new();
    id v9 = self->_complexVariantEvaluators;
    self->_complexVariantEvaluators = v8;

    unint64_t v10 = (NSMutableArray *)objc_opt_new();
    complexVariantActions = self->_complexVariantActions;
    self->_complexVariantActions = v10;

    complexVariantEvaluators = self->_complexVariantEvaluators;
  }
  *(_WORD *)&self->_char hasSpecificLayout = 257;
  unsigned int v12 = (void *)MEMORY[0x1AD0DA230](v6);
  [(NSMutableArray *)complexVariantEvaluators addObject:v12];

  uint64_t v13 = self->_complexVariantActions;
  id v14 = (void *)MEMORY[0x1AD0DA230](v15);
  [(NSMutableArray *)v13 addObject:v14];
}

+ (id)descriptionForTypeEncoding:(const char *)a3 ivarName:(const char *)a4
{
  descriptionForTypeEncoding((unsigned __int8 *)a3, (uint64_t)a4);
  unsigned int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = v4;
  if (!v4) {
    unsigned int v4 = &stru_1EFE27F38;
  }
  id v6 = v4;

  return v6;
}

- (void)_setIsa:(unint64_t)a3
{
  self->_unint64_t remoteIsa = a3;
}

- (NSString)binaryName
{
  uint64_t v2 = [(NSString *)self->_remoteBinaryPath lastPathComponent];
  id v3 = v2;
  if (!v2) {
    uint64_t v2 = @"<unknown>";
  }
  unsigned int v4 = v2;

  return v4;
}

- (NSString)typeName
{
  signed int remoteType = self->_remoteType;
  if (remoteType > 15)
  {
    if (remoteType > 63)
    {
      if (remoteType != 64)
      {
        if (remoteType == 128) {
          return (NSString *)@"OSObj";
        }
        return (NSString *)@"<unknown>";
      }
    }
    else
    {
      if (remoteType == 16) {
        return (NSString *)@"C";
      }
      if (remoteType != 32) {
        return (NSString *)@"<unknown>";
      }
    }
    return (NSString *)@"Swift";
  }
  result = (NSString *)@"ObjC";
  switch(remoteType)
  {
    case 0:
      result = (NSString *)&stru_1EFE27F38;
      break;
    case 1:
      return result;
    case 2:
      result = (NSString *)@"C++";
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      return (NSString *)@"<unknown>";
    case 4:
      result = (NSString *)@"CFType";
      break;
    case 8:
      return (NSString *)@"Swift";
    default:
      if (remoteType != 0x80000000) {
        return (NSString *)@"<unknown>";
      }
      break;
  }
  return result;
}

- (unsigned)infoType
{
  return self->_remoteType;
}

- (NSString)fullIvarDescription
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__VMUClassInfo_fullIvarDescription__block_invoke;
  v6[3] = &unk_1E5D24218;
  id v4 = v3;
  id v7 = v4;
  [(VMUClassInfo *)self _logDescriptionWithSuperclasses:1 indentation:0 toLogger:v6];

  return (NSString *)v4;
}

uint64_t __35__VMUClassInfo_fullIvarDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@\n", a2];
}

- (NSString)shortIvarDescription
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__VMUClassInfo_shortIvarDescription__block_invoke;
  v6[3] = &unk_1E5D24218;
  id v4 = v3;
  id v7 = v4;
  [(VMUClassInfo *)self _logDescriptionWithSuperclasses:0 indentation:0 toLogger:v6];

  return (NSString *)v4;
}

uint64_t __36__VMUClassInfo_shortIvarDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@\n", a2];
}

- (id)scanDescriptionWithSize:(unsigned int)a3
{
  unint64_t v5 = [MEMORY[0x1E4F28E78] string];
  uint64_t v22 = 0;
  unsigned int v23 = &v22;
  uint64_t v24 = 0x2020000000;
  int v25 = 0;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  int v18 = __40__VMUClassInfo_scanDescriptionWithSize___block_invoke;
  int v19 = &unk_1E5D241C8;
  id v6 = v5;
  id v20 = v6;
  int v21 = &v22;
  [(VMUClassInfo *)self enumerateAllFieldsWithBlock:&v16];
  id v7 = v23;
  unsigned int superclassOffset = *((_DWORD *)v23 + 6);
  if (superclassOffset <= self->_superclassOffset) {
    unsigned int superclassOffset = self->_superclassOffset;
  }
  *((_DWORD *)v23 + 6) = superclassOffset;
  unsigned int remotePointerSize = self->_remotePointerSize;
  unsigned int v10 = remotePointerSize - 1;
  int v11 = -remotePointerSize;
  *((_DWORD *)v7 + 6) = (v10 + superclassOffset) & v11;
  unsigned int v12 = (self->_instanceSize + v10) & v11;
  *((_DWORD *)v7 + 6) = v12;
  if (v12 + 8 <= a3)
  {
    if ([v6 length]) {
      [v6 appendString:@"\n"];
    }
    uint64_t v13 = *((unsigned int *)v23 + 6);
    id v14 = VMUScanTypeScanDescription(self->_defaultScanType);
    [v6 appendFormat:@"%+*d: <extra space>[%u] (%s)", 3, v13, a3 - v13, v14, v16, v17, v18, v19];
  }

  _Block_object_dispose(&v22, 8);

  return v6;
}

void __40__VMUClassInfo_scanDescriptionWithSize___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v5 = a2;
  if ([*(id *)(a1 + 32) length]) {
    [*(id *)(a1 + 32) appendString:@"\n"];
  }
  id v3 = *(void **)(a1 + 32);
  id v4 = _formatIvar(v5, 3);
  [v3 appendString:v4];

  LODWORD(v4) = [(VMUFieldInfo *)v5 offset];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [(VMUFieldInfo *)v5 size] + v4;
}

- (id)debugDescription
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VMUClassInfo;
  id v4 = [(VMUClassInfo *)&v8 description];
  unint64_t v5 = [(VMUClassInfo *)self fullIvarDescription];
  id v6 = [v3 stringWithFormat:@"%@  %@", v4, v5];

  return v6;
}

- (id)description
{
  id v3 = NSString;
  if (self->_displayName)
  {
    id v4 = [(VMUClassInfo *)self displayName];
    unint64_t v5 = [(VMUClassInfo *)self className];
    id v6 = [(VMUClassInfo *)self type];
    id v7 = [(VMUClassInfo *)self binaryName];
    objc_super v8 = [v3 stringWithFormat:@"%@ (%@)  %@  %@", v4, v5, v6, v7];
  }
  else
  {
    id v4 = [(VMUClassInfo *)self className];
    unint64_t v5 = [(VMUClassInfo *)self type];
    id v6 = [(VMUClassInfo *)self binaryName];
    objc_super v8 = [v3 stringWithFormat:@"%@  %@  %@", v4, v5, v6];
  }

  id v9 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)VMUClassInfo;
  unsigned int v10 = [(VMUClassInfo *)&v13 description];
  int v11 = [v9 stringWithFormat:@"%@  %@", v10, v8];

  return v11;
}

- (BOOL)isARR
{
  return LOBYTE(self->_ro_flags) >> 7;
}

- (BOOL)isRealized
{
  return self->_rw_flags >> 31;
}

- (BOOL)isMetaClass
{
  return self->_ro_flags & 1;
}

- (BOOL)isRootClass
{
  return (LOBYTE(self->_ro_flags) >> 1) & 1;
}

- (BOOL)hasCppConstructorOrDestructor
{
  return (LOBYTE(self->_ro_flags) >> 2) & 1;
}

+ (unint64_t)sizeofClassStructure
{
  return 40;
}

- (unsigned)instanceSize
{
  return self->_instanceSize;
}

- (unint64_t)remoteIsa
{
  return self->_remoteIsa;
}

- (NSString)binaryPath
{
  return self->_remoteBinaryPath;
}

- (NSString)className
{
  return self->_remoteClassName;
}

- (VMUClassInfo)superclassInfo
{
  return self->_superclassLayout;
}

- (unsigned)pointerSize
{
  return self->_remotePointerSize;
}

- (BOOL)usesSwiftRefcounting
{
  return self->_usesSwiftRefcounting;
}

- (unsigned)ivarCount
{
  return self->_ivarCount;
}

- (unsigned)superclassOffset
{
  return self->_superclassOffset;
}

- (BOOL)isCoreMediaFigObject
{
  return self->_isCoreMediaFigObject;
}

- (BOOL)isDerivedFromStackBacktrace
{
  return self->_isDerivedFromStackBacktrace;
}

- (void)setIsDerivedFromStackBacktrace:(BOOL)a3
{
  self->_isDerivedFromStackBacktrace = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complexVariantActions, 0);
  objc_storeStrong((id *)&self->_complexVariantEvaluators, 0);
  objc_storeStrong((id *)&self->_variantActions, 0);
  objc_storeStrong((id *)&self->_variantEvaluators, 0);
  objc_storeStrong((id *)&self->_genericLayout, 0);
  objc_storeStrong((id *)&self->_superclassLayout, 0);
  objc_storeStrong((id *)&self->_remoteBinaryPath, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_remoteClassName, 0);
}

@end