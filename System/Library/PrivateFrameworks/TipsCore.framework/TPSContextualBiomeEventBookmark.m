@interface TPSContextualBiomeEventBookmark
+ (BOOL)supportsSecureCoding;
+ (id)bookmarkWithSinkBookmark:(id)a3;
- (BMBookmark)sinkBookmark;
- (TPSContextualBiomeEventBookmark)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSinkBookmark:(id)a3;
@end

@implementation TPSContextualBiomeEventBookmark

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)bookmarkWithSinkBookmark:(id)a3
{
  id v3 = a3;
  v4 = [(TPSContextualEventBookmark *)[TPSContextualBiomeEventBookmark alloc] initWithDataVersion:1];
  [(TPSContextualBiomeEventBookmark *)v4 setSinkBookmark:v3];

  return v4;
}

- (TPSContextualBiomeEventBookmark)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TPSContextualBiomeEventBookmark;
  v5 = [(TPSContextualEventBookmark *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bookmarkData"];
    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F28DC0] unarchiveObjectWithData:v6];
      sinkBookmark = v5->_sinkBookmark;
      v5->_sinkBookmark = (BMBookmark *)v7;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TPSContextualBiomeEventBookmark;
  [(TPSContextualEventBookmark *)&v10 encodeWithCoder:v4];
  sinkBookmark = self->_sinkBookmark;
  if (sinkBookmark)
  {
    id v9 = 0;
    v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:sinkBookmark requiringSecureCoding:0 error:&v9];
    id v7 = v9;
    if (v6)
    {
      [v4 encodeObject:v6 forKey:@"bookmarkData"];
    }
    else
    {
      v8 = +[TPSLogger default];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[TPSContextualBiomeEventBookmark encodeWithCoder:]();
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPSContextualBiomeEventBookmark;
  id v4 = [(TPSContextualEventBookmark *)&v6 copyWithZone:a3];
  [v4 setSinkBookmark:self->_sinkBookmark];
  return v4;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v8.receiver = self;
  v8.super_class = (Class)TPSContextualBiomeEventBookmark;
  id v4 = [(TPSContextualEventBookmark *)&v8 description];
  v5 = (void *)[v3 initWithString:v4];

  objc_super v6 = [(TPSContextualBiomeEventBookmark *)self sinkBookmark];
  [v5 appendFormat:@"; %@ = %@", @"bookmarkData", v6];

  return v5;
}

- (BMBookmark)sinkBookmark
{
  return self->_sinkBookmark;
}

- (void)setSinkBookmark:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithCoder:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 138412546;
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_19C8DC000, v0, OS_LOG_TYPE_ERROR, "Error secureUnarchiving key %@, exception: %@", (uint8_t *)v1, 0x16u);
}

- (void)encodeWithCoder:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 138412546;
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_19C8DC000, v0, OS_LOG_TYPE_ERROR, "Failed to archive key %@, error: %@", (uint8_t *)v1, 0x16u);
}

@end