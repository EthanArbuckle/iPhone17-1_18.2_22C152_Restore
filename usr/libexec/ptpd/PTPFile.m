@interface PTPFile
- (BOOL)hasThumbnail;
- (BOOL)irisAsset;
- (NSString)baseName;
- (NSString)mediaItemType;
- (PHPTPAssetHandle)plAssetHandle;
- (PTPDataSource)dataSource;
- (PTPFile)initWithPHPTPAsset:(id)a3 supportedFormats:(id)a4 andParent:(id)a5;
- (PTPObjectInfoDataset)objectInfoDataset;
- (id)metadata;
- (id)parent;
- (id)thumbnailForMaxPixelSize:(unsigned int)a3 compressedSize:(unint64_t *)a4;
- (int64_t)size;
- (timespec)captureTimeSpec;
- (unint64_t)serialNumber;
- (unsigned)desiredOrientation;
- (unsigned)fourCharCode;
- (unsigned)objectHandle;
- (unsigned)storageID;
- (unsigned)unsignedIntegerValue;
- (void)assignPTPObjectFormatCode:(id)a3 supportedFormats:(id)a4;
- (void)setBaseName:(id)a3;
- (void)setCaptureTimeSpec:(timespec)a3;
- (void)setDataSource:(id)a3;
- (void)setDesiredOrientation:(unsigned int)a3;
- (void)setFourCharCode:(unsigned int)a3;
- (void)setIrisAsset:(BOOL)a3;
- (void)setObjectHandle:(unsigned int)a3;
- (void)setObjectInfoDataset:(id)a3;
- (void)setParent:(id)a3;
- (void)setPlAssetHandle:(id)a3;
- (void)setSerialNumber:(unint64_t)a3;
- (void)setSize:(int64_t)a3;
- (void)setStorageID:(unsigned int)a3;
@end

@implementation PTPFile

- (unsigned)unsignedIntegerValue
{
  return self->_objectHandle;
}

- (NSString)mediaItemType
{
  return (NSString *)@"file";
}

