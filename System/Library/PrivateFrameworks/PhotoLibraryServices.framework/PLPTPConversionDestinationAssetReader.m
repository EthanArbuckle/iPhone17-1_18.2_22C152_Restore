@interface PLPTPConversionDestinationAssetReader
- (PHMediaFormatConversionDestination)destination;
- (PLPTPConversionDestinationAssetReader)initWithDestination:(id)a3;
- (id)dataSourcePathForDataRange:(_NSRange)a3 error:(id *)a4;
- (id)path;
- (void)setDestination:(id)a3;
@end

@implementation PLPTPConversionDestinationAssetReader

- (void).cxx_destruct
{
}

- (void)setDestination:(id)a3
{
}

- (PHMediaFormatConversionDestination)destination
{
  return (PHMediaFormatConversionDestination *)objc_getProperty(self, a2, 32, 1);
}

- (id)path
{
  v4 = [(PLPTPConversionDestinationAssetReader *)self destination];
  int v5 = [v4 usesSinglePassVideoConversion];

  if (v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = NSStringFromSelector(a2);
    [v10 handleFailureInMethod:a2, self, @"PLPTPdFormatConversionManager.m", 77, @"Call to method %@ is incompatible with a wrapped single pass video conversion destination", v11 object file lineNumber description];
  }
  v6 = [(PLPTPConversionDestinationAssetReader *)self destination];
  v7 = [v6 fileURL];
  v8 = [v7 path];

  return v8;
}

- (id)dataSourcePathForDataRange:(_NSRange)a3 error:(id *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  *(void *)&v27[13] = *MEMORY[0x1E4F143B8];
  v8 = [(PLPTPConversionDestinationAssetReader *)self destination];
  int v9 = [v8 usesSinglePassVideoConversion];

  if (!v9) {
    goto LABEL_8;
  }
  v10 = PLPTPGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v29.NSUInteger location = location;
    v29.NSUInteger length = length;
    v11 = NSStringFromRange(v29);
    *(_DWORD *)buf = 138412546;
    id v25 = v11;
    __int16 v26 = 2048;
    *(void *)v27 = location + length;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "Begin wait for data availability of range %@ (= file size %lu)", buf, 0x16u);
  }
  __uint64_t v12 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v13 = [(PLPTPConversionDestinationAssetReader *)self destination];
  id v23 = 0;
  int v14 = objc_msgSend(v13, "waitForAvailabilityOfRange:timeout:error:", location, length, dispatch_time(0, 10000000000), &v23);
  id v15 = v23;

  __uint64_t v16 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v17 = PLPTPGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v30.NSUInteger location = location;
    v30.NSUInteger length = length;
    v18 = NSStringFromRange(v30);
    *(_DWORD *)buf = 138412802;
    id v25 = v18;
    __int16 v26 = 1024;
    *(_DWORD *)v27 = v14;
    v27[2] = 2048;
    *(double *)&v27[3] = (double)(v16 - v12) / 1000000000.0;
    _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEBUG, "End wait for data availability of range %@: %d (%.3fs)", buf, 0x1Cu);
  }
  if (v14)
  {

LABEL_8:
    id v15 = [(PLPTPConversionDestinationAssetReader *)self destination];
    v19 = [v15 fileURL];
    v20 = [v19 path];

    goto LABEL_9;
  }
  v22 = PLPTPGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v15;
    _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Wait for data availability failed %@", buf, 0xCu);
  }

  if (a4)
  {
    id v15 = v15;
    v20 = 0;
    *a4 = v15;
  }
  else
  {
    v20 = 0;
  }
LABEL_9:

  return v20;
}

- (PLPTPConversionDestinationAssetReader)initWithDestination:(id)a3
{
  id v6 = a3;
  v7 = [v6 fileURL];
  v8 = [v7 path];

  if (!v8)
  {
    __uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PLPTPdFormatConversionManager.m", 44, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)PLPTPConversionDestinationAssetReader;
  int v9 = [(PLPTPAssetReader *)&v13 initWithPath:v8];
  v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_destination, a3);
  }

  return v10;
}

@end