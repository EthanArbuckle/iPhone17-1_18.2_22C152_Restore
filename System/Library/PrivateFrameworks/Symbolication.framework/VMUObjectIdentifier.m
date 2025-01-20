@interface VMUObjectIdentifier
- (BOOL)_dlopenLibSwiftRemoteMirror;
- (BOOL)_dlopenLibSwiftRemoteMirrorFromDir:(id)a3;
- (BOOL)_dlopenLibSwiftRemoteMirrorNearExecutable;
- (BOOL)_dlopenLibSwiftRemoteMirrorNearLibSwiftCore;
- (BOOL)_isValidInstanceLength:(unint64_t)a3 expectedLength:(unint64_t)a4;
- (BOOL)_remoteAddressIsOKtoRead:(unint64_t)a3;
- (BOOL)hasSwiftContent;
- (BOOL)hasSwiftReflection;
- (BOOL)isTaggedPointer:(void *)a3;
- (BOOL)taskIsDriverKit;
- (NSMutableDictionary)moduleNameToBinaryPathDict;
- (VMUAutoreleasePoolPageLayout)autoreleasePoolPageLayout;
- (VMUAutoreleasePoolPageLayout)createAutoreleasePoolPageLayout;
- (VMUClassInfoMap)realizedClasses;
- (VMUObjectIdentifier)initWithTask:(unsigned int)a3;
- (VMUObjectIdentifier)initWithTask:(unsigned int)a3 symbolicator:(_CSTypeRef)a4;
- (VMUObjectIdentifier)initWithTask:(unsigned int)a3 symbolicator:(_CSTypeRef)a4 scanner:(id)a5;
- (VMUObjectIdentifier)initWithVMUTask:(id)a3 symbolicator:(_CSTypeRef)a4 scanner:(id)a5;
- (VMURangeArray)readonlyRegionRanges;
- (VMUSwiftRuntimeInfo)swiftRuntimeInfoPreABI;
- (VMUSwiftRuntimeInfo)swiftRuntimeInfoStableABI;
- (VMUTaskMemoryScanner)scanner;
- (_CSTypeRef)_symbolicator;
- (_CSTypeRef)libobjcSymbolOwner;
- (_CSTypeRef)symbolForAddress:(unint64_t)a3;
- (_CSTypeRef)symbolicator;
- (_VMURange)vmRegionRangeForAddress:(unint64_t)a3;
- (id)_classInfoForMemory:(void *)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 remoteAddress:(unint64_t)a6;
- (id)_classInfoWithPthreadType:(id)a3;
- (id)_returnFaultedClass:(unint64_t)a3 ofType:(unsigned int)a4;
- (id)_scanner;
- (id)classInfoForCFTypeInstance:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)classInfoForMemory:(void *)a3 length:(unint64_t)a4;
- (id)classInfoForMemory:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)classInfoForNonobjectMemory:(void *)a3 length:(unint64_t)a4;
- (id)classInfoForObjCClassStructurePointerType:(unsigned int)a3;
- (id)classInfoForObjectWithRange:(_VMURange)a3;
- (id)classInfoWithNonobjectType:(id)a3 binaryPath:(id)a4;
- (id)classInfoWithNonobjectType:(id)a3 binaryPath:(id)a4 returnedClassInfoIndex:(unsigned int *)a5;
- (id)classNameForTaggedPointer:(void *)a3;
- (id)formattedDateLabel:(id)a3;
- (id)labelForCFBundle:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForClassDataExtRW:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForClassDataRO:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForClassDataRW:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForClassStructure:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForCoreMediaFigObject:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForItemCount:(int64_t)a3;
- (id)labelForMallocBlock:(_VMURange)a3;
- (id)labelForMallocBlock:(_VMURange)a3 usingHandlerBlock:(id)a4;
- (id)labelForMemory:(size_t)a3 length:(uint64_t)a4 remoteAddress:(void *)a5 classInfo:(void *)a6 usingHandlerBlock:;
- (id)labelForMemory:(void *)a3 length:(unint64_t)a4;
- (id)labelForMemory:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForMemory:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5 classInfo:(id)a6;
- (id)labelForNSArray:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSBundle:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSCFDictionary:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSCFSet:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSCFStringAtRemoteAddress:(unint64_t)a3 printDetail:(BOOL)a4;
- (id)labelForNSConcreteAttributedString:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSConcreteData:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSConcreteHashTable:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSConcreteMutableData:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSData:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSDate:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSDictionary:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSInlineData:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSNumber:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSPathStore2:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSSet:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSString:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSString:(void *)a3 mappedSize:(unint64_t)a4 remoteAddress:(unint64_t)a5 printDetail:(BOOL)a6;
- (id)labelForNSTaggedPointerStringCStringContainer:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSURL:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSXPCConnection:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForNSXPCInterface:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForOSDispatchMach:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForOSDispatchQueue:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForOSLog:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForOSTransaction:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForOSXPCActivity:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForOSXPCConnection:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForOSXPCDictionary:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForOSXPCObject:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForObjectOfClass:(id)a3 atOffset:(unsigned int)a4 ofObject:(void *)a5 withLength:(unint64_t)a6;
- (id)labelForProtocol:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForSwiftStringStorage:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForTaggedPointer:(void *)a3;
- (id)labelFor_NSActivityAssertion:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelFor_RBSAssertionDescriptor:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelFor__NSMallocBlock__:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)memoryReader;
- (id)noLabelForOSXPCObject:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)osMajorMinorVersionString;
- (id)symbolForRemoteAddress:(unint64_t)a3;
- (id)uniquifyStringLabel:(id)a3 stringType:(int)a4 printDetail:(BOOL)a5;
- (id)vmuTask;
- (int)_populateSwiftReflectionInfo:(SwiftReflectionInteropContext *)a3;
- (libSwiftRemoteMirrorWrapper)swiftMirror;
- (unint64_t)CFTypeCount;
- (unint64_t)ObjCclassCount;
- (unint64_t)SwiftClassCount;
- (unint64_t)addressOfSymbol:(const char *)a3 inLibrary:(const char *)a4;
- (unint64_t)countFromPointerInAutoreleasePool:(void *)a3;
- (unint64_t)figBaseObjectFinalizeAddress;
- (unint64_t)swiftConcurrencyDebugAsyncTaskMetadataIsa;
- (unint64_t)swiftConcurrencyDebugAsyncTaskSlabMetadataIsa;
- (unint64_t)taggedPointerMask;
- (unint64_t)translateIsaPointer:(unint64_t)a3;
- (unsigned)classInfoIndexForObjCClassStructurePointerType:(unsigned int)a3;
- (unsigned)objcABI;
- (unsigned)objectContentLevel;
- (unsigned)task;
- (void)_faultClass:(unint64_t)a3 ofType:(unsigned int)a4;
- (void)_findObjCAndSwiftClassesFromClass:(unint64_t)a3 recursionDepth:(unsigned int)a4;
- (void)_findOffsetsInOSXPCConnection:(void *)a3 length:(unint64_t)a4;
- (void)_generateClassInfosForObjCClassStructurePointerTypes;
- (void)_loadSwiftAsyncTaskAndSlabRecognitionInfo;
- (void)_populateSwiftABIVariables;
- (void)buildIsaToObjectLabelHandlerMap;
- (void)dealloc;
- (void)destroy_libSwiftRemoteMirror;
- (void)enumerateAllClassInfosWithBlock:(id)a3;
- (void)enumerateRealizedClassInfosWithBlock:(id)a3;
- (void)findCFTypes;
- (void)findCFTypes_version1;
- (void)findCFTypes_version2;
- (void)findFutureClasses;
- (void)findObjCAndSwiftClasses;
- (void)flushRemoteMirrorMemoryCache;
- (void)flushRemoteMirrorMemoryCacheEntryForAddress:(unint64_t)a3;
- (void)loadSwiftReflectionLibraries;
- (void)objectLabelHandlerForRemoteIsa:(void *)a1;
- (void)setObjectContentLevel:(unsigned int)a3;
- (void)setReadonlyRegionRanges:(id)a3;
- (void)setupIsaTranslator;
@end

@implementation VMUObjectIdentifier

- (unsigned)task
{
  return [(VMUTask *)self->_task taskPort];
}

- (id)vmuTask
{
  return self->_task;
}

- (VMUObjectIdentifier)initWithTask:(unsigned int)a3 symbolicator:(_CSTypeRef)a4
{
  return -[VMUObjectIdentifier initWithTask:symbolicator:scanner:](self, "initWithTask:symbolicator:scanner:", *(void *)&a3, a4._opaque_1, a4._opaque_2, 0);
}

- (VMUObjectIdentifier)initWithVMUTask:(id)a3 symbolicator:(_CSTypeRef)a4 scanner:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v82.receiver = self;
  v82.super_class = (Class)VMUObjectIdentifier;
  v10 = [(VMUObjectIdentifier *)&v82 init];
  if (v10)
  {
    v11 = +[VMUDebugTimer sharedTimerIfCreated];
    p_task = (id *)&v10->_task;
    objc_storeStrong((id *)&v10->_task, a3);
    v13 = [(VMUTask *)v10->_task memoryCache];
    v10->_taskIsDriverKit = [v13 isDriverKit];

    objc_storeWeak((id *)&v10->_scanner, v9);
    if (CSIsNull())
    {
      unsigned int FlagsForNListOnlyData = CSSymbolicatorGetFlagsForNListOnlyData();
      if ([v8 isExclave]) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = FlagsForNListOnlyData;
      }
      uint64_t v16 = [*p_task createSymbolicatorWithFlags:v15 andNotification:0];
    }
    else
    {
      uint64_t v16 = CSRetain();
    }
    v10->_symbolicator._opaque_1 = v16;
    v10->_symbolicator._opaque_2 = v17;
    if ([v8 isExclaveCore]) {
      uint64_t SymbolOwner = CSSymbolicatorGetSymbolOwner();
    }
    else {
      uint64_t SymbolOwner = CSSymbolicatorGetSymbolOwnerWithNameAtTime();
    }
    v10->_libobjcSymbolOwner._opaque_1 = SymbolOwner;
    v10->_libobjcSymbolOwner._opaque_2 = v19;
    v20 = objc_alloc_init(VMUClassInfoMap);
    realizedIsaToClassInfo = v10->_realizedIsaToClassInfo;
    v10->_realizedIsaToClassInfo = v20;

    uint64_t v22 = objc_opt_new();
    cfTypeIDToClassInfo = v10->_cfTypeIDToClassInfo;
    v10->_cfTypeIDToClassInfo = (VMUClassInfoMap *)v22;

    uint64_t v24 = objc_opt_new();
    coreMediaFigBaseClassToClassInfo = v10->_coreMediaFigBaseClassToClassInfo;
    v10->_coreMediaFigBaseClassToClassInfo = (VMUClassInfoMap *)v24;

    uint64_t v26 = [MEMORY[0x1E4F28D30] hashTableWithOptions:1282];
    nonObjectIsaHash = v10->_nonObjectIsaHash;
    v10->_nonObjectIsaHash = (NSHashTable *)v26;

    uint64_t v28 = objc_opt_new();
    pidToProcessNameDict = v10->_pidToProcessNameDict;
    v10->_pidToProcessNameDict = (NSMutableDictionary *)v28;

    uint64_t v30 = objc_opt_new();
    moduleNameToBinaryPathDict = v10->_moduleNameToBinaryPathDict;
    v10->_moduleNameToBinaryPathDict = (NSMutableDictionary *)v30;

    uint64_t v32 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:1282 valueOptions:0];
    itemCountToLabelStringUniquingMap = v10->_itemCountToLabelStringUniquingMap;
    v10->_itemCountToLabelStringUniquingMap = (NSMapTable *)v32;

    v10->_labelStringUniquingMaps = (id *)malloc_type_calloc(0x200uLL, 8uLL, 0x80040B8603338uLL);
    uint64_t v34 = objc_opt_new();
    labelStringUniquingMaps = v10->_labelStringUniquingMaps;
    id v36 = labelStringUniquingMaps[1];
    labelStringUniquingMaps[1] = (id)v34;

    v10->_stringTypeDescriptions = (id *)malloc_type_calloc(0x200uLL, 8uLL, 0x80040B8603338uLL);
    v37 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    stringUniquingSet = v10->_stringUniquingSet;
    v10->_stringUniquingSet = v37;

    v39 = [v9 memoryCache];
    if (v39 || ([*p_task memoryCache], (v39 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v80[0] = MEMORY[0x1E4F143A8];
      v80[1] = 3221225472;
      v80[2] = __60__VMUObjectIdentifier_initWithVMUTask_symbolicator_scanner___block_invoke;
      v80[3] = &unk_1E5D244C8;
      v40 = v39;
      v81 = v40;
      uint64_t v41 = MEMORY[0x1AD0DA230](v80);
      id memoryReader = v10->_memoryReader;
      v10->_id memoryReader = (id)v41;

      v10->_targetProcessContainsMallocStackLoggingLiteZone = 0;
      if ([v9 zoneCount])
      {
        uint64_t v43 = 0;
        do
        {
          v44 = [v9 zoneNameForIndex:v43];
          if ([v44 hasPrefix:@"MallocStackLoggingLiteZone"])
          {
            char v45 = [v44 hasPrefix:@"MallocStackLoggingLiteZone_Wrapper"];

            if ((v45 & 1) == 0)
            {
              v10->_targetProcessContainsMallocStackLoggingLiteZone = 1;
              break;
            }
          }
          else
          {
          }
          uint64_t v43 = (v43 + 1);
        }
        while (v43 < [v9 zoneCount]);
      }
      v10->_autoreleasePoolPageLayout = [(VMUObjectIdentifier *)v10 createAutoreleasePoolPageLayout];
      v10->_debugSwiftRemoteMirror = 0;
      v46 = getenv("SYMBOLICATION_DEBUG_SWIFT_REMOTE_MIRROR");
      if (v46)
      {
        v47 = v46;
        if (!strcmp(v46, "YES") || !strcmp(v47, "1")) {
          v10->_debugSwiftRemoteMirror = 1;
        }
      }
      v10->_swiftMirror = (libSwiftRemoteMirrorWrapper *)malloc_type_calloc(1uLL, 0x18uLL, 0x102004024DAA5DEuLL);
      uint64_t v48 = [(VMUObjectIdentifier *)v10 addressOfSymbol:"_objc_class_abi_version" inLibrary:"libobjc.A.dylib"];
      if (v48)
      {
        uint64_t v49 = v48;
        v50 = (uint64_t (**)(id, void, uint64_t))v10->_memoryReader;
        v51 = (unsigned int *)v50[2](v50, v49, 4);
        if (v51) {
          unsigned int v52 = *v51;
        }
        else {
          unsigned int v52 = 0;
        }

        v10->_objcABI = v52;
      }
      if (v11)
      {
        if ([v11 signpostID])
        {
          v53 = [v11 logHandle];
          uint64_t v54 = [v11 signpostID];
          if ((unint64_t)(v54 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v55 = v54;
            if (os_signpost_enabled(v53))
            {
              __int16 v79 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v53, OS_SIGNPOST_INTERVAL_END, v55, "initObjectIdentifier", "", (uint8_t *)&v79, 2u);
            }
          }
        }
        [v11 endEvent:"initObjectIdentifier"];
        [v11 startWithCategory:"initObjectIdentifier" message:"loadSwiftReflectionLibraries"];
        v56 = [v11 logHandle];
        uint64_t v57 = [v11 signpostID];
        if ((unint64_t)(v57 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v58 = v57;
          if (os_signpost_enabled(v56))
          {
            __int16 v79 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v56, OS_SIGNPOST_INTERVAL_BEGIN, v58, "initObjectIdentifier", "loadSwiftReflectionLibraries", (uint8_t *)&v79, 2u);
          }
        }
      }
      else
      {
        [0 endEvent:"initObjectIdentifier"];
        uint64_t v59 = [0 startWithCategory:"initObjectIdentifier" message:"loadSwiftReflectionLibraries"];
      }
      v60 = (void *)MEMORY[0x1AD0D9F90](v59);
      [(VMUObjectIdentifier *)v10 loadSwiftReflectionLibraries];
      [(VMUObjectIdentifier *)v10 _populateSwiftABIVariables];
      if (v11)
      {
        if ([v11 signpostID])
        {
          v61 = [v11 logHandle];
          uint64_t v62 = [v11 signpostID];
          if ((unint64_t)(v62 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v63 = v62;
            if (os_signpost_enabled(v61))
            {
              __int16 v79 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v61, OS_SIGNPOST_INTERVAL_END, v63, "initObjectIdentifier", "", (uint8_t *)&v79, 2u);
            }
          }
        }
        [v11 endEvent:"initObjectIdentifier"];
        [v11 startWithCategory:"initObjectIdentifier" message:"findCFTypes"];
        v64 = [v11 logHandle];
        uint64_t v65 = [v11 signpostID];
        if ((unint64_t)(v65 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v66 = v65;
          if (os_signpost_enabled(v64))
          {
            __int16 v79 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v64, OS_SIGNPOST_INTERVAL_BEGIN, v66, "initObjectIdentifier", "findCFTypes", (uint8_t *)&v79, 2u);
          }
        }
      }
      else
      {
        [0 endEvent:"initObjectIdentifier"];
        [0 startWithCategory:"initObjectIdentifier" message:"findCFTypes"];
      }
      v10->_figBaseObjectFinalizeAddress = [(VMUObjectIdentifier *)v10 addressOfSymbol:"_FigBaseObjectFinalize" inLibrary:"CoreMedia"];
      [(VMUObjectIdentifier *)v10 findCFTypes];
      if (v11)
      {
        if ([v11 signpostID])
        {
          v67 = [v11 logHandle];
          uint64_t v68 = [v11 signpostID];
          if ((unint64_t)(v68 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v69 = v68;
            if (os_signpost_enabled(v67))
            {
              __int16 v79 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v67, OS_SIGNPOST_INTERVAL_END, v69, "initObjectIdentifier", "", (uint8_t *)&v79, 2u);
            }
          }
        }
        [v11 endEvent:"initObjectIdentifier"];
        [v11 startWithCategory:"initObjectIdentifier" message:"findObjCAndSwiftClasses"];
        v70 = [v11 logHandle];
        uint64_t v71 = [v11 signpostID];
        if ((unint64_t)(v71 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v72 = v71;
          if (os_signpost_enabled(v70))
          {
            __int16 v79 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v70, OS_SIGNPOST_INTERVAL_BEGIN, v72, "initObjectIdentifier", "findObjCAndSwiftClasses", (uint8_t *)&v79, 2u);
          }
        }
      }
      else
      {
        [0 endEvent:"initObjectIdentifier"];
        [0 startWithCategory:"initObjectIdentifier" message:"findObjCAndSwiftClasses"];
      }
      [(VMUObjectIdentifier *)v10 setupIsaTranslator];
      [(VMUObjectIdentifier *)v10 findObjCAndSwiftClasses];
      [(VMUObjectIdentifier *)v10 findFutureClasses];
      v10->_cfBooleanTrueAddress = [(VMUObjectIdentifier *)v10 addressOfSymbol:"___kCFBooleanTrue" inLibrary:"CoreFoundation"];
      v10->_cfBooleanFalseAddress = [(VMUObjectIdentifier *)v10 addressOfSymbol:"___kCFBooleanFalse" inLibrary:"CoreFoundation"];
      if (v10->_taskIsDriverKit)
      {
        v73 = [[VMUObjectIdentifierDriverKitSupport alloc] initWithObjectIdentifier:v10];
        driverKitSupport = v10->_driverKitSupport;
        v10->_driverKitSupport = v73;
      }
      v10->_objectContentLevel = 1;
      if (v11 && [v11 signpostID])
      {
        v75 = [v11 logHandle];
        uint64_t v76 = [v11 signpostID];
        if ((unint64_t)(v76 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v77 = v76;
          if (os_signpost_enabled(v75))
          {
            __int16 v79 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v75, OS_SIGNPOST_INTERVAL_END, v77, "initObjectIdentifier", "", (uint8_t *)&v79, 2u);
          }
        }
      }
      [v11 endEvent:"initObjectIdentifier"];
    }
    else
    {
      v40 = v10;
      v10 = 0;
    }
  }
  return v10;
}

