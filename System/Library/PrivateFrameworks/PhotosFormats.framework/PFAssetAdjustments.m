@interface PFAssetAdjustments
+ (BOOL)adjustmentsPropertyListFileRequiresOverflowDataReassemblyAtURL:(id)a3 predictedSize:(int64_t *)a4;
+ (BOOL)writeReassembleAdjustmentsPropertyListAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
+ (id)dataForOverflowDataReassembledAdjustmentsPropertyListAtURL:(id)a3 error:(id *)a4;
+ (id)fingerPrintForData:(id)a3 error:(id *)a4;
+ (id)fingerPrintForFileDescriptor:(int)a3 error:(id *)a4;
+ (id)fingerprintWithAssetAdjustmentFingerprintData:(id)a3;
- (BOOL)writeToURL:(id)a3 atomically:(BOOL)a4;
- (NSData)adjustmentData;
- (NSDate)adjustmentTimestamp;
- (NSDictionary)propertyListDictionary;
- (NSString)adjustmentFormatIdentifier;
- (NSString)adjustmentFormatVersion;
- (NSString)editorBundleID;
- (PFAssetAdjustments)initWithFormatIdentifier:(id)a3 formatVersion:(id)a4 data:(id)a5 baseVersion:(int64_t)a6;
- (PFAssetAdjustments)initWithFormatIdentifier:(id)a3 formatVersion:(id)a4 data:(id)a5 baseVersion:(int64_t)a6 editorBundleID:(id)a7;
- (PFAssetAdjustments)initWithFormatIdentifier:(id)a3 formatVersion:(id)a4 data:(id)a5 baseVersion:(int64_t)a6 editorBundleID:(id)a7 renderTypes:(unsigned int)a8;
- (PFAssetAdjustments)initWithPropertyListDictionary:(id)a3;
- (PFAssetAdjustments)initWithURL:(id)a3;
- (id)_deserializedPhotosAdjustmentDataWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)deserializedAdjustmentDataWithError:(id *)a3;
- (int64_t)adjustmentBaseVersion;
- (unsigned)adjustmentRenderTypes;
- (void)setAdjustmentTimestamp:(id)a3;
- (void)setPropertyListDictionary:(id)a3;
@end

@implementation PFAssetAdjustments

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyListDictionary, 0);

  objc_storeStrong((id *)&self->_adjustmentTimestamp, 0);
}

- (void)setPropertyListDictionary:(id)a3
{
}

- (NSDictionary)propertyListDictionary
{
  return self->_propertyListDictionary;
}

- (id)debugDescription
{
  v3 = [(PFAssetAdjustments *)self propertyListDictionary];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(PFAssetAdjustments *)self deserializedAdjustmentDataWithError:0];
  if (v5) {
    [v4 setObject:v5 forKeyedSubscript:@"adjustmentData"];
  }
  v9.receiver = self;
  v9.super_class = (Class)PFAssetAdjustments;
  v6 = [(PFAssetAdjustments *)&v9 description];
  v7 = [v6 stringByAppendingFormat:@" %@", v4];

  return v7;
}

- (id)description
{
  v3 = [(PFAssetAdjustments *)self adjustmentData];
  uint64_t v4 = [v3 length];

  v10.receiver = self;
  v10.super_class = (Class)PFAssetAdjustments;
  v5 = [(PFAssetAdjustments *)&v10 description];
  v6 = [(PFAssetAdjustments *)self adjustmentFormatIdentifier];
  v7 = [(PFAssetAdjustments *)self adjustmentFormatVersion];
  v8 = [v5 stringByAppendingFormat:@" %@, %@ (%lu bytes), %@", v6, v7, v4, self->_adjustmentTimestamp];

  return v8;
}

- (BOOL)writeToURL:(id)a3 atomically:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(PFAssetAdjustments *)self propertyListDictionary];
  v8 = (void *)[v7 mutableCopy];

  adjustmentTimestamp = self->_adjustmentTimestamp;
  if (adjustmentTimestamp) {
    [v8 setValue:adjustmentTimestamp forKey:@"adjustmentTimestamp"];
  }
  char v10 = [v8 writeToURL:v6 atomically:v4];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = [(PFAssetAdjustments *)self propertyListDictionary];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithPropertyListDictionary:", v4);

  return v5;
}

