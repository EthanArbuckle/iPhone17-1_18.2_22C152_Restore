@interface PTPDeviceInfoDataset
- (BOOL)dirty;
- (BOOL)readOnlyObject;
- (NSArray)captureFormats;
- (NSArray)devicePropertiesSupported;
- (NSArray)eventsSupported;
- (NSArray)imageFormats;
- (NSArray)operationsSupported;
- (NSMutableData)content;
- (NSString)deviceVersion;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)serialNumber;
- (NSString)vendorExtensionDescription;
- (PTPDeviceInfoDataset)init;
- (PTPDeviceInfoDataset)initWithData:(id)a3;
- (PTPDeviceInfoDataset)initWithMutableData:(id)a3;
- (id)canonicalManufacturer;
- (id)description;
- (unsigned)functionalMode;
- (unsigned)standardVersion;
- (unsigned)vendorExtensionID;
- (unsigned)vendorExtensionVersion;
- (void)setCaptureFormats:(id)a3;
- (void)setContent:(id)a3;
- (void)setDevicePropertiesSupported:(id)a3;
- (void)setDeviceVersion:(id)a3;
- (void)setDirty:(BOOL)a3;
- (void)setEventsSupported:(id)a3;
- (void)setFunctionalMode:(unsigned __int16)a3;
- (void)setImageFormats:(id)a3;
- (void)setManufacturer:(id)a3;
- (void)setModel:(id)a3;
- (void)setOperationsSupported:(id)a3;
- (void)setReadOnlyObject:(BOOL)a3;
- (void)setSerialNumber:(id)a3;
- (void)setStandardVersion:(unsigned __int16)a3;
- (void)setVendorExtensionDescription:(id)a3;
- (void)setVendorExtensionID:(unsigned int)a3;
- (void)setVendorExtensionVersion:(unsigned __int16)a3;
- (void)updateContent;
@end

@implementation PTPDeviceInfoDataset

- (PTPDeviceInfoDataset)init
{
  v6.receiver = self;
  v6.super_class = (Class)PTPDeviceInfoDataset;
  v2 = [(PTPDeviceInfoDataset *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithCapacity:35];
    content = v2->_content;
    v2->_content = v3;

    *(_WORD *)&v2->_dirty = 1;
  }
  return v2;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
  id v5 = a3;
  objc_super v6 = (unsigned __int16 *)[(NSMutableData *)self->_content bytes];
  v7 = (char *)[(NSMutableData *)self->_content length] + (void)v6;
  v28 = v6;
  self->_standardVersion = sub_10001F0E0((unint64_t *)&v28, (unint64_t)v7);
  self->_vendorExtensionID = sub_10001F108((unint64_t *)&v28, (unint64_t)v7);
  self->_vendorExtensionVersion = sub_10001F0E0((unint64_t *)&v28, (unint64_t)v7);
  sub_10001F270((const void **)&v28, (unint64_t)v7);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  vendorExtensionDescription = self->_vendorExtensionDescription;
  self->_vendorExtensionDescription = v8;

  self->_functionalMode = sub_10001F0E0((unint64_t *)&v28, (unint64_t)v7);
  sub_10001F44C(&v28, (unint64_t)v7);
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  operationsSupported = self->_operationsSupported;
  self->_operationsSupported = v10;

  sub_10001F44C(&v28, (unint64_t)v7);
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  eventsSupported = self->_eventsSupported;
  self->_eventsSupported = v12;

  sub_10001F44C(&v28, (unint64_t)v7);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  devicePropertiesSupported = self->_devicePropertiesSupported;
  self->_devicePropertiesSupported = v14;

  sub_10001F44C(&v28, (unint64_t)v7);
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  captureFormats = self->_captureFormats;
  self->_captureFormats = v16;

  sub_10001F44C(&v28, (unint64_t)v7);
  v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
  imageFormats = self->_imageFormats;
  self->_imageFormats = v18;

  sub_10001F270((const void **)&v28, (unint64_t)v7);
  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  manufacturer = self->_manufacturer;
  self->_manufacturer = v20;

  sub_10001F270((const void **)&v28, (unint64_t)v7);
  v22 = (NSString *)objc_claimAutoreleasedReturnValue();
  model = self->_model;
  self->_model = v22;

  sub_10001F270((const void **)&v28, (unint64_t)v7);
  v24 = (NSString *)objc_claimAutoreleasedReturnValue();
  deviceVersion = self->_deviceVersion;
  self->_deviceVersion = v24;

  sub_10001F270((const void **)&v28, (unint64_t)v7);
  v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  serialNumber = self->_serialNumber;
  self->_serialNumber = v26;
}

