@interface SLInteractionHandler
- (NSString)appIdentifier;
- (SLInteractionHandler)init;
- (SLInteractionHandler)initWithAppIdentifier:(id)a3;
- (id)applicationIdentifier;
- (id)fetchAttributionForAttributionIdentifier:(id)a3;
- (id)fetchInteractionsWithLimit:(unint64_t)a3 reason:(id)a4 variant:(id)a5 error:(id *)a6;
- (id)fetchInteractionsWithLimit:(unint64_t)a3 variant:(id)a4 error:(id *)a5;
- (void)applicationIdentifier;
- (void)dealloc;
- (void)feedbackForHighlightIdentifier:(id)a3 withType:(unint64_t)a4 variant:(id)a5 completionBlock:(id)a6;
- (void)setAppIdentifier:(id)a3;
@end

@implementation SLInteractionHandler

- (SLInteractionHandler)initWithAppIdentifier:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SLInteractionHandler;
  v6 = [(SLInteractionHandler *)&v12 init];
  if (v6)
  {
    if ([v5 length]) {
      objc_storeStrong((id *)&v6->_appIdentifier, a3);
    }
    if ((SLIsRunningInDaemon() & 1) != 0
      || (SLIsRunningInSLTester() & 1) != 0
      || (SLIsRunningInGelatoTester() & 1) != 0
      || [v5 length])
    {
      v7 = SLDaemonLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[SLInteractionHandler initWithAppIdentifier:]((uint64_t)v6, v7);
      }
    }
    else
    {
      v9 = [(SLInteractionHandler *)v6 applicationIdentifier];
      v7 = v9;
      if (v9)
      {
        v10 = v9;
        appIdentifier = v6->_appIdentifier;
        v6->_appIdentifier = v10;
      }
      else
      {
        appIdentifier = SLFrameworkLogHandle();
        if (os_log_type_enabled(appIdentifier, OS_LOG_TYPE_ERROR)) {
          -[SLInteractionHandler initWithAppIdentifier:](appIdentifier);
        }
      }
    }
  }

  return v6;
}

- (id)fetchInteractionsWithLimit:(unint64_t)a3 reason:(id)a4 variant:(id)a5 error:(id *)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a4;
  objc_super v12 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    appIdentifier = self->_appIdentifier;
    *(_DWORD *)buf = 134218242;
    unint64_t v25 = a3;
    __int16 v26 = 2112;
    v27 = appIdentifier;
    _os_log_impl(&dword_19BE17000, v12, OS_LOG_TYPE_INFO, "Fetching %lu interactions for application Identifier: %@", buf, 0x16u);
  }

  v14 = objc_opt_new();
  v15 = objc_opt_new();
  if (self->_appIdentifier) {
    v16 = (__CFString *)self->_appIdentifier;
  }
  else {
    v16 = &stru_1EEC19158;
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __72__SLInteractionHandler_fetchInteractionsWithLimit_reason_variant_error___block_invoke;
  v22[3] = &unk_1E58A9E20;
  id v17 = v14;
  id v23 = v17;
  [v15 iterRankedHighlightsWithLimit:a3 client:v16 variant:v10 reason:v11 error:a6 block:v22];

  v18 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = [v17 count];
    *(_DWORD *)buf = 134217984;
    unint64_t v25 = v19;
    _os_log_impl(&dword_19BE17000, v18, OS_LOG_TYPE_INFO, "Obtained %lu results from PersonalizationPortrait", buf, 0xCu);
  }

  if (![v17 count])
  {
    v20 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[SLInteractionHandler fetchInteractionsWithLimit:reason:variant:error:](a6);
    }
  }
  return v17;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)fetchInteractionsWithLimit:(id *)a1 reason:variant:error:.cold.1(id *a1)
{
  v1 = [*a1 localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_19BE17000, v2, v3, "Failed to get any results from PersonalizationPortrait. %@", v4, v5, v6, v7, v8);
}

