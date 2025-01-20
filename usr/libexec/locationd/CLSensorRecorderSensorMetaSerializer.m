@interface CLSensorRecorderSensorMetaSerializer
+ (void)deserializeMeta:(id)a3 fromData:(id)a4;
+ (void)serializeMeta:(id)a3 toData:(id)a4;
- (BOOL)readMeta:(id)a3 fromHandle:(id)a4;
- (CLSensorRecorderSensorMetaSerializer)init;
- (void)dealloc;
- (void)writeMeta:(id)a3 toHandle:(id)a4;
@end

@implementation CLSensorRecorderSensorMetaSerializer

- (CLSensorRecorderSensorMetaSerializer)init
{
  v4.receiver = self;
  v4.super_class = (Class)CLSensorRecorderSensorMetaSerializer;
  v2 = [(CLSensorRecorderSensorMetaSerializer *)&v4 init];
  if (v2) {
    v2->fBuffer = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithCapacity:20];
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLSensorRecorderSensorMetaSerializer;
  [(CLSensorRecorderSensorMetaSerializer *)&v3 dealloc];
}

+ (void)serializeMeta:(id)a3 toData:(id)a4
{
  unsigned int v9 = bswap32([a3 dataSize]);
  [a4 appendBytes:&v9 length:4];
  unint64_t v8 = bswap64((unint64_t)[a3 timestamp]);
  [a4 appendBytes:&v8 length:8];
  [a3 startTime];
  uint64_t v7 = v6;
  [a4 appendBytes:&v7 length:8];
}

+ (void)deserializeMeta:(id)a3 fromData:(id)a4
{
  [a3 setDataSize:bswap32(*(_DWORD *)[a4 bytes])];
  [a3 setTimestamp:bswap64(*(void *)((char *)[a4 bytes] + 4))];
  double v6 = *(double *)((char *)[a4 bytes] + 12);

  [a3 setStartTime:v6];
}

- (void)writeMeta:(id)a3 toHandle:(id)a4
{
  +[CLSensorRecorderSensorMetaSerializer serializeMeta:a3 toData:self->fBuffer];
  [a4 writeData:self->fBuffer];
  fBuffer = self->fBuffer;

  [(NSMutableData *)fBuffer setLength:0];
}

- (BOOL)readMeta:(id)a3 fromHandle:(id)a4
{
  -[NSMutableData setData:](self->fBuffer, "setData:", [a4 readDataOfLength:20]);
  NSUInteger v6 = [(NSMutableData *)self->fBuffer length];
  if (v6 == 20) {
    +[CLSensorRecorderSensorMetaSerializer deserializeMeta:a3 fromData:self->fBuffer];
  }
  return v6 == 20;
}

@end