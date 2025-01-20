@interface SLDCollaborationAttributionViewService
+ (id)remoteObjectProtocol;
+ (id)sharedService;
+ (void)setupInterface:(id)a3;
- (UISSlotMachine)slotMachine;
- (id)_applicationIdentifierForConnection:(id)a3;
- (id)_attributionsFromIDs:(id)a3 appID:(id)a4;
- (id)slotMachineForViewIdentifier:(id)a3;
- (void)accessibilityLabelForAttributionIdentifiers:(id)a3 reply:(id)a4;
- (void)collaborationAttributionViewForTitle:(id)a3 attributionIdentifiers:(id)a4 style:(id)a5 placeholderGlyphConfiguration:(id)a6 maxWidth:(double)a7 variant:(int64_t)a8 layerContextID:(unint64_t)a9 reply:(id)a10;
- (void)setSlotMachine:(id)a3;
@end

@implementation SLDCollaborationAttributionViewService

+ (id)remoteObjectProtocol
{
  return &unk_1EEC4FB28;
}

+ (id)sharedService
{
  if (sharedService_onceToken_10 != -1) {
    dispatch_once(&sharedService_onceToken_10, &__block_literal_global_21);
  }
  v2 = (void *)sharedService_sService_10;
  return v2;
}

uint64_t __55__SLDCollaborationAttributionViewService_sharedService__block_invoke()
{
  v0 = objc_alloc_init(SLDCollaborationAttributionViewService);
  uint64_t v1 = sharedService_sService_10;
  sharedService_sService_10 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (void)setupInterface:(id)a3
{
  id v3 = a3;
  [v3 setClass:objc_opt_class() forSelector:sel_collaborationAttributionViewForTitle_attributionIdentifiers_style_placeholderGlyphConfiguration_maxWidth_variant_layerContextID_reply_ argumentIndex:4 ofReply:0];
}

- (void)collaborationAttributionViewForTitle:(id)a3 attributionIdentifiers:(id)a4 style:(id)a5 placeholderGlyphConfiguration:(id)a6 maxWidth:(double)a7 variant:(int64_t)a8 layerContextID:(unint64_t)a9 reply:(id)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  v21 = (void (**)(id, void))a10;
  if (a7 <= 0.0)
  {
    v30 = SLDaemonLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[SLDCollaborationAttributionViewService collaborationAttributionViewForTitle:attributionIdentifiers:style:placeholderGlyphConfiguration:maxWidth:variant:layerContextID:reply:].cold.4();
    }

    v21[2](v21, 0);
  }
  else
  {
    id v37 = v17;
    v22 = [MEMORY[0x1E4F29268] currentConnection];
    v23 = [(SLDCollaborationAttributionViewService *)self _applicationIdentifierForConnection:v22];
    if (v23)
    {
      v24 = [(SLDCollaborationAttributionViewService *)self _attributionsFromIDs:v18 appID:v23];
      uint64_t v25 = [v24 count];
      if (v22 && v25)
      {
        v26 = +[SLDCollaborationAttributionViewSlotTag tagForTitle:v37 attributions:v24 placeholderGlyphConfiguration:v20 maxWidth:a8 variant:a7];
        v35 = +[SLDCollaborationAttributionViewSlotDrawer resolvedStyleForStyle:v19 tag:v26];
        [(SLDRemoteRenderingService *)self _viewIDForStyle:v35 tag:v26];
        v27 = v36 = v24;
        [(SLDRemoteRenderingService *)self _connection:v22 onlyNeedsViewWithIdentifier:v27];
        v28 = [(SLDRemoteRenderingService *)self _remoteContentForViewIdentifier:v27 layerContextID:a9 connection:v22];
        ((void (**)(id, void *))v21)[2](v21, v28);
        [(SLDRemoteRenderingService *)self _connectionTouchedView:v27];

        v29 = v36;
      }
      else
      {
        v29 = v24;
        uint64_t v32 = [v18 count];
        v33 = SLDaemonLogHandle();
        BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
        if (v32)
        {
          if (v34) {
            -[SLDCollaborationAttributionViewService collaborationAttributionViewForTitle:attributionIdentifiers:style:placeholderGlyphConfiguration:maxWidth:variant:layerContextID:reply:]();
          }
        }
        else if (v34)
        {
          -[SLDCollaborationAttributionViewService collaborationAttributionViewForTitle:attributionIdentifiers:style:placeholderGlyphConfiguration:maxWidth:variant:layerContextID:reply:]();
        }

        v21[2](v21, 0);
      }
    }
    else
    {
      v31 = SLDaemonLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[SLDCollaborationAttributionViewService collaborationAttributionViewForTitle:attributionIdentifiers:style:placeholderGlyphConfiguration:maxWidth:variant:layerContextID:reply:]();
      }

      v21[2](v21, 0);
    }

    id v17 = v37;
  }
}