- (id)applicationIdentifier
{
  uint64_t v2 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (v2)
  {
    uint64_t v3 = v2;
    CFErrorRef error = 0;
    uint64_t v4 = (void *)SecTaskCopyValueForEntitlement(v2, @"application-identifier", &error);
    if (!v4)
    {
      uint64_t v4 = (void *)SecTaskCopyValueForEntitlement(v3, @"com.apple.application-identifier", &error);
      if (!v4)
      {
        uint64_t v5 = SLFrameworkLogHandle();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          [(SLInteractionHandler *)(uint64_t *)&error applicationIdentifier];
        }

        uint64_t v4 = 0;
      }
    }
    CFRelease(v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (SLInteractionHandler)init
{
  return [(SLInteractionHandler *)self initWithAppIdentifier:&stru_1EEC19158];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SLInteractionHandler;
  [(SLInteractionHandler *)&v2 dealloc];
}

- (id)fetchInteractionsWithLimit:(unint64_t)a3 variant:(id)a4 error:(id *)a5
{
  return [(SLInteractionHandler *)self fetchInteractionsWithLimit:a3 reason:0 variant:a4 error:a5];
}

void __72__SLInteractionHandler_fetchInteractionsWithLimit_reason_variant_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSClassFromString(&cfstr_Ppsocialcollab.isa);
  if (objc_opt_isKindOfClass())
  {
    id v8 = 0;
    uint64_t v4 = [[SLCollaborationHighlight alloc] initWithPortraitCollaborationHighlight:v3 error:&v8];
    id v5 = v8;
    if (!v4)
    {
      uint64_t v6 = SLFrameworkLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __72__SLInteractionHandler_fetchInteractionsWithLimit_reason_variant_error___block_invoke_cold_1(v5);
      }
LABEL_9:

      goto LABEL_10;
    }
  }
  else
  {
    id v7 = 0;
    uint64_t v4 = [[SLHighlight alloc] initWithPortraitHighlight:v3 error:&v7];
    id v5 = v7;
    if (!v4)
    {
      uint64_t v6 = SLFrameworkLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __72__SLInteractionHandler_fetchInteractionsWithLimit_reason_variant_error___block_invoke_cold_2(v5);
      }
      goto LABEL_9;
    }
  }
  [*(id *)(a1 + 32) addObject:v4];
LABEL_10:
}

- (id)fetchAttributionForAttributionIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v3;
    _os_log_impl(&dword_19BE17000, v4, OS_LOG_TYPE_INFO, "Fetching Attribution info for Attribution with Identifier %@ ", buf, 0xCu);
  }

  id v5 = objc_opt_new();
  id v13 = 0;
  uint64_t v6 = [v5 attributionForIdentifier:v3 error:&v13];
  id v7 = v13;
  if (v6)
  {
    id v12 = v7;
    id v8 = [[SLAttribution alloc] initWithPortraitAttribution:v6 error:&v12];
    id v9 = v12;

    if (v8) {
      goto LABEL_11;
    }
    id v10 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SLInteractionHandler fetchAttributionForAttributionIdentifier:](v9, v10);
    }
    id v7 = v9;
  }
  else
  {
    id v10 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SLInteractionHandler fetchAttributionForAttributionIdentifier:](v7);
    }
  }

  id v8 = 0;
  id v9 = v7;
LABEL_11:

  return v8;
}

- (void)feedbackForHighlightIdentifier:(id)a3 withType:(unint64_t)a4 variant:(id)a5 completionBlock:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    appIdentifier = self->_appIdentifier;
    int v17 = 138413058;
    id v18 = v10;
    __int16 v19 = 2048;
    unint64_t v20 = a4;
    __int16 v21 = 2112;
    v22 = appIdentifier;
    __int16 v23 = 2112;
    id v24 = v11;
    _os_log_impl(&dword_19BE17000, v13, OS_LOG_TYPE_INFO, "Feedback for highlight with identifier %@ of type %lu for application identifier: %@ variant: %@", (uint8_t *)&v17, 0x2Au);
  }

  if (a4 - 1 > 5) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = qword_19BED1550[a4 - 1];
  }
  uint64_t v16 = objc_opt_new();
  [v16 feedbackForHighlightIdentifier:v10 type:v15 client:self->_appIdentifier variant:v11 completion:v12];
}

- (void)setAppIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithAppIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 8);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_19BE17000, a2, OS_LOG_TYPE_DEBUG, "SLInteractionHandler init from daemon with app ID: %@", (uint8_t *)&v3, 0xCu);
}

- (void)initWithAppIdentifier:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19BE17000, log, OS_LOG_TYPE_ERROR, "SLInteractionHandler failed to generate an application identifier for the current process.", v1, 2u);
}

- (void)applicationIdentifier
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "SLInteractionHandler failed to generate an application identifier. Error: %@", (uint8_t *)&v3, 0xCu);
}

void __72__SLInteractionHandler_fetchInteractionsWithLimit_reason_variant_error___block_invoke_cold_1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_19BE17000, v2, v3, "Failed to initialize SLCollaborationHighlight due to. %@", v4, v5, v6, v7, v8);
}

void __72__SLInteractionHandler_fetchInteractionsWithLimit_reason_variant_error___block_invoke_cold_2(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_19BE17000, v2, v3, "Failed to initialize SLHighlight due to. %@", v4, v5, v6, v7, v8);
}

- (void)fetchAttributionForAttributionIdentifier:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_19BE17000, v2, v3, "Failed to get a result from PersonalizationPortrait. %@", v4, v5, v6, v7, v8);
}

- (void)fetchAttributionForAttributionIdentifier:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 localizedDescription];
  uint64_t v5 = [a1 localizedFailureReason];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "Failed to get a create SLAttribution from PPSocialAttribution. Localized description: %@. Localized failure reason: %@", (uint8_t *)&v6, 0x16u);
}

@end