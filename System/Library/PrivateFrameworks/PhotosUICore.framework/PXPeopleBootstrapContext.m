@interface PXPeopleBootstrapContext
+ (PXPeopleBootstrapContext)contextWithFace:(id)a3 type:(unint64_t)a4 delayedPersonBlock:(id)a5;
+ (PXPeopleBootstrapContext)contextWithPerson:(id)a3 type:(unint64_t)a4;
+ (PXPeopleBootstrapContext)contextWithPersonSuggestion:(id)a3;
- (BOOL)didCommitPreBootstrapAction;
- (BOOL)skipInitialAction;
- (BOOL)wantsContactUnlinkage;
- (BOOL)wantsMergeCandidateSuggestions;
- (BOOL)wantsNaming;
- (BOOL)wantsPostNaming;
- (BOOL)wantsToBeAddedToPeopleAlbum;
- (NSString)callerInfo;
- (NSString)localizedName;
- (PHAsset)keyAsset;
- (PHFace)face;
- (PXPeopleBootstrapContext)init;
- (PXPeopleNameSelection)nameSelection;
- (PXPeopleSuggestionManager)suggestionManager;
- (PXPeopleSuggestionManagerDataSource)prefetchedDataSource;
- (PXPerson)sourcePerson;
- (PXPerson)targetPerson;
- (PXPersonSuggestion)personSuggestion;
- (double)backingScaleFactor;
- (id)cancelBlock;
- (id)delayedPersonBlock;
- (id)description;
- (id)onInitBlock;
- (unint64_t)bootstrapType;
- (void)setBackingScaleFactor:(double)a3;
- (void)setBootstrapType:(unint64_t)a3;
- (void)setCallerInfo:(id)a3;
- (void)setCancelBlock:(id)a3;
- (void)setDelayedPersonBlock:(id)a3;
- (void)setDidCommitPreBootstrapAction:(BOOL)a3;
- (void)setFace:(id)a3;
- (void)setKeyAsset:(id)a3;
- (void)setNameSelection:(id)a3;
- (void)setOnInitBlock:(id)a3;
- (void)setPersonSuggestion:(id)a3;
- (void)setPrefetchedDataSource:(id)a3;
- (void)setSkipInitialAction:(BOOL)a3;
- (void)setSourcePerson:(id)a3;
- (void)setSuggestionManager:(id)a3;
- (void)setTargetPerson:(id)a3;
- (void)setWantsContactUnlinkage:(BOOL)a3;
- (void)setWantsMergeCandidateSuggestions:(BOOL)a3;
- (void)setWantsNaming:(BOOL)a3;
- (void)setWantsPostNaming:(BOOL)a3;
- (void)setWantsToBeAddedToPeopleAlbum:(BOOL)a3;
@end

@implementation PXPeopleBootstrapContext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_delayedPersonBlock, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_personSuggestion, 0);
  objc_storeStrong((id *)&self->_callerInfo, 0);
  objc_storeStrong((id *)&self->_prefetchedDataSource, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong(&self->_onInitBlock, 0);
  objc_storeStrong((id *)&self->_suggestionManager, 0);
  objc_storeStrong((id *)&self->_nameSelection, 0);
  objc_storeStrong((id *)&self->_targetPerson, 0);
  objc_storeStrong((id *)&self->_sourcePerson, 0);
}

- (void)setDelayedPersonBlock:(id)a3
{
}

- (id)delayedPersonBlock
{
  return self->_delayedPersonBlock;
}

- (void)setWantsContactUnlinkage:(BOOL)a3
{
  self->_wantsContactUnlinkage = a3;
}

- (BOOL)wantsContactUnlinkage
{
  return self->_wantsContactUnlinkage;
}

- (void)setKeyAsset:(id)a3
{
}

- (PHAsset)keyAsset
{
  return self->_keyAsset;
}

- (void)setDidCommitPreBootstrapAction:(BOOL)a3
{
  self->_didCommitPreBootstrapAction = a3;
}

- (BOOL)didCommitPreBootstrapAction
{
  return self->_didCommitPreBootstrapAction;
}

- (void)setBackingScaleFactor:(double)a3
{
  self->_backingScaleFactor = a3;
}

- (double)backingScaleFactor
{
  return self->_backingScaleFactor;
}

- (void)setFace:(id)a3
{
}

- (PHFace)face
{
  return self->_face;
}

- (void)setPersonSuggestion:(id)a3
{
}

- (PXPersonSuggestion)personSuggestion
{
  return self->_personSuggestion;
}

- (void)setCallerInfo:(id)a3
{
}

- (NSString)callerInfo
{
  return self->_callerInfo;
}

- (void)setPrefetchedDataSource:(id)a3
{
}

