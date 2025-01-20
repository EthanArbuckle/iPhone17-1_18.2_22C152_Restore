@interface UIDraggingSessionConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)configurationWithItemCollection:(id)a3 dataProviderEndpoint:(id)a4 initialCentroidInSourceWindow:(CAPoint3D)a5 sourceView:(id)a6;
- (BOOL)avoidsKeyboardSuppression;
- (BOOL)initiatedWithPointer;
- (BOOL)resizable;
- (BOOL)rotatable;
- (BOOL)sessionIsRestrictedToLocalDevice;
- (BOOL)sessionIsRestrictedToSourceApplication;
- (BOOL)sourceExpectsStagedLegacySelectors;
- (BOOL)supportsSystemDrag;
- (BOOL)wantsElasticEffects;
- (BOOL)wantsPresentationUpdates;
- (CAPoint3D)_initialCentroid;
- (CAPoint3D)initialCentroid3D;
- (CAPoint3D)initialCentroidInSourceWindow;
- (CGPoint)initialCentroid;
- (CGSize)maximumResizableSize;
- (CGSize)minimumResizableSize;
- (CGSize)originalScale;
- (NSArray)touchIDs;
- (NSIndexSet)preferredPreviewIndexes;
- (NSString)persistentSceneIdentifier;
- (NSString)sceneIdentifier;
- (NSXPCListenerEndpoint)axEndpoint;
- (NSXPCListenerEndpoint)dataProviderEndpoint;
- (PBItemCollection)itemCollection;
- (UIDraggingSessionConfiguration)initWithCoder:(id)a3;
- (UIDraggingSystemTouchRoutingPolicy)routingPolicy;
- (_DUITargetLayerDescriptor)coordinateSpaceSourceLayerContext;
- (double)originalRotation;
- (void)encodeWithCoder:(id)a3;
- (void)setAvoidsKeyboardSuppression:(BOOL)a3;
- (void)setAxEndpoint:(id)a3;
- (void)setCoordinateSpaceSourceLayerContext:(id)a3;
- (void)setDataProviderEndpoint:(id)a3;
- (void)setInitialCentroid:(CGPoint)a3;
- (void)setInitialCentroidInSourceWindow:(CAPoint3D)a3;
- (void)setInitiatedWithPointer:(BOOL)a3;
- (void)setItemCollection:(id)a3;
- (void)setMaximumResizableSize:(CGSize)a3;
- (void)setMinimumResizableSize:(CGSize)a3;
- (void)setOriginalRotation:(double)a3;
- (void)setOriginalScale:(CGSize)a3;
- (void)setPersistentSceneIdentifier:(id)a3;
- (void)setPreferredPreviewIndexes:(id)a3;
- (void)setResizable:(BOOL)a3;
- (void)setRotatable:(BOOL)a3;
- (void)setRoutingPolicy:(id)a3;
- (void)setSceneIdentifier:(id)a3;
- (void)setSessionIsRestrictedToLocalDevice:(BOOL)a3;
- (void)setSessionIsRestrictedToSourceApplication:(BOOL)a3;
- (void)setSourceExpectsStagedLegacySelectors:(BOOL)a3;
- (void)setSupportsSystemDrag:(BOOL)a3;
- (void)setTouchIDs:(id)a3;
- (void)setWantsElasticEffects:(BOOL)a3;
- (void)setWantsPresentationUpdates:(BOOL)a3;
- (void)set_initialCentroid:(CAPoint3D)a3;
@end

@implementation UIDraggingSessionConfiguration

