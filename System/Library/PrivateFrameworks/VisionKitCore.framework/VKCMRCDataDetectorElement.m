@interface VKCMRCDataDetectorElement
+ (BOOL)supportsSecureCoding;
- (BCSAction)barcodeAction;
- (BOOL)childrenCreated;
- (BOOL)isMRCDataDetector;
- (CGRect)boundingBox;
- (CGRect)rectForMrcActionInPresentingViewController;
- (CGRect)sourceRectForPopoverActionPicker:(id)a3;
- (UIMenu)mrcMenu;
- (UIViewController)presentingViewControllerForMrcAction;
- (VKCMRCDataDetectorElement)initWithBarcodeObservation:(id)a3 action:(id)a4;
- (VKCMRCDataDetectorElement)initWithCoder:(id)a3;
- (VKCMRCDataDetectorElementDelegate)delegate;
- (VKQuad)quad;
- (VNBarcodeObservation)barcodeObservation;
- (id)boundingQuads;
- (id)children;
- (id)debugMenu;
- (id)presentingViewControllerForAction:(id)a3;
- (id)scannerResult;
- (id)stringValue;
- (unint64_t)dataDetectorTypes;
- (void)createChildrenIfNecessary;
- (void)encodeWithCoder:(id)a3;
- (void)setBarcodeAction:(id)a3;
- (void)setBarcodeObservation:(id)a3;
- (void)setBoundingBox:(CGRect)a3;
- (void)setChildrenCreated:(BOOL)a3;
- (void)setDataDetectorTypes:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setPresentingViewControllerForMrcAction:(id)a3;
- (void)setQuad:(id)a3;
- (void)setRectForMrcActionInPresentingViewController:(CGRect)a3;
@end

@implementation VKCMRCDataDetectorElement

- (VKCMRCDataDetectorElement)initWithBarcodeObservation:(id)a3 action:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)VKCMRCDataDetectorElement;
  v9 = [(VKCBaseDataDetectorElement *)&v20 init];
  if (v9)
  {
    if (!v8) {
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "action", "-[VKCMRCDataDetectorElement initWithBarcodeObservation:action:]", 0, 0, @"init for a Barcode Observtation, but there is no action");
    }
    objc_storeStrong((id *)v9 + 15, a3);
    uint64_t v10 = [v7 vkQuad];
    v11 = (void *)*((void *)v9 + 13);
    *((void *)v9 + 13) = v10;

    v12 = [v9 quad];
    [v12 boundingBox];
    *((void *)v9 + 19) = v13;
    *((void *)v9 + 20) = v14;
    *((void *)v9 + 21) = v15;
    *((void *)v9 + 22) = v16;

    long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)(v9 + 184) = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v9 + 200) = v17;
    uint64_t v18 = *((void *)v9 + 12) | 0x200000;
    if (!v8) {
      uint64_t v18 = 0;
    }
    *((void *)v9 + 12) = v18;
    objc_storeStrong((id *)v9 + 16, a4);
    [*((id *)v9 + 16) setDelegate:v9];
    [v9 createChildrenIfNecessary];
  }

  return (VKCMRCDataDetectorElement *)v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(VKCMRCDataDetectorElement *)self barcodeObservation];
  [v4 encodeObject:v5 forKey:@"BCO"];

  id v6 = [(VKCMRCDataDetectorElement *)self scannerResult];
  [v4 encodeObject:v6 forKey:@"Action"];
}

- (VKCMRCDataDetectorElement)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BCO"];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2050000000;
  id v6 = (void *)getBCSActionClass_softClass;
  uint64_t v15 = getBCSActionClass_softClass;
  if (!getBCSActionClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getBCSActionClass_block_invoke;
    v11[3] = &unk_1E6BF0A90;
    v11[4] = &v12;
    __getBCSActionClass_block_invoke((uint64_t)v11);
    id v6 = (void *)v13[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);
  id v8 = [v4 decodeObjectOfClass:v7 forKey:@"Action"];
  v9 = [(VKCMRCDataDetectorElement *)self initWithBarcodeObservation:v5 action:v8];

  return v9;
}

