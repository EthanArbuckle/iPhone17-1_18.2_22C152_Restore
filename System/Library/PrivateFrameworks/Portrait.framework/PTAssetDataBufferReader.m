@interface PTAssetDataBufferReader
+ (Class)frameClass;
+ (NSString)_movieExtension;
+ (NSString)_movieFilename;
+ (NSString)_sequenceDirectoryName;
+ (NSString)_sequenceExtension;
+ (NSString)_sequenceInfoFilename;
- (AVAssetReader)assetReader;
- (AVAssetReaderTrackOutput)disparityTrackOutput;
- (BOOL)_startReadingMovieWithError:(id *)a3;
- (BOOL)_startReadingSequenceWithError:(id *)a3;
- (BOOL)isVector3Format;
- (BOOL)startReadingWithError:(id *)a3;
- (NSString)filenameFormat;
- (NSURL)dataURL;
- (NSURL)movieURL;
- (NSURL)sequenceURL;
- (PTAssetDataBufferReader)initWithURL:(id)a3;
- (__CVBuffer)_copyPixelBufferFromURL:(id)a3;
- (float)framesPerSecond;
- (id)_copyNextFrame_movie;
- (id)_copyNextFrame_sequence;
- (id)_frameInstance;
- (id)copyNextFrame;
- (id)globals;
- (unint64_t)height;
- (unint64_t)nextIndex;
- (unint64_t)width;
- (unsigned)pixelFormat;
- (void)_frameInstance;
- (void)copyNextFrame;
- (void)setAssetReader:(id)a3;
- (void)setDisparityTrackOutput:(id)a3;
- (void)setNextIndex:(unint64_t)a3;
@end

@implementation PTAssetDataBufferReader

- (PTAssetDataBufferReader)initWithURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTAssetDataBufferReader;
  v5 = [(PTAssetDataBufferReader *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dataURL = v5->_dataURL;
    v5->_dataURL = (NSURL *)v6;
  }
  return v5;
}

