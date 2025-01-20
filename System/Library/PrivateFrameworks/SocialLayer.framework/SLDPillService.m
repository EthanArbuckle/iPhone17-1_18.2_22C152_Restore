@interface SLDPillService
+ (id)remoteObjectProtocol;
+ (id)sharedService;
- (UISSlotMachine)highlightDisambiguationPillSlotMachine;
- (UISSlotMachine)highlightPillSlotMachine;
- (id)_applicationIdentifierForConnection:(id)a3;
- (id)_attributionsFromIDs:(id)a3 appID:(id)a4;
- (id)slotMachineForViewIdentifier:(id)a3;
- (void)accessibilityLabelForAttributionIdentifier:(id)a3 reply:(id)a4;
- (void)accessibilityLabelForAttributionIdentifiers:(id)a3 reply:(id)a4;
- (void)highlightDisambiguationPillForAttributionIdentifier:(id)a3 style:(id)a4 maxWidth:(double)a5 variant:(unint64_t)a6 layerContextID:(unint64_t)a7 reply:(id)a8;
- (void)highlightPillForAttributionIdentifiers:(id)a3 style:(id)a4 maxWidth:(double)a5 variant:(unint64_t)a6 layerContextID:(unint64_t)a7 reply:(id)a8;
- (void)setHighlightDisambiguationPillSlotMachine:(id)a3;
- (void)setHighlightPillSlotMachine:(id)a3;
@end

@implementation SLDPillService

+ (id)remoteObjectProtocol
{
  return &unk_1EEC494A0;
}

+ (id)sharedService
{
  if (sharedService_onceToken_5 != -1) {
    dispatch_once(&sharedService_onceToken_5, &__block_literal_global_12);
  }
  v2 = (void *)sharedService_sService_5;
  return v2;
}

uint64_t __31__SLDPillService_sharedService__block_invoke()
{
  v0 = objc_alloc_init(SLDPillService);
  uint64_t v1 = sharedService_sService_5;
  sharedService_sService_5 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (UISSlotMachine)highlightPillSlotMachine
{
  highlightPillSlotMachine = self->_highlightPillSlotMachine;
  if (!highlightPillSlotMachine)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB3480]);
    v5 = objc_alloc_init(SLDHighlightPillSlotDrawer);
    v6 = (UISSlotMachine *)[v4 initWithSlotDrawer:v5 options:0];
    v7 = self->_highlightPillSlotMachine;
    self->_highlightPillSlotMachine = v6;

    highlightPillSlotMachine = self->_highlightPillSlotMachine;
  }
  return highlightPillSlotMachine;
}

- (UISSlotMachine)highlightDisambiguationPillSlotMachine
{
  highlightDisambiguationPillSlotMachine = self->_highlightDisambiguationPillSlotMachine;
  if (!highlightDisambiguationPillSlotMachine)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB3480]);
    v5 = objc_alloc_init(SLDHighlightDisambiguationPillSlotDrawer);
    v6 = (UISSlotMachine *)[v4 initWithSlotDrawer:v5 options:0];
    v7 = self->_highlightDisambiguationPillSlotMachine;
    self->_highlightDisambiguationPillSlotMachine = v6;

    highlightDisambiguationPillSlotMachine = self->_highlightDisambiguationPillSlotMachine;
  }
  return highlightDisambiguationPillSlotMachine;
}