uint64_t __60__VMUObjectIdentifier_initWithVMUTask_symbolicator_scanner___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = 0;
  if ([*(id *)(a1 + 32) peekAtAddress:a2 size:a3 returnsBuf:&v4]) {
    return 0;
  }
  else {
    return v4;
  }
}

- (VMUObjectIdentifier)initWithTask:(unsigned int)a3 symbolicator:(_CSTypeRef)a4 scanner:(id)a5
{
  unint64_t opaque_2 = a4._opaque_2;
  unint64_t opaque_1 = a4._opaque_1;
  uint64_t v7 = *(void *)&a3;
  id v9 = a5;
  v10 = [[VMUTask alloc] initWithTask:v7];
  v11 = -[VMUObjectIdentifier initWithVMUTask:symbolicator:scanner:](self, "initWithVMUTask:symbolicator:scanner:", v10, opaque_1, opaque_2, v9);

  return v11;
}

- (void)dealloc
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [(VMUObjectIdentifier *)self destroy_libSwiftRemoteMirror];
  libSwiftRemoteMirrors = self->_libSwiftRemoteMirrors;
  if (libSwiftRemoteMirrors)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v4 = [(NSMutableDictionary *)libSwiftRemoteMirrors allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v24;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(v4);
          }
          dlclose((void *)[*(id *)(*((void *)&v23 + 1) + 8 * v8++) pointerValue]);
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v6);
    }

    id v9 = self->_libSwiftRemoteMirrors;
  }
  else
  {
    id v9 = 0;
  }
  self->_libSwiftRemoteMirrors = 0;

  CSRelease();
  self->_symbolicator._unint64_t opaque_1 = 0;
  self->_symbolicator._unint64_t opaque_2 = 0;
  if (self->_objCClassStructureClassInfos)
  {
    for (uint64_t i = 0; i != 13; ++i)
    {
      objCClassStructureClassInfos = self->_objCClassStructureClassInfos;
      id v12 = objCClassStructureClassInfos[i];
      objCClassStructureClassInfos[i] = 0;
    }
    free(self->_objCClassStructureClassInfos);
    self->_objCClassStructureClassInfos = 0;
  }
  objCClassStructureClassInfoIndexes = self->_objCClassStructureClassInfoIndexes;
  if (objCClassStructureClassInfoIndexes)
  {
    free(objCClassStructureClassInfoIndexes);
    self->_objCClassStructureClassInfoIndexes = 0;
  }
  for (uint64_t j = 0; j != 512; ++j)
  {
    labelStringUniquingMaps = self->_labelStringUniquingMaps;
    if (labelStringUniquingMaps)
    {
      id v16 = labelStringUniquingMaps[j];
      labelStringUniquingMaps[j] = 0;
    }
    stringTypeDescriptions = self->_stringTypeDescriptions;
    if (stringTypeDescriptions)
    {
      id v18 = stringTypeDescriptions[j];
      stringTypeDescriptions[j] = 0;
    }
  }
  unint64_t v19 = self->_labelStringUniquingMaps;
  if (v19)
  {
    free(v19);
    self->_labelStringUniquingMaps = 0;
  }
  v20 = self->_stringTypeDescriptions;
  if (v20)
  {
    free(v20);
    self->_stringTypeDescriptions = 0;
  }
  autoreleasePoolPageLayout = self->_autoreleasePoolPageLayout;
  if (autoreleasePoolPageLayout) {
    free(autoreleasePoolPageLayout);
  }
  v22.receiver = self;
  v22.super_class = (Class)VMUObjectIdentifier;
  [(VMUObjectIdentifier *)&v22 dealloc];
}

- (void)flushRemoteMirrorMemoryCache
{
  remoteAddressToLocalAddressAndSizeMap = self->_swiftMirrorReaderContext.remoteAddressToLocalAddressAndSizeMap;
  if (remoteAddressToLocalAddressAndSizeMap)
  {
    NSResetMapTable(remoteAddressToLocalAddressAndSizeMap);
    remoteStringToLengthMap = self->_swiftMirrorReaderContext.remoteStringToLengthMap;
    NSResetMapTable(remoteStringToLengthMap);
  }
}

- (void)flushRemoteMirrorMemoryCacheEntryForAddress:(unint64_t)a3
{
  NSMapRemove(self->_swiftMirrorReaderContext.remoteAddressToLocalAddressAndSizeMap, (const void *)a3);
  remoteStringToLengthMap = self->_swiftMirrorReaderContext.remoteStringToLengthMap;

  NSMapRemove(remoteStringToLengthMap, (const void *)a3);
}

- (unint64_t)CFTypeCount
{
  return self->_cfClassCount;
}

- (unint64_t)ObjCclassCount
{
  return self->_objCClassCount;
}

- (unint64_t)SwiftClassCount
{
  return self->_swiftClassCount;
}

- (void)enumerateRealizedClassInfosWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    realizedIsaToClassInfo = self->_realizedIsaToClassInfo;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__VMUObjectIdentifier_enumerateRealizedClassInfosWithBlock___block_invoke;
    v7[3] = &unk_1E5D249D8;
    id v8 = v4;
    [(VMUClassInfoMap *)realizedIsaToClassInfo enumerateInfosWithBlock:v7];
  }
}

uint64_t __60__VMUObjectIdentifier_enumerateRealizedClassInfosWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateAllClassInfosWithBlock:(id)a3
{
  id v4 = a3;
  if (!self->_unrealizedClassInfos)
  {
    uint64_t v5 = objc_alloc_init(VMUClassInfoMap);
    unrealizedClassInfos = self->_unrealizedClassInfos;
    self->_unrealizedClassInfos = v5;

    [(VMUObjectIdentifier *)self findObjCAndSwiftClasses];
  }
  [(VMUObjectIdentifier *)self enumerateRealizedClassInfosWithBlock:v4];
  if (v4)
  {
    uint64_t v7 = self->_unrealizedClassInfos;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__VMUObjectIdentifier_enumerateAllClassInfosWithBlock___block_invoke;
    v8[3] = &unk_1E5D249D8;
    id v9 = v4;
    [(VMUClassInfoMap *)v7 enumerateInfosWithBlock:v8];
  }
}

uint64_t __55__VMUObjectIdentifier_enumerateAllClassInfosWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)classInfoForObjectWithRange:(_VMURange)a3
{
  id v4 = 0;
  if (HIDWORD(a3.location))
  {
    unint64_t location = a3.location;
    if ((a3.location & 7) == 0)
    {
      if (a3.length >= 0x10) {
        a3.unint64_t location = 16;
      }
      else {
        a3.unint64_t location = a3.length;
      }
      id v4 = [(VMUObjectIdentifier *)self classInfoForMemory:(*((uint64_t (**)(id, unint64_t, unint64_t))self->_memoryReader + 2))(self->_memoryReader, location, a3.location) length:a3.length remoteAddress:location];
    }
  }

  return v4;
}

- (BOOL)_isValidInstanceLength:(unint64_t)a3 expectedLength:(unint64_t)a4
{
  if (((a4 + 15) & 0xFFFFFFFFFFFFFFF0) == a3) {
    return 1;
  }
  return self->_targetProcessContainsMallocStackLoggingLiteZone && ((a4 + 23) & 0xFFFFFFFFFFFFFFF0) == a3;
}

- (id)classInfoWithNonobjectType:(id)a3 binaryPath:(id)a4
{
  return [(VMUObjectIdentifier *)self classInfoWithNonobjectType:a3 binaryPath:a4 returnedClassInfoIndex:0];
}

- (id)classInfoWithNonobjectType:(id)a3 binaryPath:(id)a4 returnedClassInfoIndex:(unsigned int *)a5
{
  id v8 = a3;
  id v9 = a4;
  nonobjectClassInfosDict = self->_nonobjectClassInfosDict;
  if (!nonobjectClassInfosDict)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v12 = self->_nonobjectClassInfosDict;
    self->_nonobjectClassInfosDict = v11;

    nonobjectClassInfosDict = self->_nonobjectClassInfosDict;
  }
  v13 = [(NSMutableDictionary *)nonobjectClassInfosDict objectForKeyedSubscript:v8];
  if (!v13)
  {
    v13 = +[VMUClassInfo classInfoWithClassName:v8 binaryPath:v9 type:16];
    [(NSMutableDictionary *)self->_nonobjectClassInfosDict setObject:v13 forKeyedSubscript:v8];
    unsigned int v14 = [(VMUClassInfoMap *)self->_realizedIsaToClassInfo addClassInfo:v13 forAddress:0];
    if (a5) {
      *a5 = v14;
    }
  }

  return v13;
}

- (id)_classInfoWithPthreadType:(id)a3
{
  return [(VMUObjectIdentifier *)self classInfoWithNonobjectType:a3 binaryPath:@"/usr/lib/libpthread.dylib"];
}

- (void)_generateClassInfosForObjCClassStructurePointerTypes
{
  self->_objCClassStructureClassInfos = (id *)malloc_type_calloc(0xDuLL, 8uLL, 0x80040B8603338uLL);
  uint64_t v3 = 0;
  self->_objCClassStructureClassInfoIndexes = (unsigned int *)malloc_type_calloc(0xDuLL, 4uLL, 0x100004052888210uLL);
  id v4 = &off_1E973B778;
  do
  {
    if (*v4)
    {
      if (*((_DWORD *)v4 - 2) == 12) {
        uint64_t v5 = @"/usr/lib/swift/libswiftCore.dylib";
      }
      else {
        uint64_t v5 = @"/usr/lib/libobjc.A.dylib";
      }
      unsigned int v11 = 0;
      uint64_t v6 = [NSString stringWithUTF8String:];
      uint64_t v7 = [(VMUObjectIdentifier *)self classInfoWithNonobjectType:v6 binaryPath:v5 returnedClassInfoIndex:&v11];

      objCClassStructureClassInfos = self->_objCClassStructureClassInfos;
      id v9 = objCClassStructureClassInfos[v3];
      objCClassStructureClassInfos[v3] = v7;
      id v10 = v7;

      self->_objCClassStructureClassInfoIndexes[v3] = v11;
    }
    ++v3;
    v4 += 3;
  }
  while (v3 != 13);
}

- (unsigned)classInfoIndexForObjCClassStructurePointerType:(unsigned int)a3
{
  return self->_objCClassStructureClassInfoIndexes[a3];
}

- (id)classInfoForObjCClassStructurePointerType:(unsigned int)a3
{
  return self->_objCClassStructureClassInfos[a3];
}

- (id)classInfoForNonobjectMemory:(void *)a3 length:(unint64_t)a4
{
  int v6 = *(_DWORD *)a3;
  if (a4 >= 0x100
    && (v6 == -1583242847 && !strncmp((const char *)a3 + 4, "AUTORELEASE!", 0xCuLL)
     || a4 == 10240 && *((_DWORD *)a3 + 512) == -1583242847 && !strncmp((const char *)a3 + 2052, "AUTORELEASE!", 0xCuLL)))
  {
    id v8 = [(VMUObjectIdentifier *)self classInfoWithNonobjectType:@"@autoreleasepool content" binaryPath:@"/usr/lib/libobjc.A.dylib"];
    goto LABEL_44;
  }
  id v8 = 0;
  if (v6 > 1330529092)
  {
    if (v6 > 1414022208)
    {
      switch(v6)
      {
        case 1414022209:
          if ([(VMUObjectIdentifier *)self _isValidInstanceLength:a4 expectedLength:64])
          {
            id v9 = @"pthread_attr_t";
            goto LABEL_42;
          }
          break;
        case 1414025796:
          if ([(VMUObjectIdentifier *)self _isValidInstanceLength:a4 expectedLength:8])
          {
            id v9 = @"pthread_t";
            goto LABEL_42;
          }
          break;
        case 1870030194:
          if ([(VMUObjectIdentifier *)self _isValidInstanceLength:a4 expectedLength:40])
          {
            id v9 = @"pthread_override_s";
            goto LABEL_42;
          }
          break;
        default:
          goto LABEL_44;
      }
    }
    else
    {
      switch(v6)
      {
        case 1330529093:
          if ([(VMUObjectIdentifier *)self _isValidInstanceLength:a4 expectedLength:16])
          {
            id v9 = @"pthread_once_t";
            goto LABEL_42;
          }
          break;
        case 1381452865:
          if ([(VMUObjectIdentifier *)self _isValidInstanceLength:a4 expectedLength:24])
          {
            id v9 = @"pthread_rwlockattr_t";
            goto LABEL_42;
          }
          break;
        case 1381452875:
          if ([(VMUObjectIdentifier *)self _isValidInstanceLength:a4 expectedLength:200])
          {
            id v9 = @"pthread_rwlock_t";
LABEL_42:
            id v8 = [(VMUObjectIdentifier *)self _classInfoWithPthreadType:v9];
            goto LABEL_44;
          }
          break;
        default:
          goto LABEL_44;
      }
    }
    goto LABEL_43;
  }
  if (v6 <= 1297373248)
  {
    if (v6 == 1129202753)
    {
      if ([(VMUObjectIdentifier *)self _isValidInstanceLength:a4 expectedLength:16])
      {
        id v9 = @"pthread_condattr_t";
        goto LABEL_42;
      }
    }
    else
    {
      if (v6 != 1129270852) {
        goto LABEL_44;
      }
      if ([(VMUObjectIdentifier *)self _isValidInstanceLength:a4 expectedLength:48])
      {
        id v9 = @"pthread_cond_t";
        goto LABEL_42;
      }
    }
    goto LABEL_43;
  }
  if (v6 == 1297373249)
  {
    if ([(VMUObjectIdentifier *)self _isValidInstanceLength:a4 expectedLength:16])
    {
      id v9 = @"pthread_mutexattr_t";
      goto LABEL_42;
    }
LABEL_43:
    id v8 = 0;
    goto LABEL_44;
  }
  if (v6 == 1297437784 || v6 == 1297437786)
  {
    if ([(VMUObjectIdentifier *)self _isValidInstanceLength:a4 expectedLength:64])
    {
      id v9 = @"pthread_mutex_t";
      goto LABEL_42;
    }
    goto LABEL_43;
  }
LABEL_44:

  return v8;
}

- (id)classInfoForCFTypeInstance:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (a4 >= 0x10)
  {
    id v8 = [(VMUClassInfoMap *)self->_cfTypeIDToClassInfo classInfoForAddress:__CFGenericTypeID()];
    uint64_t v5 = v8;
    if (v8)
    {
      if ([v8 isCoreMediaFigObject])
      {
        uint64_t v9 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)self->_task, *((void *)a3 + 3));
        if (v9)
        {
          uint64_t v10 = v9;
          unsigned int v11 = [(VMUClassInfoMap *)self->_coreMediaFigBaseClassToClassInfo classInfoForAddress:v9];
          id v12 = v11;
          if (v11)
          {
            id v13 = v11;
          }
          else
          {
            uint64_t v40 = 0;
            unsigned int v14 = [(VMUTask *)self->_task memoryCache];
            int v15 = [v14 peekAtAddress:v10 size:16 returnsBuf:&v40];

            if (!v15)
            {
              if (v40)
              {
                if (-[VMUTask ptrauthStripDataPointer:]((uint64_t)self->_task, *(void *)(v40 + 8)))
                {
                  CSSymbolicatorGetSymbolWithAddressAtTime();
                  if ((CSIsNull() & 1) == 0)
                  {
                    uint64_t Name = CSSymbolGetName();
                    if (Name)
                    {
                      unint64_t v17 = (char *)Name;
                      v39 = [NSString stringWithUTF8String:Name];
                      if (*v17 == 107) {
                        id v18 = v17 + 1;
                      }
                      else {
                        id v18 = v17;
                      }
                      unint64_t v19 = strstr(v18, "_BaseClass");
                      if (!v19) {
                        unint64_t v19 = strstr(v18, "BaseClass");
                      }
                      v20 = [NSString stringWithUTF8String:v18];
                      v21 = v20;
                      if (v19)
                      {
                        uint64_t v22 = [v20 substringToIndex:v19 - v18];

                        v21 = (void *)v22;
                      }
                      long long v23 = [v5 className];
                      int v24 = [v23 isEqualToString:v21];

                      long long v25 = [v5 className];
                      long long v26 = v25;
                      if (v24)
                      {
                        printFigSubclassInfo(v25, &stru_1EFE27F38, v39);

                        [(VMUClassInfoMap *)self->_coreMediaFigBaseClassToClassInfo addClassInfo:v5 forAddress:v10];
                      }
                      else
                      {
                        int v27 = [v21 hasPrefix:v25];

                        if (v27)
                        {
                          uint64_t v28 = [v5 className];
                          uint64_t v29 = [v21 substringFromIndex:[v28 length]];

                          v21 = (void *)v29;
                        }
                        uint64_t v30 = [v5 className];
                        v31 = [v30 stringByAppendingFormat:@" (%@)", v21];

                        CSSymbolGetSymbolOwner();
                        uint64_t Path = CSSymbolOwnerGetPath();
                        if (Path) {
                          v33 = (const char *)Path;
                        }
                        else {
                          v33 = "<unknown>";
                        }
                        uint64_t v34 = [NSString stringWithUTF8String:v33];
                        v35 = +[VMUClassInfo classInfoWithClassName:v31 binaryPath:v34 type:4];

                        [v35 setIsCoreMediaFigObject:1];
                        id v36 = [v5 className];
                        printFigSubclassInfo(v36, v31, v39);

                        [(VMUClassInfoMap *)self->_coreMediaFigBaseClassToClassInfo addClassInfo:v35 forAddress:v10];
                        v21 = v31;
                        uint64_t v5 = v35;
                      }
                    }
                  }
                }
              }
            }
            id v13 = v5;
            uint64_t v5 = v13;
          }
          id v37 = v13;

          uint64_t v5 = v37;
        }
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)classInfoForMemory:(void *)a3 length:(unint64_t)a4
{
  return [(VMUObjectIdentifier *)self classInfoForMemory:a3 length:a4 remoteAddress:0];
}

