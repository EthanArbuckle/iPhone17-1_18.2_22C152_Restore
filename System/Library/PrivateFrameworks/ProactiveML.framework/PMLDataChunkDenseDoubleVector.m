@interface PMLDataChunkDenseDoubleVector
+ (id)chunkWithVector:(const double *)a3 count:(int)a4;
+ (unsigned)dataChunkType;
- (const)vector;
- (int)count;
@end

@implementation PMLDataChunkDenseDoubleVector

- (int)count
{
  return [(NSData *)self->super._backingData length] >> 3;
}

- (const)vector
{
  return (const double *)[(NSData *)self->super._backingData bytes];
}

+ (id)chunkWithVector:(const double *)a3 count:(int)a4
{
  v4 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:a3 length:8 * a4];
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithData:v4];

  return v5;
}

+ (unsigned)dataChunkType
{
  return 3;
}

@end