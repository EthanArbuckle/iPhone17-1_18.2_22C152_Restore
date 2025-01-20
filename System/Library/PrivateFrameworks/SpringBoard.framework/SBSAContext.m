@interface SBSAContext
+ (Class)mutatorClass;
+ (id)instanceWithBlock:(id)a3;
+ (id)instanceWithQueryIteration:(unint64_t)a3 block:(id)a4;
- (BOOL)containsAnyOfSignals:(unint64_t)a3;
- (BOOL)isAccessibilityZoomActiveAndEnabled;
- (BOOL)isAnimatedTransitionInProgress;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHeavyShadowRequiredForTransition;
- (BOOL)isIndicatorVisible;
- (BOOL)isKeyLineRequiredForTransition;
- (BOOL)isReachabilityActive;
- (BOOL)isReduceTransparencyEnabled;
- (BSOrderedDictionary)dictionaryDescription;
- (CGRect)inertContainerFrame;
- (CGRect)systemContainerBounds;
- (NSArray)animatedTransitionResults;
- (NSArray)containerViewDescriptions;
- (NSArray)elapsedTimerDescriptions;
- (NSArray)elementContexts;
- (NSArray)elementInteractionResults;
- (NSArray)elementSnapshotContexts;
- (NSArray)gestureDescriptions;
- (NSArray)requests;
- (NSString)description;
- (SBSAContext)initWithQueryIteration:(unint64_t)a3;
- (SBSADefaultsContext)defaultsContext;
- (SBSAPlatformMetricsContext)platformMetrics;
- (SBSAPreferences)preferences;
- (SBSAViewDescription)containerParentViewDescription;
- (UIEdgeInsets)landscapeScreenEdgeInsets;
- (double)displayScale;
- (id)_initWithContext:(id)a3;
- (id)copyByAddingFlags:(unint64_t)a3 debugRequestingProvider:(id)a4;
- (id)copyByAddingSignals:(unint64_t)a3 debugRequestingProvider:(id)a4;
- (id)copyByUpdatingPreferences:(id)a3;
- (id)copyWithBlock:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)cloningStyle;
- (int64_t)layoutDirection;
- (int64_t)overrideRenderingStyle;
- (unint64_t)activeDisplay;
- (unint64_t)flags;
- (unint64_t)hash;
- (unint64_t)maximumNumberOfElements;
- (unint64_t)minimumNumberOfContainers;
- (unint64_t)queryIteration;
- (unint64_t)signals;
- (void)_setAccessibilityZoomActiveAndEnabled:(BOOL)a3;
- (void)_setActiveDisplay:(unint64_t)a3;
- (void)_setAnimatedTransitionInProgress:(BOOL)a3;
- (void)_setAnimatedTransitionResults:(id)a3;
- (void)_setCloningStyle:(int64_t)a3;
- (void)_setContainerParentViewDescription:(id)a3;
- (void)_setContainerViewDescriptions:(id)a3;
- (void)_setDefaultsContext:(id)a3;
- (void)_setDisplayScale:(double)a3;
- (void)_setElapsedTimerDescriptions:(id)a3;
- (void)_setElementContexts:(id)a3;
- (void)_setElementInteractionResults:(id)a3;
- (void)_setElementSnapshotContexts:(id)a3;
- (void)_setFlags:(unint64_t)a3;
- (void)_setGestureDescriptions:(id)a3;
- (void)_setHeavyShadowRequiredForTransition:(BOOL)a3;
- (void)_setIndicatorVisible:(BOOL)a3;
- (void)_setInertContainerFrame:(CGRect)a3;
- (void)_setKeyLineRequiredForTransition:(BOOL)a3;
- (void)_setLandscapeScreenEdgeInsets:(UIEdgeInsets)a3;
- (void)_setLayoutDirection:(int64_t)a3;
- (void)_setMaximumNumberOfElements:(unint64_t)a3;
- (void)_setMinimumNumberOfContainers:(unint64_t)a3;
- (void)_setOverrideRenderingStyle:(int64_t)a3;
- (void)_setPlatformMetrics:(id)a3;
- (void)_setPreferences:(id)a3;
- (void)_setReachabilityActive:(BOOL)a3;
- (void)_setReduceTransparencyEnabled:(BOOL)a3;
- (void)_setRequests:(id)a3;
- (void)_setSignals:(unint64_t)a3;
- (void)_setSystemContainerBounds:(CGRect)a3;
@end

@implementation SBSAContext

uint64_t __23__SBSAContext_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) queryIteration];
}

- (id)copyByUpdatingPreferences:(id)a3
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__SBSAContext_Private__copyByUpdatingPreferences___block_invoke;
  v9[3] = &unk_1E6AF9DA0;
  id v10 = v5;
  SEL v11 = a2;
  v9[4] = self;
  id v6 = v5;
  id v7 = [(SBSAContext *)self copyWithBlock:v9];

  return v7;
}

- (id)copyWithBlock:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  id v5 = (void *)[(SBSAContext *)self copy];
  if (v4)
  {
    id v6 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "mutatorClass")), "initWithContext:", v5);
    v4[2](v4, v6);
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 _initWithContext:self];
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