- (id)_classInfoForMemory:(void *)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 remoteAddress:(unint64_t)a6
{
  task = self->_task;
  uint64_t v12 = *(void *)((char *)a3 + a5);
  isaTranslator = (uint64_t (**)(id, id, uint64_t))self->_isaTranslator;
  if (isaTranslator) {
    uint64_t v12 = isaTranslator[2](isaTranslator, self->_memoryReader, v12);
  }
  unint64_t v14 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)task, v12);
  int v15 = (const void *)v14;
  if (a5 || v14 != self->_coreFoundationCFTypeIsa)
  {
    if (HIDWORD(v14)) {
      BOOL v17 = (v14 & 7) == 0;
    }
    else {
      BOOL v17 = 0;
    }
    if (!v17) {
      goto LABEL_10;
    }
    id v16 = [(VMUClassInfoMap *)self->_realizedIsaToClassInfo classInfoForAddress:v14];
    if (v16)
    {
LABEL_17:
      if ([(VMUClassInfo *)v16 ivarCount]) {
        goto LABEL_18;
      }
      v21 = [(VMUClassInfo *)v16 className];
      if ([v21 isEqualToString:@"__SwiftValue"])
      {
      }
      else
      {
        uint64_t v22 = [(VMUClassInfo *)v16 className];
        int v23 = [v22 isEqualToString:@"_SwiftValue"];

        if (!v23)
        {
LABEL_18:
          if ([(VMUClassInfo *)v16 instanceSize] > a4)
          {

            id v16 = 0;
          }
          goto LABEL_20;
        }
      }
      int v24 = [VMUClassInfo alloc];
      long long v25 = [(VMUClassInfo *)v16 className];
      uint64_t v26 = [(VMUClassInfo *)v24 initSwiftClassWithName:v25 classInfoType:64 size:a4];

      id v16 = (VMUClassInfo *)v26;
      goto LABEL_11;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);
    int v20 = [WeakRetained addressIsInDataSegment:v15];

    if (!v20)
    {
LABEL_10:
      id v16 = 0;
      goto LABEL_11;
    }
    if (v15 == (const void *)self->_lastCPlusPlusIsa)
    {
      id v16 = self->_lastCPlusPlusClassInfo;
      if (!v16) {
        goto LABEL_11;
      }
      goto LABEL_17;
    }
    if (NSHashGet(self->_nonObjectIsaHash, v15)) {
      goto LABEL_61;
    }
    CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
    if (!CSSymbolOwnerUsesCPlusPlus()
      || (SymbolWithAddress = CSSymbolOwnerGetSymbolWithAddress(), uint64_t v29 = v28, (CSIsNull() & 1) != 0))
    {
LABEL_34:
      id v16 = 0;
      goto LABEL_35;
    }
    if (self->_taskIsDriverKit)
    {
      -[VMUObjectIdentifierDriverKitSupport classInfoForDriverKitMemory:length:atOffset:translatedIsa:symbol:](self->_driverKitSupport, "classInfoForDriverKitMemory:length:atOffset:translatedIsa:symbol:", a3, a4, a5, v15, SymbolWithAddress, v29);
      id v16 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue();
      if ([(VMUClassInfo *)v16 infoType] == 128) {
        [(VMUClassInfoMap *)self->_realizedIsaToClassInfo addClassInfo:v16 forAddress:v15];
      }
    }
    else
    {
      uint64_t Name = (const char *)CSSymbolGetName();
      id v16 = (VMUClassInfo *)Name;
      if (!Name) {
        goto LABEL_35;
      }
      if (strncmp(Name, "vtable for ", 0xBuLL)) {
        goto LABEL_34;
      }
      v42 = [NSString stringWithUTF8String:(char *)&v16->_remoteIsa + 3];
      v46 = VMUSimplifyCPlusPlusSymbolName(v42);

      uint64_t Path = CSSymbolOwnerGetPath();
      if (Path)
      {
        uint64_t v45 = NSString;
        v44 = [NSString stringWithUTF8String:CSSymbolOwnerGetPath()];
      }
      else
      {
        v44 = &stru_1EFE27F38;
      }
      +[VMUClassInfo classInfoWithClassName:binaryPath:type:](VMUClassInfo, "classInfoWithClassName:binaryPath:type:", v46, v44, 2, v45);
      id v16 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue();
      if (Path) {

      }
      [(VMUClassInfoMap *)self->_realizedIsaToClassInfo addClassInfo:v16 forAddress:v15];
    }
LABEL_35:
    if (!a5 && !v16)
    {
      if (![(VMUObjectIdentifier *)self hasSwiftContent]) {
        goto LABEL_60;
      }
      if (![(VMUObjectIdentifier *)self hasSwiftReflection])
      {
        id v16 = [[VMUClassInfo alloc] initSwiftClassWithName:0 classInfoType:64 size:a4];
        goto LABEL_59;
      }
      id v30 = objc_loadWeakRetained((id *)&self->_scanner);
      uint64_t v31 = [v30 validateAddressRangeForSwiftRemoteMirror:v15 allowUnusedSplitLibs:8];

      if (!v31)
      {
LABEL_60:
        NSHashInsert(self->_nonObjectIsaHash, v15);
LABEL_61:
        id v16 = 0;
LABEL_62:
        self->_lastCPlusPlusIsa = (unint64_t)v15;
        objc_storeStrong((id *)&self->_lastCPlusPlusClassInfo, v16);
        if (!v16) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
      uint64_t v51 = 0;
      uint64_t v32 = [(VMUTask *)self->_task memoryCache];
      [v32 readPointerAt:v15 value:&v51];

      id v16 = 0;
      if (v51 == 1024)
      {
        self->_swiftMirrorReaderContext.needToValidateAddressRange = 1;
        long long v49 = 0uLL;
        int v50 = 0;
        vmu_swift_reflection_infoForInstance((uint64_t)self->_swiftMirror->var0, a6, (uint64_t)&v49);
        id v16 = 0;
        if (v49 == 18)
        {
          if (_classInfoForMemory_length_atOffset_remoteAddress__onceToken != -1) {
            dispatch_once(&_classInfoForMemory_length_atOffset_remoteAddress__onceToken, &__block_literal_global_14);
          }
          id v33 = objc_loadWeakRetained((id *)&self->_scanner);
          uint64_t v34 = [v33 memoryCache];
          char HaveGenericCaptures = closureContextMayHaveGenericCaptures((uint64_t)v15, v34);

          if ((HaveGenericCaptures & 1) != 0
            || (id v36 = [VMUMutableClassInfo alloc],
                realizedIsaToClassInfo = self->_realizedIsaToClassInfo,
                swiftMirror = self->_swiftMirror,
                long long v47 = v49,
                int v48 = v50,
                (uint64_t v39 = [(VMUClassInfo *)v36 initWithClosureContext:a6 typeInfo:&v47 infoMap:realizedIsaToClassInfo swiftFieldMetadataContext:swiftMirror]) == 0))
          {
            id v16 = (VMUClassInfo *)(id)_classInfoForMemory_length_atOffset_remoteAddress__closureContextWithUnknownLayoutClassInfo;
          }
          else
          {
            id v16 = (VMUClassInfo *)v39;
            id v40 = objc_loadWeakRetained((id *)&self->_scanner);
            [v40 applyTypeOverlayToMutableInfo:v16];
          }
          [(VMUClassInfoMap *)self->_realizedIsaToClassInfo addClassInfo:v16 forAddress:v15];
        }
        self->_swiftMirrorReaderContext.needToValidateAddressRange = 0;
      }
      VMUClearCrashReporterInfo();
    }
LABEL_59:
    if (v16) {
      goto LABEL_62;
    }
    goto LABEL_60;
  }
  id v16 = [(VMUObjectIdentifier *)self classInfoForCFTypeInstance:a3 length:a4 remoteAddress:a6];
LABEL_11:
  if (!a5 && !v16)
  {
    id v16 = [(VMUObjectIdentifier *)self classInfoForNonobjectMemory:a3 length:a4];
  }
  if (v16) {
    goto LABEL_18;
  }
LABEL_20:

  return v16;
}

void __73__VMUObjectIdentifier__classInfoForMemory_length_atOffset_remoteAddress___block_invoke()
{
  v0 = [[VMUClassInfo alloc] initWithClassName:@"Closure context (unknown layout)" binaryPath:0 type:64];
  v1 = (void *)_classInfoForMemory_length_atOffset_remoteAddress__closureContextWithUnknownLayoutClassInfo;
  _classInfoForMemory_length_atOffset_remoteAddress__closureContextWithUnknownLayoutClassInfo = (uint64_t)v0;
}

- (id)classInfoForMemory:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if ((unint64_t)a3 >> 32)
  {
    id v8 = 0;
    if (a4 >= 8 && (a3 & 7) == 0)
    {
      id v8 = [(VMUObjectIdentifier *)self _classInfoForMemory:a3 length:a4 atOffset:0 remoteAddress:a5];
      if (!v8)
      {
        if (self->_taskIsDriverKit)
        {
          id v8 = [(VMUObjectIdentifierDriverKitSupport *)self->_driverKitSupport driverKitClassInfoForMemory:a3 length:a4 remoteAddress:a5];
        }
        else
        {
          id v8 = 0;
        }
      }
    }
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)_returnFaultedClass:(unint64_t)a3 ofType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (a4 == 4) {
    realizedIsaToClassInfo = 0;
  }
  else {
    realizedIsaToClassInfo = self->_realizedIsaToClassInfo;
  }
  id v8 = realizedIsaToClassInfo;
  uint64_t v9 = [(VMUClassInfoMap *)v8 classInfoForAddress:a3];
  if (!v9)
  {
    if (v4 != 1
      || (unrealizedClassInfos = self->_unrealizedClassInfos) == 0
      || ([(VMUClassInfoMap *)unrealizedClassInfos classInfoForAddress:a3],
          (uint64_t v9 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v9 = [[VMUClassInfo alloc] initWithRealizedClass:a3 type:v4 infoMap:v8 objectIdentifier:self reader:self->_memoryReader];
      if (!v9 && v4 == 1 && self->_unrealizedClassInfos) {
        uint64_t v9 = [[VMUClassInfo alloc] initWithClass:a3 type:1 infoMap:self->_unrealizedClassInfos objectIdentifier:self reader:self->_memoryReader];
      }
      if ([(VMUClassInfo *)v9 infoType] == 1)
      {
        if (self->_coreFoundationCFTypeIsa
          || ([(VMUClassInfo *)v9 className],
              id v13 = objc_claimAutoreleasedReturnValue(),
              int v14 = [v13 isEqualToString:@"__NSCFType"],
              v13,
              !v14))
        {
          ++self->_objCClassCount;
        }
        else
        {
          self->_coreFoundationCFTypeIsa = a3;
        }
      }
      else if ([(VMUClassInfo *)v9 infoType] == 8)
      {
        ++self->_swiftClassCount;
      }
      else if ([(VMUClassInfo *)v9 infoType] == 4)
      {
        ++self->_cfClassCount;
      }
    }
  }
  uint64_t v10 = v9;

  return v10;
}

- (void)_faultClass:(unint64_t)a3 ofType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v7 = (void *)MEMORY[0x1AD0D9F90](self, a2);
  id v8 = [(VMUObjectIdentifier *)self _returnFaultedClass:a3 ofType:v4];
}

- (void)findCFTypes_version1
{
  if ([(VMUTask *)self->_task isExclaveCore]) {
    uint64_t SymbolOwner = CSSymbolicatorGetSymbolOwner();
  }
  else {
    uint64_t SymbolOwner = CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  }
  uint64_t v5 = SymbolOwner;
  uint64_t v6 = v4;
  int v13 = 0;
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"___CFRuntimeClassTableCount", SymbolOwner, v4, 4uLL, &v13);
  if (v13)
  {
    uint64_t v7 = _map_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"___CFRuntimeClassTables", v5, v6, 8 * v13);
    if (!v7) {
      uint64_t v7 = _map_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"___CFRuntimeClassTable", v5, v6, 8 * v13);
    }
    if (v7)
    {
      int v8 = v13;
      if (v13 >= 1)
      {
        uint64_t v9 = 0;
        do
        {
          uint64_t v10 = *(void *)(v7 + 8 * v9);
          if (v10)
          {
            unsigned int v11 = (void *)MEMORY[0x1AD0D9F90]();
            uint64_t v12 = [(VMUObjectIdentifier *)self _returnFaultedClass:v10 ofType:4];
            [(VMUClassInfoMap *)self->_cfTypeIDToClassInfo addClassInfo:v12 forAddress:v9];
            [(VMUClassInfoMap *)self->_realizedIsaToClassInfo addClassInfo:v12 forAddress:v10];

            int v8 = v13;
          }
          ++v9;
        }
        while (v9 < v8);
      }
    }
  }
}

- (void)findCFTypes_version2
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__VMUObjectIdentifier_findCFTypes_version2__block_invoke;
  v11[3] = &unk_1E5D24A00;
  v11[4] = self;
  uint64_t v3 = (void *)MEMORY[0x1AD0DA230](v11, a2);
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  int v10 = 0;
  task = self->_task;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__VMUObjectIdentifier_findCFTypes_version2__block_invoke_2;
  v6[3] = &unk_1E5D24A50;
  v6[4] = self;
  id v5 = v3;
  id v7 = v5;
  int v8 = v9;
  withPeekFunctionForVMUTask(task, v6);

  _Block_object_dispose(v9, 8);
}

uint64_t __43__VMUObjectIdentifier_findCFTypes_version2__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) isExclaveCore]) {
    CSSymbolicatorGetSymbolOwner();
  }
  else {
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  }
  CSSymbolOwnerGetSymbolWithName();

  return CSSymbolGetRange();
}

uint64_t __43__VMUObjectIdentifier_findCFTypes_version2__block_invoke_2(void *a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *))_vmu__CFRuntimeEnumerateClassTable;
  uint64_t v5 = [*(id *)(a1[4] + 8) taskPort];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__VMUObjectIdentifier_findCFTypes_version2__block_invoke_3;
  void v9[3] = &unk_1E5D24A28;
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  v9[4] = a1[4];
  v9[5] = v7;
  return v4(v5, v6, a2, v9);
}

void __43__VMUObjectIdentifier_findCFTypes_version2__block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v4 = (void *)MEMORY[0x1AD0D9F90]();
    uint64_t v5 = [*(id *)(a1 + 32) _returnFaultedClass:a2 ofType:4];
    if (v5)
    {
      [*(id *)(*(void *)(a1 + 32) + 208) addClassInfo:v5 forAddress:*(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
      [*(id *)(*(void *)(a1 + 32) + 192) addClassInfo:v5 forAddress:a2];
    }
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (void)findCFTypes
{
  if (findCFTypes_onceToken != -1) {
    dispatch_once(&findCFTypes_onceToken, &__block_literal_global_116_0);
  }
  if (_vmu__CFRuntimeEnumerateClassTable)
  {
    [(VMUObjectIdentifier *)self findCFTypes_version2];
  }
  else
  {
    [(VMUObjectIdentifier *)self findCFTypes_version1];
  }
}

void *__34__VMUObjectIdentifier_findCFTypes__block_invoke()
{
  result = dlopen("/System/Library/Frameworks/CoreFoundation.framework/CoreFoundation", 1);
  if (result)
  {
    v1 = result;
    _vmu__CFRuntimeEnumerateClassTable = dlsym(result, "__CFRuntimeEnumerateClassTable");
    return (void *)dlclose(v1);
  }
  return result;
}

- (void)_findObjCAndSwiftClassesFromClass:(unint64_t)a3 recursionDepth:(unsigned int)a4
{
  if (a3)
  {
    uint64_t SiblingOfClass = a3;
    uint64_t v6 = a4 + 1;
    do
    {
      if ((VMUIsMetaclass(self->_task, self->_memoryReader, self->_objcABI, SiblingOfClass) & 1) == 0)
      {
        uint64_t v7 = [(VMUClassInfoMap *)self->_realizedIsaToClassInfo classInfoForAddress:SiblingOfClass];

        if (v7) {
          return;
        }
        [(VMUObjectIdentifier *)self _faultClass:SiblingOfClass ofType:1];
        uint64_t SubclassOfClass = VMUGetFirstSubclassOfClass(self->_task, self->_memoryReader, self->_objcABI, SiblingOfClass);
        if (SubclassOfClass) {
          [(VMUObjectIdentifier *)self _findObjCAndSwiftClassesFromClass:SubclassOfClass recursionDepth:v6];
        }
      }
      uint64_t SiblingOfClass = VMUGetNextSiblingOfClass(self->_task, self->_memoryReader, self->_objcABI, SiblingOfClass);
    }
    while (SiblingOfClass);
  }
}

- (void)findObjCAndSwiftClasses
{
  [(VMUObjectIdentifier *)self addressOfSymbol:"_firstRealizedClass" inLibrary:"libobjc.A.dylib"];
  uint64_t v3 = (uint64_t *)(*((uint64_t (**)(void))self->_memoryReader + 2))();
  if (v3)
  {
    for (uint64_t i = *v3; i; uint64_t i = VMUGetNextSiblingOfClass(self->_task, self->_memoryReader, self->_objcABI, i))
      [(VMUObjectIdentifier *)self _findObjCAndSwiftClassesFromClass:i recursionDepth:0];
  }
  if ([(VMUTask *)self->_task isExclaveCore])
  {
    CSSymbolicatorGetSymbolOwner();
    uint64_t Path = CSSymbolOwnerGetPath();
    if (Path) {
      uint64_t v6 = (const char *)Path;
    }
    else {
      uint64_t v6 = "<unknown>";
    }
    uint64_t v7 = [VMUClassInfo alloc];
    int v8 = [NSString stringWithUTF8String:v6];
    uint64_t v9 = [(VMUClassInfo *)v7 initWithClassName:@"NSBlock" binaryPath:v8 type:1];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__VMUObjectIdentifier_findObjCAndSwiftClasses__block_invoke;
    v12[3] = &unk_1E5D24A78;
    int v13 = v9;
    int v14 = v6;
    v12[4] = self;
    int v10 = v9;
    unsigned int v11 = (void (**)(void, void, void))MEMORY[0x1AD0DA230](v12);
    ((void (**)(void, const char *, __CFString *))v11)[2](v11, "__NSConcreteStackBlock", @"__NSStackBlock__");
    ((void (**)(void, const char *, __CFString *))v11)[2](v11, "__NSConcreteMallocBlock", @"__NSMallocBlock__");
    ((void (**)(void, const char *, __CFString *))v11)[2](v11, "__NSConcreteGlobalBlock", @"__NSGlobalBlock__");
    ((void (**)(void, const char *, __CFString *))v11)[2](v11, "__NSConcreteWeakBlockVariable", @"__NSWeakBlockVariable__");
  }
}

void __46__VMUObjectIdentifier_findObjCAndSwiftClasses__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) addressOfSymbol:a2 inLibrary:"libclosure.dylib"];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = [VMUMutableClassInfo alloc];
    int v8 = [NSString stringWithUTF8String:*(void *)(a1 + 48)];
    uint64_t v9 = [(VMUClassInfo *)v7 initWithClassName:v10 binaryPath:v8 type:1];

    [(VMUMutableClassInfo *)v9 setSuperclassInfo:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 192) addClassInfo:v9 forAddress:v6];
    ++*(void *)(*(void *)(a1 + 32) + 256);
  }
}