- (void)accessibilityLabelForAttributionIdentifiers:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  v8 = [MEMORY[0x1E4F29268] currentConnection];
  if (SLDConnectionIsEntitledForAccessibility(v8))
  {
    v9 = [(SLDCollaborationAttributionViewService *)self _attributionsFromIDs:v6 appID:@"accessibility"];
    uint64_t v10 = [v9 count];
    if (v8) {
      BOOL v11 = v10 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      uint64_t v12 = [v6 count];
      v13 = SLDaemonLogHandle();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      if (v12)
      {
        if (v14) {
          -[SLDCollaborationAttributionViewService accessibilityLabelForAttributionIdentifiers:reply:]();
        }
      }
      else if (v14)
      {
        -[SLDCollaborationAttributionViewService accessibilityLabelForAttributionIdentifiers:reply:]();
      }

      v7[2](v7, 0);
    }
    else
    {
      v16 = +[SLDImageSymbolConfiguration configurationWithName:@"person.crop.circle.badge.checkmark" coreUISize:0 weight:0 pointSize:12.0];
      id v17 = +[SLDCollaborationAttributionViewSlotTag tagForTitle:&stru_1EEC19158 attributions:v9 placeholderGlyphConfiguration:v16 maxWidth:0 variant:1000.0];
      id v18 = +[SLDCollaborationAttributionViewRenderer accessibilityLabelForTag:v17];
      ((void (**)(id, void *))v7)[2](v7, v18);
    }
  }
  else
  {
    v15 = SLDaemonLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SLDCollaborationAttributionViewService accessibilityLabelForAttributionIdentifiers:reply:]();
    }

    v7[2](v7, 0);
    [v8 invalidate];
  }
}

- (UISSlotMachine)slotMachine
{
  slotMachine = self->_slotMachine;
  if (!slotMachine)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB3480]);
    v5 = objc_alloc_init(SLDCollaborationAttributionViewSlotDrawer);
    id v6 = (UISSlotMachine *)[v4 initWithSlotDrawer:v5 options:0];
    v7 = self->_slotMachine;
    self->_slotMachine = v6;

    slotMachine = self->_slotMachine;
  }
  return slotMachine;
}

- (id)slotMachineForViewIdentifier:(id)a3
{
  id v4 = [a3 tag];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(SLDCollaborationAttributionViewService *)self slotMachine];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)_applicationIdentifierForConnection:(id)a3
{
  id v4 = a3;
  v5 = v4;
  id v6 = (void *)MEMORY[0x1E4F223F8];
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  id v13 = 0;
  v7 = [v6 bundleRecordForAuditToken:v14 error:&v13];
  id v8 = v13;
  v9 = [v7 applicationIdentifier];

  if (!v9)
  {
    uint64_t v10 = SLDaemonLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(SLDPillService *)(uint64_t)self _applicationIdentifierForConnection:v10];
    }
  }
  BOOL v11 = [v7 applicationIdentifier];

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
        BOOL v14 = -[SLHighlightCenter fetchAttributionForAttributionIdentifier:](v8, "fetchAttributionForAttributionIdentifier:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        if (v14) {
          [v7 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  v15 = (void *)[v7 copy];
  return v15;
}

- (void)setSlotMachine:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)collaborationAttributionViewForTitle:attributionIdentifiers:style:placeholderGlyphConfiguration:maxWidth:variant:layerContextID:reply:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[SLDCollaborationAttributionViewService: %p] Cannot generate a collaboration attribution view remote content without an application identifier for the client.", v2, v3, v4, v5, v6);
}

- (void)collaborationAttributionViewForTitle:attributionIdentifiers:style:placeholderGlyphConfiguration:maxWidth:variant:layerContextID:reply:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[SLDCollaborationAttributionViewService: %p] No attribution IDs were given. This is a client-side bug and appropriate checks should be in place to prevent this. Not generating collaboration attribution view remote content", v2, v3, v4, v5, v6);
}

- (void)collaborationAttributionViewForTitle:attributionIdentifiers:style:placeholderGlyphConfiguration:maxWidth:variant:layerContextID:reply:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19BE17000, v0, v1, "[SLDCollaborationAttributionViewService: %p] Not generating collaboration attribution view remote content because there were no attributions for the given attribution IDs. This could be because the highlight center failed to fetch the corresponding attributions. attributionIDs: %@");
}

- (void)collaborationAttributionViewForTitle:attributionIdentifiers:style:placeholderGlyphConfiguration:maxWidth:variant:layerContextID:reply:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[SLDCollaborationAttributionViewService: %p] 0.0 was provided for the max width of the requested view. This is undefined behavior and should be sanitized before invoking this xpc interface!", v2, v3, v4, v5, v6);
}

- (void)accessibilityLabelForAttributionIdentifiers:reply:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[SLDCollaborationAttributionViewService: %p] No attribution IDs were given. This is a client-side bug and appropriate checks should be in place to prevent this. Not generating collaboration attribution accessibility label", v2, v3, v4, v5, v6);
}

- (void)accessibilityLabelForAttributionIdentifiers:reply:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19BE17000, v0, v1, "[SLDCollaborationAttributionViewService: %p] Not generating collaboration attribution accessibility label because there were no attributions for the given attribution IDs. This could be because the highlight center failed to fetch the corresponding attributions. attributionIDs: %@");
}

- (void)accessibilityLabelForAttributionIdentifiers:reply:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[SLDCollaborationAttributionViewService: %p] Cannot generate a collaboration attribution accessibility label for a connection without an accessibility entitlement.", v2, v3, v4, v5, v6);
}

@end