void __50__SBSAContext_Private__copyByUpdatingPreferences___block_invoke(void *a1, void *a2)
{
  id v13 = a2;
  if (v13)
  {
    v3 = self;
    id v4 = v13;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        id v5 = v4;
      }
      else {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
    id v6 = v5;

    if (v6) {
      goto LABEL_10;
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = a1[6];
    uint64_t v9 = a1[4];
    Class v10 = NSClassFromString(&cfstr_Sbsacontextmut.isa);
    SEL v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAContext.m", 407, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  [v6 setPreferences:a1[5]];
}

- (void)_setPreferences:(id)a3
{
}

- (id)_initWithContext:(id)a3
{
  id v4 = a3;
  id v5 = -[SBSAContext initWithQueryIteration:](self, "initWithQueryIteration:", [v4 queryIteration]);
  if (v5)
  {
    [v4 displayScale];
    v5->_displayScale = v6;
    v5->_minimumNumberOfContainers = [v4 minimumNumberOfContainers];
    v5->_maximumNumberOfElements = [v4 maximumNumberOfElements];
    [v4 inertContainerFrame];
    v5->_inertContainerFrame.origin.x = v7;
    v5->_inertContainerFrame.origin.y = v8;
    v5->_inertContainerFrame.size.width = v9;
    v5->_inertContainerFrame.size.height = v10;
    [v4 systemContainerBounds];
    v5->_systemContainerBounds.origin.x = v11;
    v5->_systemContainerBounds.origin.y = v12;
    v5->_systemContainerBounds.size.width = v13;
    v5->_systemContainerBounds.size.height = v14;
    v15 = [v4 platformMetrics];
    uint64_t v16 = [v15 copy];
    platformMetrics = v5->_platformMetrics;
    v5->_platformMetrics = (SBSAPlatformMetricsContext *)v16;

    v5->_layoutDirection = [v4 layoutDirection];
    [v4 landscapeScreenEdgeInsets];
    v5->_landscapeScreenEdgeInsets.top = v18;
    v5->_landscapeScreenEdgeInsets.left = v19;
    v5->_landscapeScreenEdgeInsets.bottom = v20;
    v5->_landscapeScreenEdgeInsets.right = v21;
    v5->_overrideRenderingStyle = [v4 overrideRenderingStyle];
    v5->_cloningStyle = [v4 cloningStyle];
    v5->_activeDisplay = [v4 activeDisplay];
    v5->_indicatorVisible = [v4 isIndicatorVisible];
    v5->_heavyShadowRequiredForTransition = [v4 isHeavyShadowRequiredForTransition];
    v5->_keyLineRequiredForTransition = [v4 isKeyLineRequiredForTransition];
    v5->_accessibilityZoomActiveAndEnabled = [v4 isAccessibilityZoomActiveAndEnabled];
    v5->_reduceTransparencyEnabled = [v4 isReduceTransparencyEnabled];
    v5->_animatedTransitionInProgress = [v4 isAnimatedTransitionInProgress];
    v5->_reachabilityActive = [v4 isReachabilityActive];
    v22 = [v4 containerParentViewDescription];
    uint64_t v23 = [v22 copy];
    containerParentViewDescription = v5->_containerParentViewDescription;
    v5->_containerParentViewDescription = (SBSAViewDescription *)v23;

    v25 = [v4 requests];
    uint64_t v26 = [v25 copy];
    requests = v5->_requests;
    v5->_requests = (NSArray *)v26;

    v28 = [v4 elementContexts];
    uint64_t v29 = [v28 copy];
    elementContexts = v5->_elementContexts;
    v5->_elementContexts = (NSArray *)v29;

    v31 = [v4 elementInteractionResults];
    uint64_t v32 = [v31 copy];
    elementInteractionResults = v5->_elementInteractionResults;
    v5->_elementInteractionResults = (NSArray *)v32;

    v34 = [v4 elementSnapshotContexts];
    uint64_t v35 = [v34 copy];
    elementSnapshotContexts = v5->_elementSnapshotContexts;
    v5->_elementSnapshotContexts = (NSArray *)v35;

    v37 = [v4 defaultsContext];
    uint64_t v38 = [v37 copy];
    defaultsContext = v5->_defaultsContext;
    v5->_defaultsContext = (SBSADefaultsContext *)v38;

    v40 = [v4 gestureDescriptions];
    uint64_t v41 = [v40 copy];
    gestureDescriptions = v5->_gestureDescriptions;
    v5->_gestureDescriptions = (NSArray *)v41;

    v43 = [v4 animatedTransitionResults];
    uint64_t v44 = [v43 copy];
    animatedTransitionResults = v5->_animatedTransitionResults;
    v5->_animatedTransitionResults = (NSArray *)v44;

    v46 = [v4 elapsedTimerDescriptions];
    uint64_t v47 = [v46 copy];
    elapsedTimerDescriptions = v5->_elapsedTimerDescriptions;
    v5->_elapsedTimerDescriptions = (NSArray *)v47;

    v49 = [v4 containerViewDescriptions];
    uint64_t v50 = [v49 copy];
    containerViewDescriptions = v5->_containerViewDescriptions;
    v5->_containerViewDescriptions = (NSArray *)v50;

    v52 = [v4 preferences];
    uint64_t v53 = [v52 copy];
    preferences = v5->_preferences;
    v5->_preferences = (SBSAPreferences *)v53;

    v5->_signals = [v4 signals];
    v5->_flags = [v4 flags];
  }

  return v5;
}

- (NSArray)elementContexts
{
  return self->_elementContexts;
}

- (SBSAPreferences)preferences
{
  return self->_preferences;
}

- (unint64_t)signals
{
  return self->_signals;
}

- (unint64_t)queryIteration
{
  return self->_queryIteration;
}

- (SBSADefaultsContext)defaultsContext
{
  return self->_defaultsContext;
}

- (BOOL)isKeyLineRequiredForTransition
{
  return self->_keyLineRequiredForTransition;
}

- (CGRect)systemContainerBounds
{
  double x = self->_systemContainerBounds.origin.x;
  double y = self->_systemContainerBounds.origin.y;
  double width = self->_systemContainerBounds.size.width;
  double height = self->_systemContainerBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isIndicatorVisible
{
  return self->_indicatorVisible;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (NSArray)containerViewDescriptions
{
  return self->_containerViewDescriptions;
}

- (NSArray)requests
{
  return self->_requests;
}

- (BOOL)isAnimatedTransitionInProgress
{
  return self->_animatedTransitionInProgress;
}

- (NSArray)animatedTransitionResults
{
  return self->_animatedTransitionResults;
}

- (NSArray)gestureDescriptions
{
  return self->_gestureDescriptions;
}

- (SBSAPlatformMetricsContext)platformMetrics
{
  return self->_platformMetrics;
}

- (int64_t)overrideRenderingStyle
{
  return self->_overrideRenderingStyle;
}

- (unint64_t)minimumNumberOfContainers
{
  return self->_minimumNumberOfContainers;
}

- (unint64_t)maximumNumberOfElements
{
  return self->_maximumNumberOfElements;
}

- (BOOL)isReduceTransparencyEnabled
{
  return self->_reduceTransparencyEnabled;
}

- (BOOL)isReachabilityActive
{
  return self->_reachabilityActive;
}

- (BOOL)isHeavyShadowRequiredForTransition
{
  return self->_heavyShadowRequiredForTransition;
}

- (BOOL)isAccessibilityZoomActiveAndEnabled
{
  return self->_accessibilityZoomActiveAndEnabled;
}

- (SBSAContext)initWithQueryIteration:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBSAContext;
  CGRect result = [(SBSAContext *)&v5 init];
  if (result) {
    result->_queryIteration = a3;
  }
  return result;
}

- (CGRect)inertContainerFrame
{
  double x = self->_inertContainerFrame.origin.x;
  double y = self->_inertContainerFrame.origin.y;
  double width = self->_inertContainerFrame.size.width;
  double height = self->_inertContainerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (int64_t)cloningStyle
{
  return self->_cloningStyle;
}

- (unint64_t)activeDisplay
{
  return self->_activeDisplay;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (UIEdgeInsets)landscapeScreenEdgeInsets
{
  double top = self->_landscapeScreenEdgeInsets.top;
  double left = self->_landscapeScreenEdgeInsets.left;
  double bottom = self->_landscapeScreenEdgeInsets.bottom;
  double right = self->_landscapeScreenEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSArray)elementSnapshotContexts
{
  return self->_elementSnapshotContexts;
}

- (NSArray)elementInteractionResults
{
  return self->_elementInteractionResults;
}

- (NSArray)elapsedTimerDescriptions
{
  return self->_elapsedTimerDescriptions;
}

- (SBSAViewDescription)containerParentViewDescription
{
  return self->_containerParentViewDescription;
}

- (void)_setSystemContainerBounds:(CGRect)a3
{
  self->_systemContainerBounds = a3;
}

- (void)_setRequests:(id)a3
{
}

- (void)_setReduceTransparencyEnabled:(BOOL)a3
{
  self->_reduceTransparencyEnabled = a3;
}

- (void)_setReachabilityActive:(BOOL)a3
{
  self->_reachabilityActive = a3;
}

- (void)_setPlatformMetrics:(id)a3
{
}

- (void)_setOverrideRenderingStyle:(int64_t)a3
{
  self->_overrideRenderingStyle = a3;
}

- (void)_setMinimumNumberOfContainers:(unint64_t)a3
{
  self->_minimumNumberOfContainers = a3;
}

- (void)_setMaximumNumberOfElements:(unint64_t)a3
{
  self->_maximumNumberOfElements = a3;
}

- (void)_setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (void)_setLandscapeScreenEdgeInsets:(UIEdgeInsets)a3
{
  self->_landscapeScreenEdgeInsets = a3;
}

- (void)_setKeyLineRequiredForTransition:(BOOL)a3
{
  self->_keyLineRequiredForTransition = a3;
}

- (void)_setInertContainerFrame:(CGRect)a3
{
  self->_inertContainerFrame = a3;
}

- (void)_setIndicatorVisible:(BOOL)a3
{
  self->_indicatorVisible = a3;
}

- (void)_setHeavyShadowRequiredForTransition:(BOOL)a3
{
  self->_heavyShadowRequiredForTransition = a3;
}

- (void)_setGestureDescriptions:(id)a3
{
}

- (void)_setElementSnapshotContexts:(id)a3
{
}

- (void)_setElementInteractionResults:(id)a3
{
}

- (void)_setElementContexts:(id)a3
{
}

- (void)_setElapsedTimerDescriptions:(id)a3
{
}

- (void)_setDisplayScale:(double)a3
{
  self->_displayScale = a3;
}

- (void)_setDefaultsContext:(id)a3
{
}

- (void)_setContainerViewDescriptions:(id)a3
{
}

- (void)_setContainerParentViewDescription:(id)a3
{
}

- (void)_setCloningStyle:(int64_t)a3
{
  self->_cloningStyle = a3;
}

- (void)_setAnimatedTransitionResults:(id)a3
{
}

- (void)_setAnimatedTransitionInProgress:(BOOL)a3
{
  self->_animatedTransitionInProgress = a3;
}

- (void)_setActiveDisplay:(unint64_t)a3
{
  self->_activeDispladouble y = a3;
}

- (void)_setAccessibilityZoomActiveAndEnabled:(BOOL)a3
{
  self->_accessibilityZoomActiveAndEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_elapsedTimerDescriptions, 0);
  objc_storeStrong((id *)&self->_animatedTransitionResults, 0);
  objc_storeStrong((id *)&self->_gestureDescriptions, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_containerViewDescriptions, 0);
  objc_storeStrong((id *)&self->_defaultsContext, 0);
  objc_storeStrong((id *)&self->_elementSnapshotContexts, 0);
  objc_storeStrong((id *)&self->_elementInteractionResults, 0);
  objc_storeStrong((id *)&self->_elementContexts, 0);
  objc_storeStrong((id *)&self->_containerParentViewDescription, 0);
  objc_storeStrong((id *)&self->_platformMetrics, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v85 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  unint64_t queryIteration = self->_queryIteration;
  v156[0] = MEMORY[0x1E4F143A8];
  v156[1] = 3221225472;
  v156[2] = __23__SBSAContext_isEqual___block_invoke;
  v156[3] = &unk_1E6AF5470;
  id v6 = v4;
  id v157 = v6;
  v84 = [v85 appendUnsignedInteger:queryIteration counterpart:v156];
  unint64_t maximumNumberOfElements = self->_maximumNumberOfElements;
  v154[0] = MEMORY[0x1E4F143A8];
  v154[1] = 3221225472;
  v154[2] = __23__SBSAContext_isEqual___block_invoke_2;
  v154[3] = &unk_1E6AF5470;
  id v8 = v6;
  id v155 = v8;
  v83 = [v84 appendUnsignedInteger:maximumNumberOfElements counterpart:v154];
  unint64_t minimumNumberOfContainers = self->_minimumNumberOfContainers;
  v152[0] = MEMORY[0x1E4F143A8];
  v152[1] = 3221225472;
  v152[2] = __23__SBSAContext_isEqual___block_invoke_3;
  v152[3] = &unk_1E6AF5470;
  id v10 = v8;
  id v153 = v10;
  v82 = [v83 appendUnsignedInteger:minimumNumberOfContainers counterpart:v152];
  v150[0] = MEMORY[0x1E4F143A8];
  v150[1] = 3221225472;
  v150[2] = __23__SBSAContext_isEqual___block_invoke_4;
  v150[3] = &unk_1E6AFBC10;
  id v11 = v10;
  id v151 = v11;
  v81 = objc_msgSend(v82, "appendCGRect:counterpart:", v150, self->_inertContainerFrame.origin.x, self->_inertContainerFrame.origin.y, self->_inertContainerFrame.size.width, self->_inertContainerFrame.size.height);
  v148[0] = MEMORY[0x1E4F143A8];
  v148[1] = 3221225472;
  v148[2] = __23__SBSAContext_isEqual___block_invoke_5;
  v148[3] = &unk_1E6AFBC10;
  id v12 = v11;
  id v149 = v12;
  v80 = objc_msgSend(v81, "appendCGRect:counterpart:", v148, self->_systemContainerBounds.origin.x, self->_systemContainerBounds.origin.y, self->_systemContainerBounds.size.width, self->_systemContainerBounds.size.height);
  platformMetrics = self->_platformMetrics;
  v146[0] = MEMORY[0x1E4F143A8];
  v146[1] = 3221225472;
  v146[2] = __23__SBSAContext_isEqual___block_invoke_6;
  v146[3] = &unk_1E6AF9E90;
  id v14 = v12;
  id v147 = v14;
  v79 = [v80 appendObject:platformMetrics counterpart:v146];
  int64_t layoutDirection = self->_layoutDirection;
  v144[0] = MEMORY[0x1E4F143A8];
  v144[1] = 3221225472;
  v144[2] = __23__SBSAContext_isEqual___block_invoke_7;
  v144[3] = &unk_1E6AF9660;
  id v16 = v14;
  id v145 = v16;
  v78 = [v79 appendInteger:layoutDirection counterpart:v144];
  int64_t overrideRenderingStyle = self->_overrideRenderingStyle;
  v142[0] = MEMORY[0x1E4F143A8];
  v142[1] = 3221225472;
  v142[2] = __23__SBSAContext_isEqual___block_invoke_8;
  v142[3] = &unk_1E6AF9660;
  id v18 = v16;
  id v143 = v18;
  v77 = [v78 appendInteger:overrideRenderingStyle counterpart:v142];
  int64_t cloningStyle = self->_cloningStyle;
  v140[0] = MEMORY[0x1E4F143A8];
  v140[1] = 3221225472;
  v140[2] = __23__SBSAContext_isEqual___block_invoke_9;
  v140[3] = &unk_1E6AF9660;
  id v20 = v18;
  id v141 = v20;
  v76 = [v77 appendInteger:cloningStyle counterpart:v140];
  activeDispladouble y = self->_activeDisplay;
  v138[0] = MEMORY[0x1E4F143A8];
  v138[1] = 3221225472;
  v138[2] = __23__SBSAContext_isEqual___block_invoke_10;
  v138[3] = &unk_1E6AF9660;
  id v22 = v20;
  id v139 = v22;
  v75 = [v76 appendInteger:activeDisplay counterpart:v138];
  BOOL indicatorVisible = self->_indicatorVisible;
  v136[0] = MEMORY[0x1E4F143A8];
  v136[1] = 3221225472;
  v136[2] = __23__SBSAContext_isEqual___block_invoke_11;
  v136[3] = &unk_1E6AF99E8;
  id v24 = v22;
  id v137 = v24;
  v74 = [v75 appendBool:indicatorVisible counterpart:v136];
  BOOL heavyShadowRequiredForTransition = self->_heavyShadowRequiredForTransition;
  v134[0] = MEMORY[0x1E4F143A8];
  v134[1] = 3221225472;
  v134[2] = __23__SBSAContext_isEqual___block_invoke_12;
  v134[3] = &unk_1E6AF99E8;
  id v26 = v24;
  id v135 = v26;
  v73 = [v74 appendBool:heavyShadowRequiredForTransition counterpart:v134];
  BOOL keyLineRequiredForTransition = self->_keyLineRequiredForTransition;
  v132[0] = MEMORY[0x1E4F143A8];
  v132[1] = 3221225472;
  v132[2] = __23__SBSAContext_isEqual___block_invoke_13;
  v132[3] = &unk_1E6AF99E8;
  id v28 = v26;
  id v133 = v28;
  v72 = [v73 appendBool:keyLineRequiredForTransition counterpart:v132];
  BOOL accessibilityZoomActiveAndEnabled = self->_accessibilityZoomActiveAndEnabled;
  v130[0] = MEMORY[0x1E4F143A8];
  v130[1] = 3221225472;
  v130[2] = __23__SBSAContext_isEqual___block_invoke_14;
  v130[3] = &unk_1E6AF99E8;
  id v30 = v28;
  id v131 = v30;
  v71 = [v72 appendBool:accessibilityZoomActiveAndEnabled counterpart:v130];
  BOOL reduceTransparencyEnabled = self->_reduceTransparencyEnabled;
  v128[0] = MEMORY[0x1E4F143A8];
  v128[1] = 3221225472;
  v128[2] = __23__SBSAContext_isEqual___block_invoke_15;
  v128[3] = &unk_1E6AF99E8;
  id v32 = v30;
  id v129 = v32;
  v70 = [v71 appendBool:reduceTransparencyEnabled counterpart:v128];
  BOOL animatedTransitionInProgress = self->_animatedTransitionInProgress;
  v126[0] = MEMORY[0x1E4F143A8];
  v126[1] = 3221225472;
  v126[2] = __23__SBSAContext_isEqual___block_invoke_16;
  v126[3] = &unk_1E6AF99E8;
  id v34 = v32;
  id v127 = v34;
  v69 = [v70 appendBool:animatedTransitionInProgress counterpart:v126];
  BOOL reachabilityActive = self->_reachabilityActive;
  v124[0] = MEMORY[0x1E4F143A8];
  v124[1] = 3221225472;
  v124[2] = __23__SBSAContext_isEqual___block_invoke_17;
  v124[3] = &unk_1E6AF99E8;
  id v36 = v34;
  id v125 = v36;
  v68 = [v69 appendBool:reachabilityActive counterpart:v124];
  containerParentViewDescription = self->_containerParentViewDescription;
  v122[0] = MEMORY[0x1E4F143A8];
  v122[1] = 3221225472;
  v122[2] = __23__SBSAContext_isEqual___block_invoke_18;
  v122[3] = &unk_1E6AF9E90;
  id v38 = v36;
  id v123 = v38;
  v67 = [v68 appendObject:containerParentViewDescription counterpart:v122];
  defaultsContext = self->_defaultsContext;
  v120[0] = MEMORY[0x1E4F143A8];
  v120[1] = 3221225472;
  v120[2] = __23__SBSAContext_isEqual___block_invoke_19;
  v120[3] = &unk_1E6AF9E90;
  id v40 = v38;
  id v121 = v40;
  v87 = [v67 appendObject:defaultsContext counterpart:v120];
  v118[0] = MEMORY[0x1E4F143A8];
  v118[1] = 3221225472;
  v118[2] = __23__SBSAContext_isEqual___block_invoke_20;
  v118[3] = &unk_1E6AF5420;
  v118[4] = self;
  id v119 = v40;
  v115[0] = MEMORY[0x1E4F143A8];
  v115[1] = 3221225472;
  v115[2] = __23__SBSAContext_isEqual___block_invoke_21;
  v115[3] = &unk_1E6AF5420;
  id v41 = v119;
  id v116 = v41;
  v117 = self;
  v86 = (void *)MEMORY[0x1D948C7A0](v115);
  v112[0] = MEMORY[0x1E4F143A8];
  v112[1] = 3221225472;
  v112[2] = __23__SBSAContext_isEqual___block_invoke_22;
  v112[3] = &unk_1E6AF5420;
  id v42 = v41;
  id v113 = v42;
  v114 = self;
  v66 = (void *)MEMORY[0x1D948C7A0](v112);
  v109[0] = MEMORY[0x1E4F143A8];
  v109[1] = 3221225472;
  v109[2] = __23__SBSAContext_isEqual___block_invoke_23;
  v109[3] = &unk_1E6AF5420;
  id v43 = v42;
  id v110 = v43;
  v111 = self;
  uint64_t v44 = (void *)MEMORY[0x1D948C7A0](v109);
  v106[0] = MEMORY[0x1E4F143A8];
  v106[1] = 3221225472;
  v106[2] = __23__SBSAContext_isEqual___block_invoke_24;
  v106[3] = &unk_1E6AF5420;
  id v45 = v43;
  id v107 = v45;
  v108 = self;
  v65 = (void *)MEMORY[0x1D948C7A0](v106);
  v103[0] = MEMORY[0x1E4F143A8];
  v103[1] = 3221225472;
  v103[2] = __23__SBSAContext_isEqual___block_invoke_25;
  v103[3] = &unk_1E6AF5420;
  id v46 = v45;
  id v104 = v46;
  v105 = self;
  uint64_t v47 = (void *)MEMORY[0x1D948C7A0](v103);
  v100[0] = MEMORY[0x1E4F143A8];
  v100[1] = 3221225472;
  v100[2] = __23__SBSAContext_isEqual___block_invoke_26;
  v100[3] = &unk_1E6AF5420;
  id v48 = v46;
  id v101 = v48;
  v102 = self;
  v64 = (void *)MEMORY[0x1D948C7A0](v100);
  v97[0] = MEMORY[0x1E4F143A8];
  v97[1] = 3221225472;
  v97[2] = __23__SBSAContext_isEqual___block_invoke_27;
  v97[3] = &unk_1E6AF5420;
  id v49 = v48;
  id v98 = v49;
  v99 = self;
  uint64_t v50 = (void *)MEMORY[0x1D948C7A0](v97);
  v94[0] = MEMORY[0x1E4F143A8];
  v94[1] = 3221225472;
  v94[2] = __23__SBSAContext_isEqual___block_invoke_28;
  v94[3] = &unk_1E6AF5420;
  id v51 = v49;
  id v95 = v51;
  v96 = self;
  v52 = (void *)MEMORY[0x1D948C7A0](v94);
  uint64_t v53 = objc_msgSend(v87, "appendEqualsBlocks:", v118, v86, v66, v44, v65, v47, v64, v50, v52, 0);
  preferences = self->_preferences;
  v92[0] = MEMORY[0x1E4F143A8];
  v92[1] = 3221225472;
  v92[2] = __23__SBSAContext_isEqual___block_invoke_29;
  v92[3] = &unk_1E6AF9E90;
  id v55 = v51;
  id v93 = v55;
  v56 = [v53 appendObject:preferences counterpart:v92];
  unint64_t signals = self->_signals;
  v90[0] = MEMORY[0x1E4F143A8];
  v90[1] = 3221225472;
  v90[2] = __23__SBSAContext_isEqual___block_invoke_30;
  v90[3] = &unk_1E6AF5470;
  id v58 = v55;
  id v91 = v58;
  v59 = [v56 appendUnsignedInteger:signals counterpart:v90];
  unint64_t flags = self->_flags;
  v88[0] = MEMORY[0x1E4F143A8];
  v88[1] = 3221225472;
  v88[2] = __23__SBSAContext_isEqual___block_invoke_31;
  v88[3] = &unk_1E6AF5470;
  id v89 = v58;
  id v61 = v58;
  v62 = [v59 appendUnsignedInteger:flags counterpart:v88];
  LOBYTE(flags) = [v62 isEqual];

  return flags;
}

+ (id)instanceWithQueryIteration:(unint64_t)a3 block:(id)a4
{
  id v5 = a4;
  id v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithQueryIteration:a3];
  CGFloat v7 = (void *)[v6 copyWithBlock:v5];

  return v7;
}

- (BOOL)containsAnyOfSignals:(unint64_t)a3
{
  return ([(SBSAContext *)self signals] & a3) != 0;
}

uint64_t __23__SBSAContext_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) maximumNumberOfElements];
}

uint64_t __23__SBSAContext_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) minimumNumberOfContainers];
}