- (CGPoint)initialCentroid
{
  double x = self->_initialCentroid.x;
  double y = self->_initialCentroid.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialCentroid:(CGPoint)a3
{
  self->_initialCentroid.double x = a3.x;
  self->_initialCentroid.double y = a3.y;
  self->_initialCentroid.z = 0.0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIDraggingSessionConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v72.receiver = self;
  v72.super_class = (Class)UIDraggingSessionConfiguration;
  v5 = [(UIDraggingSessionConfiguration *)&v72 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v71 = v5;
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"touchIDs"];
    touchIDs = v71->_touchIDs;
    v71->_touchIDs = (NSArray *)v9;

    v70 = v71;
    [v4 decodeCGPointForKey:@"initialCentroid"];
    v71->_initialCentroid.double x = v11;
    v70->_initialCentroid.double y = v12;
    v70->_initialCentroid.z = 0.0;
    v69 = v70;
    [v4 decodeCGPointForKey:@"initialCentroidInSourceWindow"];
    v70->_initialCentroidInSourceWindow.double x = v13;
    v69->_initialCentroidInSourceWindow.double y = v14;
    v69->_initialCentroidInSourceWindow.z = 0.0;
    uint64_t v15 = objc_opt_class();
    v68 = v69;
    uint64_t v16 = [v4 decodeObjectOfClass:v15 forKey:@"coordinateSpaceSourceLayerContext"];
    coordinateSpaceSourceLayerContext = v68->_coordinateSpaceSourceLayerContext;
    v68->_coordinateSpaceSourceLayerContext = (_DUITargetLayerDescriptor *)v16;

    uint64_t v18 = objc_opt_class();
    v67 = v68;
    uint64_t v19 = [v4 decodeObjectOfClass:v18 forKey:@"routingPolicy"];
    routingPolicdouble y = v67->_routingPolicy;
    v67->_routingPolicdouble y = (UIDraggingSystemTouchRoutingPolicy *)v19;

    v21 = [MEMORY[0x1E4F881C8] allowedClassesForSecureCoding];
    v66 = v67;
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"itemCollection"];
    itemCollection = v66->_itemCollection;
    v66->_itemCollection = (PBItemCollection *)v22;

    uint64_t v24 = objc_opt_class();
    v65 = v66;
    uint64_t v25 = [v4 decodeObjectOfClass:v24 forKey:@"dataProviderEndpoint"];
    dataProviderEndpoint = v65->_dataProviderEndpoint;
    v65->_dataProviderEndpoint = (NSXPCListenerEndpoint *)v25;

    uint64_t v27 = objc_opt_class();
    v64 = v65;
    uint64_t v28 = [v4 decodeObjectOfClass:v27 forKey:@"axEndpoint"];
    axEndpoint = v64->_axEndpoint;
    v64->_axEndpoint = (NSXPCListenerEndpoint *)v28;

    v63 = v64;
    v63[8] = [v4 decodeBoolForKey:@"supportsSystemDrag"];
    uint64_t v30 = objc_opt_class();
    v62 = v63;
    uint64_t v31 = [v4 decodeObjectOfClass:v30 forKey:@"sceneIdentifier"];
    v32 = (void *)v62[9];
    v62[9] = v31;

    uint64_t v33 = objc_opt_class();
    v61 = v62;
    uint64_t v34 = [v4 decodeObjectOfClass:v33 forKey:@"persistentSceneIdentifier"];
    v35 = (void *)v61[10];
    v61[10] = v34;

    v60 = v61;
    v60[9] = [v4 decodeBoolForKey:@"initiatedWithPointer"];
    v36 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    v59 = v60;
    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"preferredPreviewIndexes"];
    v38 = (void *)v59[11];
    v59[11] = v37;

    v58 = v59;
    v58[10] = [v4 decodeBoolForKey:@"avoidsKeyboardSuppression"];
    v57 = v58;
    v57[11] = [v4 decodeBoolForKey:@"rotatable"];
    v56 = v57;
    v56[12] = [v4 decodeBoolForKey:@"resizable"];
    v55 = v56;
    [v4 decodeCGSizeForKey:@"minimumResizableSize"];
    *((void *)v56 + 13) = v39;
    v55[14] = v40;
    v54 = v55;
    [v4 decodeCGSizeForKey:@"maximumResizableSize"];
    v55[15] = v41;
    v54[16] = v42;
    v53 = v54;
    v53[13] = [v4 decodeBoolForKey:@"wantsElasticEffects"];
    v52 = v53;
    [v4 decodeDoubleForKey:@"originalRotation"];
    v52[12] = v43;
    v51 = v52;
    [v4 decodeCGSizeForKey:@"originalScale"];
    v52[17] = v44;
    v51[18] = v45;
    v50 = v51;
    v50[14] = [v4 decodeBoolForKey:@"wantsPresentationUpdates"];
    v49 = v50;
    v49[15] = [v4 decodeBoolForKey:@"sessionIsRestrictedToSourceApplication"];
    v48 = v49;
    v48[16] = [v4 decodeBoolForKey:@"sessionIsRestrictedToLocalDevice"];
    v47 = v48;
    v47[17] = [v4 decodeBoolForKey:@"sourceExpectsStagedLegacySelectors"];
  }
  return v5;
}

