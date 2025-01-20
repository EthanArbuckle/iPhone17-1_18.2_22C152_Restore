@interface SFDeviceAssetQuery
+ (BOOL)deviceWantsH264;
- (BOOL)h264;
- (BOOL)isEqual:(id)a3;
- (BOOL)legacyAsset;
- (LogCategory)ucat;
- (NSDictionary)additionalQueryParameters;
- (NSString)assetType;
- (NSString)color;
- (NSString)effectiveProductType;
- (NSString)mappedProductType;
- (NSString)productType;
- (NSString)stringIdentifier;
- (NSString)variantIdentifier;
- (SFDeviceAssetQuery)initWithAssetType:(id)a3 productType:(id)a4;
- (SFDeviceAssetQuery)initWithBluetoothProductIdentifier:(unint64_t)a3 color:(unint64_t)a4;
- (SFDeviceAssetQuery)initWithHomePodColor:(unint64_t)a3;
- (SFDeviceAssetQuery)initWithHomePodColor:(unint64_t)a3 version:(unsigned int)a4;
- (SFDeviceAssetQuery)initWithProductType:(id)a3 additionalQueryParameters:(id)a4;
- (SFDeviceAssetQuery)initWithSingleHomePodColor:(unsigned __int8)a3 version:(unsigned int)a4;
- (SFDeviceAssetQuery)initWithTagColor:(unint64_t)a3;
- (id)description;
- (id)loggingProductType;
- (unint64_t)hash;
- (unint64_t)version;
- (void)dealloc;
- (void)setH264:(BOOL)a3;
- (void)setLegacyAsset:(BOOL)a3;
- (void)setMappedProductType:(id)a3;
@end

@implementation SFDeviceAssetQuery

+ (BOOL)deviceWantsH264
{
  if (deviceWantsH264_onceToken != -1) {
    dispatch_once(&deviceWantsH264_onceToken, &__block_literal_global_45);
  }
  return deviceWantsH264_deviceWantsH264;
}

uint64_t __37__SFDeviceAssetQuery_deviceWantsH264__block_invoke()
{
  uint64_t result = ((uint64_t (*)(uint64_t))softLinkVTIsHardwareDecodeSupported[0])(1752589105);
  deviceWantsH264_deviceWantsH264 = result == 0;
  return result;
}

- (SFDeviceAssetQuery)initWithAssetType:(id)a3 productType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFDeviceAssetQuery;
  v8 = [(SFDeviceAssetQuery *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_version = 1;
    v8->_legacyAsset = 0;
    v8->_h264 = [(id)objc_opt_class() deviceWantsH264];
    uint64_t v10 = [v6 copy];
    assetType = v9->_assetType;
    v9->_assetType = (NSString *)v10;

    uint64_t v12 = [v7 copy];
    productType = v9->_productType;
    v9->_productType = (NSString *)v12;

    ASPrintF();
    v9->_ucat = (LogCategory *)LogCategoryCreateEx();
  }

  return v9;
}

- (SFDeviceAssetQuery)initWithHomePodColor:(unint64_t)a3
{
  return [(SFDeviceAssetQuery *)self initWithHomePodColor:a3 version:1];
}

- (SFDeviceAssetQuery)initWithHomePodColor:(unint64_t)a3 version:(unsigned int)a4
{
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"AudioAccessory%d,1", *(void *)&a4);
  id v7 = [(SFDeviceAssetQuery *)self initWithAssetType:@"com.apple.MobileAsset.SharingDeviceAssets" productType:v6];
  if (v7)
  {
    v8 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v9 = [v8 stringValue];
    color = v7->_color;
    v7->_color = (NSString *)v9;
  }
  return v7;
}

- (SFDeviceAssetQuery)initWithSingleHomePodColor:(unsigned __int8)a3 version:(unsigned int)a4
{
  uint64_t v4 = a3;
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"AudioAccessorySingle%d,1", *(void *)&a4);
  id v7 = [(SFDeviceAssetQuery *)self initWithAssetType:@"com.apple.MobileAsset.SharingDeviceAssets" productType:v6];
  if (v7)
  {
    v8 = [NSNumber numberWithUnsignedChar:v4];
    uint64_t v9 = [v8 stringValue];
    color = v7->_color;
    v7->_color = (NSString *)v9;
  }
  return v7;
}

