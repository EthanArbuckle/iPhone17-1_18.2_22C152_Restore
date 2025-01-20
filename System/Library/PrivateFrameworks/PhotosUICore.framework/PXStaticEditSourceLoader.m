@interface PXStaticEditSourceLoader
- (NSError)error;
- (NSNumber)loadDuration;
- (NSProgress)progress;
- (NSString)contentIdentifier;
- (NSString)livePhotoPairingIdentifier;
- (PICompositionController)compositionController;
- (PICompositionController)originalCompositionController;
- (PLEditSource)editSource;
- (PXStaticEditSourceLoader)initWithEditSource:(id)a3 compositionController:(id)a4 baseVersion:(int64_t)a5 contentIdentifier:(id)a6;
- (int64_t)baseVersion;
@end

@implementation PXStaticEditSourceLoader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_livePhotoPairingIdentifier, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_originalCompositionController, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_editSource, 0);
}

- (NSString)livePhotoPairingIdentifier
{
  return self->_livePhotoPairingIdentifier;
}

- (NSString)contentIdentifier
{
  return self->_contentIdentifier;
}

- (NSError)error
{
  return self->_error;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (int64_t)baseVersion
{
  return self->_baseVersion;
}

- (PICompositionController)originalCompositionController
{
  return self->_originalCompositionController;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (PLEditSource)editSource
{
  return self->_editSource;
}

- (NSNumber)loadDuration
{
  return (NSNumber *)&unk_1F02DA270;
}

- (PXStaticEditSourceLoader)initWithEditSource:(id)a3 compositionController:(id)a4 baseVersion:(int64_t)a5 contentIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)PXStaticEditSourceLoader;
  v14 = [(PXStaticEditSourceLoader *)&v23 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_editSource, a3);
    uint64_t v16 = [v12 copy];
    compositionController = v15->_compositionController;
    v15->_compositionController = (PICompositionController *)v16;

    v15->_baseVersion = a5;
    uint64_t v18 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
    progress = v15->_progress;
    v15->_progress = (NSProgress *)v18;

    [(NSProgress *)v15->_progress setCompletedUnitCount:[(NSProgress *)v15->_progress totalUnitCount]];
    uint64_t v20 = [v13 copy];
    contentIdentifier = v15->_contentIdentifier;
    v15->_contentIdentifier = (NSString *)v20;
  }
  return v15;
}

@end