__CFString *__48__UIDraggingSessionConfiguration_initWithCoder___block_invoke()
{
  return @"touchIDs";
}

__CFString *__48__UIDraggingSessionConfiguration_initWithCoder___block_invoke_2()
{
  return @"initialCentroid";
}

__CFString *__48__UIDraggingSessionConfiguration_initWithCoder___block_invoke_3()
{
  return @"initialCentroidInSourceWindow";
}

__CFString *__48__UIDraggingSessionConfiguration_initWithCoder___block_invoke_4()
{
  return @"coordinateSpaceSourceLayerContext";
}

__CFString *__48__UIDraggingSessionConfiguration_initWithCoder___block_invoke_5()
{
  return @"routingPolicy";
}

__CFString *__48__UIDraggingSessionConfiguration_initWithCoder___block_invoke_6()
{
  return @"itemCollection";
}

__CFString *__48__UIDraggingSessionConfiguration_initWithCoder___block_invoke_7()
{
  return @"dataProviderEndpoint";
}

__CFString *__48__UIDraggingSessionConfiguration_initWithCoder___block_invoke_8()
{
  return @"axEndpoint";
}

__CFString *__48__UIDraggingSessionConfiguration_initWithCoder___block_invoke_9()
{
  return @"supportsSystemDrag";
}

__CFString *__48__UIDraggingSessionConfiguration_initWithCoder___block_invoke_10()
{
  return @"sceneIdentifier";
}

__CFString *__48__UIDraggingSessionConfiguration_initWithCoder___block_invoke_11()
{
  return @"persistentSceneIdentifier";
}

__CFString *__48__UIDraggingSessionConfiguration_initWithCoder___block_invoke_12()
{
  return @"initiatedWithPointer";
}

__CFString *__48__UIDraggingSessionConfiguration_initWithCoder___block_invoke_13()
{
  return @"preferredPreviewIndexes";
}

__CFString *__48__UIDraggingSessionConfiguration_initWithCoder___block_invoke_14()
{
  return @"avoidsKeyboardSuppression";
}

__CFString *__48__UIDraggingSessionConfiguration_initWithCoder___block_invoke_15()
{
  return @"rotatable";
}

__CFString *__48__UIDraggingSessionConfiguration_initWithCoder___block_invoke_16()
{
  return @"resizable";
}

__CFString *__48__UIDraggingSessionConfiguration_initWithCoder___block_invoke_17()
{
  return @"minimumResizableSize";
}

__CFString *__48__UIDraggingSessionConfiguration_initWithCoder___block_invoke_18()
{
  return @"maximumResizableSize";
}

__CFString *__48__UIDraggingSessionConfiguration_initWithCoder___block_invoke_19()
{
  return @"wantsElasticEffects";
}

__CFString *__48__UIDraggingSessionConfiguration_initWithCoder___block_invoke_20()
{
  return @"originalRotation";
}

__CFString *__48__UIDraggingSessionConfiguration_initWithCoder___block_invoke_21()
{
  return @"originalScale";
}

__CFString *__48__UIDraggingSessionConfiguration_initWithCoder___block_invoke_22()
{
  return @"wantsPresentationUpdates";
}

__CFString *__48__UIDraggingSessionConfiguration_initWithCoder___block_invoke_23()
{
  return @"sessionIsRestrictedToSourceApplication";
}

__CFString *__48__UIDraggingSessionConfiguration_initWithCoder___block_invoke_24()
{
  return @"sessionIsRestrictedToLocalDevice";
}

