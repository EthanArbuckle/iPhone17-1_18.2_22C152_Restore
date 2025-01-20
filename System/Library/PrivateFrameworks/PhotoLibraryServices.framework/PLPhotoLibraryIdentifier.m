@interface PLPhotoLibraryIdentifier
+ (BOOL)_isValidLibraryURL:(id)a3 identifierMap:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)_addWellKnownIdentifierFromIdentifierMap:(id)a3 libraryURL:(id)a4;
+ (id)_buildIdentifierMapForLibraryURL:(id)a3 containerIdentifier:(id)a4 uuid:(id)a5 name:(id)a6 userDescription:(id)a7 error:(id *)a8;
+ (id)_createPhotoLibraryIdentifierWithPhotoLibraryURL:(id)a3 containerIdentifier:(id)a4 uuid:(id)a5 name:(id)a6 userDescription:(id)a7 error:(id *)a8;
+ (id)_existingPhotoLibraryIdentifierRecordForLibraryURL:(id)a3 error:(id *)a4;
+ (id)_stripWellKnownIdentifierFromIdentifierMap:(id)a3;
+ (id)createPhotoLibraryIdentifierWithPhotoLibraryURL:(id)a3 containerIdentifier:(id)a4 name:(id)a5 userDescription:(id)a6 error:(id *)a7;
+ (id)createPhotoLibraryIdentifierWithPhotoLibraryURL:(id)a3 containerIdentifier:(id)a4 uuid:(id)a5 name:(id)a6 userDescription:(id)a7 error:(id *)a8;
+ (id)photoLibraryIdentifierWithPhotoLibraryURL:(id)a3 createIfMissing:(BOOL)a4 error:(id *)a5;
- (BOOL)isImagePlaygroundDefaultLibraryIdentifier;
- (BOOL)setValuesForName:(id)a3 userDescription:(id)a4 error:(id *)a5;
- (NSString)containerIdentifier;
- (NSString)name;
- (NSString)userDescription;
- (NSString)uuid;
- (NSURL)libraryURL;
- (PLPhotoLibraryIdentifier)initWithCoder:(id)a3;
- (PLPhotoLibraryIdentifier)initWithIdentifierPayload:(id)a3;
- (id)debugDescription;
- (id)path;
- (int64_t)domain;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PLPhotoLibraryIdentifier

- (void).cxx_destruct
{
}

- (BOOL)isImagePlaygroundDefaultLibraryIdentifier
{
  v3 = [(PLPhotoLibraryIdentifier *)self containerIdentifier];
  if ([v3 isEqualToString:@"com.apple.GenerativePlayground"])
  {
    v4 = [(PLPhotoLibraryIdentifier *)self uuid];
    char v5 = [v4 isEqualToString:@"00000000-0000-0000-0000-000000000001"];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)setValuesForName:(id)a3 userDescription:(id)a4 error:(id *)a5
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  if (v8 | v9)
  {
    v10 = self;
    objc_sync_enter(v10);
    v11 = [(id)objc_opt_class() _stripWellKnownIdentifierFromIdentifierMap:v10->_payload];
    v12 = v11;
    if (v8) {
      [v11 setObject:v8 forKeyedSubscript:@"Name"];
    }
    if (v9) {
      [v12 setObject:v9 forKeyedSubscript:@"UserDescription"];
    }
    v13 = (void *)MEMORY[0x1E4F8B858];
    v14 = [(PLPhotoLibraryIdentifier *)v10 libraryURL];
    v15 = [v13 appPrivateDataForLibraryURL:v14];

    int v16 = [v15 setValue:v12 forKeyPath:@"Library.Identifier" error:a5];
    if (v16) {
      objc_storeStrong((id *)&v10->_payload, v12);
    }

    objc_sync_exit(v10);
  }
  else
  {
    LOBYTE(v16) = 1;
  }

  return v16;
}

- (int64_t)domain
{
  v2 = [(PLPhotoLibraryIdentifier *)self containerIdentifier];
  int v3 = [v2 isEqualToString:@"com.apple.photos"];

  if (v3) {
    return 2;
  }
  else {
    return 3;
  }
}

