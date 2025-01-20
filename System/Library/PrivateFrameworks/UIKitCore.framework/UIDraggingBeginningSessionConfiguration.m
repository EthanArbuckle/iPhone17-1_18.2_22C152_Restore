@interface UIDraggingBeginningSessionConfiguration
+ (UIDraggingBeginningSessionConfiguration)configurationWithItems:(id)a3 dataOwner:(int64_t)a4 initialCentroidInSourceWindow:(CAPoint3D)a5 requiredContextIds:(id)a6 sourceView:(id)a7 accessibilityEndpoint:(id)a8;
+ (UIDraggingBeginningSessionConfiguration)configurationWithItems:(id)a3 dataOwner:(int64_t)a4 pointerTouch:(id)a5 requiredContextIds:(id)a6 sourceView:(id)a7;
+ (UIDraggingBeginningSessionConfiguration)configurationWithItems:(id)a3 dataOwner:(int64_t)a4 touches:(id)a5 requiredContextIds:(id)a6 sourceView:(id)a7;
+ (UIDraggingBeginningSessionConfiguration)configurationWithItems:(id)a3 initialCentroidInSourceWindow:(CAPoint3D)a4 sourceView:(id)a5;
- (NSArray)items;
- (UIDraggingBeginningSessionConfiguration)initWithItems:(id)a3 dataOwner:(int64_t)a4 requiredContextIds:(id)a5 sourceView:(id)a6;
- (UIView)sourceView;
- (int64_t)dataOwner;
@end

@implementation UIDraggingBeginningSessionConfiguration

- (UIDraggingBeginningSessionConfiguration)initWithItems:(id)a3 dataOwner:(int64_t)a4 requiredContextIds:(id)a5 sourceView:(id)a6
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v43.receiver = self;
  v43.super_class = (Class)UIDraggingBeginningSessionConfiguration;
  v14 = [(UIDraggingBeginningSessionConfiguration *)&v43 init];
  v15 = v14;
  if (v14)
  {
    id v40 = v11;
    p_items = (void **)&v14->_items;
    objc_storeStrong((id *)&v14->_items, a3);
    v15->_dataOwner = a4;
    objc_storeStrong((id *)&v15->_sourceView, a6);
    v17 = [v13 layer];
    v18 = [v13 _window];
    v19 = [v18 windowScene];

    v20 = [v19 _sceneIdentifier];
    [(UIDraggingSessionConfiguration *)v15 setSceneIdentifier:v20];

    v21 = [v19 session];
    v22 = [v21 persistentIdentifier];
    [(UIDraggingSessionConfiguration *)v15 setPersistentSceneIdentifier:v22];

    v23 = objc_alloc_init(_DUITargetLayerDescriptor);
    v24 = [v17 context];
    -[_DUITargetLayerDescriptor setContextID:](v23, "setContextID:", [v24 contextId]);

    [(_DUITargetLayerDescriptor *)v23 setRenderID:CALayerGetRenderId()];
    v25 = [v19 systemShellHostingEnvironment];
    v26 = [v25 systemShellHostingSpaceIdentifier];
    [(_DUITargetLayerDescriptor *)v23 setSystemShellHostingSpaceIdentifier:v26];

    [(UIDraggingSessionConfiguration *)v15 setCoordinateSpaceSourceLayerContext:v23];
    [(UIDraggingSessionConfiguration *)v15 setSupportsSystemDrag:1];
    v27 = objc_alloc_init(UIDraggingSystemTouchRoutingPolicy);
    if ([v12 count])
    {
      v28 = [v13 _screen];
      v29 = [v28 displayConfiguration];
      uint64_t v30 = [v29 hardwareIdentifier];
      v31 = (void *)v30;
      v32 = _UIDraggingSystemEmbeddedDisplayIdentifier;
      if (v30) {
        v32 = (__CFString *)v30;
      }
      v39 = v19;
      v33 = v32;

      p_items = (void **)&v15->_items;
      v44 = v33;
      v45[0] = v12;
      v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];

      v19 = v39;
      [(UIDraggingSystemTouchRoutingPolicy *)v27 setContextIDsToAlwaysSendTouchesByDisplayIdentifier:v34];
    }
    [(UIDraggingSessionConfiguration *)v15 setRoutingPolicy:v27];

    v35 = [MEMORY[0x1E4F28E60] indexSet];
    v36 = *p_items;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __97__UIDraggingBeginningSessionConfiguration_initWithItems_dataOwner_requiredContextIds_sourceView___block_invoke;
    v41[3] = &unk_1E530A030;
    id v37 = v35;
    id v42 = v37;
    [v36 enumerateObjectsUsingBlock:v41];
    if ([v37 count]) {
      [(UIDraggingSessionConfiguration *)v15 setPreferredPreviewIndexes:v37];
    }

    id v11 = v40;
  }

  return v15;
}

void __97__UIDraggingBeginningSessionConfiguration_initWithItems_dataOwner_requiredContextIds_sourceView___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  uint64_t v5 = [v10 _targetedLiftPreview];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [v10 _targetedLiftPreview];
    v8 = [v7 _duiPreview];
    uint64_t v9 = [v8 preferredStackOrder];

    if ((v9 & 0x8000000000000000) == 0) {
      [*(id *)(a1 + 32) addIndex:a3];
    }
  }
}