- (void)findFutureClasses
{
  uint64_t v8 = 0;
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"__ZL22future_named_class_map", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 8uLL, &v8);
  if (v8)
  {
    uint64_t v3 = (*((uint64_t (**)(void))self->_memoryReader + 2))();
    if (v3)
    {
      if (*(_DWORD *)(v3 + 8))
      {
        uint64_t v4 = (*(_DWORD *)(v3 + 12) + 1);
        uint64_t v5 = (*((uint64_t (**)(id, void, uint64_t))self->_memoryReader + 2))(self->_memoryReader, *(void *)(v3 + 16), 16 * v4);
        if (v5 && v4 != 0)
        {
          uint64_t v7 = (void *)(v5 + 8);
          do
          {
            if (*(v7 - 1) != -1) {
              [(VMUObjectIdentifier *)self _faultClass:*v7 ofType:8];
            }
            v7 += 2;
            --v4;
          }
          while (v4);
        }
      }
    }
  }
}

- (VMUAutoreleasePoolPageLayout)createAutoreleasePoolPageLayout
{
  uint64_t v3 = (VMUAutoreleasePoolPageLayout *)malloc_type_calloc(1uLL, 0x20uLL, 0x1000040244176AFuLL);
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_autoreleasepoolpage_next_offset", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 4uLL, v3);
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_autoreleasepoolpage_parent_offset", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 4uLL, &v3->var1);
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_autoreleasepoolpage_begin_offset", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 4uLL, &v3->var2);
  if (!v3->var2) {
    v3->var2 = 56;
  }
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_autoreleasepoolpage_ptr_mask", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 8uLL, &v3->var3);
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_autoreleasepoolpage_child_offset", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 4uLL, &v3->var4);
  return v3;
}

- (void)setupIsaTranslator
{
  uint64_t v32 = 0;
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_indexed_isa_magic_mask", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 8uLL, &v32);
  uint64_t v31 = 0;
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_indexed_isa_magic_value", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 8uLL, &v31);
  uint64_t v30 = 0;
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_indexed_isa_index_mask", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 8uLL, &v30);
  uint64_t v29 = 0;
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_indexed_isa_index_shift", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 8uLL, &v29);
  CSSymbolOwnerGetSymbolWithMangledName();
  uint64_t Range = CSSymbolGetRange();
  uint64_t v28 = 0;
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_indexed_classes_count", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 8uLL, &v28);
  uint64_t v27 = 0;
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_isa_class_mask", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 8uLL, &v27);
  uint64_t v26 = 0;
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_isa_magic_mask", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 8uLL, &v26);
  uint64_t v25 = 0;
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_isa_magic_value", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 8uLL, &v25);
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_taggedpointer_mask", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 8uLL, &self->_taggedPointerMask);
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_taggedpointer_obfuscator", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 8uLL, &self->_taggedPointerObfuscator);
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_tag60_permutations", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 8uLL, self->_taggedPointerPermutations);
  uint64_t v4 = self->_task;
  uint64_t v5 = v4;
  uint64_t v6 = v32;
  if (v32 && (v7 = v31) != 0 && (uint64_t v8 = v30) != 0 && (v9 = v29) != 0 && Range && (v10 = v28) != 0)
  {
    self->_fragileNonPointerIsas = 1;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __41__VMUObjectIdentifier_setupIsaTranslator__block_invoke;
    v24[3] = &__block_descriptor_88_e20_Q24__0____v__QQ_8Q16l;
    v24[4] = v27;
    v24[5] = v8;
    v24[6] = v6;
    v24[7] = v7;
    v24[8] = v9;
    v24[9] = v10;
    v24[10] = Range;
    unsigned int v11 = (void *)MEMORY[0x1AD0DA230](v24);
    id isaTranslator = self->_isaTranslator;
    self->_id isaTranslator = v11;
  }
  else if (v27 && v26)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __41__VMUObjectIdentifier_setupIsaTranslator__block_invoke_2;
    v19[3] = &unk_1E5D24AC0;
    uint64_t v21 = v27;
    uint64_t v22 = v26;
    uint64_t v23 = v25;
    int v20 = v4;
    int v13 = (void *)MEMORY[0x1AD0DA230](v19);
    id v14 = self->_isaTranslator;
    self->_id isaTranslator = v13;

    id isaTranslator = v20;
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __41__VMUObjectIdentifier_setupIsaTranslator__block_invoke_3;
    v17[3] = &unk_1E5D24AE8;
    id v18 = v4;
    int v15 = (void *)MEMORY[0x1AD0DA230](v17);
    id v16 = self->_isaTranslator;
    self->_id isaTranslator = v15;

    id isaTranslator = v18;
  }
}

unint64_t __41__VMUObjectIdentifier_setupIsaTranslator__block_invoke(void *a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if ((a3 & ~a1[4]) != 0)
  {
    uint64_t v7 = a1[5];
    if ((a3 & ~v7) != 0)
    {
      if ((a1[6] & a3) == a1[7]
        && (unint64_t v8 = (v7 & a3) >> a1[8], v8 <= a1[9])
        && (uint64_t v9 = (unint64_t *)(*((uint64_t (**)(id, unint64_t, uint64_t))v5 + 2))(v5, a1[10] + 8 * v8, 8)) != 0)
      {
        a3 = *v9;
      }
      else
      {
        a3 = 0;
      }
    }
  }

  return a3;
}

uint64_t __41__VMUObjectIdentifier_setupIsaTranslator__block_invoke_2(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a1[5];
  if ((a3 & ~v3) == 0) {
    return a3;
  }
  if ((a1[6] & a3) == a1[7]) {
    return v3 & a3;
  }
  return -[VMUTask ptrauthStripDataPointer:](a1[4], a3);
}

uint64_t __41__VMUObjectIdentifier_setupIsaTranslator__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[VMUTask ptrauthStripDataPointer:](*(void *)(a1 + 32), a3);
}

- (unint64_t)translateIsaPointer:(unint64_t)a3
{
  id isaTranslator = (uint64_t (**)(id, id, unint64_t))self->_isaTranslator;
  if (isaTranslator) {
    return isaTranslator[2](isaTranslator, self->_memoryReader, a3);
  }
  else {
    return a3;
  }
}

- (_VMURange)vmRegionRangeForAddress:(unint64_t)a3
{
  targetProcessVMranges = self->_targetProcessVMranges;
  if (!targetProcessVMranges)
  {
    task_find_all_malloc_regions(self->_task);
    uint64_t v6 = (VMUNonOverlappingRangeArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = self->_targetProcessVMranges;
    self->_targetProcessVMranges = v6;

    targetProcessVMranges = self->_targetProcessVMranges;
  }
  uint64_t v8 = [(VMURangeArray *)targetProcessVMranges rangeForLocation:a3];
  unint64_t v10 = v9;
  if (!v9)
  {
    unint64_t v18 = a3;
    unint64_t v17 = 0;
    int v16 = 9999;
    unsigned int v11 = [(VMUTask *)self->_task memoryCache];
    int v12 = [v11 machVMRegionRecurseSubmapShortInfo64onAddress:&v18 size:&v17 nestingDepth:&v16 info:&v15];

    if (!v12)
    {
      uint64_t v8 = v18;
      unint64_t v10 = v17;
      -[VMUNonOverlappingRangeArray mergeRange:](self->_targetProcessVMranges, "mergeRange:", v18, v17);
    }
  }
  unint64_t v13 = v8;
  unint64_t v14 = v10;
  result.length = v14;
  result.unint64_t location = v13;
  return result;
}

- (unint64_t)addressOfSymbol:(const char *)a3 inLibrary:(const char *)a4
{
  if ([(VMUTask *)self->_task isExclaveCore]) {
    CSSymbolicatorGetSymbolOwner();
  }
  else {
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  }
  if (*a3 != 95 || (CSSymbolOwnerGetSymbolWithMangledName(), CSIsNull())) {
    CSSymbolOwnerGetSymbolWithName();
  }

  return CSSymbolGetRange();
}

- (_CSTypeRef)symbolForAddress:(unint64_t)a3
{
  unint64_t SymbolWithAddressAtTime = CSSymbolicatorGetSymbolWithAddressAtTime();
  result._unint64_t opaque_2 = v4;
  result._unint64_t opaque_1 = SymbolWithAddressAtTime;
  return result;
}

- (id)osMajorMinorVersionString
{
  return &stru_1EFE27F38;
}

- (void)buildIsaToObjectLabelHandlerMap
{
  uint64_t v3 = (void *)MEMORY[0x1AD0D9F90](self, a2);
  unint64_t v4 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:514 valueOptions:0];
  isaToObjectLabelHandlerMap = self->_isaToObjectLabelHandlerMap;
  self->_isaToObjectLabelHandlerMap = v4;

  uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.Symbolication"];
  uint64_t v7 = [(VMUObjectIdentifier *)self osMajorMinorVersionString];
  uint64_t v8 = [NSString stringWithFormat:@"%@-%@", @"VMUObjectLabelHandlers", v7];
  unint64_t v9 = [v6 pathForResource:v8 ofType:@"plist"];
  if (v9
    || ([v6 pathForResource:@"VMUObjectLabelHandlers" ofType:@"plist"],
        (unint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v9];
    if (v10)
    {
      unsigned int v11 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:514];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __54__VMUObjectIdentifier_buildIsaToObjectLabelHandlerMap__block_invoke;
      v18[3] = &unk_1E5D24B10;
      id v12 = v11;
      id v19 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:v18];
      realizedIsaToClassInfo = self->_realizedIsaToClassInfo;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __54__VMUObjectIdentifier_buildIsaToObjectLabelHandlerMap__block_invoke_2;
      v15[3] = &unk_1E5D24B38;
      id v16 = v12;
      unint64_t v17 = self;
      id v14 = v12;
      [(VMUClassInfoMap *)realizedIsaToClassInfo enumerateInfosWithBlock:v15];
    }
    else
    {
      NSLog(&cfstr_SymbolicationC_0.isa, v9);
    }
  }
  else
  {
    NSLog(&cfstr_SymbolicationC.isa, @"VMUObjectLabelHandlers");
  }
}

void __54__VMUObjectIdentifier_buildIsaToObjectLabelHandlerMap__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a2 stringByAppendingString:@"length:remoteAddress:"];
  SEL v7 = NSSelectorFromString(v6);
  if (v7)
  {
    SEL v8 = v7;
    unint64_t v9 = [v5 objectForKey:@"Classes"];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          [*(id *)(a1 + 32) objectForKey:v14];
          [*(id *)(a1 + 32) setObject:v8 forKey:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

void __54__VMUObjectIdentifier_buildIsaToObjectLabelHandlerMap__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v11 = v5;
    uint64_t v6 = [v5 className];
    uint64_t v7 = [*(id *)(a1 + 32) objectForKey:v6];
    if (v7)
    {
      SEL v8 = (const char *)v7;
      if ([v11 infoType] == 1)
      {
        Class Class = objc_getClass((const char *)[v6 UTF8String]);
        if (Class) {
          goto LABEL_7;
        }
      }
      if ([v11 infoType] != 1)
      {
        Class Class = 0;
LABEL_7:
        uint64_t v10 = objc_alloc_init(VMUObjectLabelHandlerInfo);
        objc_storeStrong((id *)&v10->_className, v6);
        v10->_localClass Class = Class;
        v10->_handlerSelector = v8;
        [*(id *)(*(void *)(a1 + 40) + 320) setObject:v10 forKey:a2];
      }
    }

    id v5 = v11;
  }
}

- (void)objectLabelHandlerForRemoteIsa:(void *)a1
{
  if (a1)
  {
    unint64_t v4 = a1;
    id v5 = (void *)a1[40];
    if (!v5)
    {
      [v4 buildIsaToObjectLabelHandlerMap];
      id v5 = (void *)v4[40];
    }
    a1 = [v5 objectForKey:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (BOOL)_remoteAddressIsOKtoRead:(unint64_t)a3
{
  unsigned int objectContentLevel = self->_objectContentLevel;
  if (objectContentLevel == 3) {
    return 1;
  }
  if (objectContentLevel == 2) {
    return [(VMURangeArray *)self->_readonlyRegionRanges containsLocation:a3];
  }
  return 0;
}

- (id)labelForTaggedPointer:(void *)a3
{
  if (self->_objectContentLevel != 3 || !-[VMUObjectIdentifier isTaggedPointer:](self, "isTaggedPointer:"))
  {
LABEL_14:
    uint64_t v10 = 0;
    goto LABEL_15;
  }
  uint64_t v5 = 0;
  unint64_t taggedPointerObfuscator = self->_taggedPointerObfuscator;
  if ((~(unint64_t)a3 & 0xC000000000000007) == 0) {
    unint64_t taggedPointerObfuscator = 0;
  }
  unint64_t v7 = taggedPointerObfuscator ^ (unint64_t)a3;
  do
  {
    if ((v7 & 7) == self->_taggedPointerPermutations[v5]) {
      break;
    }
    ++v5;
  }
  while (v5 != 7);
  unint64_t v8 = v5 | v7 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v9 = *MEMORY[0x1E4FBA8E0] ^ v8;
  if ((~v9 & 0xC000000000000007) != 0) {
    unint64_t v8 = v9 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v9 & 7));
  }
  switch(v5)
  {
    case 6:
      uint64_t v10 = [(VMUObjectIdentifier *)self labelForNSDate:v8 length:0 remoteAddress:0];
      break;
    case 3:
      uint64_t v10 = [(VMUObjectIdentifier *)self labelForNSNumber:v8 length:0 remoteAddress:0];
      break;
    case 2:
      uint64_t v10 = [(VMUObjectIdentifier *)self uniquifyStringLabel:v8 stringType:0 printDetail:0];
      break;
    default:
      goto LABEL_14;
  }
LABEL_15:

  return v10;
}

- (id)classNameForTaggedPointer:(void *)a3
{
  uint64_t v3 = 0;
  uint64_t v4 = *MEMORY[0x1E4FBA8E0];
  if ((~(unint64_t)a3 & 0xC000000000000007) == 0) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ (unint64_t)a3;
  do
  {
    if ((v5 & 7) == *(unsigned char *)(MEMORY[0x1E4FBA8D0] + v3)) {
      break;
    }
    ++v3;
  }
  while (v3 != 7);
  unint64_t v6 = v3 | v5;
  uint64_t v7 = v3 & 7;
  uint64_t v8 = (v6 >> 55) + 8;
  if (v7 == 7) {
    uint64_t v7 = v8;
  }
  if (v7 > 6) {
    return 0;
  }
  else {
    return *(&off_1E5D24CD0 + v7);
  }
}

- (BOOL)isTaggedPointer:(void *)a3
{
  return (self->_taggedPointerMask & (unint64_t)a3) != 0;
}

- (unint64_t)countFromPointerInAutoreleasePool:(void *)a3
{
  unint64_t var3 = self->_autoreleasePoolPageLayout->var3;
  if (!var3) {
    return 0;
  }
  if ((var3 & 0xF00000000000000) != 0) {
    return ((unint64_t)a3 >> 44) & 0xFF0 | ((unint64_t)a3 >> 60);
  }
  return (unint64_t)a3 >> 48;
}

- (id)uniquifyStringLabel:(id)a3 stringType:(int)a4 printDetail:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  int v9 = a4 & 0x40;
  if (v5) {
    int v10 = a4;
  }
  else {
    int v10 = 0;
  }
  if (v5) {
    __int16 v11 = a4;
  }
  else {
    __int16 v11 = a4 & 0x40;
  }
  id v12 = self->_labelStringUniquingMaps[v10];
  id v13 = self->_stringTypeDescriptions[v10];
  if (!v12)
  {
    uint64_t v14 = v10;
    if (!v10)
    {
      uint64_t v20 = objc_opt_new();
      labelStringUniquingMaps = self->_labelStringUniquingMaps;
      id v12 = v20;
      id v16 = *labelStringUniquingMaps;
      labelStringUniquingMaps[v14] = v12;
LABEL_34:

      goto LABEL_35;
    }
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v16 = v15;
    int v17 = v11 & 7;
    if (v17 == 2)
    {
      uint64_t v22 = @"has-length-byte";
LABEL_29:
      [v16 addObject:v22];
      goto LABEL_30;
    }
    if (v17 == 4)
    {
      if ((v11 & 0x80) != 0) {
        [v15 addObject:@"immortal"];
      }
      if ((v11 & 0x100) == 0) {
        goto LABEL_30;
      }
      uint64_t v22 = @"short";
      goto LABEL_29;
    }
    if (v17 != 3)
    {
LABEL_30:
      uint64_t v23 = [v16 componentsJoinedByString:@" "];

      if ([v23 length])
      {
        objc_storeStrong(&self->_stringTypeDescriptions[v14], v23);
        int v24 = objc_opt_new();
        uint64_t v25 = self->_labelStringUniquingMaps;
        id v26 = v24;
        id v12 = v26;
      }
      else
      {

        id v27 = self->_labelStringUniquingMaps[1];
        uint64_t v25 = self->_labelStringUniquingMaps;
        id v26 = v27;
        id v12 = v26;
        uint64_t v23 = 0;
      }
      id v28 = v25[v14];
      v25[v14] = v26;

      id v13 = v23;
      goto LABEL_34;
    }
    if (v9)
    {
      id v19 = @"constant";
    }
    else
    {
      if ((v11 & 0x28) == 0
        || ((v11 & 8) != 0 ? (long long v18 = @"mutable") : (long long v18 = @"immutable"),
            [v15 addObject:v18],
            (v11 & 0x20) == 0))
      {
LABEL_27:
        if ((v11 & 0x10) != 0)
        {
          uint64_t v22 = @"Unicode";
          goto LABEL_29;
        }
        goto LABEL_30;
      }
      id v19 = @"non-inline";
    }
    [v16 addObject:v19];
    goto LABEL_27;
  }
LABEL_35:
  uint64_t v29 = [v12 objectForKeyedSubscript:v8];
  if (!v29)
  {
    uint64_t v30 = (void *)[[NSString alloc] initWithString:v8];
    if (v5)
    {
      if (v9)
      {
        uint64_t v33 = [[NSString alloc] initWithFormat:@"%@:  \"%@\", @"constant"", v8, v36];
      }
      else
      {
        uint64_t v31 = [v8 length];
        id v32 = [NSString alloc];
        if (v13) {
          uint64_t v33 = [v32 initWithFormat:@"length: %lu  %@:  \"%@\"", v31, v13, v8];
        }
        else {
          uint64_t v33 = [v32 initWithFormat:@"length: %lu  \"%@\"", v31, v8, v36];
        }
      }
    }
    else
    {
      uint64_t v33 = [[NSString alloc] initWithFormat:@"\"%@\"", v8, v35, v36];
    }
    uint64_t v29 = (void *)v33;
    [v12 setObject:v33 forKeyedSubscript:v30];
  }

  return v29;
}

