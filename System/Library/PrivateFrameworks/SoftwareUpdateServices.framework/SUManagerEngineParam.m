@interface SUManagerEngineParam
- (BOOL)isManaged;
- (BOOL)skipDocAssetsPurge;
- (NSError)error;
- (NSString)scanUUID;
- (SUCorePolicy)scanPolicy;
- (SUCoreProgress)progress;
- (SUCoreRollback)rollback;
- (SUInstallOptions)installOptions;
- (SUManagerEngineDownloadDescriptor)downloadDescriptor;
- (SUManagerEngineParam)init;
- (SUManagerEngineParam)initWithDescriptor:(id)a3 andError:(id)a4;
- (SUManagerEngineParam)initWithDownloadDescriptor:(id)a3;
- (SUManagerEngineParam)initWithError:(id)a3;
- (SUManagerEngineParam)initWithInstallOptions:(id)a3;
- (SUManagerEngineParam)initWithProgress:(id)a3;
- (SUManagerEngineParam)initWithPurgeOptions:(BOOL)a3 withError:(id)a4;
- (SUManagerEngineParam)initWithRollback:(id)a3;
- (SUManagerEngineParam)initWithRollback:(id)a3 withError:(id)a4;
- (SUManagerEngineParam)initWithRollbackOptions:(id)a3;
- (SUManagerEngineParam)initWithScanPolicy:(id)a3 scanUUID:(id)a4 isManaged:(BOOL)a5;
- (SURollbackOptions)rollbackOptions;
- (id)_descriptionBlank;
- (id)_descriptionDownloadDescriptor;
- (id)_descriptionError;
- (id)_descriptionErrorWithDescriptor;
- (id)_descriptionInstallOptions;
- (id)_descriptionProgress;
- (id)_descriptionPurge;
- (id)_descriptionRollback;
- (id)_descriptionRollbackOptions;
- (id)_descriptionScanPolicy;
- (id)_descriptionUnknown;
- (id)description;
- (int64_t)paramType;
@end

@implementation SUManagerEngineParam

- (SUManagerEngineParam)init
{
  v13.receiver = self;
  v13.super_class = (Class)SUManagerEngineParam;
  v2 = [(SUManagerEngineParam *)&v13 init];
  v3 = v2;
  if (v2)
  {
    scanPolicy = v2->_scanPolicy;
    v2->_paramType = 0;
    v2->_scanPolicy = 0;

    scanUUID = v3->_scanUUID;
    v3->_scanUUID = 0;

    v3->_isManaged = 0;
    downloadDescriptor = v3->_downloadDescriptor;
    v3->_downloadDescriptor = 0;

    installOptions = v3->_installOptions;
    v3->_installOptions = 0;

    rollbackOptions = v3->_rollbackOptions;
    v3->_rollbackOptions = 0;

    rollback = v3->_rollback;
    v3->_rollback = 0;

    progress = v3->_progress;
    v3->_progress = 0;

    error = v3->_error;
    v3->_error = 0;

    v3->_skipDocAssetsPurge = 0;
  }
  return v3;
}

- (SUManagerEngineParam)initWithScanPolicy:(id)a3 scanUUID:(id)a4 isManaged:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = [(SUManagerEngineParam *)self init];
  v12 = v11;
  if (v11)
  {
    v11->_paramType = 1;
    objc_storeStrong((id *)&v11->_scanPolicy, a3);
    objc_storeStrong((id *)&v12->_scanUUID, a4);
    v12->_isManaged = a5;
  }

  return v12;
}

- (SUManagerEngineParam)initWithDownloadDescriptor:(id)a3
{
  id v5 = a3;
  v6 = [(SUManagerEngineParam *)self init];
  v7 = v6;
  if (v6)
  {
    v6->_paramType = 2;
    objc_storeStrong((id *)&v6->_downloadDescriptor, a3);
  }

  return v7;
}

- (SUManagerEngineParam)initWithInstallOptions:(id)a3
{
  id v5 = a3;
  v6 = [(SUManagerEngineParam *)self init];
  v7 = v6;
  if (v6)
  {
    v6->_paramType = 3;
    objc_storeStrong((id *)&v6->_installOptions, a3);
  }

  return v7;
}

