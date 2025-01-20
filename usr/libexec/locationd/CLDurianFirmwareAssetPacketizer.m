@interface CLDurianFirmwareAssetPacketizer
- (BOOL)hasSentAssetData;
- (BOOL)hasSentCRCPacket;
- (CLDurianFirmwareAssetPacketizer)initWithAssetType:(int)a3 assetData:(id)a4 maxPacketSize:(unint64_t)a5;
- (NSData)assetData;
- (NSData)assetTargetHeader;
- (id)_buildCRCPacket;
- (id)getNextPacket;
- (int)assetType;
- (unint64_t)assetDataCRC;
- (unint64_t)maxPayloadSize;
- (unint64_t)payloadOffset;
- (void)dealloc;
- (void)setAssetData:(id)a3;
- (void)setAssetDataCRC:(unint64_t)a3;
- (void)setAssetTargetHeader:(id)a3;
- (void)setAssetType:(int)a3;
- (void)setHasSentAssetData:(BOOL)a3;
- (void)setHasSentCRCPacket:(BOOL)a3;
- (void)setMaxPayloadSize:(unint64_t)a3;
- (void)setPayloadOffset:(unint64_t)a3;
@end

@implementation CLDurianFirmwareAssetPacketizer

- (CLDurianFirmwareAssetPacketizer)initWithAssetType:(int)a3 assetData:(id)a4 maxPacketSize:(unint64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  int v12 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLDurianFirmwareAssetPacketizer;
  v8 = [(CLDurianFirmwareAssetPacketizer *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(CLDurianFirmwareAssetPacketizer *)v8 setAssetType:v7];
    [(CLDurianFirmwareAssetPacketizer *)v9 setAssetData:a4];
    [(CLDurianFirmwareAssetPacketizer *)v9 setAssetDataCRC:crc32(0, 0, 0)];
    [(CLDurianFirmwareAssetPacketizer *)v9 setAssetTargetHeader:+[NSData dataWithBytes:&v12 length:1]];
    [(CLDurianFirmwareAssetPacketizer *)v9 setMaxPayloadSize:a5 - 6];
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLDurianFirmwareAssetPacketizer;
  [(CLDurianFirmwareAssetPacketizer *)&v3 dealloc];
}

- (id)getNextPacket
{
  if ([(CLDurianFirmwareAssetPacketizer *)self hasSentCRCPacket]) {
    return 0;
  }
  if ([(CLDurianFirmwareAssetPacketizer *)self hasSentAssetData])
  {
    [(CLDurianFirmwareAssetPacketizer *)self setHasSentCRCPacket:1];
    return [(CLDurianFirmwareAssetPacketizer *)self _buildCRCPacket];
  }
  else
  {
    unint64_t v4 = [(CLDurianFirmwareAssetPacketizer *)self maxPayloadSize];
    unint64_t v5 = [(CLDurianFirmwareAssetPacketizer *)self payloadOffset];
    v6 = (char *)[(CLDurianFirmwareAssetPacketizer *)self maxPayloadSize] + v5;
    if (v6 >= (char *)[(NSData *)[(CLDurianFirmwareAssetPacketizer *)self assetData] length])
    {
      [(CLDurianFirmwareAssetPacketizer *)self setHasSentAssetData:1];
      NSUInteger v7 = [(NSData *)[(CLDurianFirmwareAssetPacketizer *)self assetData] length];
      unint64_t v4 = v7 - [(CLDurianFirmwareAssetPacketizer *)self payloadOffset];
    }
    unint64_t v8 = [(NSData *)[(CLDurianFirmwareAssetPacketizer *)self assetData] length];
    if (v8 <= [(CLDurianFirmwareAssetPacketizer *)self maxPayloadSize])
    {
      [(CLDurianFirmwareAssetPacketizer *)self setHasSentAssetData:1];
      unint64_t v4 = [(NSData *)[(CLDurianFirmwareAssetPacketizer *)self assetData] length];
    }
    v9 = -[NSData subdataWithRange:]([(CLDurianFirmwareAssetPacketizer *)self assetData], "subdataWithRange:", [(CLDurianFirmwareAssetPacketizer *)self payloadOffset], v4);
    [(CLDurianFirmwareAssetPacketizer *)self setAssetDataCRC:crc32([(CLDurianFirmwareAssetPacketizer *)self assetDataCRC], (const Bytef *)[(NSData *)v9 bytes], v4)];
    uint64_t v14 = [(CLDurianFirmwareAssetPacketizer *)self hasSentAssetData];
    v10 = +[NSData dataWithBytes:&v14 length:1];
    unint64_t v13 = [(CLDurianFirmwareAssetPacketizer *)self payloadOffset];
    objc_super v11 = +[NSData dataWithBytes:&v13 length:4];
    id v12 = objc_alloc_init((Class)NSMutableData);
    [v12 appendData:[[self assetTargetHeader];
    [v12 appendData:v10];
    [v12 appendData:v11];
    [v12 appendData:v9];
    [(CLDurianFirmwareAssetPacketizer *)self setPayloadOffset:(char *)[(CLDurianFirmwareAssetPacketizer *)self payloadOffset] + v4];
    return v12;
  }
}

- (id)_buildCRCPacket
{
  unint64_t v10 = [(CLDurianFirmwareAssetPacketizer *)self assetDataCRC];
  objc_super v3 = +[NSData dataWithBytes:&v10 length:4];
  uint64_t v9 = 2;
  unint64_t v4 = +[NSData dataWithBytes:&v9 length:1];
  uint64_t v8 = 0;
  unint64_t v5 = +[NSData dataWithBytes:&v8 length:4];
  id v6 = objc_alloc_init((Class)NSMutableData);
  [v6 appendData:-[CLDurianFirmwareAssetPacketizer assetTargetHeader](self, "assetTargetHeader")];
  [v6 appendData:v4];
  [v6 appendData:v5];
  [v6 appendData:v3];
  return v6;
}

- (int)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(int)a3
{
  self->_assetType = a3;
}

- (NSData)assetData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAssetData:(id)a3
{
}

- (unint64_t)assetDataCRC
{
  return self->_assetDataCRC;
}

- (void)setAssetDataCRC:(unint64_t)a3
{
  self->_assetDataCRC = a3;
}

- (NSData)assetTargetHeader
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAssetTargetHeader:(id)a3
{
}

- (BOOL)hasSentAssetData
{
  return self->_hasSentAssetData;
}

- (void)setHasSentAssetData:(BOOL)a3
{
  self->_hasSentAssetData = a3;
}

- (BOOL)hasSentCRCPacket
{
  return self->_hasSentCRCPacket;
}

- (void)setHasSentCRCPacket:(BOOL)a3
{
  self->_hasSentCRCPacket = a3;
}

- (unint64_t)maxPayloadSize
{
  return self->_maxPayloadSize;
}

- (void)setMaxPayloadSize:(unint64_t)a3
{
  self->_maxPayloadSize = a3;
}

- (unint64_t)payloadOffset
{
  return self->_payloadOffset;
}

- (void)setPayloadOffset:(unint64_t)a3
{
  self->_payloadOffset = a3;
}

@end