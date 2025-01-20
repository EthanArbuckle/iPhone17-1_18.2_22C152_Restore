@interface VKCTextElement
+ (id)textElementFromCROutputRegion:(id)a3 parentDocument:(id)a4;
- (BOOL)childrenCreated;
- (BOOL)isInspectableCellSelectable;
- (NSArray)_children;
- (NSArray)candidates;
- (NSArray)components;
- (id)confidenceString;
- (id)crOutputRegionTypeString;
- (id)elementCollectionForQuad:(id)a3;
- (int64_t)elementType;
- (void)createChildrenIfNecessary;
- (void)setCandidates:(id)a3;
- (void)setChildrenCreated:(BOOL)a3;
- (void)setComponents:(id)a3;
- (void)set_children:(id)a3;
@end

@implementation VKCTextElement

+ (id)textElementFromCROutputRegion:(id)a3 parentDocument:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(VKCTextElement);
  [(VKCBaseElement *)v7 setParentCRDocument:v5];

  [(VKCBaseElement *)v7 setCrOutputRegion:v6];
  return v7;
}

- (int64_t)elementType
{
  return 1;
}

- (NSArray)_children
{
  [(VKCTextElement *)self createChildrenIfNecessary];
  children = self->__children;
  return children;
}

- (NSArray)components
{
  [(VKCTextElement *)self createChildrenIfNecessary];
  components = self->_components;
  return components;
}

- (NSArray)candidates
{
  [(VKCTextElement *)self createChildrenIfNecessary];
  candidates = self->_candidates;
  return candidates;
}

- (BOOL)isInspectableCellSelectable
{
  return 1;
}

- (void)createChildrenIfNecessary
{
  if (![(VKCTextElement *)self childrenCreated])
  {
    [(VKCTextElement *)self setChildrenCreated:1];
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
    v4 = NSString;
    [(VKCBaseElement *)self boundingBox];
    v9 = VKMUIStringForRect(v5, v6, v7, v8);
    v10 = [v4 stringWithFormat:@"Unit Bounding Box: %@", v9];
    v11 = +[VKCElementInfo infoWithText:v10 parent:self];
    [v3 addObject:v11];

    [(VKCBaseElement *)self imageSpaceBoundingBox];
    double v16 = VKMMultiplyRectScalar(v12, v13, v14, v15, 0.5);
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    v23 = NSString;
    v24 = VKMUIStringForIntegralRect(v16, v17, v19, v21);
    v25 = [v23 stringWithFormat:@"Bounding Box Rect: %@", v24];
    v26 = +[VKCElementInfo infoWithText:v25 parent:self];
    [v3 addObject:v26];

    v27 = NSString;
    v69.origin.x = v16;
    v69.origin.y = v18;
    v69.size.width = v20;
    v69.size.height = v22;
    uint64_t MinX = (int)CGRectGetMinX(v69);
    v70.origin.x = v16;
    v70.origin.y = v18;
    v70.size.width = v20;
    v70.size.height = v22;
    uint64_t MaxX = (int)CGRectGetMaxX(v70);
    v71.origin.x = v16;
    v71.origin.y = v18;
    v71.size.width = v20;
    v71.size.height = v22;
    uint64_t MinY = (int)CGRectGetMinY(v71);
    v72.origin.x = v16;
    v72.origin.y = v18;
    v72.size.width = v20;
    v72.size.height = v22;
    v31 = objc_msgSend(v27, "stringWithFormat:", @"Bounding Box: X: [%d - %d] Y: [%d - %d]", MinX, MaxX, MinY, (int)CGRectGetMaxY(v72));
    v32 = +[VKCElementInfo infoWithText:v31 parent:self];
    [v3 addObject:v32];

    v33 = NSString;
    v34 = [(VKCTextElement *)self confidenceString];
    v35 = [v33 stringWithFormat:@"Confidence: %@", v34];
    v36 = +[VKCElementInfo infoWithText:v35 parent:self];
    [v3 addObject:v36];

    v37 = NSString;
    v38 = [(VKCTextElement *)self crOutputRegionTypeString];
    v39 = [v37 stringWithFormat:@"Type: %@", v38];
    v40 = +[VKCElementInfo infoWithText:v39 parent:self];
    [v3 addObject:v40];

    v41 = NSString;
    v42 = [(VKCBaseElement *)self parentCRDocument];
    v43 = [(VKCBaseElement *)self crOutputRegion];
    uint64_t v44 = [v42 rangeOfContentRegion:v43];
    v46 = VKMUIStringForRange(v44, v45);
    v47 = [v41 stringWithFormat:@"Range: %@", v46];
    v48 = +[VKCElementInfo infoWithText:v47 parent:self];
    [v3 addObject:v48];

    v49 = [(VKCBaseElement *)self crOutputRegion];
    v50 = [v49 children];
    uint64_t v51 = [v50 count];

    if (v51)
    {
      v52 = [(VKCBaseElement *)self crOutputRegion];
      v53 = [v52 children];
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __43__VKCTextElement_createChildrenIfNecessary__block_invoke;
      v68[3] = &unk_1E6BF2FD0;
      v68[4] = self;
      v54 = objc_msgSend(v53, "vk_compactMap:", v68);

      v55 = [(VKCBaseElement *)self quad];
      v56 = [(VKCTextElement *)self elementCollectionForQuad:v55];
      [v3 addObject:v56];

      v57 = +[VKCElementCollection collectionWithTitle:@"Components" children:v54 parent:self];
      [v3 addObject:v57];

      [(VKCTextElement *)self setComponents:v54];
    }
    v58 = [(VKCBaseElement *)self crOutputRegion];
    v59 = [v58 candidates];
    uint64_t v60 = [v59 count];

    if (v60)
    {
      v61 = [(VKCBaseElement *)self crOutputRegion];
      v62 = [v61 candidates];
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __43__VKCTextElement_createChildrenIfNecessary__block_invoke_2;
      v67[3] = &unk_1E6BF2FD0;
      v67[4] = self;
      v63 = objc_msgSend(v62, "vk_compactMap:", v67);

      v64 = +[VKCElementCollection collectionWithTitle:@"Candidates" children:v63 parent:self];
      [v3 addObject:v64];

      [(VKCTextElement *)self setCandidates:v63];
    }
    v65 = (NSArray *)[v3 copy];
    children = self->__children;
    self->__children = v65;
  }
}