- (PTPDeviceInfoDataset)initWithData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PTPDeviceInfoDataset;
  id v5 = [(PTPDeviceInfoDataset *)&v8 init];
  if (v5)
  {
    if ((unint64_t)[v4 length] < 0x23)
    {

      id v5 = 0;
    }
    else
    {
      id v6 = [v4 mutableCopy];
      [(PTPDeviceInfoDataset *)v5 setContent:v6];

      v5->_readOnlyObject = 1;
    }
  }

  return v5;
}

- (PTPDeviceInfoDataset)initWithMutableData:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PTPDeviceInfoDataset;
  id v5 = [(PTPDeviceInfoDataset *)&v7 init];
  if (v5)
  {
    if ((unint64_t)[v4 length] < 0x23)
    {

      id v5 = 0;
    }
    else
    {
      [(PTPDeviceInfoDataset *)v5 setContent:v4];
      v5->_readOnlyObject = 0;
    }
  }

  return v5;
}

- (void)updateContent
{
  if (self->_dirty && !self->_readOnlyObject)
  {
    NSUInteger v3 = [(NSString *)self->_vendorExtensionDescription length];
    NSUInteger v4 = [(NSArray *)self->_operationsSupported count];
    NSUInteger v5 = [(NSArray *)self->_eventsSupported count];
    NSUInteger v6 = [(NSArray *)self->_devicePropertiesSupported count];
    NSUInteger v7 = [(NSArray *)self->_captureFormats count];
    NSUInteger v8 = [(NSArray *)self->_imageFormats count];
    NSUInteger v9 = [(NSString *)self->_manufacturer length];
    NSUInteger v10 = [(NSString *)self->_model length];
    NSUInteger v11 = [(NSString *)self->_deviceVersion length];
    NSUInteger v12 = [(NSString *)self->_serialNumber length];
    uint64_t v13 = 2 * v12 + 2;
    if (!v12) {
      uint64_t v13 = 0;
    }
    v14.i64[0] = v9;
    v14.i64[1] = v3;
    v15.i64[0] = v10;
    v15.i64[1] = v11;
    [(NSMutableData *)self->_content setLength:vaddvq_s64(vaddq_s64((int64x2_t)vbslq_s8((int8x16_t)vceqzq_s64(v14), (int8x16_t)xmmword_100038450, (int8x16_t)vaddq_s64(vaddq_s64(v14, v14), (int64x2_t)xmmword_100038440)), (int64x2_t)vbicq_s8((int8x16_t)vaddq_s64(vaddq_s64(v15, v15), vdupq_n_s64(2uLL)), (int8x16_t)vceqzq_s64(v15))))+ v13+ 2 * (v5 + v4 + v6 + v7 + v8)];
    v16 = [(NSMutableData *)self->_content mutableBytes];
    sub_10001F0B4(&v16, self->_standardVersion);
    sub_10001F130((_DWORD **)&v16, self->_vendorExtensionID);
    sub_10001F0B4(&v16, self->_vendorExtensionVersion);
    sub_10001F2B8((unsigned char **)&v16, self->_vendorExtensionDescription);
    sub_10001F0B4(&v16, self->_functionalMode);
    sub_10001F49C(&v16, self->_operationsSupported);
    sub_10001F49C(&v16, self->_eventsSupported);
    sub_10001F49C(&v16, self->_devicePropertiesSupported);
    sub_10001F49C(&v16, self->_captureFormats);
    sub_10001F49C(&v16, self->_imageFormats);
    sub_10001F2B8((unsigned char **)&v16, self->_manufacturer);
    sub_10001F2B8((unsigned char **)&v16, self->_model);
    sub_10001F2B8((unsigned char **)&v16, self->_deviceVersion);
    sub_10001F2B8((unsigned char **)&v16, self->_serialNumber);
    self->_dirty = 0;
  }
}

- (NSMutableData)content
{
  [(PTPDeviceInfoDataset *)self updateContent];
  content = self->_content;

  return content;
}