uint64_t __23__SBSAContext_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) inertContainerFrame];
}

uint64_t __23__SBSAContext_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) systemContainerBounds];
}

uint64_t __23__SBSAContext_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) platformMetrics];
}

uint64_t __23__SBSAContext_isEqual___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutDirection];
}

uint64_t __23__SBSAContext_isEqual___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) overrideRenderingStyle];
}

uint64_t __23__SBSAContext_isEqual___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) cloningStyle];
}

uint64_t __23__SBSAContext_isEqual___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) activeDisplay];
}

uint64_t __23__SBSAContext_isEqual___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) isIndicatorVisible];
}

uint64_t __23__SBSAContext_isEqual___block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) isHeavyShadowRequiredForTransition];
}

uint64_t __23__SBSAContext_isEqual___block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) isKeyLineRequiredForTransition];
}

uint64_t __23__SBSAContext_isEqual___block_invoke_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) isAccessibilityZoomActiveAndEnabled];
}

uint64_t __23__SBSAContext_isEqual___block_invoke_15(uint64_t a1)
{
  return [*(id *)(a1 + 32) isReduceTransparencyEnabled];
}

uint64_t __23__SBSAContext_isEqual___block_invoke_16(uint64_t a1)
{
  return [*(id *)(a1 + 32) isAnimatedTransitionInProgress];
}

