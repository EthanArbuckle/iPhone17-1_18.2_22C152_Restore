@interface PGPictureInPictureApplication
+ (id)pictureInPictureApplicationWithProcessIdentifier:(int)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPGPictureInPictureApplication:(id)a3;
- (NSString)bundleIdentifier;
- (PGPictureInPictureApplication)init;
- (PGPictureInPictureApplication)initWithProcessIdentifier:(int)a3;
- (id)description;
- (int)processIdentifier;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation PGPictureInPictureApplication

+ (id)pictureInPictureApplicationWithProcessIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (pictureInPictureApplicationWithProcessIdentifier__onceToken != -1) {
    dispatch_once(&pictureInPictureApplicationWithProcessIdentifier__onceToken, &__block_literal_global);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = (id)pictureInPictureApplicationWithProcessIdentifier____pictureInPictureApplications;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_5:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      if (objc_msgSend(v10, "processIdentifier", (void)v13) == v3) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    id v11 = v10;

    if (v11) {
      goto LABEL_14;
    }
  }
  else
  {
LABEL_11:
  }
  id v11 = (id)[objc_alloc((Class)a1) initWithProcessIdentifier:v3];
  [(id)pictureInPictureApplicationWithProcessIdentifier____pictureInPictureApplications addObject:v11];
LABEL_14:

  return v11;
}

uint64_t __82__PGPictureInPictureApplication_pictureInPictureApplicationWithProcessIdentifier___block_invoke()
{
  pictureInPictureApplicationWithProcessIdentifier____pictureInPictureApplications = [MEMORY[0x1E4F28D30] weakObjectsHashTable];

  return MEMORY[0x1F41817F8]();
}

- (PGPictureInPictureApplication)initWithProcessIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureApplication initWithProcessIdentifier:](self);
  }

  v11.receiver = self;
  v11.super_class = (Class)PGPictureInPictureApplication;
  uint64_t v6 = [(PGPictureInPictureApplication *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_processIdentifier = v3;
    uint64_t v8 = PGBundleIdentifierForProcessIdentifier(v3);
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v8;
  }
  return v7;
}

- (PGPictureInPictureApplication)init
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"%@ may only be initialized by PGPictureInPictureController.", v6 format];

  return [(PGPictureInPictureApplication *)self initWithProcessIdentifier:0];
}

- (void)dealloc
{
  uint64_t v3 = PGLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureApplication initWithProcessIdentifier:](self);
  }

  v4.receiver = self;
  v4.super_class = (Class)PGPictureInPictureApplication;
  [(PGPictureInPictureApplication *)&v4 dealloc];
}

- (BOOL)isEqualToPGPictureInPictureApplication:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bundleIdentifier];
  uint64_t v6 = [(PGPictureInPictureApplication *)self bundleIdentifier];
  if ([v5 isEqualToString:v6])
  {
    int v7 = [v4 processIdentifier];
    BOOL v8 = v7 == [(PGPictureInPictureApplication *)self processIdentifier];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PGPictureInPictureApplication *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PGPictureInPictureApplication *)self isEqualToPGPictureInPictureApplication:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  v2 = [(PGPictureInPictureApplication *)self bundleIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"pid: %ui- bundle: %@", self->_processIdentifier, self->_bundleIdentifier];
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
}

- (void)initWithProcessIdentifier:(void *)a1 .cold.1(void *a1)
{
  v1 = _PGLogMethodProem(a1, 1);
  OUTLINED_FUNCTION_0(&dword_1B5645000, v2, v3, "%@", v4, v5, v6, v7, 2u);
}

@end