- (BOOL)startReadingWithError:(id *)a3
{
  v5 = [(NSURL *)self->_dataURL pathExtension];
  uint64_t v6 = [(id)objc_opt_class() _movieExtension];
  int v7 = [v5 isEqualToString:v6];

  dataURL = self->_dataURL;
  if (v7)
  {
    objc_super v9 = (NSURL *)[(NSURL *)dataURL copy];
    movieURL = self->_movieURL;
    self->_movieURL = v9;

    return [(PTAssetDataBufferReader *)self _startReadingMovieWithError:a3];
  }
  else
  {
    v12 = [(NSURL *)dataURL pathExtension];
    v13 = [(id)objc_opt_class() _sequenceExtension];
    int v14 = [v12 isEqualToString:v13];

    v15 = self->_dataURL;
    if (v14)
    {
      v16 = (NSURL *)[(NSURL *)self->_dataURL copy];
      sequenceURL = self->_sequenceURL;
      self->_sequenceURL = v16;

      return [(PTAssetDataBufferReader *)self _startReadingSequenceWithError:a3];
    }
    else
    {
      v18 = [(id)objc_opt_class() _movieFilename];
      v19 = [(NSURL *)v15 URLByAppendingPathComponent:v18];

      if ([v19 checkResourceIsReachableAndReturnError:0])
      {
        objc_storeStrong((id *)&self->_movieURL, v19);
        BOOL v20 = [(PTAssetDataBufferReader *)self _startReadingMovieWithError:a3];
      }
      else
      {
        v21 = self->_dataURL;
        v22 = [(id)objc_opt_class() _sequenceDirectoryName];
        v23 = [(NSURL *)v21 URLByAppendingPathComponent:v22];

        if ([v23 checkResourceIsReachableAndReturnError:0])
        {
          objc_storeStrong((id *)&self->_sequenceURL, v23);
          BOOL v20 = [(PTAssetDataBufferReader *)self _startReadingSequenceWithError:a3];
        }
        else
        {
          _ErrorForDataBufferNotFoundAtURL(self->_dataURL);
          BOOL v20 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      return v20;
    }
  }
}

- (BOOL)_startReadingSequenceWithError:(id *)a3
{
  sequenceURL = self->_sequenceURL;
  if (!sequenceURL) {
    goto LABEL_11;
  }
  uint64_t v6 = sequenceURL;
  id v33 = 0;
  if (![(NSURL *)v6 getResourceValue:&v33 forKey:*MEMORY[0x1E4F1C628] error:0]
    || ([v33 BOOLValue] & 1) == 0)
  {
    _ErrorForDataBufferNotFoundAtURL(v6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    dataURL = self->_sequenceURL;
    if (dataURL)
    {
LABEL_12:
      _ErrorForDataBufferNotFoundAtURL(dataURL);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      BOOL result = 0;
      *a3 = v23;
      return result;
    }
LABEL_11:
    dataURL = self->_dataURL;
    goto LABEL_12;
  }

  int v7 = self->_sequenceURL;
  v8 = [(id)objc_opt_class() _sequenceInfoFilename];
  objc_super v9 = [(NSURL *)v7 URLByAppendingPathComponent:v8];

  id v10 = v9;
  v11 = [MEMORY[0x1E4F1CA10] inputStreamWithURL:v10];
  [v11 open];
  id v33 = 0;
  v12 = [MEMORY[0x1E4F28D90] JSONObjectWithStream:v11 options:0 error:&v33];
  id v13 = v33;
  if (v13)
  {
    int v14 = _PTLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      [(PTAssetDataBufferReader *)(uint64_t)v10 _startReadingSequenceWithError:v14];
    }
  }
  v15 = [v12 objectForKeyedSubscript:@"filename-format"];
  filenameFormat = self->_filenameFormat;
  self->_filenameFormat = v15;

  v17 = [v12 objectForKeyedSubscript:@"vector3-format"];
  self->_isVector3Format = [v17 BOOLValue];

  v18 = [v12 objectForKeyedSubscript:@"pixel-format"];

  if (v18)
  {
    v19 = [v12 objectForKeyedSubscript:@"pixel-format"];
    BOOL v20 = [v19 dataUsingEncoding:4 allowLossyConversion:1];
    LODWORD(v33) = 0;
    [v20 getBytes:&v33 length:4];
    unsigned int v21 = bswap32(v33);

    self->_pixelFormat = v21;
  }
  else
  {
    v25 = [(NSString *)self->_filenameFormat pathExtension];
    v26 = [&unk_1F26C11F0 objectForKeyedSubscript:v25];
    unsigned int v27 = [v26 unsignedIntegerValue];

    self->_pixelFormat = v27;
  }
  v28 = [v12 objectForKeyedSubscript:@"width"];
  self->_width = [v28 unsignedIntegerValue];

  v29 = [v12 objectForKeyedSubscript:@"height"];
  self->_height = [v29 unsignedIntegerValue];

  v30 = [v12 objectForKeyedSubscript:@"frames-per-second"];
  [v30 floatValue];
  if (v31 == 0.0) {
    float v31 = 30.0;
  }
  self->_framesPerSecond = v31;

  v32 = [v12 objectForKeyedSubscript:@"frame-start"];
  self->_nextIndex = [v32 unsignedIntegerValue];

  return 1;
}

- (BOOL)_startReadingMovieWithError:(id *)a3
{
  if (self->_movieURL)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F16330], "assetWithURL:");
    id v17 = 0;
    uint64_t v6 = (AVAssetReader *)[objc_alloc(MEMORY[0x1E4F16378]) initWithAsset:v5 error:&v17];
    id v7 = v17;
    assetReader = self->_assetReader;
    self->_assetReader = v6;

    if (self->_assetReader)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F163A0]);
      id v10 = [v5 tracks];
      v11 = [v10 firstObject];
      v12 = (AVAssetReaderTrackOutput *)[v9 initWithTrack:v11 outputSettings:0];
      disparityTrackOutput = self->_disparityTrackOutput;
      self->_disparityTrackOutput = v12;

      [(AVAssetReaderTrackOutput *)self->_disparityTrackOutput setAlwaysCopiesSampleData:1];
      [(AVAssetReader *)self->_assetReader addOutput:self->_disparityTrackOutput];
      if ([(AVAssetReader *)self->_assetReader startReading])
      {
        self->_nextIndex = 0;
        BOOL v14 = 1;
LABEL_8:

        return v14;
      }
      v15 = self->_assetReader;
      self->_assetReader = 0;
    }
    BOOL v14 = 0;
    goto LABEL_8;
  }
  _ErrorForDataBufferNotFoundAtURL(self->_dataURL);
  BOOL v14 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v14;
}

