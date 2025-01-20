@interface TRIAppContainer
+ (BOOL)supportsSecureCoding;
+ (TRIAppContainer)containerWithIdentifier:(id)a3 type:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContainer:(id)a3;
- (NSString)identifier;
- (TRIAppContainer)initWithCoder:(id)a3;
- (TRIAppContainer)initWithIdentifier:(id)a3 type:(int64_t)a4;
- (id)_appBundleContainerDirectoryAsOwner;
- (id)_appBundleContainerDirectoryAsSystemWithError:(id *)a3;
- (id)_appContainerDirectoryAsSystemWithContainerClass:(unint64_t)a3 error:(id *)a4;
- (id)_appDataContainerDirectoryAsOwner;
- (id)_appDataContainerDirectoryAsSystemWithError:(id *)a3;
- (id)_containerError:(unint64_t)a3 withFormat:(id)a4;
- (id)_containerURLWithError:(id *)a3;
- (id)_groupContainerDirectoryAsOwner;
- (id)_groupContainerDirectoryAsSystemWithError:(id *)a3;
- (id)containerURL;
- (id)containerURLAsOwner;
- (id)copyWithReplacementIdentifier:(id)a3;
- (id)copyWithReplacementType:(int64_t)a3;
- (id)description;
- (id)sanitizedIdentifier;
- (int64_t)fetchStatus;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIAppContainer

- (int64_t)fetchStatus
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v13 = 0;
  v3 = [(TRIAppContainer *)self _containerURLWithError:&v13];
  v4 = v3;
  if (!v3)
  {
    v10 = [v13 userInfo];
    v5 = [v10 objectForKeyedSubscript:@"containerError"];

    if (v5 && [v5 integerValue] == 21)
    {
      int64_t v8 = 2;
      goto LABEL_13;
    }
    v9 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = [v13 localizedFailureReason];
      *(_DWORD *)buf = 138412290;
      v15 = v12;
      _os_log_error_impl(&dword_19D909000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
LABEL_12:

    int64_t v8 = 0;
    goto LABEL_13;
  }
  v5 = [v3 path];
  if (!v5
    || ([MEMORY[0x1E4F28CB8] defaultManager],
        v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 fileExistsAtPath:v5],
        v6,
        (v7 & 1) == 0))
  {
    v9 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = self;
      _os_log_error_impl(&dword_19D909000, v9, OS_LOG_TYPE_ERROR, "could not determine state of app container %@", buf, 0xCu);
    }
    goto LABEL_12;
  }
  int64_t v8 = 1;
LABEL_13:

  return v8;
}

- (id)containerURL
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = 0;
  v2 = [(TRIAppContainer *)self _containerURLWithError:&v6];
  if (!v2)
  {
    v3 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = [v6 localizedFailureReason];
      *(_DWORD *)buf = 138412290;
      int64_t v8 = v5;
      _os_log_error_impl(&dword_19D909000, v3, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }

  return v2;
}

- (id)_containerURLWithError:(id *)a3
{
  int64_t v5 = [(TRIAppContainer *)self type];
  switch(v5)
  {
    case 3:
      id v6 = [(TRIAppContainer *)self _groupContainerDirectoryAsSystemWithError:a3];
      break;
    case 2:
      id v6 = [(TRIAppContainer *)self _appDataContainerDirectoryAsSystemWithError:a3];
      break;
    case 1:
      id v6 = [(TRIAppContainer *)self _appBundleContainerDirectoryAsSystemWithError:a3];
      break;
    default:
      id v6 = 0;
      break;
  }
  return v6;
}

- (id)containerURLAsOwner
{
  int64_t v3 = [(TRIAppContainer *)self type];
  switch(v3)
  {
    case 3:
      v4 = [(TRIAppContainer *)self _groupContainerDirectoryAsOwner];
      break;
    case 2:
      v4 = [(TRIAppContainer *)self _appDataContainerDirectoryAsOwner];
      break;
    case 1:
      v4 = [(TRIAppContainer *)self _appBundleContainerDirectoryAsOwner];
      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

- (id)sanitizedIdentifier
{
  if (_MergedGlobals_10 != -1) {
    dispatch_once(&_MergedGlobals_10, &__block_literal_global_11);
  }
  int64_t v3 = [(TRIAppContainer *)self identifier];
  v4 = [v3 dataUsingEncoding:1 allowLossyConversion:1];

  int64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithData:v4 encoding:1];
  uint64_t v6 = [v5 rangeOfCharacterFromSet:qword_1EB3B7858];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (uint64_t i = v6; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = [v5 rangeOfCharacterFromSet:qword_1EB3B7858])
      objc_msgSend(v5, "replaceCharactersInRange:withString:", i, 1, @"-");
  }

  return v5;
}

