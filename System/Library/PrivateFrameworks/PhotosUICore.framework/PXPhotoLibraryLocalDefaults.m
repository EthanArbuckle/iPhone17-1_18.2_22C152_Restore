@interface PXPhotoLibraryLocalDefaults
- (BOOL)BOOLForKey:(id)a3;
- (PXPhotoLibraryLocalDefaults)initWithPhotoLibrary:(id)a3;
- (double)doubleForKey:(id)a3;
- (id)arrayForKey:(id)a3;
- (id)dataForKey:(id)a3;
- (id)dateForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)dictionaryWithValuesForKeys:(id)a3;
- (id)identifiersForKey:(id)a3;
- (id)numberForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (id)valueForKey:(id)a3;
- (void)_notifyObserversDidChangeValueForKey:(id)a3;
- (void)addIdentifier:(id)a3 forKey:(id)a4;
- (void)removeIdentifier:(id)a3 forKey:(id)a4;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setDictionary:(id)a3 forKey:(id)a4;
- (void)setDouble:(double)a3 forKey:(id)a4;
- (void)setIdentifiers:(id)a3 forKey:(id)a4;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation PXPhotoLibraryLocalDefaults

- (id)identifiersForKey:(id)a3
{
  v3 = [(PXPhotoLibraryLocalDefaults *)self arrayForKey:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)arrayForKey:(id)a3
{
  v3 = [(PHPhotoLibraryAppPrivateData *)self->_appPrivateData valueForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)dictionaryForKey:(id)a3
{
  v3 = [(PHPhotoLibraryAppPrivateData *)self->_appPrivateData valueForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)dataForKey:(id)a3
{
  v3 = [(PHPhotoLibraryAppPrivateData *)self->_appPrivateData valueForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (PXPhotoLibraryLocalDefaults)initWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPhotoLibraryLocalDefaults;
  id v5 = [(PXPhotoLibraryLocalDefaults *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 appPrivateData];
    appPrivateData = v5->_appPrivateData;
    v5->_appPrivateData = (PHPhotoLibraryAppPrivateData *)v6;
  }
  return v5;
}

uint64_t __68__PXPhotoLibraryLocalDefaults__notifyObserversDidChangeValueForKey___block_invoke(uint64_t a1, void *a2)
{
  return [a2 photoLibraryLocalDefaults:*(void *)(a1 + 32) didChangeValueForKey:*(void *)(a1 + 40)];
}

- (id)dateForKey:(id)a3
{
  v3 = [(PHPhotoLibraryAppPrivateData *)self->_appPrivateData valueForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)numberForKey:(id)a3
{
  v3 = [(PHPhotoLibraryAppPrivateData *)self->_appPrivateData valueForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(PXPhotoLibraryLocalDefaults *)self willChangeValueForKey:v7];
  appPrivateData = self->_appPrivateData;
  id v12 = 0;
  char v9 = [(PHPhotoLibraryAppPrivateData *)appPrivateData setValue:v6 forKey:v7 error:&v12];
  id v10 = v12;
  if ((v9 & 1) == 0)
  {
    v11 = PLUIGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v14 = v6;
      __int16 v15 = 2114;
      id v16 = v7;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "PXPhotoLibraryLocalDefaults - setting value %@ on key %{public}@ failed. Error: %@", buf, 0x20u);
    }
  }
  [(PXPhotoLibraryLocalDefaults *)self didChangeValueForKey:v7];
  [(PXPhotoLibraryLocalDefaults *)self _notifyObserversDidChangeValueForKey:v7];
}

- (void)_notifyObserversDidChangeValueForKey:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__PXPhotoLibraryLocalDefaults__notifyObserversDidChangeValueForKey___block_invoke;
  v6[3] = &unk_1E5DB9F58;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXPhotoLibraryLocalDefaults *)self enumerateObserversUsingBlock:v6];
}

- (void).cxx_destruct
{
}

- (void)removeIdentifier:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PXPhotoLibraryLocalDefaults *)self identifiersForKey:v6];
  id v9 = (id)[v8 mutableCopy];

  [v9 removeObject:v7];
  [(PXPhotoLibraryLocalDefaults *)self setIdentifiers:v9 forKey:v6];
}

- (void)addIdentifier:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PXPhotoLibraryLocalDefaults *)self identifiersForKey:v6];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1CAD0] set];
  }
  v11 = v10;

  id v12 = [v11 setByAddingObject:v7];

  [(PXPhotoLibraryLocalDefaults *)self setIdentifiers:v12 forKey:v6];
}

- (void)setIdentifiers:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = [a3 allObjects];
  [(PXPhotoLibraryLocalDefaults *)self setValue:v7 forKey:v6];
}

- (void)setDictionary:(id)a3 forKey:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  appPrivateData = self->_appPrivateData;
  id v12 = 0;
  char v9 = [(PHPhotoLibraryAppPrivateData *)appPrivateData setValue:v6 forKey:v7 error:&v12];
  id v10 = v12;
  if ((v9 & 1) == 0)
  {
    v11 = PLUIGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v14 = v6;
      __int16 v15 = 2114;
      id v16 = v7;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "PXPhotoLibraryLocalDefaults - setting dictionary %@ on defaultName %{public}@ failed. Error: %@", buf, 0x20u);
    }
  }
  [(PXPhotoLibraryLocalDefaults *)self _notifyObserversDidChangeValueForKey:v7];
}

- (id)stringForKey:(id)a3
{
  v3 = [(PHPhotoLibraryAppPrivateData *)self->_appPrivateData valueForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (double)doubleForKey:(id)a3
{
  v3 = [(PXPhotoLibraryLocalDefaults *)self numberForKey:a3];
  id v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  double v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithDouble:a3];
  [(PXPhotoLibraryLocalDefaults *)self setValue:v8 forKey:v7];
}

- (BOOL)BOOLForKey:(id)a3
{
  v3 = [(PXPhotoLibraryLocalDefaults *)self numberForKey:a3];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  double v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(PXPhotoLibraryLocalDefaults *)self setValue:v8 forKey:v7];
}

- (id)dictionaryWithValuesForKeys:(id)a3
{
  return (id)[(PHPhotoLibraryAppPrivateData *)self->_appPrivateData dictionaryWithValuesForKeys:a3];
}

- (id)valueForKey:(id)a3
{
  return (id)[(PHPhotoLibraryAppPrivateData *)self->_appPrivateData valueForKey:a3];
}

@end