__CFString *__48__UIDraggingSessionConfiguration_initWithCoder___block_invoke_25()
{
  return @"sourceExpectsStagedLegacySelectors";
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(UIDraggingSessionConfiguration *)self touchIDs];
  [v4 encodeObject:v5 forKey:@"touchIDs"];

  objc_msgSend(v4, "encodeCGPoint:forKey:", @"initialCentroid", self->_initialCentroid.x, self->_initialCentroid.y);
  objc_msgSend(v4, "encodeCGPoint:forKey:", @"initialCentroidInSourceWindow", self->_initialCentroidInSourceWindow.x, self->_initialCentroidInSourceWindow.y);
  v6 = [(UIDraggingSessionConfiguration *)self routingPolicy];
  [v4 encodeObject:v6 forKey:@"routingPolicy"];

  uint64_t v7 = [(UIDraggingSessionConfiguration *)self itemCollection];
  [v4 encodeObject:v7 forKey:@"itemCollection"];

  v8 = [(UIDraggingSessionConfiguration *)self dataProviderEndpoint];
  [v4 encodeObject:v8 forKey:@"dataProviderEndpoint"];

  uint64_t v9 = [(UIDraggingSessionConfiguration *)self axEndpoint];
  [v4 encodeObject:v9 forKey:@"axEndpoint"];

  objc_msgSend(v4, "encodeBool:forKey:", -[UIDraggingSessionConfiguration supportsSystemDrag](self, "supportsSystemDrag"), @"supportsSystemDrag");
  v10 = [(UIDraggingSessionConfiguration *)self sceneIdentifier];
  [v4 encodeObject:v10 forKey:@"sceneIdentifier"];

  double v11 = [(UIDraggingSessionConfiguration *)self persistentSceneIdentifier];
  [v4 encodeObject:v11 forKey:@"persistentSceneIdentifier"];

  objc_msgSend(v4, "encodeBool:forKey:", -[UIDraggingSessionConfiguration initiatedWithPointer](self, "initiatedWithPointer"), @"initiatedWithPointer");
  double v12 = [(UIDraggingSessionConfiguration *)self coordinateSpaceSourceLayerContext];

  if (v12)
  {
    double v13 = [(UIDraggingSessionConfiguration *)self coordinateSpaceSourceLayerContext];
    [v4 encodeObject:v13 forKey:@"coordinateSpaceSourceLayerContext"];
  }
  double v14 = [(UIDraggingSessionConfiguration *)self preferredPreviewIndexes];

  if (v14)
  {
    uint64_t v15 = [(UIDraggingSessionConfiguration *)self preferredPreviewIndexes];
    [v4 encodeObject:v15 forKey:@"preferredPreviewIndexes"];
  }
  objc_msgSend(v4, "encodeBool:forKey:", -[UIDraggingSessionConfiguration avoidsKeyboardSuppression](self, "avoidsKeyboardSuppression"), @"avoidsKeyboardSuppression");
  objc_msgSend(v4, "encodeBool:forKey:", -[UIDraggingSessionConfiguration rotatable](self, "rotatable"), @"rotatable");
  objc_msgSend(v4, "encodeBool:forKey:", -[UIDraggingSessionConfiguration resizable](self, "resizable"), @"resizable");
  [(UIDraggingSessionConfiguration *)self minimumResizableSize];
  objc_msgSend(v4, "encodeCGSize:forKey:", @"minimumResizableSize");
  [(UIDraggingSessionConfiguration *)self maximumResizableSize];
  objc_msgSend(v4, "encodeCGSize:forKey:", @"maximumResizableSize");
  objc_msgSend(v4, "encodeBool:forKey:", -[UIDraggingSessionConfiguration wantsElasticEffects](self, "wantsElasticEffects"), @"wantsElasticEffects");
  [(UIDraggingSessionConfiguration *)self originalRotation];
  objc_msgSend(v4, "encodeDouble:forKey:", @"originalRotation");
  [(UIDraggingSessionConfiguration *)self originalScale];
  objc_msgSend(v4, "encodeCGSize:forKey:", @"originalScale");
  objc_msgSend(v4, "encodeBool:forKey:", -[UIDraggingSessionConfiguration wantsPresentationUpdates](self, "wantsPresentationUpdates"), @"wantsPresentationUpdates");
  objc_msgSend(v4, "encodeBool:forKey:", -[UIDraggingSessionConfiguration sessionIsRestrictedToSourceApplication](self, "sessionIsRestrictedToSourceApplication"), @"sessionIsRestrictedToSourceApplication");
  objc_msgSend(v4, "encodeBool:forKey:", -[UIDraggingSessionConfiguration sessionIsRestrictedToLocalDevice](self, "sessionIsRestrictedToLocalDevice"), @"sessionIsRestrictedToLocalDevice");
  objc_msgSend(v4, "encodeBool:forKey:", -[UIDraggingSessionConfiguration sourceExpectsStagedLegacySelectors](self, "sourceExpectsStagedLegacySelectors"), @"sourceExpectsStagedLegacySelectors");
}

