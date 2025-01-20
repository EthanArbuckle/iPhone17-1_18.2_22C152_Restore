@interface NTKComplicationControllerDisplayProperties
- (BOOL)defaultTapAnimationEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)showPreview;
- (BOOL)showsInLowLuminance;
- (BOOL)showsWhenLocked;
- (BOOL)supportsTinting;
- (BOOL)supportsWatchGestureInteraction;
- (BOOL)tapEnabled;
- (BOOL)widgetHostPriorityTransientSnapshot;
- (BOOL)widgetRequiresSnapshot;
- (BOOL)widgetShowsSnapshot;
- (NSString)launchLocation;
- (NSString)widgetConfigurationIdentifier;
- (NTKComplicationControllerDisplayProperties)init;
- (id)_initWithDisplayProperties:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)faceDataMode;
- (unint64_t)hash;
- (unint64_t)visibility;
@end

@implementation NTKComplicationControllerDisplayProperties

- (NTKComplicationControllerDisplayProperties)init
{
  v7.receiver = self;
  v7.super_class = (Class)NTKComplicationControllerDisplayProperties;
  v2 = [(NTKComplicationControllerDisplayProperties *)&v7 init];
  v3 = v2;
  if (v2)
  {
    launchLocation = v2->_launchLocation;
    v2->_faceDataMode = 0;
    v2->_launchLocation = 0;

    *(_WORD *)&v3->_tapEnabled = 257;
    v3->_supportsWatchGestureInteraction = 0;
    v3->_visibility = 0;
    *(_WORD *)&v3->_supportsTinting = 257;
    v3->_showsInLowLuminance = 1;
    widgetConfigurationIdentifier = v3->_widgetConfigurationIdentifier;
    v3->_widgetConfigurationIdentifier = 0;

    *(_DWORD *)&v3->_widgetShowsSnapshot = 1;
  }
  return v3;
}

- (id)_initWithDisplayProperties:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKComplicationControllerDisplayProperties;
  v5 = [(NTKComplicationControllerDisplayProperties *)&v12 init];
  v6 = v5;
  if (v5)
  {
    v5->_faceDataMode = *((void *)v4 + 1);
    uint64_t v7 = [*((id *)v4 + 2) copy];
    launchLocation = v6->_launchLocation;
    v6->_launchLocation = (NSString *)v7;

    v6->_tapEnabled = *((unsigned char *)v4 + 24);
    v6->_defaultTapAnimationEnabled = *((unsigned char *)v4 + 25);
    v6->_supportsWatchGestureInteraction = *((unsigned char *)v4 + 26);
    v6->_visibility = *((void *)v4 + 4);
    v6->_supportsTinting = *((unsigned char *)v4 + 40);
    v6->_showsWhenLocked = *((unsigned char *)v4 + 41);
    v6->_showsInLowLuminance = *((unsigned char *)v4 + 42);
    uint64_t v9 = [*((id *)v4 + 6) copy];
    widgetConfigurationIdentifier = v6->_widgetConfigurationIdentifier;
    v6->_widgetConfigurationIdentifier = (NSString *)v9;

    v6->_widgetShowsSnapshot = *((unsigned char *)v4 + 56);
    v6->_widgetRequiresSnapshot = *((unsigned char *)v4 + 57);
    v6->_widgetHostPriorityTransientSnapshot = *((unsigned char *)v4 + 58);
    v6->_showPreview = *((unsigned char *)v4 + 59);
  }

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[NTKMutableComplicationControllerDisplayProperties allocWithZone:a3];
  return [(NTKComplicationControllerDisplayProperties *)v4 _initWithDisplayProperties:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ([(NTKComplicationControllerDisplayProperties *)self isMemberOfClass:objc_opt_class()])
  {
    return self;
  }
  else
  {
    v5 = +[NTKComplicationControllerDisplayProperties allocWithZone:a3];
    return [(NTKComplicationControllerDisplayProperties *)v5 _initWithDisplayProperties:self];
  }
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendInteger:self->_faceDataMode];
  id v5 = (id)[v3 appendString:self->_launchLocation];
  id v6 = (id)[v3 appendBool:self->_tapEnabled];
  id v7 = (id)[v3 appendBool:self->_defaultTapAnimationEnabled];
  id v8 = (id)[v3 appendBool:self->_supportsWatchGestureInteraction];
  id v9 = (id)[v3 appendUnsignedInteger:self->_visibility];
  id v10 = (id)[v3 appendBool:self->_supportsTinting];
  id v11 = (id)[v3 appendBool:self->_showsWhenLocked];
  id v12 = (id)[v3 appendBool:self->_showsInLowLuminance];
  id v13 = (id)[v3 appendString:self->_widgetConfigurationIdentifier];
  id v14 = (id)[v3 appendBool:self->_widgetShowsSnapshot];
  id v15 = (id)[v3 appendBool:self->_widgetRequiresSnapshot];
  id v16 = (id)[v3 appendBool:self->_widgetHostPriorityTransientSnapshot];
  id v17 = (id)[v3 appendBool:self->_showPreview];
  unint64_t v18 = [v3 hash];

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  int64_t faceDataMode = self->_faceDataMode;
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke;
  v78[3] = &unk_1E62C24A0;
  id v7 = v4;
  id v79 = v7;
  id v8 = (id)[v5 appendInteger:faceDataMode counterpart:v78];
  launchLocation = self->_launchLocation;
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_2;
  v76[3] = &unk_1E62C39F8;
  id v10 = v7;
  id v77 = v10;
  id v11 = (id)[v5 appendString:launchLocation counterpart:v76];
  BOOL tapEnabled = self->_tapEnabled;
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_3;
  v74[3] = &unk_1E62C10A8;
  id v13 = v10;
  id v75 = v13;
  id v14 = (id)[v5 appendBool:tapEnabled counterpart:v74];
  BOOL defaultTapAnimationEnabled = self->_defaultTapAnimationEnabled;
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_4;
  v72[3] = &unk_1E62C10A8;
  id v16 = v13;
  id v73 = v16;
  id v17 = (id)[v5 appendBool:defaultTapAnimationEnabled counterpart:v72];
  BOOL supportsWatchGestureInteraction = self->_supportsWatchGestureInteraction;
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_5;
  v70[3] = &unk_1E62C10A8;
  id v19 = v16;
  id v71 = v19;
  id v20 = (id)[v5 appendBool:supportsWatchGestureInteraction counterpart:v70];
  unint64_t visibility = self->_visibility;
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_6;
  v68[3] = &unk_1E62C3A20;
  id v22 = v19;
  id v69 = v22;
  id v23 = (id)[v5 appendUnsignedInteger:visibility counterpart:v68];
  BOOL supportsTinting = self->_supportsTinting;
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_7;
  v66[3] = &unk_1E62C10A8;
  id v25 = v22;
  id v67 = v25;
  id v26 = (id)[v5 appendBool:supportsTinting counterpart:v66];
  BOOL showsWhenLocked = self->_showsWhenLocked;
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_8;
  v64[3] = &unk_1E62C10A8;
  id v28 = v25;
  id v65 = v28;
  id v29 = (id)[v5 appendBool:showsWhenLocked counterpart:v64];
  BOOL showsInLowLuminance = self->_showsInLowLuminance;
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_9;
  v62[3] = &unk_1E62C10A8;
  id v31 = v28;
  id v63 = v31;
  id v32 = (id)[v5 appendBool:showsInLowLuminance counterpart:v62];
  widgetConfigurationIdentifier = self->_widgetConfigurationIdentifier;
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_10;
  v60[3] = &unk_1E62C39F8;
  id v34 = v31;
  id v61 = v34;
  id v35 = (id)[v5 appendString:widgetConfigurationIdentifier counterpart:v60];
  BOOL widgetShowsSnapshot = self->_widgetShowsSnapshot;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_11;
  v58[3] = &unk_1E62C10A8;
  id v37 = v34;
  id v59 = v37;
  id v38 = (id)[v5 appendBool:widgetShowsSnapshot counterpart:v58];
  BOOL widgetRequiresSnapshot = self->_widgetRequiresSnapshot;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_12;
  v56[3] = &unk_1E62C10A8;
  id v40 = v37;
  id v57 = v40;
  id v41 = (id)[v5 appendBool:widgetRequiresSnapshot counterpart:v56];
  BOOL widgetHostPriorityTransientSnapshot = self->_widgetHostPriorityTransientSnapshot;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_13;
  v54[3] = &unk_1E62C10A8;
  id v43 = v40;
  id v55 = v43;
  id v44 = (id)[v5 appendBool:widgetHostPriorityTransientSnapshot counterpart:v54];
  BOOL showPreview = self->_showPreview;
  uint64_t v49 = MEMORY[0x1E4F143A8];
  uint64_t v50 = 3221225472;
  v51 = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_14;
  v52 = &unk_1E62C10A8;
  id v53 = v43;
  id v46 = v43;
  id v47 = (id)[v5 appendBool:showPreview counterpart:&v49];
  LOBYTE(v43) = objc_msgSend(v5, "isEqual", v49, v50, v51, v52);

  return (char)v43;
}

