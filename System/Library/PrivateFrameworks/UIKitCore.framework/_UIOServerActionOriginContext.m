@interface _UIOServerActionOriginContext
+ (BOOL)supportsSecureCoding;
+ (id)defaultOriginContext;
+ (id)originContextForView:(id)a3 referencePoint:(CGPoint)a4;
- (CGPoint)layerReferencePoint;
- (CGPoint)translatedReferencePointForDestinationView:(id)a3;
- (NSString)sceneIdentity;
- (NSString)spaceIdentifier;
- (_UIOServerActionOriginContext)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)layerId;
- (unsigned)contextId;
- (void)_configureWithWindow:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIOServerActionOriginContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultOriginContext
{
  v2 = objc_alloc_init(_UIOServerActionOriginContext);
  v3 = +[UIWindowScene _keyWindowScene]();
  v4 = [v3 keyWindow];
  [(_UIOServerActionOriginContext *)v2 _configureWithWindow:v4];

  return v2;
}

+ (id)originContextForView:(id)a3 referencePoint:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v6 = a3;
  v7 = objc_alloc_init(_UIOServerActionOriginContext);
  v8 = [v6 _window];
  [(_UIOServerActionOriginContext *)v7 _configureWithWindow:v8];

  v9 = [v6 layer];

  v7->_layerId = CALayerGetRenderId();
  v7->_layerReferencePoint.CGFloat x = x;
  v7->_layerReferencePoint.CGFloat y = y;
  return v7;
}

- (void)_configureWithWindow:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 windowScene];
    id v6 = [v5 _FBSScene];
    unsigned int v7 = [v4 _contextId];

    self->_contextId = v7;
    v8 = [v6 identityToken];
    v9 = [v8 stringRepresentation];
    sceneIdentitCGFloat y = self->_sceneIdentity;
    self->_sceneIdentitCGFloat y = v9;

    v11 = [v5 systemShellHostingEnvironment];
    v12 = [v11 systemShellHostingSpaceIdentifier];
    spaceIdentifier = self->_spaceIdentifier;
    self->_spaceIdentifier = v12;

    if (!self->_spaceIdentifier)
    {
      v14 = UIOLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (objc_class *)objc_opt_class();
        v16 = NSStringFromClass(v15);
        int v18 = 138543618;
        v19 = v16;
        __int16 v20 = 2050;
        v21 = v5;
        _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEFAULT, "Could not find a systemShellHostingSpaceIdentifier for scene: <%{public}@: %{public}p>", (uint8_t *)&v18, 0x16u);
      }
      v17 = self->_spaceIdentifier;
      self->_spaceIdentifier = (NSString *)@"Unspecified";
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  sceneIdentitCGFloat y = self->_sceneIdentity;
  id v7 = v4;
  if (sceneIdentity)
  {
    [v4 encodeObject:sceneIdentity forKey:@"scene"];
    id v4 = v7;
  }
  spaceIdentifier = self->_spaceIdentifier;
  if (spaceIdentifier)
  {
    [v7 encodeObject:spaceIdentifier forKey:@"space"];
    id v4 = v7;
  }
  [v4 encodeInt64:self->_layerId forKey:@"layer"];
  [v7 encodeInt32:self->_contextId forKey:@"context"];
  objc_msgSend(v7, "encodeCGPoint:forKey:", @"layerPoint", self->_layerReferencePoint.x, self->_layerReferencePoint.y);
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ([(_UIOServerActionOriginContext *)self isMemberOfClass:objc_opt_class()])
  {
    return self;
  }
  else
  {
    id v4 = objc_alloc_init(_UIOServerActionOriginContext);
    objc_storeStrong((id *)&v4->_sceneIdentity, self->_sceneIdentity);
    objc_storeStrong((id *)&v4->_spaceIdentifier, self->_spaceIdentifier);
    v4->_layerReferencePoint = self->_layerReferencePoint;
    v4->_layerId = self->_layerId;
    v4->_contextId = self->_contextId;
    return v4;
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(_UIOMutableActionOriginContext);
  [(_UIOMutableActionOriginContext *)v4 setSceneIdentity:self->_sceneIdentity];
  [(_UIOMutableActionOriginContext *)v4 setSpaceIdentifier:self->_spaceIdentifier];
  -[_UIOMutableActionOriginContext setLayerReferencePoint:](v4, "setLayerReferencePoint:", self->_layerReferencePoint.x, self->_layerReferencePoint.y);
  [(_UIOMutableActionOriginContext *)v4 setLayerId:self->_layerId];
  [(_UIOMutableActionOriginContext *)v4 setContextId:self->_contextId];
  return v4;
}

- (_UIOServerActionOriginContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_UIOServerActionOriginContext *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scene"];
    sceneIdentitCGFloat y = v5->_sceneIdentity;
    v5->_sceneIdentitCGFloat y = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"space"];
    spaceIdentifier = v5->_spaceIdentifier;
    v5->_spaceIdentifier = (NSString *)v8;

    [v4 decodeCGPointForKey:@"layerPoint"];
    v5->_layerReferencePoint.CGFloat x = v10;
    v5->_layerReferencePoint.CGFloat y = v11;
    v5->_layerId = [v4 decodeInt64ForKey:@"layer"];
    v5->_contextId = [v4 decodeInt32ForKey:@"context"];
  }

  return v5;
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(sel_sceneIdentity);
  CGFloat v11 = v3;
  id v4 = NSStringFromSelector(sel_spaceIdentifier);
  v12 = v4;
  v5 = NSStringFromSelector(sel_layerReferencePoint);
  v13 = v5;
  uint64_t v6 = NSStringFromSelector(sel_layerId);
  v14 = v6;
  id v7 = NSStringFromSelector(sel_contextId);
  v15 = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:5];
  v9 = +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v8, v11, v12, v13, v14);

  return v9;
}

- (CGPoint)translatedReferencePointForDestinationView:(id)a3
{
  id v4 = a3;
  v5 = [v4 window];
  [v5 _contextId];

  uint64_t v6 = [v4 layer];

  CALayerGetRenderId();
  memset(&v23, 0, sizeof(v23));
  BKSHIDServicesGetCALayerTransform();
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  long long v20 = v7;
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  long long v21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  long long v22 = v8;
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  long long v15 = *MEMORY[0x1E4F39B10];
  long long v16 = v9;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  long long v17 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  long long v18 = v10;
  if (self->_contextId) {
    BKSHIDServicesGetCALayerTransform();
  }
  CA_CGPointApplyTransform();
  CATransform3D v14 = v23;
  CATransform3DInvert(&v13, &v14);
  CA_CGPointApplyTransform();
  result.CGFloat y = v12;
  result.CGFloat x = v11;
  return result;
}

- (NSString)sceneIdentity
{
  return self->_sceneIdentity;
}

- (NSString)spaceIdentifier
{
  return self->_spaceIdentifier;
}

- (unsigned)contextId
{
  return self->_contextId;
}

- (unint64_t)layerId
{
  return self->_layerId;
}

- (CGPoint)layerReferencePoint
{
  double x = self->_layerReferencePoint.x;
  double y = self->_layerReferencePoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spaceIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneIdentity, 0);
}

@end