__CFString *__50__UIDraggingSessionConfiguration_encodeWithCoder___block_invoke()
{
  return @"touchIDs";
}

__CFString *__50__UIDraggingSessionConfiguration_encodeWithCoder___block_invoke_2()
{
  return @"initialCentroid";
}

__CFString *__50__UIDraggingSessionConfiguration_encodeWithCoder___block_invoke_3()
{
  return @"initialCentroidInSourceWindow";
}

__CFString *__50__UIDraggingSessionConfiguration_encodeWithCoder___block_invoke_4()
{
  return @"routingPolicy";
}

__CFString *__50__UIDraggingSessionConfiguration_encodeWithCoder___block_invoke_5()
{
  return @"itemCollection";
}

__CFString *__50__UIDraggingSessionConfiguration_encodeWithCoder___block_invoke_6()
{
  return @"dataProviderEndpoint";
}

__CFString *__50__UIDraggingSessionConfiguration_encodeWithCoder___block_invoke_7()
{
  return @"axEndpoint";
}

__CFString *__50__UIDraggingSessionConfiguration_encodeWithCoder___block_invoke_8()
{
  return @"supportsSystemDrag";
}

__CFString *__50__UIDraggingSessionConfiguration_encodeWithCoder___block_invoke_9()
{
  return @"sceneIdentifier";
}

__CFString *__50__UIDraggingSessionConfiguration_encodeWithCoder___block_invoke_10()
{
  return @"persistentSceneIdentifier";
}

__CFString *__50__UIDraggingSessionConfiguration_encodeWithCoder___block_invoke_11()
{
  return @"initiatedWithPointer";
}

__CFString *__50__UIDraggingSessionConfiguration_encodeWithCoder___block_invoke_12()
{
  return @"coordinateSpaceSourceLayerContext";
}

__CFString *__50__UIDraggingSessionConfiguration_encodeWithCoder___block_invoke_13()
{
  return @"preferredPreviewIndexes";
}

__CFString *__50__UIDraggingSessionConfiguration_encodeWithCoder___block_invoke_14()
{
  return @"avoidsKeyboardSuppression";
}

__CFString *__50__UIDraggingSessionConfiguration_encodeWithCoder___block_invoke_15()
{
  return @"rotatable";
}

__CFString *__50__UIDraggingSessionConfiguration_encodeWithCoder___block_invoke_16()
{
  return @"resizable";
}

__CFString *__50__UIDraggingSessionConfiguration_encodeWithCoder___block_invoke_17()
{
  return @"minimumResizableSize";
}

__CFString *__50__UIDraggingSessionConfiguration_encodeWithCoder___block_invoke_18()
{
  return @"maximumResizableSize";
}

__CFString *__50__UIDraggingSessionConfiguration_encodeWithCoder___block_invoke_19()
{
  return @"wantsElasticEffects";
}

__CFString *__50__UIDraggingSessionConfiguration_encodeWithCoder___block_invoke_20()
{
  return @"originalRotation";
}

__CFString *__50__UIDraggingSessionConfiguration_encodeWithCoder___block_invoke_21()
{
  return @"originalScale";
}

__CFString *__50__UIDraggingSessionConfiguration_encodeWithCoder___block_invoke_22()
{
  return @"wantsPresentationUpdates";
}

__CFString *__50__UIDraggingSessionConfiguration_encodeWithCoder___block_invoke_23()
{
  return @"sessionIsRestrictedToSourceApplication";
}