- (PFAssetAdjustments)initWithPropertyListDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"adjustmentFormatIdentifier"];
  id v6 = [v4 objectForKeyedSubscript:@"adjustmentFormatVersion"];
  v7 = [v4 objectForKeyedSubscript:@"adjustmentBaseVersion"];
  v8 = [v4 objectForKeyedSubscript:@"adjustmentRenderTypes"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    v13.receiver = self;
    v13.super_class = (Class)PFAssetAdjustments;
    objc_super v9 = [(PFAssetAdjustments *)&v13 init];
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [v4 copy];

        id v4 = (id)v10;
      }
      [(PFAssetAdjustments *)v9 setPropertyListDictionary:v4];
      id v11 = [(PFAssetAdjustments *)v9 adjustmentTimestamp];
    }
  }
  else
  {

    objc_super v9 = 0;
  }

  return v9;
}

- (PFAssetAdjustments)initWithURL:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:a3 error:&v7];
  if (v4)
  {
    v5 = [(PFAssetAdjustments *)self initWithPropertyListDictionary:v4];
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (id)_deserializedPhotosAdjustmentDataWithError:(id *)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(PFAssetAdjustments *)self adjustmentData];
  id v21 = 0;
  v5 = +[PFZlibDataCompression decompressData:v4 options:0 error:&v21];
  id v6 = v21;
  uint64_t v7 = v6;
  if (v5)
  {
    id v20 = v6;
    v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:&v20];
    id v9 = v20;

    if (v8)
    {
      id v10 = v8;
      uint64_t v7 = v9;
      id v11 = v10;
    }
    else
    {
      objc_super v13 = (void *)MEMORY[0x1E4F28C58];
      if (v9)
      {
        uint64_t v22 = *MEMORY[0x1E4F28A50];
        id v23 = v9;
        v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      }
      else
      {
        v14 = 0;
      }
      v17 = [v13 errorWithDomain:@"com.apple.PhotosFormats" code:500203 userInfo:v14];
      v18 = v17;
      if (a3) {
        *a3 = v17;
      }

      if (v9)
      {

        id v10 = 0;
        id v11 = 0;
        uint64_t v7 = v9;
      }
      else
      {
        id v10 = 0;
        uint64_t v7 = 0;
        id v11 = 0;
      }
    }
LABEL_19:

    goto LABEL_20;
  }
  v12 = (void *)MEMORY[0x1E4F28C58];
  if (v6)
  {
    uint64_t v24 = *MEMORY[0x1E4F28A50];
    v25[0] = v6;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  }
  else
  {
    id v10 = 0;
  }
  v15 = [v12 errorWithDomain:@"com.apple.PhotosFormats" code:500202 userInfo:v10];
  v16 = v15;
  if (a3) {
    *a3 = v15;
  }

  id v11 = 0;
  if (v7) {
    goto LABEL_19;
  }
LABEL_20:

  return v11;
}

- (id)deserializedAdjustmentDataWithError:(id *)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v5 = [(PFAssetAdjustments *)self adjustmentData];
  if (!v5)
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28588];
    v32[0] = @"No adjustment data to deserialize";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    id v11 = [v9 errorWithDomain:@"com.apple.PhotosFormats" code:500200 userInfo:v10];
    v12 = v11;
    if (a3) {
      *a3 = v11;
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28588];
    id v10 = [NSString stringWithFormat:@"Adjustment data is an invalid type: %@", objc_opt_class()];
    v30 = v10;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    v14 = [v13 errorWithDomain:@"com.apple.PhotosFormats" code:500201 userInfo:v12];
    v15 = v14;
    if (a3) {
      *a3 = v14;
    }

LABEL_10:
    id v8 = 0;
    goto LABEL_11;
  }
  id v6 = [(PFAssetAdjustments *)self adjustmentFormatIdentifier];
  int v7 = [v6 isEqualToString:@"com.apple.photo"];

  if (v7)
  {
    id v8 = [(PFAssetAdjustments *)self _deserializedPhotosAdjustmentDataWithError:a3];
  }
  else
  {
    v17 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:0];
    v18 = v17;
    if (v17)
    {
      id v8 = v17;
    }
    else
    {
      id v26 = 0;
      id v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:&v26];
      id v19 = v26;
      id v20 = v19;
      if (v8)
      {
        id v21 = v8;
      }
      else
      {
        uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
        if (v19)
        {
          uint64_t v27 = *MEMORY[0x1E4F28A50];
          id v28 = v19;
          id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        }
        else
        {
          id v23 = 0;
        }
        uint64_t v24 = [v22 errorWithDomain:@"com.apple.PhotosFormats" code:500203 userInfo:v23];
        v25 = v24;
        if (a3) {
          *a3 = v24;
        }

        if (v20) {
      }
        }
    }
  }
