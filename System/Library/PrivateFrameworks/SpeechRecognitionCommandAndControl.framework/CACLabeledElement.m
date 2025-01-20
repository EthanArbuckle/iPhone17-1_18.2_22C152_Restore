@interface CACLabeledElement
- (AXElement)element;
- (BOOL)hasBeenCollected;
- (BOOL)isSpacer;
- (CACLabeledElement)initWithElement:(id)a3 recognitionStrings:(id)a4 rectangle:(CGRect)a5;
- (CACTextMarkerRange)textMarkerRange;
- (CGPoint)quantizedPosition;
- (CGRect)frame;
- (CGRect)interfaceOrientedRectangle;
- (CGRect)labelRectangle;
- (CGRect)rectangle;
- (CGSize)elementLabelContainerSize;
- (NSArray)recognitionStrings;
- (NSString)axIdentifier;
- (NSString)fullLabel;
- (NSString)label;
- (NSString)numberedLabel;
- (NSString)unfilteredRecognitionLabel;
- (NSString)valueLabel;
- (id)description;
- (int64_t)arrowOrientation;
- (int64_t)badgeIndicatorMask;
- (int64_t)badgePresentation;
- (int64_t)quantizedPositionCompare:(id)a3;
- (unint64_t)traits;
- (unsigned)displayID;
- (void)setArrowOrientation:(int64_t)a3;
- (void)setAxIdentifier:(id)a3;
- (void)setBadgeIndicatorMask:(int64_t)a3;
- (void)setBadgePresentation:(int64_t)a3;
- (void)setDisplayID:(unsigned int)a3;
- (void)setElement:(id)a3;
- (void)setHasBeenCollected:(BOOL)a3;
- (void)setLabelRectangle:(CGRect)a3;
- (void)setNumberedLabel:(id)a3;
- (void)setRecognitionStrings:(id)a3;
- (void)setRectangle:(CGRect)a3;
- (void)setTextMarkerRange:(id)a3;
@end

@implementation CACLabeledElement

- (NSString)unfilteredRecognitionLabel
{
  v2 = [(CACLabeledElement *)self element];
  v3 = [v2 speechInputLabel];

  return (NSString *)v3;
}

- (NSString)fullLabel
{
  v2 = [(CACLabeledElement *)self element];
  v3 = [v2 label];

  return (NSString *)v3;
}

- (NSString)valueLabel
{
  v2 = [(CACLabeledElement *)self element];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (unint64_t)traits
{
  v2 = [(CACLabeledElement *)self element];
  unint64_t v3 = [v2 traits];

  return v3;
}

- (CGRect)frame
{
  v2 = [(CACLabeledElement *)self element];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CACLabeledElement)initWithElement:(id)a3 recognitionStrings:(id)a4 rectangle:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a3;
  id v12 = a4;
  v39.receiver = self;
  v39.super_class = (Class)CACLabeledElement;
  double v13 = [(CACLabeledElement *)&v39 init];
  double v14 = v13;
  if (v13)
  {
    [(CACLabeledElement *)v13 setElement:v11];
    [(CACLabeledElement *)v14 setRecognitionStrings:v12];
    -[CACLabeledElement setRectangle:](v14, "setRectangle:", x, y, width, height);
    v15 = [v11 uiElement];
    v16 = [v15 stringWithAXAttribute:5019];
    [(CACLabeledElement *)v14 setAxIdentifier:v16];

    v14->_displayID = [v11 windowDisplayId];
    v17 = +[CACDisplayManager sharedManager];
    v18 = [v17 overlayViewForDisplayID:v14->_displayID];

    v19 = +[CACDisplayManager sharedManager];
    int v20 = [v19 carPlayConnected];

    v21 = [MEMORY[0x263F21668] systemWideElement];
    v22 = v21;
    if (v20)
    {
      v23 = [v21 elementsForAttribute:1009];
      uint64_t v24 = [v23 firstObject];

      v22 = (void *)v24;
    }
    [(CACLabeledElement *)v14 rectangle];
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    v33 = [v18 window];
    objc_msgSend(v22, "convertRect:toContextId:displayId:", objc_msgSend(v33, "_contextId"), v14->_displayID, v26, v28, v30, v32);
    v14->_interfaceRectangle.origin.double x = v34;
    v14->_interfaceRectangle.origin.double y = v35;
    v14->_interfaceRectangle.size.double width = v36;
    v14->_interfaceRectangle.size.double height = v37;
  }
  return v14;
}

