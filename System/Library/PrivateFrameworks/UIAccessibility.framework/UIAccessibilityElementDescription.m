@interface UIAccessibilityElementDescription
+ (BOOL)supportsSecureCoding;
+ (id)_descriptionWithAXElement:(id)a3;
+ (id)_descriptionWithLocalElement:(id)a3;
+ (id)descriptionWithElement:(id)a3 frameInContainerSpaceOrNil:(CGRect)a4;
- (BOOL)isAccessibleElement;
- (CGRect)frame;
- (CGRect)frameInContainerSpace;
- (NSArray)accessibilityActionsForRemoteDevice;
- (NSArray)attributedUserInputLabels;
- (NSArray)customActionsForRemoteDevice;
- (NSArray)userInputLabels;
- (NSAttributedString)attributedLabel;
- (NSAttributedString)attributedValue;
- (NSData)elementRefData;
- (NSString)identifier;
- (NSString)label;
- (NSString)value;
- (UIAccessibilityElementDescription)init;
- (UIAccessibilityElementDescription)initWithCoder:(id)a3;
- (UIBezierPath)path;
- (id)convertToAccessibilityElementWithContainer:(id)a3;
- (id)description;
- (unint64_t)traits;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityActionsForRemoteDevice:(id)a3;
- (void)setAttributedLabel:(id)a3;
- (void)setAttributedUserInputLabels:(id)a3;
- (void)setAttributedValue:(id)a3;
- (void)setCustomActionsForRemoteDevice:(id)a3;
- (void)setElementRefData:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setFrameInContainerSpace:(CGRect)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsAccessibleElement:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setPath:(id)a3;
- (void)setTraits:(unint64_t)a3;
- (void)setUserInputLabels:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation UIAccessibilityElementDescription

+ (id)descriptionWithElement:(id)a3 frameInContainerSpaceOrNil:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [MEMORY[0x1E4F488F8] elementWithUIElement:v9];
    v11 = [a1 _descriptionWithAXElement:v10];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [a1 _descriptionWithAXElement:v9];
    }
    else {
    v11 = [a1 _descriptionWithLocalElement:v9];
    }
  }
  v14.origin.double x = x;
  v14.origin.double y = y;
  v14.size.double width = width;
  v14.size.double height = height;
  if (!CGRectIsEmpty(v14))
  {
    objc_msgSend(v11, "setFrameInContainerSpace:", x, y, width, height);
    objc_msgSend(v11, "setFrame:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  }

  return v11;
}

+ (id)_descriptionWithLocalElement:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(UIAccessibilityElementDescription);
  -[UIAccessibilityElementDescription setIsAccessibleElement:](v4, "setIsAccessibleElement:", [v3 isAccessibilityElement]);
  -[UIAccessibilityElementDescription setTraits:](v4, "setTraits:", [v3 accessibilityTraits]);
  v5 = [v3 accessibilityLabel];
  [(UIAccessibilityElementDescription *)v4 setLabel:v5];

  v6 = [v3 accessibilityAttributedLabel];
  [(UIAccessibilityElementDescription *)v4 setAttributedLabel:v6];

  v7 = [v3 accessibilityValue];
  [(UIAccessibilityElementDescription *)v4 setValue:v7];

  v8 = [v3 accessibilityAttributedValue];
  [(UIAccessibilityElementDescription *)v4 setAttributedValue:v8];

  id v9 = [v3 accessibilityUserInputLabels];
  [(UIAccessibilityElementDescription *)v4 setUserInputLabels:v9];

  v10 = [v3 accessibilityAttributedUserInputLabels];
  [(UIAccessibilityElementDescription *)v4 setAttributedUserInputLabels:v10];

  v11 = [v3 accessibilityIdentifier];
  [(UIAccessibilityElementDescription *)v4 setIdentifier:v11];

  double v12 = *MEMORY[0x1E4F1DB20];
  double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [v3 accessibilityFrame];
        double height = v15;
        double width = v14;
        double y = v13;
        double x = v12;
        double v15 = v29;
        double v14 = v30;
        double v13 = v31;
        double v12 = v32;
        goto LABEL_8;
      }
    }
    [v3 frame];
    double x = v20;
    double y = v21;
    double width = v22;
    double height = v23;