uint64_t __23__SBSAContext_isEqual___block_invoke_17(uint64_t a1)
{
  return [*(id *)(a1 + 32) isReachabilityActive];
}

uint64_t __23__SBSAContext_isEqual___block_invoke_18(uint64_t a1)
{
  return [*(id *)(a1 + 32) containerParentViewDescription];
}

uint64_t __23__SBSAContext_isEqual___block_invoke_19(uint64_t a1)
{
  return [*(id *)(a1 + 32) defaultsContext];
}

BOOL __23__SBSAContext_isEqual___block_invoke_20(uint64_t a1)
{
  v1 = *(double **)(a1 + 32);
  [*(id *)(a1 + 40) landscapeScreenEdgeInsets];
  BOOL v5 = v1[33] == v4;
  if (v1[32] != v6) {
    BOOL v5 = 0;
  }
  if (v1[35] != v3) {
    BOOL v5 = 0;
  }
  return v1[34] == v2 && v5;
}

uint64_t __23__SBSAContext_isEqual___block_invoke_21(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) requests];
  uint64_t v2 = BSEqualArrays();

  return v2;
}

uint64_t __23__SBSAContext_isEqual___block_invoke_22(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) elementContexts];
  uint64_t v2 = BSEqualArrays();

  return v2;
}

