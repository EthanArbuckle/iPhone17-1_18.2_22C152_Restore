@interface SKDiskImageResizerBase
- (BOOL)checkLimitsWithError:(id *)a3;
- (BOOL)prepareRecoveryMoverWithError:(id *)a3;
- (SKDiskImage)image;
- (SKDiskImageResizeParams)resizeParams;
- (SKDiskImageResizerBase)initWithDiskImage:(id)a3 limits:(id)a4 resizeParams:(id)a5 error:(id *)a6;
- (SKDiskImageSizeLimits)limits;
- (SKRecoveryMoverInfo)recoveryMoverInfo;
- (id)attachForResizeParams;
- (id)fitToSize:(id *)a3;
- (id)imageResize:(id *)a3;
- (id)moveRecovery:(id *)a3;
- (id)volumeResize:(id *)a3;
- (unint64_t)requiredSizeForRecoveryMove;
- (void)setImage:(id)a3;
- (void)setLimits:(id)a3;
- (void)setRecoveryMoverInfo:(id)a3;
- (void)setRequestedSize:(unint64_t)a3;
- (void)setRequiredSizeForRecoveryMove:(unint64_t)a3;
- (void)setResizeParams:(id)a3;
@end

@implementation SKDiskImageResizerBase

- (SKDiskImageResizerBase)initWithDiskImage:(id)a3 limits:(id)a4 resizeParams:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = [v11 deduceDiskWithError:a6];
  if (!v14) {
    goto LABEL_8;
  }
  if (![v13 size]) {
    objc_msgSend(v13, "setSize:", objc_msgSend(v12, "minBytes"));
  }
  v18.receiver = self;
  v18.super_class = (Class)SKDiskImageResizerBase;
  v15 = -[SKDiskResizerBase initWithDisk:requestedSize:](&v18, sel_initWithDisk_requestedSize_, v14, [v13 size]);
  self = v15;
  if (!v15
    || (objc_storeStrong((id *)&v15->_resizeParams, a5),
        objc_storeStrong((id *)&self->_image, a3),
        objc_storeStrong((id *)&self->_limits, a4),
        [(SKDiskImageResizerBase *)self checkLimitsWithError:a6])
    && [(SKDiskImageResizerBase *)self prepareRecoveryMoverWithError:a6])
  {
    self = self;
    v16 = self;
  }
  else
  {
LABEL_8:
    v16 = 0;
  }

  return v16;
}