- (id)labelForNSString:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  return [(VMUObjectIdentifier *)self labelForNSString:a3 mappedSize:a4 remoteAddress:a5 printDetail:1];
}

- (id)labelForNSString:(void *)a3 mappedSize:(unint64_t)a4 remoteAddress:(unint64_t)a5 printDetail:(BOOL)a6
{
  BOOL v6 = a6;
  unsigned int v11 = 0;
  id v8 = stringFromMappedNSCFString(self->_task, (uint64_t)a3, a4, a5, self->_readonlyRegionRanges, (int *)&v11);
  if (v8)
  {
    int v9 = [(VMUObjectIdentifier *)self uniquifyStringLabel:v8 stringType:v11 printDetail:v6];
  }
  else if (self->_objectContentLevel == 2)
  {
    int v9 = 0;
  }
  else
  {
    int v9 = @"<couldn't read content>";
  }

  return v9;
}

- (id)labelForNSCFStringAtRemoteAddress:(unint64_t)a3 printDetail:(BOOL)a4
{
  BOOL v4 = a4;
  int v17 = 0;
  uint64_t v7 = [(VMUTask *)self->_task memoryCache];
  unint64_t v8 = [v7 tryPeekAtAddress:a3 outPtr:&v17];

  int v9 = 0;
  if (v8 >= 0x10)
  {
    uint64_t v10 = *v17;
    id isaTranslator = (uint64_t (**)(id, id, uint64_t))self->_isaTranslator;
    if (isaTranslator) {
      uint64_t v10 = isaTranslator[2](isaTranslator, self->_memoryReader, v10);
    }
    uint64_t v12 = -[VMUObjectIdentifier objectLabelHandlerForRemoteIsa:](self, v10);
    id v13 = (void *)v12;
    if (v12 && *(char **)(v12 + 24) == sel_labelForNSString_length_remoteAddress_)
    {
      int v9 = [(VMUObjectIdentifier *)self labelForNSString:v17 mappedSize:v8 remoteAddress:a3 printDetail:v4];
    }
    else
    {
      int v9 = 0;
    }
  }
  if ([(VMUObjectIdentifier *)self isTaggedPointer:a3])
  {
    id v14 = [(VMUObjectIdentifier *)self labelForTaggedPointer:a3];
  }
  else
  {
    id v14 = v9;
  }
  id v15 = v14;

  return v15;
}

- (id)labelForNSTaggedPointerStringCStringContainer:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (self->_objectContentLevel == 3)
  {
    BOOL v6 = [NSString stringWithUTF8String:(char *)a3 + 8 length:a4 encoding:a5];
    if (v6)
    {
      uint64_t v7 = [(VMUObjectIdentifier *)self uniquifyStringLabel:v6 stringType:1 printDetail:0];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)labelForNSConcreteAttributedString:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  return -[VMUObjectIdentifier labelForNSCFStringAtRemoteAddress:printDetail:](self, "labelForNSCFStringAtRemoteAddress:printDetail:", *((void *)a3 + 1), 0, a5);
}

- (id)labelForSwiftStringStorage:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  BOOL v8 = [(VMUObjectIdentifier *)self _remoteAddressIsOKtoRead:a5];
  int v9 = 0;
  if (a4 >= 0x20 && v8)
  {
    uint64_t v10 = memchr((char *)a3 + 32, 0, a4 - 32);
    if (v10)
    {
      unsigned int v11 = (void *)[[NSString alloc] initWithBytesNoCopy:(char *)a3 + 32 length:v10 - ((unsigned char *)a3 + 32) encoding:4 freeWhenDone:0];
      int v9 = [(VMUObjectIdentifier *)self uniquifyStringLabel:v11 stringType:4 printDetail:1];
    }
    else
    {
      int v9 = 0;
    }
  }

  return v9;
}

- (id)labelForNSURL:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t v7 = [(VMUObjectIdentifier *)self labelForObjectOfClass:@"NSURL" atOffset:32 ofObject:a3 withLength:a4];
  if (v7)
  {
    BOOL v8 = (void *)v7;
    int v9 = [NSString stringWithFormat:@"Base URL: %@;  ", v7];
  }
  else
  {
    int v9 = &stru_1EFE27F38;
  }
  uint64_t v10 = [(VMUObjectIdentifier *)self labelForNSCFStringAtRemoteAddress:*((void *)a3 + 3) printDetail:0];
  if (v10)
  {
    unsigned int v11 = [NSString stringWithFormat:@"%@%@", v9, v10];
  }
  else
  {
    unsigned int v11 = 0;
  }

  return v11;
}

- (id)labelForNSPathStore2:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (-[VMUObjectIdentifier _remoteAddressIsOKtoRead:](self, "_remoteAddressIsOKtoRead:", a5, a4))
  {
    uint64_t v7 = [NSString stringWithString:a3];
    BOOL v8 = [(VMUObjectIdentifier *)self uniquifyStringLabel:v7 stringType:1 printDetail:1];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)labelForCFBundle:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  BOOL v5 = [(VMUObjectIdentifier *)self labelForObjectOfClass:@"NSURL" atOffset:16 ofObject:a3 withLength:a4];
  if ([v5 hasPrefix:@"\"file://"])
  {
    BOOL v6 = NSString;
    uint64_t v7 = [v5 substringFromIndex:8];
    uint64_t v8 = [v6 stringWithFormat:@"\"%@", v7];

    BOOL v5 = (void *)v8;
  }

  return v5;
}

- (id)labelForNSBundle:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t v8 = [(VMUObjectIdentifier *)self labelForObjectOfClass:@"CFBundle" atOffset:16 ofObject:a3 withLength:a4];
  if (!v8)
  {
    int v9 = [(VMUObjectIdentifier *)self labelForObjectOfClass:@"NSPathStore2" atOffset:48 ofObject:a3 withLength:a4];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v8 = [v9 substringFromIndex:[v9 rangeOfString:@"\""]];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }

  return v8;
}

- (id)labelForNSNumber:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (self->_objectContentLevel == 3 && (CFNumberType Type = CFNumberGetType((CFNumberRef)a3), (unint64_t)(Type - 1) <= 5))
  {
    uint64_t v8 = NSString;
    uint64_t v9 = labelForNSNumber_length_remoteAddress__kNSNumberTypeStrings[Type];
    uint64_t v10 = [a3 description];
    unsigned int v11 = [v8 stringWithFormat:@"type %s  value: %@", v9, v10];

    id v12 = [(NSMutableSet *)self->_stringUniquingSet member:v11];
    if (!v12)
    {
      [(NSMutableSet *)self->_stringUniquingSet addObject:v11];
      id v12 = v11;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)formattedDateLabel:(id)a3
{
  BOOL v4 = (void *)formattedDateLabel__dateFormatter;
  if (!formattedDateLabel__dateFormatter)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    BOOL v6 = (void *)formattedDateLabel__dateFormatter;
    formattedDateLabel__dateFormatter = (uint64_t)v5;

    [(id)formattedDateLabel__dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    BOOL v4 = (void *)formattedDateLabel__dateFormatter;
  }

  return (id)[v4 stringFromDate:a3];
}

- (id)labelForNSDate:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (self->_objectContentLevel == 3)
  {
    id v5 = -[VMUObjectIdentifier formattedDateLabel:](self, "formattedDateLabel:", a3, a4, a5);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)labelForItemCount:(int64_t)a3
{
  if (self->_objectContentLevel == 3)
  {
    id v5 = -[NSMapTable objectForKey:](self->_itemCountToLabelStringUniquingMap, "objectForKey:");
    if (!v5)
    {
      id v5 = [NSString stringWithFormat:@"item count: %ld", a3];
      [(NSMapTable *)self->_itemCountToLabelStringUniquingMap setObject:v5 forKey:a3];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)labelForNSArray:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)a3);

  return [(VMUObjectIdentifier *)self labelForItemCount:Count];
}

- (id)labelForNSDictionary:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t v6 = [a3 count];

  return [(VMUObjectIdentifier *)self labelForItemCount:v6];
}

- (id)labelForNSCFDictionary:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (objectIsDeallocatingOrDeallocated((BOOL)a3))
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [(VMUObjectIdentifier *)self labelForNSDictionary:a3 length:a4 remoteAddress:a5];
  }

  return v9;
}

- (id)labelForNSConcreteHashTable:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t v6 = [a3 count];

  return [(VMUObjectIdentifier *)self labelForItemCount:v6];
}

- (id)labelForNSSet:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t v6 = [a3 count];

  return [(VMUObjectIdentifier *)self labelForItemCount:v6];
}

- (id)labelForNSCFSet:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (objectIsDeallocatingOrDeallocated((BOOL)a3))
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [(VMUObjectIdentifier *)self labelForNSSet:a3 length:a4 remoteAddress:a5];
  }

  return v9;
}

- (id)labelForNSData:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  task = self->_task;
  readonlyRegionRanges = self->_readonlyRegionRanges;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);
  uint64_t v10 = stringFromMappedNSCFData(task, (unint64_t *)a3, a5, readonlyRegionRanges, 0, 1, WeakRetained);

  return v10;
}

- (id)labelForNSConcreteData:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  int v7 = *((_DWORD *)a3 + 2) & 1;
  task = self->_task;
  readonlyRegionRanges = self->_readonlyRegionRanges;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);
  unsigned int v11 = stringFromMappedNSCFData(task, (unint64_t *)a3, a5, readonlyRegionRanges, v7, 0, WeakRetained);

  return v11;
}

- (id)labelForNSConcreteMutableData:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  task = self->_task;
  readonlyRegionRanges = self->_readonlyRegionRanges;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);
  uint64_t v10 = stringFromMappedNSCFData(task, (unint64_t *)a3, a5, readonlyRegionRanges, 0, 0, WeakRetained);

  return v10;
}

- (id)labelForNSInlineData:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  task = self->_task;
  readonlyRegionRanges = self->_readonlyRegionRanges;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);
  uint64_t v10 = stringFromMappedNSCFData(task, (unint64_t *)a3, a5, readonlyRegionRanges, 1, 0, WeakRetained);

  return v10;
}

- (id)labelForCoreMediaFigObject:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  unint64_t v8 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)self->_task, *((void *)a3 + 3));
  if (HIDWORD(v8)) {
    BOOL v9 = (v8 & 7) == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9) {
    goto LABEL_20;
  }
  unint64_t v10 = v8;
  uint64_t v28 = 0;
  unsigned int v11 = [(VMUTask *)self->_task memoryCache];
  LODWORD(v10) = [v11 peekAtAddress:v10 size:16 returnsBuf:&v28];

  id v12 = 0;
  if (v10) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v28 == 0;
  }
  if (v13) {
    goto LABEL_21;
  }
  unint64_t v14 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)self->_task, *(void *)(v28 + 8));
  if (!HIDWORD(v14) || (v14 & 7) != 0) {
    goto LABEL_20;
  }
  unint64_t v16 = v14;
  id v27 = 0;
  int v17 = [(VMUTask *)self->_task memoryCache];
  int v18 = [v17 peekAtAddress:v16 size:8 returnsBuf:&v27];

  id v12 = 0;
  if (v18) {
    BOOL v19 = 1;
  }
  else {
    BOOL v19 = v27 == 0;
  }
  if (v19) {
    goto LABEL_21;
  }
  if ((unint64_t)(*v27 - 1025) < 0xFFFFFFFFFFFFFC03) {
    goto LABEL_20;
  }
  uint64_t v21 = [(VMUTask *)self->_task memoryCache];
  int v22 = [v21 peekAtAddress:v16 size:88 returnsBuf:&v27];

  id v12 = 0;
  if (!v22 && v27)
  {
    uint64_t v23 = v27[10];
    if (!v23) {
      goto LABEL_20;
    }
    id v12 = 0;
    BOOL v24 = __CFADD__(v23, 32);
    unint64_t v25 = v23 + 32;
    if (v24 || a4 <= v25) {
      goto LABEL_21;
    }
    id v26 = (char *)a3 + v25;
    if (!v26)
    {
LABEL_20:
      id v12 = 0;
      goto LABEL_21;
    }
    id v12 = (void *)strnlen(v26, a4 - v25);
    if (v12)
    {
      id v12 = [NSString stringWithFormat:@"label: %.*s", v12, v26];
    }
  }
LABEL_21:

  return v12;
}

- (id)labelForOSDispatchMach:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  label = dispatch_queue_get_label((dispatch_queue_t)a3);
  if (label)
  {
    if (![(VMUObjectIdentifier *)self _remoteAddressIsOKtoRead:label])
    {
      BOOL v9 = 0;
      goto LABEL_23;
    }
    int v7 = [(VMUTask *)self->_task memoryCache];
    unint64_t v8 = (char *)[v7 peekStringAtAddress:label];
  }
  else
  {
    unint64_t v8 = 0;
  }
  if (!v8) {
    unint64_t v8 = "";
  }
  if (!strncmp(v8, "com.apple.xpc.anonymous", 0x17uLL))
  {
    BOOL v9 = @"anonymous";
    goto LABEL_23;
  }
  if (strstr(v8, ".peer.0x"))
  {
    BOOL v9 = [NSString stringWithUTF8String:v8];
    goto LABEL_23;
  }
  CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
  uint64_t Name = (const char *)CSSymbolOwnerGetName();
  if (Name)
  {
    unsigned int v11 = Name;
    if (strcmp(Name, "CoreFoundation")) {
      goto LABEL_21;
    }
  }
  if (!strncmp(v8, "com.apple.CFNetwork", 0x13uLL))
  {
    unsigned int v11 = "CFNetwork";
LABEL_21:
    [NSString stringWithFormat:@"\"%s\" (from %s)", v8, v11];
    goto LABEL_22;
  }
  if (!strncmp(v8, "com.apple.CF", 0xCuLL))
  {
    unsigned int v11 = "CoreFoundation";
    goto LABEL_21;
  }
  if (!strncmp(v8, "com.apple.lsd", 0xDuLL))
  {
    unsigned int v11 = "LaunchServices";
    goto LABEL_21;
  }
  [NSString stringWithFormat:@"\"%s\"", v8, v13];
LABEL_22:
  BOOL v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v9;
}

- (id)labelForOSDispatchQueue:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t v6 = [(VMUObjectIdentifier *)self labelForOSDispatchMach:a3 length:a4 remoteAddress:a5];
  if (v6)
  {
    int relative_priority_ptr = 0;
    HIDWORD(v8) = dispatch_queue_get_qos_class((dispatch_queue_t)a3, &relative_priority_ptr) - 9;
    LODWORD(v8) = HIDWORD(v8);
    unsigned int v7 = v8 >> 2;
    if (v7 <= 6 && ((0x5Du >> v7) & 1) != 0)
    {
      id v9 = [NSString stringWithFormat:@"%@  QOS %s", v6, off_1E5D24D08[v7]];
    }
    else
    {
      id v9 = v6;
    }
    unint64_t v10 = v9;
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (id)labelForOSLog:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (self->_objectContentLevel != 3) {
    goto LABEL_10;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__VMUObjectIdentifier_labelForOSLog_length_remoteAddress___block_invoke;
  block[3] = &unk_1E5D23998;
  block[4] = self;
  if (labelForOSLog_length_remoteAddress__onceToken != -1) {
    dispatch_once(&labelForOSLog_length_remoteAddress__onceToken, block);
  }
  if (labelForOSLog_length_remoteAddress__libtraceVersion > 0x41A
    || (unint64_t v7 = *((void *)a3 + 5), !(v7 >> 28)))
  {
    unint64_t v7 = *((void *)a3 + 3);
    if (!(v7 >> 28)) {
      goto LABEL_10;
    }
  }
  unint64_t v8 = [(VMUTask *)self->_task memoryCache];
  id v9 = (const char *)[v8 peekStringAtAddress:v7 + 4];

  if (!v9) {
    goto LABEL_10;
  }
  size_t v10 = strlen(v9);
  unsigned int v11 = [(VMUTask *)self->_task memoryCache];
  uint64_t v12 = [v11 peekStringAtAddress:v7 + v10 + 5];

  if (v12)
  {
    uint64_t v13 = [NSString stringWithFormat:@"[%s:%s]", v9, v12];
  }
  else
  {
LABEL_10:
    uint64_t v13 = 0;
  }

  return v13;
}

uint64_t __58__VMUObjectIdentifier_labelForOSLog_length_remoteAddress___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) isExclaveCore]) {
    CSSymbolicatorGetSymbolOwner();
  }
  else {
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  }
  uint64_t result = CSSymbolOwnerGetVersion();
  if (result)
  {
    uint64_t result = atoi((const char *)result);
    labelForOSLog_length_remoteAddress__libtraceVersion = result;
  }
  return result;
}

