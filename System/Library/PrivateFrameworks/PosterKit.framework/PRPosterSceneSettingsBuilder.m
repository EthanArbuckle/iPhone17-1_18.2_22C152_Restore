@interface PRPosterSceneSettingsBuilder
- (FBSDisplayConfiguration)displayConfiguration;
- (PRPosterSceneSettingsBuilder)init;
- (UITraitCollection)traitCollection;
- (id)buildWithPath:(id)a3 provider:(id)a4 configuredProperties:(id)a5 snapshotDefinition:(id)a6;
- (id)buildWithPath:(id)a3 snapshotDefinition:(id)a4;
- (int64_t)deviceOrientation;
- (int64_t)interfaceOrientation;
- (int64_t)snapshotOptions;
- (void)applySceneSettings:(id)a3;
- (void)applySnapshotDefinition:(id)a3;
- (void)reset;
- (void)setDeviceOrientation:(int64_t)a3;
- (void)setDisplayConfiguration:(id)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setSnapshotOptions:(int64_t)a3;
- (void)setTraitCollection:(id)a3;
@end

@implementation PRPosterSceneSettingsBuilder

- (PRPosterSceneSettingsBuilder)init
{
  v5.receiver = self;
  v5.super_class = (Class)PRPosterSceneSettingsBuilder;
  v2 = [(PRPosterSceneSettingsBuilder *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PRPosterSceneSettingsBuilder *)v2 reset];
  }
  return v3;
}

- (void)setDisplayConfiguration:(id)a3
{
  v4 = (FBSDisplayConfiguration *)a3;
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F62970]);
    v4 = [v5 mainConfiguration];
  }
  displayConfiguration = self->_displayConfiguration;
  self->_displayConfiguration = v4;
}

- (void)applySceneSettings:(id)a3
{
  id v5 = (void (**)(id, _PRPosterStagedSceneSettings *))a3;
  if (v5)
  {
    v4 = (void *)MEMORY[0x192F915E0]();
    v5[2](v5, self->_sceneSettings);
  }
}

- (void)applySnapshotDefinition:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__PRPosterSceneSettingsBuilder_applySnapshotDefinition___block_invoke;
    v6[3] = &unk_1E54DCE18;
    id v7 = v4;
    [(PRPosterSceneSettingsBuilder *)self applySceneSettings:v6];
  }
}

uint64_t __56__PRPosterSceneSettingsBuilder_applySnapshotDefinition___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) applySceneSettings:a2];
}

- (id)buildWithPath:(id)a3 snapshotDefinition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 serverIdentity];
  v9 = [v8 provider];
  v10 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v6];
  v11 = [v10 configuredProperties];
  if (v11)
  {
    v12 = [(PRPosterSceneSettingsBuilder *)self buildWithPath:v6 provider:v9 configuredProperties:v11 snapshotDefinition:v7];
  }
  else
  {
    v13 = +[PRPosterPathUtilities loadConfiguredPropertiesForPath:v6 error:0];
    v12 = [(PRPosterSceneSettingsBuilder *)self buildWithPath:v6 provider:v9 configuredProperties:v13 snapshotDefinition:v7];
  }
  return v12;
}

