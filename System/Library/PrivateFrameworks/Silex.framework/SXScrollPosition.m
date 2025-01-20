@interface SXScrollPosition
+ (BOOL)jsonDictionaryRepresentationIsValid:(id)a3 exactly:(BOOL)a4;
+ (BOOL)supportsSecureCoding;
- (NSString)jsonRepresentation;
- (SXScrollPosition)initWithCoder:(id)a3;
- (SXScrollPosition)initWithJSONRepresentation:(id)a3;
- (id)dictionaryRepresentation;
- (void)jsonRepresentation;
@end

@implementation SXScrollPosition

- (SXScrollPosition)initWithJSONRepresentation:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F08900];
  v6 = [v4 dataUsingEncoding:4];
  id v14 = 0;
  v7 = [v5 JSONObjectWithData:v6 options:0 error:&v14];
  id v8 = v14;

  if (!v8)
  {
    if (+[SXTextComponentScrollPosition jsonDictionaryRepresentationIsValid:v7 exactly:1])
    {
      v11 = SXTextComponentScrollPosition;
    }
    else
    {
      if (!+[SXComponentScrollPosition jsonDictionaryRepresentationIsValid:v7 exactly:1])
      {
        v13 = SXDefaultLog;
        if (os_log_type_enabled((os_log_t)SXDefaultLog, OS_LOG_TYPE_ERROR)) {
          -[SXScrollPosition initWithJSONRepresentation:]((uint64_t)v4, v13);
        }
        goto LABEL_4;
      }
      v11 = SXComponentScrollPosition;
    }
    v10 = (SXScrollPosition *)[[v11 alloc] initWithDictionaryRepresentation:v7 exactly:1];
    goto LABEL_10;
  }
  v9 = SXDefaultLog;
  if (os_log_type_enabled((os_log_t)SXDefaultLog, OS_LOG_TYPE_ERROR)) {
    -[SXScrollPosition initWithJSONRepresentation:]((uint64_t)v4, v9);
  }
LABEL_4:
  v10 = 0;
LABEL_10:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)jsonRepresentation
{
  v2 = [(SXScrollPosition *)self dictionaryRepresentation];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
    id v10 = 0;
    v5 = [MEMORY[0x263F08900] dataWithJSONObject:v4 options:0 error:&v10];
    id v6 = v10;
    if (v5)
    {
      v7 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
    }
    else
    {
      id v8 = SXDefaultLog;
      if (os_log_type_enabled((os_log_t)SXDefaultLog, OS_LOG_TYPE_FAULT)) {
        [(SXScrollPosition *)(uint64_t)v6 jsonRepresentation];
      }
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return (NSString *)v7;
}

- (SXScrollPosition)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SXScrollPosition;
  return [(SXScrollPosition *)&v4 init];
}

+ (BOOL)jsonDictionaryRepresentationIsValid:(id)a3 exactly:(BOOL)a4
{
  return 0;
}

- (id)dictionaryRepresentation
{
  return 0;
}

- (void)initWithJSONRepresentation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222AC5000, a2, OS_LOG_TYPE_ERROR, "Failed to create scroll position from invalid JSON: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithJSONRepresentation:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222AC5000, a2, OS_LOG_TYPE_ERROR, "Got an error creating the dictionary representation of %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)jsonRepresentation
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v1 = objc_begin_catch(a1);
  int v2 = SXDefaultLog;
  if (os_log_type_enabled((os_log_t)SXDefaultLog, OS_LOG_TYPE_FAULT))
  {
    int v3 = 138543362;
    id v4 = v1;
    _os_log_fault_impl(&dword_222AC5000, v2, OS_LOG_TYPE_FAULT, "Failed to convert scroll position to JSON with exception: %{public}@", (uint8_t *)&v3, 0xCu);
  }

  objc_end_catch();
}

@end