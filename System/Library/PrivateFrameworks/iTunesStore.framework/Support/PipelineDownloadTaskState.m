@interface PipelineDownloadTaskState
- (BOOL)isEqual:(id)a3;
- (BOOL)isLegacyClient;
- (BOOL)requiresDownloadHandler;
- (DownloadHandle)downloadHandle;
- (NSString)bundleIdentifier;
- (NSString)kind;
- (PipelineDownloadTaskState)initWithPrepareDownloadResponse:(id)a3;
- (double)transferProgressFraction;
- (id)_overallProgress;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)automaticType;
- (int64_t)downloadIdentifier;
- (int64_t)mediaAssetIdentifier;
- (int64_t)transferBytesExpected;
- (int64_t)transferBytesWritten;
- (unint64_t)hash;
- (unint64_t)transferResumptionOffset;
- (void)setAutomaticType:(int64_t)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setDownloadHandle:(id)a3;
- (void)setDownloadIdentifier:(int64_t)a3;
- (void)setFinishProgress:(double)a3;
- (void)setKind:(id)a3;
- (void)setLegacyClient:(BOOL)a3;
- (void)setMediaAssetIdentifier:(int64_t)a3;
- (void)setRequiresDownloadHandler:(BOOL)a3;
- (void)setTransferBytesExpected:(int64_t)a3;
- (void)setTransferBytesWritten:(int64_t)a3;
- (void)setTransferProgress:(double)a3;
- (void)setTransferProgressFraction:(double)a3;
- (void)setTransferProgressWithBytesWritten:(int64_t)a3 totalBytesExpected:(int64_t)a4;
- (void)setTransferResumptionOffset:(unint64_t)a3;
@end

@implementation PipelineDownloadTaskState

- (PipelineDownloadTaskState)initWithPrepareDownloadResponse:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PipelineDownloadTaskState;
  v5 = [(PipelineDownloadTaskState *)&v10 init];
  if (v5)
  {
    -[PipelineDownloadTaskState setAutomaticType:](v5, "setAutomaticType:", [v4 automaticType]);
    v6 = [v4 bundleIdentifier];
    [(PipelineDownloadTaskState *)v5 setBundleIdentifier:v6];

    v7 = [v4 kind];
    [(PipelineDownloadTaskState *)v5 setKind:v7];

    v8 = [v4 downloadHandle];
    [(PipelineDownloadTaskState *)v5 setDownloadHandle:v8];

    -[PipelineDownloadTaskState setDownloadIdentifier:](v5, "setDownloadIdentifier:", [v4 downloadIdentifier]);
    -[PipelineDownloadTaskState setLegacyClient:](v5, "setLegacyClient:", [v4 isLegacyClient]);
    -[PipelineDownloadTaskState setMediaAssetIdentifier:](v5, "setMediaAssetIdentifier:", [v4 mediaAssetIdentifier]);
    -[PipelineDownloadTaskState setRequiresDownloadHandler:](v5, "setRequiresDownloadHandler:", [v4 requiresDownloadHandler]);
    [v4 transferProgressFraction];
    -[PipelineDownloadTaskState setTransferProgressFraction:](v5, "setTransferProgressFraction:");
  }

  return v5;
}

- (void)setFinishProgress:(double)a3
{
  double v3 = self->_transferProgressFraction + (1.0 - self->_transferProgressFraction) * a3;
  id v4 = [(PipelineDownloadTaskState *)self _overallProgress];
  objc_msgSend(v4, "setCurrentValue:", (uint64_t)(v3 * (double)(uint64_t)objc_msgSend(v4, "maxValue")));
}

- (void)setTransferProgress:(double)a3
{
  double v3 = self->_transferProgressFraction * a3;
  id v4 = [(PipelineDownloadTaskState *)self _overallProgress];
  objc_msgSend(v4, "setCurrentValue:", (uint64_t)(v3 * (double)(uint64_t)objc_msgSend(v4, "maxValue")));
}

