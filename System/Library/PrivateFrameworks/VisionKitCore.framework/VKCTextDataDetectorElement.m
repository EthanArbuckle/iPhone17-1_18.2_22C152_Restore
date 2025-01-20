@interface VKCTextDataDetectorElement
+ (id)dataDetectorElementFromCROutputRegion:(id)a3 parentDocument:(id)a4;
- (BOOL)childrenCreated;
- (BOOL)isTextDataDetector;
- (BOOL)isUnitConversionDataDetector;
- (CRDataDetectorsOutputRegion)ddOutputRegion;
- (NSArray)_children;
- (VKCTextDataDetectorElement)initWithCROutputRegion:(id)a3 parentDocument:(id)a4;
- (VKCTextDataDetectorElement)initWithScannerResult:(id)a3;
- (_NSRange)characterRange;
- (id)boundingQuads;
- (id)children;
- (id)debugMenu;
- (id)scannerResult;
- (unint64_t)crDataType;
- (unint64_t)dataDetectorTypes;
- (unint64_t)dataType;
- (void)createChildrenIfNecessary;
- (void)setChildrenCreated:(BOOL)a3;
- (void)setDataDetectorTypes:(unint64_t)a3;
- (void)set_children:(id)a3;
@end

@implementation VKCTextDataDetectorElement

+ (id)dataDetectorElementFromCROutputRegion:(id)a3 parentDocument:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[VKCTextDataDetectorElement alloc] initWithCROutputRegion:v6 parentDocument:v5];

  return v7;
}

- (VKCTextDataDetectorElement)initWithCROutputRegion:(id)a3 parentDocument:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VKCTextDataDetectorElement;
  v8 = [(VKCBaseDataDetectorElement *)&v14 init];
  v9 = v8;
  if (v8)
  {
    [(VKCBaseElement *)v8 setParentCRDocument:v7];
    [(VKCBaseElement *)v9 setCrOutputRegion:v6];
    v10 = [(VKCTextDataDetectorElement *)v9 ddOutputRegion];
    uint64_t v11 = [v10 ddResult];
    scannerResult = v9->_scannerResult;
    v9->_scannerResult = (DDScannerResult *)v11;

    v9->_dataDetectorTypes = +[VKCBaseDataDetectorElement dataDetectorTypesForScannerResult:v9->_scannerResult];
  }

  return v9;
}

- (VKCTextDataDetectorElement)initWithScannerResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKCTextDataDetectorElement;
  id v6 = [(VKCBaseDataDetectorElement *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scannerResult, a3);
    v7->_dataDetectorTypes = +[VKCBaseDataDetectorElement dataDetectorTypesForScannerResult:v7->_scannerResult];
  }

  return v7;
}

- (CRDataDetectorsOutputRegion)ddOutputRegion
{
  uint64_t v3 = objc_opt_class();
  v4 = [(VKCBaseElement *)self crOutputRegion];
  id v5 = VKCheckedDynamicCast(v3, (uint64_t)v4);

  return (CRDataDetectorsOutputRegion *)v5;
}

- (unint64_t)dataType
{
  v2 = [(VKCTextDataDetectorElement *)self ddOutputRegion];
  unint64_t v3 = [v2 dataType];

  return v3;
}

- (BOOL)isTextDataDetector
{
  return 1;
}

- (BOOL)isUnitConversionDataDetector
{
  return ([(VKCTextDataDetectorElement *)self dataDetectorTypes] & 0xC00) != 0;
}

- (id)scannerResult
{
  return self->_scannerResult;
}

