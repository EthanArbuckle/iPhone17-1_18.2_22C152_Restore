@interface MRAudioDataBlock
- ($F24F406B2B787EFB06265DBA3D28CBD5)time;
- (MRAudioBuffer)buffer;
- (MRAudioDataBlock)initWithData:(id)a3;
- (MRAudioDataBlock)initWithProtobuf:(id)a3;
- (NSData)data;
- (_MRAudioDataBlockProtobuf)protobuf;
- (float)gain;
- (id)_copyWithZone:(_NSZone *)a3 usingConcreteClass:(Class)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)_parseBuffer:(id)a3;
- (void)_parseGain:(id)a3;
- (void)_parseTimestamp:(id)a3;
@end

@implementation MRAudioDataBlock

- (MRAudioDataBlock)initWithData:(id)a3
{
  id v4 = a3;
  v5 = [[_MRAudioDataBlockProtobuf alloc] initWithData:v4];

  v6 = [(MRAudioDataBlock *)self initWithProtobuf:v5];
  return v6;
}

- (MRAudioDataBlock)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MRAudioDataBlock;
  v5 = [(MRAudioDataBlock *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(MRAudioDataBlock *)v5 _parseBuffer:v4];
    [(MRAudioDataBlock *)v6 _parseTimestamp:v4];
    [(MRAudioDataBlock *)v6 _parseGain:v4];
  }

  return v6;
}

- (_MRAudioDataBlockProtobuf)protobuf
{
  v3 = objc_alloc_init(_MRAudioFormatSettingsProtobuf);
  id v4 = (void *)MEMORY[0x1E4F28F98];
  v5 = [(MRAudioBuffer *)self->_buffer formatSettings];
  v6 = [v4 dataWithPropertyList:v5 format:200 options:0 error:0];
  [(_MRAudioFormatSettingsProtobuf *)v3 setFormatSettingsPlistData:v6];

  v7 = objc_alloc_init(_MRAudioBufferProtobuf);
  [(_MRAudioBufferProtobuf *)v7 setFormatSettings:v3];
  objc_super v8 = [(MRAudioBuffer *)self->_buffer buffer];
  -[_MRAudioBufferProtobuf setPacketCapacity:](v7, "setPacketCapacity:", [v8 packetCapacity]);

  v9 = [(MRAudioBuffer *)self->_buffer buffer];
  -[_MRAudioBufferProtobuf setMaximumPacketSize:](v7, "setMaximumPacketSize:", [v9 maximumPacketSize]);

  v10 = [(MRAudioBuffer *)self->_buffer buffer];
  -[_MRAudioBufferProtobuf setPacketCount:](v7, "setPacketCount:", [v10 packetCount]);

  v11 = (void *)MEMORY[0x1E4F1C9B8];
  v12 = [(MRAudioBuffer *)self->_buffer buffer];
  uint64_t v13 = [v12 data];
  v14 = [(MRAudioBuffer *)self->_buffer buffer];
  uint64_t v15 = [v14 packetCapacity];
  v16 = [(MRAudioBuffer *)self->_buffer buffer];
  v17 = objc_msgSend(v11, "dataWithBytes:length:", v13, objc_msgSend(v16, "maximumPacketSize") * v15);
  [(_MRAudioBufferProtobuf *)v7 setContents:v17];

  v18 = [(MRAudioBuffer *)self->_buffer buffer];
  LODWORD(v17) = [v18 packetCapacity];

  if (v17)
  {
    uint64_t v19 = 0;
    unint64_t v20 = 0;
    do
    {
      v21 = [(MRAudioBuffer *)self->_buffer buffer];
      uint64_t v22 = [v21 packetDescriptions];
      uint64_t v23 = *(void *)(v22 + v19);
      uint64_t v24 = *(unsigned int *)(v22 + v19 + 8);
      uint64_t v25 = *(unsigned int *)(v22 + v19 + 12);

      v26 = objc_alloc_init(_MRAudioStreamPacketDescriptionProtobuf);
      [(_MRAudioStreamPacketDescriptionProtobuf *)v26 setStartOffset:v23];
      [(_MRAudioStreamPacketDescriptionProtobuf *)v26 setVariableFramesInPacket:v24];
      [(_MRAudioStreamPacketDescriptionProtobuf *)v26 setDataByteSize:v25];
      [(_MRAudioBufferProtobuf *)v7 addPacketDescriptions:v26];

      ++v20;
      v27 = [(MRAudioBuffer *)self->_buffer buffer];
      LODWORD(v23) = [v27 packetCapacity];

      v19 += 16;
    }
    while (v20 < v23);
  }
  v28 = objc_alloc_init(_MRAudioTimeProtobuf);
  [(_MRAudioTimeProtobuf *)v28 setTimestamp:self->_time.timestamp];
  [(_MRAudioTimeProtobuf *)v28 setSampleRate:self->_time.sampleRate];
  v29 = objc_alloc_init(_MRAudioDataBlockProtobuf);
  [(_MRAudioDataBlockProtobuf *)v29 setBuffer:v7];
  [(_MRAudioDataBlockProtobuf *)v29 setTime:v28];
  [(_MRAudioDataBlockProtobuf *)v29 setGain:self->_gain];

  return v29;
}