- (id)buildWithPath:(id)a3 provider:(id)a4 configuredProperties:(id)a5 snapshotDefinition:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v48 = 0;
  uint64_t v15 = [v11 extendContentsReadAccessToAuditToken:0 error:&v48];
  id v16 = v48;
  if (v15)
  {
    v17 = [v13 complicationLayout];
    v46 = (void *)v15;
    if ([v17 hasComplications]) {
      int v47 = [v14 includesComplications];
    }
    else {
      int v47 = 0;
    }

    unint64_t v18 = [(PRPosterSceneSettingsBuilder *)self snapshotOptions];
    v19 = self->_sceneSettings;
    [(_PRPosterStagedSceneSettings *)v19 pui_setProvider:v12];
    [(_PRPosterStagedSceneSettings *)v19 pui_setRole:*MEMORY[0x1E4F92840]];
    if (v14) {
      [(PRPosterSceneSettingsBuilder *)self applySnapshotDefinition:v14];
    }
    if (v18)
    {
      id v44 = v12;
      id v45 = v11;
      unsigned int IsFloatingLayerOnly = PRSPosterSnapshotOptionsIsFloatingLayerOnly();
      if ((v18 & 0x40) != 0) {
        double v20 = 1.0;
      }
      else {
        double v20 = 0.0;
      }
      v21 = [v13 complicationLayout];
      v22 = [v21 inlineComplication];
      uint64_t v23 = (v18 >> 2) & 1;
      if (v22) {
        unsigned int v41 = [v14 includesComplications] & v23;
      }
      else {
        unsigned int v41 = 0;
      }

      v24 = [v21 complications];
      id v43 = v16;
      if ([v24 count]) {
        uint64_t v25 = [v14 includesComplications] & v23;
      }
      else {
        uint64_t v25 = 0;
      }

      v26 = [v13 titleStyleConfiguration];
      unsigned int v27 = [v26 prefersVerticalTitleLayout];

      v28 = [v21 sidebarComplications];
      if ([v28 count]) {
        uint64_t v29 = [v14 includesComplications] & v23;
      }
      else {
        uint64_t v29 = 0;
      }

      uint64_t v30 = PRIsDepthEffectDisallowed((unint64_t)([(PRPosterSceneSettingsBuilder *)self interfaceOrientation] - 1) < 2, v25, v27);
      [(_PRPosterStagedSceneSettings *)v19 pui_setInlineComplicationConfigured:v41];
      [(_PRPosterStagedSceneSettings *)v19 pui_setComplicationRowConfigured:v25];
      [(_PRPosterStagedSceneSettings *)v19 pui_setComplicationSidebarConfigured:v29];
      [(_PRPosterStagedSceneSettings *)v19 pr_setDepthEffectDisallowed:v30];
      [(_PRPosterStagedSceneSettings *)v19 pr_setUnlockProgress:v20];
      if ((v18 & 2) != 0) {
        uint64_t v31 = [v14 includesHeaderElements];
      }
      else {
        uint64_t v31 = 0;
      }
      id v12 = v44;
      [(_PRPosterStagedSceneSettings *)v19 pui_setShowsHeaderElements:v31];
      [(_PRPosterStagedSceneSettings *)v19 pui_setFloatingLayerSnapshot:IsFloatingLayerOnly];
      [(_PRPosterStagedSceneSettings *)v19 pui_setContent:(v18 >> 7) & 1];
      [(_PRPosterStagedSceneSettings *)v19 pui_setShowsComplications:v47 & (v18 >> 2)];

      id v11 = v45;
      id v16 = v43;
    }
    [(_PRPosterStagedSceneSettings *)v19 pui_setSnapshot:1];
    if (![(PRPosterSceneSettingsBuilder *)self interfaceOrientation])
    {
      v32 = [v46 role];
      int v33 = [v32 isEqualToString:@"PRPosterRoleAmbient"];

      if (v33)
      {
        [(PRPosterSceneSettingsBuilder *)self setInterfaceOrientation:4];
        [(PRPosterSceneSettingsBuilder *)self setDeviceOrientation:1];
      }
    }
    if (((![(_PRPosterStagedSceneSettings *)v19 pui_showsComplications] | v47) & 1) == 0) {
      [(_PRPosterStagedSceneSettings *)v19 pui_setShowsComplications:0];
    }
    v34 = objc_opt_new();
    v35 = [(PRPosterSceneSettingsBuilder *)self displayConfiguration];
    [v34 setDisplayConfiguration:v35];

    objc_msgSend(v34, "setDeviceOrientation:", -[PRPosterSceneSettingsBuilder deviceOrientation](self, "deviceOrientation"));
    objc_msgSend(v34, "setInterfaceOrientation:", -[PRPosterSceneSettingsBuilder interfaceOrientation](self, "interfaceOrientation"));
    v36 = [(PRPosterSceneSettingsBuilder *)self traitCollection];
    [v34 setTraitCollection:v36];

    [v34 setProvider:v12];
    [v34 setSceneSettings:v19];
    [v34 setSnapshotOptions:self->_snapshotOptions];
    v37 = [v13 titleStyleConfiguration];
    [v34 setTitleStyleConfiguration:v37];

    v38 = [v13 ambientConfiguration];
    [v34 setAmbientConfiguration:v38];

    [v34 setPath:v46];
    return v34;
  }
  else
  {
    v40 = [NSString stringWithFormat:@"failed to create path for scene settings of %@ : %@", self, v16];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterSceneSettingsBuilder buildWithPath:provider:configuredProperties:snapshotDefinition:](a2, (uint64_t)self, (uint64_t)v40);
    }
    [v40 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)reset
{
  v3 = (_PRPosterStagedSceneSettings *)objc_opt_new();
  sceneSettings = self->_sceneSettings;
  self->_sceneSettings = v3;

  self->_interfaceOrientation = 0;
  self->_deviceOrientation = 0;
  id v6 = objc_alloc_init(MEMORY[0x1E4F62970]);
  id v5 = [v6 mainConfiguration];
  [(PRPosterSceneSettingsBuilder *)self setDisplayConfiguration:v5];
  [(PRPosterSceneSettingsBuilder *)self setInterfaceOrientation:1];
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  self->_deviceOrientation = a3;
}

- (int64_t)snapshotOptions
{
  return self->_snapshotOptions;
}

- (void)setSnapshotOptions:(int64_t)a3
{
  self->_snapshotOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_sceneSettings, 0);
}

- (void)buildWithPath:(uint64_t)a3 provider:configuredProperties:snapshotDefinition:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  uint64_t v15 = @"PRPosterSceneSettings.m";
  __int16 v16 = 1024;
  int v17 = 194;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_18C1C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end