- (NSString)containerIdentifier
{
  v2 = [(NSDictionary *)self->_payload objectForKeyedSubscript:@"ContainerIdentifier"];
  if (!v2) {
    v2 = @"com.apple.photos";
  }
  return (NSString *)v2;
}

- (NSURL)libraryURL
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  int v3 = [(PLPhotoLibraryIdentifier *)self path];
  v4 = [v2 fileURLWithPath:v3];

  return (NSURL *)v4;
}

- (id)path
{
  return [(NSDictionary *)self->_payload objectForKeyedSubscript:@"Path"];
}

- (NSString)userDescription
{
  return (NSString *)[(NSDictionary *)self->_payload objectForKeyedSubscript:@"UserDescription"];
}

- (NSString)uuid
{
  return (NSString *)[(NSDictionary *)self->_payload objectForKeyedSubscript:@"UUID"];
}

- (NSString)name
{
  return (NSString *)[(NSDictionary *)self->_payload objectForKeyedSubscript:@"Name"];
}

- (PLPhotoLibraryIdentifier)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Name"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserDescription"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
  unint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Path"];
  unint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ContainerIdentifier"];

  v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:1];
  id v16 = 0;
  v11 = +[PLPhotoLibraryIdentifier _buildIdentifierMapForLibraryURL:v10 containerIdentifier:v9 uuid:v7 name:v5 userDescription:v6 error:&v16];
  id v12 = v16;

  if (v11)
  {
    v13 = [(PLPhotoLibraryIdentifier *)self initWithIdentifierPayload:v11];
  }
  else
  {
    v14 = PLBackendGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v8;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Invalid photo library identifier from coder init for library path %@. Error: %@", buf, 0x16u);
    }

    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = [(PLPhotoLibraryIdentifier *)self name];
  [v4 encodeObject:v5 forKey:@"Name"];

  v6 = [(PLPhotoLibraryIdentifier *)self userDescription];
  [v4 encodeObject:v6 forKey:@"UserDescription"];

  v7 = [(PLPhotoLibraryIdentifier *)self uuid];
  [v4 encodeObject:v7 forKey:@"UUID"];

  unint64_t v8 = [(PLPhotoLibraryIdentifier *)self path];
  [v4 encodeObject:v8 forKey:@"Path"];

  id v9 = [(PLPhotoLibraryIdentifier *)self containerIdentifier];
  [v4 encodeObject:v9 forKey:@"ContainerIdentifier"];
}

- (id)debugDescription
{
  v9.receiver = self;
  v9.super_class = (Class)PLPhotoLibraryIdentifier;
  int v3 = [(PLPhotoLibraryIdentifier *)&v9 description];
  id v4 = [(PLPhotoLibraryIdentifier *)self uuid];
  char v5 = [(PLPhotoLibraryIdentifier *)self name];
  v6 = [(PLPhotoLibraryIdentifier *)self userDescription];
  v7 = [v3 stringByAppendingFormat:@": UUID:[%@], name:[%@], userDescription:[%@]", v4, v5, v6];

  return v7;
}

- (PLPhotoLibraryIdentifier)initWithIdentifierPayload:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PLPhotoLibraryIdentifier.m", 265, @"Invalid parameter not satisfying: %@", @"identifierPayload" object file lineNumber description];
  }
  v7 = [(PLPhotoLibraryIdentifier *)self init];
  unint64_t v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_payload, a3);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)_isValidLibraryURL:(id)a3 identifierMap:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4F8B908];
  unint64_t v8 = [v5 path];
  id v14 = 0;
  objc_super v9 = [v7 realPathForPath:v8 error:&v14];
  id v10 = v14;

  if (v9)
  {
    v11 = [v6 objectForKeyedSubscript:@"Path"];
    char v12 = [v9 isEqualToString:v11];
  }
  else
  {
    v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v5;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Failed to access realpath for library identifier url: %@. Error: %@", buf, 0x16u);
    }
    char v12 = 0;
  }

  return v12;
}

