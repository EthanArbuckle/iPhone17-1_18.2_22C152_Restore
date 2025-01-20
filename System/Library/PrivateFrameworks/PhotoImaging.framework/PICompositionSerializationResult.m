@interface PICompositionSerializationResult
- (NSData)data;
- (NSString)formatIdentifier;
- (NSString)formatVersion;
- (PICompositionSerializationResult)init;
- (void)setData:(id)a3;
- (void)setFormatIdentifier:(id)a3;
- (void)setFormatVersion:(id)a3;
@end

@implementation PICompositionSerializationResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatVersion, 0);
  objc_storeStrong((id *)&self->_formatIdentifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setFormatVersion:(id)a3
{
}

- (NSString)formatVersion
{
  return self->_formatVersion;
}

- (void)setFormatIdentifier:(id)a3
{
}

- (NSString)formatIdentifier
{
  return self->_formatIdentifier;
}

- (void)setData:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (PICompositionSerializationResult)init
{
  v8.receiver = self;
  v8.super_class = (Class)PICompositionSerializationResult;
  v2 = [(PICompositionSerializationResult *)&v8 init];
  v3 = (NSData *)objc_alloc_init(MEMORY[0x1E4F1C9B8]);
  data = v2->_data;
  v2->_data = v3;

  formatIdentifier = v2->_formatIdentifier;
  v2->_formatIdentifier = (NSString *)&stru_1EFFD8610;

  formatVersion = v2->_formatVersion;
  v2->_formatVersion = (NSString *)&stru_1EFFD8610;

  return v2;
}

@end