@interface SBSAContextMutator
- (BOOL)isAccessibilityZoomActiveAndEnabled;
- (BOOL)isAnimatedTransitionInProgress;
- (BOOL)isHeavyShadowRequiredForTransition;
- (BOOL)isIndicatorVisible;
- (BOOL)isKeyLineRequiredForTransition;
- (BOOL)isReachabilityActive;
- (BOOL)isReduceTransparencyEnabled;
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
- (SBSAContext)context;
- (SBSAContextMutator)initWithContext:(id)a3;
- (SBSADefaultsContext)defaultsContext;
- (SBSAPlatformMetricsContext)platformMetrics;
- (SBSAPreferences)preferences;
- (SBSAViewDescription)containerParentViewDescription;
- (UIEdgeInsets)landscapeScreenEdgeInsets;
- (double)displayScale;
- (id)description;
- (int64_t)cloningStyle;
- (int64_t)layoutDirection;
- (int64_t)overrideRenderingStyle;
- (unint64_t)activeDisplay;
- (unint64_t)flags;
- (unint64_t)maximumNumberOfElements;
- (unint64_t)minimumNumberOfContainers;
- (unint64_t)signals;
- (void)setAccessibilityZoomActiveAndEnabled:(BOOL)a3;
- (void)setActiveDisplay:(unint64_t)a3;
- (void)setAnimatedTransitionInProgress:(BOOL)a3;
- (void)setAnimatedTransitionResults:(id)a3;
- (void)setCloningStyle:(int64_t)a3;
- (void)setContainerParentViewDescription:(id)a3;
- (void)setContainerViewDescriptions:(id)a3;
- (void)setDefaultsContext:(id)a3;
- (void)setDisplayScale:(double)a3;
- (void)setElapsedTimerDescriptions:(id)a3;
- (void)setElementContexts:(id)a3;
- (void)setElementInteractionResults:(id)a3;
- (void)setElementSnapshotContexts:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setGestureDescriptions:(id)a3;
- (void)setHeavyShadowRequiredForTransition:(BOOL)a3;
- (void)setIndicatorVisible:(BOOL)a3;
- (void)setInertContainerFrame:(CGRect)a3;
- (void)setKeyLineRequiredForTransition:(BOOL)a3;
- (void)setLandscapeScreenEdgeInsets:(UIEdgeInsets)a3;
- (void)setLayoutDirection:(int64_t)a3;
- (void)setMaximumNumberOfElements:(unint64_t)a3;
- (void)setMinimumNumberOfContainers:(unint64_t)a3;
- (void)setOverrideRenderingStyle:(int64_t)a3;
- (void)setPlatformMetrics:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setReachabilityActive:(BOOL)a3;
- (void)setReduceTransparencyEnabled:(BOOL)a3;
- (void)setRequests:(id)a3;
- (void)setSignals:(unint64_t)a3;
- (void)setSystemContainerBounds:(CGRect)a3;
@end

@implementation SBSAContextMutator

- (void).cxx_destruct
{
}

