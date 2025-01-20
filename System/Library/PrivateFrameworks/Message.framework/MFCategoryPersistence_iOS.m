@interface MFCategoryPersistence_iOS
- (MFCategoryPersistence_iOS)initWithLibrary:(id)a3 database:(id)a4 hookResponder:(id)a5;
- (MFMailMessageLibrary)library;
- (void)prepareToPersistCategorizationResultMap:(id)a3;
- (void)setLibrary:(id)a3;
@end

@implementation MFCategoryPersistence_iOS

- (MFCategoryPersistence_iOS)initWithLibrary:(id)a3 database:(id)a4 hookResponder:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"MFCategoryPersistence_iOS-BlackPearl.m", 32, @"Invalid parameter not satisfying: %@", @"library != nil" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)MFCategoryPersistence_iOS;
  v13 = [(EDCategoryPersistence *)&v17 initWithDatabase:v11 hookResponder:v12];
  v14 = v13;
  if (v13) {
    objc_storeStrong((id *)&v13->_library, a3);
  }

  return v14;
}

- (void)prepareToPersistCategorizationResultMap:(id)a3
{
}

- (MFMailMessageLibrary)library
{
  return self->_library;
}

- (void)setLibrary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end