- (PXPeopleSuggestionManagerDataSource)prefetchedDataSource
{
  return self->_prefetchedDataSource;
}

- (void)setWantsToBeAddedToPeopleAlbum:(BOOL)a3
{
  self->_wantsToBeAddedToPeopleAlbum = a3;
}

- (BOOL)wantsToBeAddedToPeopleAlbum
{
  return self->_wantsToBeAddedToPeopleAlbum;
}

- (void)setWantsPostNaming:(BOOL)a3
{
  self->_wantsPostNaming = a3;
}

- (BOOL)wantsPostNaming
{
  return self->_wantsPostNaming;
}

- (void)setWantsMergeCandidateSuggestions:(BOOL)a3
{
  self->_wantsMergeCandidateSuggestions = a3;
}

- (BOOL)wantsMergeCandidateSuggestions
{
  return self->_wantsMergeCandidateSuggestions;
}

- (void)setWantsNaming:(BOOL)a3
{
  self->_wantsNaming = a3;
}

- (BOOL)wantsNaming
{
  return self->_wantsNaming;
}

- (void)setCancelBlock:(id)a3
{
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setOnInitBlock:(id)a3
{
}

- (id)onInitBlock
{
  return self->_onInitBlock;
}

- (void)setSkipInitialAction:(BOOL)a3
{
  self->_skipInitialAction = a3;
}

- (BOOL)skipInitialAction
{
  return self->_skipInitialAction;
}

- (void)setSuggestionManager:(id)a3
{
}

- (PXPeopleSuggestionManager)suggestionManager
{
  return (PXPeopleSuggestionManager *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNameSelection:(id)a3
{
}

- (PXPeopleNameSelection)nameSelection
{
  return (PXPeopleNameSelection *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBootstrapType:(unint64_t)a3
{
  self->_bootstrapType = a3;
}

- (unint64_t)bootstrapType
{
  return self->_bootstrapType;
}

- (void)setTargetPerson:(id)a3
{
}

- (PXPerson)targetPerson
{
  return (PXPerson *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSourcePerson:(id)a3
{
}

- (PXPerson)sourcePerson
{
  return (PXPerson *)objc_getProperty(self, a2, 16, 1);
}

- (id)description
{
  v38.receiver = self;
  v38.super_class = (Class)PXPeopleBootstrapContext;
  v3 = [(PXPeopleBootstrapContext *)&v38 description];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(PXPeopleBootstrapContext *)self sourcePerson];
  [v4 appendFormat:@"\nsourcePerson: %@,\n", v5];

  v6 = [(PXPeopleBootstrapContext *)self targetPerson];
  [v4 appendFormat:@"targetPerson: %@,\n", v6];

  unint64_t v7 = [(PXPeopleBootstrapContext *)self bootstrapType];
  if (v7 - 1 > 2) {
    v8 = @"PXPeopleBootstrapTypeFavorite";
  }
  else {
    v8 = off_1E5DCA608[v7 - 1];
  }
  [v4 appendFormat:@"bootstrapType: %@,\n", v8];
  v9 = [(PXPeopleBootstrapContext *)self nameSelection];
  [v4 appendFormat:@"nameSelection: %@,\n", v9];

  v10 = [(PXPeopleBootstrapContext *)self suggestionManager];
  [v4 appendFormat:@"suggestionManager: %@,\n", v10];

  if ([(PXPeopleBootstrapContext *)self skipInitialAction]) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  v12 = v11;
  [v4 appendFormat:@"skipInitialAction: %@,\n", v12];

  v13 = [(PXPeopleBootstrapContext *)self onInitBlock];
  v14 = _Block_copy(v13);
  [v4 appendFormat:@"onInitBlock: %@,\n", v14];

  v15 = [(PXPeopleBootstrapContext *)self cancelBlock];
  v16 = _Block_copy(v15);
  [v4 appendFormat:@"cancelBlock: %@,\n", v16];

  if ([(PXPeopleBootstrapContext *)self wantsNaming]) {
    v17 = @"YES";
  }
  else {
    v17 = @"NO";
  }
  v18 = v17;
  [v4 appendFormat:@"wantsNaming: %@,\n", v18];

  if ([(PXPeopleBootstrapContext *)self wantsMergeCandidateSuggestions]) {
    v19 = @"YES";
  }
  else {
    v19 = @"NO";
  }
  v20 = v19;
  [v4 appendFormat:@"wantsMergeCandidateSuggestions: %@,\n", v20];

  if ([(PXPeopleBootstrapContext *)self wantsPostNaming]) {
    v21 = @"YES";
  }
  else {
    v21 = @"NO";
  }
  v22 = v21;
  [v4 appendFormat:@"wantsPostNaming: %@,\n", v22];

  if ([(PXPeopleBootstrapContext *)self wantsToBeAddedToPeopleAlbum]) {
    v23 = @"YES";
  }
  else {
    v23 = @"NO";
  }
  v24 = v23;
  [v4 appendFormat:@"wantsToBeAddedToPeopleAlbum: %@,\n", v24];

  v25 = [(PXPeopleBootstrapContext *)self prefetchedDataSource];
  [v4 appendFormat:@"prefetchedDataSource: %@,\n", v25];

  v26 = [(PXPeopleBootstrapContext *)self callerInfo];
  [v4 appendFormat:@"callerInfo: %@,\n", v26];

  v27 = [(PXPeopleBootstrapContext *)self localizedName];
  [v4 appendFormat:@"localizedName: %@,\n", v27];

  v28 = [(PXPeopleBootstrapContext *)self personSuggestion];
  [v4 appendFormat:@"personSuggestion: %@,\n", v28];

  v29 = [(PXPeopleBootstrapContext *)self face];
  [v4 appendFormat:@"face: %@\n", v29];

  [(PXPeopleBootstrapContext *)self backingScaleFactor];
  objc_msgSend(v4, "appendFormat:", @"backingScaleFactor: %f\n", v30);
  if ([(PXPeopleBootstrapContext *)self didCommitPreBootstrapAction]) {
    v31 = @"YES";
  }
  else {
    v31 = @"NO";
  }
  v32 = v31;
  [v4 appendFormat:@"didCommitPreBootstrapAction: %@\n", v32];

  v33 = [(PXPeopleBootstrapContext *)self keyAsset];
  v34 = [v33 localIdentifier];
  [v4 appendFormat:@"keyAsset: %@\n", v34];

  if ([(PXPeopleBootstrapContext *)self wantsContactUnlinkage]) {
    v35 = @"YES";
  }
  else {
    v35 = @"NO";
  }
  v36 = v35;
  [v4 appendFormat:@"wantsContactUnlinkage: %@", v36];

  return v4;
}

- (NSString)localizedName
{
  v3 = [(PXPeopleBootstrapContext *)self nameSelection];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 localizedName];
  }
  else
  {
    v6 = [(PXPeopleBootstrapContext *)self sourcePerson];
    v5 = objc_msgSend(v6, "px_localizedName");
  }
  return (NSString *)v5;
}

- (PXPeopleBootstrapContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXPeopleBootstrapContext;
  result = [(PXPeopleBootstrapContext *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_wantsNaming = 257;
    result->_wantsPostNaming = 1;
  }
  return result;
}

+ (PXPeopleBootstrapContext)contextWithPersonSuggestion:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v12);
    v13 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v9 handleFailureInMethod:a2, a1, @"PXPeopleBootstrapContext.m", 68, @"%@ should be an instance inheriting from %@, but it is %@", @"personSuggestion", v11, v13 object file lineNumber description];
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v9 handleFailureInMethod:a2, a1, @"PXPeopleBootstrapContext.m", 68, @"%@ should be an instance inheriting from %@, but it is nil", @"personSuggestion", v11 object file lineNumber description];
  }

LABEL_3:
  v6 = [v5 person];
  unint64_t v7 = +[PXPeopleBootstrapContext contextWithPerson:v6 type:2];
  [v7 setPersonSuggestion:v5];

  return (PXPeopleBootstrapContext *)v7;
}