uint64_t __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 8);
}

id __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

uint64_t __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_3(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 24);
}

uint64_t __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_4(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 25);
}

uint64_t __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_5(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 26);
}

uint64_t __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_6(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 32);
}

uint64_t __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_7(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 40);
}

uint64_t __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_8(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 41);
}

uint64_t __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_9(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 42);
}

id __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_10(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 48);
}

uint64_t __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_11(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 56);
}

uint64_t __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_12(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 57);
}

uint64_t __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_13(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 58);
}

uint64_t __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_14(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 59);
}

- (int64_t)faceDataMode
{
  return self->_faceDataMode;
}

- (NSString)launchLocation
{
  return self->_launchLocation;
}

- (BOOL)tapEnabled
{
  return self->_tapEnabled;
}

- (BOOL)defaultTapAnimationEnabled
{
  return self->_defaultTapAnimationEnabled;
}

- (BOOL)supportsWatchGestureInteraction
{
  return self->_supportsWatchGestureInteraction;
}

- (unint64_t)visibility
{
  return self->_visibility;
}

- (BOOL)supportsTinting
{
  return self->_supportsTinting;
}

- (BOOL)showsWhenLocked
{
  return self->_showsWhenLocked;
}

- (BOOL)showsInLowLuminance
{
  return self->_showsInLowLuminance;
}

- (NSString)widgetConfigurationIdentifier
{
  return self->_widgetConfigurationIdentifier;
}

- (BOOL)widgetShowsSnapshot
{
  return self->_widgetShowsSnapshot;
}

- (BOOL)widgetRequiresSnapshot
{
  return self->_widgetRequiresSnapshot;
}

- (BOOL)widgetHostPriorityTransientSnapshot
{
  return self->_widgetHostPriorityTransientSnapshot;
}

- (BOOL)showPreview
{
  return self->_showPreview;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_launchLocation, 0);
}

@end