uint64_t __23__SBSAContext_isEqual___block_invoke_23(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) elementInteractionResults];
  uint64_t v2 = BSEqualArrays();

  return v2;
}

uint64_t __23__SBSAContext_isEqual___block_invoke_24(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) elementSnapshotContexts];
  uint64_t v2 = BSEqualArrays();

  return v2;
}

uint64_t __23__SBSAContext_isEqual___block_invoke_25(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) gestureDescriptions];
  uint64_t v2 = BSEqualArrays();

  return v2;
}

uint64_t __23__SBSAContext_isEqual___block_invoke_26(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) animatedTransitionResults];
  uint64_t v2 = BSEqualArrays();

  return v2;
}

uint64_t __23__SBSAContext_isEqual___block_invoke_27(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) animatedTransitionResults];
  uint64_t v2 = BSEqualArrays();

  return v2;
}

uint64_t __23__SBSAContext_isEqual___block_invoke_28(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) containerViewDescriptions];
  uint64_t v2 = BSEqualArrays();

  return v2;
}

uint64_t __23__SBSAContext_isEqual___block_invoke_29(uint64_t a1)
{
  return [*(id *)(a1 + 32) preferences];
}

uint64_t __23__SBSAContext_isEqual___block_invoke_30(uint64_t a1)
{
  return [*(id *)(a1 + 32) signals];
}