- (_NSRange)characterRange
{
  v2 = [(VKCTextDataDetectorElement *)self scannerResult];
  uint64_t v3 = [v2 urlificationRange];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (id)boundingQuads
{
  boundingQuads = self->_boundingQuads;
  if (!boundingQuads)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    NSUInteger v5 = [(VKCBaseElement *)self parentCRDocument];
    uint64_t v6 = [(VKCTextDataDetectorElement *)self characterRange];
    v8 = objc_msgSend(v5, "outputRegionWithContentsOfCharacterRange:", v6, v7);

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __43__VKCTextDataDetectorElement_boundingQuads__block_invoke;
    v13[3] = &unk_1E6BF3808;
    id v14 = v4;
    id v9 = v4;
    [v8 enumerateContentsWithTypes:8 usingBlock:v13];
    v10 = (NSArray *)[v9 copy];
    uint64_t v11 = self->_boundingQuads;
    self->_boundingQuads = v10;

    boundingQuads = self->_boundingQuads;
  }
  return boundingQuads;
}

void __43__VKCTextDataDetectorElement_boundingQuads__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 boundingQuad];
  uint64_t v3 = [v4 vkQuad];
  [v2 addObject:v3];
}

- (id)children
{
  [(VKCTextDataDetectorElement *)self createChildrenIfNecessary];
  return [(VKCTextDataDetectorElement *)self _children];
}

- (id)debugMenu
{
  uint64_t v3 = [(VKCBaseElement *)self parentCRDocument];
  id v4 = [v3 text];
  uint64_t v5 = [(VKCTextDataDetectorElement *)self characterRange];
  uint64_t v7 = objc_msgSend(v4, "substringWithRange:", v5, v6);

  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__16;
  v42 = __Block_byref_object_dispose__16;
  id v43 = 0;
  if (vk_isSeedBuild()) {
    uint64_t v8 = 40;
  }
  else {
    uint64_t v8 = 20;
  }
  id v9 = objc_msgSend(v7, "vk_substringToIndex:", v8);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (vk_isSeedBuild()) {
    uint64_t v11 = 60;
  }
  else {
    uint64_t v11 = 40;
  }
  v12 = NSString;
  v13 = objc_msgSend(v7, "vk_substringToIndex:", v11);
  uint64_t v14 = [v12 stringWithFormat:@"%@", v13];
  v15 = (void *)v39[5];
  v39[5] = v14;

  v16 = objc_msgSend(MEMORY[0x1E4F426E8], "vk_itemWithTitle:subtitle:", @"Text", v39[5]);
  [v10 addObject:v16];

  v17 = objc_msgSend((id)objc_opt_class(), "stringArrayForVKDataDetectorTypes:", -[VKCTextDataDetectorElement dataDetectorTypes](self, "dataDetectorTypes"));
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __39__VKCTextDataDetectorElement_debugMenu__block_invoke;
  v35[3] = &unk_1E6BF26B8;
  v37 = &v38;
  id v18 = v10;
  id v36 = v18;
  [v17 enumerateObjectsUsingBlock:v35];
  v19 = NSString;
  uint64_t v20 = [(VKCTextDataDetectorElement *)self characterRange];
  v22 = VKMUIStringForRange(v20, v21);
  uint64_t v23 = [v19 stringWithFormat:@"%@", v22];
  v24 = (void *)v39[5];
  v39[5] = v23;

  v25 = objc_msgSend(MEMORY[0x1E4F426E8], "vk_itemWithTitle:subtitle:", @"Range", v39[5]);
  [v18 addObject:v25];

  v26 = [(VKCTextDataDetectorElement *)self boundingQuads];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __39__VKCTextDataDetectorElement_debugMenu__block_invoke_2;
  v32[3] = &unk_1E6BF26E0;
  v34 = &v38;
  id v27 = v18;
  id v33 = v27;
  [v26 enumerateObjectsUsingBlock:v32];

  v28 = (void *)MEMORY[0x1E4F42B80];
  v29 = [v17 firstObject];
  v30 = objc_msgSend(v28, "vk_menuWithItems:title:subtitle:", v27, v29, v9);

  _Block_object_dispose(&v38, 8);
  return v30;
}

void __39__VKCTextDataDetectorElement_debugMenu__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [NSString stringWithFormat:@"%@", a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F426E8], "vk_itemWithTitle:subtitle:", @"Type", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 addObject:v7];
}