LABEL_11:

  return v8;
}

- (void)setAdjustmentTimestamp:(id)a3
{
}

- (NSDate)adjustmentTimestamp
{
  adjustmentTimestamp = self->_adjustmentTimestamp;
  if (!adjustmentTimestamp)
  {
    id v4 = [(PFAssetAdjustments *)self propertyListDictionary];
    v5 = [v4 objectForKeyedSubscript:@"adjustmentTimestamp"];
    id v6 = self->_adjustmentTimestamp;
    self->_adjustmentTimestamp = v5;

    adjustmentTimestamp = self->_adjustmentTimestamp;
  }

  return adjustmentTimestamp;
}

- (unsigned)adjustmentRenderTypes
{
  v2 = [(PFAssetAdjustments *)self propertyListDictionary];
  v3 = [v2 objectForKeyedSubscript:@"adjustmentRenderTypes"];
  unsigned int v4 = [v3 intValue];

  return v4;
}

- (NSString)editorBundleID
{
  v2 = [(PFAssetAdjustments *)self propertyListDictionary];
  v3 = [v2 objectForKeyedSubscript:@"adjustmentEditorBundleID"];

  return (NSString *)v3;
}

- (int64_t)adjustmentBaseVersion
{
  v2 = [(PFAssetAdjustments *)self propertyListDictionary];
  v3 = [v2 objectForKeyedSubscript:@"adjustmentBaseVersion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (NSData)adjustmentData
{
  v2 = [(PFAssetAdjustments *)self propertyListDictionary];
  v3 = [v2 objectForKeyedSubscript:@"adjustmentData"];

  return (NSData *)v3;
}

- (NSString)adjustmentFormatVersion
{
  v2 = [(PFAssetAdjustments *)self propertyListDictionary];
  v3 = [v2 objectForKeyedSubscript:@"adjustmentFormatVersion"];

  return (NSString *)v3;
}

- (NSString)adjustmentFormatIdentifier
{
  v2 = [(PFAssetAdjustments *)self propertyListDictionary];
  v3 = [v2 objectForKeyedSubscript:@"adjustmentFormatIdentifier"];

  return (NSString *)v3;
}

- (PFAssetAdjustments)initWithFormatIdentifier:(id)a3 formatVersion:(id)a4 data:(id)a5 baseVersion:(int64_t)a6 editorBundleID:(id)a7 renderTypes:(unsigned int)a8
{
  uint64_t v8 = *(void *)&a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v18 = [MEMORY[0x1E4F1CA60] dictionary];
  id v19 = v18;
  if (v14) {
    [v18 setObject:v14 forKeyedSubscript:@"adjustmentFormatIdentifier"];
  }
  if (v15) {
    [v19 setObject:v15 forKeyedSubscript:@"adjustmentFormatVersion"];
  }
  if (v16) {
    [v19 setObject:v16 forKeyedSubscript:@"adjustmentData"];
  }
  id v20 = [NSNumber numberWithInteger:a6];
  [v19 setObject:v20 forKeyedSubscript:@"adjustmentBaseVersion"];

  if (v17) {
    [v19 setObject:v17 forKeyedSubscript:@"adjustmentEditorBundleID"];
  }
  id v21 = [NSNumber numberWithUnsignedInt:v8];
  [v19 setObject:v21 forKeyedSubscript:@"adjustmentRenderTypes"];

  uint64_t v22 = [(PFAssetAdjustments *)self initWithPropertyListDictionary:v19];
  return v22;
}

- (PFAssetAdjustments)initWithFormatIdentifier:(id)a3 formatVersion:(id)a4 data:(id)a5 baseVersion:(int64_t)a6 editorBundleID:(id)a7
{
  return [(PFAssetAdjustments *)self initWithFormatIdentifier:a3 formatVersion:a4 data:a5 baseVersion:a6 editorBundleID:a7 renderTypes:0];
}

- (PFAssetAdjustments)initWithFormatIdentifier:(id)a3 formatVersion:(id)a4 data:(id)a5 baseVersion:(int64_t)a6
{
  return [(PFAssetAdjustments *)self initWithFormatIdentifier:a3 formatVersion:a4 data:a5 baseVersion:a6 editorBundleID:0];
}

+ (BOOL)writeReassembleAdjustmentsPropertyListAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v18 = 0;
  id v10 = [a1 dataForOverflowDataReassembledAdjustmentsPropertyListAtURL:v8 error:&v18];
  id v11 = v18;
  v12 = v11;
  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = v12;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to reassemble adjustment property list %@: %@", buf, 0x16u);
    }
    id v14 = v12;
    if (a5) {
      goto LABEL_10;
    }
    goto LABEL_12;
  }
  id v17 = v11;
  char v13 = [v10 writeToURL:v9 options:0 error:&v17];
  id v14 = v17;

  if ((v13 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v9;
      __int16 v21 = 2112;
      id v22 = v14;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to write reassembled adjustment property list data %@: %@", buf, 0x16u);
      if (a5) {
        goto LABEL_10;
      }
    }
    else if (a5)
    {
LABEL_10:
      id v14 = v14;
      BOOL v15 = 0;
      *a5 = v14;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v15 = 0;
    goto LABEL_13;
  }
  BOOL v15 = 1;
LABEL_13:

  return v15;
}