- (__CVBuffer)_copyPixelBufferFromURL:(id)a3
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CVPixelBufferRef pixelBufferOut = 0;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  size_t width = self->_width;
  size_t height = self->_height;
  OSType pixelFormat = self->_pixelFormat;
  uint64_t v41 = *MEMORY[0x1E4F24D20];
  v42[0] = MEMORY[0x1E4F1CC08];
  CVPixelBufferCreate(v5, width, height, pixelFormat, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1], &pixelBufferOut);
  id v9 = v4;
  uint64_t v10 = [v9 fileSystemRepresentation];
  if (!v10) {
    goto LABEL_35;
  }
  v11 = pixelBufferOut;
  if (!pixelBufferOut) {
    goto LABEL_35;
  }
  v12 = (char *)v10;
  BOOL isVector3Format = self->_isVector3Format;
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBufferOut);
  size_t v15 = CVPixelBufferGetWidth(v11);
  size_t v16 = CVPixelBufferGetHeight(v11);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v11);
  CVPixelBufferLockBaseAddress(v11, 1uLL);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(v11);
  v19 = BaseAddress;
  if (PixelFormatType <= 1380410944)
  {
    if (PixelFormatType == 1278226534)
    {
      size_t v20 = 4;
      goto LABEL_19;
    }
    if (PixelFormatType == 1278226536)
    {
      size_t v20 = 2;
LABEL_19:
      uint64_t v28 = BytesPerRow;
      uint64_t v29 = v15;
      uint64_t v30 = v16;
      uint64_t v31 = 1;
      goto LABEL_20;
    }
    goto LABEL_32;
  }
  if (PixelFormatType == 1380410945)
  {
    if (!isVector3Format)
    {
      BOOL DataVec = LoadDataVec(BaseAddress, 4uLL, BytesPerRow, v15, v16, 4, v12);
      CVPixelBufferUnlockBaseAddress(v11, 1uLL);
      if (!DataVec) {
        goto LABEL_35;
      }
      goto LABEL_31;
    }
    unsigned int v21 = fopen(v12, "r");
    if (v21)
    {
      v22 = v21;
      id v23 = malloc_type_calloc(3 * v15, 4uLL, 0x100004052888210uLL);
      if (v16)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          fread(v23, 4uLL, 3 * v15, v22);
          if (v15)
          {
            v34 = &v19[i * BytesPerRow];
            size_t v35 = v15;
            v36 = v23;
            do
            {
              *(_DWORD *)v34 = *v36;
              *((_DWORD *)v34 + 1) = v36[1];
              *((_DWORD *)v34 + 2) = v36[2];
              *((_DWORD *)v34 + 3) = 0;
              v36 += 3;
              v34 += 16;
              --v35;
            }
            while (v35);
          }
        }
      }
      goto LABEL_30;
    }
LABEL_33:
    fclose(v21);
    goto LABEL_34;
  }
  if (PixelFormatType != 1380411457)
  {
LABEL_32:
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "Unknown data buffer pixel format: 0x%08x\n", PixelFormatType);
LABEL_34:
    CVPixelBufferUnlockBaseAddress(v11, 1uLL);
LABEL_35:
    CVPixelBufferRelease(pixelBufferOut);
    v37 = 0;
    goto LABEL_36;
  }
  if (isVector3Format)
  {
    unsigned int v21 = fopen(v12, "r");
    if (v21)
    {
      v22 = v21;
      id v23 = malloc_type_calloc(3 * v15, 2uLL, 0x1000040BDFB0063uLL);
      if (v16)
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          fread(v23, 2uLL, 3 * v15, v22);
          if (v15)
          {
            v25 = &v19[j * BytesPerRow];
            size_t v26 = v15;
            unsigned int v27 = v23;
            do
            {
              *(_WORD *)v25 = *v27;
              *((_WORD *)v25 + 1) = v27[1];
              *((_WORD *)v25 + 2) = v27[2];
              *((_WORD *)v25 + 3) = 0;
              v27 += 3;
              v25 += 8;
              --v26;
            }
            while (v26);
          }
        }
      }
LABEL_30:
      free(v23);
      fclose(v22);
      CVPixelBufferUnlockBaseAddress(v11, 1uLL);
      goto LABEL_31;
    }
    goto LABEL_33;
  }
  size_t v20 = 2;
  uint64_t v28 = BytesPerRow;
  uint64_t v29 = v15;
  uint64_t v30 = v16;
  uint64_t v31 = 4;
LABEL_20:
  BOOL v32 = LoadDataVec(BaseAddress, v20, v28, v29, v30, v31, v12);
  CVPixelBufferUnlockBaseAddress(v11, 1uLL);
  if (!v32) {
    goto LABEL_35;
  }
LABEL_31:
  v37 = pixelBufferOut;
LABEL_36:

  return v37;
}

- (id)_frameInstance
{
  id v3 = objc_alloc_init((Class)[(id)objc_opt_class() frameClass]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    CFAllocatorRef v5 = _PTLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(PTAssetDataBufferReader *)(uint64_t)self _frameInstance];
    }

    id v4 = 0;
  }

  return v4;
}