- (NSString)label
{
  return (NSString *)[(NSArray *)self->_recognitionStrings firstObject];
}

- (CGPoint)quantizedPosition
{
  float v2 = self->_rectangle.origin.x / 10.0;
  double v3 = truncf(v2);
  float v4 = (self->_rectangle.origin.y + self->_rectangle.size.height) / 10.0;
  double v5 = truncf(v4);
  result.double y = v5;
  result.double x = v3;
  return result;
}

- (int64_t)quantizedPositionCompare:(id)a3
{
  id v4 = a3;
  [(CACLabeledElement *)self quantizedPosition];
  double v6 = v5;
  [(CACLabeledElement *)self quantizedPosition];
  double v8 = v6 + v7 / 1000.0;
  [v4 quantizedPosition];
  double v10 = v9;
  [v4 quantizedPosition];
  double v12 = v11;

  if (v8 >= v10 + v12 / 1000.0) {
    return 1;
  }
  else {
    return -1;
  }
}

- (CGRect)interfaceOrientedRectangle
{
  double x = self->_interfaceRectangle.origin.x;
  double y = self->_interfaceRectangle.origin.y;
  double width = self->_interfaceRectangle.size.width;
  double height = self->_interfaceRectangle.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Labeled element: %@, %@, label:(%f,%f,%f,%f), elmt:(%f,%f,%f,%f), %@", self->_recognitionStrings, self->_numberedLabel, *(void *)&self->_labelRectangle.origin.x, *(void *)&self->_labelRectangle.origin.y, *(void *)&self->_labelRectangle.size.width, *(void *)&self->_labelRectangle.size.height, *(void *)&self->_rectangle.origin.x, *(void *)&self->_rectangle.origin.y, *(void *)&self->_rectangle.size.width, *(void *)&self->_rectangle.size.height, self->_element];
}

- (AXElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
}

- (NSArray)recognitionStrings
{
  return self->_recognitionStrings;
}

- (void)setRecognitionStrings:(id)a3
{
}

- (NSString)numberedLabel
{
  return self->_numberedLabel;
}

- (void)setNumberedLabel:(id)a3
{
}

- (CACTextMarkerRange)textMarkerRange
{
  return self->_textMarkerRange;
}

- (void)setTextMarkerRange:(id)a3
{
}

- (CGRect)rectangle
{
  double x = self->_rectangle.origin.x;
  double y = self->_rectangle.origin.y;
  double width = self->_rectangle.size.width;
  double height = self->_rectangle.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRectangle:(CGRect)a3
{
  self->_rectangle = a3;
}

- (CGRect)labelRectangle
{
  double x = self->_labelRectangle.origin.x;
  double y = self->_labelRectangle.origin.y;
  double width = self->_labelRectangle.size.width;
  double height = self->_labelRectangle.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLabelRectangle:(CGRect)a3
{
  self->_labelRectangle = a3;
}

- (BOOL)hasBeenCollected
{
  return self->_hasBeenCollected;
}

- (void)setHasBeenCollected:(BOOL)a3
{
  self->_hasBeenCollected = a3;
}

- (NSString)axIdentifier
{
  return self->_axIdentifier;
}

- (void)setAxIdentifier:(id)a3
{
}

- (int64_t)arrowOrientation
{
  return self->_arrowOrientation;
}

- (void)setArrowOrientation:(int64_t)a3
{
  self->_arrowOrientation = a3;
}

- (int64_t)badgePresentation
{
  return self->_badgePresentation;
}

- (void)setBadgePresentation:(int64_t)a3
{
  self->_badgePresentation = a3;
}

- (int64_t)badgeIndicatorMask
{
  return self->_badgeIndicatorMask;
}

- (void)setBadgeIndicatorMask:(int64_t)a3
{
  self->_badgeIndicatorMask = a3;
}

- (unsigned)displayID
{
  return self->_displayID;
}

- (void)setDisplayID:(unsigned int)a3
{
  self->_displayID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textMarkerRange, 0);
  objc_storeStrong((id *)&self->_axIdentifier, 0);
  objc_storeStrong((id *)&self->_numberedLabel, 0);
  objc_storeStrong((id *)&self->_recognitionStrings, 0);
  objc_storeStrong((id *)&self->_element, 0);
}

- (CGSize)elementLabelContainerSize
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (BOOL)isSpacer
{
  return 0;
}

@end