- (BOOL)prepareRecoveryMoverWithError:(id *)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  v5 = [SKLastPartitions alloc];
  v6 = [(SKDiskResizerBase *)self disk];
  v7 = [(SKLastPartitions *)v5 initWithDisk:v6];

  v8 = [(SKLastPartitions *)v7 recoveryPart];

  if (!v8) {
    goto LABEL_12;
  }
  v9 = [(SKDiskResizerBase *)self disk];
  v10 = [v9 type];
  unint64_t v11 = +[SKLastPartitions secondaryPartitionTableSizeWithDiskType:v10];

  id v12 = [(SKLastPartitions *)v7 recoveryPart];
  unint64_t v13 = [v12 unformattedSize] + v11;

  if ([(SKDiskResizerBase *)self requestedSize] <= v13)
  {
    v31 = SKGetOSLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      int v41 = 136315138;
      v42 = "-[SKDiskImageResizerBase prepareRecoveryMoverWithError:]";
      _os_log_impl(&dword_23F40C000, v31, OS_LOG_TYPE_ERROR, "%s: The requested size to resize is smaller than the recovery partition", (uint8_t *)&v41, 0xCu);
    }

    BOOL v30 = +[SKError failWithSKErrorCode:257 error:a3];
    goto LABEL_16;
  }
  unint64_t v14 = [(SKDiskResizerBase *)self requestedSize] - v13;
  v15 = [(SKLastPartitions *)v7 recoveryPart];
  uint64_t v16 = [v15 startLocation];

  uint64_t v17 = v14 - v16;
  if (v14 == v16)
  {
LABEL_12:
    BOOL v30 = 1;
    goto LABEL_16;
  }
  objc_super v18 = [(SKLastPartitions *)v7 recoveryPart];
  unint64_t v19 = [v18 unformattedSize];
  if (v17 >= 0) {
    unint64_t v20 = v17;
  }
  else {
    unint64_t v20 = -v17;
  }

  if (v19 > v20)
  {
    v21 = SKGetOSLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [(SKLastPartitions *)v7 recoveryPart];
      uint64_t v23 = [v22 startLocation];
      v24 = [(SKLastPartitions *)v7 recoveryPart];
      int v41 = 136315906;
      v42 = "-[SKDiskImageResizerBase prepareRecoveryMoverWithError:]";
      __int16 v43 = 2048;
      uint64_t v44 = v23;
      __int16 v45 = 2048;
      unint64_t v46 = v14;
      __int16 v47 = 2048;
      uint64_t v48 = [v24 unformattedSize];
      _os_log_impl(&dword_23F40C000, v21, OS_LOG_TYPE_DEFAULT, "%s: Recovery partition current offset %lld, new offset %lld, size %lld, need to perform a 2-step move", (uint8_t *)&v41, 0x2Au);
    }
    v25 = [(SKLastPartitions *)v7 recoveryPart];
    uint64_t v26 = [v25 startLocation];
    v27 = [(SKLastPartitions *)v7 recoveryPart];
    uint64_t v28 = [v27 unformattedSize];

    v29 = [(SKLastPartitions *)v7 recoveryPart];
    -[SKDiskImageResizerBase setRequiredSizeForRecoveryMove:](self, "setRequiredSizeForRecoveryMove:", v26 + v11 + v28 + [v29 unformattedSize]);

    if (v17 >= 1) {
      [(SKDiskImageResizerBase *)self setRequiredSizeForRecoveryMove:[(SKDiskImageResizerBase *)self requiredSizeForRecoveryMove] + v17];
    }
    goto LABEL_12;
  }
  v33 = [(SKLastPartitions *)v7 recoveryPart];
  v34 = +[SKPartitionTable partitionIDFromDisk:v33];

  if (v34)
  {
    v35 = [SKRecoveryMoverInfo alloc];
    v36 = [(SKLastPartitions *)v7 recoveryPart];
    uint64_t v37 = [v36 startLocation];
    v38 = [(SKLastPartitions *)v7 recoveryPart];
    v39 = -[SKRecoveryMoverInfo initWithSrcOffset:dstOffset:length:partitionID:](v35, "initWithSrcOffset:dstOffset:length:partitionID:", v37, v14, [v38 unformattedSize], v34);
    recoveryMoverInfo = self->_recoveryMoverInfo;
    self->_recoveryMoverInfo = v39;

    BOOL v30 = 1;
  }
  else
  {
    BOOL v30 = +[SKError failWithSKErrorCode:117 debugDescription:@"Failed to retrieve the recovery partition ID" error:a3];
  }

LABEL_16:
  return v30;
}

- (void)setRequestedSize:(unint64_t)a3
{
  v5 = [(SKDiskImageResizerBase *)self resizeParams];
  [v5 setSize:a3];

  v6.receiver = self;
  v6.super_class = (Class)SKDiskImageResizerBase;
  [(SKDiskResizerBase *)&v6 setRequestedSize:a3];
}

- (id)attachForResizeParams
{
  v2 = objc_opt_new();
  [v2 setIsManagedAttach:1];
  [v2 setPolicy:0];

  return v2;
}

- (BOOL)checkLimitsWithError:(id *)a3
{
  unint64_t v5 = [(SKDiskResizerBase *)self requestedSize];
  objc_super v6 = [(SKDiskImageResizerBase *)self limits];
  if (v5 >= [v6 minBytes])
  {
    v7 = [(SKDiskImageResizerBase *)self limits];
    unint64_t v8 = [v7 maxBytes];
    unint64_t v9 = [(SKDiskResizerBase *)self requestedSize];

    if (v8 >= v9) {
      return 1;
    }
  }
  else
  {
  }
  v10 = [(SKDiskImageResizerBase *)self limits];
  unint64_t v11 = [v10 maxBytes];
  unint64_t v12 = [(SKDiskResizerBase *)self requestedSize];

  if (v11 < v12) {
    uint64_t v13 = 256;
  }
  else {
    uint64_t v13 = 257;
  }

  return +[SKError failWithSKErrorCode:v13 error:a3];
}