void __48__TRIAppContainer_TRIPaths__sanitizedIdentifier__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.-_"];
  uint64_t v0 = [v2 invertedSet];
  v1 = (void *)qword_1EB3B7858;
  qword_1EB3B7858 = v0;
}

- (id)_containerError:(unint64_t)a3 withFormat:(id)a4
{
  v17[3] = *MEMORY[0x1E4F143B8];
  int64_t v5 = (objc_class *)NSString;
  id v6 = a4;
  char v7 = (void *)[[v5 alloc] initWithFormat:v6 arguments:&v19];

  v16[0] = @"containerError";
  int64_t v8 = [NSNumber numberWithUnsignedLongLong:a3];
  v17[0] = v8;
  v16[1] = *MEMORY[0x1E4F28568];
  uint64_t v9 = [MEMORY[0x1E4F28B50] mainBundle];
  v10 = [v9 localizedStringForKey:@"Container error" value:&stru_1EEFB6D68 table:0];
  v17[1] = v10;
  v16[2] = *MEMORY[0x1E4F28588];
  v11 = [MEMORY[0x1E4F28B50] mainBundle];
  v12 = [v11 localizedStringForKey:v7 value:&stru_1EEFB6D68 table:0];
  v17[2] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

  v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v13];

  return v14;
}

- (id)_appContainerDirectoryAsSystemWithContainerClass:(unint64_t)a3 error:(id *)a4
{
  id v6 = [(TRIAppContainer *)self sanitizedIdentifier];
  char v7 = v6;
  if (!v6 || ![v6 length])
  {
    if (!a4) {
      goto LABEL_11;
    }
    v11 = [(TRIAppContainer *)self identifier];
    v12 = [(TRIAppContainer *)self _containerError:1, @"Failed to look up container with identifier %@ because cannot sanitize identifier", v11 withFormat];
    id v13 = *a4;
    *a4 = v12;

    goto LABEL_10;
  }
  [v7 UTF8String];
  uint64_t v8 = container_create_or_lookup_for_current_user();
  if (v8)
  {
    uint64_t v9 = v8;
    v10 = (void *)container_copy_path();
    MEMORY[0x19F3ACD80](v9);
    if (v10)
    {
      a4 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v10 isDirectory:1 relativeToURL:0];
      free(v10);
      goto LABEL_11;
    }
  }
  if (a4)
  {
    v14 = [(TRIAppContainer *)self identifier];
    v15 = [(TRIAppContainer *)self _containerError:0, @"Failed to look up container with identifier %@ due to container manager error: %llu", v14, 0 withFormat];
    id v16 = *a4;
    *a4 = v15;

LABEL_10:
    a4 = 0;
  }
LABEL_11:

  return a4;
}

- (id)_appBundleContainerDirectoryAsSystemWithError:(id *)a3
{
  return [(TRIAppContainer *)self _appContainerDirectoryAsSystemWithContainerClass:1 error:a3];
}

- (id)_appDataContainerDirectoryAsSystemWithError:(id *)a3
{
  return [(TRIAppContainer *)self _appContainerDirectoryAsSystemWithContainerClass:2 error:a3];
}

- (id)_groupContainerDirectoryAsSystemWithError:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  int64_t v5 = (void *)container_create_or_lookup_app_group_paths_for_current_user();
  id v6 = v5;
  if (v5)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v14 = __Block_byref_object_copy__5;
    v15 = __Block_byref_object_dispose__5;
    id v16 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__TRIAppContainer_TRIPaths___groupContainerDirectoryAsSystemWithError___block_invoke;
    v11[3] = &unk_1E596AEF0;
    v11[5] = buf;
    v11[6] = a2;
    v11[4] = self;
    xpc_dictionary_apply(v5, v11);
    id v7 = *(id *)(*(void *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v8 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = [(TRIAppContainer *)self identifier];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v12;
      _os_log_error_impl(&dword_19D909000, v8, OS_LOG_TYPE_ERROR, "Failed to look up container with identifier %@ due to container manager error: %llu", buf, 0x16u);
    }
    id v7 = 0;
  }

  return v7;
}