- (NSData)data
{
  v2 = [(MRAudioDataBlock *)self protobuf];
  v3 = [v2 data];

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(MRAudioDataBlock *)self _copyWithZone:a3 usingConcreteClass:v5];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(MRAudioDataBlock *)self _copyWithZone:a3 usingConcreteClass:v5];
}

- (id)_copyWithZone:(_NSZone *)a3 usingConcreteClass:(Class)a4
{
  uint64_t v5 = (id *)objc_alloc_init(a4);
  objc_storeStrong(v5 + 1, self->_buffer);
  *((_OWORD *)v5 + 1) = self->_time;
  *((_DWORD *)v5 + 8) = LODWORD(self->_gain);
  return v5;
}

- (void)_parseBuffer:(id)a3
{
  id v33 = a3;
  buffer = self->_buffer;
  if (buffer)
  {
    self->_buffer = 0;
  }
  v6 = [v33 buffer];
  v7 = (void *)MEMORY[0x1E4F28F98];
  objc_super v8 = [v6 formatSettings];
  v9 = [v8 formatSettingsPlistData];
  v10 = [v7 propertyListWithData:v9 options:0 format:0 error:0];

  v11 = -[MRAudioBuffer initWithFormatSettings:packetCapacity:maximumPacketSize:]([MRAudioBuffer alloc], "initWithFormatSettings:packetCapacity:maximumPacketSize:", v10, [v6 packetCapacity], objc_msgSend(v6, "maximumPacketSize"));
  v12 = self->_buffer;
  self->_buffer = v11;

  uint64_t v13 = [v6 contents];
  unint64_t v14 = [v13 length];
  uint64_t v15 = [v6 packetCapacity];
  if (v14 > [v6 maximumPacketSize] * v15)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MRAudioDataBlock.m", 120, @"invalid buffer size for decoding voice input message (%lu > (%lu * %lu))", objc_msgSend(v13, "length"), objc_msgSend(v6, "packetCapacity"), objc_msgSend(v6, "maximumPacketSize"));
  }
  v16 = [(MRAudioBuffer *)self->_buffer buffer];
  unsigned int v17 = [v16 packetCapacity];
  unint64_t v18 = [v6 packetDescriptionsCount];

  if (v18 < v17)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    v32 = [(MRAudioBuffer *)self->_buffer buffer];
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MRAudioDataBlock.m", 123, @"packet descriptions exceed maximum packet capacity (%lu > %lu)", objc_msgSend(v32, "packetCapacity"), objc_msgSend(v6, "packetDescriptionsCount"));
  }
  uint64_t v19 = [(MRAudioBuffer *)self->_buffer buffer];
  unint64_t v20 = (void *)[v19 data];
  id v21 = v13;
  memcpy(v20, (const void *)[v21 bytes], objc_msgSend(v21, "length"));

  uint64_t v22 = [v6 packetCount];
  uint64_t v23 = [(MRAudioBuffer *)self->_buffer buffer];
  [v23 setPacketCount:v22];

  if ([v6 packetDescriptionsCount])
  {
    uint64_t v24 = 0;
    unsigned int v25 = 1;
    do
    {
      v26 = [v6 packetDescriptionsAtIndex:v24];
      v27 = [(MRAudioBuffer *)self->_buffer buffer];
      uint64_t v28 = [v27 packetDescriptions] + 16 * v24;

      *(_DWORD *)(v28 + 12) = [v26 dataByteSize];
      *(void *)uint64_t v28 = [v26 startOffset];
      *(_DWORD *)(v28 + 8) = [v26 variableFramesInPacket];

      uint64_t v24 = v25;
    }
    while ([v6 packetDescriptionsCount] > (unint64_t)v25++);
  }
}

- (void)_parseTimestamp:(id)a3
{
  id v6 = [a3 time];
  [v6 timestamp];
  self->_time.timestamp = v4;
  [v6 sampleRate];
  self->_time.sampleRate = v5;
}

- (void)_parseGain:(id)a3
{
  [a3 gain];
  *(float *)&double v4 = v4;
  self->_gain = *(float *)&v4;
}

- (MRAudioBuffer)buffer
{
  return self->_buffer;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)time
{
  double timestamp = self->_time.timestamp;
  double sampleRate = self->_time.sampleRate;
  result.var1 = sampleRate;
  result.var0 = timestamp;
  return result;
}

- (float)gain
{
  return self->_gain;
}

- (void).cxx_destruct
{
}

@end