LABEL_7:
    [v3 accessibilityFrame];
    double v12 = v24;
    double v13 = v25;
    double v14 = v26;
    double v15 = v27;
    goto LABEL_8;
  }
  [v3 accessibilityFrameInContainerSpace];
  double x = v34.origin.x;
  double y = v34.origin.y;
  double width = v34.size.width;
  double height = v34.size.height;
  if (CGRectIsEmpty(v34)) {
    goto LABEL_7;
  }
LABEL_8:
  -[UIAccessibilityElementDescription setFrame:](v4, "setFrame:", v12, v13, v14, v15);
  -[UIAccessibilityElementDescription setFrameInContainerSpace:](v4, "setFrameInContainerSpace:", x, y, width, height);

  return v4;
}

+ (id)_descriptionWithAXElement:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_alloc_init(UIAccessibilityElementDescription);
  -[UIAccessibilityElementDescription setIsAccessibleElement:](v4, "setIsAccessibleElement:", [v3 isAccessibleElement]);
  -[UIAccessibilityElementDescription setTraits:](v4, "setTraits:", [v3 traits]);
  v5 = [v3 label];
  [(UIAccessibilityElementDescription *)v4 setLabel:v5];

  v6 = [v3 value];
  [(UIAccessibilityElementDescription *)v4 setValue:v6];

  v7 = [v3 userInputLabels];
  [(UIAccessibilityElementDescription *)v4 setUserInputLabels:v7];

  v8 = [v3 uiElement];
  id v9 = [v8 stringWithAXAttribute:5019];
  [(UIAccessibilityElementDescription *)v4 setIdentifier:v9];

  [v3 frame];
  double v10 = *MEMORY[0x1E4F1DB20];
  double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  -[UIAccessibilityElementDescription setFrame:](v4, "setFrame:");
  -[UIAccessibilityElementDescription setFrameInContainerSpace:](v4, "setFrameInContainerSpace:", v10, v11, v12, v13);
  double v14 = (const CGPath *)[v3 path];
  if (!CGPathIsEmpty(v14))
  {
    double v15 = [MEMORY[0x1E4F427D0] bezierPathWithCGPath:v14];
    [(UIAccessibilityElementDescription *)v4 setPath:v15];
  }
  v37 = v4;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v17 = [v3 customActions];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    unint64_t v19 = 0;
    do
    {
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      double v21 = [v3 customActions];
      double v22 = [v21 objectAtIndexedSubscript:v19];

      double v23 = [v22 objectForKeyedSubscript:@"CustomActionIdentifier"];
      [v20 setObject:v23 forKeyedSubscript:@"CustomActionIdentifier"];

      double v24 = [v22 objectForKeyedSubscript:@"CustomActionImage"];
      [v20 setObject:v24 forKeyedSubscript:@"CustomActionImage"];

      double v25 = [v22 objectForKeyedSubscript:@"CustomActionName"];
      [v20 setObject:v25 forKeyedSubscript:@"CustomActionName"];

      [v16 addObject:v20];
      ++v19;
      double v26 = [v3 customActions];
      unint64_t v27 = [v26 count];
    }
    while (v27 > v19);
  }
  v28 = v4;
  [(UIAccessibilityElementDescription *)v4 setCustomActionsForRemoteDevice:v16];
  if ([v3 elementRef])
  {
    Data = (void *)_AXUIElementCreateData();
    [(UIAccessibilityElementDescription *)v4 setElementRefData:Data];
  }
  double v30 = (void *)[&unk_1EF171DE8 mutableCopy];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v31 = [&unk_1EF171DD0 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v39 != v33) {
          objc_enumerationMutation(&unk_1EF171DD0);
        }
        v35 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if (objc_msgSend(v3, "supportsAction:", objc_msgSend(v35, "integerValue"))) {
          [v30 addObject:v35];
        }
      }
      uint64_t v32 = [&unk_1EF171DD0 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v32);
  }
  [(UIAccessibilityElementDescription *)v37 setAccessibilityActionsForRemoteDevice:v30];

  return v28;
}