id __43__VKCTextElement_createChildrenIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 parentCRDocument];
  double v5 = +[VKCTextElement textElementFromCROutputRegion:v3 parentDocument:v4];

  return v5;
}

id __43__VKCTextElement_createChildrenIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 parentCRDocument];
  double v5 = +[VKCTextElement textElementFromCROutputRegion:v3 parentDocument:v4];

  return v5;
}

- (id)confidenceString
{
  int v2 = [(VKCBaseElement *)self confidence];
  id v3 = @"Low";
  if (v2 == 1) {
    id v3 = @"Medium";
  }
  if (v2 == 2) {
    return @"High";
  }
  else {
    return v3;
  }
}

- (id)crOutputRegionTypeString
{
  int v2 = [(VKCBaseElement *)self crOutputRegion];
  uint64_t v3 = [v2 type];

  if (v3 <= 63)
  {
    id result = @"Unknown";
    switch(v3)
    {
      case 0:
        return result;
      case 1:
        return @"Document";
      case 2:
        return @"Block";
      case 3:
      case 5:
      case 6:
      case 7:
        return @"?";
      case 4:
        return @"Paragraph";
      case 8:
        return @"Line";
      default:
        if (v3 == 16)
        {
          id result = @"Word";
        }
        else
        {
          if (v3 != 32) {
            return @"?";
          }
          id result = @"Character";
        }
        break;
    }
  }
  else if (v3 > 1023)
  {
    if (v3 > 4095)
    {
      if (v3 != 4096)
      {
        if (v3 == 0x2000) {
          return @"DataForm";
        }
        return @"?";
      }
      return @"DataGroup";
    }
    else
    {
      if (v3 != 1024)
      {
        if (v3 == 2048) {
          return @"Data";
        }
        return @"?";
      }
      return @"Figure";
    }
  }
  else if (v3 > 255)
  {
    if (v3 != 256)
    {
      if (v3 == 512) {
        return @"List Item";
      }
      return @"?";
    }
    return @"List";
  }
  else
  {
    if (v3 != 64)
    {
      if (v3 == 128) {
        return @"TableCell";
      }
      return @"?";
    }
    return @"Table";
  }
  return result;
}

- (id)elementCollectionForQuad:(id)a3
{
  v33[4] = *MEMORY[0x1E4F143B8];
  v4 = NSString;
  id v5 = a3;
  [v5 topLeft];
  uint64_t v7 = v6;
  [v5 topLeft];
  v9 = objc_msgSend(v4, "stringWithFormat:", @"TL: X: %.02f Y:%0.2f", v7, v8);
  v10 = +[VKCElementInfo infoWithText:v9 parent:0];
  v33[0] = v10;
  v11 = NSString;
  [v5 topRight];
  uint64_t v13 = v12;
  [v5 topRight];
  CGFloat v15 = objc_msgSend(v11, "stringWithFormat:", @"TR: X: %.02f Y:%0.2f", v13, v14);
  double v16 = +[VKCElementInfo infoWithText:v15 parent:0];
  v33[1] = v16;
  double v17 = NSString;
  [v5 bottomLeft];
  uint64_t v19 = v18;
  [v5 bottomLeft];
  double v21 = objc_msgSend(v17, "stringWithFormat:", @"BL: X: %.02f Y:%0.2f", v19, v20);
  CGFloat v22 = +[VKCElementInfo infoWithText:v21 parent:0];
  v33[2] = v22;
  v23 = NSString;
  [v5 bottomRight];
  uint64_t v25 = v24;
  [v5 bottomRight];
  uint64_t v27 = v26;

  v28 = objc_msgSend(v23, "stringWithFormat:", @"BR: X: %.02f Y:%0.2f", v25, v27);
  v29 = +[VKCElementInfo infoWithText:v28 parent:0];
  v33[3] = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];

  v31 = +[VKCElementCollection collectionWithTitle:@"Quad" children:v30 parent:self];

  return v31;
}

- (void)setComponents:(id)a3
{
}

- (void)setCandidates:(id)a3
{
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
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_components, 0);
}

@end