- (PTPFile)initWithPHPTPAsset:(id)a3 supportedFormats:(id)a4 andParent:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v72.receiver = self;
  v72.super_class = (Class)PTPFile;
  v11 = [(PTPFile *)&v72 init];
  if (v11)
  {
    v12 = [v8 filename];
    v13 = [v12 stringByDeletingPathExtension];
    v14 = (NSString *)[v13 copy];
    baseName = v11->_baseName;
    v11->_baseName = v14;

    v16 = [v8 objectCompressedSize];
    v11->_unsigned int size = (int64_t)[v16 unsignedLongLongValue];

    v17 = [v10 storage];
    v11->_storageID = [v17 storageID];

    objc_storeWeak(&v11->_parent, v10);
    v11->_objectHandle = sub_1000026B4();
    v18 = objc_alloc_init(PTPObjectInfoDataset);
    objectInfoDataset = v11->_objectInfoDataset;
    v11->_objectInfoDataset = v18;

    v11->_desiredOrientation = [v8 desiredOrientation];
    [(PTPFile *)v11 assignPTPObjectFormatCode:v8 supportedFormats:v9];
    [(PTPObjectInfoDataset *)v11->_objectInfoDataset setStorageID:v11->_storageID];
    [(PTPObjectInfoDataset *)v11->_objectInfoDataset setObjectCompressedSize:v11->_size];
    [(PTPObjectInfoDataset *)v11->_objectInfoDataset setProtectionStatus:0];
    -[PTPObjectInfoDataset setParentObject:](v11->_objectInfoDataset, "setParentObject:", [v10 objectHandle]);
    -[PTPObjectInfoDataset setSequenceNumber:](v11->_objectInfoDataset, "setSequenceNumber:", [v8 conversionGroup]);
    [(PTPObjectInfoDataset *)v11->_objectInfoDataset setFilename:v12];
    [(PTPObjectInfoDataset *)v11->_objectInfoDataset setObjectHandle:v11->_objectHandle];
    v20 = v11->_objectInfoDataset;
    [v8 imagePixSize];
    [(PTPObjectInfoDataset *)v20 setImagePixWidth:v21];
    v22 = v11->_objectInfoDataset;
    [v8 imagePixSize];
    [(PTPObjectInfoDataset *)v22 setImagePixHeight:v23];
    v24 = v11->_objectInfoDataset;
    v25 = [v8 thumbOffset];
    -[PTPObjectInfoDataset setThumbOffset:](v24, "setThumbOffset:", [v25 unsignedIntValue]);

    v26 = [v8 thumbCompressedSize];
    id v27 = [v26 unsignedIntValue];

    if (v27)
    {
      v28 = [v8 thumbOffset];
      id v29 = [v28 unsignedIntValue];

      v30 = v11->_objectInfoDataset;
      if (v29)
      {
        [(PTPObjectInfoDataset *)v30 setThumbOffset:v29];
        v30 = v11->_objectInfoDataset;
        uint64_t v31 = (uint64_t)v27;
      }
      else
      {
        unsigned int size = v11->_size;
        uint64_t v31 = size >= 0x4000 ? 0x4000 : size;
      }
      [(PTPObjectInfoDataset *)v30 setThumbCompressedSize:v31];
      [(PTPObjectInfoDataset *)v11->_objectInfoDataset setThumbFormat:14344];
      [v8 thumbPixSize];
      double v35 = v34;
      if (v33 != CGSizeZero.width || v34 != CGSizeZero.height)
      {
        [(PTPObjectInfoDataset *)v11->_objectInfoDataset setThumbPixWidth:v33];
        [(PTPObjectInfoDataset *)v11->_objectInfoDataset setThumbPixHeight:v35];
      }
    }
    v36 = [v8 captureDateString];
    if (v36) {
      [(PTPObjectInfoDataset *)v11->_objectInfoDataset setCaptureDate:v36];
    }
    v37 = [v8 modificationDateString];

    if (v37) {
      [(PTPObjectInfoDataset *)v11->_objectInfoDataset setModificationDate:v37];
    }
    uint64_t v38 = [v8 assetHandle];
    plAssetHandle = v11->_plAssetHandle;
    v11->_plAssetHandle = (PHPTPAssetHandle *)v38;

    ++dword_10005E44C;
    if (v11->_size >= (uint64_t)&_mh_execute_header) {
      ++dword_10005E450;
    }
    v40 = [v8 groupUUID];
    v11->_irisAsset = v40 != 0;

    v41 = v11->_objectInfoDataset;
    v42 = [v8 createdFilename];
    [(PTPObjectInfoDataset *)v41 addCustomKeyword:v42 withIdentifier:@"CFN"];

    v43 = v11->_objectInfoDataset;
    v44 = [v8 fingerprint];
    [(PTPObjectInfoDataset *)v43 addCustomKeyword:v44 withIdentifier:@"FPRINT"];

    v45 = v11->_objectInfoDataset;
    v46 = [v8 durationString];
    [(PTPObjectInfoDataset *)v45 addCustomKeyword:v46 withIdentifier:@"D"];

    v47 = v11->_objectInfoDataset;
    v48 = [v8 groupUUID];
    [(PTPObjectInfoDataset *)v47 addCustomKeyword:v48 withIdentifier:@"GUUID"];

    v49 = v11->_objectInfoDataset;
    v50 = [v8 relatedUUID];
    [(PTPObjectInfoDataset *)v49 addCustomKeyword:v50 withIdentifier:@"RUUID"];

    v51 = v11->_objectInfoDataset;
    v52 = [v8 originatingAssetID];
    [(PTPObjectInfoDataset *)v51 addCustomKeyword:v52 withIdentifier:@"OAID"];

    v53 = v11->_objectInfoDataset;
    v54 = [v8 spatialOverCaptureGroupIdentifier];
    [(PTPObjectInfoDataset *)v53 addCustomKeyword:v54 withIdentifier:@"SOCGID"];

    v55 = v11->_objectInfoDataset;
    v56 = [v8 locationString];
    [(PTPObjectInfoDataset *)v55 addCustomKeyword:v56 withIdentifier:@"G"];

    if ([v8 isBurstFavorite])
    {
      v57 = v11->_objectInfoDataset;
      v58 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d", [v8 isBurstFavorite]);
      [(PTPObjectInfoDataset *)v57 addCustomKeyword:v58 withIdentifier:@"BFAV"];
    }
    if ([v8 isBurstPicked])
    {
      v59 = v11->_objectInfoDataset;
      v60 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d", [v8 isBurstPicked]);
      [(PTPObjectInfoDataset *)v59 addCustomKeyword:v60 withIdentifier:@"BPIK"];
    }
    if ([v8 isBurstFirstPicked])
    {
      v61 = v11->_objectInfoDataset;
      v62 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d", [v8 isBurstFirstPicked]);
      [(PTPObjectInfoDataset *)v61 addCustomKeyword:v62 withIdentifier:@"FPIK"];
    }
    if ([v8 isHighFrameRateVideo])
    {
      v63 = v11->_objectInfoDataset;
      v64 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d", [v8 isHighFrameRateVideo]);
      [(PTPObjectInfoDataset *)v63 addCustomKeyword:v64 withIdentifier:@"HFRV"];
    }
    if ([v8 isTimeLapseVideo])
    {
      v65 = v11->_objectInfoDataset;
      v66 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d", [v8 isTimeLapseVideo]);
      [(PTPObjectInfoDataset *)v65 addCustomKeyword:v66 withIdentifier:@"TLV"];
    }
    v67 = v11->_objectInfoDataset;
    v68 = [v8 burstUUID];
    [(PTPObjectInfoDataset *)v67 addCustomKeyword:v68 withIdentifier:@"BUUID"];

    v69 = v11->_objectInfoDataset;
    v70 = [v8 originalFilename];
    [(PTPObjectInfoDataset *)v69 addCustomKeyword:v70 withIdentifier:@"ON"];
  }
  return v11;
}

