@interface _NUBufferImage
- (BOOL)copyBufferStorage:(id)a3 fromRect:(id *)a4 toPoint:(id)a5;
- (BOOL)copySurfaceStorage:(id)a3 fromRect:(id *)a4 toPoint:(id)a5 device:(id)a6;
- (id)debugQuickLookObject;
- (void)readBufferRegion:(id)a3 withBlock:(id)a4;
- (void)writeBufferRegion:(id)a3 withBlock:(id)a4;
@end

@implementation _NUBufferImage

- (BOOL)copyBufferStorage:(id)a3 fromRect:(id *)a4 toPoint:(id)a5
{
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  id v9 = a3;
  $0AC6E346AE4835514AAA8AC86D8F4844 v10 = a4->var1;
  v18[0] = a4->var0;
  v18[1] = v10;
  v11 = +[NURegion regionWithRect:v18];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  $0AC6E346AE4835514AAA8AC86D8F4844 v12 = a4->var1;
  $0AC6E346AE4835514AAA8AC86D8F4844 v16 = a4->var0;
  $0AC6E346AE4835514AAA8AC86D8F4844 v17 = v12;
  v15[2] = __53___NUBufferImage_copyBufferStorage_fromRect_toPoint___block_invoke;
  v15[3] = &unk_1E5D95AA0;
  v15[4] = self;
  v15[5] = var0;
  v15[6] = var1;
  uint64_t v13 = [v9 readBufferInRegion:v11 block:v15];

  return v13 == 1;
}

- (BOOL)copySurfaceStorage:(id)a3 fromRect:(id *)a4 toPoint:(id)a5 device:(id)a6
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a4->var1;
  v8[0] = a4->var0;
  v8[1] = var1;
  return -[_NUBufferImage copyBufferStorage:fromRect:toPoint:](self, "copyBufferStorage:fromRect:toPoint:", a3, v8, a5.var0, a5.var1, a6);
}

- (void)writeBufferRegion:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _OWORD v8[2] = __46___NUBufferImage_writeBufferRegion_withBlock___block_invoke;
  v8[3] = &unk_1E5D95A50;
  id v9 = v6;
  id v7 = v6;
  [(_NUImage *)self writeRegion:a3 withBlock:v8];
}

- (void)readBufferRegion:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _OWORD v8[2] = __45___NUBufferImage_readBufferRegion_withBlock___block_invoke;
  v8[3] = &unk_1E5D95A50;
  id v9 = v6;
  id v7 = v6;
  [(_NUImage *)self readRegion:a3 withBlock:v8];
}

- (id)debugQuickLookObject
{
  id v2 = +[NUImageFactory newCIImageFromBufferImage:self];

  return v2;
}

@end