- (void)highlightPillForAttributionIdentifiers:(id)a3 style:(id)a4 maxWidth:(double)a5 variant:(unint64_t)a6 layerContextID:(unint64_t)a7 reply:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  v16 = (void (**)(id, void))a8;
  if (a5 <= 0.0)
  {
    v25 = SLDaemonLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[SLDPillService highlightPillForAttributionIdentifiers:style:maxWidth:variant:layerContextID:reply:].cold.4();
    }

    v16[2](v16, 0);
  }
  else
  {
    v17 = [MEMORY[0x1E4F29268] currentConnection];
    v18 = [(SLDPillService *)self _applicationIdentifierForConnection:v17];
    if (v18)
    {
      v19 = [(SLDPillService *)self _attributionsFromIDs:v14 appID:v18];
      uint64_t v20 = [v19 count];
      if (v17 && v20)
      {
        v29 = v19;
        v21 = +[SLDHighlightPillSlotTag tagForHighlightAttributions:maxWidth:maxSendersToDisplay:variant:](SLDHighlightPillSlotTag, "tagForHighlightAttributions:maxWidth:maxSendersToDisplay:variant:", v19, +[SLHighlightPillMetrics maxSendersToDisplayWithStyle:v15 variant:a6], a6, a5);
        v22 = [v21 resolvedStyleForStyle:v15];
        v30 = [[SLHighlightPillMetrics alloc] initWithSlotStyle:v15 tag:v21 variant:a6];
        if ([(SLHighlightPillMetrics *)v30 hasValidMetricsForDrawing])
        {
          v23 = [(SLDRemoteRenderingService *)self _viewIDForStyle:v22 tag:v21];
          [(SLDRemoteRenderingService *)self _connection:v17 onlyNeedsViewWithIdentifier:v23];
          v24 = [(SLDRemoteRenderingService *)self _remoteContentForViewIdentifier:v23 layerContextID:a7 connection:v17];
          ((void (**)(id, void *))v16)[2](v16, v24);
          [(SLDRemoteRenderingService *)self _connectionTouchedView:v23];
          CTFontRemoveFromCaches();
          CGFontCacheGetLocalCache();
          CGFontCacheReset();
        }
        else
        {
          v28 = SLDaemonLogHandle();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            -[SLDPillService highlightPillForAttributionIdentifiers:style:maxWidth:variant:layerContextID:reply:]((uint64_t)self, v28, a5);
          }

          v16[2](v16, 0);
        }

        v19 = v29;
      }
      else
      {
        v27 = SLDaemonLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[SLDPillService highlightPillForAttributionIdentifiers:style:maxWidth:variant:layerContextID:reply:]();
        }

        v16[2](v16, 0);
      }
    }
    else
    {
      v26 = SLDaemonLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[SLDPillService highlightPillForAttributionIdentifiers:style:maxWidth:variant:layerContextID:reply:]();
      }

      v16[2](v16, 0);
    }
  }
}

- (void)highlightDisambiguationPillForAttributionIdentifier:(id)a3 style:(id)a4 maxWidth:(double)a5 variant:(unint64_t)a6 layerContextID:(unint64_t)a7 reply:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  v16 = (void (**)(id, void))a8;
  if (a5 <= 0.0)
  {
    v25 = SLDaemonLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[SLDPillService highlightPillForAttributionIdentifiers:style:maxWidth:variant:layerContextID:reply:].cold.4();
    }

    v16[2](v16, 0);
  }
  else
  {
    v17 = [MEMORY[0x1E4F29268] currentConnection];
    v18 = [(SLDPillService *)self _applicationIdentifierForConnection:v17];
    if (v18)
    {
      v19 = [[SLHighlightCenter alloc] initWithAppIdentifier:v18];
      uint64_t v20 = [(SLHighlightCenter *)v19 fetchAttributionForAttributionIdentifier:v14];
      v21 = (void *)v20;
      if (v17 && v20)
      {
        v22 = +[SLDHighlightDisambiguationPillSlotTag tagForHighlightAttribution:v20 maxWidth:a6 variant:a5];
        v28 = [v22 resolvedStyleForStyle:v15];
        [(SLDRemoteRenderingService *)self _viewIDForStyle:v28 tag:v22];
        v23 = v29 = v19;
        [(SLDRemoteRenderingService *)self _connection:v17 onlyNeedsViewWithIdentifier:v23];
        v24 = [(SLDRemoteRenderingService *)self _remoteContentForViewIdentifier:v23 layerContextID:a7 connection:v17];
        ((void (**)(id, void *))v16)[2](v16, v24);
        [(SLDRemoteRenderingService *)self _connectionTouchedView:v23];
        CTFontRemoveFromCaches();
        CGFontCacheGetLocalCache();
        CGFontCacheReset();

        v19 = v29;
      }
      else
      {
        v27 = SLDaemonLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[SLDPillService highlightPillForAttributionIdentifiers:style:maxWidth:variant:layerContextID:reply:]();
        }

        v16[2](v16, 0);
      }
    }
    else
    {
      v26 = SLDaemonLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[SLDPillService highlightPillForAttributionIdentifiers:style:maxWidth:variant:layerContextID:reply:]();
      }

      v16[2](v16, 0);
    }
  }
}

- (void)accessibilityLabelForAttributionIdentifiers:(id)a3 reply:(id)a4
{
  id v13 = a3;
  v6 = (void (**)(id, void))a4;
  v7 = [MEMORY[0x1E4F29268] currentConnection];
  if (SLDConnectionIsEntitledForAccessibility(v7))
  {
    v8 = [(SLDPillService *)self _attributionsFromIDs:v13 appID:@"accessibility"];
    uint64_t v9 = [v8 count];
    if (v7) {
      BOOL v10 = v9 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      v6[2](v6, 0);
    }
    else
    {
      v11 = +[SLDHighlightPillSlotTag tagForHighlightAttributions:v8 maxWidth:3 maxSendersToDisplay:0 variant:1000.0];
      v12 = +[SLHighlightPillMetrics accessibilityLabelFor:v11];
      ((void (**)(id, void *))v6)[2](v6, v12);
    }
  }
  else
  {
    v6[2](v6, 0);
    [v7 invalidate];
  }
}

