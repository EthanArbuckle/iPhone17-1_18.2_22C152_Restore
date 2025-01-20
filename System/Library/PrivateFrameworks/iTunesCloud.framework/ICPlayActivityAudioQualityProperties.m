@interface ICPlayActivityAudioQualityProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)isSpatialized;
- (ICPlayActivityAudioQualityProperties)initWithCoder:(id)a3;
- (NSString)channelLayoutDescription;
- (NSString)codecString;
- (id)_copyWithClass:(Class)a3 zone:(_NSZone *)a4;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)bitDepth;
- (int64_t)bitRate;
- (int64_t)sampleRate;
- (unsigned)codec;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICPlayActivityAudioQualityProperties

- (void).cxx_destruct
{
}

- (BOOL)isSpatialized
{
  return self->_spatialized;
}

- (int64_t)sampleRate
{
  return self->_sampleRate;
}

- (unsigned)codec
{
  return self->_codec;
}

- (NSString)channelLayoutDescription
{
  return self->_channelLayoutDescription;
}

- (int64_t)bitDepth
{
  return self->_bitDepth;
}

- (int64_t)bitRate
{
  return self->_bitRate;
}

- (id)_copyWithClass:(Class)a3 zone:(_NSZone *)a4
{
  v5 = [[(objc_class *)a3 allocWithZone:a4] init];
  v6 = v5;
  if (v5)
  {
    *((void *)v5 + 1) = self->_bitRate;
    *((void *)v5 + 2) = self->_bitDepth;
    objc_storeStrong((id *)v5 + 3, self->_channelLayoutDescription);
    *((_DWORD *)v6 + 8) = self->_codec;
    *((void *)v6 + 5) = self->_sampleRate;
    *((unsigned char *)v6 + 48) = self->_spatialized;
  }
  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(ICPlayActivityAudioQualityProperties *)self _copyWithClass:v5 zone:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICPlayActivityAudioQualityProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICPlayActivityAudioQualityProperties;
  uint64_t v5 = [(ICPlayActivityAudioQualityProperties *)&v9 init];
  if (v5)
  {
    v5->_bitRate = [v4 decodeInt64ForKey:@"bitRate"];
    v5->_bitDepth = [v4 decodeInt64ForKey:@"bitDepth"];
    uint64_t v6 = [v4 decodeObjectForKey:@"channelLayoutDescription"];
    channelLayoutDescription = v5->_channelLayoutDescription;
    v5->_channelLayoutDescription = (NSString *)v6;

    v5->_codec = [v4 decodeInt32ForKey:@"codec"];
    v5->_sampleRate = [v4 decodeInt64ForKey:@"sampleRate"];
    v5->_spatialized = [v4 decodeBoolForKey:@"spatialized"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t bitRate = self->_bitRate;
  id v5 = a3;
  [v5 encodeInt64:bitRate forKey:@"bitRate"];
  [v5 encodeInt64:self->_bitDepth forKey:@"bitDepth"];
  [v5 encodeObject:self->_channelLayoutDescription forKey:@"channelLayoutDescription"];
  [v5 encodeInt32:self->_codec forKey:@"codec"];
  [v5 encodeInt64:self->_sampleRate forKey:@"sampleRate"];
  [v5 encodeBool:self->_spatialized forKey:@"spatialized"];
}

- (NSString)codecString
{
  unsigned int v2 = bswap32(self->_codec);
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c", v2, BYTE1(v2), BYTE2(v2), HIBYTE(v2));
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p", v5, self];

  if (self->_bitRate) {
    objc_msgSend(v6, "appendFormat:", @" bitRate: %zd", self->_bitRate);
  }
  if (self->_bitDepth) {
    objc_msgSend(v6, "appendFormat:", @" bitDepth: %zd", self->_bitDepth);
  }
  if (self->_channelLayoutDescription) {
    [v6 appendFormat:@"channels: %@", self->_channelLayoutDescription];
  }
  unsigned int codec = self->_codec;
  if (codec)
  {
    unsigned int v8 = bswap32(codec);
    objc_super v9 = objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c", v8, BYTE1(v8), BYTE2(v8), HIBYTE(v8));
    [v6 appendFormat:@"codec: %@", v9];
  }
  if (self->_sampleRate) {
    objc_msgSend(v6, "appendFormat:", @" sampleRate: %zd", self->_sampleRate);
  }
  if (self->_spatialized) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  [v6 appendFormat:@" spatialized: %@", v10];
  [v6 appendString:@">"];

  return v6;
}

@end