+ (id)dataForOverflowDataReassembledAdjustmentsPropertyListAtURL:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 URLByDeletingLastPathComponent];
  id v25 = 0;
  int v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v5 options:0 error:&v25];
  id v8 = v25;
  if (v7)
  {
    id v23 = 0;
    uint64_t v24 = 100;
    id v9 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:0 format:&v24 error:&v23];
    id v10 = v23;

    if (v9)
    {
      id v11 = [v6 URLByAppendingPathComponent:@"Adjustments.data" isDirectory:0];
      id v22 = v10;
      v12 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v11 options:0 error:&v22];
      id v13 = v22;

      if (v12)
      {
        id v14 = [v9 objectForKeyedSubscript:@"adjustmentData"];
        BOOL v15 = v14;
        if (!v14 || ([v14 isEqual:v12] & 1) == 0)
        {
          id v16 = (void *)[v9 mutableCopy];
          [v16 setObject:v12 forKeyedSubscript:@"adjustmentData"];

          id v9 = v16;
        }
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
LABEL_15:
          id v21 = 0;
          id v17 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v9 format:v24 options:0 error:&v21];
          id v10 = v21;

          if (!v17 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v27 = v10;
            _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to serialize adjustment dictionary: %@", buf, 0xCu);
          }

          goto LABEL_19;
        }
        BOOL v15 = [v11 path];
        *(_DWORD *)buf = 138412546;
        id v27 = v15;
        __int16 v28 = 2112;
        id v29 = v13;
        _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to read adjustment overflow data file %@: %@", buf, 0x16u);
      }

      goto LABEL_15;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v20 = [v5 path];
      *(_DWORD *)buf = 138412546;
      id v27 = v20;
      __int16 v28 = 2112;
      id v29 = v10;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to deserialize adjustment property list at %@: %@", buf, 0x16u);

      if (a4) {
        goto LABEL_13;
      }
    }
    else if (a4)
    {
LABEL_13:
      id v10 = v10;
      id v17 = 0;
      *a4 = v10;
LABEL_19:
      id v8 = v10;
      goto LABEL_20;
    }
    id v17 = 0;
    goto LABEL_19;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v19 = [v5 path];
    *(_DWORD *)buf = 138412546;
    id v27 = v19;
    __int16 v28 = 2112;
    id v29 = v8;
    _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to read adjustment property list at %@: %@", buf, 0x16u);

    if (a4) {
      goto LABEL_10;
    }
  }
  else if (a4)
  {
LABEL_10:
    id v8 = v8;
    id v17 = 0;
    *a4 = v8;
    goto LABEL_20;
  }
  id v17 = 0;
LABEL_20:

  return v17;
}