+ (id)_addWellKnownIdentifierFromIdentifierMap:(id)a3 libraryURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"PLPhotoLibraryIdentifier.m", 244, @"Invalid parameter not satisfying: %@", @"identifierPayload" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, a1, @"PLPhotoLibraryIdentifier.m", 245, @"Invalid parameter not satisfying: %@", @"libraryURL" object file lineNumber description];

LABEL_3:
  id v10 = (void *)[v7 mutableCopy];
  v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(MEMORY[0x1E4F8B980], "wellKnownPhotoLibraryIdentifierForURL:", v9));
  [v10 setObject:v11 forKeyedSubscript:@"WellKnownIdentifier"];

  return v10;
}

+ (id)_stripWellKnownIdentifierFromIdentifierMap:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"PLPhotoLibraryIdentifier.m", 237, @"Invalid parameter not satisfying: %@", @"identifierPayload" object file lineNumber description];
  }
  id v6 = (void *)[v5 mutableCopy];
  [v6 removeObjectForKey:@"WellKnownIdentifier"];

  return v6;
}

+ (id)_buildIdentifierMapForLibraryURL:(id)a3 containerIdentifier:(id)a4 uuid:(id)a5 name:(id)a6 userDescription:(id)a7 error:(id *)a8
{
  v46[6] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  v41 = (__CFString *)a4;
  id v15 = a5;
  id v16 = a6;
  v40 = (__CFString *)a7;
  if (!v14)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, a1, @"PLPhotoLibraryIdentifier.m", 209, @"Invalid parameter not satisfying: %@", @"libraryURL" object file lineNumber description];
  }
  __int16 v17 = (void *)MEMORY[0x1E4F8B908];
  id v18 = [v14 path];
  id v42 = 0;
  uint64_t v19 = [v17 realPathForPath:v18 error:&v42];
  id v20 = v42;

  if (!v19)
  {
    uint64_t v21 = [v14 path];
    uint64_t v19 = [v21 stringByStandardizingPath];

    if (!v19)
    {
      v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v34 = *MEMORY[0x1E4F8C500];
      uint64_t v43 = *MEMORY[0x1E4F28228];
      v44 = @"Failed to access realpath for library url";
      v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      v36 = [v33 errorWithDomain:v34 code:46102 userInfo:v35];

      id v32 = v36;
      uint64_t v19 = 0;
LABEL_18:
      if (a8)
      {
        id v32 = v32;
        v31 = 0;
        *a8 = v32;
      }
      else
      {
        v31 = 0;
      }
      goto LABEL_21;
    }
  }
  v22 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v19 isDirectory:1];
  if ([v15 length])
  {
    id v23 = v15;
  }
  else
  {
    v24 = [MEMORY[0x1E4F29128] UUID];
    id v23 = [v24 UUIDString];
  }
  id v25 = v15;
  if ([v16 length])
  {
    id v26 = v16;
  }
  else
  {
    v27 = [v22 lastPathComponent];
    id v26 = [v27 stringByDeletingPathExtension];
  }
  v45[0] = @"Name";
  v45[1] = @"UserDescription";
  v28 = &stru_1EEB2EB80;
  if (v40) {
    v28 = v40;
  }
  v46[0] = v26;
  v46[1] = v28;
  v45[2] = @"Path";
  v45[3] = @"UUID";
  v29 = @"com.apple.photos";
  v46[2] = v19;
  v46[3] = v23;
  if (v41) {
    v29 = v41;
  }
  v46[4] = v29;
  v45[4] = @"ContainerIdentifier";
  v45[5] = @"WellKnownIdentifier";
  v30 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(MEMORY[0x1E4F8B980], "wellKnownPhotoLibraryIdentifierForURL:", v22));
  v46[5] = v30;
  v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:6];

  id v32 = v20;
  id v15 = v25;
  if (!v31) {
    goto LABEL_18;
  }
LABEL_21:

  return v31;
}