+ (PXPeopleBootstrapContext)contextWithFace:(id)a3 type:(unint64_t)a4 delayedPersonBlock:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"PXPeopleBootstrapContext.m", 52, @"Invalid parameter not satisfying: %@", @"face" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, a1, @"PXPeopleBootstrapContext.m", 53, @"Invalid parameter not satisfying: %@", @"delayedPersonBlock" object file lineNumber description];

LABEL_3:
  if (a4 != 1)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PXPeopleBootstrapContext.m", 55, @"Invalid parameter not satisfying: %@", @"type == PXPeopleBootstrapTypeName" object file lineNumber description];
  }
  v12 = objc_alloc_init(PXPeopleBootstrapContext);
  [(PXPeopleBootstrapContext *)v12 setBootstrapType:a4];
  [(PXPeopleBootstrapContext *)v12 setWantsMergeCandidateSuggestions:0];
  [(PXPeopleBootstrapContext *)v12 setFace:v9];
  [(PXPeopleBootstrapContext *)v12 setDelayedPersonBlock:v11];

  return v12;
}

+ (PXPeopleBootstrapContext)contextWithPerson:(id)a3 type:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"PXPeopleBootstrapContext.m", 44, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];
  }
  v8 = objc_alloc_init(PXPeopleBootstrapContext);
  [(PXPeopleBootstrapContext *)v8 setSourcePerson:v7];
  [(PXPeopleBootstrapContext *)v8 setBootstrapType:a4];

  return v8;
}

@end