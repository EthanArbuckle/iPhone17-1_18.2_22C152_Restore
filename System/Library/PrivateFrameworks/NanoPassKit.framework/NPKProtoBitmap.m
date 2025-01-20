@interface NPKProtoBitmap
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)bitmapData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)bitsPerComponent;
- (unint64_t)bitsPerPixel;
- (unint64_t)bytesPerRow;
- (unint64_t)hash;
- (unint64_t)height;
- (unint64_t)width;
- (unsigned)bitmapInfo;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBitmapData:(id)a3;
- (void)setBitmapInfo:(unsigned int)a3;
- (void)setBitsPerComponent:(unint64_t)a3;
- (void)setBitsPerPixel:(unint64_t)a3;
- (void)setBytesPerRow:(unint64_t)a3;
- (void)setHeight:(unint64_t)a3;
- (void)setWidth:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoBitmap

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoBitmap;
  v4 = [(NPKProtoBitmap *)&v8 description];
  v5 = [(NPKProtoBitmap *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithUnsignedLongLong:self->_width];
  [v3 setObject:v4 forKey:@"width"];

  v5 = [NSNumber numberWithUnsignedLongLong:self->_height];
  [v3 setObject:v5 forKey:@"height"];

  v6 = [NSNumber numberWithUnsignedLongLong:self->_bitsPerComponent];
  [v3 setObject:v6 forKey:@"bitsPerComponent"];

  v7 = [NSNumber numberWithUnsignedLongLong:self->_bitsPerPixel];
  [v3 setObject:v7 forKey:@"bitsPerPixel"];

  objc_super v8 = [NSNumber numberWithUnsignedLongLong:self->_bytesPerRow];
  [v3 setObject:v8 forKey:@"bytesPerRow"];

  v9 = [NSNumber numberWithUnsignedInt:self->_bitmapInfo];
  [v3 setObject:v9 forKey:@"bitmapInfo"];

  bitmapData = self->_bitmapData;
  if (bitmapData) {
    [v3 setObject:bitmapData forKey:@"bitmapData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoBitmapReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint32Field();
  if (!self->_bitmapData) {
    -[NPKProtoBitmap writeTo:]();
  }
  PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 5) = self->_width;
  *((void *)a3 + 4) = self->_height;
  *((void *)a3 + 1) = self->_bitsPerComponent;
  *((void *)a3 + 2) = self->_bitsPerPixel;
  *((void *)a3 + 3) = self->_bytesPerRow;
  *((_DWORD *)a3 + 14) = self->_bitmapInfo;
  [a3 setBitmapData:self->_bitmapData];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 40) = self->_width;
  *(void *)(v5 + 32) = self->_height;
  *(void *)(v5 + 8) = self->_bitsPerComponent;
  *(void *)(v5 + 16) = self->_bitsPerPixel;
  *(void *)(v5 + 24) = self->_bytesPerRow;
  *(_DWORD *)(v5 + 56) = self->_bitmapInfo;
  uint64_t v6 = [(NSData *)self->_bitmapData copyWithZone:a3];
  v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_width == v4[5]
    && self->_height == v4[4]
    && self->_bitsPerComponent == v4[1]
    && self->_bitsPerPixel == v4[2]
    && self->_bytesPerRow == v4[3]
    && self->_bitmapInfo == *((_DWORD *)v4 + 14))
  {
    bitmapData = self->_bitmapData;
    if ((unint64_t)bitmapData | v4[6]) {
      char v6 = -[NSData isEqual:](bitmapData, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v2 = (2654435761u * self->_height) ^ (2654435761u * self->_width) ^ (2654435761u * self->_bitsPerComponent) ^ (2654435761u * self->_bitsPerPixel);
  unint64_t v3 = (2654435761u * self->_bytesPerRow) ^ (2654435761 * self->_bitmapInfo);
  return v2 ^ v3 ^ [(NSData *)self->_bitmapData hash];
}

- (void)mergeFrom:(id)a3
{
  self->_width = *((void *)a3 + 5);
  self->_height = *((void *)a3 + 4);
  self->_bitsPerComponent = *((void *)a3 + 1);
  self->_bitsPerPixel = *((void *)a3 + 2);
  self->_bytesPerRow = *((void *)a3 + 3);
  self->_bitmapInfo = *((_DWORD *)a3 + 14);
  if (*((void *)a3 + 6)) {
    -[NPKProtoBitmap setBitmapData:](self, "setBitmapData:");
  }
}

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (unint64_t)height
{
  return self->_height;
}

- (void)setHeight:(unint64_t)a3
{
  self->_height = a3;
}

- (unint64_t)bitsPerComponent
{
  return self->_bitsPerComponent;
}

- (void)setBitsPerComponent:(unint64_t)a3
{
  self->_bitsPerComponent = a3;
}

- (unint64_t)bitsPerPixel
{
  return self->_bitsPerPixel;
}

- (void)setBitsPerPixel:(unint64_t)a3
{
  self->_bitsPerPixel = a3;
}

- (unint64_t)bytesPerRow
{
  return self->_bytesPerRow;
}

- (void)setBytesPerRow:(unint64_t)a3
{
  self->_bytesPerRow = a3;
}

- (unsigned)bitmapInfo
{
  return self->_bitmapInfo;
}

- (void)setBitmapInfo:(unsigned int)a3
{
  self->_bitmapInfo = a3;
}

- (NSData)bitmapData
{
  return self->_bitmapData;
}

- (void)setBitmapData:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoBitmap writeTo:]", "NPKProtoBitmap.m", 138, "nil != self->_bitmapData");
}

@end