+ (id)_createPhotoLibraryIdentifierWithPhotoLibraryURL:(id)a3 containerIdentifier:(id)a4 uuid:(id)a5 name:(id)a6 userDescription:(id)a7 error:(id *)a8
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  if (!v15)
  {
    v48 = [MEMORY[0x1E4F28B00] currentHandler];
    [v48 handleFailureInMethod:a2, a1, @"PLPhotoLibraryIdentifier.m", 156, @"Invalid parameter not satisfying: %@", @"libraryURL" object file lineNumber description];
  }
  if ((PLIsReallyAssetsd() & 1) == 0 && (MEMORY[0x19F38C0C0]() & 1) == 0)
  {
    v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2, a1, @"PLPhotoLibraryIdentifier.m", 157, @"Invalid parameter not satisfying: %@", @"PLIsReallyAssetsd() || PLIsXcTest()" object file lineNumber description];
  }
  os_unfair_lock_assert_owner((const os_unfair_lock *)&s_identifierGenerationLock);
  id v20 = [a1 _existingPhotoLibraryIdentifierRecordForLibraryURL:v15 error:0];

  if (v20)
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F8C500];
    uint64_t v61 = *MEMORY[0x1E4F28228];
    v62[0] = @"Library identifier is already persisted for this url";
    id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:&v61 count:1];
    id v24 = [v21 errorWithDomain:v22 code:46110 userInfo:v23];
    id v25 = 0;
LABEL_8:

    id v26 = v24;
    goto LABEL_9;
  }
  id v52 = v17;
  id v53 = v16;
  v30 = (void *)MEMORY[0x1E4F8B908];
  v31 = [v15 path];
  id v56 = 0;
  id v23 = [v30 realPathForPath:v31 error:&v56];
  id v32 = v56;

  if (!v23)
  {
    id v42 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v43 = *MEMORY[0x1E4F8C500];
    uint64_t v57 = *MEMORY[0x1E4F28228];
    v58 = @"Failed to access realpath for library url";
    id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
    id v24 = [v42 errorWithDomain:v43 code:46102 userInfo:v23];

    id v25 = 0;
    id v17 = v52;
    id v16 = v53;
    goto LABEL_8;
  }
  id v51 = v19;
  v33 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v23 isDirectory:1];
  id v25 = (void *)[objc_alloc(MEMORY[0x1E4F8B980]) initWithLibraryURL:v33];
  if ([v25 isUBF])
  {
    uint64_t v34 = [MEMORY[0x1E4F8B980] photosLibraryExtension];
    [v15 pathExtension];
    v35 = id v50 = v18;
    char v36 = [v34 isEqualToString:v35];

    id v18 = v50;
    if ((v36 & 1) == 0)
    {
      v44 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v45 = *MEMORY[0x1E4F8C500];
      uint64_t v59 = *MEMORY[0x1E4F28228];
      v60 = @"Invalid library file extension";
      v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
      uint64_t v47 = v45;
      id v18 = v50;
      id v24 = [v44 errorWithDomain:v47 code:46102 userInfo:v46];

      id v17 = v52;
      id v16 = v53;
LABEL_25:
      id v19 = v51;
      goto LABEL_8;
    }
  }

  id v55 = v32;
  id v17 = v52;
  id v19 = v51;
  id v23 = [a1 _buildIdentifierMapForLibraryURL:v15 containerIdentifier:v53 uuid:v52 name:v18 userDescription:v51 error:&v55];
  id v26 = v55;

  if (v23)
  {
    id v37 = v18;
    v38 = [MEMORY[0x1E4F8B858] appPrivateDataForLibraryURL:v15];
    v39 = [a1 _stripWellKnownIdentifierFromIdentifierMap:v23];
    id v54 = v26;
    int v40 = [v38 setValue:v39 forKeyPath:@"Library.Identifier" error:&v54];
    id v24 = v54;

    if (v40)
    {
      v29 = [[PLPhotoLibraryIdentifier alloc] initWithIdentifierPayload:v23];

      id v28 = v24;
      id v17 = v52;
      id v16 = v53;
      id v18 = v37;
      id v19 = v51;
      goto LABEL_18;
    }

    id v17 = v52;
    id v16 = v53;
    id v18 = v37;
    goto LABEL_25;
  }
  id v16 = v53;
