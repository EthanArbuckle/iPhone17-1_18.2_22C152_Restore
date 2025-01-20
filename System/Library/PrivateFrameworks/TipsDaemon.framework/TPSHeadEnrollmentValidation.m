@interface TPSHeadEnrollmentValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSHeadEnrollmentValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FAF480];
  id v5 = a3;
  v6 = [v4 targeting];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[TPSHeadEnrollmentValidation validateWithCompletion:](self, v6);
  }

  (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
}

- (void)validateWithCompletion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = [a1 name];
  id v5 = [a1 targetContext];
  int v6 = 138413058;
  v7 = v4;
  __int16 v8 = 2112;
  v9 = v5;
  __int16 v10 = 1024;
  int v11 = 0;
  __int16 v12 = 2112;
  uint64_t v13 = 0;
  _os_log_debug_impl(&dword_1E4492000, a2, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d. Error: %@", (uint8_t *)&v6, 0x26u);
}

@end