- (void)setTransferProgressWithBytesWritten:(int64_t)a3 totalBytesExpected:(int64_t)a4
{
  self->_transferBytesExpected = a4;
  self->_transferBytesWritten = a3;
  if (a4 >= 1) {
    [(PipelineDownloadTaskState *)self setTransferProgress:(double)a3 / (double)a4];
  }
}

- (unint64_t)hash
{
  return self->_downloadIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = [(PipelineDownloadTaskState *)self downloadIdentifier];
    BOOL v6 = v7 == [v4 downloadIdentifier];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_automaticType;
  id v6 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  id v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(DownloadHandle *)self->_downloadHandle copyWithZone:a3];
  v9 = (void *)v5[14];
  v5[14] = v8;

  v5[2] = self->_downloadIdentifier;
  id v10 = [(NSString *)self->_kind copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  v5[6] = self->_mediaAssetIdentifier;
  id v12 = [(SSOperationProgress *)self->_overallProgress copyWithZone:a3];
  v13 = (void *)v5[7];
  v5[7] = v12;

  *((unsigned char *)v5 + 64) = self->_requiresDownloadHandler;
  v5[9] = self->_storeItemIdentifier;
  v5[10] = self->_transferBytesExpected;
  v5[11] = self->_transferBytesWritten;
  v5[12] = *(void *)&self->_transferProgressFraction;
  return v5;
}

- (id)_overallProgress
{
  overallProgress = self->_overallProgress;
  if (!overallProgress)
  {
    id v4 = (SSOperationProgress *)objc_alloc_init((Class)SSOperationProgress);
    uint64_t v5 = self->_overallProgress;
    self->_overallProgress = v4;

    [(SSOperationProgress *)self->_overallProgress setMaxValue:1000000];
    overallProgress = self->_overallProgress;
  }

  return overallProgress;
}

- (int64_t)automaticType
{
  return self->_automaticType;
}

- (void)setAutomaticType:(int64_t)a3
{
  self->_automaticType = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (int64_t)downloadIdentifier
{
  return self->_downloadIdentifier;
}

- (void)setDownloadIdentifier:(int64_t)a3
{
  self->_downloadIdentifier = a3;
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
}

- (BOOL)isLegacyClient
{
  return self->legacyClient;
}

- (void)setLegacyClient:(BOOL)a3
{
  self->legacyClient = a3;
}

- (int64_t)mediaAssetIdentifier
{
  return self->_mediaAssetIdentifier;
}

- (void)setMediaAssetIdentifier:(int64_t)a3
{
  self->_mediaAssetIdentifier = a3;
}

- (BOOL)requiresDownloadHandler
{
  return self->_requiresDownloadHandler;
}

- (void)setRequiresDownloadHandler:(BOOL)a3
{
  self->_requiresDownloadHandler = a3;
}

- (int64_t)transferBytesExpected
{
  return self->_transferBytesExpected;
}

- (void)setTransferBytesExpected:(int64_t)a3
{
  self->_transferBytesExpected = a3;
}

- (int64_t)transferBytesWritten
{
  return self->_transferBytesWritten;
}

- (void)setTransferBytesWritten:(int64_t)a3
{
  self->_transferBytesWritten = a3;
}

- (double)transferProgressFraction
{
  return self->_transferProgressFraction;
}

- (void)setTransferProgressFraction:(double)a3
{
  self->_transferProgressFraction = a3;
}

- (DownloadHandle)downloadHandle
{
  return self->_downloadHandle;
}

- (void)setDownloadHandle:(id)a3
{
}

- (unint64_t)transferResumptionOffset
{
  return self->_transferResumptionOffset;
}

- (void)setTransferResumptionOffset:(unint64_t)a3
{
  self->_transferResumptionOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadHandle, 0);
  objc_storeStrong((id *)&self->_overallProgress, 0);
  objc_storeStrong((id *)&self->_kind, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end