@interface VUIMediaEntityAssetControllerState
- (BOOL)allowsCellular;
- (BOOL)downloadFailedDueToError;
- (BOOL)isDownloadInProgress;
- (BOOL)isEqual:(id)a3;
- (BOOL)performsKeyFetchOnly;
- (BOOL)renewsOfflineKeysAutomatically;
- (BOOL)supportsCancellation;
- (BOOL)supportsPausing;
- (NSDate)availabilityEndDate;
- (NSDate)downloadExpirationDate;
- (VUIMediaEntityAssetControllerState)init;
- (double)downloadProgress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)bytesDownloaded;
- (unint64_t)bytesToDownload;
- (unint64_t)hash;
- (unint64_t)status;
- (void)setAllowsCellular:(BOOL)a3;
- (void)setAvailabilityEndDate:(id)a3;
- (void)setBytesDownloaded:(unint64_t)a3;
- (void)setBytesToDownload:(unint64_t)a3;
- (void)setDownloadExpirationDate:(id)a3;
- (void)setDownloadFailedDueToError:(BOOL)a3;
- (void)setDownloadProgress:(double)a3;
- (void)setPerformsKeyFetchOnly:(BOOL)a3;
- (void)setRenewsOfflineKeysAutomatically:(BOOL)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setSupportsCancellation:(BOOL)a3;
- (void)setSupportsPausing:(BOOL)a3;
@end

@implementation VUIMediaEntityAssetControllerState

- (void)setSupportsPausing:(BOOL)a3
{
  self->_supportsPausing = a3;
}

- (void)setSupportsCancellation:(BOOL)a3
{
  self->_supportsCancellation = a3;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (void)setDownloadProgress:(double)a3
{
  self->_downloadProgress = a3;
}

- (VUIMediaEntityAssetControllerState)init
{
  v3.receiver = self;
  v3.super_class = (Class)VUIMediaEntityAssetControllerState;
  result = [(VUIMediaEntityAssetControllerState *)&v3 init];
  if (result)
  {
    result->_status = 0;
    result->_downloadProgress = -1.0;
  }
  return result;
}

- (BOOL)renewsOfflineKeysAutomatically
{
  return self->_renewsOfflineKeysAutomatically;
}

- (BOOL)downloadFailedDueToError
{
  return self->_downloadFailedDueToError;
}

- (NSDate)downloadExpirationDate
{
  return self->_downloadExpirationDate;
}

- (NSDate)availabilityEndDate
{
  return self->_availabilityEndDate;
}

- (unint64_t)status
{
  return self->_status;
}

- (double)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setRenewsOfflineKeysAutomatically:(BOOL)a3
{
  self->_renewsOfflineKeysAutomatically = a3;
}

- (void)setDownloadFailedDueToError:(BOOL)a3
{
  self->_downloadFailedDueToError = a3;
}

- (void)setDownloadExpirationDate:(id)a3
{
}

- (void)setAvailabilityEndDate:(id)a3
{
}

- (void)setAllowsCellular:(BOOL)a3
{
  self->_allowsCellular = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityEndDate, 0);
  objc_storeStrong((id *)&self->_downloadExpirationDate, 0);
}