- (SBSAContextMutator)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSAContextMutator;
  v6 = [(SBSAContextMutator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (void)setPreferences:(id)a3
{
}

- (void)setSystemContainerBounds:(CGRect)a3
{
}

- (void)setRequests:(id)a3
{
}

- (void)setReduceTransparencyEnabled:(BOOL)a3
{
}

- (void)setReachabilityActive:(BOOL)a3
{
}

- (void)setPlatformMetrics:(id)a3
{
}

- (void)setOverrideRenderingStyle:(int64_t)a3
{
}

- (void)setMinimumNumberOfContainers:(unint64_t)a3
{
}

- (void)setMaximumNumberOfElements:(unint64_t)a3
{
}

- (void)setLayoutDirection:(int64_t)a3
{
}

- (void)setLandscapeScreenEdgeInsets:(UIEdgeInsets)a3
{
}

- (void)setKeyLineRequiredForTransition:(BOOL)a3
{
}

- (void)setInertContainerFrame:(CGRect)a3
{
}

- (void)setIndicatorVisible:(BOOL)a3
{
}

- (void)setHeavyShadowRequiredForTransition:(BOOL)a3
{
}

- (void)setGestureDescriptions:(id)a3
{
}

- (void)setElementSnapshotContexts:(id)a3
{
}

- (void)setElementInteractionResults:(id)a3
{
}

- (void)setElementContexts:(id)a3
{
}

- (void)setElapsedTimerDescriptions:(id)a3
{
}

- (void)setDisplayScale:(double)a3
{
}

- (void)setDefaultsContext:(id)a3
{
}

- (void)setContainerViewDescriptions:(id)a3
{
}

- (void)setContainerParentViewDescription:(id)a3
{
}

- (void)setCloningStyle:(int64_t)a3
{
}

- (void)setAnimatedTransitionResults:(id)a3
{
}

- (void)setAnimatedTransitionInProgress:(BOOL)a3
{
}

- (void)setActiveDisplay:(unint64_t)a3
{
}

- (void)setAccessibilityZoomActiveAndEnabled:(BOOL)a3
{
}

- (double)displayScale
{
  [(SBSAContext *)self->_context displayScale];
  return result;
}

- (unint64_t)minimumNumberOfContainers
{
  return [(SBSAContext *)self->_context minimumNumberOfContainers];
}

- (unint64_t)maximumNumberOfElements
{
  return [(SBSAContext *)self->_context maximumNumberOfElements];
}

- (CGRect)inertContainerFrame
{
  [(SBSAContext *)self->_context inertContainerFrame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)systemContainerBounds
{
  [(SBSAContext *)self->_context systemContainerBounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (SBSAPlatformMetricsContext)platformMetrics
{
  return [(SBSAContext *)self->_context platformMetrics];
}

- (int64_t)layoutDirection
{
  return [(SBSAContext *)self->_context layoutDirection];
}

- (UIEdgeInsets)landscapeScreenEdgeInsets
{
  [(SBSAContext *)self->_context landscapeScreenEdgeInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (int64_t)overrideRenderingStyle
{
  return [(SBSAContext *)self->_context overrideRenderingStyle];
}

- (int64_t)cloningStyle
{
  return [(SBSAContext *)self->_context cloningStyle];
}

- (BOOL)isIndicatorVisible
{
  return [(SBSAContext *)self->_context isIndicatorVisible];
}

- (unint64_t)activeDisplay
{
  return [(SBSAContext *)self->_context activeDisplay];
}

- (BOOL)isHeavyShadowRequiredForTransition
{
  return [(SBSAContext *)self->_context isHeavyShadowRequiredForTransition];
}

- (BOOL)isKeyLineRequiredForTransition
{
  return [(SBSAContext *)self->_context isKeyLineRequiredForTransition];
}

- (BOOL)isAccessibilityZoomActiveAndEnabled
{
  return [(SBSAContext *)self->_context isAccessibilityZoomActiveAndEnabled];
}

- (NSArray)requests
{
  return [(SBSAContext *)self->_context requests];
}

- (SBSAViewDescription)containerParentViewDescription
{
  return [(SBSAContext *)self->_context containerParentViewDescription];
}

- (BOOL)isReduceTransparencyEnabled
{
  return [(SBSAContext *)self->_context isReduceTransparencyEnabled];
}

- (BOOL)isAnimatedTransitionInProgress
{
  return [(SBSAContext *)self->_context isAnimatedTransitionInProgress];
}

- (BOOL)isReachabilityActive
{
  return [(SBSAContext *)self->_context isReachabilityActive];
}

- (NSArray)containerViewDescriptions
{
  return [(SBSAContext *)self->_context containerViewDescriptions];
}

- (NSArray)elementContexts
{
  return [(SBSAContext *)self->_context elementContexts];
}

- (NSArray)elementInteractionResults
{
  return [(SBSAContext *)self->_context elementInteractionResults];
}

- (NSArray)elementSnapshotContexts
{
  return [(SBSAContext *)self->_context elementSnapshotContexts];
}

- (SBSADefaultsContext)defaultsContext
{
  return [(SBSAContext *)self->_context defaultsContext];
}

- (NSArray)gestureDescriptions
{
  return [(SBSAContext *)self->_context gestureDescriptions];
}

- (NSArray)animatedTransitionResults
{
  return [(SBSAContext *)self->_context animatedTransitionResults];
}

- (NSArray)elapsedTimerDescriptions
{
  return [(SBSAContext *)self->_context elapsedTimerDescriptions];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; context: %@>",
               objc_opt_class(),
               self,
               self->_context);
}

- (SBSAContext)context
{
  return self->_context;
}

- (SBSAPreferences)preferences
{
  return [(SBSAContext *)self->_context preferences];
}

- (unint64_t)signals
{
  return [(SBSAContext *)self->_context signals];
}

- (void)setSignals:(unint64_t)a3
{
}

- (unint64_t)flags
{
  return [(SBSAContext *)self->_context flags];
}

- (void)setFlags:(unint64_t)a3
{
}

@end