- (void)accessibilityLabelForAttributionIdentifier:(id)a3 reply:(id)a4
{
  id v12 = a3;
  v5 = (void (**)(id, void *))a4;
  v6 = [MEMORY[0x1E4F29268] currentConnection];
  if (SLDConnectionIsEntitledForAccessibility(v6))
  {
    v7 = [[SLHighlightCenter alloc] initWithAppIdentifier:@"accessibility"];
    uint64_t v8 = [(SLHighlightCenter *)v7 fetchAttributionForAttributionIdentifier:v12];
    uint64_t v9 = (void *)v8;
    if (v6 && v8)
    {
      BOOL v10 = +[SLDHighlightDisambiguationPillSlotTag tagForHighlightAttribution:v8 maxWidth:0 variant:1000.0];
      v11 = +[SLHighlightDisambiguationPillMetrics accessibilityLabelFor:v10];
      v5[2](v5, v11);
    }
    else
    {
      v5[2](v5, 0);
    }
  }
  else
  {
    v5[2](v5, 0);
    [v6 invalidate];
  }
}

- (id)_applicationIdentifierForConnection:(id)a3
{
  id v4 = a3;
  v5 = v4;
  v6 = (void *)MEMORY[0x1E4F223F8];
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  id v13 = 0;
  v7 = [v6 bundleRecordForAuditToken:v14 error:&v13];
  id v8 = v13;
  uint64_t v9 = [v7 applicationIdentifier];

  if (!v9)
  {
    BOOL v10 = SLDaemonLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(SLDPillService *)(uint64_t)self _applicationIdentifierForConnection:v10];
    }
  }
  v11 = [v7 applicationIdentifier];

  return v11;
}

- (id)_attributionsFromIDs:(id)a3 appID:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [[SLHighlightCenter alloc] initWithAppIdentifier:v6];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = -[SLHighlightCenter fetchAttributionForAttributionIdentifier:](v8, "fetchAttributionForAttributionIdentifier:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        if (v14) {
          [v7 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  id v15 = (void *)[v7 copy];
  return v15;
}

- (id)slotMachineForViewIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [v4 tag];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v7 = [(SLDPillService *)self highlightPillSlotMachine];
LABEL_5:
    uint64_t v10 = (void *)v7;
    goto LABEL_7;
  }
  id v8 = [v4 tag];
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();

  if (v9)
  {
    uint64_t v7 = [(SLDPillService *)self highlightDisambiguationPillSlotMachine];
    goto LABEL_5;
  }
  uint64_t v10 = 0;
LABEL_7:

  return v10;
}

- (void)setHighlightPillSlotMachine:(id)a3
{
}

- (void)setHighlightDisambiguationPillSlotMachine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightDisambiguationPillSlotMachine, 0);
  objc_storeStrong((id *)&self->_highlightPillSlotMachine, 0);
}

- (void)highlightPillForAttributionIdentifiers:style:maxWidth:variant:layerContextID:reply:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[SLDPillService: %p] Cannot generate a pill without an application identifier for the client.", v2, v3, v4, v5, v6);
}

- (void)highlightPillForAttributionIdentifiers:(double)a3 style:maxWidth:variant:layerContextID:reply:.cold.2(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "[SLDPillService: %p] metrics for the given request are invalid. This may mean the maxWidth provided was invalid (maxWidth: %f). No pill will be drawn.", (uint8_t *)&v3, 0x16u);
}

- (void)highlightPillForAttributionIdentifiers:style:maxWidth:variant:layerContextID:reply:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[SLDPillService: %p] Cannot generate a pill without attributions.", v2, v3, v4, v5, v6);
}

- (void)highlightPillForAttributionIdentifiers:style:maxWidth:variant:layerContextID:reply:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[SLDPillService: %p] 0.0 was provided for the max width of the requested pill. This is undefined behavior and should be sanitized before invoking this xpc interface!", v2, v3, v4, v5, v6);
}

- (void)_applicationIdentifierForConnection:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint8_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  OUTLINED_FUNCTION_3();
  __int16 v9 = 2048;
  uint64_t v10 = a1;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_error_impl(&dword_19BE17000, a3, OS_LOG_TYPE_ERROR, "[%@: %p] Failed to generate a bundle record, or the record's app ID is nil. This is required to look up attribution data. Error: %@", v8, 0x20u);
}

@end