- (id)description
{
  NSUInteger v3 = +[NSMutableString stringWithFormat:@"<PTPDeviceInfoDataset %p>{\n  _standardVersion:            %d\n  _vendorExtensionID:          %lu\n  _vendorExtensionVersion:     %d\n  _vendorExtensionDescription: %@\n  _functionalMode:             %d\n  _operationsSupported:\n    {\n", self, self->_standardVersion, self->_vendorExtensionID, self->_vendorExtensionVersion, self->_vendorExtensionDescription, self->_functionalMode];
  NSUInteger v4 = [(NSArray *)self->_operationsSupported objectEnumerator];
  uint64_t v5 = [v4 nextObject];
  if (v5)
  {
    NSUInteger v6 = (void *)v5;
    do
    {
      NSUInteger v7 = sub_10001F5EC((uint64_t)[v6 unsignedShortValue]);
      [v3 appendFormat:@"      %@\n", v7];

      uint64_t v8 = [v4 nextObject];

      NSUInteger v6 = (void *)v8;
    }
    while (v8);
  }
  [v3 appendString:@"    }\n  _eventsSupported:\n    {\n"];
  NSUInteger v9 = [(NSArray *)self->_eventsSupported objectEnumerator];

  uint64_t v10 = [v9 nextObject];
  if (v10)
  {
    NSUInteger v11 = (void *)v10;
    do
    {
      NSUInteger v12 = sub_100020898((int)[v11 unsignedShortValue]);
      [v3 appendFormat:@"      %@\n", v12];

      uint64_t v13 = [v9 nextObject];

      NSUInteger v11 = (void *)v13;
    }
    while (v13);
  }
  [v3 appendString:@"    }\n  _devicePropertiesSupported:\n    {\n"];
  int64x2_t v14 = [(NSArray *)self->_devicePropertiesSupported objectEnumerator];

  uint64_t v15 = [v14 nextObject];
  if (v15)
  {
    v16 = (void *)v15;
    do
    {
      v17 = sub_100020AC0((uint64_t)[v16 unsignedShortValue]);
      [v3 appendFormat:@"      %@\n", v17];

      uint64_t v18 = [v14 nextObject];

      v16 = (void *)v18;
    }
    while (v18);
  }
  [v3 appendString:@"    }\n  _captureFormats:\n    {\n"];
  v19 = [(NSArray *)self->_captureFormats objectEnumerator];

  uint64_t v20 = [v19 nextObject];
  if (v20)
  {
    v21 = (void *)v20;
    do
    {
      v22 = sub_100020D80((int)[v21 unsignedShortValue]);
      [v3 appendFormat:@"      %@\n", v22];

      uint64_t v23 = [v19 nextObject];

      v21 = (void *)v23;
    }
    while (v23);
  }
  [v3 appendString:@"    }\n  _imageFormats:\n    {\n"];
  v24 = [(NSArray *)self->_imageFormats objectEnumerator];

  uint64_t v25 = [v24 nextObject];
  if (v25)
  {
    v26 = (void *)v25;
    do
    {
      v27 = sub_100020D80((int)[v26 unsignedShortValue]);
      [v3 appendFormat:@"      %@\n", v27];

      uint64_t v28 = [v24 nextObject];

      v26 = (void *)v28;
    }
    while (v28);
  }
  [v3 appendFormat:@"    }\n  _manufacturer:  %@\n  _model:         %@\n  _deviceVersion: %@\n  _serialNumber:  %@\n}", self->_manufacturer, self->_model, self->_deviceVersion, self->_serialNumber];

  return v3;
}

- (unsigned)standardVersion
{
  return self->_standardVersion;
}

- (void)setStandardVersion:(unsigned __int16)a3
{
  self->_standardVersion = a3;
  self->_dirty = 1;
}

- (unsigned)vendorExtensionID
{
  return self->_vendorExtensionID;
}

- (void)setVendorExtensionID:(unsigned int)a3
{
  self->_vendorExtensionID = a3;
  self->_dirty = 1;
}

- (unsigned)vendorExtensionVersion
{
  return self->_vendorExtensionVersion;
}

- (void)setVendorExtensionVersion:(unsigned __int16)a3
{
  self->_vendorExtensionVersion = a3;
  self->_dirty = 1;
}

- (NSString)vendorExtensionDescription
{
  return self->_vendorExtensionDescription;
}

- (void)setVendorExtensionDescription:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  p_vendorExtensionDescription = &self->_vendorExtensionDescription;
  if (self->_vendorExtensionDescription != v5)
  {
    NSUInteger v7 = v5;
    objc_storeStrong((id *)p_vendorExtensionDescription, a3);
    uint64_t v5 = v7;
    self->_dirty = 1;
  }

  _objc_release_x1(p_vendorExtensionDescription, v5);
}

- (unsigned)functionalMode
{
  return self->_functionalMode;
}

- (void)setFunctionalMode:(unsigned __int16)a3
{
  self->_functionalMode = a3;
  self->_dirty = 1;
}

- (NSArray)operationsSupported
{
  return self->_operationsSupported;
}

- (void)setOperationsSupported:(id)a3
{
  if (self->_operationsSupported != a3)
  {
    id v4 = a3;
    uint64_t v5 = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithArray:v4];

    operationsSupported = self->_operationsSupported;
    self->_operationsSupported = v5;

    self->_dirty = 1;
  }
}

