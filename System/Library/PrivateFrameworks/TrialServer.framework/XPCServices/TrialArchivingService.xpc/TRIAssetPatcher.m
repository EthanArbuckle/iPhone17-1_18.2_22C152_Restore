@interface TRIAssetPatcher
- ($A5A652246548B43F8BC05201A1C72A70)applyPatchWithFilename:(id)a3 toSrcDir:(id)a4 writingToEmptyDestDir:(id)a5 postPatchCompression:(id)a6 error:(id *)a7;
- (TRIAssetPatcher)initWithShouldDefer:(id)a3;
@end

@implementation TRIAssetPatcher

- (TRIAssetPatcher)initWithShouldDefer:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIAssetPatcher;
  v5 = [(TRIAssetPatcher *)&v9 init];
  if (v5)
  {
    id v6 = objc_retainBlock(v4);
    id shouldDefer = v5->_shouldDefer;
    v5->_id shouldDefer = v6;
  }
  return v5;
}

- ($A5A652246548B43F8BC05201A1C72A70)applyPatchWithFilename:(id)a3 toSrcDir:(id)a4 writingToEmptyDestDir:(id)a5 postPatchCompression:(id)a6 error:(id *)a7
{
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  notify_post("com.apple.trial.TrialArchivingService.test.beginPatch");
  id v15 = v13;
  [v15 fileSystemRepresentation];

  id v16 = v12;
  [v16 fileSystemRepresentation];
  id v17 = v14;
  [v17 fileSystemRepresentation];

  ParallelCompressionEnterThreadErrorContext();
  int v18 = DirectoryPatch();
  ParallelCompressionLeaveThreadErrorContext();
  if (a7 && v18)
  {
    id v19 = 0;
    unsigned __int8 v20 = 0;
    v21 = *a7;
    *a7 = v19;
LABEL_7:

    goto LABEL_8;
  }
  unsigned __int8 v20 = v18 == 0;
  if (!v18 && a6.var0 == 1)
  {
    notify_post("com.apple.trial.TrialArchivingService.test.beginCompress");
    v21 = objc_opt_new();
    unsigned __int8 v20 = [v21 inPlaceCompressDirectory:v16 shouldDefer:self->_shouldDefer];
    goto LABEL_7;
  }
LABEL_8:

  return ($A5A652246548B43F8BC05201A1C72A70)v20;
}

- (void).cxx_destruct
{
}

@end