- (SUManagerEngineParam)initWithRollbackOptions:(id)a3
{
  id v5 = a3;
  v6 = [(SUManagerEngineParam *)self init];
  v7 = v6;
  if (v6)
  {
    v6->_paramType = 8;
    objc_storeStrong((id *)&v6->_rollbackOptions, a3);
  }

  return v7;
}

- (SUManagerEngineParam)initWithRollback:(id)a3
{
  id v5 = a3;
  v6 = [(SUManagerEngineParam *)self init];
  v7 = v6;
  if (v6)
  {
    v6->_paramType = 7;
    objc_storeStrong((id *)&v6->_rollback, a3);
  }

  return v7;
}

- (SUManagerEngineParam)initWithRollback:(id)a3 withError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(SUManagerEngineParam *)self init];
  id v10 = v9;
  if (v9)
  {
    v9->_paramType = 7;
    objc_storeStrong((id *)&v9->_rollback, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (SUManagerEngineParam)initWithProgress:(id)a3
{
  id v5 = a3;
  v6 = [(SUManagerEngineParam *)self init];
  id v7 = v6;
  if (v6)
  {
    v6->_paramType = 4;
    objc_storeStrong((id *)&v6->_progress, a3);
  }

  return v7;
}

- (SUManagerEngineParam)initWithPurgeOptions:(BOOL)a3 withError:(id)a4
{
  id v7 = a4;
  id v8 = [(SUManagerEngineParam *)self init];
  id v9 = v8;
  if (v8)
  {
    v8->_paramType = 9;
    v8->_skipDocAssetsPurge = a3;
    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v9;
}

- (SUManagerEngineParam)initWithError:(id)a3
{
  id v5 = a3;
  v6 = [(SUManagerEngineParam *)self init];
  id v7 = v6;
  if (v6)
  {
    v6->_paramType = 5;
    objc_storeStrong((id *)&v6->_error, a3);
  }

  return v7;
}

- (SUManagerEngineParam)initWithDescriptor:(id)a3 andError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(SUManagerEngineParam *)self init];
  id v10 = v9;
  if (v9)
  {
    v9->_paramType = 6;
    objc_storeStrong((id *)&v9->_downloadDescriptor, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (id)description
{
  switch([(SUManagerEngineParam *)self paramType])
  {
    case 0:
      v3 = [(SUManagerEngineParam *)self _descriptionBlank];
      break;
    case 1:
      v3 = [(SUManagerEngineParam *)self _descriptionScanPolicy];
      break;
    case 2:
      v3 = [(SUManagerEngineParam *)self _descriptionDownloadDescriptor];
      break;
    case 3:
      v3 = [(SUManagerEngineParam *)self _descriptionInstallOptions];
      break;
    case 4:
      v3 = [(SUManagerEngineParam *)self _descriptionProgress];
      break;
    case 5:
      v3 = [(SUManagerEngineParam *)self _descriptionError];
      break;
    case 6:
      v3 = [(SUManagerEngineParam *)self _descriptionErrorWithDescriptor];
      break;
    case 7:
      v3 = [(SUManagerEngineParam *)self _descriptionRollback];
      break;
    case 8:
      v3 = [(SUManagerEngineParam *)self _descriptionRollbackOptions];
      break;
    case 9:
      v3 = [(SUManagerEngineParam *)self _descriptionPurge];
      break;
    default:
      v3 = [(SUManagerEngineParam *)self _descriptionUnknown];
      break;
  }
  return v3;
}

- (id)_descriptionBlank
{
  return (id)[NSString stringWithFormat:@"\n[>>>\n    paramType: Blank\n<<<]"];
}

- (id)_descriptionScanPolicy
{
  v3 = NSString;
  v4 = [(SUManagerEngineParam *)self scanPolicy];
  id v5 = [v4 summary];
  v6 = [(SUManagerEngineParam *)self scanUUID];
  BOOL v7 = [(SUManagerEngineParam *)self isManaged];
  id v8 = @"NO";
  if (v7) {
    id v8 = @"YES";
  }
  id v9 = [v3 stringWithFormat:@"\n[>>>\n     paramType: ScanPolicy\n    scanPolicy: %@\n      scanUUID: %@\n     isManaged: %@\n<<<]", v5, v6, v8];

  return v9;
}

- (id)_descriptionDownloadDescriptor
{
  v2 = NSString;
  v3 = [(SUManagerEngineParam *)self downloadDescriptor];
  v4 = [v2 stringWithFormat:@"\n[>>>\n             paramType: DownloadDescriptor\n    downloadDescriptor: %@\n<<<]", v3];

  return v4;
}

- (id)_descriptionInstallOptions
{
  v2 = NSString;
  v3 = [(SUManagerEngineParam *)self installOptions];
  v4 = [v2 stringWithFormat:@"\n[>>>\n         paramType: InstallOptions\n    installOptions: %@\n<<<]", v3];

  return v4;
}

- (id)_descriptionRollbackOptions
{
  v2 = NSString;
  v3 = [(SUManagerEngineParam *)self rollbackOptions];
  v4 = [v2 stringWithFormat:@"\n[>>>\n         paramType: RollbackOptions:\n            %@\n<<<]", v3];

  return v4;
}

- (id)_descriptionPurge
{
  v3 = NSString;
  if ([(SUManagerEngineParam *)self skipDocAssetsPurge]) {
    v4 = @"skip doc assets";
  }
  else {
    v4 = @"purge doc assets";
  }
  id v5 = [(SUManagerEngineParam *)self error];
  v6 = [v5 description];
  BOOL v7 = [v3 stringWithFormat:@"\n[>>>\n         paramType: PurgeOptions:\n            %@\n            error: %@\n<<<]", v4, v6];

  return v7;
}

- (id)_descriptionRollback
{
  v2 = NSString;
  v3 = [(SUManagerEngineParam *)self rollback];
  v4 = [v2 stringWithFormat:@"\n[>>>\n         paramType: Rollback:\n            %@\n<<<]", v3];

  return v4;
}

- (id)_descriptionProgress
{
  v2 = NSString;
  v3 = [(SUManagerEngineParam *)self progress];
  v4 = [v3 summary];
  id v5 = [v2 stringWithFormat:@"\n[>>>\n    paramType: Progress\n     progress: %@\n<<<]", v4];

  return v5;
}

- (id)_descriptionError
{
  v2 = NSString;
  v3 = [(SUManagerEngineParam *)self error];
  v4 = [v3 description];
  id v5 = [v2 stringWithFormat:@"\n[>>>\n    paramType: Error\n        error: %@\n<<<]", v4];

  return v5;
}

- (id)_descriptionErrorWithDescriptor
{
  v3 = NSString;
  v4 = [(SUManagerEngineParam *)self error];
  id v5 = [v4 description];
  v6 = [(SUManagerEngineParam *)self downloadDescriptor];
  BOOL v7 = [v6 description];
  id v8 = [v3 stringWithFormat:@"\n[>>>\n            paramType: ErrorWithDescriptor\n                error: %@\n   downloadDescriptor: %@\n<<<]", v5, v7];

  return v8;
}

- (id)_descriptionUnknown
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"\n[>>>\n    paramType: Unknown(%ld)\n<<<]", -[SUManagerEngineParam paramType](self, "paramType"));
}

- (int64_t)paramType
{
  return self->_paramType;
}

- (SUCorePolicy)scanPolicy
{
  return self->_scanPolicy;
}

- (NSString)scanUUID
{
  return self->_scanUUID;
}

- (BOOL)isManaged
{
  return self->_isManaged;
}

- (SUManagerEngineDownloadDescriptor)downloadDescriptor
{
  return self->_downloadDescriptor;
}

- (SUInstallOptions)installOptions
{
  return self->_installOptions;
}

- (SUCoreRollback)rollback
{
  return self->_rollback;
}

- (SURollbackOptions)rollbackOptions
{
  return self->_rollbackOptions;
}

- (SUCoreProgress)progress
{
  return self->_progress;
}

- (BOOL)skipDocAssetsPurge
{
  return self->_skipDocAssetsPurge;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_rollbackOptions, 0);
  objc_storeStrong((id *)&self->_rollback, 0);
  objc_storeStrong((id *)&self->_installOptions, 0);
  objc_storeStrong((id *)&self->_downloadDescriptor, 0);
  objc_storeStrong((id *)&self->_scanUUID, 0);
  objc_storeStrong((id *)&self->_scanPolicy, 0);
}

@end