- (NSArray)eventsSupported
{
  return self->_eventsSupported;
}

- (void)setEventsSupported:(id)a3
{
  if (self->_eventsSupported != a3)
  {
    id v4 = a3;
    uint64_t v5 = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithArray:v4];

    eventsSupported = self->_eventsSupported;
    self->_eventsSupported = v5;

    self->_dirty = 1;
  }
}

- (NSArray)devicePropertiesSupported
{
  return self->_devicePropertiesSupported;
}

- (void)setDevicePropertiesSupported:(id)a3
{
  if (self->_devicePropertiesSupported != a3)
  {
    id v4 = a3;
    uint64_t v5 = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithArray:v4];

    devicePropertiesSupported = self->_devicePropertiesSupported;
    self->_devicePropertiesSupported = v5;

    self->_dirty = 1;
  }
}

- (NSArray)captureFormats
{
  return self->_captureFormats;
}

- (void)setCaptureFormats:(id)a3
{
  if (self->_captureFormats != a3)
  {
    id v4 = a3;
    uint64_t v5 = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithArray:v4];

    captureFormats = self->_captureFormats;
    self->_captureFormats = v5;

    self->_dirty = 1;
  }
}

- (NSArray)imageFormats
{
  return self->_imageFormats;
}

- (void)setImageFormats:(id)a3
{
  if (self->_imageFormats != a3)
  {
    id v4 = a3;
    uint64_t v5 = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithArray:v4];

    imageFormats = self->_imageFormats;
    self->_imageFormats = v5;

    self->_dirty = 1;
  }
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  p_manufacturer = &self->_manufacturer;
  if (self->_manufacturer != v5)
  {
    NSUInteger v7 = v5;
    objc_storeStrong((id *)p_manufacturer, a3);
    uint64_t v5 = v7;
    self->_dirty = 1;
  }

  _objc_release_x1(p_manufacturer, v5);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  p_model = &self->_model;
  if (self->_model != v5)
  {
    NSUInteger v7 = v5;
    objc_storeStrong((id *)p_model, a3);
    uint64_t v5 = v7;
    self->_dirty = 1;
  }

  _objc_release_x1(p_model, v5);
}

- (NSString)deviceVersion
{
  return self->_deviceVersion;
}

- (void)setDeviceVersion:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  p_deviceVersion = &self->_deviceVersion;
  if (self->_deviceVersion != v5)
  {
    NSUInteger v7 = v5;
    objc_storeStrong((id *)p_deviceVersion, a3);
    uint64_t v5 = v7;
    self->_dirty = 1;
  }

  _objc_release_x1(p_deviceVersion, v5);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  p_serialNumber = &self->_serialNumber;
  if (self->_serialNumber != v5)
  {
    NSUInteger v7 = v5;
    objc_storeStrong((id *)p_serialNumber, a3);
    uint64_t v5 = v7;
    self->_dirty = 1;
  }

  _objc_release_x1(p_serialNumber, v5);
}

- (id)canonicalManufacturer
{
  NSUInteger v3 = [(NSString *)self->_manufacturer componentsSeparatedByString:@" "];
  id v4 = [v3 objectEnumerator];
  uint64_t v5 = 0;
  NSUInteger v6 = @"NIKON";
  while (1)
  {
    NSUInteger v7 = v5;
    uint64_t v5 = [v4 nextObject];

    if (!v5)
    {
      NSUInteger v6 = self->_manufacturer;
      goto LABEL_9;
    }
    if (![v5 caseInsensitiveCompare:@"NIKON"]) {
      goto LABEL_9;
    }
    if (![v5 caseInsensitiveCompare:@"CANON"]) {
      break;
    }
    if (![v5 caseInsensitiveCompare:@"KODAK"])
    {
      NSUInteger v6 = @"KODAK";
      goto LABEL_9;
    }
  }
  NSUInteger v6 = &stru_100048E60;
LABEL_9:

  return v6;
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (BOOL)readOnlyObject
{
  return self->_readOnlyObject;
}

- (void)setReadOnlyObject:(BOOL)a3
{
  self->_readOnlyObject = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_deviceVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_imageFormats, 0);
  objc_storeStrong((id *)&self->_captureFormats, 0);
  objc_storeStrong((id *)&self->_devicePropertiesSupported, 0);
  objc_storeStrong((id *)&self->_eventsSupported, 0);
  objc_storeStrong((id *)&self->_operationsSupported, 0);
  objc_storeStrong((id *)&self->_vendorExtensionDescription, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

@end