- (UIAccessibilityElementDescription)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIAccessibilityElementDescription;
  result = [(UIAccessibilityElementDescription *)&v5 init];
  if (result)
  {
    CGPoint v3 = (CGPoint)*MEMORY[0x1E4F1DB20];
    CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    result->_frame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    result->_frame.size = v4;
    result->_frameInContainerSpace.origin = v3;
    result->_frameInContainerSpace.size = v4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIAccessibilityElementDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)UIAccessibilityElementDescription;
  objc_super v5 = [(UIAccessibilityElementDescription *)&v33 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    [(UIAccessibilityElementDescription *)v5 setLabel:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attributedLabel"];
    [(UIAccessibilityElementDescription *)v5 setAttributedLabel:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    [(UIAccessibilityElementDescription *)v5 setValue:v8];

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attributedValue"];
    [(UIAccessibilityElementDescription *)v5 setAttributedValue:v9];

    [v4 decodeCGRectForKey:@"frame"];
    -[UIAccessibilityElementDescription setFrame:](v5, "setFrame:");
    [v4 decodeCGRectForKey:@"frameInContainerSpace"];
    -[UIAccessibilityElementDescription setFrameInContainerSpace:](v5, "setFrameInContainerSpace:");
    -[UIAccessibilityElementDescription setIsAccessibleElement:](v5, "setIsAccessibleElement:", [v4 decodeBoolForKey:@"isAccessibleElement"]);
    -[UIAccessibilityElementDescription setTraits:](v5, "setTraits:", [v4 decodeInt64ForKey:@"traits"]);
    double v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
    [(UIAccessibilityElementDescription *)v5 setPath:v10];

    double v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    id v16 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, objc_opt_class(), 0);
    v17 = [v4 decodeObjectOfClasses:v16 forKey:@"customActionsForRemoteDevice"];
    [(UIAccessibilityElementDescription *)v5 setCustomActionsForRemoteDevice:v17];

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"elementRefData"];
    [(UIAccessibilityElementDescription *)v5 setElementRefData:v18];

    unint64_t v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    double v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    double v22 = [v4 decodeObjectOfClasses:v21 forKey:@"accessibilityActionsForRemoteDevice"];
    [(UIAccessibilityElementDescription *)v5 setAccessibilityActionsForRemoteDevice:v22];

    double v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    double v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    double v26 = [v4 decodeObjectOfClasses:v25 forKey:@"userInputLabels"];
    [(UIAccessibilityElementDescription *)v5 setUserInputLabels:v26];

    unint64_t v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    double v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    double v30 = [v4 decodeObjectOfClasses:v29 forKey:@"attributedUserInputLabels"];
    [(UIAccessibilityElementDescription *)v5 setAttributedUserInputLabels:v30];

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(UIAccessibilityElementDescription *)v5 setIdentifier:v31];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UIAccessibilityElementDescription *)self label];
  [v4 encodeObject:v5 forKey:@"label"];

  v6 = [(UIAccessibilityElementDescription *)self attributedLabel];
  [v4 encodeObject:v6 forKey:@"attributedLabel"];

  v7 = [(UIAccessibilityElementDescription *)self value];
  [v4 encodeObject:v7 forKey:@"value"];

  v8 = [(UIAccessibilityElementDescription *)self attributedValue];
  [v4 encodeObject:v8 forKey:@"attributedValue"];

  [(UIAccessibilityElementDescription *)self frame];
  objc_msgSend(v4, "encodeCGRect:forKey:", @"frame");
  [(UIAccessibilityElementDescription *)self frameInContainerSpace];
  objc_msgSend(v4, "encodeCGRect:forKey:", @"frameInContainerSpace");
  objc_msgSend(v4, "encodeBool:forKey:", -[UIAccessibilityElementDescription isAccessibleElement](self, "isAccessibleElement"), @"isAccessibleElement");
  objc_msgSend(v4, "encodeInt64:forKey:", -[UIAccessibilityElementDescription traits](self, "traits"), @"traits");
  id v9 = [(UIAccessibilityElementDescription *)self path];
  [v4 encodeObject:v9 forKey:@"path"];

  double v10 = [(UIAccessibilityElementDescription *)self userInputLabels];
  [v4 encodeObject:v10 forKey:@"userInputLabels"];

  double v11 = [(UIAccessibilityElementDescription *)self attributedUserInputLabels];
  [v4 encodeObject:v11 forKey:@"attributedUserInputLabels"];

  uint64_t v12 = [(UIAccessibilityElementDescription *)self identifier];
  [v4 encodeObject:v12 forKey:@"identifier"];

  uint64_t v13 = [(UIAccessibilityElementDescription *)self customActionsForRemoteDevice];
  [v4 encodeObject:v13 forKey:@"customActionsForRemoteDevice"];

  uint64_t v14 = [(UIAccessibilityElementDescription *)self elementRefData];
  [v4 encodeObject:v14 forKey:@"elementRefData"];

  id v15 = [(UIAccessibilityElementDescription *)self accessibilityActionsForRemoteDevice];
  [v4 encodeObject:v15 forKey:@"accessibilityActionsForRemoteDevice"];
}