- (SFDeviceAssetQuery)initWithBluetoothProductIdentifier:(unint64_t)a3 color:(unint64_t)a4
{
  id v6 = [NSString stringWithFormat:@"%@%d", @"Device1,", a3];
  id v7 = [(SFDeviceAssetQuery *)self initWithAssetType:@"com.apple.MobileAsset.SharingDeviceAssets" productType:v6];
  if (v7)
  {
    v8 = [NSNumber numberWithUnsignedInteger:a4];
    uint64_t v9 = [v8 stringValue];
    color = v7->_color;
    v7->_color = (NSString *)v9;
  }
  return v7;
}

- (SFDeviceAssetQuery)initWithTagColor:(unint64_t)a3
{
  uint64_t v4 = [(SFDeviceAssetQuery *)self initWithAssetType:@"com.apple.MobileAsset.SharingDeviceAssets" productType:@"AirTag1,1"];
  if (v4)
  {
    v5 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v6 = [v5 stringValue];
    color = v4->_color;
    v4->_color = (NSString *)v6;
  }
  return v4;
}

- (SFDeviceAssetQuery)initWithProductType:(id)a3 additionalQueryParameters:(id)a4
{
  id v6 = a4;
  id v7 = [(SFDeviceAssetQuery *)self initWithAssetType:@"com.apple.MobileAsset.SharingDeviceAssets" productType:a3];
  if (v7)
  {
    v8 = objc_opt_new();
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __68__SFDeviceAssetQuery_initWithProductType_additionalQueryParameters___block_invoke;
    v17 = &unk_1E5BBDC88;
    uint64_t v9 = v7;
    v18 = v9;
    id v19 = v8;
    id v10 = v8;
    [v6 enumerateKeysAndObjectsUsingBlock:&v14];
    uint64_t v11 = objc_msgSend(v10, "copy", v14, v15, v16, v17);
    additionalQueryParameters = v9->_additionalQueryParameters;
    v9->_additionalQueryParameters = (NSDictionary *)v11;
  }
  return v7;
}

void __68__SFDeviceAssetQuery_initWithProductType_additionalQueryParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v17 = (__CFString *)v5;
  id v7 = @"ProductType";
  if (v7 == v17)
  {

    goto LABEL_22;
  }
  if ((v17 == 0) == (v7 != 0))
  {

LABEL_7:
    uint64_t v9 = v17;
    id v10 = @"H264";
    if (v10 == v9)
    {
    }
    else
    {
      uint64_t v11 = v10;
      if ((v17 == 0) == (v10 != 0))
      {

        goto LABEL_14;
      }
      int v12 = [(__CFString *)v9 isEqual:v10];

      if (!v12)
      {
LABEL_14:
        v13 = v9;
        uint64_t v14 = @"CL";
        if (v14 == v13)
        {
        }
        else
        {
          uint64_t v15 = v14;
          if ((v17 == 0) == (v14 != 0))
          {

LABEL_21:
            [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v13];
            goto LABEL_22;
          }
          int v16 = [(__CFString *)v13 isEqual:v14];

          if (!v16) {
            goto LABEL_21;
          }
        }
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), a3);
        goto LABEL_22;
      }
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 9) = [v6 BOOLValueSafe];
    goto LABEL_22;
  }
  char v8 = [(__CFString *)v17 isEqual:v7];

  if ((v8 & 1) == 0) {
    goto LABEL_7;
  }
LABEL_22:
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SFDeviceAssetQuery;
  [(SFDeviceAssetQuery *)&v4 dealloc];
}

- (NSString)stringIdentifier
{
  v13 = [(SFDeviceAssetQuery *)self loggingProductType];
  NSAppendPrintF();
  id v3 = 0;

  if ([(SFDeviceAssetQuery *)self legacyAsset])
  {
    NSAppendPrintF();
    id v4 = v3;

    id v3 = v4;
  }
  if ([(SFDeviceAssetQuery *)self h264])
  {
    NSAppendPrintF();
    id v5 = v3;

    id v3 = v5;
  }
  id v6 = [(SFDeviceAssetQuery *)self color];

  if (v6)
  {
    uint64_t v14 = [(SFDeviceAssetQuery *)self color];
    NSAppendPrintF();
    id v7 = v3;

    id v3 = v7;
  }
  char v8 = [(SFDeviceAssetQuery *)self additionalQueryParameters];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    id v10 = [(SFDeviceAssetQuery *)self additionalQueryParameters];
    uint64_t v15 = SFCompactStringFromCollection(v10);
    NSAppendPrintF();
    id v11 = v3;

    id v3 = v11;
  }

  return (NSString *)v3;
}

- (NSString)variantIdentifier
{
  v2 = NSString;
  id v3 = [(SFDeviceAssetQuery *)self color];
  id v4 = [v2 stringWithFormat:@"CL_%@", v3];

  return (NSString *)v4;
}