- (id)debugMenu
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__7;
  v34 = __Block_byref_object_dispose__7;
  id v35 = 0;
  id v4 = objc_msgSend((id)objc_opt_class(), "stringArrayForVKDataDetectorTypes:", -[VKCMRCDataDetectorElement dataDetectorTypes](self, "dataDetectorTypes"));
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __38__VKCMRCDataDetectorElement_debugMenu__block_invoke;
  v27[3] = &unk_1E6BF26B8;
  v29 = &v30;
  id v5 = v3;
  id v28 = v5;
  [v4 enumerateObjectsUsingBlock:v27];
  id v6 = NSString;
  id v7 = [(VKCMRCDataDetectorElement *)self barcodeObservation];
  id v8 = [v7 payloadStringValue];
  uint64_t v9 = [v6 stringWithFormat:@"%@", v8];
  uint64_t v10 = (void *)v31[5];
  v31[5] = v9;

  v11 = objc_msgSend(MEMORY[0x1E4F426E8], "vk_itemWithTitle:subtitle:", @"Payload", v31[5]);
  [v5 addObject:v11];

  uint64_t v12 = NSString;
  uint64_t v13 = [(VKCMRCDataDetectorElement *)self barcodeObservation];
  uint64_t v14 = [v13 symbology];
  uint64_t v15 = [v12 stringWithFormat:@"%@", v14];
  uint64_t v16 = (void *)v31[5];
  v31[5] = v15;

  long long v17 = objc_msgSend(MEMORY[0x1E4F426E8], "vk_itemWithTitle:subtitle:", @"Symbology", v31[5]);
  [v5 addObject:v17];

  uint64_t v18 = [(VKCMRCDataDetectorElement *)self boundingQuads];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __38__VKCMRCDataDetectorElement_debugMenu__block_invoke_2;
  v24[3] = &unk_1E6BF26E0;
  v26 = &v30;
  id v19 = v5;
  id v25 = v19;
  [v18 enumerateObjectsUsingBlock:v24];

  objc_super v20 = [(VKCMRCDataDetectorElement *)self barcodeAction];
  v21 = [v20 actionIcon];

  v22 = objc_msgSend(MEMORY[0x1E4F42B80], "vk_menuWithItems:title:subtitle:image:", v19, @"MRC", 0, v21);

  _Block_object_dispose(&v30, 8);
  return v22;
}

void __38__VKCMRCDataDetectorElement_debugMenu__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [NSString stringWithFormat:@"%@", a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F426E8], "vk_itemWithTitle:subtitle:", @"VKType", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 addObject:v7];
}

void __38__VKCMRCDataDetectorElement_debugMenu__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = NSString;
  uint64_t v4 = [a2 summaryDescription];
  uint64_t v5 = [v3 stringWithFormat:@"%@", v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F426E8], "vk_itemWithTitle:subtitle:", @"Quad", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v8 addObject:v9];
}

- (void)createChildrenIfNecessary
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (![(VKCMRCDataDetectorElement *)self childrenCreated])
  {
    [(VKCMRCDataDetectorElement *)self setChildrenCreated:1];
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = [(VKCMRCDataDetectorElement *)self barcodeObservation];
    uint64_t v5 = [v4 payloadStringValue];
    uint64_t v6 = (void *)v5;
    if (v5) {
      id v7 = (__CFString *)v5;
    }
    else {
      id v7 = @"nil";
    }
    id v8 = v7;

    id v9 = [@"Payload String: " stringByAppendingString:v8];
    uint64_t v10 = +[VKCElementInfo infoWithText:v9 parent:self];
    [v3 addObject:v10];

    v11 = [(VKCMRCDataDetectorElement *)self barcodeObservation];
    uint64_t v12 = [v11 symbology];
    uint64_t v13 = [@"Symbology: " stringByAppendingString:v12];
    uint64_t v14 = +[VKCElementInfo infoWithText:v13 parent:self];
    [v3 addObject:v14];

    if ([(VKCMRCDataDetectorElement *)self dataDetectorTypes])
    {
      v40 = v8;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      uint64_t v15 = objc_msgSend((id)objc_opt_class(), "stringArrayForVKDataDetectorTypes:", -[VKCMRCDataDetectorElement dataDetectorTypes](self, "dataDetectorTypes"));
      uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v42 != v18) {
              objc_enumerationMutation(v15);
            }
            objc_super v20 = [@"VKType: " stringByAppendingString:*(void *)(*((void *)&v41 + 1) + 8 * i)];
            v21 = +[VKCElementInfo infoWithText:v20 parent:self];
            [v3 addObject:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v41 objects:v45 count:16];
        }
        while (v17);
      }

      id v8 = v40;
    }
    else
    {
      id v22 = +[VKCElementInfo infoWithText:@"VKType: VKDataDetectorTypeNone" parent:self];
    }
    v23 = [(VKCMRCDataDetectorElement *)self scannerResult];
    uint64_t v24 = [v23 type];
    id v25 = (void *)v24;
    if (v24) {
      v26 = (__CFString *)v24;
    }
    else {
      v26 = @"nil";
    }
    v27 = v26;

    id v28 = [@"DDType: " stringByAppendingString:v27];

    v29 = +[VKCElementInfo infoWithText:v28 parent:self];
    [v3 addObject:v29];

    uint64_t v30 = NSString;
    [(VKCMRCDataDetectorElement *)self boundingBox];
    id v35 = VKMUIStringForRect(v31, v32, v33, v34);
    v36 = [v30 stringWithFormat:@"Unit Bounding Box: %@", v35];
    v37 = +[VKCElementInfo infoWithText:v36 parent:self];
    [v3 addObject:v37];

    v38 = (NSArray *)[v3 copy];
    children = self->_children;
    self->_children = v38;
  }
}