- (id)volumeResize:(id *)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  id v30 = 0;
  objc_super v6 = [(SKDiskResizerBase *)self disk];
  unint64_t v7 = [(SKDiskResizerBase *)self requestedSize];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __39__SKDiskImageResizerBase_volumeResize___block_invoke;
  v22 = &unk_26506BEF8;
  v24 = &v25;
  unint64_t v8 = v5;
  uint64_t v23 = v8;
  unint64_t v9 = [v6 resizeToSize:v7 completionBlock:&v19];

  v10 = [(SKDiskResizerBase *)self resizeError];
  LODWORD(v6) = v10 == 0;

  if (v6)
  {
    unint64_t v11 = [(SKDiskResizerBase *)self progress];
    [v11 chainChildProgress:v9 withPendingUnitCount:70];
  }
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (v26[5])
  {
    unint64_t v12 = SKGetOSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = (void *)v26[5];
      *(_DWORD *)buf = 136315394;
      v32 = "-[SKDiskImageResizerBase volumeResize:]";
      __int16 v33 = 2112;
      v34 = v13;
      _os_log_impl(&dword_23F40C000, v12, OS_LOG_TYPE_DEFAULT, "%s: Resize failed: %@", buf, 0x16u);
    }

    if (a3) {
      *a3 = (id) v26[5];
    }
    uint64_t v14 = [(SKDiskResizerBase *)self rollbackResize:a3];
  }
  else
  {
    v15 = SKGetOSLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [(SKDiskResizerBase *)self disk];
      *(_DWORD *)buf = 136315394;
      v32 = "-[SKDiskImageResizerBase volumeResize:]";
      __int16 v33 = 2112;
      v34 = v16;
      _os_log_impl(&dword_23F40C000, v15, OS_LOG_TYPE_DEFAULT, "%s: %@ resized successfully", buf, 0x16u);
    }
    uint64_t v14 = [(SKDiskResizerBase *)self eventFromSize];
  }
  uint64_t v17 = (void *)v14;

  _Block_object_dispose(&v25, 8);

  return v17;
}

void __39__SKDiskImageResizerBase_volumeResize___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)imageResize:(id *)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v5 = SKGetOSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = [(SKDiskImageResizerBase *)self image];
    int v22 = 136315394;
    uint64_t v23 = "-[SKDiskImageResizerBase imageResize:]";
    __int16 v24 = 2112;
    uint64_t v25 = (uint64_t)v6;
    _os_log_impl(&dword_23F40C000, v5, OS_LOG_TYPE_DEFAULT, "%s: Resizing disk image %@", (uint8_t *)&v22, 0x16u);
  }
  unint64_t v7 = [(SKDiskResizerBase *)self disk];
  char v8 = [v7 ejectWithError:a3];

  if ((v8 & 1) == 0) {
    goto LABEL_9;
  }
  unint64_t v9 = +[SKError frameworkBundle];
  v10 = [v9 localizedStringForKey:@"Resizing disk image..." value:&stru_26F313B30 table:0];
  unint64_t v11 = [(SKDiskResizerBase *)self progress];
  [v11 setLocalizedAdditionalDescription:v10];

  [(SKDiskResizerBase *)self setCompletedUnitCount:[(SKDiskResizerBase *)self completedUnitCount] + 2];
  unint64_t v12 = [(SKDiskImageResizerBase *)self image];
  uint64_t v13 = [(SKDiskImageResizerBase *)self resizeParams];
  uint64_t v14 = [v12 diResize:v13 error:a3];

  v15 = SKGetOSLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315394;
    uint64_t v23 = "-[SKDiskImageResizerBase imageResize:]";
    __int16 v24 = 2048;
    uint64_t v25 = v14;
    _os_log_impl(&dword_23F40C000, v15, OS_LOG_TYPE_DEFAULT, "%s: Resized disk image to new size %lld", (uint8_t *)&v22, 0x16u);
  }

  if (v14)
  {
    [(SKDiskImageResizerBase *)self setRequestedSize:v14];
    [(SKDiskResizerBase *)self setCompletedUnitCount:[(SKDiskResizerBase *)self completedUnitCount] + 6];
    uint64_t v16 = [(SKDiskImageResizerBase *)self image];
    uint64_t v17 = [(SKDiskImageResizerBase *)self attachForResizeParams];
    objc_super v18 = [v16 attachWithParams:v17 error:a3];
    [(SKDiskResizerBase *)self setDisk:v18];

    [(SKDiskResizerBase *)self setCompletedUnitCount:[(SKDiskResizerBase *)self completedUnitCount] + 2];
    uint64_t v19 = [(SKDiskResizerBase *)self disk];

    if (v19)
    {
      uint64_t v20 = [(SKDiskResizerBase *)self eventFromSize];
    }
    else
    {
      uint64_t v20 = 0;
    }
  }
  else
  {
LABEL_9:
    uint64_t v20 = [(SKDiskResizerBase *)self rollbackResize:a3];
  }

  return v20;
}

