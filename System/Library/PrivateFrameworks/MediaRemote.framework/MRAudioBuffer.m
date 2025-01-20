@interface MRAudioBuffer
- (AVAudioCompressedBuffer)buffer;
- (MRAudioBuffer)initWithFormatSettings:(id)a3 packetCapacity:(unint64_t)a4 maximumPacketSize:(unint64_t)a5;
- (NSDictionary)formatSettings;
@end

@implementation MRAudioBuffer

- (MRAudioBuffer)initWithFormatSettings:(id)a3 packetCapacity:(unint64_t)a4 maximumPacketSize:(unint64_t)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MRAudioBuffer;
  v9 = [(MRAudioBuffer *)&v16 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    formatSettings = v9->_formatSettings;
    v9->_formatSettings = (NSDictionary *)v10;

    v12 = (void *)[objc_alloc((Class)MSVWeakLinkClass()) initWithSettings:v8];
    uint64_t v13 = [objc_alloc((Class)MSVWeakLinkClass()) initWithFormat:v12 packetCapacity:a4 maximumPacketSize:a5];
    buffer = v9->_buffer;
    v9->_buffer = (AVAudioCompressedBuffer *)v13;
  }
  return v9;
}

- (AVAudioCompressedBuffer)buffer
{
  return self->_buffer;
}

- (NSDictionary)formatSettings
{
  return self->_formatSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatSettings, 0);

  objc_storeStrong((id *)&self->_buffer, 0);
}

@end