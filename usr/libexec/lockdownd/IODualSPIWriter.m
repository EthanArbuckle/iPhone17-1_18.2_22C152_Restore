@interface IODualSPIWriter
- (BOOL)_crossingRegionChangeBoundary;
- (BOOL)_headerMatchesBootSFRManifestHash:(id)a3;
- (BOOL)_usesExtendediBootRegion;
- (BOOL)headerIsInvalid:(id)a3;
- (BOOL)usesAFUH;
- (BOOL)verifyFirmwareAtIndex:(unint64_t)a3 againstData:(id)a4;
- (BOOL)verifyHeadersAtIndex:(unint64_t)a3;
- (IODualSPIWriter)initWithService:(unsigned int)a3;
- (NSData)regData;
- (NSMutableArray)invalidHeaders;
- (const)regBuffer;
- (const)regStruct;
- (id)_getSFRManifestHashForPayload:(id)a3;
- (id)_loadRegionLayout:(unsigned int)a3;
- (id)findHeaders;
- (id)readDataAtOffset:(unsigned int)a3 ofLength:(unsigned int)a4;
- (int)_commitHeader:(id)a3 withError:(id *)a4;
- (int)_writeBytes:(char *)a3 atOffset:(unsigned int)a4 ofLength:(unsigned int)a5 withError:(id *)a6;
- (int)_writeFirmware:(id)a3 toHeader:(id)a4 withError:(id *)a5;
- (int)commitHeaderAtIndex:(unint64_t)a3 withError:(id *)a4;
- (int)commitPreparedHeaderWithError:(id *)a3;
- (int)eraseBytes:(unsigned int)a3 ofLength:(unsigned int)a4 withError:(id *)a5;
- (int)openService;
- (int)readDataAtOffset:(unsigned int)a3 ofLength:(unsigned int)a4 intoBuffer:(void *)a5;
- (int)writeData:(id)a3 withError:(id *)a4;
- (int)writeFirstGenerationFirmware:(id)a3 withError:(id *)a4;
- (int)writeNewerGenerationFirmware:(id)a3 withError:(id *)a4;
- (unint64_t)findPreparedHeader;
- (unsigned)_findFirmwareInfoEntry;
- (unsigned)_maxExtendedRegionSize;
- (unsigned)_maxImageSize;
- (unsigned)regSize;
- (unsigned)spiDriverConnect;
- (void)dealloc;
- (void)markHeaderAsInvalid:(id)a3;
- (void)setInvalidHeaders:(id)a3;
- (void)setRegBuffer:(const char *)a3;
- (void)setRegData:(id)a3;
- (void)setRegSize:(unsigned int)a3;
- (void)setRegStruct:(const _reg_format_union *)a3;
- (void)setSpiDriverConnect:(unsigned int)a3;
@end

@implementation IODualSPIWriter

- (IODualSPIWriter)initWithService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)IODualSPIWriter;
  v4 = -[IOServiceWriter initWithService:](&v7, "initWithService:");
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)&v4->_usesAFUH = 0;
    *((unsigned char *)&v4->super._serviceConnect + 4) = +[MSUBootFirmwareUpdater supportsAFUH];
    *(const _reg_format_union **)((char *)&v5->_regStruct + 4) = (const _reg_format_union *)[[-[IODualSPIWriter _loadRegionLayout:](v5, "_loadRegionLayout:", v3) copy];
    *(NSData **)((char *)&v5->_regData + 4) = (NSData *)objc_alloc_init((Class)NSMutableArray);
    if (![*(id *)((char *)&v5->_regStruct + 4) length])
    {

      return 0;
    }
  }
  return v5;
}

- (unsigned)_findFirmwareInfoEntry
{
  io_registry_entry_t v2 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/product/util");
  if (v2)
  {
    unsigned int v3 = v2;
    if (sub_1000A1940(v2)) {
      return v3;
    }
    IOObjectRelease(v3);
  }
  io_iterator_t iterator = 0;
  unsigned int v3 = 0;
  if (!IORegistryCreateIterator(kIOMasterPortDefault, "IODeviceTree", 1u, &iterator))
  {
    do
    {
      io_registry_entry_t v4 = IOIteratorNext(iterator);
      unsigned int v3 = v4;
    }
    while (v4 && !sub_1000A1940(v4));
    IOObjectRelease(iterator);
  }
  return v3;
}

- (id)_loadRegionLayout:(unsigned int)a3
{
  io_registry_entry_t v4 = [(IODualSPIWriter *)self _findFirmwareInfoEntry];
  if (v4)
  {
    io_object_t v5 = v4;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v4, @"fw-regions", 0, 0);
    objc_super v7 = (id)CFMakeCollectable(CFProperty);
    IOObjectRelease(v5);
  }
  else
  {
    objc_super v7 = 0;
  }
  if (![v7 length])
  {
    CFTypeRef v8 = IORegistryEntrySearchCFProperty(a3, "IOService", @"reg", 0, 3u);
    objc_super v7 = (id)CFMakeCollectable(v8);
    if (![v7 length])
    {
      iBU_LOG_real(@"Found none of the required DT Properties (looked for 'low-level-fw-device-info' and 'reg')", "-[IODualSPIWriter _loadRegionLayout:]", v9, v10, v11, v12, v13, v14, v16);
      return 0;
    }
  }
  return v7;
}

- (int)writeData:(id)a3 withError:(id *)a4
{
  if ([(IOServiceWriter *)self isErase])
  {
    return [(IODualSPIWriter *)self writeFirstGenerationFirmware:a3 withError:a4];
  }
  else
  {
    return [(IODualSPIWriter *)self writeNewerGenerationFirmware:a3 withError:a4];
  }
}