- (void)assignPTPObjectFormatCode:(id)a3 supportedFormats:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  v7 = [v14 filename];
  id v8 = [v7 pathExtension];
  id v9 = (const char *)[v8 UTF8String];

  if (!strncasecmp(v9, "JPG", 3uLL) || !strncasecmp(v9, "JPEG", 4uLL))
  {
    unsigned __int16 v10 = 14337;
    goto LABEL_52;
  }
  if (!strncasecmp(v9, "AAE", 3uLL) || !strncasecmp(v9, "DBG", 3uLL)) {
    goto LABEL_47;
  }
  if (!strncasecmp(v9, "HEIF", 4uLL) || !strncasecmp(v9, "AVCI", 4uLL))
  {
    BOOL v11 = [v6 containsObject:@"ptp.hevc"] == 0;
    __int16 v12 = 12301;
    __int16 v13 = -19423;
    goto LABEL_49;
  }
  if (!strncasecmp(v9, "HEIC", 4uLL))
  {
    BOOL v11 = [v6 containsObject:@"ptp.heic"] == 0;
    __int16 v12 = 14337;
    __int16 v13 = -19455;
    goto LABEL_49;
  }
  if (!strncasecmp(v9, "HEICS", 5uLL))
  {
    BOOL v11 = [v6 containsObject:@"ptp.heics"] == 0;
    __int16 v12 = 14337;
    __int16 v13 = -19454;
LABEL_49:
    if (v11) {
      unsigned __int16 v10 = v12;
    }
    else {
      unsigned __int16 v10 = v13;
    }
    goto LABEL_52;
  }
  if (!strncasecmp(v9, "MOV", 3uLL))
  {
    unsigned __int16 v10 = 12301;
    if ([v6 containsObject:@"ptp.hevc"])
    {
      if ([v14 videoCodec] == 1752589105) {
        unsigned __int16 v10 = -19423;
      }
      else {
        unsigned __int16 v10 = 12301;
      }
    }
  }
  else if (!strncasecmp(v9, "PNG", 3uLL))
  {
    unsigned __int16 v10 = 14347;
  }
  else if (!strncasecmp(v9, "QT", 2uLL) {
         || !strncasecmp(v9, "MQV", 3uLL)
  }
         || !strncasecmp(v9, "MP4", 3uLL)
         || !strncasecmp(v9, "M4V", 3uLL)
         || !strncasecmp(v9, "3GP", 3uLL)
         || !strncasecmp(v9, "3G2", 3uLL))
  {
    unsigned __int16 v10 = 12301;
  }
  else if (!strncasecmp(v9, "AVI", 3uLL))
  {
    unsigned __int16 v10 = 12298;
  }
  else if (!strncasecmp(v9, "WAV", 3uLL))
  {
    unsigned __int16 v10 = 12296;
  }
  else if (!strncasecmp(v9, "ASF", 3uLL))
  {
    unsigned __int16 v10 = 12300;
  }
  else if (!strncasecmp(v9, "AIF", 3uLL) {
         || !strncasecmp(v9, "AIFF", 4uLL)
  }
         || !strncasecmp(v9, "M4A", 3uLL)
         || !strncasecmp(v9, "M4B", 3uLL)
         || !strncasecmp(v9, "M4R", 3uLL))
  {
    unsigned __int16 v10 = 12295;
  }
  else if (!strncasecmp(v9, "MP3", 3uLL))
  {
    unsigned __int16 v10 = 12297;
  }
  else
  {
    if (strncasecmp(v9, "GIF", 3uLL))
    {
      if (strncasecmp(v9, "XMP", 3uLL))
      {
        if (!strncasecmp(v9, "XML", 3uLL))
        {
          unsigned __int16 v10 = 12302;
        }
        else if (!strncasecmp(v9, "BMP", 3uLL))
        {
          unsigned __int16 v10 = 14340;
        }
        else if (!strncasecmp(v9, "TIF", 3uLL) || !strncasecmp(v9, "TIFF", 4uLL))
        {
          unsigned __int16 v10 = 14349;
        }
        else if (!strncasecmp(v9, "TXT", 3uLL) || !strncasecmp(v9, "TEXT", 4uLL))
        {
          unsigned __int16 v10 = 12292;
        }
        else if (!strncasecmp(v9, "HTM", 3uLL) || !strncasecmp(v9, "HTML", 4uLL))
        {
          unsigned __int16 v10 = 12293;
        }
        else if (!strncasecmp(v9, "CIF", 3uLL) || !strncasecmp(v9, "CIFF", 4uLL))
        {
          unsigned __int16 v10 = 14341;
        }
        else if (!strncasecmp(v9, "PIC", 3uLL) || !strncasecmp(v9, "PICT", 4uLL))
        {
          unsigned __int16 v10 = 14346;
        }
        else if (!strncasecmp(v9, "JP2", 3uLL))
        {
          unsigned __int16 v10 = 14351;
        }
        else if (!strncasecmp(v9, "JPX", 3uLL))
        {
          unsigned __int16 v10 = 14352;
        }
        else if (!strncasecmp(v9, "PCD", 3uLL))
        {
          unsigned __int16 v10 = 14345;
        }
        else if (!strncasecmp(v9, "FPX", 3uLL))
        {
          unsigned __int16 v10 = 14339;
        }
        else
        {
          unsigned __int16 v10 = 12288;
        }
        goto LABEL_52;
      }
LABEL_47:
      unsigned __int16 v10 = 12288;
      goto LABEL_52;
    }
    unsigned __int16 v10 = 14343;
  }
