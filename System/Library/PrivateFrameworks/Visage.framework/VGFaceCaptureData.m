@interface VGFaceCaptureData
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp;
- (NSArray)allFaces;
- (VGFaceMetadata)face;
- (__CVBuffer)depth;
- (__CVBuffer)yuvRectified;
- (__n128)chromaticAdaptationMatrix;
- (__n128)depthIntrinsics;
- (__n128)setChromaticAdaptationMatrix:(__n128)a3;
- (__n128)setDepthIntrinsics:(__n128)a3;
- (__n128)setVideoIntrinsics:(__n128)a3;
- (__n128)videoIntrinsics;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)saveAtPath:(id)a3;
- (void)setAllFaces:(id)a3;
- (void)setDepth:(__CVBuffer *)a3;
- (void)setFace:(id)a3;
- (void)setTimestamp:(id *)a3;
- (void)setYuvRectified:(__CVBuffer *)a3;
@end

@implementation VGFaceCaptureData

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  objc_msgSend(v4, "setVideoIntrinsics:", *(double *)self->_anon_40, *(double *)&self->_anon_40[16], *(double *)&self->_anon_40[32]);
  objc_msgSend(v4, "setDepthIntrinsics:", *(double *)self->_anon_70, *(double *)&self->_anon_70[16], *(double *)&self->_anon_70[32]);
  objc_msgSend(v4, "setChromaticAdaptationMatrix:", *(double *)&self[1].super.isa, *(double *)&self[1]._depth, *(double *)&self[1]._allFaces);
  [v4 setFace:self->_face];
  [v4 setAllFaces:self->_allFaces];
  $95D729B680665BEAEFA1D6FCA8238556 timestamp = self->_timestamp;
  [v4 setTimestamp:&timestamp];
  CVPixelBufferRef IOSurfaceBackedPixelBufferCopy = vg::createIOSurfaceBackedPixelBufferCopy(self->_depth, v5);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __34__VGFaceCaptureData_copyWithZone___block_invoke;
  v14[3] = &__block_descriptor_40_e5_v8__0l;
  v14[4] = IOSurfaceBackedPixelBufferCopy;
  v7 = (void (**)(void))MEMORY[0x261227FC0](v14);
  [v4 setDepth:IOSurfaceBackedPixelBufferCopy];
  CVPixelBufferRef v9 = vg::createIOSurfaceBackedPixelBufferCopy(self->_yuvRectified, v8);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __34__VGFaceCaptureData_copyWithZone___block_invoke_2;
  v13[3] = &__block_descriptor_40_e5_v8__0l;
  v13[4] = v9;
  v10 = (void (**)(void))MEMORY[0x261227FC0](v13);
  [v4 setYuvRectified:v9];
  id v11 = v4;
  v10[2](v10);

  v7[2](v7);
  return v11;
}

void __34__VGFaceCaptureData_copyWithZone___block_invoke(uint64_t a1)
{
}

void __34__VGFaceCaptureData_copyWithZone___block_invoke_2(uint64_t a1)
{
}

- (void)saveAtPath:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)[objc_alloc(NSURL) initFileURLWithPath:v4 isDirectory:0];
  v6 = [MEMORY[0x263F00650] imageWithCVPixelBuffer:self->_yuvRectified];
  id v7 = objc_alloc(MEMORY[0x263F00628]);
  v8 = (void *)[v7 initWithOptions:MEMORY[0x263EFFA78]];
  uint64_t v9 = [v6 colorSpace];
  uint64_t v10 = *MEMORY[0x263F008B0];
  id v14 = 0;
  [v8 writePNGRepresentationOfImage:v6 toURL:v5 format:v10 colorSpace:v9 options:MEMORY[0x263EFFA78] error:&v14];
  id v11 = v14;
  v12 = __VGLogSharedInstance();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v5;
    _os_log_impl(&dword_260C8D000, v12, OS_LOG_TYPE_DEBUG, " VGCaptureData write at %@ ", buf, 0xCu);
  }

  if (v11)
  {
    v13 = __VGLogSharedInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v11;
      _os_log_impl(&dword_260C8D000, v13, OS_LOG_TYPE_ERROR, " write error %@ ", buf, 0xCu);
    }
  }
}

- (void)setYuvRectified:(__CVBuffer *)a3
{
  CVPixelBufferRelease(self->_yuvRectified);
  self->_yuvRectified = a3;

  CVPixelBufferRetain(a3);
}

- (void)setDepth:(__CVBuffer *)a3
{
  CVPixelBufferRelease(self->_depth);
  self->_depth = a3;

  CVPixelBufferRetain(a3);
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_depth);
  CVPixelBufferRelease(self->_yuvRectified);
  v3.receiver = self;
  v3.super_class = (Class)VGFaceCaptureData;
  [(VGFaceCaptureData *)&v3 dealloc];
}

- (__CVBuffer)yuvRectified
{
  return self->_yuvRectified;
}

- (__CVBuffer)depth
{
  return self->_depth;
}

- (__n128)videoIntrinsics
{
  return a1[4];
}

- (__n128)setVideoIntrinsics:(__n128)a3
{
  result[4] = a2;
  result[5] = a3;
  result[6] = a4;
  return result;
}

- (__n128)depthIntrinsics
{
  return a1[7];
}

- (__n128)setDepthIntrinsics:(__n128)a3
{
  result[7] = a2;
  result[8] = a3;
  result[9] = a4;
  return result;
}

- (__n128)chromaticAdaptationMatrix
{
  return a1[10];
}

- (__n128)setChromaticAdaptationMatrix:(__n128)a3
{
  result[10] = a2;
  result[11] = a3;
  result[12] = a4;
  return result;
}

- (VGFaceMetadata)face
{
  return self->_face;
}

- (void)setFace:(id)a3
{
}

- (NSArray)allFaces
{
  return self->_allFaces;
}

- (void)setAllFaces:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (void)setTimestamp:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_timestamp.epoch = a3->var3;
  *(_OWORD *)&self->_timestamp.value = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allFaces, 0);

  objc_storeStrong((id *)&self->_face, 0);
}

@end