- (id)_copyNextFrame_sequence
{
  id v3 = objc_msgSend(NSString, "stringWithFormat:", self->_filenameFormat, self->_nextIndex);
  id v4 = [(NSURL *)self->_sequenceURL URLByAppendingPathComponent:v3];
  CFAllocatorRef v5 = [(PTAssetDataBufferReader *)self _frameInstance];
  [v5 setIndex:self->_nextIndex];
  CMTimeMake(&v9, self->_nextIndex, (int)self->_framesPerSecond);
  CMTime v8 = v9;
  [v5 setTime:&v8];
  objc_msgSend(v5, "setDataBuffer:", -[PTAssetDataBufferReader _copyPixelBufferFromURL:](self, "_copyPixelBufferFromURL:", v4));
  if ([v5 dataBuffer])
  {
    ++self->_nextIndex;
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_copyNextFrame_movie
{
  id v3 = (opaqueCMSampleBuffer *)[(AVAssetReaderTrackOutput *)self->_disparityTrackOutput copyNextSampleBuffer];
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(v3);
  if (!v3) {
    return 0;
  }
  CFAllocatorRef v5 = ImageBuffer;
  if (!ImageBuffer)
  {
    if (self->_nextIndex
      || (CFRelease(v3),
          v3 = (opaqueCMSampleBuffer *)[(AVAssetReaderTrackOutput *)self->_disparityTrackOutput copyNextSampleBuffer], (CFAllocatorRef v5 = CMSampleBufferGetImageBuffer(v3)) == 0))
    {
      CFRelease(v3);
      return 0;
    }
  }
  id v6 = objc_alloc_init((Class)[(id)objc_opt_class() frameClass]);
  ++self->_nextIndex;
  objc_msgSend(v6, "setIndex:");
  CMSampleBufferGetPresentationTimeStamp(&v9, v3);
  CMTime v8 = v9;
  [v6 setTime:&v8];
  [v6 setDataBuffer:CVPixelBufferRetain(v5)];
  CFRelease(v3);
  return v6;
}

- (id)copyNextFrame
{
  id v3 = (void *)MEMORY[0x1D25E42A0](self, a2);
  if (self->_sequenceURL)
  {
    id v4 = [(PTAssetDataBufferReader *)self _copyNextFrame_sequence];
LABEL_5:
    CFAllocatorRef v5 = v4;
    goto LABEL_6;
  }
  if (self->_assetReader)
  {
    id v4 = [(PTAssetDataBufferReader *)self _copyNextFrame_movie];
    goto LABEL_5;
  }
  id v7 = _PTLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[PTAssetDataBufferReader copyNextFrame](v7);
  }

  CFAllocatorRef v5 = 0;
LABEL_6:
  return v5;
}

- (id)globals
{
  return 0;
}

+ (Class)frameClass
{
  return (Class)objc_opt_class();
}

+ (NSString)_movieFilename
{
  return (NSString *)@"dataBuffers.mov";
}

+ (NSString)_sequenceDirectoryName
{
  return (NSString *)@"dataBuffers.sequence";
}

+ (NSString)_movieExtension
{
  return (NSString *)@"mov";
}

+ (NSString)_sequenceExtension
{
  return (NSString *)@"sequence";
}

+ (NSString)_sequenceInfoFilename
{
  return (NSString *)@"sequenceInfo.json";
}

- (NSURL)dataURL
{
  return self->_dataURL;
}

- (NSURL)movieURL
{
  return self->_movieURL;
}

- (NSURL)sequenceURL
{
  return self->_sequenceURL;
}

- (unint64_t)nextIndex
{
  return self->_nextIndex;
}

- (void)setNextIndex:(unint64_t)a3
{
  self->_nextIndex = a3;
}

- (AVAssetReader)assetReader
{
  return self->_assetReader;
}

- (void)setAssetReader:(id)a3
{
}

- (AVAssetReaderTrackOutput)disparityTrackOutput
{
  return self->_disparityTrackOutput;
}

- (void)setDisparityTrackOutput:(id)a3
{
}

- (NSString)filenameFormat
{
  return self->_filenameFormat;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (float)framesPerSecond
{
  return self->_framesPerSecond;
}

- (BOOL)isVector3Format
{
  return self->_isVector3Format;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filenameFormat, 0);
  objc_storeStrong((id *)&self->_disparityTrackOutput, 0);
  objc_storeStrong((id *)&self->_assetReader, 0);
  objc_storeStrong((id *)&self->_sequenceURL, 0);
  objc_storeStrong((id *)&self->_movieURL, 0);

  objc_storeStrong((id *)&self->_dataURL, 0);
}

- (void)_startReadingSequenceWithError:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "error reading %@: %@", (uint8_t *)&v3, 0x16u);
}

- (void)_frameInstance
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = (objc_class *)[(id)objc_opt_class() frameClass];
  uint64_t v4 = NSStringFromClass(v3);
  __int16 v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  int v7 = 138412546;
  CMTime v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "frameClass %@ is not a subclass of %@", (uint8_t *)&v7, 0x16u);
}

- (void)copyNextFrame
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Be sure to call startReadingWithError: before decoding frames.", v1, 2u);
}

@end