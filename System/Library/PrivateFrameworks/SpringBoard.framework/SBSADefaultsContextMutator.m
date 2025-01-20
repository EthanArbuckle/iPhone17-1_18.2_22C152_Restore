@interface SBSADefaultsContextMutator
- (BOOL)alwaysRenderSystemApertureFillOnGPU;
- (BOOL)alwaysShowSystemApertureInSnapshots;
- (BOOL)alwaysShowSystemApertureOnClonedDisplays;
- (BOOL)enableSystemApertureStateCollection;
- (BOOL)neverRenderSystemApertureFillOnGPU;
- (BOOL)suppressDynamicIslandCompletely;
- (SBSADefaultsContext)mutatable;
- (SBSADefaultsContextMutator)initWithDefaultsContext:(id)a3;
- (id)description;
- (void)setAlwaysRenderSystemApertureFillOnGPU:(BOOL)a3;
- (void)setAlwaysShowSystemApertureInSnapshots:(BOOL)a3;
- (void)setAlwaysShowSystemApertureOnClonedDisplays:(BOOL)a3;
- (void)setEnableSystemApertureStateCollection:(BOOL)a3;
- (void)setNeverRenderSystemApertureFillOnGPU:(BOOL)a3;
- (void)setSuppressDynamicIslandCompletely:(BOOL)a3;
@end

@implementation SBSADefaultsContextMutator

- (void).cxx_destruct
{
}

- (SBSADefaultsContextMutator)initWithDefaultsContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSADefaultsContextMutator;
  v6 = [(SBSADefaultsContextMutator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mutatable, a3);
  }

  return v7;
}

- (void)setSuppressDynamicIslandCompletely:(BOOL)a3
{
}

- (void)setNeverRenderSystemApertureFillOnGPU:(BOOL)a3
{
}

- (void)setAlwaysShowSystemApertureOnClonedDisplays:(BOOL)a3
{
}

- (void)setAlwaysShowSystemApertureInSnapshots:(BOOL)a3
{
}

- (void)setAlwaysRenderSystemApertureFillOnGPU:(BOOL)a3
{
}

- (BOOL)suppressDynamicIslandCompletely
{
  return [(SBSADefaultsContext *)self->_mutatable suppressDynamicIslandCompletely];
}

- (BOOL)alwaysShowSystemApertureOnClonedDisplays
{
  return [(SBSADefaultsContext *)self->_mutatable alwaysShowSystemApertureOnClonedDisplays];
}

- (BOOL)alwaysShowSystemApertureInSnapshots
{
  return [(SBSADefaultsContext *)self->_mutatable alwaysShowSystemApertureInSnapshots];
}

- (BOOL)alwaysRenderSystemApertureFillOnGPU
{
  return [(SBSADefaultsContext *)self->_mutatable alwaysRenderSystemApertureFillOnGPU];
}

- (BOOL)neverRenderSystemApertureFillOnGPU
{
  return [(SBSADefaultsContext *)self->_mutatable neverRenderSystemApertureFillOnGPU];
}

- (BOOL)enableSystemApertureStateCollection
{
  return [(SBSADefaultsContext *)self->_mutatable enableSystemApertureStateCollection];
}

- (void)setEnableSystemApertureStateCollection:(BOOL)a3
{
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; defaultsContext: %@>",
               objc_opt_class(),
               self,
               self->_mutatable);
}

- (SBSADefaultsContext)mutatable
{
  return self->_mutatable;
}

@end