+ (UIDraggingBeginningSessionConfiguration)configurationWithItems:(id)a3 dataOwner:(int64_t)a4 touches:(id)a5 requiredContextIds:(id)a6 sourceView:(id)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v30 = v12;
  v16 = (void *)[objc_alloc((Class)a1) initWithItems:v12 dataOwner:a4 requiredContextIds:v14 sourceView:v15];
  v17 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v18 = v13;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "_touchIdentifier"));
        [v17 addObject:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v20);
  }

  [v16 setTouchIDs:v17];
  v24 = [v15 window];
  objc_msgSend(v24, "_convertPointFromSceneReferenceSpace:", _CentroidOfTouches(v18, 0));
  double v26 = v25;
  double v28 = v27;

  objc_msgSend(v16, "setInitialCentroidInSourceWindow:", v26, v28, 0.0);
  objc_msgSend(v16, "set_initialCentroid:", _CentroidOfTouchesInView(v18, v15));

  return (UIDraggingBeginningSessionConfiguration *)v16;
}

+ (UIDraggingBeginningSessionConfiguration)configurationWithItems:(id)a3 dataOwner:(int64_t)a4 initialCentroidInSourceWindow:(CAPoint3D)a5 requiredContextIds:(id)a6 sourceView:(id)a7 accessibilityEndpoint:(id)a8
{
  double z = a5.z;
  double y = a5.y;
  double x = a5.x;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a3;
  uint64_t v20 = (void *)[objc_alloc((Class)a1) initWithItems:v19 dataOwner:a4 requiredContextIds:v18 sourceView:v17];

  [v20 setAxEndpoint:v16];
  objc_msgSend(v20, "setInitialCentroidInSourceWindow:", x, y, z);
  uint64_t v21 = [v17 window];
  objc_msgSend(v17, "convertPoint:fromView:", v21, x, y);
  double v23 = v22;
  double v25 = v24;

  objc_msgSend(v20, "set_initialCentroid:", v23, v25, 0.0);
  return (UIDraggingBeginningSessionConfiguration *)v20;
}

+ (UIDraggingBeginningSessionConfiguration)configurationWithItems:(id)a3 dataOwner:(int64_t)a4 pointerTouch:(id)a5 requiredContextIds:(id)a6 sourceView:(id)a7
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id v16 = (void *)[objc_alloc((Class)a1) initWithItems:v15 dataOwner:a4 requiredContextIds:v13 sourceView:v12];

  [v16 setInitiatedWithPointer:1];
  id v17 = [v12 window];
  v34[0] = v14;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  double v19 = _CentroidOfTouches(v18, 0);
  double v21 = v20;

  objc_msgSend(v17, "_convertPointFromSceneReferenceSpace:", v19, v21);
  double v23 = v22;
  double v25 = v24;

  objc_msgSend(v16, "setInitialCentroidInSourceWindow:", v23, v25, 0.0);
  id v33 = v14;
  double v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];

  double v27 = _CentroidOfTouchesInView(v26, v12);
  double v29 = v28;
  double v31 = v30;

  objc_msgSend(v16, "set_initialCentroid:", v27, v29, v31);
  return (UIDraggingBeginningSessionConfiguration *)v16;
}

+ (UIDraggingBeginningSessionConfiguration)configurationWithItems:(id)a3 initialCentroidInSourceWindow:(CAPoint3D)a4 sourceView:(id)a5
{
  double z = a4.z;
  double y = a4.y;
  double x = a4.x;
  id v10 = a5;
  id v11 = a3;
  id v12 = [v10 _window];
  id v13 = [v12 windowScene];

  id v14 = objc_alloc((Class)a1);
  id v15 = (void *)[v14 initWithItems:v11 dataOwner:1 requiredContextIds:MEMORY[0x1E4F1CBF0] sourceView:v10];

  objc_msgSend(v15, "setInitialCentroidInSourceWindow:", x, y, z);
  id v16 = objc_alloc_init(_DUITargetLayerDescriptor);
  id v17 = [v10 layer];
  id v18 = [v17 context];
  -[_DUITargetLayerDescriptor setContextID:](v16, "setContextID:", [v18 contextId]);

  double v19 = [v10 layer];
  [(_DUITargetLayerDescriptor *)v16 setRenderID:CALayerGetRenderId()];

  double v20 = [v13 systemShellHostingEnvironment];
  double v21 = [v20 systemShellHostingSpaceIdentifier];
  [(_DUITargetLayerDescriptor *)v16 setSystemShellHostingSpaceIdentifier:v21];

  [v15 setCoordinateSpaceSourceLayerContext:v16];
  double v22 = [v13 _sceneIdentifier];
  [v15 setSceneIdentifier:v22];

  double v23 = [v13 session];
  double v24 = [v23 persistentIdentifier];
  [v15 setPersistentSceneIdentifier:v24];

  [v15 setInitiatedWithPointer:1];
  [v15 setSupportsSystemDrag:1];
  objc_msgSend(v15, "setInitialCentroidInSourceWindow:", x, y, z);
  [v15 setWantsPresentationUpdates:1];
  double v25 = [v10 window];
  objc_msgSend(v10, "convertPoint:fromView:", v25, x, y);
  double v27 = v26;
  double v29 = v28;

  objc_msgSend(v15, "set_initialCentroid:", v27, v29, 0.0);
  return (UIDraggingBeginningSessionConfiguration *)v15;
}

- (int64_t)dataOwner
{
  return self->_dataOwner;
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
}

@end