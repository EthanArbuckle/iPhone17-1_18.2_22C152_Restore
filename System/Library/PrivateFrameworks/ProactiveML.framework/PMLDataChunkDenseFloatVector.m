@interface PMLDataChunkDenseFloatVector
+ (id)chunkWithVector:(const float *)a3 count:(int)a4;
+ (unsigned)dataChunkType;
- (const)vector;
- (id)toVec;
- (int)count;
@end

@implementation PMLDataChunkDenseFloatVector

- (id)toVec
{
  v3 = [PMLMutableDenseVector alloc];
  v4 = self;
  v5 = [(PMLDenseVector *)v3 initWithFloats:[(PMLDataChunkDenseFloatVector *)v4 vector] count:[(PMLDataChunkDenseFloatVector *)v4 count]];
  return v5;
}

- (int)count
{
  return [(NSData *)self->super._backingData length] >> 2;
}

- (const)vector
{
  return (const float *)[(NSData *)self->super._backingData bytes];
}

+ (id)chunkWithVector:(const float *)a3 count:(int)a4
{
  v4 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:a3 length:4 * a4];
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithData:v4];

  return v5;
}

+ (unsigned)dataChunkType
{
  return 2;
}

@end