- (BOOL)isDownloadInProgress
{
  return [(VUIMediaEntityAssetControllerState *)self status] - 1 < 3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(VUIMediaEntityAssetControllerState);
  v4->_status = self->_status;
  v4->_downloadProgress = self->_downloadProgress;
  v4->_bytesDownloaded = self->_bytesDownloaded;
  v4->_bytesToDownload = self->_bytesToDownload;
  v4->_supportsCancellation = self->_supportsCancellation;
  v4->_supportsPausing = self->_supportsPausing;
  v4->_renewsOfflineKeysAutomatically = self->_renewsOfflineKeysAutomatically;
  objc_storeStrong((id *)&v4->_downloadExpirationDate, self->_downloadExpirationDate);
  objc_storeStrong((id *)&v4->_availabilityEndDate, self->_availabilityEndDate);
  v4->_allowsCellular = self->_allowsCellular;
  v4->_downloadFailedDueToError = self->_downloadFailedDueToError;
  return v4;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VUIMediaEntityAssetControllerState *)self status];
  [(VUIMediaEntityAssetControllerState *)self downloadProgress];
  unint64_t v5 = (unint64_t)(v4 * 100.0);
  unint64_t v6 = [(VUIMediaEntityAssetControllerState *)self bytesToDownload];
  unint64_t v7 = v3 ^ (4 * v6) ^ (2 * v5) ^ (8 * [(VUIMediaEntityAssetControllerState *)self bytesDownloaded]);
  [(VUIMediaEntityAssetControllerState *)self supportsCancellation];
  [(VUIMediaEntityAssetControllerState *)self supportsPausing];
  [(VUIMediaEntityAssetControllerState *)self renewsOfflineKeysAutomatically];
  BOOL v8 = [(VUIMediaEntityAssetControllerState *)self allowsCellular];
  uint64_t v9 = 128;
  if (!v8) {
    uint64_t v9 = 0;
  }
  unint64_t v10 = v9 & v7;
  BOOL v11 = [(VUIMediaEntityAssetControllerState *)self downloadFailedDueToError];
  uint64_t v12 = 256;
  if (!v11) {
    uint64_t v12 = 0;
  }
  uint64_t v13 = v10 | v12;
  v14 = [(VUIMediaEntityAssetControllerState *)self downloadExpirationDate];
  uint64_t v15 = [v14 hash];

  v16 = [(VUIMediaEntityAssetControllerState *)self availabilityEndDate];
  unint64_t v17 = v15 ^ [v16 hash] ^ v13;

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (VUIMediaEntityAssetControllerState *)a3;
  unint64_t v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v21) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v6 = v5;
    uint64_t v7 = [(VUIMediaEntityAssetControllerState *)self downloadExpirationDate];
    uint64_t v8 = [(VUIMediaEntityAssetControllerState *)v6 downloadExpirationDate];
    uint64_t v9 = [(VUIMediaEntityAssetControllerState *)self availabilityEndDate];
    uint64_t v10 = [(VUIMediaEntityAssetControllerState *)v6 availabilityEndDate];
    unint64_t v11 = [(VUIMediaEntityAssetControllerState *)self status];
    if (v11 != [(VUIMediaEntityAssetControllerState *)v6 status]) {
      goto LABEL_12;
    }
    [(VUIMediaEntityAssetControllerState *)self downloadProgress];
    double v13 = v12;
    [(VUIMediaEntityAssetControllerState *)v6 downloadProgress];
    if (v13 != v14) {
      goto LABEL_12;
    }
    unint64_t v15 = [(VUIMediaEntityAssetControllerState *)self bytesToDownload];
    if (v15 != [(VUIMediaEntityAssetControllerState *)v6 bytesToDownload]) {
      goto LABEL_12;
    }
    unint64_t v16 = [(VUIMediaEntityAssetControllerState *)self bytesDownloaded];
    if (v16 != [(VUIMediaEntityAssetControllerState *)v6 bytesDownloaded]) {
      goto LABEL_12;
    }
    BOOL v17 = [(VUIMediaEntityAssetControllerState *)self supportsCancellation];
    if (v17 != [(VUIMediaEntityAssetControllerState *)v6 supportsCancellation]) {
      goto LABEL_12;
    }
    BOOL v18 = [(VUIMediaEntityAssetControllerState *)self supportsPausing];
    if (v18 != [(VUIMediaEntityAssetControllerState *)v6 supportsPausing]) {
      goto LABEL_12;
    }
    BOOL v19 = [(VUIMediaEntityAssetControllerState *)self renewsOfflineKeysAutomatically];
    if (v19 != [(VUIMediaEntityAssetControllerState *)v6 renewsOfflineKeysAutomatically])goto LABEL_12; {
    BOOL v20 = [(VUIMediaEntityAssetControllerState *)self allowsCellular];
    }
    if (v20 != [(VUIMediaEntityAssetControllerState *)v6 allowsCellular]
      || v7 | v8 && ![(id)v7 isEqualToDate:v8])
    {
      goto LABEL_12;
    }
    if (!(v9 | v10) || [(id)v9 isEqualToDate:v10])
    {
      BOOL v23 = [(VUIMediaEntityAssetControllerState *)self downloadFailedDueToError];
      BOOL v21 = v23 ^ [(VUIMediaEntityAssetControllerState *)v6 downloadFailedDueToError] ^ 1;
    }
    else
    {
LABEL_12:
      LOBYTE(v21) = 0;
    }
  }
  else
  {
    LOBYTE(v21) = 0;
  }

  return v21;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v47.receiver = self;
  v47.super_class = (Class)VUIMediaEntityAssetControllerState;
  double v4 = [(VUIMediaEntityAssetControllerState *)&v47 description];
  [v3 addObject:v4];

  unint64_t v5 = NSString;
  unint64_t v6 = [(VUIMediaEntityAssetControllerState *)self status];
  if (v6 > 5) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = off_1E6DF5830[v6];
  }
  uint64_t v8 = [v5 stringWithFormat:@"%@=%@", @"status", v7];
  [v3 addObject:v8];

  uint64_t v9 = NSString;
  uint64_t v10 = (void *)MEMORY[0x1E4F28ED0];
  [(VUIMediaEntityAssetControllerState *)self downloadProgress];
  unint64_t v11 = objc_msgSend(v10, "numberWithDouble:");
  double v12 = [v9 stringWithFormat:@"%@=%@", @"downloadProgress", v11];
  [v3 addObject:v12];

  double v13 = NSString;
  double v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[VUIMediaEntityAssetControllerState bytesToDownload](self, "bytesToDownload"));
  unint64_t v15 = [v13 stringWithFormat:@"%@=%@", @"bytesToDownload", v14];
  [v3 addObject:v15];

  unint64_t v16 = NSString;
  BOOL v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[VUIMediaEntityAssetControllerState bytesDownloaded](self, "bytesDownloaded"));
  BOOL v18 = [v16 stringWithFormat:@"%@=%@", @"bytesDownloaded", v17];
  [v3 addObject:v18];

  BOOL v19 = NSString;
  [(VUIMediaEntityAssetControllerState *)self isDownloadInProgress];
  BOOL v20 = VUIBoolLogString();
  BOOL v21 = [v19 stringWithFormat:@"%@=%@", @"isDownloadInProgress", v20];
  [v3 addObject:v21];

  v22 = NSString;
  [(VUIMediaEntityAssetControllerState *)self supportsCancellation];
  BOOL v23 = VUIBoolLogString();
  v24 = [v22 stringWithFormat:@"%@=%@", @"supportsCancellation", v23];
  [v3 addObject:v24];

  v25 = NSString;
  [(VUIMediaEntityAssetControllerState *)self supportsPausing];
  v26 = VUIBoolLogString();
  v27 = [v25 stringWithFormat:@"%@=%@", @"supportsPausing", v26];
  [v3 addObject:v27];

  v28 = NSString;
  [(VUIMediaEntityAssetControllerState *)self renewsOfflineKeysAutomatically];
  v29 = VUIBoolLogString();
  v30 = [v28 stringWithFormat:@"%@=%@", @"renewsOfflineKeysAutomatically", v29];
  [v3 addObject:v30];

  v31 = NSString;
  [(VUIMediaEntityAssetControllerState *)self allowsCellular];
  v32 = VUIBoolLogString();
  v33 = [v31 stringWithFormat:@"%@=%@", @"allowsCellular", v32];
  [v3 addObject:v33];

  v34 = NSString;
  v35 = [(VUIMediaEntityAssetControllerState *)self downloadExpirationDate];
  v36 = [v34 stringWithFormat:@"%@=%@", @"downloadExpirationDate", v35];
  [v3 addObject:v36];

  v37 = NSString;
  v38 = [(VUIMediaEntityAssetControllerState *)self availabilityEndDate];
  v39 = [v37 stringWithFormat:@"%@=%@", @"availabilityEndDate", v38];
  [v3 addObject:v39];

  v40 = NSString;
  [(VUIMediaEntityAssetControllerState *)self downloadFailedDueToError];
  v41 = VUIBoolLogString();
  v42 = [v40 stringWithFormat:@"%@=%@", @"downloadFailedDueToError", v41];
  [v3 addObject:v42];

  v43 = NSString;
  v44 = [v3 componentsJoinedByString:@", "];
  v45 = [v43 stringWithFormat:@"<%@>", v44];

  return v45;
}

- (BOOL)supportsCancellation
{
  return self->_supportsCancellation;
}

- (BOOL)supportsPausing
{
  return self->_supportsPausing;
}

- (BOOL)performsKeyFetchOnly
{
  return self->_performsKeyFetchOnly;
}

- (void)setPerformsKeyFetchOnly:(BOOL)a3
{
  self->_performsKeyFetchOnly = a3;
}

- (BOOL)allowsCellular
{
  return self->_allowsCellular;
}

- (unint64_t)bytesToDownload
{
  return self->_bytesToDownload;
}

- (void)setBytesToDownload:(unint64_t)a3
{
  self->_bytesToDownload = a3;
}

- (unint64_t)bytesDownloaded
{
  return self->_bytesDownloaded;
}

- (void)setBytesDownloaded:(unint64_t)a3
{
  self->_bytesDownloaded = a3;
}

@end