uint64_t __23__SBSAContext_isEqual___block_invoke_31(uint64_t a1)
{
  return [*(id *)(a1 + 32) flags];
}

- (unint64_t)hash
{
  v39 = [MEMORY[0x1E4F4F758] builder];
  id v38 = [v39 appendUnsignedInteger:self->_queryIteration];
  v37 = [v38 appendUnsignedInteger:self->_minimumNumberOfContainers];
  id v36 = [v37 appendUnsignedInteger:self->_maximumNumberOfElements];
  uint64_t v35 = objc_msgSend(v36, "appendCGRect:", self->_inertContainerFrame.origin.x, self->_inertContainerFrame.origin.y, self->_inertContainerFrame.size.width, self->_inertContainerFrame.size.height);
  id v34 = objc_msgSend(v35, "appendCGRect:", self->_systemContainerBounds.origin.x, self->_systemContainerBounds.origin.y, self->_systemContainerBounds.size.width, self->_systemContainerBounds.size.height);
  v33 = [v34 appendInteger:self->_layoutDirection];
  id v32 = [v33 appendCGFloat:self->_landscapeScreenEdgeInsets.top];
  v31 = [v32 appendCGFloat:self->_landscapeScreenEdgeInsets.left];
  id v30 = [v31 appendCGFloat:self->_landscapeScreenEdgeInsets.bottom];
  uint64_t v29 = [v30 appendCGFloat:self->_landscapeScreenEdgeInsets.right];
  id v28 = [v29 appendInteger:self->_overrideRenderingStyle];
  v27 = [v28 appendInteger:self->_cloningStyle];
  id v26 = [v27 appendInteger:self->_activeDisplay];
  v25 = [v26 appendBool:self->_indicatorVisible];
  id v24 = [v25 appendBool:self->_heavyShadowRequiredForTransition];
  uint64_t v23 = [v24 appendBool:self->_keyLineRequiredForTransition];
  id v22 = [v23 appendBool:self->_accessibilityZoomActiveAndEnabled];
  CGFloat v21 = [v22 appendBool:self->_reachabilityActive];
  id v20 = [v21 appendBool:self->_reduceTransparencyEnabled];
  CGFloat v19 = [v20 appendBool:self->_animatedTransitionInProgress];
  id v18 = [v19 appendObject:self->_containerParentViewDescription];
  id v16 = [v18 appendObject:self->_platformMetrics];
  v15 = [v16 appendObject:self->_requests];
  id v14 = [v15 appendObject:self->_elementContexts];
  double v3 = [v14 appendObject:self->_elementInteractionResults];
  double v4 = [v3 appendObject:self->_elementSnapshotContexts];
  BOOL v5 = [v4 appendObject:self->_defaultsContext];
  double v6 = [v5 appendObject:self->_gestureDescriptions];
  CGFloat v7 = [v6 appendObject:self->_animatedTransitionResults];
  id v8 = [v7 appendObject:self->_elapsedTimerDescriptions];
  CGFloat v9 = [v8 appendObject:self->_containerViewDescriptions];
  id v10 = [v9 appendObject:self->_preferences];
  id v11 = [v10 appendUnsignedInteger:self->_signals];
  id v12 = [v11 appendUnsignedInteger:self->_flags];
  unint64_t v17 = [v12 hash];

  return v17;
}