void __39__VKCTextDataDetectorElement_debugMenu__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = NSString;
  uint64_t v4 = [a2 summaryDescription];
  uint64_t v5 = [v3 stringWithFormat:@"%@", v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F426E8], "vk_itemWithTitle:subtitle:", @"Quad", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v8 addObject:v9];
}

- (void)createChildrenIfNecessary
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (![(VKCTextDataDetectorElement *)self childrenCreated])
  {
    [(VKCTextDataDetectorElement *)self setChildrenCreated:1];
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v4 = objc_msgSend((id)objc_opt_class(), "stringArrayForVKDataDetectorTypes:", -[VKCTextDataDetectorElement dataDetectorTypes](self, "dataDetectorTypes"));
    uint64_t v5 = [v4 countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v55;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v55 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = [@"VKType: " stringByAppendingString:*(void *)(*((void *)&v54 + 1) + 8 * v8)];
          id v10 = +[VKCElementInfo infoWithText:v9 parent:self];
          [v3 addObject:v10];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v54 objects:v58 count:16];
      }
      while (v6);
    }

    uint64_t v11 = [(VKCTextDataDetectorElement *)self scannerResult];
    v12 = [v11 type];
    v13 = [@"DDType: " stringByAppendingString:v12];

    uint64_t v14 = +[VKCElementInfo infoWithText:v13 parent:self];
    [v3 addObject:v14];

    v15 = [(VKCTextDataDetectorElement *)self ddOutputRegion];
    v16 = [v15 ddResult];
    v17 = [v16 description];
    id v18 = +[VKCElementInfo infoWithText:v17 parent:self];
    [v3 addObject:v18];

    v19 = NSString;
    [(VKCBaseElement *)self boundingBox];
    v24 = VKMUIStringForRect(v20, v21, v22, v23);
    v25 = [v19 stringWithFormat:@"Unit Bounding Box: %@", v24];
    v26 = +[VKCElementInfo infoWithText:v25 parent:self];
    [v3 addObject:v26];

    id v27 = NSString;
    v28 = [(VKCBaseElement *)self parentCRDocument];
    v29 = [v28 text];
    uint64_t v30 = [(VKCTextDataDetectorElement *)self characterRange];
    v32 = objc_msgSend(v29, "substringWithRange:", v30, v31);
    id v33 = [v27 stringWithFormat:@"Text: %@", v32];
    v34 = +[VKCElementInfo infoWithText:v33 parent:self];
    [v3 addObject:v34];

    [(VKCBaseElement *)self imageSpaceBoundingBox];
    double v39 = VKMMultiplyRectScalar(v35, v36, v37, v38, 0.5);
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    CGFloat v45 = v44;
    v46 = NSString;
    v47 = VKMUIStringForIntegralRect(v39, v40, v42, v44);
    v48 = [v46 stringWithFormat:@"Bounding Box Rect: %@", v47];
    v49 = +[VKCElementInfo infoWithText:v48 parent:self];
    [v3 addObject:v49];

    v50 = VKMUIStringForRectXYSpan(v39, v41, v43, v45);
    v51 = [@"Bounding Box: " stringByAppendingString:v50];
    v52 = +[VKCElementInfo infoWithText:v51 parent:self];
    [v3 addObject:v52];

    v53 = (void *)[v3 copy];
    [(VKCTextDataDetectorElement *)self set_children:v53];
  }
}

- (unint64_t)dataDetectorTypes
{
  return self->_dataDetectorTypes;
}

- (void)setDataDetectorTypes:(unint64_t)a3
{
  self->_dataDetectorTypes = a3;
}

- (unint64_t)crDataType
{
  return self->_crDataType;
}

- (NSArray)_children
{
  return self->__children;
}

- (void)set_children:(id)a3
{
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
  objc_storeStrong((id *)&self->__children, 0);
  objc_storeStrong((id *)&self->_scannerResult, 0);
  objc_storeStrong((id *)&self->_boundingQuads, 0);
}

@end