- (UIMenu)mrcMenu
{
  v2 = [(VKCMRCDataDetectorElement *)self barcodeAction];
  id v3 = (void *)MEMORY[0x1E4F42B80];
  uint64_t v4 = [v2 contentPreviewString];
  uint64_t v5 = [v2 actionIcon];
  uint64_t v6 = [v2 menuElements];
  id v7 = [v3 menuWithTitle:v4 image:v5 identifier:0 options:1 children:v6];

  return (UIMenu *)v7;
}

- (id)scannerResult
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)boundingQuads
{
  v9[1] = *MEMORY[0x1E4F143B8];
  boundingQuads = self->_boundingQuads;
  if (!boundingQuads)
  {
    uint64_t v4 = [(VKCMRCDataDetectorElement *)self quad];
    uint64_t v5 = (void *)v4;
    if (v4)
    {
      v9[0] = v4;
      uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
      id v7 = self->_boundingQuads;
      self->_boundingQuads = v6;
    }
    else
    {
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((quad) != nil)", "-[VKCMRCDataDetectorElement boundingQuads]", 0, 0, @"Expected non-nil value for '%s'", "quad");
      id v7 = self->_boundingQuads;
      self->_boundingQuads = (NSArray *)MEMORY[0x1E4F1CBF0];
    }

    boundingQuads = self->_boundingQuads;
  }
  return boundingQuads;
}

- (BOOL)isMRCDataDetector
{
  return 1;
}

- (id)stringValue
{
  uint64_t v2 = [(VKCMRCDataDetectorElement *)self dataDetectorTypes];
  return VKMUIStringForDDTypes(v2);
}

- (id)presentingViewControllerForAction:(id)a3
{
  id v3 = [(VKCMRCDataDetectorElement *)self presentingViewControllerForMrcAction];
  if (!v3)
  {
    uint64_t v4 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1DB266000, v4, OS_LOG_TYPE_INFO, "Using the key window's root view controller for BCSAction's presenting view controller.", v7, 2u);
    }

    uint64_t v5 = [MEMORY[0x1E4F43058] _applicationKeyWindow];
    id v3 = [v5 rootViewController];
  }
  return v3;
}

- (CGRect)sourceRectForPopoverActionPicker:(id)a3
{
  uint64_t v4 = [(VKCMRCDataDetectorElement *)self delegate];

  if (v4)
  {
    uint64_t v5 = [(VKCMRCDataDetectorElement *)self delegate];
    uint64_t v6 = [(VKCMRCDataDetectorElement *)self barcodeAction];
    id v7 = [(VKCMRCDataDetectorElement *)self presentingViewControllerForAction:v6];
    [v5 rectForMrcActionInViewController:v7];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    [(VKCMRCDataDetectorElement *)self rectForMrcActionInPresentingViewController];
    if (CGRectIsNull(v24))
    {
      double v9 = *MEMORY[0x1E4F1DB28];
      double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    else
    {
      [(VKCMRCDataDetectorElement *)self rectForMrcActionInPresentingViewController];
      double v9 = v16;
      double v11 = v17;
      double v13 = v18;
      double v15 = v19;
    }
  }
  double v20 = v9;
  double v21 = v11;
  double v22 = v13;
  double v23 = v15;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (unint64_t)dataDetectorTypes
{
  return self->_dataDetectorTypes;
}

- (void)setDataDetectorTypes:(unint64_t)a3
{
  self->_dataDetectorTypes = a3;
}

- (VKQuad)quad
{
  return self->_quad;
}

- (void)setQuad:(id)a3
{
}

- (CGRect)boundingBox
{
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBoundingBox:(CGRect)a3
{
  self->_boundingBodouble x = a3;
}

- (id)children
{
  return self->_children;
}

- (VNBarcodeObservation)barcodeObservation
{
  return self->_barcodeObservation;
}

- (void)setBarcodeObservation:(id)a3
{
}

- (BCSAction)barcodeAction
{
  return self->_barcodeAction;
}

- (void)setBarcodeAction:(id)a3
{
}

- (UIViewController)presentingViewControllerForMrcAction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewControllerForMrcAction);
  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewControllerForMrcAction:(id)a3
{
}

- (VKCMRCDataDetectorElementDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKCMRCDataDetectorElementDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CGRect)rectForMrcActionInPresentingViewController
{
  double x = self->_rectForMrcActionInPresentingViewController.origin.x;
  double y = self->_rectForMrcActionInPresentingViewController.origin.y;
  double width = self->_rectForMrcActionInPresentingViewController.size.width;
  double height = self->_rectForMrcActionInPresentingViewController.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRectForMrcActionInPresentingViewController:(CGRect)a3
{
  self->_rectForMrcActionInPresentingViewController = a3;
}

- (BOOL)childrenCreated
{
  return self->_childrenCreated;
}

- (void)setChildrenCreated:(BOOL)a3
{
  self->_childrenCreated = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentingViewControllerForMrcAction);
  objc_storeStrong((id *)&self->_barcodeAction, 0);
  objc_storeStrong((id *)&self->_barcodeObservation, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_boundingQuads, 0);
}

@end