- (id)noLabelForOSXPCObject:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (noLabelForOSXPCObject_length_remoteAddress__onceToken != -1) {
    dispatch_once(&noLabelForOSXPCObject_length_remoteAddress__onceToken, &__block_literal_global_332);
  }
  if (noLabelForOSXPCObject_length_remoteAddress__shouldGetLabelForAllOSXPCObjects == 1)
  {
    id v9 = [(VMUObjectIdentifier *)self labelForOSXPCObject:a3 length:a4 remoteAddress:a5];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

const char *__66__VMUObjectIdentifier_noLabelForOSXPCObject_length_remoteAddress___block_invoke()
{
  uint64_t result = getenv("SYMBOLICATION_LABELS_FOR_ALL_OSXPCOBJECTS");
  if (result)
  {
    uint64_t result = (const char *)strcmp(result, "YES");
    if (!result) {
      noLabelForOSXPCObject_length_remoteAddress__shouldGetLabelForAllOSXPCObjects = 1;
    }
  }
  return result;
}

- (id)labelForOSXPCDictionary:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (labelForOSXPCDictionary_length_remoteAddress__onceToken != -1) {
    dispatch_once(&labelForOSXPCDictionary_length_remoteAddress__onceToken, &__block_literal_global_335);
  }
  if (labelForOSXPCDictionary_length_remoteAddress___xpc_dictionary_get_transaction
    && labelForOSXPCDictionary_length_remoteAddress___xpc_dictionary_get_transaction(a3))
  {
    unint64_t v7 = [MEMORY[0x1E4F28E78] stringWithString:@"Request/Reply message for active transaction with "];
    xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(a3);
    if (!remote_connection
      || (xpc_connection_t v9 = remote_connection,
          p_scanner = &self->_scanner,
          id v11 = objc_loadWeakRetained((id *)p_scanner),
          uint64_t v12 = [v11 nodeForAddress:v9],
          v11,
          v12 == -1))
    {
      [v7 appendString:@"<unknown connection>"];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)p_scanner);
      unint64_t v14 = [WeakRetained labelForNode:v12];

      [v7 appendString:v14];
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

void *__68__VMUObjectIdentifier_labelForOSXPCDictionary_length_remoteAddress___block_invoke()
{
  uint64_t result = dlopen("/usr/lib/system/libxpc.dylib", 16);
  if (result)
  {
    v1 = result;
    labelForOSXPCDictionary_length_remoteAddress___xpc_dictionary_get_transaction = (uint64_t (*)(void))dlsym(result, "_xpc_dictionary_get_transaction");
    return (void *)dlclose(v1);
  }
  return result;
}

- (id)labelForOSXPCObject:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (self->_objectContentLevel == 3 && (uint64_t v5 = xpc_inspect_copy_description()) != 0)
  {
    uint64_t v6 = (void *)v5;
    unint64_t v7 = [NSString stringWithUTF8String:v5];
    free(v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

uint64_t __64__VMUObjectIdentifier_labelForOSXPCObject_length_remoteAddress___block_invoke(uint64_t a1, void *a2, uint64_t a3, size_t a4)
{
  uint64_t v6 = (const void *)(*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 48) + 16))();
  if (!v6) {
    return 1;
  }
  memcpy(a2, v6, a4);
  return 0;
}

- (id)labelForOSTransaction:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t return_address;
  BOOL v10;
  int v11;
  double v12;
  id WeakRetained;
  uint64_t v14;
  unint64_t v15;
  unint64_t description;
  char *v17;
  void *v18;
  unint64_t v19;
  char *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t vars8;

  if (self->_objectContentLevel == 1)
  {
    uint64_t v5 = 0;
    goto LABEL_53;
  }
  if (labelForOSTransaction_length_remoteAddress__onceToken != -1) {
    dispatch_once(&labelForOSTransaction_length_remoteAddress__onceToken, &__block_literal_global_347_0);
  }
  if (labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_return_address) {
    return_address = labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_return_address(a3);
  }
  else {
    return_address = 0;
  }
  if (labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_timestamp) {
    size_t v10 = dword_1E973BAA4 == 0;
  }
  else {
    size_t v10 = 1;
  }
  id v11 = !v10;
  uint64_t v12 = 0.0;
  if (!v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);
    unint64_t v14 = [WeakRetained suspendTimeContinuous];
    if (!v14) {
      unint64_t v14 = mach_continuous_approximate_time();
    }

    id v15 = v14 * labelForOSTransaction_length_remoteAddress__info / dword_1E973BAA4;
    uint64_t v12 = (double)(v15 - labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_timestamp(a3))
        / 1000000000.0;
  }
  if (!labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_description)
  {
    if (self->_objectContentLevel == 3)
    {
      uint64_t v20 = (char *)os_transaction_copy_description();
      uint64_t v21 = 1;
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  description = labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_description(a3);
  int v17 = (char *)description;
  if (description < (unint64_t)a3
    || (unint64_t)a3 + a4 <= description
    || (int v18 = malloc_type_malloc(a4, 0xC1884B20uLL),
        memcpy(v18, a3, a4),
        BOOL v19 = labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_description(v18),
        free(v18),
        v17 == (char *)v19))
  {
    if (v17 && [(VMUObjectIdentifier *)self _remoteAddressIsOKtoRead:v17])
    {
      int v22 = [(VMUTask *)self->_task memoryCache];
      uint64_t v20 = (char *)[v22 peekStringAtAddress:v17];

      uint64_t v21 = 0;
      goto LABEL_33;
    }
LABEL_32:
    uint64_t v21 = 0;
    uint64_t v20 = 0;
    goto LABEL_33;
  }
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  if ((unint64_t)v18 <= v19 && (unint64_t)v18 + a4 > v19)
  {
    uint64_t v21 = 0;
    if (self->_objectContentLevel == 3) {
      uint64_t v20 = v17;
    }
    else {
      uint64_t v20 = 0;
    }
  }
LABEL_33:
  if (return_address) {
    uint64_t v23 = v11;
  }
  else {
    uint64_t v23 = 0;
  }
  if (v23 != 1)
  {
    if (v11)
    {
      id v27 = "";
      if (v20) {
        id v27 = v20;
      }
      uint64_t v28 = 3;
      if (self->_objectContentLevel != 3) {
        uint64_t v28 = 0;
      }
      uint64_t v29 = [NSString stringWithFormat:@"[%.*f seconds] %s", v28, *(void *)&v12, v27];
    }
    else
    {
      if (!v20)
      {
        uint64_t v5 = 0;
        if (!v21) {
          goto LABEL_53;
        }
LABEL_52:
        free(v20);
        goto LABEL_53;
      }
      uint64_t v29 = [NSString stringWithUTF8String:v20];
    }
    uint64_t v5 = (void *)v29;
    if (!v21) {
      goto LABEL_53;
    }
    goto LABEL_52;
  }
  BOOL v24 = [(VMUObjectIdentifier *)self symbolForRemoteAddress:return_address - 1];
  unint64_t v25 = "";
  if (v20) {
    unint64_t v25 = v20;
  }
  id v26 = 3;
  if (self->_objectContentLevel != 3) {
    id v26 = 0;
  }
  uint64_t v5 = [NSString stringWithFormat:@"[%.*f seconds] \"%s\"  Created at: %@", v26, *(void *)&v12, v25, v24];

  if (v21) {
    goto LABEL_52;
  }
LABEL_53:

  return v5;
}

void *__66__VMUObjectIdentifier_labelForOSTransaction_length_remoteAddress___block_invoke()
{
  mach_timebase_info((mach_timebase_info_t)&labelForOSTransaction_length_remoteAddress__info);
  uint64_t result = dlopen("/usr/lib/system/libxpc.dylib", 16);
  if (result)
  {
    v1 = result;
    labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_timestamp = (uint64_t (*)(void))dlsym(result, "os_transaction_get_timestamp");
    labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_description = (uint64_t (*)(void))dlsym(v1, "os_transaction_get_description");
    labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_return_address = (uint64_t (*)(void))dlsym(v1, "os_transaction_get_ra");
    return (void *)dlclose(v1);
  }
  return result;
}

- (id)labelFor_NSActivityAssertion:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  return -[VMUObjectIdentifier labelForNSCFStringAtRemoteAddress:printDetail:](self, "labelForNSCFStringAtRemoteAddress:printDetail:", *((void *)a3 + 2), 0, a5);
}

- (id)labelFor_RBSAssertionDescriptor:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (a4 < 0x20)
  {
    unint64_t v7 = 0;
  }
  else
  {
    unint64_t v7 = -[VMUObjectIdentifier labelForNSCFStringAtRemoteAddress:printDetail:](self, "labelForNSCFStringAtRemoteAddress:printDetail:", *((void *)a3 + 3), 0, a5, v5);
  }
  return v7;
}

- (void)_findOffsetsInOSXPCConnection:(void *)a3 length:(unint64_t)a4
{
  if (self->_osDispatchMachOffsetInOSXPCConnection) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = a4 >= 0x10;
  }
  if (v4)
  {
    p_scanner = &self->_scanner;
    for (unsigned int i = 24; ; i += 8)
    {
      unint64_t v10 = *(void *)((char *)a3 + i - 16);
      if (HIDWORD(v10) && (*(void *)((unsigned char *)a3 + i - 16) & 7) == 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)p_scanner);
        uint64_t v13 = [WeakRetained nodeForAddress:v10];

        if (v13 != -1)
        {
          id v14 = objc_loadWeakRetained((id *)p_scanner);
          id v15 = v14;
          if (v14) {
            [v14 nodeDetails:v13];
          }

          unint64_t v16 = [0 className];
          char v17 = [v16 isEqualToString:@"OS_dispatch_mach"];

          if (v17) {
            break;
          }
        }
      }
      unint64_t v18 = i;
      if (v18 > a4) {
        return;
      }
    }
    self->_osDispatchMachOffsetInOSXPCConnection = i - 16;
  }
}

- (id)labelForOSXPCConnection:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t osDispatchMachOffsetInOSXPCConnection = self->_osDispatchMachOffsetInOSXPCConnection;
  if (!osDispatchMachOffsetInOSXPCConnection
    && (-[VMUObjectIdentifier _findOffsetsInOSXPCConnection:length:](self, "_findOffsetsInOSXPCConnection:length:", a3, a4, a5), osDispatchMachOffsetInOSXPCConnection = self->_osDispatchMachOffsetInOSXPCConnection, !osDispatchMachOffsetInOSXPCConnection)|| ([(VMUObjectIdentifier *)self labelForObjectOfClass:@"OS_dispatch_mach" atOffset:osDispatchMachOffsetInOSXPCConnection ofObject:a3 withLength:a4], (xpc_connection_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    xpc_connection_t v9 = @"<couldn't read name>";
  }
  uint64_t pid = xpc_connection_get_pid((xpc_connection_t)a3);
  if (pid)
  {
    uint64_t v11 = pid;
    pidToProcessNameDict = self->_pidToProcessNameDict;
    uint64_t v13 = [NSNumber numberWithInt:pid];
    id v14 = [(NSMutableDictionary *)pidToProcessNameDict objectForKeyedSubscript:v13];

    if (!v14)
    {
      id v15 = [[VMUProcInfo alloc] initWithPid:v11];
      uint64_t v16 = [(VMUProcInfo *)v15 name];
      char v17 = (void *)v16;
      unint64_t v18 = @"<unknown>";
      if (v16) {
        unint64_t v18 = (__CFString *)v16;
      }
      id v14 = v18;

      BOOL v19 = self->_pidToProcessNameDict;
      uint64_t v20 = [NSNumber numberWithInt:v11];
      [(NSMutableDictionary *)v19 setObject:v14 forKeyedSubscript:v20];
    }
    uint64_t v21 = NSString;
    int v22 = v14;
    uint64_t v23 = [v21 stringWithFormat:@"%@ pid %u [%s]", v9, v11, -[__CFString UTF8String](v22, "UTF8String")];
  }
  else
  {
    uint64_t v23 = [(__CFString *)v9 stringByAppendingString:@" [no process]"];
  }

  return v23;
}

- (id)labelForOSXPCActivity:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t v5 = *((void *)a3 + 3);
  if (v5
    && -[VMUObjectIdentifier _remoteAddressIsOKtoRead:](self, "_remoteAddressIsOKtoRead:", *((void *)a3 + 3), a4, a5)
    && ([(VMUTask *)self->_task memoryCache],
        unint64_t v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 peekStringAtAddress:v5],
        v7,
        v8))
  {
    xpc_connection_t v9 = [NSString stringWithUTF8String:v8];
  }
  else
  {
    xpc_connection_t v9 = 0;
  }

  return v9;
}

- (id)labelForProtocol:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t v7 = *((void *)a3 + 10);
  if (v7)
  {
    if (-[VMUObjectIdentifier _remoteAddressIsOKtoRead:](self, "_remoteAddressIsOKtoRead:", *((void *)a3 + 10), a4, a5))
    {
      uint64_t v8 = [(VMUTask *)self->_task memoryCache];
      uint64_t v9 = [v8 peekStringAtAddress:v7];

      if (v9) {
        goto LABEL_7;
      }
    }
  }
  uint64_t v10 = *((void *)a3 + 1);
  if (v10
    && -[VMUObjectIdentifier _remoteAddressIsOKtoRead:](self, "_remoteAddressIsOKtoRead:", v10, a4, a5)
    && ([(VMUTask *)self->_task memoryCache],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v11 peekStringAtAddress:v10],
        v11,
        v9))
  {
LABEL_7:
    uint64_t v12 = [NSString stringWithUTF8String:v9];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)labelForNSXPCInterface:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  id v6 = (id)[a3 protocol];
  if (v6)
  {
    uint64_t v7 = -[VMUObjectIdentifier labelForMallocBlock:](self, "labelForMallocBlock:", v6, 88);
    if (v7)
    {
      uint64_t v8 = [NSString stringWithFormat:@"Protocol: %@", v7];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)labelForNSXPCConnection:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  id v26 = __68__VMUObjectIdentifier_labelForNSXPCConnection_length_remoteAddress___block_invoke;
  id v27 = &__block_descriptor_40_e5_v8__0l;
  uint64_t v28 = a3;
  if (labelForNSXPCConnection_length_remoteAddress__onceToken != -1) {
    dispatch_once(&labelForNSXPCConnection_length_remoteAddress__onceToken, &block);
  }
  uint64_t v7 = *(void *)((char *)a3 + labelForNSXPCConnection_length_remoteAddress__offsetOfRemoteObjectInterface);
  uint64_t v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = -[VMUObjectIdentifier labelForMallocBlock:](self, "labelForMallocBlock:", v7, class_getInstanceSize(v8));
  uint64_t v10 = *(void *)((char *)a3 + labelForNSXPCConnection_length_remoteAddress__offsetOfConnection);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);

  if (!WeakRetained
    || (id v12 = objc_loadWeakRetained((id *)&self->_scanner),
        uint64_t v13 = [v12 nodeForAddress:v10],
        v12,
        v13 == -1))
  {
    uint64_t v17 = 0;
  }
  else
  {
    id v14 = objc_loadWeakRetained((id *)&self->_scanner);
    id v15 = v14;
    if (v14)
    {
      [v14 nodeDetails:v13];
      uint64_t v16 = v22 & 0xFFFFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      uint64_t v23 = 0;
    }

    uint64_t v17 = -[VMUObjectIdentifier labelForMallocBlock:](self, "labelForMallocBlock:", v10, v16);
  }
  if (v9 | v17)
  {
    if (!v9) {
      uint64_t v9 = @"Protocol: <couldn't read name>";
    }
    if (v17) {
      unint64_t v18 = (__CFString *)v17;
    }
    else {
      unint64_t v18 = &stru_1EFE27F38;
    }
    BOOL v19 = [NSString stringWithFormat:@"%@  Connection: %@", v9, v18, v21, v22, v23, block, v25, v26, v27, v28];
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

ptrdiff_t __68__VMUObjectIdentifier_labelForNSXPCConnection_length_remoteAddress___block_invoke(uint64_t a1)
{
  Class Class = object_getClass(*(id *)(a1 + 32));
  InstanceVariable = class_getInstanceVariable(Class, "_connection");
  labelForNSXPCConnection_length_remoteAddress__offsetOfConnection = ivar_getOffset(InstanceVariable);
  if (!labelForNSXPCConnection_length_remoteAddress__offsetOfConnection)
  {
    uint64_t v3 = class_getInstanceVariable(Class, "_xconnection");
    labelForNSXPCConnection_length_remoteAddress__offsetOfConnection = ivar_getOffset(v3);
  }
  BOOL v4 = class_getInstanceVariable(Class, "_remoteObjectInterface");
  ptrdiff_t result = ivar_getOffset(v4);
  labelForNSXPCConnection_length_remoteAddress__offsetOfRemoteObjectInterface = result;
  return result;
}

- (id)labelFor__NSMallocBlock__:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t v6 = -[VMUTask ptrauthStripFunctionPointer:]((uint64_t)self->_task, *((void *)a3 + 2));

  return [(VMUObjectIdentifier *)self symbolForRemoteAddress:v6];
}

