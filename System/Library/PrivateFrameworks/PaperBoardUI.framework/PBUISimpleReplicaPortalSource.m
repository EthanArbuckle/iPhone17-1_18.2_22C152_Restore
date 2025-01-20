@interface PBUISimpleReplicaPortalSource
- (BOOL)effectsAreBakedIn;
- (NSString)cacheIdentifier;
- (PBUISimpleReplicaPortalSource)initWithTargetView:(id)a3 cacheIdentifier:(id)a4 legibilitySettings:(id)a5 effectsAreBakedIn:(BOOL)a6;
- (UIView)targetView;
- (_UILegibilitySettings)legibilitySettings;
- (void)setCacheIdentifier:(id)a3;
- (void)setEffectsAreBakedIn:(BOOL)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setTargetView:(id)a3;
@end

@implementation PBUISimpleReplicaPortalSource

- (PBUISimpleReplicaPortalSource)initWithTargetView:(id)a3 cacheIdentifier:(id)a4 legibilitySettings:(id)a5 effectsAreBakedIn:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = [(PBUISimpleReplicaPortalSource *)self init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_targetView, a3);
    uint64_t v16 = [v12 copy];
    cacheIdentifier = v15->_cacheIdentifier;
    v15->_cacheIdentifier = (NSString *)v16;

    uint64_t v18 = [v13 copy];
    legibilitySettings = v15->_legibilitySettings;
    v15->_legibilitySettings = (_UILegibilitySettings *)v18;

    v15->_effectsAreBakedIn = a6;
  }

  return v15;
}

- (NSString)cacheIdentifier
{
  return self->_cacheIdentifier;
}

- (void)setCacheIdentifier:(id)a3
{
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
}

- (BOOL)effectsAreBakedIn
{
  return self->_effectsAreBakedIn;
}

- (void)setEffectsAreBakedIn:(BOOL)a3
{
  self->_effectsAreBakedIn = a3;
}

- (UIView)targetView
{
  return self->_targetView;
}

- (void)setTargetView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetView, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_cacheIdentifier, 0);
}

@end