- (id)moveRecovery:(id *)a3
{
  v83[2] = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v5 = [(SKDiskImageResizerBase *)self recoveryMoverInfo];

  if (v5)
  {
    objc_super v6 = +[SKError frameworkBundle];
    unint64_t v7 = [v6 localizedStringForKey:@"Moving recovery partition..." value:&stru_26F313B30 table:0];
    char v8 = [(SKDiskResizerBase *)self progress];
    [v8 setLocalizedAdditionalDescription:v7];

    unint64_t v9 = [(SKDiskResizerBase *)self disk];
    unsigned int v10 = [v9 getSectorSize];

    unint64_t v11 = [(SKDiskResizerBase *)self disk];
    id v12 = +[SKMediaKit newMediaRefForDisk:v11 options:0 error:a3];

    if (!v12)
    {
      __int16 v47 = SKGetOSLog();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v75 = "-[SKDiskImageResizerBase moveRecovery:]";
        _os_log_impl(&dword_23F40C000, v47, OS_LOG_TYPE_ERROR, "%s: Failed creating MediaKit reference for reading", buf, 0xCu);
      }

      uint64_t v48 = [(SKDiskResizerBase *)self rollbackResize:a3];
      goto LABEL_23;
    }
    v82[0] = @"Shared Writer";
    v82[1] = @"Writable";
    v83[0] = MEMORY[0x263EFFA88];
    v83[1] = MEMORY[0x263EFFA88];
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:2];
    uint64_t v14 = [(SKDiskResizerBase *)self disk];
    id v15 = +[SKMediaKit newMediaRefForDisk:v14 options:v13 error:a3];

    uint64_t v16 = SKGetOSLog();
    uint64_t v17 = v16;
    if (!v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v75 = "-[SKDiskImageResizerBase moveRecovery:]";
        _os_log_impl(&dword_23F40C000, v17, OS_LOG_TYPE_ERROR, "%s: Failed creating MediaKit reference for writing", buf, 0xCu);
      }

      uint64_t v44 = [(SKDiskResizerBase *)self rollbackResize:a3];
      int v49 = 1;