- (id)description
{
  CGPoint v3 = NSString;
  if ([(UIAccessibilityElementDescription *)self isAccessibilityElement]) {
    id v4 = @"Y";
  }
  else {
    id v4 = @"N";
  }
  objc_super v5 = [(UIAccessibilityElementDescription *)self label];
  v6 = [(UIAccessibilityElementDescription *)self attributedLabel];
  v7 = [(UIAccessibilityElementDescription *)self value];
  v8 = [(UIAccessibilityElementDescription *)self attributedValue];
  [(UIAccessibilityElementDescription *)self frame];
  id v9 = NSStringFromCGRect(v14);
  [(UIAccessibilityElementDescription *)self frameInContainerSpace];
  double v10 = NSStringFromCGRect(v15);
  double v11 = [v3 stringWithFormat:@"UIAXElemDesc<%p> isAX:%@ label:'%@' attrLabel:'%@' value:'%@' attrValue:'%@' frame:'%@' localFrame:'%@' ", self, v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (id)convertToAccessibilityElementWithContainer:(id)a3
{
  id v32 = a3;
  id v4 = [[UIAccessibilityBridgeElement alloc] initWithAccessibilityContainer:v32];
  [(UIAccessibilityBridgeElement *)v4 setIsAccessibilityElement:[(UIAccessibilityElementDescription *)self isAccessibleElement]];
  [(UIAccessibilityBridgeElement *)v4 setAccessibilityTraits:[(UIAccessibilityElementDescription *)self traits]];
  objc_super v5 = [(UIAccessibilityElementDescription *)self identifier];
  [(UIAccessibilityBridgeElement *)v4 setAccessibilityIdentifier:v5];

  v6 = [(UIAccessibilityElementDescription *)self attributedLabel];

  if (v6)
  {
    v7 = [(UIAccessibilityElementDescription *)self attributedLabel];
    [(UIAccessibilityBridgeElement *)v4 setAccessibilityAttributedLabel:v7];
  }
  else
  {
    v7 = [(UIAccessibilityElementDescription *)self label];
    [(UIAccessibilityBridgeElement *)v4 setAccessibilityLabel:v7];
  }

  v8 = [(UIAccessibilityElementDescription *)self attributedValue];

  if (v8)
  {
    id v9 = [(UIAccessibilityElementDescription *)self attributedValue];
    [(UIAccessibilityBridgeElement *)v4 setAccessibilityAttributedValue:v9];
  }
  else
  {
    id v9 = [(UIAccessibilityElementDescription *)self value];
    [(UIAccessibilityBridgeElement *)v4 setAccessibilityValue:v9];
  }

  [(UIAccessibilityElementDescription *)self frameInContainerSpace];
  if (CGRectIsEmpty(v37))
  {
    [(UIAccessibilityElementDescription *)self frame];
    -[UIAccessibilityBridgeElement setAccessibilityFrame:](v4, "setAccessibilityFrame:");
  }
  else
  {
    [(UIAccessibilityElementDescription *)self frameInContainerSpace];
    -[UIAccessibilityBridgeElement setAccessibilityFrameInContainerSpace:](v4, "setAccessibilityFrameInContainerSpace:");
  }
  double v10 = [(UIAccessibilityElementDescription *)self path];

  if (v10)
  {
    double v11 = [(UIAccessibilityElementDescription *)self path];
    [(UIAccessibilityBridgeElement *)v4 setAccessibilityPath:v11];
  }
  uint64_t v12 = [(UIAccessibilityElementDescription *)self attributedUserInputLabels];

  if (v12)
  {
    uint64_t v13 = [(UIAccessibilityElementDescription *)self attributedUserInputLabels];
    [(UIAccessibilityBridgeElement *)v4 setAccessibilityAttributedUserInputLabels:v13];
  }
  else
  {
    uint64_t v13 = [(UIAccessibilityElementDescription *)self userInputLabels];
    [(UIAccessibilityBridgeElement *)v4 setAccessibilityUserInputLabels:v13];
  }

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  CGRect v15 = [(UIAccessibilityElementDescription *)self customActionsForRemoteDevice];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    unint64_t v17 = 0;
    do
    {
      uint64_t v18 = [(UIAccessibilityElementDescription *)self customActionsForRemoteDevice];
      unint64_t v19 = [v18 objectAtIndexedSubscript:v17];

      id v20 = objc_alloc(MEMORY[0x1E4F42A80]);
      double v21 = [v19 objectForKeyedSubscript:@"CustomActionImage"];
      double v22 = (void *)[v20 initWithData:v21];

      id v23 = objc_alloc(MEMORY[0x1E4F426C0]);
      uint64_t v24 = [v19 objectForKeyedSubscript:@"CustomActionName"];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __80__UIAccessibilityElementDescription_convertToAccessibilityElementWithContainer___block_invoke;
      v33[3] = &unk_1E59B9C70;
      CGRect v34 = v4;
      id v35 = v19;
      id v25 = v19;
      double v26 = (void *)[v23 initWithName:v24 image:v22 actionHandler:v33];

      [v14 addObject:v26];
      ++v17;
      unint64_t v27 = [(UIAccessibilityElementDescription *)self customActionsForRemoteDevice];
      unint64_t v28 = [v27 count];
    }
    while (v28 > v17);
  }
  [(UIAccessibilityBridgeElement *)v4 setAccessibilityCustomActions:v14];
  double v29 = [(UIAccessibilityElementDescription *)self elementRefData];
  [(UIAccessibilityBridgeElement *)v4 setElementRefData:v29];

  double v30 = [(UIAccessibilityElementDescription *)self accessibilityActionsForRemoteDevice];
  [(UIAccessibilityBridgeElement *)v4 setAccessibilityActionsForRemoteDevice:v30];

  return v4;
}

uint64_t __80__UIAccessibilityElementDescription_convertToAccessibilityElementWithContainer___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) axActionHandler];
  CGPoint v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CustomActionIdentifier"];
  uint64_t v4 = [v2 performAXAction:2021 withValue:v3 onBridgeElement:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)isAccessibleElement
{
  return self->_isAccessibleElement;
}