- (NSString)effectiveProductType
{
  id v3 = [(SFDeviceAssetQuery *)self mappedProductType];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(SFDeviceAssetQuery *)self productType];
  }
  id v6 = v5;

  if (![(SFDeviceAssetQuery *)self legacyAsset])
  {
    uint64_t v7 = [NSString stringWithFormat:@"%@%@", v6, @"-v2"];

    id v6 = (void *)v7;
  }

  return (NSString *)v6;
}

- (id)loggingProductType
{
  uint64_t v7 = [(SFDeviceAssetQuery *)self productType];
  NSAppendPrintF();
  id v3 = 0;

  id v4 = [(SFDeviceAssetQuery *)self mappedProductType];

  if (v4)
  {
    char v8 = [(SFDeviceAssetQuery *)self mappedProductType];
    NSAppendPrintF();
    id v5 = v3;

    id v3 = v5;
  }

  return v3;
}

- (id)description
{
  uint64_t v6 = objc_opt_class();
  NSAppendPrintF();
  id v8 = 0;
  uint64_t v7 = [(SFDeviceAssetQuery *)self stringIdentifier];
  NSAppendPrintF();
  id v3 = v8;

  NSAppendPrintF();
  id v4 = v3;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFDeviceAssetQuery *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(SFDeviceAssetQuery *)self productType];
      uint64_t v7 = [(SFDeviceAssetQuery *)v5 productType];
      id v8 = v6;
      id v9 = v7;
      id v10 = v9;
      if (v8 == v9)
      {
      }
      else
      {
        if ((v8 == 0) == (v9 != 0))
        {
          BOOL v12 = 0;
          v17 = v9;
          id v15 = v8;
          goto LABEL_26;
        }
        int v11 = [v8 isEqual:v9];

        if (!v11)
        {
          BOOL v12 = 0;
LABEL_27:

          goto LABEL_28;
        }
      }
      v13 = [(SFDeviceAssetQuery *)self color];
      uint64_t v14 = [(SFDeviceAssetQuery *)v5 color];
      id v15 = v13;
      id v16 = v14;
      v17 = v16;
      if (v15 == v16)
      {
      }
      else
      {
        if ((v15 == 0) == (v16 != 0))
        {
          BOOL v12 = 0;
          v23 = v16;
          id v21 = v15;
          goto LABEL_25;
        }
        int v18 = [v15 isEqual:v16];

        if (!v18)
        {
          BOOL v12 = 0;
LABEL_26:

          goto LABEL_27;
        }
      }
      id v19 = [(SFDeviceAssetQuery *)self additionalQueryParameters];
      v20 = [(SFDeviceAssetQuery *)v5 additionalQueryParameters];
      id v21 = v19;
      id v22 = v20;
      v23 = v22;
      if (v21 == v22)
      {
      }
      else
      {
        if ((v21 == 0) == (v22 != 0))
        {

LABEL_24:
          BOOL v12 = 0;
          goto LABEL_25;
        }
        int v24 = [v21 isEqual:v22];

        if (!v24) {
          goto LABEL_24;
        }
      }
      unint64_t v25 = [(SFDeviceAssetQuery *)self version];
      BOOL v12 = v25 == [(SFDeviceAssetQuery *)v5 version];
LABEL_25:

      goto LABEL_26;
    }
    BOOL v12 = 0;
  }
LABEL_28:

  return v12;
}

- (unint64_t)hash
{
  id v3 = [(SFDeviceAssetQuery *)self productType];
  uint64_t v4 = [v3 hash];
  id v5 = [(SFDeviceAssetQuery *)self color];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(SFDeviceAssetQuery *)self additionalQueryParameters];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)legacyAsset
{
  return self->_legacyAsset;
}

- (void)setLegacyAsset:(BOOL)a3
{
  self->_legacyAsset = a3;
}

- (LogCategory)ucat
{
  return self->_ucat;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (BOOL)h264
{
  return self->_h264;
}

- (void)setH264:(BOOL)a3
{
  self->_h264 = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSString)productType
{
  return self->_productType;
}

- (NSString)mappedProductType
{
  return self->_mappedProductType;
}

- (void)setMappedProductType:(id)a3
{
}

- (NSString)color
{
  return self->_color;
}

- (NSDictionary)additionalQueryParameters
{
  return self->_additionalQueryParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalQueryParameters, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_mappedProductType, 0);
  objc_storeStrong((id *)&self->_productType, 0);

  objc_storeStrong((id *)&self->_assetType, 0);
}

@end