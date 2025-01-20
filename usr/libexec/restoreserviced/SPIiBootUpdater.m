@interface SPIiBootUpdater
+ (id)IOMatchingPropertyTable;
- (BOOL)updateBootFirmwareWithError:(id *)a3;
- (IOServiceWriter)writer;
- (SPIiBootUpdater)initWithIOService:(unsigned int)a3;
- (id)_stitchFirmwareImage;
- (void)dealloc;
@end

@implementation SPIiBootUpdater

+ (id)IOMatchingPropertyTable
{
  CFStringRef v3 = @"IOProviderClass";
  CFStringRef v4 = @"AppleEmbeddedSimpleSPINORFlasherDriver";
  return +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];
}

- (SPIiBootUpdater)initWithIOService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v17.receiver = self;
  v17.super_class = (Class)SPIiBootUpdater;
  CFStringRef v4 = -[MSUBootFirmwareUpdater initWithIOService:](&v17, "initWithIOService:");
  if (v4)
  {
    unsigned int v5 = [(id)objc_opt_class() supportsDualiBoot];
    BOOL v12 = v5 == 0;
    if (v5) {
      CFStringRef v13 = @"Device supports dual SPI boot.";
    }
    else {
      CFStringRef v13 = @"Device does not support dual SPI boot.";
    }
    if (v12) {
      v14 = &off_1000247B0;
    }
    else {
      v14 = off_1000247A8;
    }
    iBU_LOG_real((uint64_t)v13, "-[SPIiBootUpdater initWithIOService:]", v6, v7, v8, v9, v10, v11, (uint64_t)v17.receiver);
    v15 = (IOServiceWriter *)[objc_alloc(*v14) initWithService:v3];
    v4->_writer = v15;
    if (!v15)
    {

      return 0;
    }
  }
  return v4;
}

- (BOOL)updateBootFirmwareWithError:(id *)a3
{
  uint64_t v57 = 0;
  if (![(IOServiceWriter *)[(SPIiBootUpdater *)self writer] isAvailable])
  {
    v34 = [(SPIiBootUpdater *)self writer];
    iBU_LOG_real(@"SPIWriter %@ was unavailable at write-time", "-[SPIiBootUpdater updateBootFirmwareWithError:]", v35, v36, v37, v38, v39, v40, (uint64_t)v34);
    if (a3)
    {
      v55 = [(SPIiBootUpdater *)self writer];
      v46 = MSUBootFirmwareError(6, 0, @"SPIWriter %@ was unavailable at write-time", v41, v42, v43, v44, v45, (uint64_t)v55);
LABEL_15:
      BOOL v13 = 0;
      *a3 = v46;
      return v13;
    }
    return 0;
  }
  id v5 = [(SPIiBootUpdater *)self _stitchFirmwareImage];
  [(IOServiceWriter *)[(SPIiBootUpdater *)self writer] setIsErase:[(MSUBootFirmwareUpdater *)self isErase]];
  [(IOServiceWriter *)[(SPIiBootUpdater *)self writer] setShouldCommit:[(MSUBootFirmwareUpdater *)self shouldCommit]];
  if (!v5)
  {
    iBU_LOG_real(@"SPI writer firmware data was nil!", "-[SPIiBootUpdater updateBootFirmwareWithError:]", v6, v7, v8, v9, v10, v11, v53);
    if (a3)
    {
      v46 = MSUBootFirmwareError(6, 0, @"SPI writer firmware data was nil!", v47, v48, v49, v50, v51, v56);
      goto LABEL_15;
    }
    return 0;
  }
  iBU_LOG_real(@"Beginning write of iBoot data block to writer.", "-[SPIiBootUpdater updateBootFirmwareWithError:]", v6, v7, v8, v9, v10, v11, v53);
  unsigned int v12 = [(IOServiceWriter *)[(SPIiBootUpdater *)self writer] writeData:v5 withError:&v57];
  BOOL v13 = v12 == 0;
  if (v12)
  {
    v14 = [(SPIiBootUpdater *)self writer];
    iBU_LOG_real(@"Updater %@ failed to write to SPI", "-[SPIiBootUpdater updateBootFirmwareWithError:]", v15, v16, v17, v18, v19, v20, (uint64_t)v14);
    if (a3)
    {
      uint64_t v21 = v57;
      v22 = [(SPIiBootUpdater *)self writer];
      *a3 = MSUBootFirmwareError(3, v21, @"Updater %@ failed to write to SPI", v23, v24, v25, v26, v27, (uint64_t)v22);
    }
  }
  if (![(IOServiceWriter *)[(SPIiBootUpdater *)self writer] finished]) {
    iBU_LOG_real(@"Failed to clean up SPI iBoot writer.", "-[SPIiBootUpdater updateBootFirmwareWithError:]", v28, v29, v30, v31, v32, v33, v54);
  }
  if (v12) {
    iBU_LOG_real(@"Failed to fully update iBoot firmware images", "-[SPIiBootUpdater updateBootFirmwareWithError:]", v28, v29, v30, v31, v32, v33, v54);
  }

  return v13;
}

- (id)_stitchFirmwareImage
{
  uint64_t v3 = [(MSUBootFirmwareUpdater *)self llbData];
  CFStringRef v4 = [(MSUBootFirmwareUpdater *)self ibootData];
  id v5 = [(MSUBootFirmwareUpdater *)self ans2Data];
  uint64_t v6 = [(MSUBootFirmwareUpdater *)self logoData];
  id v7 = [(MSUBootFirmwareUpdater *)self _restoreInfoDictionary];
  id v8 = [(MSUBootFirmwareUpdater *)self _encodeFirmware:v3 withRestoreInfo:v7];
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  id v10 = [objc_alloc((Class)NSMutableData) initWithCapacity:((char *)-[NSData length](v4, "length") + -[NSData length](v3, "length") + 100)];
  [v10 appendData:v9];

  if (v4)
  {
    if (v10)
    {
      id v11 = [(MSUBootFirmwareUpdater *)self _encodeFirmware:v4 withRestoreInfo:v7];
      if (v11)
      {
        unsigned int v12 = v11;
        [v10 appendData:v11];
      }
    }
  }
  if (v5)
  {
    if (v10)
    {
      id v13 = [(MSUBootFirmwareUpdater *)self _encodeFirmware:v5 withRestoreInfo:v7];
      if (v13)
      {
        v14 = v13;
        [v10 appendData:v13];
      }
    }
  }
  if (v6)
  {
    if (v10)
    {
      id v15 = [(MSUBootFirmwareUpdater *)self _encodeFirmware:v6 withRestoreInfo:v7];
      if (v15)
      {
        uint64_t v16 = v15;
        [v10 appendData:v15];
      }
    }
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SPIiBootUpdater;
  [(MSUBootFirmwareUpdater *)&v3 dealloc];
}

- (IOServiceWriter)writer
{
  return (IOServiceWriter *)objc_getProperty(self, a2, 88, 1);
}

@end