- (int)openService
{
  kern_return_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  CFStringRef v3 = IORegistryEntryCopyPath([(IOServiceWriter *)self service], "IOService");
  if (*(_DWORD *)&self->_usesAFUH) {
    return 0;
  }
  CFStringRef v11 = v3;
  if (v3)
  {
    iBU_LOG_real(@"Matched service is: %@", "-[IODualSPIWriter openService]", v4, v5, v6, v7, v8, v9, (uint64_t)v3);
    CFRelease(v11);
  }
  if (!*(const _reg_format_union **)((char *)&self->_regStruct + 4)) {
    return -536870160;
  }
  io_service_t v12 = [(IOServiceWriter *)self service];
  uint64_t v13 = IOServiceOpen(v12, mach_task_self_, 0, (io_connect_t *)&self->_usesAFUH);
  *(void *)(&self->_regSize + 1) = [*(id *)((char *)&self->_regStruct + 4) bytes];
  *(const char **)((char *)&self->_regBuffer + 4) = (const char *)[*(id *)((char *)&self->_regStruct + 4) bytes];
  uint64_t v14 = [*(id *)((char *)&self->_regStruct + 4) length];
  self->_spiDriverConnect = v14;
  iBU_LOG_real(@"RegSize is: %d", "-[IODualSPIWriter openService]", v15, v16, v17, v18, v19, v20, (uint64_t)v14);
  return v13;
}

- (unsigned)_maxImageSize
{
  unsigned int spiDriverConnect = self->_spiDriverConnect;
  if (spiDriverConnect != 40)
  {
    if (spiDriverConnect == 32) {
      return 0x200000;
    }
    if (spiDriverConnect != 24)
    {
      unsigned int v9 = 0x200000;
      iBU_LOG_real(@"Unknown reg region size of %d. Returning the default iBootMaxPayloadSize of 0x%x", "-[IODualSPIWriter _maxImageSize]", v2, v3, v4, v5, v6, v7, self->_spiDriverConnect);
      return v9;
    }
  }
  return (*(_DWORD **)((char *)&self->_regBuffer + 4))[3];
}

- (unsigned)_maxExtendedRegionSize
{
  if (self->_spiDriverConnect == 40) {
    return (*(_DWORD **)((char *)&self->_regBuffer + 4))[7];
  }
  else {
    return 0;
  }
}

- (BOOL)_usesExtendediBootRegion
{
  return self->_spiDriverConnect == 40;
}

- (BOOL)_crossingRegionChangeBoundary
{
  unsigned int spiDriverConnect = self->_spiDriverConnect;
  io_registry_entry_t v3 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/chosen");
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v3, @"board-id", kCFAllocatorDefault, 0);
  CFDataRef v5 = (const __CFData *)IORegistryEntryCreateCFProperty(v3, @"chip-id", kCFAllocatorDefault, 0);
  uint64_t v6 = *(unsigned int *)CFDataGetBytePtr(CFProperty);
  uint64_t v7 = *(unsigned int *)CFDataGetBytePtr(v5);
  v14[0] = +[NSNumber numberWithInt:8];
  v14[1] = +[NSNumber numberWithInt:9];
  v14[2] = +[NSNumber numberWithInt:10];
  v14[3] = +[NSNumber numberWithInt:11];
  v14[4] = +[NSNumber numberWithInt:12];
  v14[5] = +[NSNumber numberWithInt:13];
  v14[6] = +[NSNumber numberWithInt:15];
  v14[7] = +[NSNumber numberWithInt:4];
  v14[8] = +[NSNumber numberWithInt:5];
  v14[9] = +[NSNumber numberWithInt:16];
  uint64_t v8 = +[NSArray arrayWithObjects:v14 count:10];
  v13[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 24577, +[NSNumber numberWithInt:24576]);
  v13[2] = +[NSNumber numberWithInt:24578];
  unsigned int v9 = +[NSArray arrayWithObjects:v13 count:3];
  unsigned int v10 = [(NSArray *)v8 containsObject:+[NSNumber numberWithUnsignedInt:v6]];
  unsigned __int8 v11 = 0;
  if (v10) {
    unsigned __int8 v11 = [(NSArray *)v9 containsObject:+[NSNumber numberWithUnsignedInt:v7]];
  }
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  if (v5) {
    CFRelease(v5);
  }
  if (v3) {
    IOObjectRelease(v3);
  }
  if (spiDriverConnect == 24) {
    return v11;
  }
  else {
    return 0;
  }
}

- (id)_getSFRManifestHashForPayload:(id)a3
{
  id v5 = objc_alloc_init((Class)NSMutableData);
  [v5 appendData:-[IODualSPIWriter readDataAtOffset:ofLength:](self, "readDataAtOffset:ofLength:", [a3 imageAddress], [-IODualSPIWriter _maxImageSize](self, "_maxImageSize"))];
  if ([(IODualSPIWriter *)self _usesExtendediBootRegion]) {
    [v5 appendData:-[IODualSPIWriter readDataAtOffset:ofLength:](self, "readDataAtOffset:ofLength:", objc_msgSend(a3, "secondaryPayloadOffset"), -[IODualSPIWriter _maxExtendedRegionSize](self, "_maxExtendedRegionSize"))];
  }
  uint64_t v40 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  *(_OWORD *)md = 0u;
  if (!v5
    || ([v5 bytes],
        [(IODualSPIWriter *)self _maxImageSize],
        Img4DecodeParseLengthFromBuffer())
    || ([v5 bytes], Img4DecodeInit()))
  {
    uint64_t v7 = 0;
  }
  else
  {
    Img4DecodeGetManifest();
    CC_SHA384(0, 0, md);
    uint64_t v7 = +[NSData dataWithBytes:md length:48];
  }

  return v7;
}

- (BOOL)_headerMatchesBootSFRManifestHash:(id)a3
{
  id v6 = [(IODualSPIWriter *)self _getSFRManifestHashForPayload:a3];
  io_registry_entry_t v7 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/chosen/secure-boot-hashes");
  LOBYTE(v6) = [v6 isEqualToData:IORegistryEntryCreateCFProperty(v7, @"sfr-manifest-hash", kCFAllocatorDefault, 0)];
  return (char)v6;
}