- (void)setIsAccessibleElement:(BOOL)a3
{
  self->_isAccessibleElement = a3;
}

- (unint64_t)traits
{
  return self->_traits;
}

- (void)setTraits:(unint64_t)a3
{
  self->_traits = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSAttributedString)attributedLabel
{
  return self->_attributedLabel;
}

- (void)setAttributedLabel:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSAttributedString)attributedValue
{
  return self->_attributedValue;
}

- (void)setAttributedValue:(id)a3
{
}

- (CGRect)frameInContainerSpace
{
  double x = self->_frameInContainerSpace.origin.x;
  double y = self->_frameInContainerSpace.origin.y;
  double width = self->_frameInContainerSpace.size.width;
  double height = self->_frameInContainerSpace.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrameInContainerSpace:(CGRect)a3
{
  self->_frameInContainerSpace = a3;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (NSArray)userInputLabels
{
  return self->_userInputLabels;
}

- (void)setUserInputLabels:(id)a3
{
}

- (NSArray)attributedUserInputLabels
{
  return self->_attributedUserInputLabels;
}

- (void)setAttributedUserInputLabels:(id)a3
{
}

- (UIBezierPath)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSArray)customActionsForRemoteDevice
{
  return self->_customActionsForRemoteDevice;
}

- (void)setCustomActionsForRemoteDevice:(id)a3
{
}

- (NSData)elementRefData
{
  return self->_elementRefData;
}

- (void)setElementRefData:(id)a3
{
}

- (NSArray)accessibilityActionsForRemoteDevice
{
  return self->_accessibilityActionsForRemoteDevice;
}

- (void)setAccessibilityActionsForRemoteDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityActionsForRemoteDevice, 0);
  objc_storeStrong((id *)&self->_elementRefData, 0);
  objc_storeStrong((id *)&self->_customActionsForRemoteDevice, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_attributedUserInputLabels, 0);
  objc_storeStrong((id *)&self->_userInputLabels, 0);
  objc_storeStrong((id *)&self->_attributedValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_attributedLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end