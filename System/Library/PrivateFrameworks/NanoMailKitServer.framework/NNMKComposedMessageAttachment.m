@interface NNMKComposedMessageAttachment
+ (BOOL)supportsSecureCoding;
- (BOOL)prepareForArchiving;
- (NNMKComposedMessageAttachment)initWithCoder:(id)a3;
- (NSData)data;
- (NSString)fileName;
- (NSString)mimeType;
- (NSString)utiType;
- (NSURL)url;
- (unint64_t)fileSize;
- (void)encodeWithCoder:(id)a3;
- (void)logTransmission;
- (void)prepareForArchiving;
- (void)setData:(id)a3;
- (void)setFileName:(id)a3;
- (void)setFileSize:(unint64_t)a3;
- (void)setMimeType:(id)a3;
- (void)setUrl:(id)a3;
- (void)setUtiType:(id)a3;
@end

@implementation NNMKComposedMessageAttachment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NNMKComposedMessageAttachment)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NNMKComposedMessageAttachment *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyFileName"];
    fileName = v5->_fileName;
    v5->_fileName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyFileData"];
    data = v5->_data;
    v5->_data = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyFileURL"];
    url = v5->_url;
    v5->_url = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyMimeType"];
    mimeType = v5->_mimeType;
    v5->_mimeType = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyUTIType"];
    utiType = v5->_utiType;
    v5->_utiType = (NSString *)v14;

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyFileSize"];
    v5->_fileSize = [v16 unsignedIntValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  fileName = self->_fileName;
  id v5 = a3;
  [v5 encodeObject:fileName forKey:@"kNSCodingKeyFileName"];
  [v5 encodeObject:self->_data forKey:@"kNSCodingKeyFileData"];
  [v5 encodeObject:self->_url forKey:@"kNSCodingKeyFileURL"];
  [v5 encodeObject:self->_mimeType forKey:@"kNSCodingKeyMimeType"];
  [v5 encodeObject:self->_utiType forKey:@"kNSCodingKeyUTIType"];
  id v6 = [NSNumber numberWithUnsignedInteger:self->_fileSize];
  [v5 encodeObject:v6 forKey:@"kNSCodingKeyFileSize"];
}

- (BOOL)prepareForArchiving
{
  url = self->_url;
  if (!url) {
    return self->_data != 0;
  }
  id v11 = 0;
  id v4 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:url options:0 error:&v11];
  id v5 = v11;
  data = self->_data;
  self->_data = v4;

  v7 = self->_data;
  BOOL v8 = v7 != 0;
  if (!v7)
  {
    v9 = (void *)__logCategories;
    if (os_log_type_enabled((os_log_t)__logCategories, OS_LOG_TYPE_ERROR)) {
      [(NNMKComposedMessageAttachment *)v9 prepareForArchiving];
    }
  }

  return v8;
}

- (void)logTransmission
{
  id v9 = [(NNMKComposedMessageAttachment *)self utiType];
  NNMKGreenTeaLog(@"Transmitted attachment(s): filetype %@", v2, v3, v4, v5, v6, v7, v8, (uint64_t)v9);
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(id)a3
{
}

- (NSString)utiType
{
  return self->_utiType;
}

- (void)setUtiType:(id)a3
{
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utiType, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
}

- (void)prepareForArchiving
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 localizedDescription];
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_23D3DF000, v3, OS_LOG_TYPE_ERROR, "Unable to read attachment url to prepare for archiving: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end