__CFString *__50__UIDraggingSessionConfiguration_encodeWithCoder___block_invoke_24()
{
  return @"sessionIsRestrictedToLocalDevice";
}

__CFString *__50__UIDraggingSessionConfiguration_encodeWithCoder___block_invoke_25()
{
  return @"sourceExpectsStagedLegacySelectors";
}

- (CAPoint3D)_initialCentroid
{
  double x = self->_initialCentroid.x;
  double y = self->_initialCentroid.y;
  double z = self->_initialCentroid.z;
  result.double z = z;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)set_initialCentroid:(CAPoint3D)a3
{
  self->_initialCentroid = a3;
}

- (NSArray)touchIDs
{
  return self->_touchIDs;
}

- (void)setTouchIDs:(id)a3
{
}

- (_DUITargetLayerDescriptor)coordinateSpaceSourceLayerContext
{
  return self->_coordinateSpaceSourceLayerContext;
}

- (void)setCoordinateSpaceSourceLayerContext:(id)a3
{
}

- (UIDraggingSystemTouchRoutingPolicy)routingPolicy
{
  return self->_routingPolicy;
}

- (void)setRoutingPolicy:(id)a3
{
}

- (PBItemCollection)itemCollection
{
  return self->_itemCollection;
}

- (void)setItemCollection:(id)a3
{
}

- (NSXPCListenerEndpoint)dataProviderEndpoint
{
  return self->_dataProviderEndpoint;
}

- (void)setDataProviderEndpoint:(id)a3
{
}

- (NSXPCListenerEndpoint)axEndpoint
{
  return self->_axEndpoint;
}

- (void)setAxEndpoint:(id)a3
{
}

- (BOOL)supportsSystemDrag
{
  return self->_supportsSystemDrag;
}