LABEL_21:

      if (v49) {
        goto LABEL_24;
      }
      goto LABEL_22;
    }
    v66 = v13;
    v68 = a3;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v18 = [(SKDiskImageResizerBase *)self recoveryMoverInfo];
      id v19 = v15;
      uint64_t v20 = [v18 length];
      v21 = [(SKDiskImageResizerBase *)self recoveryMoverInfo];
      uint64_t v22 = [v21 srcOffset];
      [(SKDiskImageResizerBase *)self recoveryMoverInfo];
      v24 = id v23 = v12;
      *(_DWORD *)buf = 136315906;
      v75 = "-[SKDiskImageResizerBase moveRecovery:]";
      __int16 v76 = 2048;
      uint64_t v77 = v20;
      id v15 = v19;
      __int16 v78 = 2048;
      uint64_t v79 = v22;
      __int16 v80 = 2048;
      uint64_t v81 = [v24 dstOffset];
      _os_log_impl(&dword_23F40C000, v17, OS_LOG_TYPE_DEFAULT, "%s: Moving recovery partition of size %lld from offset %lld to %lld...", buf, 0x2Au);

      id v12 = v23;
    }

    v72[0] = @"Instruction Code";
    uint64_t v25 = [NSNumber numberWithInt:1];
    v73[0] = v25;
    v73[1] = v12;
    id v67 = v12;
    v72[1] = @"Source Device";
    v72[2] = @"Target Device";
    id v65 = v15;
    v73[2] = v15;
    v72[3] = @"Source Offset";
    uint64_t v26 = NSNumber;
    uint64_t v27 = [(SKDiskImageResizerBase *)self recoveryMoverInfo];
    unint64_t v28 = v10;
    v29 = objc_msgSend(v26, "numberWithUnsignedLongLong:", objc_msgSend(v27, "srcOffset") / (unint64_t)v10);
    v73[3] = v29;
    v72[4] = @"Target Offset";
    id v30 = NSNumber;
    v31 = [(SKDiskImageResizerBase *)self recoveryMoverInfo];
    v32 = objc_msgSend(v30, "numberWithUnsignedLongLong:", objc_msgSend(v31, "dstOffset") / (unint64_t)v10);
    v73[4] = v32;
    v72[5] = @"Block Count";
    __int16 v33 = NSNumber;
    v34 = [(SKDiskImageResizerBase *)self recoveryMoverInfo];
    uint64_t v35 = objc_msgSend(v33, "numberWithUnsignedLongLong:", objc_msgSend(v34, "length") / v28);
    v73[5] = v35;
    uint64_t v36 = [NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:6];

    uint64_t v37 = (void *)v36;
    v70[0] = @"Block Size";
    v38 = [NSNumber numberWithUnsignedLongLong:v28];
    v71[0] = v38;
    v71[1] = &unk_26F31DB88;
    v70[1] = @"Buffer Size";
    v70[2] = @"Buffer Count";
    v71[2] = &unk_26F31DBA0;
    v70[3] = @"Instructions";
    uint64_t v69 = v36;
    v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v69 count:1];
    v71[3] = v39;
    v40 = [NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:4];

    uint64_t v41 = IOJobSetup();
    if (v41)
    {
      uint64_t v42 = v41;
      __int16 v43 = SKGetOSLog();
      uint64_t v44 = v68;
      unint64_t v45 = 0x26506B000;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v75 = "-[SKDiskImageResizerBase moveRecovery:]";
        __int16 v76 = 1024;
        LODWORD(v77) = v42;
        unint64_t v46 = "%s: IOJobSetup failed, err=%d";
LABEL_18:
        _os_log_impl(&dword_23F40C000, v43, OS_LOG_TYPE_ERROR, v46, buf, 0x12u);
      }
    }
    else
    {
      uint64_t v42 = IOJobInitiate();
      IOJobDispose();
      uint64_t v44 = v68;
      unint64_t v45 = 0x26506B000uLL;
      if (!v42)
      {
        v52 = [(SKDiskImageResizerBase *)self recoveryMoverInfo];
        uint64_t v53 = [v52 dstOffset];

        v54 = [(SKDiskImageResizerBase *)self recoveryMoverInfo];
        uint64_t v55 = [v54 srcOffset];
        v56 = [(SKDiskImageResizerBase *)self recoveryMoverInfo];
        [v56 setDstOffset:v55];

        v57 = [(SKDiskImageResizerBase *)self recoveryMoverInfo];
        [v57 setSrcOffset:v53];

        v58 = [SKPartitionTable alloc];
        v59 = [(SKDiskResizerBase *)self disk];
        v60 = [(SKPartitionTable *)v58 initWithDisk:v59 error:v68];

        if (!v60) {
          goto LABEL_30;
        }
        v61 = [(SKDiskImageResizerBase *)self recoveryMoverInfo];
        v62 = [v61 partitionID];
        v63 = [(SKDiskImageResizerBase *)self recoveryMoverInfo];
        BOOL v64 = -[SKPartitionTable resizePartitionID:size:offset:error:](v60, "resizePartitionID:size:offset:error:", v62, [v63 length], v53, v68);

        if (v64)
        {
          int v49 = 0;
        }
        else
        {
LABEL_30:
          uint64_t v44 = [(SKDiskResizerBase *)self rollbackResize:v68];
          int v49 = 1;
        }

        goto LABEL_20;
      }
      __int16 v43 = SKGetOSLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v75 = "-[SKDiskImageResizerBase moveRecovery:]";
        __int16 v76 = 1024;
        LODWORD(v77) = v42;
        unint64_t v46 = "%s: Recovery partition blocks copy failed, err=%d";
        goto LABEL_18;
      }
    }

    id v50 = (id)[*(id *)(v45 + 2752) errorWithPOSIXCode:v42 error:v44];
    uint64_t v44 = [(SKDiskResizerBase *)self rollbackResize:v44];
    int v49 = 1;