uint64_t __71__TRIAppContainer_TRIPaths___groupContainerDirectoryAsSystemWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [NSString stringWithUTF8String:a2];
  if (!v6)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"TRIAppContainer+TRIPaths.m" lineNumber:198 description:@"groupId is not valid UTF-8"];
  }
  id v7 = [*(id *)(a1 + 32) identifier];
  int v8 = [v7 isEqualToString:v6];

  if (v8)
  {
    string_ptr = xpc_string_get_string_ptr(v5);
    if (string_ptr)
    {
      uint64_t v10 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:string_ptr isDirectory:1 relativeToURL:0];
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    else
    {
      id v13 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v16 = 0;
        _os_log_error_impl(&dword_19D909000, v13, OS_LOG_TYPE_ERROR, "groupId path could not be coerced to string", v16, 2u);
      }
    }
  }

  return v8 ^ 1u;
}

- (id)_appBundleContainerDirectoryAsOwner
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  int64_t v3 = [v2 bundleURL];

  return v3;
}

- (id)_appDataContainerDirectoryAsOwner
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  int64_t v3 = [v2 URLsForDirectory:5 inDomains:1];
  v4 = [v3 firstObject];

  if (v4)
  {
    id v5 = [v3 firstObject];
    v4 = [v5 URLByDeletingLastPathComponent];
  }
  return v4;
}

- (id)_groupContainerDirectoryAsOwner
{
  int64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [(TRIAppContainer *)self sanitizedIdentifier];
  id v5 = [v3 containerURLForSecurityApplicationGroupIdentifier:v4];

  return v5;
}

- (TRIAppContainer)initWithIdentifier:(id)a3 type:(int64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 22, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)TRIAppContainer;
  uint64_t v9 = [(TRIAppContainer *)&v13 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v10->_type = a4;
  }

  return v10;
}

+ (TRIAppContainer)containerWithIdentifier:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v6 type:a4];

  return (TRIAppContainer *)v7;
}

- (id)copyWithReplacementIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdentifier:v4 type:self->_type];

  return v5;
}

- (id)copyWithReplacementType:(int64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  identifier = self->_identifier;
  return (id)[v5 initWithIdentifier:identifier type:a3];
}

- (BOOL)isEqualToContainer:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  int v6 = self->_identifier != 0;
  id v7 = [v4 identifier];
  int v8 = v7 == 0;

  if (v6 == v8
    || (identifier = self->_identifier) != 0
    && ([v5 identifier],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [(NSString *)identifier isEqual:v10],
        v10,
        !v11))
  {
LABEL_6:
    BOOL v13 = 0;
  }
  else
  {
    int64_t type = self->_type;
    BOOL v13 = type == [v5 type];
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIAppContainer *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIAppContainer *)self isEqualToContainer:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  return self->_type - v3 + 32 * v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIAppContainer)initWithCoder:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  if (!v5)
  {
    int v8 = [v4 error];

    if (v8)
    {
LABEL_10:
      id v7 = 0;
      goto LABEL_11;
    }
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = @"Retrieved nil serialized value for nonnull TRIAppContainer.identifier";
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v11 = 2;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v13 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v13);
    v14 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v14);
    v15 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIAppContainer key \"identifier\" (expected %@, decoded %@)", v9, v12, 0];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    v23 = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIAppContainerOCNTErrorDomain" code:3 userInfo:v16];
    [v4 failWithError:v17];

    goto LABEL_9;
  }
  uint64_t v6 = [v4 decodeInt64ForKey:@"type"];
  if (!v6)
  {
    uint64_t v19 = [v4 error];

    if (v19) {
      goto LABEL_10;
    }
    if ([v4 containsValueForKey:@"type"]) {
      goto LABEL_4;
    }
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21 = @"Missing serialized value for TRIAppContainer.type";
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v11 = 1;
LABEL_7:
    uint64_t v12 = (void *)[v10 initWithDomain:@"TRIAppContainerOCNTErrorDomain" code:v11 userInfo:v9];
    [v4 failWithError:v12];
LABEL_9:

    goto LABEL_10;
  }
LABEL_4:
  self = [(TRIAppContainer *)self initWithIdentifier:v5 type:v6];
  id v7 = self;
LABEL_11:

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  identifier = self->_identifier;
  id v6 = v4;
  if (identifier)
  {
    [v4 encodeObject:identifier forKey:@"identifier"];
    id v4 = v6;
  }
  [v4 encodeInt64:self->_type forKey:@"type"];
}

- (id)description
{
  id v3 = [NSString alloc];
  identifier = self->_identifier;
  id v5 = [NSNumber numberWithInteger:self->_type];
  id v6 = (void *)[v3 initWithFormat:@"<TRIAppContainer | identifier:%@ type:%@>", identifier, v5];

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end