- (id)symbolForRemoteAddress:(unint64_t)a3
{
  CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
  if (CSIsNull())
  {
    BOOL v4 = 0;
  }
  else
  {
    uint64_t Name = CSSymbolOwnerGetName();
    if (Name)
    {
      uint64_t v6 = [NSString stringWithUTF8String:Name];
    }
    else
    {
      uint64_t v6 = @"<unknown-binary>";
    }
    CSSymbolOwnerGetSymbolWithAddress();
    if ((CSIsNull() & 1) != 0
      || (uint64_t v7 = CSSymbolGetName()) == 0
      || ([NSString stringWithUTF8String:v7],
          (uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t BaseAddress = CSSymbolOwnerGetBaseAddress();
      if (BaseAddress)
      {
        [NSString stringWithFormat:@"<unknown-symbol> %#qx + %qu", BaseAddress, a3 - BaseAddress];
        uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v8 = @"???";
      }
    }
    CSSymbolOwnerGetSourceInfoWithAddress();
    if (CSIsNull())
    {
      uint64_t v10 = &stru_1EFE27F38;
    }
    else
    {
      uint64_t Path = CSSourceInfoGetPath();
      [NSString stringWithFormat:@"  %s:%u", Path, CSSourceInfoGetLineNumber()];
      uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    BOOL v4 = [NSString stringWithFormat:@"%@  %@  %#qx%@", v6, v8, a3, v10];
  }

  return v4;
}

- (id)labelForClassDataRO:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (self->_objectContentLevel == 3)
  {
    uint64_t v5 = VMUGetClassNameFromClassDataRO(self->_task, self->_memoryReader, a5);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)labelForClassDataRW:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (self->_objectContentLevel == 3)
  {
    uint64_t v5 = VMUGetClassNameFromClassDataRW(self->_task, self->_memoryReader, self->_objcABI, a5);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)labelForClassDataExtRW:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (self->_objectContentLevel == 3)
  {
    uint64_t v5 = VMUGetClassNameFromClassDataExtRW(self->_task, self->_memoryReader, self->_objcABI, a5);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)labelForClassStructure:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (self->_objectContentLevel == 3)
  {
    uint64_t v7 = VMUGetClassNameFromClassStructure(self->_task, self->_memoryReader, self->_objcABI, a5);
    if (!v7)
    {
      uint64_t v7 = VMUGetClassNameFromClassStructure(self->_task, self->_memoryReader, self->_objcABI, a5 + 16);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)labelForMallocBlock:(_VMURange)a3
{
  if (a3.location == self->_cfBooleanTrueAddress)
  {
    unsigned int objectContentLevel = self->_objectContentLevel;
    BOOL v4 = @"YES";
LABEL_5:
    if (objectContentLevel == 3) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = v5;
    goto LABEL_10;
  }
  if (a3.location == self->_cfBooleanFalseAddress)
  {
    unsigned int objectContentLevel = self->_objectContentLevel;
    BOOL v4 = @"NO";
    goto LABEL_5;
  }
  -[VMUObjectIdentifier labelForMallocBlock:usingHandlerBlock:](self, "labelForMallocBlock:usingHandlerBlock:", a3.location, a3.length, 0);
  uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v6;
}

- (id)labelForMallocBlock:(_VMURange)a3 usingHandlerBlock:(id)a4
{
  size_t length = a3.length;
  unint64_t location = a3.location;
  id memoryReader = self->_memoryReader;
  uint64_t v8 = (uint64_t (*)(void *, unint64_t, size_t))memoryReader[2];
  id v9 = a4;
  uint64_t v10 = (unsigned __int8 *)v8(memoryReader, location, length);
  uint64_t v11 = -[VMUObjectIdentifier labelForMemory:length:remoteAddress:classInfo:usingHandlerBlock:]((uint64_t)self, v10, length, location, 0, v9);

  return v11;
}

- (id)labelForMemory:(size_t)a3 length:(uint64_t)a4 remoteAddress:(void *)a5 classInfo:(void *)a6 usingHandlerBlock:
{
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = 0;
  if (a1 && a2)
  {
    if ((*(_DWORD *)(a1 + 180) & 0xFFFFFFFE) != 2)
    {
      uint64_t v13 = 0;
      goto LABEL_60;
    }
    id v14 = (void *)MEMORY[0x1AD0D9F90]();
    if (!*(void *)(a1 + 320)) {
      [(id)a1 buildIsaToObjectLabelHandlerMap];
    }
    if ([v11 remoteIsa])
    {
      id v15 = v11;
    }
    else
    {
      id v15 = [(id)a1 classInfoForMemory:a2 length:a3 remoteAddress:a4];
    }
    id v16 = v15;
    if (v15)
    {
      if ([v15 instanceSize] > a3)
      {
LABEL_12:
        uint64_t v13 = 0;
LABEL_52:

LABEL_59:
        goto LABEL_60;
      }
      if (!v11) {
        goto LABEL_38;
      }
      goto LABEL_22;
    }
    if (!v11) {
      goto LABEL_29;
    }
    uint64_t v17 = *(id **)(a1 + 232);
    if (v17)
    {
      if (*v17 == v11 || v17[1] == v11)
      {
        uint64_t v18 = [(id)a1 labelForClassStructure:a2 length:a3 remoteAddress:a4];
        goto LABEL_34;
      }
      if (v17[2] == v11)
      {
        uint64_t v18 = [(id)a1 labelForClassDataRW:a2 length:a3 remoteAddress:a4];
        goto LABEL_34;
      }
      if (v17[3] == v11)
      {
        uint64_t v18 = [(id)a1 labelForClassDataExtRW:a2 length:a3 remoteAddress:a4];
        goto LABEL_34;
      }
      if (v17[5] == v11)
      {
        uint64_t v18 = [(id)a1 labelForClassDataRO:a2 length:a3 remoteAddress:a4];
LABEL_34:
        uint64_t v13 = (void *)v18;
        goto LABEL_52;
      }
    }
LABEL_22:
    uint64_t v36 = v14;
    if (v16 != v11)
    {
      BOOL v19 = [v11 className];
      uint64_t v20 = v19;
      if (v19
        && (([v19 hasSuffix:@" (malloc)"] & 1) != 0
         || ([v20 hasSuffix:@" (char[])"] & 1) != 0
         || ([v11 isDerivedFromStackBacktrace] & 1) != 0))
      {

        if (v16)
        {
          id v11 = 0;
          goto LABEL_38;
        }
LABEL_29:
        if (![(id)a1 _remoteAddressIsOKtoRead:a4])
        {
          uint64_t v23 = 0;
          uint64_t v13 = 0;
LABEL_57:
          id v11 = 0;
          goto LABEL_58;
        }
        unsigned int v37 = 0;
        uint64_t v21 = stringFromBytes(a2, a3, (int *)&v37);
        if (v21)
        {
          uint64_t v22 = [(id)a1 uniquifyStringLabel:v21 stringType:v37 printDetail:1];
        }
        else
        {
          if (![(id)a1 isTaggedPointer:a2])
          {
            uint64_t v13 = 0;
            goto LABEL_56;
          }
          uint64_t v22 = [(id)a1 labelForTaggedPointer:a2];
        }
        uint64_t v13 = (void *)v22;
LABEL_56:

        uint64_t v23 = 0;
        goto LABEL_57;
      }
      BOOL v24 = [v16 className];
      int v25 = [v20 isEqualToString:v24];

      if (!v25)
      {
        uint64_t v13 = 0;
        id v14 = v36;
        goto LABEL_52;
      }
    }
    if (!v16)
    {
      uint64_t v23 = 0;
      uint64_t v13 = 0;
      id v14 = v36;
      goto LABEL_58;
    }
    id v14 = v36;
LABEL_38:
    if ([v16 isCoreMediaFigObject])
    {
      uint64_t v26 = [(id)a1 labelForCoreMediaFigObject:a2 length:a3 remoteAddress:a4];
LABEL_42:
      uint64_t v13 = (void *)v26;
      uint64_t v23 = 0;
LABEL_58:

      goto LABEL_59;
    }
    if (*(unsigned char *)(a1 + 68))
    {
      uint64_t v26 = [*(id *)(a1 + 456) labelForDriverKitMemory:a2 length:a3 remoteAddress:a4 class:v16];
      goto LABEL_42;
    }
    uint64_t v27 = -[VMUObjectIdentifier objectLabelHandlerForRemoteIsa:]((void *)a1, [v16 remoteIsa]);
    uint64_t v28 = (void *)v27;
    if (v27)
    {
      if (*(void *)(v27 + 16))
      {
        if (labelForMemory_length_remoteAddress_classInfo_usingHandlerBlock__onceToken != -1) {
          dispatch_once(&labelForMemory_length_remoteAddress_classInfo_usingHandlerBlock__onceToken, &__block_literal_global_414);
        }
        uint64_t v29 = (char *)((uint64_t (*)(void, size_t))labelForMemory_length_remoteAddress_classInfo_usingHandlerBlock__located_class_createInstance)(v28[2], a3 - [v16 instanceSize]);
        uint64_t v30 = v29;
        if (!v29 || malloc_size(v29) < a3) {
          goto LABEL_50;
        }
        memcpy(v30 + 8, a2 + 8, a3 - 8);
        uint64_t v35 = v30;
        a2 = (unsigned __int8 *)v30;
      }
      else
      {
        uint64_t v35 = 0;
      }
      id v32 = v28;
      uint64_t v23 = v32;
      if (v12)
      {
        uint64_t v33 = v12[2](v12, v32, a2, a3, a4);
      }
      else
      {
        uint64_t v34 = (const char *)v32[3];
        if (v34) {
          [a1 v34:a2 a3:a3 a4:a4];
        }
        else {
        uint64_t v33 = [a1 performSelector:0 withObject:a2 withObject:a3 withObject:a4];
        }
      }
      uint64_t v13 = (void *)v33;
      if (v35) {
        free(v35);
      }

      goto LABEL_58;
    }
LABEL_50:

    goto LABEL_12;
  }
LABEL_60:

  return v13;
}

- (id)labelForObjectOfClass:(id)a3 atOffset:(unsigned int)a4 ofObject:(void *)a5 withLength:(unint64_t)a6
{
  id v10 = a3;
  if ((unint64_t)a4 + 8 <= a6)
  {
    uint64_t v11 = *(void *)((char *)a5 + a4);
    if (v11)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);

      if (WeakRetained)
      {
        id v13 = objc_loadWeakRetained((id *)&self->_scanner);
        uint64_t v14 = [v13 nodeForAddress:v11];

        if (v14 != -1)
        {
          id v15 = objc_loadWeakRetained((id *)&self->_scanner);
          id v16 = v15;
          if (v15) {
            [v15 nodeDetails:v14];
          }
        }
      }
    }
  }

  return 0;
}

id __74__VMUObjectIdentifier_labelForObjectOfClass_atOffset_ofObject_withLength___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9 = a2;
  if ([*((id *)v9 + 1) isEqualToString:*(void *)(a1 + 32)])
  {
    id v10 = *(void **)(a1 + 40);
    uint64_t v11 = (const char *)*((void *)v9 + 3);
    if (v11) {
      [v10 v11:a3 a4:a4 a5:a5];
    }
    else {
    id v12 = [v10 performSelector:0 withObject:a3 withObject:a4 withObject:a5];
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void *__87__VMUObjectIdentifier_labelForMemory_length_remoteAddress_classInfo_usingHandlerBlock___block_invoke()
{
  ptrdiff_t result = dlsym((void *)0xFFFFFFFFFFFFFFFFLL, "class_createInstance");
  labelForMemory_length_remoteAddress_classInfo_usingHandlerBlock__located_class_createInstance = result;
  return result;
}

- (id)labelForMemory:(void *)a3 length:(unint64_t)a4
{
  return -[VMUObjectIdentifier labelForMemory:length:remoteAddress:classInfo:usingHandlerBlock:]((uint64_t)self, (unsigned __int8 *)a3, a4, 0, 0, 0);
}

- (id)labelForMemory:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  return -[VMUObjectIdentifier labelForMemory:length:remoteAddress:classInfo:usingHandlerBlock:]((uint64_t)self, (unsigned __int8 *)a3, a4, a5, 0, 0);
}

- (id)labelForMemory:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5 classInfo:(id)a6
{
  return -[VMUObjectIdentifier labelForMemory:length:remoteAddress:classInfo:usingHandlerBlock:]((uint64_t)self, (unsigned __int8 *)a3, a4, a5, a6, 0);
}

- (_CSTypeRef)_symbolicator
{
  unint64_t opaque_2 = self->_symbolicator._opaque_2;
  unint64_t opaque_1 = self->_symbolicator._opaque_1;
  result._unint64_t opaque_2 = opaque_2;
  result._unint64_t opaque_1 = opaque_1;
  return result;
}

- (id)_scanner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);

  return WeakRetained;
}

- (BOOL)_dlopenLibSwiftRemoteMirrorFromDir:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4
    || (long long v27 = 0u,
        long long v28 = 0u,
        long long v25 = 0u,
        long long v26 = 0u,
        (uint64_t v5 = [&unk_1EFE400A8 countByEnumeratingWithState:&v25 objects:v29 count:16]) == 0))
  {
    char v7 = 0;
    goto LABEL_26;
  }
  uint64_t v6 = v5;
  char v7 = 0;
  uint64_t v8 = *(void *)v26;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v26 != v8) {
        objc_enumerationMutation(&unk_1EFE400A8);
      }
      id v10 = [v4 stringByAppendingPathComponent:*(void *)(*((void *)&v25 + 1) + 8 * v9)];
      libSwiftRemoteMirrors = self->_libSwiftRemoteMirrors;
      if (libSwiftRemoteMirrors)
      {
        id v12 = [(NSMutableDictionary *)libSwiftRemoteMirrors objectForKeyedSubscript:v10];

        if (v12) {
          goto LABEL_9;
        }
      }
      id v13 = v10;
      uint64_t v14 = (const char *)[v13 UTF8String];
      if (v14)
      {
        id v15 = v14;
        if (access(v14, 4))
        {
          if (self->_debugSwiftRemoteMirror)
          {
            uint64_t v24 = *__error();
            NSLog(&cfstr_SymbolicationD_4.isa, v13, v24);
          }
        }
        else
        {
          id v16 = dlopen(v15, 1);
          if (v16)
          {
            uint64_t v17 = v16;
            if (!self->_libSwiftRemoteMirrors)
            {
              uint64_t v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
              BOOL v19 = self->_libSwiftRemoteMirrors;
              self->_libSwiftRemoteMirrors = v18;
            }
            uint64_t v20 = [MEMORY[0x1E4F29238] valueWithPointer:v17];
            [(NSMutableDictionary *)self->_libSwiftRemoteMirrors setObject:v20 forKeyedSubscript:v13];

            if (self->_debugSwiftRemoteMirror) {
              NSLog(&cfstr_SymbolicationD_5.isa, v13);
            }
LABEL_9:
            char v7 = 1;
            goto LABEL_14;
          }
          if (self->_debugSwiftRemoteMirror) {
            NSLog(&cfstr_SymbolicationD_6.isa, v13, v23);
          }
        }
      }
LABEL_14:

      ++v9;
    }
    while (v6 != v9);
    uint64_t v21 = [&unk_1EFE400A8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    uint64_t v6 = v21;
  }
  while (v21);
LABEL_26:

  return v7 & 1;
}

- (BOOL)_dlopenLibSwiftRemoteMirrorNearLibSwiftCore
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  int v7 = 0;
  CSSymbolicatorForeachSymbolOwnerWithNameAtTime();
  BOOL v2 = *((_DWORD *)v5 + 6) == *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v4, 8);
  _Block_object_dispose(&v8, 8);
  return v2;
}

void __66__VMUObjectIdentifier__dlopenLibSwiftRemoteMirrorNearLibSwiftCore__block_invoke(uint64_t a1)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  uint64_t Path = CSSymbolOwnerGetPath();
  if (Path)
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v3 = [NSString stringWithUTF8String:Path];
    uint64_t v4 = [v3 stringByDeletingLastPathComponent];

    if (v4)
    {
      char v5 = [v4 hasSuffix:@"/usr/lib/swift"];
      uint64_t v6 = *(id **)(a1 + 32);
      if (v5)
      {
        if (([v6 _dlopenLibSwiftRemoteMirrorFromDir:v4] & 1) == 0)
        {
          int v7 = NSString;
          v14[0] = @"/System/Cryptexes/OS/";
          v14[1] = v4;
          uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
          uint64_t v9 = [v7 pathWithComponents:v8];

          LOBYTE(v8) = [*(id *)(a1 + 32) _dlopenLibSwiftRemoteMirrorFromDir:v9];
          if ((v8 & 1) == 0) {
            goto LABEL_19;
          }
        }
        goto LABEL_18;
      }
      id WeakRetained = objc_loadWeakRetained(v6 + 7);
      int v11 = [WeakRetained executablePath];
      id v12 = [v11 stringByDeletingLastPathComponent];

      if (v12 && [v12 length])
      {
        if (![v4 hasPrefix:v12])
        {

          if (([*(id *)(a1 + 32) _dlopenLibSwiftRemoteMirrorFromDir:v4] & 1) == 0)
          {
            id v13 = [v4 stringByDeletingLastPathComponent];

            if (!v13)
            {
              uint64_t v4 = 0;
              goto LABEL_19;
            }
            if ([*(id *)(a1 + 32) _dlopenLibSwiftRemoteMirrorFromDir:v13])
            {
              uint64_t v4 = v13;
            }
            else
            {
              uint64_t v4 = [v13 stringByAppendingPathComponent:@"Resources"];

              if (![*(id *)(a1 + 32) _dlopenLibSwiftRemoteMirrorFromDir:v4]) {
                goto LABEL_19;
              }
            }
          }
LABEL_18:
          ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
          goto LABEL_19;
        }
        NSLog(&cfstr_SymbolicationD_7.isa);
      }
    }
LABEL_19:
  }
}