LABEL_20:
    uint64_t v13 = v66;
    id v12 = v67;
    id v15 = v65;

    goto LABEL_21;
  }
LABEL_22:
  [(SKDiskResizerBase *)self setCompletedUnitCount:[(SKDiskResizerBase *)self completedUnitCount] + 10];
  uint64_t v48 = [(SKDiskResizerBase *)self eventFromSize];
LABEL_23:
  uint64_t v44 = (void *)v48;
LABEL_24:

  return v44;
}

- (id)fitToSize:(id *)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v5 = [(SKDiskResizerBase *)self disk];
  objc_super v6 = [v5 type];
  int v7 = [v6 isEqualToString:kSKDiskTypeUninitalized[0]];

  if (v7)
  {
    char v8 = [(SKDiskResizerBase *)self eventFromSize];
  }
  else
  {
    unint64_t v9 = SKGetOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v10 = [(SKDiskResizerBase *)self disk];
      int v19 = 136315650;
      uint64_t v20 = "-[SKDiskImageResizerBase fitToSize:]";
      __int16 v21 = 2112;
      uint64_t v22 = v10;
      __int16 v23 = 2048;
      unint64_t v24 = [(SKDiskResizerBase *)self requestedSize];
      _os_log_impl(&dword_23F40C000, v9, OS_LOG_TYPE_DEFAULT, "%s: Fitting media of %@ to %llu", (uint8_t *)&v19, 0x20u);
    }
    unint64_t v11 = +[SKError frameworkBundle];
    id v12 = [v11 localizedStringForKey:@"Fitting partition table to new disk size..." value:&stru_26F313B30 table:0];
    uint64_t v13 = [(SKDiskResizerBase *)self progress];
    [v13 setLocalizedAdditionalDescription:v12];

    uint64_t v14 = [SKPartitionTable alloc];
    id v15 = [(SKDiskResizerBase *)self disk];
    uint64_t v16 = [(SKPartitionTable *)v14 initWithDisk:v15 error:a3];

    if (v16
      && [(SKPartitionTable *)v16 fitToContainerSize:[(SKDiskResizerBase *)self requestedSize] error:a3])
    {
      [(SKDiskResizerBase *)self setCompletedUnitCount:[(SKDiskResizerBase *)self completedUnitCount] + 10];
      uint64_t v17 = [(SKDiskResizerBase *)self eventFromSize];
    }
    else
    {
      uint64_t v17 = [(SKDiskResizerBase *)self rollbackResize:a3];
    }
    char v8 = (void *)v17;
  }

  return v8;
}

- (SKDiskImageSizeLimits)limits
{
  return self->_limits;
}

- (void)setLimits:(id)a3
{
}

- (unint64_t)requiredSizeForRecoveryMove
{
  return self->_requiredSizeForRecoveryMove;
}

- (void)setRequiredSizeForRecoveryMove:(unint64_t)a3
{
  self->_requiredSizeForRecoveryMove = a3;
}

- (SKDiskImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (SKDiskImageResizeParams)resizeParams
{
  return self->_resizeParams;
}

- (void)setResizeParams:(id)a3
{
}

- (SKRecoveryMoverInfo)recoveryMoverInfo
{
  return self->_recoveryMoverInfo;
}

- (void)setRecoveryMoverInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryMoverInfo, 0);
  objc_storeStrong((id *)&self->_resizeParams, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_limits, 0);
}

@end