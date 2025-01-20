@interface IMG3NorUpdater
+ (id)IOMatchingPropertyTable;
- (BOOL)_encodeAndWriteIMG3Data:(__CFData *)a3 isLLB:(BOOL)a4 isTicket:(BOOL)a5 withError:(id *)a6;
- (BOOL)updateBootFirmwareWithCallback:(ramrod_update_callbacks *)a3 context:(firmware_update_context *)a4 error:(id *)a5;
- (IMG3NorUpdater)initWithIOService:(unsigned int)a3;
- (IOServiceWriter)writer;
- (void)dealloc;
@end

@implementation IMG3NorUpdater

+ (id)IOMatchingPropertyTable
{
  CFStringRef v3 = @"IOProviderClass";
  CFStringRef v4 = @"AppleImage3NORAccess";
  return +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];
}

- (IMG3NorUpdater)initWithIOService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)IMG3NorUpdater;
  CFStringRef v4 = -[MSUBootFirmwareUpdater initWithIOService:](&v7, "initWithIOService:");
  if (v4)
  {
    v5 = [[IOServiceWriter alloc] initWithService:v3];
    v4->_writer = v5;
    if (!v5)
    {

      return 0;
    }
  }
  return v4;
}

- (BOOL)updateBootFirmwareWithCallback:(ramrod_update_callbacks *)a3 context:(firmware_update_context *)a4 error:(id *)a5
{
  CFErrorRef v64 = 0;
  CFDataRef v65 = 0;
  v9 = [(MSUBootFirmwareUpdater *)self llbData];
  NSUInteger v10 = [(NSArray *)[(MSUBootFirmwareUpdater *)self firmwareImages] count];
  if (!ramrod_ticket_create_img3(&v65, &v64))
  {
    iBU_LOG_real(@"Img3 encoding failed", "-[IMG3NorUpdater updateBootFirmwareWithCallback:context:error:]", v11, v12, v13, v14, v15, v16, v55);
    if (!a5) {
      return 0;
    }
    CFErrorRef v51 = v64;
    CFStringRef v52 = @"Img3 encoding failed";
    uint64_t v53 = 8;
LABEL_26:
    v54 = MSUBootFirmwareError(v53, (uint64_t)v51, (uint64_t)v52, v46, v47, v48, v49, v50, v57);
    BOOL result = 0;
    *a5 = v54;
    return result;
  }
  if (![(IOServiceWriter *)[(IMG3NorUpdater *)self writer] isAvailable])
  {
    iBU_LOG_real(@"SPI writer was unavailable at write-time.", "-[IMG3NorUpdater updateBootFirmwareWithCallback:context:error:]", v17, v18, v19, v20, v21, v22, v55);
    if (!a5) {
      return 0;
    }
    CFStringRef v52 = @"SPI writer was unavailable at write-time.";
    uint64_t v53 = 6;
    CFErrorRef v51 = 0;
    goto LABEL_26;
  }
  if (![(IMG3NorUpdater *)self _encodeAndWriteIMG3Data:v9 isLLB:1 isTicket:0 withError:&v64])
  {
    iBU_LOG_real(@"Failed to write Img3 boot data", "-[IMG3NorUpdater updateBootFirmwareWithCallback:context:error:]", v23, v24, v25, v26, v27, v28, v55);
    if (a5)
    {
      CFErrorRef v51 = v64;
      CFStringRef v52 = @"Failed to write Img3 boot data";
LABEL_25:
      uint64_t v53 = 1;
      goto LABEL_26;
    }
    return 0;
  }
  CFDataRef v29 = v65;
  if (v65
    && ![(IMG3NorUpdater *)self _encodeAndWriteIMG3Data:v65 isLLB:0 isTicket:1 withError:&v64])
  {
    iBU_LOG_real(@"Failed to write Img3 Ticket data", "-[IMG3NorUpdater updateBootFirmwareWithCallback:context:error:]", (uint64_t)v29, v24, v25, v26, v27, v28, v55);
    if (a5)
    {
      CFErrorRef v51 = v64;
      CFStringRef v52 = @"Failed to write Img3 Ticket data";
      goto LABEL_25;
    }
    return 0;
  }
  iBU_LOG_real(@"Img3 Ticket Data updated", "-[IMG3NorUpdater updateBootFirmwareWithCallback:context:error:]", (uint64_t)v29, v24, v25, v26, v27, v28, v55);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v30 = [(MSUBootFirmwareUpdater *)self firmwareImages];
  id v31 = [(NSArray *)v30 countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (v31)
  {
    id v32 = v31;
    v33 = 0;
    uint64_t v34 = *(void *)v61;
    NSUInteger v35 = v10 + 2;
    v58 = a5;
LABEL_8:
    v36 = 0;
    v59 = v33;
    unint64_t v37 = 100 * (void)v33 + 200;
    while (1)
    {
      if (*(void *)v61 != v34) {
        objc_enumerationMutation(v30);
      }
      uint64_t v38 = *(void *)(*((void *)&v60 + 1) + 8 * (void)v36);
      ((void (*)(void, unint64_t, firmware_update_context *))a3->var1)(0, v37 / v35, a4);
      if (![(IMG3NorUpdater *)self _encodeAndWriteIMG3Data:v38 isLLB:0 isTicket:0 withError:&v64])break; {
      v36 = (char *)v36 + 1;
      }
      v37 += 100;
      if (v32 == v36)
      {
        id v32 = [(NSArray *)v30 countByEnumeratingWithState:&v60 objects:v66 count:16];
        v33 = (char *)v36 + (void)v59;
        BOOL result = 1;
        if (v32) {
          goto LABEL_8;
        }
        return result;
      }
    }
    iBU_LOG_real(@"Failed to write Img3 Firmware data", "-[IMG3NorUpdater updateBootFirmwareWithCallback:context:error:]", v39, v40, v41, v42, v43, v44, v56);
    a5 = v58;
    if (!v58) {
      return 0;
    }
    CFErrorRef v51 = v64;
    CFStringRef v52 = @"Failed to write Img3 Firmware data";
    goto LABEL_25;
  }
  return 1;
}

- (BOOL)_encodeAndWriteIMG3Data:(__CFData *)a3 isLLB:(BOOL)a4 isTicket:(BOOL)a5 withError:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v64 = 0;
  uint64_t v65 = 0;
  BytePtr = (UInt8 *)CFDataGetBytePtr(a3);
  CFIndex Length = CFDataGetLength(a3);
  if (image3InstantiateFromBuffer(&v65, BytePtr, Length, 0))
  {
    iBU_LOG_real(@"Failed to instantiate img3 image", "-[IMG3NorUpdater _encodeAndWriteIMG3Data:isLLB:isTicket:withError:]", v13, v14, v15, v16, v17, v18, v61);
    if (a6)
    {
      CFStringRef v24 = @"Failed to instantiate img3 image";
LABEL_4:
      uint64_t v25 = MSUBootFirmwareError(1, 0, (uint64_t)v24, v19, v20, v21, v22, v23, v62);
LABEL_5:
      BOOL v26 = 0;
      *a6 = v25;
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (image3GetTagUnsignedNumber(v65, 1415139397, &v64, 0))
  {
    iBU_LOG_real(@"Failed to read img3 type", "-[IMG3NorUpdater _encodeAndWriteIMG3Data:isLLB:isTicket:withError:]", v27, v28, v29, v30, v31, v32, v61);
    if (a6)
    {
      uint64_t v38 = MSUBootFirmwareError(1, 0, @"Failed to read img3 type", v33, v34, v35, v36, v37, v63);
LABEL_9:
      BOOL v26 = 0;
      *a6 = v38;
      return v26;
    }
    return 0;
  }
  if (!a5 && v64 == 1396916546)
  {
    iBU_LOG_real(@"Unexpected imageType in firmware", "-[IMG3NorUpdater _encodeAndWriteIMG3Data:isLLB:isTicket:withError:]", v27, v28, v29, v30, v31, v32, v61);
    if (a6)
    {
      CFStringRef v24 = @"Unexpected imageType in firmware";
      goto LABEL_4;
    }
    goto LABEL_21;
  }
  CFDataGetLength(a3);
  ramrod_log_msg("%s: flashing %c%c%c%c data (length = 0x%lx)\n", v39, v40, v41, v42, v43, v44, v45, (char)"-[IMG3NorUpdater _encodeAndWriteIMG3Data:isLLB:isTicket:withError:]");
  CFIndex v46 = CFDataGetLength(a3);
  uint64_t v47 = mmap(0, v46, 3, 4098, -1, 0);
  if (v47 == (void *)-1)
  {
    if (a6)
    {
      uint64_t v25 = MSUBootFirmwareError(3, 0, @"unable to mmap %zu bytes for image3 data", v48, v49, v50, v51, v52, v46);
      goto LABEL_5;
    }
LABEL_21:
    BOOL v26 = 0;
    goto LABEL_22;
  }
  uint64_t v53 = v47;
  v54 = CFDataGetBytePtr(a3);
  memmove(v53, v54, v46);
  if (IOConnectCallStructMethod([(IOServiceWriter *)[(IMG3NorUpdater *)self writer] serviceConnect], !v8, v53, v46, 0, 0))
  {
    if (a6)
    {
      uint64_t v38 = MSUBootFirmwareError(3, 0, @"%s returned an error when writing img3 object", v55, v56, v57, v58, v59, (uint64_t)"AppleImage3NORAccess");
      goto LABEL_9;
    }
    return 0;
  }
  munmap(v53, v46);
  BOOL v26 = 1;
LABEL_22:
  if (v65) {
    image3Discard(&v65);
  }
  return v26;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMG3NorUpdater;
  [(MSUBootFirmwareUpdater *)&v3 dealloc];
}

- (IOServiceWriter)writer
{
  return (IOServiceWriter *)objc_getProperty(self, a2, 88, 1);
}

@end