- (NSString)description
{
  uint64_t v2 = [(SBSAContext *)self dictionaryDescription];
  double v3 = SBSAStringFromDictionaryDescription(v2);

  return (NSString *)v3;
}

- (BSOrderedDictionary)dictionaryDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F4F798]);
  double v4 = [MEMORY[0x1E4F4F7C0] sortByInsertionOrder];
  BOOL v5 = (void *)[v3 initWithKeyOrderingStrategy:v4];

  double v6 = objc_msgSend(NSString, "stringWithFormat:", @"%p", self);
  CGFloat v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v5 setObject:v6 forKey:v8];

  CGFloat v9 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_queryIteration);
  [v5 setObject:v9 forKey:@"queryIteration"];

  id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%f", *(void *)&self->_displayScale);
  [v5 setObject:v10 forKey:@"displayScale"];

  id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_minimumNumberOfContainers);
  [v5 setObject:v11 forKey:@"minimumNumberOfContainers"];

  id v12 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_maximumNumberOfElements);
  [v5 setObject:v12 forKey:@"maximumNumberOfElements"];

  CGFloat v13 = NSStringFromCGRect(self->_inertContainerFrame);
  [v5 setObject:v13 forKey:@"inertContainerFrame"];

  id v14 = NSStringFromCGRect(self->_systemContainerBounds);
  [v5 setObject:v14 forKey:@"systemContainerBounds"];

  v15 = [NSString stringWithFormat:@"%@", self->_platformMetrics];
  [v5 setObject:v15 forKey:@"platformMetrics"];

  id v16 = SBSAStringFromUITraitEnvironmentLayoutDirection(self->_layoutDirection);
  [v5 setObject:v16 forKey:@"layoutDirection"];

  unint64_t v17 = NSStringFromUIEdgeInsets(self->_landscapeScreenEdgeInsets);
  [v5 setObject:v17 forKey:@"landscapeScreenEdgeInsets"];

  id v18 = SBStringFromSystemApertureContainerRenderingStyle(self->_overrideRenderingStyle);
  [v5 setObject:v18 forKey:@"overrideRenderingStyle"];

  CGFloat v19 = SBStringFromSystemApertureContainerCloningStyle(self->_cloningStyle);
  [v5 setObject:v19 forKey:@"cloningStyle"];

  id v20 = NSStringFromBOOL();
  [v5 setObject:v20 forKey:@"indicatorVisible"];

  CGFloat v21 = NSStringFromBOOL();
  [v5 setObject:v21 forKey:@"heavyShadowRequiredForTransition"];

  id v22 = NSStringFromBOOL();
  [v5 setObject:v22 forKey:@"keyLineRequiredForTransition"];

  uint64_t v23 = NSStringFromBOOL();
  [v5 setObject:v23 forKey:@"accessibilityZoomActiveAndEnabled"];

  id v24 = NSStringFromBOOL();
  [v5 setObject:v24 forKey:@"reduceTransparencyEnabled"];

  v25 = NSStringFromBOOL();
  [v5 setObject:v25 forKey:@"animatedTransitionInProgress"];

  id v26 = NSStringFromBOOL();
  [v5 setObject:v26 forKey:@"reachabilityActive"];

  containerParentViewDescription = self->_containerParentViewDescription;
  if (containerParentViewDescription)
  {
    id v28 = [(SBSAViewDescription *)containerParentViewDescription description];
    [v5 setObject:v28 forKey:@"containerParentViewDescription"];
  }
  if ([(NSArray *)self->_requests count])
  {
    uint64_t v29 = [(NSArray *)self->_requests description];
    [v5 setObject:v29 forKey:@"requests"];
  }
  if ([(NSArray *)self->_elementContexts count]) {
    [v5 setObject:self->_elementContexts forKey:@"elementContexts"];
  }
  if ([(NSArray *)self->_elementInteractionResults count]) {
    [v5 setObject:self->_elementInteractionResults forKey:@"elementInteractionResults"];
  }
  if ([(NSArray *)self->_elementSnapshotContexts count])
  {
    id v30 = [(NSArray *)self->_elementSnapshotContexts description];
    [v5 setObject:v30 forKey:@"elementSnapshotContexts"];
  }
  defaultsContext = self->_defaultsContext;
  if (defaultsContext)
  {
    id v32 = [(SBSADefaultsContext *)defaultsContext description];
    [v5 setObject:v32 forKey:@"defaultsContext"];
  }
  if ([(NSArray *)self->_gestureDescriptions count])
  {
    v33 = [(NSArray *)self->_gestureDescriptions description];
    [v5 setObject:v33 forKey:@"gestureDescriptions"];
  }
  if ([(NSArray *)self->_animatedTransitionResults count])
  {
    id v34 = [(NSArray *)self->_animatedTransitionResults description];
    [v5 setObject:v34 forKey:@"animatedTransitionResults"];
  }
  if ([(NSArray *)self->_elapsedTimerDescriptions count])
  {
    uint64_t v35 = [(NSArray *)self->_elapsedTimerDescriptions description];
    [v5 setObject:v35 forKey:@"elapsedTimerDescriptions"];
  }
  if ([(NSArray *)self->_containerViewDescriptions count]) {
    [v5 setObject:self->_containerViewDescriptions forKey:@"containerViewDescriptions"];
  }
  id v36 = _StringFromPreferencesStackSignals(self->_signals);
  [v5 setObject:v36 forKey:@"signals"];

  v37 = _StringFromPreferencesStackFlags(self->_flags);
  [v5 setObject:v37 forKey:@"flags"];

  id v38 = SBStringFromSBSystemApertureActiveDisplay(self->_activeDisplay);
  [v5 setObject:v38 forKey:@"activeDisplay"];

  preferences = self->_preferences;
  if (preferences) {
    [v5 setObject:preferences forKey:@"preferences"];
  }
  return (BSOrderedDictionary *)v5;
}

