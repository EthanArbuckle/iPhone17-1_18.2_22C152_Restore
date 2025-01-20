@interface SUDownload
+ (BOOL)supportsSecureCoding;
- (BOOL)allowCellularDownload;
- (BOOL)isPromoted;
- (BOOL)isValidDownload;
- (SUDescriptor)descriptor;
- (SUDownload)init;
- (SUDownload)initWithCoder:(id)a3;
- (SUDownloadMetadata)metadata;
- (SUDownloadOptions)downloadOptions;
- (SUOperationProgress)progress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)totalSpaceConsumed;
- (void)encodeWithCoder:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setDownloadOptions:(id)a3;
- (void)setProgress:(id)a3;
- (void)setPromoted:(BOOL)a3;
@end

@implementation SUDownload

- (SUDownload)init
{
  v8.receiver = self;
  v8.super_class = (Class)SUDownload;
  v2 = [(SUDownload *)&v8 init];
  v3 = v2;
  if (v2)
  {
    progress = v2->_progress;
    v2->_progress = 0;

    descriptor = v3->_descriptor;
    v3->_descriptor = 0;

    downloadOptions = v3->_downloadOptions;
    v3->_downloadOptions = 0;

    v3->_promoted = 0;
  }
  return v3;
}

- (SUDownloadMetadata)metadata
{
  v3 = objc_alloc_init(SUMutableDownloadMetadata);
  [(SUDownloadMetadata *)v3 setAutoDownload:[(SUDownloadOptions *)self->_downloadOptions isAutoDownload]];
  [(SUDownloadMetadata *)v3 setDownloadOnly:[(SUDownloadOptions *)self->_downloadOptions isDownloadOnly]];
  [(SUDownloadMetadata *)v3 setDownloadFeeAgreementStatus:[(SUDownloadOptions *)self->_downloadOptions downloadFeeAgreementStatus]];
  [(SUDownloadMetadata *)v3 setTermsAndConditionsAgreementStatus:[(SUDownloadOptions *)self->_downloadOptions termsAndConditionsAgreementStatus]];
  v4 = [(SUDownloadOptions *)self->_downloadOptions activeDownloadPolicy];
  [(SUMutableDownloadMetadata *)v3 applyDownloadPolicy:v4];

  return (SUDownloadMetadata *)v3;
}

- (SUDownload)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SUDownload *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"progress"];
    [(SUDownload *)v5 setProgress:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"descriptor"];
    [(SUDownload *)v5 setDescriptor:v7];

    objc_super v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downloadOptions"];
    [(SUDownload *)v5 setDownloadOptions:v8];

    -[SUDownload setPromoted:](v5, "setPromoted:", [v4 decodeBoolForKey:@"promoted"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(SUDownload *)self progress];
  [v7 encodeObject:v4 forKey:@"progress"];

  v5 = [(SUDownload *)self descriptor];
  [v7 encodeObject:v5 forKey:@"descriptor"];

  v6 = [(SUDownload *)self downloadOptions];
  [v7 encodeObject:v6 forKey:@"downloadOptions"];

  objc_msgSend(v7, "encodeBool:forKey:", -[SUDownload isPromoted](self, "isPromoted"), @"promoted");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)[(SUOperationProgress *)self->_progress copy];
  [v4 setProgress:v5];

  v6 = (void *)[(SUDescriptor *)self->_descriptor copy];
  [v4 setDescriptor:v6];

  id v7 = (void *)[(SUDownloadOptions *)self->_downloadOptions copy];
  [v4 setDownloadOptions:v7];

  [v4 setPromoted:self->_promoted];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)allowCellularDownload
{
  return [(SUDownloadOptions *)self->_downloadOptions isEnabledForCellular];
}

- (unint64_t)totalSpaceConsumed
{
  if (self->_descriptor)
  {
    v3 = [(SUOperationProgress *)self->_progress phase];
    descriptor = self->_descriptor;
    if (self->_progress) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      uint64_t v6 = [(SUDescriptor *)descriptor totalRequiredFreeSpace];
    }
    else
    {
      BOOL v8 = [(SUDescriptor *)descriptor _isStreamingZipCapable];
      if ([v3 isEqualToString:@"SUDownloadPhasePreparingForInstallation"])
      {
        unint64_t v9 = [(SUDescriptor *)self->_descriptor _unarchiveSize];
        unint64_t v10 = [(SUDescriptor *)self->_descriptor _msuPrepareSize];
LABEL_12:
        float v11 = (float)v10;
        [(SUOperationProgress *)self->_progress percentComplete];
        float v13 = fmaxf(fminf(v12, 1.0), 0.0);
        float v14 = (float)v9;
LABEL_13:
        unint64_t v7 = (unint64_t)(float)(v14 + (float)(v11 * v13));
        goto LABEL_14;
      }
      if ([v3 isEqualToString:@"SUDownloadPhaseExtracting"])
      {
        v16 = self->_descriptor;
        if (!v8)
        {
          unint64_t v9 = [(SUDescriptor *)v16 downloadSize];
          unint64_t v10 = [(SUDescriptor *)self->_descriptor _unarchiveSize];
          goto LABEL_12;
        }
      }
      else
      {
        if (![v3 isEqualToString:@"SUDownloadPhaseVerifying"])
        {
          if (!SUDownloadPhaseIsFetchingUpdate(v3, v17))
          {
            unint64_t v7 = 0;
            goto LABEL_14;
          }
          v18 = self->_descriptor;
          if (v8) {
            unint64_t v19 = [(SUDescriptor *)v18 _unarchiveSize];
          }
          else {
            unint64_t v19 = [(SUDescriptor *)v18 downloadSize];
          }
          float v11 = (float)v19;
          [(SUOperationProgress *)self->_progress percentComplete];
          float v14 = 0.0;
          float v13 = fmaxf(fminf(v20, 1.0), 0.0);
          goto LABEL_13;
        }
        v16 = self->_descriptor;
        if (!v8)
        {
          uint64_t v6 = [(SUDescriptor *)v16 downloadSize];
          goto LABEL_8;
        }
      }
      uint64_t v6 = [(SUDescriptor *)v16 _unarchiveSize];
    }
LABEL_8:
    unint64_t v7 = v6;
LABEL_14:

    return v7;
  }
  return 0;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SUDownload *)self descriptor];
  BOOL v5 = [(SUDownload *)self downloadOptions];
  uint64_t v6 = [(SUDownload *)self progress];
  BOOL v7 = [(SUDownload *)self isPromoted];
  BOOL v8 = @"NO";
  if (v7) {
    BOOL v8 = @"YES";
  }
  unint64_t v9 = [v3 stringWithFormat:@"\n            Descriptor: %@\n            DownloadOptions: %@\n            Progress: %@\n            isPromoted: %@", v4, v5, v6, v8];

  return v9;
}

- (BOOL)isValidDownload
{
  descriptor = self->_descriptor;
  return descriptor
      && self->_downloadOptions
      && self->_progress
      && [(SUDescriptor *)descriptor isValidDescriptor];
}

- (SUOperationProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (SUDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (SUDownloadOptions)downloadOptions
{
  return self->_downloadOptions;
}

- (void)setDownloadOptions:(id)a3
{
}

- (BOOL)isPromoted
{
  return self->_promoted;
}

- (void)setPromoted:(BOOL)a3
{
  self->_promoted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadOptions, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end