@interface _UIArchiveExtractionController
- (BOOL)_createDestinationRoot:(id *)a3;
- (BOOL)extractArchiveContent:(id *)a3;
- (NSString)destinationContentProtectionType;
- (NSString)destinationExtractionRootPath;
- (NSString)sourceArchiveExtractionRootPath;
- (NSString)sourceArchivePath;
- (_UIArchiveExtractionController)initWithSourceArchivePath:(id)a3 destinationExtractionRootPath:(id)a4;
- (id)extractedContentAbsolutePathsMatchingPredicate:(id)a3;
- (void)setDestinationContentProtectionType:(id)a3;
- (void)setDestinationExtractionRootPath:(id)a3;
- (void)setSourceArchiveExtractionRootPath:(id)a3;
@end

@implementation _UIArchiveExtractionController

- (_UIArchiveExtractionController)initWithSourceArchivePath:(id)a3 destinationExtractionRootPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UIArchiveExtractionController;
  v9 = [(_UIArchiveExtractionController *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceArchivePath, a3);
    sourceArchiveExtractionRootPath = v10->_sourceArchiveExtractionRootPath;
    v10->_sourceArchiveExtractionRootPath = (NSString *)@".";

    objc_storeStrong((id *)&v10->_destinationExtractionRootPath, a4);
    objc_storeStrong((id *)&v10->_destinationContentProtectionType, (id)*MEMORY[0x1E4F28348]);
  }

  return v10;
}

- (BOOL)extractArchiveContent:(id *)a3
{
  if (-[_UIArchiveExtractionController _createDestinationRoot:](self, "_createDestinationRoot:"))
  {
    id v5 = [[_UILibArchiveStreamingExtractor alloc] initForExtractingArchivePath:self->_sourceArchivePath];
    int v6 = [v5 extractArchivePath:self->_sourceArchiveExtractionRootPath toDirectory:self->_destinationExtractionRootPath error:a3];
    if (v6)
    {
      id v7 = [v5 extractedContentAbsolutePaths];
      extractedContentAbsolutePaths = self->_extractedContentAbsolutePaths;
      self->_extractedContentAbsolutePaths = v7;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (id)extractedContentAbsolutePathsMatchingPredicate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  extractedContentAbsolutePaths = self->_extractedContentAbsolutePaths;
  if (v4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __81___UIArchiveExtractionController_extractedContentAbsolutePathsMatchingPredicate___block_invoke;
    v10[3] = &unk_1E52EB780;
    id v11 = v4;
    id v7 = [(NSArray *)extractedContentAbsolutePaths indexesOfObjectsPassingTest:v10];
    id v8 = [(NSArray *)extractedContentAbsolutePaths objectsAtIndexes:v7];
  }
  else
  {
    id v8 = extractedContentAbsolutePaths;
  }

  return v8;
}

- (BOOL)_createDestinationRoot:(id *)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  destinationContentProtectionType = self->_destinationContentProtectionType;
  uint64_t v21 = *MEMORY[0x1E4F28370];
  v22[0] = destinationContentProtectionType;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  char v20 = 0;
  int v8 = [v5 fileExistsAtPath:self->_destinationExtractionRootPath isDirectory:&v20];
  destinationExtractionRootPath = self->_destinationExtractionRootPath;
  if (v8)
  {
    id v19 = 0;
    char v10 = [v5 setAttributes:v7 ofItemAtPath:destinationExtractionRootPath error:&v19];
    id v11 = v19;
    v12 = v11;
    if (v10)
    {
      BOOL v13 = 1;
      goto LABEL_8;
    }
    v16 = [v11 localizedDescription];
    NSLog(&cfstr_FailedSettingD.isa, v16);
  }
  else
  {
    id v18 = 0;
    BOOL v13 = 1;
    char v14 = [v5 createDirectoryAtPath:destinationExtractionRootPath withIntermediateDirectories:1 attributes:v7 error:&v18];
    id v15 = v18;
    v12 = v15;
    if (v14) {
      goto LABEL_8;
    }
    v16 = [v15 localizedDescription];
    NSLog(&cfstr_FailedToCreate_2.isa, v16);
  }

  BOOL v13 = 0;
LABEL_8:
  if (a3) {
    *a3 = v12;
  }

  return v13;
}

- (NSString)sourceArchivePath
{
  return self->_sourceArchivePath;
}

- (NSString)destinationExtractionRootPath
{
  return self->_destinationExtractionRootPath;
}

- (void)setDestinationExtractionRootPath:(id)a3
{
}

- (NSString)destinationContentProtectionType
{
  return self->_destinationContentProtectionType;
}

- (void)setDestinationContentProtectionType:(id)a3
{
}

- (NSString)sourceArchiveExtractionRootPath
{
  return self->_sourceArchiveExtractionRootPath;
}

- (void)setSourceArchiveExtractionRootPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceArchiveExtractionRootPath, 0);
  objc_storeStrong((id *)&self->_destinationContentProtectionType, 0);
  objc_storeStrong((id *)&self->_destinationExtractionRootPath, 0);
  objc_storeStrong((id *)&self->_sourceArchivePath, 0);
  objc_storeStrong((id *)&self->_extractedContentAbsolutePaths, 0);
}

@end