+ (id)instanceWithBlock:(id)a3
{
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);

  return 0;
}

- (void)_setSignals:(unint64_t)a3
{
  self->_unint64_t signals = a3;
}

- (void)_setFlags:(unint64_t)a3
{
  self->_unint64_t flags = a3;
}

- (id)copyByAddingSignals:(unint64_t)a3 debugRequestingProvider:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = self;
  if (a3)
  {
    CGFloat v9 = SBLogSystemAperturePreferencesStack();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = [(SBSAContext *)v8 queryIteration];
      CGFloat v13 = _StringFromPreferencesStackSignals(a3);
      id v14 = [v7 description];
      *(_DWORD *)buf = 134349570;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      CGFloat v19 = v13;
      __int16 v20 = 2112;
      CGFloat v21 = v14;
      _os_log_debug_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEBUG, "[%{public}lu] Signals added: <%@> by provider: %@", buf, 0x20u);
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68__SBSAContext_Private__copyByAddingSignals_debugRequestingProvider___block_invoke;
    v15[3] = &unk_1E6AF8AB0;
    v15[4] = v8;
    v15[5] = a2;
    v15[6] = a3;
    uint64_t v10 = [(SBSAContext *)v8 copyWithBlock:v15];

    id v8 = (SBSAContext *)v10;
  }

  return v8;
}

void __68__SBSAContext_Private__copyByAddingSignals_debugRequestingProvider___block_invoke(void *a1, void *a2)
{
  id v13 = a2;
  if (v13)
  {
    id v3 = self;
    id v4 = v13;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        BOOL v5 = v4;
      }
      else {
        BOOL v5 = 0;
      }
    }
    else
    {
      BOOL v5 = 0;
    }
    id v6 = v5;

    if (v6) {
      goto LABEL_10;
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = a1[4];
    uint64_t v8 = a1[5];
    Class v10 = NSClassFromString(&cfstr_Sbsacontextmut.isa);
    id v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAContext.m", 386, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  objc_msgSend(v6, "setSignals:", a1[6] | objc_msgSend(v6, "signals"));
}

- (id)copyByAddingFlags:(unint64_t)a3 debugRequestingProvider:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = self;
  if (a3)
  {
    uint64_t v9 = SBLogSystemAperturePreferencesStack();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = [(SBSAContext *)v8 queryIteration];
      id v13 = _StringFromPreferencesStackFlags(a3);
      id v14 = [v7 description];
      *(_DWORD *)buf = 134349570;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      CGFloat v19 = v13;
      __int16 v20 = 2112;
      CGFloat v21 = v14;
      _os_log_debug_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEBUG, "[%{public}lu] Flags Added: <%@> by provider: %@", buf, 0x20u);
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __66__SBSAContext_Private__copyByAddingFlags_debugRequestingProvider___block_invoke;
    v15[3] = &unk_1E6AF8AB0;
    v15[4] = v8;
    v15[5] = a2;
    v15[6] = a3;
    uint64_t v10 = [(SBSAContext *)v8 copyWithBlock:v15];

    uint64_t v8 = (SBSAContext *)v10;
  }

  return v8;
}

void __66__SBSAContext_Private__copyByAddingFlags_debugRequestingProvider___block_invoke(void *a1, void *a2)
{
  id v13 = a2;
  if (v13)
  {
    id v3 = self;
    id v4 = v13;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        BOOL v5 = v4;
      }
      else {
        BOOL v5 = 0;
      }
    }
    else
    {
      BOOL v5 = 0;
    }
    id v6 = v5;

    if (v6) {
      goto LABEL_10;
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = a1[4];
    uint64_t v8 = a1[5];
    Class v10 = NSClassFromString(&cfstr_Sbsacontextmut.isa);
    id v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAContext.m", 398, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  objc_msgSend(v6, "setFlags:", a1[6] | objc_msgSend(v6, "flags"));
}

@end