LABEL_52:
  [(PTPObjectInfoDataset *)self->_objectInfoDataset setObjectFormat:v10];
}

- (BOOL)hasThumbnail
{
  v2 = [(PTPFile *)self objectInfoDataset];
  if ([v2 thumbCompressedSize]) {
    BOOL v3 = [v2 thumbFormat] == 14344;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)thumbnailForMaxPixelSize:(unsigned int)a3 compressedSize:(unint64_t *)a4
{
  id v8 = [(PTPFile *)self plAssetHandle];
  id v9 = sub_10000B5F8();
  if (a3 != 160 && a3)
  {
    unsigned int v20 = [(PTPObjectInfoDataset *)self->_objectInfoDataset imagePixWidth];
    unsigned int v21 = [(PTPObjectInfoDataset *)self->_objectInfoDataset imagePixHeight];
    double v22 = 160.0;
    double v23 = 120.0;
    if (v20 && v21)
    {
      if ((double)v20 < (double)v21) {
        double v24 = (double)v21;
      }
      else {
        double v24 = (double)v20;
      }
      unsigned int v25 = (v24 * 0.5);
      if (v24 * 0.5 >= (double)a3) {
        unsigned int v25 = a3;
      }
      double v26 = v24 / (double)v25;
      if (v26 == 0.0)
      {
        double v22 = 160.0;
        double v23 = 120.0;
      }
      else
      {
        float v27 = (double)v20 / v26;
        float v28 = (double)v21 / v26;
        double v22 = ceilf(v27);
        double v23 = ceilf(v28);
      }
    }
    __ICOSLogCreate();
    id v29 = [(PTPFile *)self baseName];
    if ((unint64_t)[v29 length] >= 0x15)
    {
      v30 = [v29 substringWithRange:0, 18];
      uint64_t v31 = [v30 stringByAppendingString:@".."];

      id v29 = (void *)v31;
    }
    v32 = +[NSString stringWithFormat:@"Requesting custom thumbnail of size: (%f x %f)", *(void *)&v22, *(void *)&v23];
    double v33 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v34 = v29;
      double v35 = v33;
      *(_DWORD *)buf = 136446466;
      id v44 = [v34 UTF8String];
      __int16 v45 = 2114;
      v46 = v32;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    LODWORD(v36) = 1064514355;
    v19 = [v9 ptpThumbnailForAssetHandle:v8 size:v22 compressionQuality:v23];
    *a4 = (unint64_t)[v19 length];
    if (!v19) {
      goto LABEL_25;
    }
  }
  else
  {
    unsigned __int16 v10 = [(PTPFile *)self objectInfoDataset];
    *a4 = [v10 thumbCompressedSize];

    if (!v9) {
      goto LABEL_25;
    }
    __ICOSLogCreate();
    BOOL v11 = [(PTPFile *)self baseName];
    if ((unint64_t)[v11 length] >= 0x15)
    {
      __int16 v12 = [v11 substringWithRange:0, 18];
      uint64_t v13 = [v12 stringByAppendingString:@".."];

      BOOL v11 = (void *)v13;
    }
    id v14 = +[NSString stringWithFormat:@"Requesting standard thumbnail of size: (%f x %f)", 0x4064000000000000, 0x405E000000000000];
    v15 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v11;
      v17 = v15;
      *(_DWORD *)buf = 136446466;
      id v44 = [v16 UTF8String];
      __int16 v45 = 2114;
      v46 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    LODWORD(v18) = 1.0;
    v19 = [v9 ptpThumbnailForAssetHandle:v8 size:160.0 compressionQuality:120.0];
    if (!v19)
    {
LABEL_25:
      __ICOSLogCreate();
      v37 = [(PTPFile *)self baseName];
      if ((unint64_t)[v37 length] >= 0x15)
      {
        uint64_t v38 = [v37 substringWithRange:0, 18];
        uint64_t v39 = [v38 stringByAppendingString:@".."];

        v37 = (void *)v39;
      }
      v40 = +[NSString stringWithFormat:@"Failed to retrieve a thumbnail from the Photo Library"];
      v41 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
        sub_100030A04(v37, v41);
      }

      v19 = 0;
    }
  }

  return v19;
}