+ (BOOL)adjustmentsPropertyListFileRequiresOverflowDataReassemblyAtURL:(id)a3 predictedSize:(int64_t *)a4
{
  id v6 = a3;
  int v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = [v6 URLByDeletingLastPathComponent];
  id v9 = [v8 URLByAppendingPathComponent:@"Adjustments.data" isDirectory:0];
  id v10 = [v9 path];
  if ([v7 fileExistsAtPath:v10])
  {
    id v11 = [v6 path];
    int v12 = [v7 fileExistsAtPath:v11];

    if (a4 && v12)
    {
      uint64_t v16 = 0;
      id v13 = [a1 dataForOverflowDataReassembledAdjustmentsPropertyListAtURL:v6 error:&v16];
      id v14 = v13;
      if (v13) {
        *a4 = [v13 length];
      }

      LOBYTE(v12) = 1;
    }
  }
  else
  {

    LOBYTE(v12) = 0;
  }

  return v12;
}

+ (id)fingerprintWithAssetAdjustmentFingerprintData:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v20 = 0;
    goto LABEL_27;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  id v6 = [v4 adjustmentType];

  if (v6)
  {
    int v7 = [v4 adjustmentType];
    id v8 = [v7 dataUsingEncoding:4];
    [v5 appendData:v8];
  }
  id v9 = [v4 adjustmentCompoundVersion];

  if (v9)
  {
    id v10 = [v4 adjustmentCompoundVersion];
    id v11 = [v10 dataUsingEncoding:4];
    [v5 appendData:v11];
  }
  int v12 = [v4 adjustmentCreatorCode];

  if (v12)
  {
    id v13 = [v4 adjustmentCreatorCode];
    id v14 = [v13 dataUsingEncoding:4];
    [v5 appendData:v14];
  }
  BOOL v15 = [v4 simpleAdjustmentData];

  if (v15)
  {
    uint64_t v16 = [v4 simpleAdjustmentData];
    [v5 appendData:v16];
  }
  if ([v4 adjustmentSourceType] != 1)
  {
    id v19 = 0;
    goto LABEL_17;
  }
  uint64_t v17 = [v4 baseImageFingerprint];
  if (v17)
  {
    id v18 = (void *)v17;
    id v19 = 0;
  }
  else
  {
    id v21 = [v4 baseImage];
    id v37 = 0;
    id v18 = [a1 fingerPrintForData:v21 error:&v37];
    id v19 = v37;

    if (!v18) {
      goto LABEL_17;
    }
  }
  id v22 = [v18 dataUsingEncoding:4];
  [v5 appendData:v22];

LABEL_17:
  uint64_t v23 = [v4 largeAdjustmentDataFingerprint];
  if (v23)
  {
    uint64_t v24 = (void *)v23;
    id v25 = v19;
LABEL_20:
    id v27 = [v24 dataUsingEncoding:4];
    [v5 appendData:v27];

    goto LABEL_21;
  }
  id v26 = [v4 largeAdjustmentData];
  id v36 = v19;
  uint64_t v24 = [a1 fingerPrintForData:v26 error:&v36];
  id v25 = v36;

  if (v24) {
    goto LABEL_20;
  }
LABEL_21:
  __int16 v28 = [v4 secondaryAdjustmentData];
  id v35 = v25;
  id v29 = [a1 fingerPrintForData:v28 error:&v35];
  id v30 = v35;

  if (v29)
  {
    uint64_t v31 = [v29 dataUsingEncoding:4];
    [v5 appendData:v31];
  }
  if ([v5 length])
  {
    id v34 = v30;
    id v20 = [a1 fingerPrintForData:v5 error:&v34];
    id v32 = v34;

    id v30 = v32;
  }
  else
  {
    id v20 = 0;
  }

LABEL_27:

  return v20;
}

+ (id)fingerPrintForFileDescriptor:(int)a3 error:(id *)a4
{
  id v4 = (void *)MMCSSignatureCreateFromFileDescriptor();
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v4 length:MEMORY[0x1A6258F10](v4) freeWhenDone:1];
    id v4 = [v5 base64EncodedStringWithOptions:0];
  }

  return v4;
}

+ (id)fingerPrintForData:(id)a3 error:(id *)a4
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = MMCSSignatureGeneratorCreate();
    id v6 = v4;
    uint64_t v7 = [v6 bytes];
    uint64_t v8 = [v6 length];

    MEMORY[0x1A6258F50](v5, v7, v8, 1);
    uint64_t v9 = MMCSSignatureGeneratorFinish();
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v9 length:MEMORY[0x1A6258F10](v9) freeWhenDone:1];
    id v11 = [v10 base64EncodedStringWithOptions:0];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

@end