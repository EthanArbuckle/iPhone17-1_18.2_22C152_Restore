@interface PMLDataChunkRaw
+ (id)chunkWithData:(id)a3;
+ (unsigned)dataChunkType;
- (NSData)data;
@end

@implementation PMLDataChunkRaw

- (NSData)data
{
  return self->super._backingData;
}

+ (id)chunkWithData:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithData:v3];

  return v4;
}

+ (unsigned)dataChunkType
{
  return 0;
}

@end