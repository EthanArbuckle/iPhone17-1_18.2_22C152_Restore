@interface SASPresentationDecision
+ (int64_t)activationPresentationForPresentationIdentifiers:(id)a3;
@end

@implementation SASPresentationDecision

+ (int64_t)activationPresentationForPresentationIdentifiers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (os_log_t *)MEMORY[0x1E4F4E360];
  v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    v15 = "+[SASPresentationDecision activationPresentationForPresentationIdentifiers:]";
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation SASPresentationDecision deciding between: %@", (uint8_t *)&v14, 0x16u);
  }
  if ([v3 count] == 1) {
    goto LABEL_4;
  }
  int64_t v7 = 3;
  v8 = [NSString stringWithSiriPresentationIdentifier:3];
  char v9 = [v3 containsObject:v8];

  if ((v9 & 1) == 0)
  {
    int64_t v7 = 2;
    v10 = [NSString stringWithSiriPresentationIdentifier:2];
    char v11 = [v3 containsObject:v10];

    if ((v11 & 1) == 0)
    {
      os_log_t v13 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
        +[SASPresentationDecision activationPresentationForPresentationIdentifiers:](v13, v3);
      }
LABEL_4:
      v6 = [v3 firstObject];
      int64_t v7 = [v6 siriPresentationIdentifier];
    }
  }

  return v7;
}

+ (void)activationPresentationForPresentationIdentifiers:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  v4 = [a2 firstObject];
  int v5 = 136315394;
  v6 = "+[SASPresentationDecision activationPresentationForPresentationIdentifiers:]";
  __int16 v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_1D9588000, v3, OS_LOG_TYPE_ERROR, "%s ERROR: Multiple connected presentations, but none of them have precedence. Taking the first object, %@", (uint8_t *)&v5, 0x16u);
}

@end