- (BOOL)_dlopenLibSwiftRemoteMirrorNearExecutable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);
  uint64_t v4 = [WeakRetained executablePath];

  if (v4)
  {
    char v5 = [v4 stringByDeletingLastPathComponent];
    if (v5)
    {
      if ([(VMUObjectIdentifier *)self _dlopenLibSwiftRemoteMirrorFromDir:v5])
      {
        BOOL v6 = 1;
      }
      else
      {
        int v7 = [v5 stringByDeletingLastPathComponent];

        if (v7)
        {
          char v5 = [v7 stringByAppendingPathComponent:@"Resources"];

          BOOL v6 = [(VMUObjectIdentifier *)self _dlopenLibSwiftRemoteMirrorFromDir:v5];
        }
        else
        {
          BOOL v6 = 0;
          char v5 = 0;
        }
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_dlopenLibSwiftRemoteMirror
{
  if ([(VMUTask *)self->_task isExclave])
  {
    return [(VMUObjectIdentifier *)self _dlopenLibSwiftRemoteMirrorFromDir:@"/usr/lib/swift"];
  }
  else
  {
    if ([(VMUObjectIdentifier *)self _dlopenLibSwiftRemoteMirrorNearLibSwiftCore])
    {
      return 1;
    }
    if (access("/Developer/usr/lib/swift", 5)) {
      return 0;
    }
    char v5 = opendir("/Developer/usr/lib/swift");
    if (!v5) {
      return 0;
    }
    BOOL v6 = v5;
    BOOL v7 = 0;
    do
    {
      uint64_t v8 = readdir(v6);
      BOOL v4 = v8 != 0;
      if (!v8) {
        break;
      }
      if (v8->d_type == 4)
      {
        d_name = v8->d_name;
        if (v8->d_name[0] != 46)
        {
          uint64_t v10 = [NSString stringWithUTF8String:"/Developer/usr/lib/swift"];
          int v11 = [NSString stringWithUTF8String:d_name];
          id v12 = [v10 stringByAppendingPathComponent:v11];

          BOOL v7 = [(VMUObjectIdentifier *)self _dlopenLibSwiftRemoteMirrorFromDir:v12];
        }
      }
    }
    while (!v7);
    closedir(v6);
    return v4;
  }
}

- (int)_populateSwiftReflectionInfo:(SwiftReflectionInteropContext *)a3
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  [(VMUTask *)self->_task createSymbolicatorWithFlags:CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData() andNotification:0];
  CSSymbolicatorForeachSymbolOwnerAtTime();
  CSRelease();
  int v3 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __52__VMUObjectIdentifier__populateSwiftReflectionInfo___block_invoke(uint64_t a1)
{
  unint64_t BaseAddress = CSSymbolOwnerGetBaseAddress();
  uint64_t result = vmu_swift_reflection_addImage(*(int **)(a1 + 40), BaseAddress);
  if (result) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

- (void)_populateSwiftABIVariables
{
  if ([(VMUTask *)self->_task isExclaveCore])
  {
    swiftMirror = (uint64_t *)self->_swiftMirror;
    uint64_t v4 = 2;
LABEL_8:
    swiftMirror[1] = v4;
    goto LABEL_10;
  }
  if ([(VMUTask *)self->_task isExclaveCore]) {
    uint64_t SymbolOwner = CSSymbolicatorGetSymbolOwner();
  }
  else {
    uint64_t SymbolOwner = CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  }
  uint64_t v7 = SymbolOwner;
  uint64_t v8 = v6;
  if (CSIsNull())
  {
    swiftMirror = (uint64_t *)self->_swiftMirror;
    uint64_t v4 = 1;
    goto LABEL_8;
  }
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_swift_stable_abi_bit", v7, v8, 8uLL, &self->_swiftMirror->var1);
  swiftMirror = (uint64_t *)self->_swiftMirror;
LABEL_10:
  uint64_t v9 = *swiftMirror;
  if (*swiftMirror)
  {
    uint64_t v10 = swiftMirror[1];
    vmu_swift_reflection_interop_setClassIsSwiftMask(v9, v10);
  }
}

- (void)loadSwiftReflectionLibraries
{
  int v3 = getenv("SYMBOLICATION_NO_SWIFT_REMOTE_MIRROR");
  if (!v3 || (uint64_t v4 = v3, strcmp(v3, "YES")) && strcmp(v4, "1"))
  {
    uint64_t v5 = getenv("SYMBOLICATION_LOG_SWIFT_REMOTE_MIRROR_MEMORY_READS");
    if (v5) {
      int v6 = atoi(v5);
    }
    else {
      int v6 = 0;
    }
    _CSTypeRef symbolicator = self->_symbolicator;
    uint64_t v21 = MEMORY[0x1AD0DA230](self->_memoryReader);
    uint64_t v22 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:1282 valueOptions:259];
    uint64_t v23 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:1282 valueOptions:1282];
    char v24 = 0;
    uint64_t v26 = 0;
    int v25 = v6;
    objc_initWeak(&v27, self);
    objc_copyWeak(&v28, (id *)&self->_scanner);
    __copy_assignment_8_8_t0w16_sb16_s24_s32_t40w16_w56_w64((uint64_t)&self->_swiftMirrorReaderContext, (uint64_t)&symbolicator);
    ReflectionContext = (int *)vmu_swift_reflection_createReflectionContext((uint64_t)&self->_swiftMirrorReaderContext, (uint64_t)_query_data_layout_function, 0, (uint64_t)_read_bytes_function, (uint64_t)_get_string_length, (uint64_t)_get_symbol_address);
    if (ReflectionContext)
    {
      uint64_t v16 = 0;
      uint64_t v17 = &v16;
      uint64_t v18 = 0x2020000000;
      int v19 = 0;
      [(VMUObjectIdentifier *)self _dlopenLibSwiftRemoteMirror];
      libSwiftRemoteMirrors = self->_libSwiftRemoteMirrors;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __51__VMUObjectIdentifier_loadSwiftReflectionLibraries__block_invoke;
      v15[3] = &unk_1E5D24C88;
      v15[5] = &v16;
      v15[6] = ReflectionContext;
      void v15[4] = self;
      [(NSMutableDictionary *)libSwiftRemoteMirrors enumerateKeysAndObjectsUsingBlock:v15];
      if (!*((_DWORD *)v17 + 6))
      {
        vmu_swift_reflection_destroyReflectionContext(ReflectionContext);
        ReflectionContext = 0;
      }
      _Block_object_dispose(&v16, 8);
      if (ReflectionContext
        && ![(VMUObjectIdentifier *)self _populateSwiftReflectionInfo:ReflectionContext])
      {
        vmu_swift_reflection_destroyReflectionContext(ReflectionContext);
        ReflectionContext = 0;
      }
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __51__VMUObjectIdentifier_loadSwiftReflectionLibraries__block_invoke_2;
    void v14[3] = &unk_1E5D23FA8;
    v14[4] = self;
    uint64_t v9 = (void (**)(void, void, void))MEMORY[0x1AD0DA230](v14);
    if ([(VMUTask *)self->_task isExclaveCore])
    {
      uint64_t SymbolOwner = CSSymbolicatorGetSymbolOwner();
    }
    else
    {
      CSSymbolicatorForeachSymbolOwnerWithNameAtTime();
      uint64_t SymbolOwner = CSSymbolicatorGetAOutSymbolOwner();
    }
    v9[2](v9, SymbolOwner, v11);
    [(VMUObjectIdentifier *)self _loadSwiftAsyncTaskAndSlabRecognitionInfo];
    if (ReflectionContext)
    {
      uint64_t v12 = vmu_swift_reflection_interop_typeRefForMangledTypeName((uint64_t)ReflectionContext, (uint64_t)"_$sBb", 5);
      swiftMirror = self->_swiftMirror;
      if (v12) {
        swiftMirror->var2 = v12;
      }
      else {
        swiftMirror->var2 = 0;
      }
    }
    else
    {
      swiftMirror = self->_swiftMirror;
    }
    swiftMirror->var0 = (SwiftReflectionInteropContext *)ReflectionContext;

    __destructor_8_sb16_s24_s32_w56_w64((id *)&symbolicator);
  }
}

void __51__VMUObjectIdentifier_loadSwiftReflectionLibraries__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (vmu_swift_reflection_interop_addLibrary(*(void **)(a1 + 48), (void *)[a3 pointerValue]))
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (*(unsigned char *)(*(void *)(a1 + 32) + 176)) {
      NSLog(&cfstr_SymbolicationD_9.isa, v5);
    }
  }
  else if (*(unsigned char *)(*(void *)(a1 + 32) + 176))
  {
    NSLog(&cfstr_SymbolicationD_8.isa, v5);
  }
}

void __51__VMUObjectIdentifier_loadSwiftReflectionLibraries__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 176))
  {
    uint64_t Path = CSSymbolOwnerGetPath();
    uint64_t v7 = "<unavailable>";
    if (Path) {
      uint64_t v7 = (const char *)Path;
    }
    NSLog(&cfstr_SymbolicationD_10.isa, v7);
  }
  uint64_t v8 = -[VMUSwiftRuntimeInfo initWithSwiftCore:memoryReader:task:]([VMUSwiftRuntimeInfo alloc], "initWithSwiftCore:memoryReader:task:", a2, a3, *(void *)(*(void *)(a1 + 32) + 48), *(void *)(*(void *)(a1 + 32) + 8));
  if (v8)
  {
    obuint64_t j = v8;
    BOOL v9 = [(VMUSwiftRuntimeInfo *)v8 runtimeHasStableABI];
    uint64_t v10 = *(void *)(a1 + 32);
    if (v9)
    {
      if (*(void *)(v10 + 160))
      {
        uint64_t v8 = obj;
        if (!*(unsigned char *)(v10 + 176)) {
          goto LABEL_15;
        }
        NSLog(&cfstr_SymbolicationD_12.isa, obj);
      }
      else
      {
        objc_storeStrong((id *)(v10 + 160), obj);
        uint64_t v8 = obj;
        if (!*(unsigned char *)(*(void *)(a1 + 32) + 176)) {
          goto LABEL_15;
        }
        NSLog(&cfstr_SymbolicationD_11.isa, v12);
      }
    }
    else
    {
      objc_storeStrong((id *)(v10 + 168), obj);
      uint64_t v8 = obj;
      if (!*(unsigned char *)(*(void *)(a1 + 32) + 176)) {
        goto LABEL_15;
      }
      NSLog(&cfstr_SymbolicationD_13.isa, v11);
    }
    uint64_t v8 = obj;
  }
LABEL_15:
}

- (void)_loadSwiftAsyncTaskAndSlabRecognitionInfo
{
  int v3 = getenv("DT_SKIP_PRECISE_SCANNING_SWIFT_ASYNC_ALLOCATIONS");
  if (!v3 || (uint64_t v4 = v3, strcmp(v3, "YES")) && strcmp(v4, "1"))
  {
    if ([(VMUTask *)self->_task isExclaveCore]) {
      uint64_t SymbolOwner = CSSymbolicatorGetSymbolOwner();
    }
    else {
      uint64_t SymbolOwner = CSSymbolicatorGetSymbolOwnerWithNameAtTime();
    }
    uint64_t v7 = SymbolOwner;
    uint64_t v8 = v6;
    if (CSIsNull())
    {
      if (!_debugSwiftAsyncPrintfIsEnabled()) {
        return;
      }
      BOOL v9 = "libswift_Concurrency";
      goto LABEL_20;
    }
    CSSymbolicatorCreateWithTask();
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
    CSSymbolOwnerGetSymbolWithMangledName();
    if (CSIsNull())
    {
      CSRelease();
LABEL_18:
      if (!_debugSwiftAsyncPrintfIsEnabled()) {
        return;
      }
      BOOL v9 = "libswiftRemoteMirror version or it wasn't new enough";
      goto LABEL_20;
    }
    uint64_t Range = (_DWORD *)CSSymbolGetRange();
    CSRelease();
    if (!Range || *Range <= 2u) {
      goto LABEL_18;
    }
    unint64_t v16 = 0;
    _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"__swift_concurrency_debug_asyncTaskMetadata", v7, v8, 8uLL, &v16);
    unint64_t v15 = 0;
    _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"__swift_concurrency_debug_asyncTaskSlabMetadata", v7, v8, 8uLL, &v15);
    if (v16 && (unint64_t v11 = v15) != 0)
    {
      self->_swiftConcurrencyDebugAsyncTaskMetadataIsa = v16;
      self->_swiftConcurrencyDebugAsyncTaskSlabMetadataIsa = v11;
      if (CSSymbolOwnerGetPath())
      {
        uint64_t v12 = [NSString stringWithUTF8String:CSSymbolOwnerGetPath()];
      }
      else
      {
        uint64_t v12 = &stru_1EFE27F38;
      }
      id v13 = +[VMUClassInfo classInfoWithClassName:@"AsyncTask" binaryPath:v12 type:8];
      [v13 setDisplayName:@"Task stack"];
      [v13 setDefaultScanType:1];
      [v13 setIsRootClass:1];
      [(VMUClassInfoMap *)self->_realizedIsaToClassInfo addClassInfo:v13 forAddress:self->_swiftConcurrencyDebugAsyncTaskMetadataIsa];
      uint64_t v14 = +[VMUClassInfo classInfoWithClassName:@"AsyncTask Slab" binaryPath:v12 type:8];
      [v14 setDisplayName:@"Task stack"];
      [v14 setDefaultScanType:1];
      [v14 setIsRootClass:1];
      [(VMUClassInfoMap *)self->_realizedIsaToClassInfo addClassInfo:v14 forAddress:self->_swiftConcurrencyDebugAsyncTaskSlabMetadataIsa];
    }
    else if (_debugSwiftAsyncPrintfIsEnabled())
    {
      BOOL v9 = "pseudo-isas for AsyncTasks and Slabs";
LABEL_20:
      _debugSwiftAsyncPrintf(0, "Won't attempt precise Swift Concurrency allocation scanning because couldn't find %s\n", v9);
    }
  }
}

- (void)destroy_libSwiftRemoteMirror
{
  swiftMirror = (int **)self->_swiftMirror;
  if (swiftMirror)
  {
    if (*swiftMirror)
    {
      vmu_swift_reflection_destroyReflectionContext(*swiftMirror);
      swiftMirror = (int **)self->_swiftMirror;
    }
    free(swiftMirror);
    self->_swiftMirror = 0;
  }
  remoteAddressToLocalAddressAndSizeMap = self->_swiftMirrorReaderContext.remoteAddressToLocalAddressAndSizeMap;
  if (remoteAddressToLocalAddressAndSizeMap) {
    NSResetMapTable(remoteAddressToLocalAddressAndSizeMap);
  }
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  __copy_assignment_8_8_t0w16_sb16_s24_s32_t40w16_w56_w64((uint64_t)&self->_swiftMirrorReaderContext, (uint64_t)v5);
  __destructor_8_sb16_s24_s32_w56_w64((id *)v5);
}

- (BOOL)hasSwiftContent
{
  return self->_swiftRuntimeInfoStableABI || self->_swiftRuntimeInfoPreABI != 0;
}

- (BOOL)hasSwiftReflection
{
  return self->_swiftMirror->var0 != 0;
}

- (VMUObjectIdentifier)initWithTask:(unsigned int)a3
{
  return -[VMUObjectIdentifier initWithTask:symbolicator:](self, "initWithTask:symbolicator:", *(void *)&a3, 0, 0);
}

- (unsigned)objectContentLevel
{
  return self->_objectContentLevel;
}

- (void)setObjectContentLevel:(unsigned int)a3
{
  self->_unsigned int objectContentLevel = a3;
}

- (VMURangeArray)readonlyRegionRanges
{
  return self->_readonlyRegionRanges;
}

- (void)setReadonlyRegionRanges:(id)a3
{
}

- (id)memoryReader
{
  return self->_memoryReader;
}

- (VMUClassInfoMap)realizedClasses
{
  return self->_realizedIsaToClassInfo;
}

- (VMUSwiftRuntimeInfo)swiftRuntimeInfoPreABI
{
  return self->_swiftRuntimeInfoPreABI;
}

- (VMUSwiftRuntimeInfo)swiftRuntimeInfoStableABI
{
  return self->_swiftRuntimeInfoStableABI;
}

- (libSwiftRemoteMirrorWrapper)swiftMirror
{
  return self->_swiftMirror;
}

- (unint64_t)taggedPointerMask
{
  return self->_taggedPointerMask;
}

- (_CSTypeRef)symbolicator
{
  unint64_t opaque_2 = self->_symbolicator._opaque_2;
  unint64_t opaque_1 = self->_symbolicator._opaque_1;
  result._unint64_t opaque_2 = opaque_2;
  result._unint64_t opaque_1 = opaque_1;
  return result;
}

- (_CSTypeRef)libobjcSymbolOwner
{
  unint64_t opaque_2 = self->_libobjcSymbolOwner._opaque_2;
  unint64_t opaque_1 = self->_libobjcSymbolOwner._opaque_1;
  result._unint64_t opaque_2 = opaque_2;
  result._unint64_t opaque_1 = opaque_1;
  return result;
}

- (unsigned)objcABI
{
  return self->_objcABI;
}

- (unint64_t)figBaseObjectFinalizeAddress
{
  return self->_figBaseObjectFinalizeAddress;
}

- (BOOL)taskIsDriverKit
{
  return self->_taskIsDriverKit;
}

- (VMUAutoreleasePoolPageLayout)autoreleasePoolPageLayout
{
  return self->_autoreleasePoolPageLayout;
}

- (VMUTaskMemoryScanner)scanner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);

  return (VMUTaskMemoryScanner *)WeakRetained;
}

- (NSMutableDictionary)moduleNameToBinaryPathDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 368, 1);
}

- (unint64_t)swiftConcurrencyDebugAsyncTaskMetadataIsa
{
  return self->_swiftConcurrencyDebugAsyncTaskMetadataIsa;
}

- (unint64_t)swiftConcurrencyDebugAsyncTaskSlabMetadataIsa
{
  return self->_swiftConcurrencyDebugAsyncTaskSlabMetadataIsa;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_driverKitSupport, 0);
  objc_storeStrong((id *)&self->_targetProcessVMranges, 0);
  objc_storeStrong((id *)&self->_moduleNameToBinaryPathDict, 0);
  objc_storeStrong((id *)&self->_pidToProcessNameDict, 0);
  objc_storeStrong((id *)&self->_stringUniquingSet, 0);
  objc_storeStrong((id *)&self->_itemCountToLabelStringUniquingMap, 0);
  objc_storeStrong((id *)&self->_isaToObjectLabelHandlerMap, 0);
  objc_storeStrong((id *)&self->_nonObjectIsaHash, 0);
  objc_storeStrong((id *)&self->_lastCPlusPlusClassInfo, 0);
  objc_storeStrong(&self->_isaTranslator, 0);
  objc_storeStrong((id *)&self->_nonobjectClassInfosDict, 0);
  objc_storeStrong((id *)&self->_coreMediaFigBaseClassToClassInfo, 0);
  objc_storeStrong((id *)&self->_cfTypeIDToClassInfo, 0);
  objc_storeStrong((id *)&self->_unrealizedClassInfos, 0);
  objc_storeStrong((id *)&self->_realizedIsaToClassInfo, 0);
  objc_storeStrong((id *)&self->_readonlyRegionRanges, 0);
  objc_storeStrong((id *)&self->_swiftRuntimeInfoPreABI, 0);
  objc_storeStrong((id *)&self->_swiftRuntimeInfoStableABI, 0);
  objc_storeStrong((id *)&self->_libSwiftRemoteMirrors, 0);
  __destructor_8_sb16_s24_s32_w56_w64((id *)&self->_swiftMirrorReaderContext);
  objc_destroyWeak((id *)&self->_scanner);
  objc_storeStrong(&self->_memoryReader, 0);

  objc_storeStrong((id *)&self->_task, 0);
}

@end