- (void)setSupportsSystemDrag:(BOOL)a3
{
  self->_supportsSystemDrag = a3;
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(id)a3
{
}

- (NSString)persistentSceneIdentifier
{
  return self->_persistentSceneIdentifier;
}

- (void)setPersistentSceneIdentifier:(id)a3
{
}

- (BOOL)initiatedWithPointer
{
  return self->_initiatedWithPointer;
}

- (void)setInitiatedWithPointer:(BOOL)a3
{
  self->_initiatedWithPointer = a3;
}

- (NSIndexSet)preferredPreviewIndexes
{
  return self->_preferredPreviewIndexes;
}

- (void)setPreferredPreviewIndexes:(id)a3
{
}

- (BOOL)avoidsKeyboardSuppression
{
  return self->_avoidsKeyboardSuppression;
}

- (void)setAvoidsKeyboardSuppression:(BOOL)a3
{
  self->_avoidsKeyboardSuppression = a3;
}

- (BOOL)rotatable
{
  return self->_rotatable;
}

- (void)setRotatable:(BOOL)a3
{
  self->_rotatable = a3;
}

- (BOOL)resizable
{
  return self->_resizable;
}

- (void)setResizable:(BOOL)a3
{
  self->_resizable = a3;
}

- (CGSize)minimumResizableSize
{
  double width = self->_minimumResizableSize.width;
  double height = self->_minimumResizableSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMinimumResizableSize:(CGSize)a3
{
  self->_minimumResizableSize = a3;
}

- (CGSize)maximumResizableSize
{
  double width = self->_maximumResizableSize.width;
  double height = self->_maximumResizableSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaximumResizableSize:(CGSize)a3
{
  self->_maximumResizableSize = a3;
}

- (BOOL)wantsElasticEffects
{
  return self->_wantsElasticEffects;
}

- (void)setWantsElasticEffects:(BOOL)a3
{
  self->_wantsElasticEffects = a3;
}

- (double)originalRotation
{
  return self->_originalRotation;
}

- (void)setOriginalRotation:(double)a3
{
  self->_originalRotation = a3;
}

- (CGSize)originalScale
{
  double width = self->_originalScale.width;
  double height = self->_originalScale.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setOriginalScale:(CGSize)a3
{
  self->_originalScale = a3;
}

- (CAPoint3D)initialCentroid3D
{
  double x = self->_initialCentroid3D.x;
  double y = self->_initialCentroid3D.y;
  double z = self->_initialCentroid3D.z;
  result.double z = z;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CAPoint3D)initialCentroidInSourceWindow
{
  double x = self->_initialCentroidInSourceWindow.x;
  double y = self->_initialCentroidInSourceWindow.y;
  double z = self->_initialCentroidInSourceWindow.z;
  result.double z = z;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialCentroidInSourceWindow:(CAPoint3D)a3
{
  self->_initialCentroidInSourceWindow = a3;
}

- (BOOL)wantsPresentationUpdates
{
  return self->_wantsPresentationUpdates;
}

- (void)setWantsPresentationUpdates:(BOOL)a3
{
  self->_wantsPresentationUpdates = a3;
}

- (BOOL)sessionIsRestrictedToSourceApplication
{
  return self->_sessionIsRestrictedToSourceApplication;
}

- (void)setSessionIsRestrictedToSourceApplication:(BOOL)a3
{
  self->_sessionIsRestrictedToSourceApplication = a3;
}

- (BOOL)sessionIsRestrictedToLocalDevice
{
  return self->_sessionIsRestrictedToLocalDevice;
}

- (void)setSessionIsRestrictedToLocalDevice:(BOOL)a3
{
  self->_sessionIsRestrictedToLocalDevice = a3;
}

- (BOOL)sourceExpectsStagedLegacySelectors
{
  return self->_sourceExpectsStagedLegacySelectors;
}

- (void)setSourceExpectsStagedLegacySelectors:(BOOL)a3
{
  self->_sourceExpectsStagedLegacySelectors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredPreviewIndexes, 0);
  objc_storeStrong((id *)&self->_persistentSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_axEndpoint, 0);
  objc_storeStrong((id *)&self->_dataProviderEndpoint, 0);
  objc_storeStrong((id *)&self->_itemCollection, 0);
  objc_storeStrong((id *)&self->_routingPolicy, 0);
  objc_storeStrong((id *)&self->_coordinateSpaceSourceLayerContext, 0);
  objc_storeStrong((id *)&self->_touchIDs, 0);
}

+ (id)configurationWithItemCollection:(id)a3 dataProviderEndpoint:(id)a4 initialCentroidInSourceWindow:(CAPoint3D)a5 sourceView:(id)a6
{
  double z = a5.z;
  double y = a5.y;
  double x = a5.x;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  double v14 = [v11 _window];
  uint64_t v15 = [v14 windowScene];

  uint64_t v16 = objc_opt_new();
  [v16 setItemCollection:v13];

  [v16 setDataProviderEndpoint:v12];
  v17 = objc_alloc_init(_DUITargetLayerDescriptor);
  uint64_t v18 = [v11 layer];
  uint64_t v19 = [v18 context];
  -[_DUITargetLayerDescriptor setContextID:](v17, "setContextID:", [v19 contextId]);

  v20 = [v11 layer];
  [(_DUITargetLayerDescriptor *)v17 setRenderID:CALayerGetRenderId()];

  v21 = [v15 systemShellHostingEnvironment];
  uint64_t v22 = [v21 systemShellHostingSpaceIdentifier];
  [(_DUITargetLayerDescriptor *)v17 setSystemShellHostingSpaceIdentifier:v22];

  [v16 setCoordinateSpaceSourceLayerContext:v17];
  v23 = [v15 _sceneIdentifier];
  [v16 setSceneIdentifier:v23];

  uint64_t v24 = [v15 session];
  uint64_t v25 = [v24 persistentIdentifier];
  [v16 setPersistentSceneIdentifier:v25];

  [v16 setInitiatedWithPointer:1];
  [v16 setSupportsSystemDrag:1];
  objc_msgSend(v16, "setInitialCentroidInSourceWindow:", x, y, z);
  [v16 setSourceExpectsStagedLegacySelectors:1];
  v26 = [v11 window];
  objc_msgSend(v11, "convertPoint:fromView:", v26, x, y);
  double v28 = v27;
  double v30 = v29;

  objc_msgSend(v16, "set_initialCentroid:", v28, v30, 0.0);
  return v16;
}

@end