- (id)metadata
{
  BOOL v3 = [(PTPFile *)self plAssetHandle];
  v4 = sub_10000B5F8();
  v5 = v4;
  if (!v4
    || ([v4 ptpImagePropertiesForAssetHandle:v3],
        (id v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    __ICOSLogCreate();
    v7 = [(PTPFile *)self baseName];
    if ((unint64_t)[v7 length] >= 0x15)
    {
      id v8 = [v7 substringWithRange:0, 18];
      uint64_t v9 = [v8 stringByAppendingString:@".."];

      v7 = (void *)v9;
    }
    unsigned __int16 v10 = +[NSString stringWithFormat:@"Failed to retrieve metadata from the Photo Library"];
    BOOL v11 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100030A04(v7, v11);
    }

    id v6 = 0;
  }

  return v6;
}

- (PTPDataSource)dataSource
{
  dataSource = self->_dataSource;
  if (!dataSource)
  {
    v4 = [PTPDataSource alloc];
    plAssetHandle = self->_plAssetHandle;
    int64_t size = self->_size;
    v7 = +[NSString stringWithFormat:@"com.apple.ptpd-%@", self->_baseName];
    id v8 = [(PTPDataSource *)v4 initWithAssetHandle:plAssetHandle assetSize:size andQueueName:v7];
    uint64_t v9 = self->_dataSource;
    self->_dataSource = v8;

    dataSource = self->_dataSource;
  }

  return dataSource;
}

- (unsigned)storageID
{
  return self->_storageID;
}

- (void)setStorageID:(unsigned int)a3
{
  self->_storageID = a3;
}

- (unsigned)objectHandle
{
  return self->_objectHandle;
}

- (void)setObjectHandle:(unsigned int)a3
{
  self->_objectHandle = a3;
}

- (unint64_t)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(unint64_t)a3
{
  self->_serialNumber = a3;
}

- (timespec)captureTimeSpec
{
  uint64_t tv_nsec = self->_captureTimeSpec.tv_nsec;
  __darwin_time_t tv_sec = self->_captureTimeSpec.tv_sec;
  result.uint64_t tv_nsec = tv_nsec;
  result.__darwin_time_t tv_sec = tv_sec;
  return result;
}

- (void)setCaptureTimeSpec:(timespec)a3
{
  self->_captureTimeSpec = a3;
}

- (int64_t)size
{
  return self->_size;
}

- (void)setSize:(int64_t)a3
{
  self->_int64_t size = a3;
}

- (id)parent
{
  id WeakRetained = objc_loadWeakRetained(&self->_parent);

  return WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (void)setDataSource:(id)a3
{
}

- (PHPTPAssetHandle)plAssetHandle
{
  return self->_plAssetHandle;
}

- (void)setPlAssetHandle:(id)a3
{
}

- (PTPObjectInfoDataset)objectInfoDataset
{
  return self->_objectInfoDataset;
}

- (void)setObjectInfoDataset:(id)a3
{
}

- (NSString)baseName
{
  return self->_baseName;
}

- (void)setBaseName:(id)a3
{
}

- (unsigned)desiredOrientation
{
  return self->_desiredOrientation;
}

- (void)setDesiredOrientation:(unsigned int)a3
{
  self->_desiredOrientation = a3;
}

- (unsigned)fourCharCode
{
  return self->_fourCharCode;
}

- (void)setFourCharCode:(unsigned int)a3
{
  self->_fourCharCode = a3;
}

- (BOOL)irisAsset
{
  return self->_irisAsset;
}

- (void)setIrisAsset:(BOOL)a3
{
  self->_irisAsset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseName, 0);
  objc_storeStrong((id *)&self->_objectInfoDataset, 0);
  objc_storeStrong((id *)&self->_plAssetHandle, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_destroyWeak(&self->_parent);
}

@end