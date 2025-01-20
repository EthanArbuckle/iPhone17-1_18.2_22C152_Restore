@interface _NUSurfaceImage
- (BOOL)copyBufferStorage:(id)a3 fromRect:(id *)a4 toPoint:(id)a5;
- (BOOL)copySurfaceStorage:(id)a3 fromRect:(id *)a4 toPoint:(id)a5 device:(id)a6;
- (void)readSurfaceRegion:(id)a3 withBlock:(id)a4;
- (void)readTextureRegion:(id)a3 device:(id)a4 withBlock:(id)a5;
- (void)writeSurfaceRegion:(id)a3 withBlock:(id)a4;
- (void)writeTextureRegion:(id)a3 device:(id)a4 withBlock:(id)a5;
@end

@implementation _NUSurfaceImage

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
  v15[2] = __54___NUSurfaceImage_copyBufferStorage_fromRect_toPoint___block_invoke;
  v15[3] = &unk_1E5D95AA0;
  v15[4] = self;
  v15[5] = var0;
  v15[6] = var1;
  uint64_t v13 = [v9 readBufferInRegion:v11 block:v15];

  return v13 == 1;
}

- (BOOL)copySurfaceStorage:(id)a3 fromRect:(id *)a4 toPoint:(id)a5 device:(id)a6
{
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  id v11 = a3;
  id v12 = a6;
  if ([v12 hasMetalSupport])
  {
    $0AC6E346AE4835514AAA8AC86D8F4844 v13 = a4->var1;
    v27[0] = a4->var0;
    v27[1] = v13;
    v14 = +[NURegion regionWithRect:v27];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __62___NUSurfaceImage_copySurfaceStorage_fromRect_toPoint_device___block_invoke;
    v21[3] = &unk_1E5D95B40;
    $0AC6E346AE4835514AAA8AC86D8F4844 v15 = a4->var1;
    $0AC6E346AE4835514AAA8AC86D8F4844 v23 = a4->var0;
    $0AC6E346AE4835514AAA8AC86D8F4844 v24 = v15;
    v21[4] = self;
    int64_t v25 = var0;
    int64_t v26 = var1;
    id v22 = v12;
    uint64_t v16 = [v11 readTextureInRegion:v14 device:v22 block:v21];

    BOOL v17 = v16 == 1;
  }
  else
  {
    $0AC6E346AE4835514AAA8AC86D8F4844 v18 = a4->var1;
    v20[0] = a4->var0;
    v20[1] = v18;
    BOOL v17 = -[_NUSurfaceImage copyBufferStorage:fromRect:toPoint:](self, "copyBufferStorage:fromRect:toPoint:", v11, v20, var0, var1);
  }

  return v17;
}

- (void)writeTextureRegion:(id)a3 device:(id)a4 withBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55___NUSurfaceImage_writeTextureRegion_device_withBlock___block_invoke;
  v13[3] = &unk_1E5D95B18;
  id v14 = v8;
  id v15 = v9;
  v12.receiver = self;
  v12.super_class = (Class)_NUSurfaceImage;
  id v10 = v9;
  id v11 = v8;
  [(_NUImage *)&v12 writeRegion:a3 withBlock:v13];
}

- (void)readTextureRegion:(id)a3 device:(id)a4 withBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54___NUSurfaceImage_readTextureRegion_device_withBlock___block_invoke;
  v13[3] = &unk_1E5D95B18;
  id v14 = v8;
  id v15 = v9;
  v12.receiver = self;
  v12.super_class = (Class)_NUSurfaceImage;
  id v10 = v9;
  id v11 = v8;
  [(_NUImage *)&v12 readRegion:a3 withBlock:v13];
}

- (void)writeSurfaceRegion:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48___NUSurfaceImage_writeSurfaceRegion_withBlock___block_invoke;
  v8[3] = &unk_1E5D95A50;
  id v9 = v6;
  id v7 = v6;
  [(_NUImage *)self writeRegion:a3 withBlock:v8];
}

- (void)readSurfaceRegion:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47___NUSurfaceImage_readSurfaceRegion_withBlock___block_invoke;
  v8[3] = &unk_1E5D95A50;
  id v9 = v6;
  id v7 = v6;
  [(_NUImage *)self readRegion:a3 withBlock:v8];
}

@end