- (int)writeNewerGenerationFirmware:(id)a3 withError:(id *)a4
{
  id v6 = 0;
  uint64_t v7 = 1;
  do
  {
    if (v6) {

    }
    id v6 = [(IODualSPIWriter *)self findHeaders];
    if ((unint64_t)[v6 count] <= 1)
    {
      if (a4)
      {
        id v112 = [v6 count];
        *a4 = MSUBootFirmwareError(-536870167, 0, @"writeNewerGenerationFirmware: couldn't find enough headers (only found %d of %d)", v113, v114, v115, v116, v117, (uint64_t)v112);
      }
      int v111 = -536870167;
      goto LABEL_54;
    }
    id v8 = [v6 objectAtIndex:0];
    id v9 = [v6 objectAtIndex:1];
    unsigned int v10 = [v8 headerGeneration];
    if (v10 >= [v9 headerGeneration]) {
      id v17 = v9;
    }
    else {
      id v17 = v8;
    }
    if (v8 == v17) {
      long long v18 = v9;
    }
    else {
      long long v18 = v8;
    }
    uint64_t v122 = 0;
    iBU_LOG_real(@"Older header: %@", "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v11, v12, v13, v14, v15, v16, (uint64_t)v17);
    iBU_LOG_real(@"Newer header: %@", "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v19, v20, v21, v22, v23, v24, (uint64_t)v18);
    unsigned int v25 = [v17 isValid];
    unsigned int v26 = [v18 isValid];
    int v33 = v26 ^ 1;
    if (((v25 ^ 1) & 1) == 0 && (v33 & 1) == 0)
    {
      iBU_LOG_real(@"Both headers are valid. Checking to see which one we're booted from.", "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v27, v28, v29, v30, v31, v32, v119);
      if (![(IODualSPIWriter *)self usesAFUH])
      {
        [v18 headerGeneration];
        iBU_LOG_real(@"Both headers are valid. Selecting older header %@ (vs gc=0x%x).", "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v46, v47, v48, v49, v50, v51, (uint64_t)v17);
        goto LABEL_26;
      }
      if ([(IODualSPIWriter *)self _headerMatchesBootSFRManifestHash:v18])
      {
        iBU_LOG_real(@"Overwriting older header %@ because we're booted from the newer header.", "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v34, v35, v36, v37, v38, v39, (uint64_t)v17);
LABEL_26:
        id v8 = v17;
        goto LABEL_27;
      }
      if (![(IODualSPIWriter *)self _headerMatchesBootSFRManifestHash:v17])
      {
        [v18 headerGeneration];
        iBU_LOG_real(@"Both headers are valid and we're not booted from either? Selecting older header %@ (vs gc=0x%x).", "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v58, v59, v60, v61, v62, v63, (uint64_t)v17);
        goto LABEL_26;
      }
      iBU_LOG_real(@"Overwriting newer header %@ because we're booted from the older header.", "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v52, v53, v54, v55, v56, v57, (uint64_t)v18);
      goto LABEL_23;
    }
    if (((v25 ^ 1 | v26) & 1) == 0)
    {
      iBU_LOG_real(@"Older header is valid, newer is not. Selecting newer header %@", "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v27, v28, v29, v30, v31, v32, (uint64_t)v18);
LABEL_23:
      id v8 = v18;
      long long v18 = v17;
      goto LABEL_27;
    }
    if (((v25 | v33) & 1) == 0)
    {
      iBU_LOG_real(@"Newer header is valid, older is not. Selecting older header %@", "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v27, v28, v29, v30, v31, v32, (uint64_t)v17);
      goto LABEL_26;
    }
    [v8 setHeaderGeneration:0];
    iBU_LOG_real(@"Neither header is valid. Setting header0 to gen0.", "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v40, v41, v42, v43, v44, v45, v119);
    long long v18 = v9;
LABEL_27:
    if ([v8 headerGeneration] == -1
      && [v18 headerGeneration] == -1)
    {
      unint64_t v65 = 0;
    }
    else
    {
      unsigned int v64 = [v8 headerGeneration];
      unint64_t v65 = (unint64_t)[v18 headerGeneration];
      if (v64 != -1)
      {
        id v66 = [v8 headerGeneration];
        unsigned int v67 = v66;
        if (v65 == -1)
        {
          unint64_t v65 = (unint64_t)v66;
        }
        else
        {
          unsigned int v68 = [v18 headerGeneration];
          if (v67 <= v68) {
            unint64_t v65 = v68;
          }
          else {
            unint64_t v65 = v67;
          }
        }
      }
    }
    [v8 setHeaderGeneration:v65];
    [v8 bumpGeneration];
    [v8 invalidate];
    if ([(IODualSPIWriter *)self _usesExtendediBootRegion]
      && [(IODualSPIWriter *)self _crossingRegionChangeBoundary])
    {
      self->_unsigned int spiDriverConnect = 40;
      *(const char **)((char *)&self->_regBuffer + 4) = (const char *)&unk_10016EA64;
      [v8 setImageAddress:0x20000];
      [v8 setSecondaryPayloadOffset:0x400000];
    }
    iBU_LOG_real(@"Writing updated header and images.", "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v69, v70, v71, v72, v73, v74, v120);
    unsigned int v75 = [(IODualSPIWriter *)self _writeFirmware:a3 toHeader:v8 withError:&v122];
    id v76 = [v8 headerGeneration];
    [v8 startLocation];
    if (v75)
    {
      iBU_LOG_real(@"Failed to write newer-generation firmware images to update header with generation 0x%x at offset 0x%x. Invalidating this header, then trying again with a different header.", "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v77, v78, v79, v80, v81, v82, (uint64_t)v76);
    }
    else
    {
      iBU_LOG_real(@"Successfully wrote newer-generation firmware images to update header with generation 0x%x at offset 0x%x.", "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v77, v78, v79, v80, v81, v82, (uint64_t)v76);
      if (![(IOServiceWriter *)self shouldCommit]) {
        goto LABEL_53;
      }
      id v89 = [v8 headerGeneration];
      iBU_LOG_real(@"Committing updated header with newer-generation 0x%x", "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v90, v91, v92, v93, v94, v95, (uint64_t)v89);
      unsigned int v96 = [(IODualSPIWriter *)self _commitHeader:v8 withError:&v122];
      id v97 = [v8 headerGeneration];
      [v8 startLocation];
      if (!v96)
      {
        iBU_LOG_real(@"Successfully committed header with newer-generation 0x%x at offset 0x%x.", "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v98, v99, v100, v101, v102, v103, (uint64_t)v97);
LABEL_53:
        iBU_LOG_real(@"Successfully wrote newer-generation firmware after %d retries.", "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v83, v84, v85, v86, v87, v88, v7);
        int v111 = 0;
        if (!v6) {
          return v111;
        }
LABEL_54:

        return v111;
      }
      iBU_LOG_real(@"Failed to commit header with newer-generation 0x%x at offset 0x%x. Invalidating this header, then trying again with a different header.", "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v98, v99, v100, v101, v102, v103, (uint64_t)v97);
    }
    [(IODualSPIWriter *)self markHeaderAsInvalid:v8];
    int v109 = v7 + 1;
    unsigned int v110 = v7 - 1;
    uint64_t v7 = (v7 + 1);
  }
  while (v110 < 0x1F);
  int v111 = -536870167;
  if (a4) {
    *a4 = MSUBootFirmwareError(-536870167, 0, @"writeNewerGenerationFirmware: couldn't find enough headers after %d retries.", v104, v105, v106, v107, v108, (v109 - 1));
  }
  if (v6) {
    goto LABEL_54;
  }
  return v111;
}

- (int)writeFirstGenerationFirmware:(id)a3 withError:(id *)a4
{
  id v4 = a3;
  id v6 = 0;
  CFStringRef v7 = @"Invalidated header0 in memory. %@";
  CFStringRef v8 = @"Invalidated header1 in memory. %@";
  CFStringRef v9 = @"Resetting header0 to Generation 1.";
  uint64_t v10 = 1;
  while (1)
  {
    if (v6) {

    }
    id v6 = [(IODualSPIWriter *)self findHeaders];
    if ((unint64_t)[v6 count] <= 1)
    {
      id v76 = a4;
      if (a4)
      {
        uint64_t v77 = (v10 - 1);
        id v78 = [v6 count];
        *a4 = MSUBootFirmwareError(-536870167, 0, @"writeFirstGenerationFirmware: couldn't find enough headers (only found %d of %d)", v79, v80, v81, v82, v83, (uint64_t)v78);
LABEL_18:
        int v84 = -536870167;
        *id v76 = MSUBootFirmwareError(-536870167, 0, @"writeFirstGenerationFirmware: couldn't find enough headers after %d retries.", v69, v70, v71, v72, v73, v77);
        if (!v6) {
          return v84;
        }
        goto LABEL_21;
      }
LABEL_20:
      int v84 = -536870167;
      if (!v6) {
        return v84;
      }
      goto LABEL_21;
    }
    id v11 = [v6 objectAtIndex:0];
    id v12 = [v6 objectAtIndex:1];
    uint64_t v91 = 0;
    [v11 invalidate];
    iBU_LOG_real((uint64_t)v7, "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]", v13, v14, v15, v16, v17, v18, (uint64_t)v11);
    [v12 invalidate];
    iBU_LOG_real((uint64_t)v8, "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]", v19, v20, v21, v22, v23, v24, (uint64_t)v12);
    iBU_LOG_real((uint64_t)v9, "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]", v25, v26, v27, v28, v29, v30, v86);
    [v11 setAsFirstGeneration];
    if (![(IODualSPIWriter *)self _writeFirmware:v4 toHeader:v11 withError:&v91])break; {
    id v37 = [v11 startLocation];
    }
    iBU_LOG_real(@"Failed to write firmware images to header0 at offset 0x%x. Invalidating this header, then trying again with a different header.", "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]", v38, v39, v40, v41, v42, v43, (uint64_t)v37);
LABEL_13:
    [(IODualSPIWriter *)self markHeaderAsInvalid:v12];
    int v74 = v10 + 1;
    unsigned int v75 = v10 - 1;
    uint64_t v10 = (v10 + 1);
    if (v75 >= 0x1F)
    {
      id v76 = a4;
      if (a4)
      {
        uint64_t v77 = (v74 - 1);
        goto LABEL_18;
      }
      goto LABEL_20;
    }
  }
  CFStringRef v44 = v9;
  CFStringRef v45 = v8;
  CFStringRef v46 = v7;
  iBU_LOG_real(@"Erasing header1.", "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]", v31, v32, v33, v34, v35, v36, v87);
  unsigned int v47 = [-[IODualSPIWriter eraseBytes:ofLength:withError:](self, "eraseBytes:ofLength:withError:", [v12 startLocation], [v12 length], &v91);
  id v48 = [v12 startLocation];
  if (v47)
  {
    iBU_LOG_real(@"Failed to erase header1 at offset 0x%x. Invalidating this header, then trying again with a different header.", "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]", v49, v50, v51, v52, v53, v54, (uint64_t)v48);
LABEL_12:
    CFStringRef v7 = v46;
    CFStringRef v8 = v45;
    CFStringRef v9 = v44;
    id v4 = a3;
    goto LABEL_13;
  }
  iBU_LOG_real(@"Successfully wrote header1 at offset 0x%x.", "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]", v49, v50, v51, v52, v53, v54, (uint64_t)v48);
  if (![(IOServiceWriter *)self shouldCommit]) {
    goto LABEL_24;
  }
  iBU_LOG_real(@"Committing header0 to the first partition.", "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]", v55, v56, v57, v58, v59, v60, v88);
  unsigned int v61 = [(IODualSPIWriter *)self _commitHeader:v11 withError:&v91];
  id v62 = [v11 startLocation];
  if (v61)
  {
    iBU_LOG_real(@"Failed to commit header0 at offset 0x%x to the first partition. Invalidating this header, then trying again with a different header.", "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]", v63, v64, v65, v66, v67, v68, (uint64_t)v62);
    id v12 = v11;
    goto LABEL_12;
  }
  iBU_LOG_real(@"Successfully committed header0 at offset 0x%x.", "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]", v63, v64, v65, v66, v67, v68, (uint64_t)v62);
LABEL_24:
  iBU_LOG_real(@"Successfully wrote firmware after %d retries.", "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]", v55, v56, v57, v58, v59, v60, v10);
  int v84 = 0;
  if (v6) {
LABEL_21:
  }

  return v84;
}

- (void)markHeaderAsInvalid:(id)a3
{
  iBU_LOG_real(@"Marking header as invalid: %@", "-[IODualSPIWriter markHeaderAsInvalid:]", (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)a3);
  uint64_t v10 = [(IODualSPIWriter *)self invalidHeaders];

  [(NSMutableArray *)v10 addObject:a3];
}

- (BOOL)headerIsInvalid:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(IODualSPIWriter *)self invalidHeaders];
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      CFStringRef v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        CFStringRef v9 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v8);
        unsigned int v10 = [a3 startLocation];
        if (v10 == [v9 startLocation])
        {
          LOBYTE(v5) = 1;
          return (char)v5;
        }
        CFStringRef v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      id v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }
  return (char)v5;
}

- (int)commitHeaderAtIndex:(unint64_t)a3 withError:(id *)a4
{
  id v7 = [(IODualSPIWriter *)self findHeaders];
  if ((unint64_t)[v7 count] >= a3 + 1)
  {
    int v8 = -[IODualSPIWriter _commitHeader:withError:](self, "_commitHeader:withError:", [v7 objectAtIndex:a3], a4);
  }
  else
  {
    int v8 = -536870212;
    if (a4)
    {
      id v9 = [v7 count];
      *a4 = MSUBootFirmwareError(-536870212, 0, @"commitHeaderAtIndex: couldn't find enough headers (only found %d of %d)", v10, v11, v12, v13, v14, (uint64_t)v9);
    }
  }

  return v8;
}

- (int)commitPreparedHeaderWithError:(id *)a3
{
  unint64_t v5 = [(IODualSPIWriter *)self findPreparedHeader];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3) {
      *a3 = MSUBootFirmwareError(-536870212, 0, @"commitPreparedHeader: couldn't find valid preparedHeader", v6, v7, v8, v9, v10, v12);
    }
    return -536870212;
  }
  else
  {
    return [(IODualSPIWriter *)self commitHeaderAtIndex:v5 withError:a3];
  }
}

- (unint64_t)findPreparedHeader
{
  id v2 = [(IODualSPIWriter *)self findHeaders];
  if ((unint64_t)[v2 count] > 1)
  {
    id v11 = [v2 objectAtIndexedSubscript:0];
    id v12 = [v2 objectAtIndexedSubscript:1];
    id v13 = [v11 compareTo:v12];
    iBU_LOG_real(@"Header0: %@", "-[IODualSPIWriter findPreparedHeader]", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    iBU_LOG_real(@"Header1: %@", "-[IODualSPIWriter findPreparedHeader]", v20, v21, v22, v23, v24, v25, (uint64_t)v12);
    uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
    if (v13 == (id)1) {
      uint64_t v26 = 0;
    }
    if (v13 == (id)-1) {
      unint64_t v10 = 1;
    }
    else {
      unint64_t v10 = v26;
    }
  }
  else
  {
    id v3 = [v2 count];
    iBU_LOG_real(@"Error: findPreparedHeader: couldn't find enough headers (found %d of 2)", "-[IODualSPIWriter findPreparedHeader]", v4, v5, v6, v7, v8, v9, (uint64_t)v3);
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v10;
}

- (id)findHeaders
{
  if ([(IODualSPIWriter *)self usesAFUH])
  {
    [(IODualSPIWriter *)self _maxImageSize];
    v79[0] = +[NSNumber numberWithUnsignedInt:0x20000];
    v79[1] = +[NSNumber numberWithUnsignedInt:[(IODualSPIWriter *)self _maxImageSize] + 0x20000];
    uint64_t v9 = +[NSArray arrayWithObjects:v79 count:2];
    id v10 = [(NSArray *)v9 mutableCopy];
    unsigned int v76 = [(IODualSPIWriter *)self _usesExtendediBootRegion];
    if (v76)
    {
      v78[0] = +[NSNumber numberWithUnsignedInt:(*(unsigned int **)((char *)&self->_regBuffer + 4))[6]];
      v78[1] = +[NSNumber numberWithUnsignedInt:(*(unsigned int **)((char *)&self->_regBuffer + 4))[8]];
      id v77 = [+[NSArray arrayWithObjects:v78 count:2] mutableCopy];
    }
    else
    {
      id v77 = 0;
    }
    uint64_t v32 = [(NSArray *)v9 count];
    uint64_t v33 = +[NSMutableArray arrayWithCapacity:32];
    uint64_t v34 = 0;
    unint64_t v35 = 0;
    do
    {
      uint64_t v36 = [[MSUiBootHeaderV2 alloc] initWithIOServiceWriter:self];
      [(MSUiBootHeaderV2 *)v36 loadHeaderAtOffset:v34];
      if ([(MSUiBootHeaderV2 *)v36 validHeaderSignature]
        && [(NSArray *)v9 containsObject:+[NSNumber numberWithUnsignedInt:[(MSUiBootHeader *)v36 imageAddress]]]&& ![(IODualSPIWriter *)self headerIsInvalid:v36])
      {
        [v10 removeObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[MSUiBootHeader imageAddress](v36, "imageAddress"))]];
        [v77 removeObject:[NSNumber numberWithUnsignedInt:-[MSUiBootHeaderV2 secondaryPayloadOffset](v36, "secondaryPayloadOffset")]];
        [(NSMutableArray *)v33 insertObject:v36 atIndex:v35++];
      }
      else
      {
        [(MSUiBootHeader *)v36 setImageAddress:0];
        [(MSUiBootHeaderV2 *)v36 setSecondaryPayloadOffset:0];
        [(NSMutableArray *)v33 addObject:v36];
      }
      if (v35 >= (unint64_t)v32) {
        break;
      }
      BOOL v37 = v34 == 126976;
      v34 += 4096;
    }
    while (!v37);
    -[NSMutableArray removeObjectsInRange:](v33, "removeObjectsInRange:", v32, (unsigned char *)[(NSMutableArray *)v33 count] - v32);
    if ([(NSMutableArray *)v33 count] < v32)
    {
      id v44 = [(NSMutableArray *)v33 count];
      iBU_LOG_real(@"Fatal error: Only found %d of the required %d AFUH-style headers.", "-[IODualSPIWriter findHeaders]", v45, v46, v47, v48, v49, v50, (uint64_t)v44);
      return objc_alloc_init((Class)NSArray);
    }
    iBU_LOG_real(@"AFUH style header", "-[IODualSPIWriter findHeaders]", v38, v39, v40, v41, v42, v43, v74);
    if ([(NSMutableArray *)v33 count])
    {
      for (unint64_t i = 0; i < (unint64_t)[(NSMutableArray *)v33 count]; ++i)
      {
        id v52 = [(NSMutableArray *)v33 objectAtIndexedSubscript:i];
        [v52 startLocation];
        iBU_LOG_real(@"iBootHeader%lu loaded from offset: 0x%08lx (slot %lu)", "-[IODualSPIWriter findHeaders]", v53, v54, v55, v56, v57, v58, i);
        if (![v52 imageAddress] || objc_msgSend(v52, "imageAddress") == -1)
        {
          id v59 = [[v10 objectAtIndexedSubscript:0] unsignedIntegerValue];
          [v10 removeObjectAtIndex:0];
          [v52 setImageAddress:v59];
          iBU_LOG_real(@"iBootHeader%lu payload is missing; using next available: 0x%08lx",
            "-[IODualSPIWriter findHeaders]",
            v60,
            v61,
            v62,
            v63,
            v64,
            v65,
            i);
        }
        if ([v52 secondaryPayloadOffset])
        {
          if ([v52 secondaryPayloadOffset] == -1) {
            char v66 = v76;
          }
          else {
            char v66 = 0;
          }
          if ((v66 & 1) == 0) {
            continue;
          }
        }
        else if (!v76)
        {
          continue;
        }
        id v67 = [[v77 objectAtIndexedSubscript:0] unsignedIntegerValue];
        [v77 removeObjectAtIndex:0];
        [v33 objectAtIndexedSubscript:i] setSecondaryPayloadOffset:v67;
        iBU_LOG_real(@"iBootHeader%lu secondary payload is missing, using next available: 0x%08lx", "-[IODualSPIWriter findHeaders]", v68, v69, v70, v71, v72, v73, i);
      }
    }
    return [(NSMutableArray *)v33 copy];
  }
  else
  {
    iBU_LOG_real(@"Old style header", "-[IODualSPIWriter findHeaders]", v3, v4, v5, v6, v7, v8, v74);
    id v11 = *(unsigned int **)(&self->_regSize + 1);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[2];
    uint64_t v14 = v11[4];
    uint64_t v15 = v11[6];
    uint64_t v16 = [[MSUiBootHeaderV1 alloc] initWithIOServiceWriter:self];
    uint64_t v17 = [[MSUiBootHeaderV1 alloc] initWithIOServiceWriter:self];
    if (![(MSUiBootHeaderV1 *)v16 loadHeaderAtOffset:v14]) {
      iBU_LOG_real(@"Reading iBoot0 failed?!", "-[IODualSPIWriter findHeaders]", v18, v19, v20, v21, v22, v23, v75);
    }
    [(MSUiBootHeader *)v16 setImageAddress:v12];
    if (![(MSUiBootHeaderV1 *)v17 loadHeaderAtOffset:v15]) {
      iBU_LOG_real(@"Reading iBoot1 failed?!", "-[IODualSPIWriter findHeaders]", v24, v25, v26, v27, v28, v29, v75);
    }
    [(MSUiBootHeader *)v17 setImageAddress:v13];
    id v30 = [objc_alloc((Class)NSArray) initWithObjects:v16, v17, nil];

    return v30;
  }
}

- (id)readDataAtOffset:(unsigned int)a3 ofLength:(unsigned int)a4
{
  __int16 v5 = a3;
  uint64_t v7 = a3 & 0xFFFFF000;
  size_t v8 = ((a3 + a4 + 4095) & 0xFFFFF000) - v7;
  uint64_t v9 = (char *)malloc(v8);
  if ([(IODualSPIWriter *)self readDataAtOffset:v7 ofLength:v8 intoBuffer:v9])
  {
    id v10 = 0;
  }
  else
  {
    id v10 = +[NSData dataWithBytes:&v9[v5 & 0xFFF] length:a4];
  }
  free(v9);
  return v10;
}

- (BOOL)verifyHeadersAtIndex:(unint64_t)a3
{
  id v4 = [(IODualSPIWriter *)self findHeaders];
  if ((unint64_t)[v4 count] <= 1)
  {
    id v23 = [v4 count];
    iBU_LOG_real(@"Only %d of 2 headers found, cannot verify", "-[IODualSPIWriter verifyHeadersAtIndex:]", v5, v6, v7, v8, v9, v10, (uint64_t)v23);
LABEL_9:
    BOOL v12 = 0;
    goto LABEL_10;
  }
  id v11 = [v4 objectAtIndexedSubscript:0];
  BOOL v12 = 1;
  id v13 = [v4 objectAtIndexedSubscript:1];
  id v14 = [v4 objectAtIndexedSubscript:a3];
  if (v14 == v11) {
    id v11 = v13;
  }
  if ([v11 isValid])
  {
    unsigned int v15 = [v14 headerGeneration];
    if (v15 <= [v11 headerGeneration])
    {
      [v11 headerGeneration];
      [v14 headerGeneration];
      iBU_LOG_real(@"Header at partition %lu does not have a larger generation count than existing valid header (%d !> %d)", "-[IODualSPIWriter verifyHeadersAtIndex:]", v16, v17, v18, v19, v20, v21, a3);
      goto LABEL_9;
    }
    BOOL v12 = 1;
  }
LABEL_10:

  return v12;
}

- (BOOL)verifyFirmwareAtIndex:(unint64_t)a3 againstData:(id)a4
{
  id v7 = [(IODualSPIWriter *)self findHeaders];
  if ((unint64_t)[v7 count] >= a3 + 1)
  {
    id v16 = [v7 objectAtIndexedSubscript:a3];
    unsigned __int8 v15 = [[-[IODualSPIWriter readDataAtOffset:ofLength:](self, "readDataAtOffset:ofLength:", objc_msgSend(v16, "imageAddress"), objc_msgSend(a4, "length")) isEqual:a4];
    if ((v15 & 1) == 0) {
      iBU_LOG_real(@"Header %lu firmware image did not match reference firmware image (Stored %@ != Reference %@)", "-[IODualSPIWriter verifyFirmwareAtIndex:againstData:]", v18, v19, v20, v21, v22, v23, a3);
    }
  }
  else
  {
    id v8 = [v7 count];
    iBU_LOG_real(@"Only %d of %d necessary headers found, cannot verify", "-[IODualSPIWriter verifyFirmwareAtIndex:againstData:]", v9, v10, v11, v12, v13, v14, (uint64_t)v8);
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (int)readDataAtOffset:(unsigned int)a3 ofLength:(unsigned int)a4 intoBuffer:(void *)a5
{
  input[0] = a3;
  input[1] = a4;
  size_t outputStructCnt = a4;
  iBU_LOG_real(@"inputs[0] = 0x%llx; inputs[1] = 0x%llx; buf = %p; outSize = 0x%lx; &outSize = %p\n",
    "-[IODualSPIWriter readDataAtOffset:ofLength:intoBuffer:]",
    *(uint64_t *)&a3,
    *(uint64_t *)&a4,
    (uint64_t)a5,
    v5,
    v6,
    v7,
    a3);
  uint64_t v10 = IOConnectCallMethod([(IODualSPIWriter *)self spiDriverConnect], 2u, input, 2u, 0, 0, 0, 0, a5, &outputStructCnt);
  iBU_LOG_real(@"Got result: 0x%x", "-[IODualSPIWriter readDataAtOffset:ofLength:intoBuffer:]", v11, v12, v13, v14, v15, v16, v10);
  return v10;
}

- (int)eraseBytes:(unsigned int)a3 ofLength:(unsigned int)a4 withError:(id *)a5
{
  kern_return_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t input[2];

  uint64_t v9 = *(void *)&a4;
  input[0] = a3;
  input[1] = a4;
  iBU_LOG_real(@"inputs[0] = 0x%llx; inputs[1] = 0x%llx",
    "-[IODualSPIWriter eraseBytes:ofLength:withError:]",
    *(uint64_t *)&a3,
    *(uint64_t *)&a4,
    (uint64_t)a5,
    v5,
    v6,
    v7,
    a3);
  uint64_t v11 = IOConnectCallMethod(*(_DWORD *)&self->_usesAFUH, 3u, input, 2u, 0, 0, 0, 0, 0, 0);
  uint64_t v17 = v11;
  if (a5 && v11) {
    *a5 = MSUBootFirmwareError(v11, 0, @"_eraseBytes: Failed to erase %d bytes with error %d", v12, v13, v14, v15, v16, v9);
  }
  return v17;
}

- (int)_writeFirmware:(id)a3 toHeader:(id)a4 withError:(id *)a5
{
  id v9 = [a4 packStructure];
  id v10 = [objc_alloc((Class)NSMutableData) initWithData:a3];
  id v112 = [v9 bytes];
  uint64_t v113 = 0;
  unsigned int v11 = [(IODualSPIWriter *)self _usesExtendediBootRegion];
  unsigned int v12 = [(IODualSPIWriter *)self _maxImageSize];
  uint64_t v13 = [(IODualSPIWriter *)self _maxExtendedRegionSize] + v12;
  uint64_t v14 = [(IODualSPIWriter *)self _maxImageSize];
  [(IODualSPIWriter *)self _maxExtendedRegionSize];
  if (![(IODualSPIWriter *)self usesAFUH]) {
    goto LABEL_8;
  }
  if ([(IODualSPIWriter *)self _usesExtendediBootRegion]) {
    iBU_LOG_real(@"Using iBoot extended region. iBootRegionSize (%d) + ExtendedRegionSize (%d) == maxImageSize (%d)", "-[IODualSPIWriter _writeFirmware:toHeader:withError:]", v15, v16, v17, v18, v19, v20, v14);
  }
  id v21 = [a3 length];
  id v22 = [a3 length];
  if ((unint64_t)v21 <= v13)
  {
    iBU_LOG_real(@"Increasing firmware payload length by %lu in order to zero-out remaining segment.", "-[IODualSPIWriter _writeFirmware:toHeader:withError:]", v23, v24, v25, v26, v27, v28, v13 - (void)v22);
    id v36 = [a3 length];
    iBU_LOG_real(@"Old firmware payload size: %lu. New size: %d", "-[IODualSPIWriter _writeFirmware:toHeader:withError:]", v37, v38, v39, v40, v41, v42, (uint64_t)v36);
    [v10 increaseLengthBy:v13 - [a3 length]];
LABEL_8:
    unsigned int v43 = [v10 length];
    if (v14 >= v43) {
      uint64_t v50 = v43;
    }
    else {
      uint64_t v50 = v14;
    }
    iBU_LOG_real(@"Writing %d bytes (out of a possible %d) of the header payload: %@.", "-[IODualSPIWriter _writeFirmware:toHeader:withError:]", v44, v45, v46, v47, v48, v49, v50);
    id v51 = [v10 bytes];
    id v52 = [a4 imageAddress];
    unsigned int v53 = [v10 length];
    if (v14 >= v53) {
      uint64_t v54 = v53;
    }
    else {
      uint64_t v54 = v14;
    }
    unsigned int v55 = [(IODualSPIWriter *)self _writeBytes:v51 atOffset:v52 ofLength:v54 withError:&v113];
    if (v55)
    {
      int v29 = v55;
      id v56 = [a4 imageAddress];
      iBU_LOG_real(@"Failed to write firmware images to offset 0x%x with error %d", "-[IODualSPIWriter _writeFirmware:toHeader:withError:]", v57, v58, v59, v60, v61, v62, (uint64_t)v56);
      if (!a5) {
        return v29;
      }
      uint64_t v63 = v113;
      id v110 = [a4 imageAddress];
      CFStringRef v69 = @"Failed to write firmware images to offset 0x%x with error %d";
    }
    else
    {
      uint64_t v71 = v14;
      if ((unint64_t)[v10 length] > v14) {
        unsigned int v72 = v11;
      }
      else {
        unsigned int v72 = 0;
      }
      id v73 = [v10 length];
      if (v72 == 1)
      {
        uint64_t v80 = (v73 - v14);
        iBU_LOG_real(@"Writing remaining %d bytes of the header payload to the secondary offset: %@.", "-[IODualSPIWriter _writeFirmware:toHeader:withError:]", v74, v75, v76, v77, v78, v79, v80);
        unsigned int v81 = -[IODualSPIWriter _writeBytes:atOffset:ofLength:withError:](self, "_writeBytes:atOffset:ofLength:withError:", (char *)[v10 bytes] + v71, [a4 secondaryPayloadOffset], v80, &v113);
        if (v81)
        {
          int v29 = v81;
          [a4 secondaryPayloadOffset];
          iBU_LOG_real(@"Failed to write remaining %d bytes of firmware images to offset 0x%x with error %d", "-[IODualSPIWriter _writeFirmware:toHeader:withError:]", v82, v83, v84, v85, v86, v87, v80);
          if (!a5) {
            return v29;
          }
          uint64_t v63 = v113;
          [a4 secondaryPayloadOffset];
          id v110 = (id)v80;
          CFStringRef v69 = @"Failed to write reamining %d bytes firmware images to offset 0x%x with error %d";
          goto LABEL_17;
        }
      }
      else
      {
        if ((unint64_t)v73 <= v14) {
          char v88 = 1;
        }
        else {
          char v88 = v11;
        }
        if ((v88 & 1) == 0)
        {
          int v29 = -536870212;
          id v96 = [v10 length];
          iBU_LOG_real(@"State inconsistency detected. Firmware data length (%d) >? iBootRegionSize (%d) and usesIBootExtendedRegion is %d", "-[IODualSPIWriter _writeFirmware:toHeader:withError:]", v97, v98, v99, v100, v101, v102, (uint64_t)v96);
          if (!a5) {
            return v29;
          }
          uint64_t v103 = v113;
          id v111 = [v10 length];
          unint64_t v35 = MSUBootFirmwareError(3, v103, @"State inconsistency detected. Firmware data length (%d) >? iBootRegionSize (%d) and usesIBootExtendedRegion is %d", v104, v105, v106, v107, v108, (uint64_t)v111);
          goto LABEL_18;
        }
      }
      iBU_LOG_real(@"Writing header structure: %@.", "-[IODualSPIWriter _writeFirmware:toHeader:withError:]", v74, v75, v76, v77, v78, v79, (uint64_t)a4);
      int v29 = [-[IODualSPIWriter _writeBytes:atOffset:ofLength:withError:](self, "_writeBytes:atOffset:ofLength:withError:", v112, [a4 startLocation], objc_msgSend(v9, "length"), &v113);
      if (!v29)
      {

        return v29;
      }
      id v89 = [a4 startLocation];
      iBU_LOG_real(@"Failed to write header structure to offset 0x%x with error %d", "-[IODualSPIWriter _writeFirmware:toHeader:withError:]", v90, v91, v92, v93, v94, v95, (uint64_t)v89);
      if (!a5) {
        return v29;
      }
      uint64_t v63 = v113;
      id v110 = [a4 startLocation];
      CFStringRef v69 = @"Failed to write header structure to offset 0x%x with error %d";
    }
LABEL_17:
    unint64_t v35 = MSUBootFirmwareError(3, v63, (uint64_t)v69, v64, v65, v66, v67, v68, (uint64_t)v110);
    goto LABEL_18;
  }
  int v29 = -536870212;
  iBU_LOG_real(@"Firmware payload %lul is larger than maximum payload size %d", "-[IODualSPIWriter _writeFirmware:toHeader:withError:]", v23, v24, v25, v26, v27, v28, (uint64_t)v22);
  if (a5)
  {
    id v109 = [a3 length];
    unint64_t v35 = MSUBootFirmwareError(3, 0, @"Firmware payload %lul is larger than maximum payload size %d", v30, v31, v32, v33, v34, (uint64_t)v109);
LABEL_18:
    *a5 = v35;
  }
  return v29;
}

- (int)_commitHeader:(id)a3 withError:(id *)a4
{
  if ([a3 isValid])
  {
    if (a4) {
      *a4 = MSUBootFirmwareError(4, 0, @"Header wasn't prepared / invalid at time of commit: %@", v7, v8, v9, v10, v11, (uint64_t)a3);
    }
    return -536870212;
  }
  else
  {
    [a3 makeValid];
    id v13 = [a3 packStructure];
    id v14 = [v13 bytes];
    iBU_LOG_real(@"Committing valid header via flash as: %@", "-[IODualSPIWriter _commitHeader:withError:]", v15, v16, v17, v18, v19, v20, (uint64_t)a3);
    id v21 = [a3 startLocation];
    id v22 = [v13 length];
    return [(IODualSPIWriter *)self _writeBytes:v14 atOffset:v21 ofLength:v22 withError:a4];
  }
}

- (int)_writeBytes:(char *)a3 atOffset:(unsigned int)a4 ofLength:(unsigned int)a5 withError:(id *)a6
{
  kern_return_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t input[2];

  uint64_t v9 = *(void *)&a5;
  size_t v12 = a5;
  input[0] = a4;
  input[1] = a5;
  iBU_LOG_real(@"inputs[0] = 0x%llx; inputs[1] = 0x%llx",
    "-[IODualSPIWriter _writeBytes:atOffset:ofLength:withError:]",
    (uint64_t)a3,
    *(uint64_t *)&a4,
    *(uint64_t *)&a5,
    (uint64_t)a6,
    v6,
    v7,
    a4);
  id v13 = IOConnectCallMethod([(IODualSPIWriter *)self spiDriverConnect], 1u, input, 2u, a3, v12, 0, 0, 0, 0);
  uint64_t v19 = v13;
  if (a6 && v13) {
    *a6 = MSUBootFirmwareError(v13, 0, @"_writeBytes: Failed writing %d bytes with error %d", v14, v15, v16, v17, v18, v9);
  }
  return v19;
}

- (void)dealloc
{
  io_connect_t v3 = *(_DWORD *)&self->_usesAFUH;
  if (v3) {
    IOServiceClose(v3);
  }

  v4.receiver = self;
  v4.super_class = (Class)IODualSPIWriter;
  [(IOServiceWriter *)&v4 dealloc];
}

- (unsigned)spiDriverConnect
{
  return *(_DWORD *)&self->_usesAFUH;
}

- (void)setSpiDriverConnect:(unsigned int)a3
{
  *(_DWORD *)&self->_usesAFUH = a3;
}

- (const)regBuffer
{
  return *(const char **)(&self->_regSize + 1);
}

- (void)setRegBuffer:(const char *)a3
{
  *(void *)(&self->_regSize + 1) = a3;
}

- (BOOL)usesAFUH
{
  return *(unsigned char *)(&self->super._serviceConnect + 1) & 1;
}

- (const)regStruct
{
  return *(const _reg_format_union **)((char *)&self->_regBuffer + 4);
}

- (void)setRegStruct:(const _reg_format_union *)a3
{
  *(const char **)((char *)&self->_regBuffer + 4) = (const char *)a3;
}

- (unsigned)regSize
{
  return self->_spiDriverConnect;
}

- (void)setRegSize:(unsigned int)a3
{
  self->_unsigned int spiDriverConnect = a3;
}

- (NSData)regData
{
  return *(NSData **)((char *)&self->_regStruct + 4);
}

- (void)setRegData:(id)a3
{
  *(const _reg_format_union **)((char *)&self->_regStruct + 4) = (const _reg_format_union *)a3;
}

- (NSMutableArray)invalidHeaders
{
  return *(NSMutableArray **)((char *)&self->_regData + 4);
}

- (void)setInvalidHeaders:(id)a3
{
  *(NSData **)((char *)&self->_regData + 4) = (NSData *)a3;
}

@end