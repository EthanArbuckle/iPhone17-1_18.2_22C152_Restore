@interface PFColorConverter
- (void)adjustPixelBuffer:(__CVBuffer *)a3 toOutputBuffer:(__CVBuffer *)a4;
- (void)convertWithVideoURL:(id)a3 outURL:(id)a4 progress:(id)a5 completion:(id)a6;
@end

@implementation PFColorConverter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversionContext, 0);

  objc_storeStrong((id *)&self->_readerWriter, 0);
}

- (void)adjustPixelBuffer:(__CVBuffer *)a3 toOutputBuffer:(__CVBuffer *)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v7 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB90]);
  v8 = (void *)MEMORY[0x1E4F1E050];
  uint64_t v26 = *MEMORY[0x1E4F1E390];
  v27[0] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  v10 = [v8 imageWithCVPixelBuffer:a3 options:v9];

  CGColorSpaceRelease(v7);
  if (!self->_conversionContext)
  {
    v11 = (void *)MEMORY[0x1E4F1E018];
    uint64_t v24 = *MEMORY[0x1E4F1E208];
    v25 = @"PFColorConverter-adjustPixelBuffer";
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    v13 = [v11 contextWithOptions:v12];
    conversionContext = self->_conversionContext;
    self->_conversionContext = v13;
  }
  [v10 extent];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
  -[CIContext render:toCVPixelBuffer:bounds:colorSpace:](self->_conversionContext, "render:toCVPixelBuffer:bounds:colorSpace:", v10, a4, v23, v16, v18, v20, v22);
  CGColorSpaceRelease(v23);
}

- (void)convertWithVideoURL:(id)a3 outURL:(id)a4 progress:(id)a5 completion:(id)a6
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void, void *))a6;
  v14 = [MEMORY[0x1E4F16330] assetWithURL:v10];
  if (v14)
  {
    double v15 = [[PFAVReaderWriter alloc] initWithAsset:v14];
    readerWriter = self->_readerWriter;
    self->_readerWriter = v15;

    [(PFAVReaderWriter *)self->_readerWriter setDelegate:self];
    [(PFAVReaderWriter *)self->_readerWriter writeToURL:v11 progress:v12 completion:v13];
  }
  else if (v13)
  {
    double v17 = [NSString stringWithFormat:@"Failed to load video at url: %@", v10];
    double v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22[0] = v17;
    double v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    double v20 = [v18 errorWithDomain:@"PFColorConverterErrorDomain" code:42 userInfo:v19];

    v13[2](v13, 0, v20);
  }
}

@end