LABEL_9:
  id v27 = v26;
  id v28 = v27;
  if (a8)
  {
    id v28 = v27;
    v29 = 0;
    *a8 = v28;
  }
  else
  {
    v29 = 0;
  }
LABEL_18:

  return v29;
}

+ (id)createPhotoLibraryIdentifierWithPhotoLibraryURL:(id)a3 containerIdentifier:(id)a4 uuid:(id)a5 name:(id)a6 userDescription:(id)a7 error:(id *)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&s_identifierGenerationLock);
  id v19 = [a1 _createPhotoLibraryIdentifierWithPhotoLibraryURL:v18 containerIdentifier:v17 uuid:v16 name:v15 userDescription:v14 error:a8];

  os_unfair_lock_unlock((os_unfair_lock_t)&s_identifierGenerationLock);
  return v19;
}

+ (id)createPhotoLibraryIdentifierWithPhotoLibraryURL:(id)a3 containerIdentifier:(id)a4 name:(id)a5 userDescription:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&s_identifierGenerationLock);
  id v16 = [a1 _createPhotoLibraryIdentifierWithPhotoLibraryURL:v15 containerIdentifier:v14 uuid:0 name:v13 userDescription:v12 error:a7];

  os_unfair_lock_unlock((os_unfair_lock_t)&s_identifierGenerationLock);
  return v16;
}

+ (id)photoLibraryIdentifierWithPhotoLibraryURL:(id)a3 createIfMissing:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v23[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&s_identifierGenerationLock);
  id v21 = 0;
  objc_super v9 = [a1 _existingPhotoLibraryIdentifierRecordForLibraryURL:v8 error:&v21];
  id v10 = v21;
  id v11 = v10;
  if (v9 || (!v10 ? (BOOL v12 = !v6) : (BOOL v12 = 1), v12))
  {
    if (!v10)
    {
      id v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F8C500];
      uint64_t v15 = *MEMORY[0x1E4F289D0];
      v22[0] = *MEMORY[0x1E4F28228];
      v22[1] = v15;
      v23[0] = @"Library identifier does not exist for this url";
      v23[1] = v8;
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
      id v11 = [v13 errorWithDomain:v14 code:46111 userInfo:v16];
    }
  }
  else
  {
    id v20 = 0;
    objc_super v9 = [a1 _createPhotoLibraryIdentifierWithPhotoLibraryURL:v8 containerIdentifier:@"com.apple.photos" uuid:0 name:0 userDescription:0 error:&v20];
    id v11 = v20;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&s_identifierGenerationLock);
  id v17 = v11;
  id v18 = v17;
  if (!v9 && a5) {
    *a5 = v17;
  }

  return v9;
}

+ (id)_existingPhotoLibraryIdentifierRecordForLibraryURL:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&s_identifierGenerationLock);
  id v7 = [MEMORY[0x1E4F8B858] appPrivateDataForLibraryURL:v6];
  id v8 = [v7 valueForKeyPath:@"Library.Identifier"];
  if (!v8) {
    goto LABEL_8;
  }
  if ([a1 _isValidLibraryURL:v6 identifierMap:v8])
  {
    uint64_t v9 = [a1 _addWellKnownIdentifierFromIdentifierMap:v8 libraryURL:v6];

    id v10 = [[PLPhotoLibraryIdentifier alloc] initWithIdentifierPayload:v9];
    id v11 = 0;
    id v8 = (void *)v9;
    goto LABEL_9;
  }
  BOOL v12 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v13 = *MEMORY[0x1E4F8C500];
  uint64_t v18 = *MEMORY[0x1E4F28228];
  v19[0] = @"Mismatched library url";
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  uint64_t v15 = [v12 errorWithDomain:v13 code:46109 userInfo:v14];

  id v16 = v15;
  if (v15)
  {
    id v11 = v16;
    if (a4) {
      *a4 = v16;
    }

    id v10 = 0;
  }
  else
  {
LABEL_8:
    id v10 = 0;
    id v11 = 0;
  }
LABEL_9:

  return v10;
}

@end