@interface PXDebugHierarchyMutableElement
- (BOOL)canHaveChildren;
- (CGColor)backgroundColor;
- (CGImage)previewImage;
- (CGRect)contentsRect;
- (CGRect)frame;
- (NSString)contentsGravity;
- (NSString)name;
- (PXDebugHierarchyMutableElement)init;
- (double)alpha;
- (double)zPosition;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)identifier;
- (unint64_t)parentIdentifier;
- (void)prepareForReuse;
- (void)setAlpha:(double)a3;
- (void)setBackgroundColor:(CGColor *)a3;
- (void)setCanHaveChildren:(BOOL)a3;
- (void)setContentsGravity:(id)a3;
- (void)setContentsRect:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setName:(id)a3;
- (void)setParentIdentifier:(unint64_t)a3;
- (void)setPreviewImage:(CGImage *)a3;
- (void)setZPosition:(double)a3;
@end

@implementation PXDebugHierarchyMutableElement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_contentsGravity, 0);
}

- (void)setParentIdentifier:(unint64_t)a3
{
  self->_parentIdentifier = a3;
}

- (unint64_t)parentIdentifier
{
  return self->_parentIdentifier;
}

- (void)setCanHaveChildren:(BOOL)a3
{
  self->_canHaveChildren = a3;
}

- (BOOL)canHaveChildren
{
  return self->_canHaveChildren;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setBackgroundColor:(CGColor *)a3
{
  self->_backgroundColor = a3;
}

- (CGColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setContentsGravity:(id)a3
{
}

- (NSString)contentsGravity
{
  return self->_contentsGravity;
}

- (void)setContentsRect:(CGRect)a3
{
  self->_contentsRect = a3;
}

- (CGRect)contentsRect
{
  double x = self->_contentsRect.origin.x;
  double y = self->_contentsRect.origin.y;
  double width = self->_contentsRect.size.width;
  double height = self->_contentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreviewImage:(CGImage *)a3
{
  self->_previewImage = a3;
}

- (CGImage)previewImage
{
  return self->_previewImage;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setZPosition:(double)a3
{
  self->_zPosition = a3;
}

- (double)zPosition
{
  return self->_zPosition;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
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

- (unint64_t)identifier
{
  return self->_identifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(PXDebugHierarchyMutableElement *)self frame];
  objc_msgSend(v4, "setFrame:");
  [(PXDebugHierarchyMutableElement *)self zPosition];
  objc_msgSend(v4, "setZPosition:");
  [(PXDebugHierarchyMutableElement *)self alpha];
  objc_msgSend(v4, "setAlpha:");
  objc_msgSend(v4, "setPreviewImage:", -[PXDebugHierarchyMutableElement previewImage](self, "previewImage"));
  [(PXDebugHierarchyMutableElement *)self contentsRect];
  objc_msgSend(v4, "setContentsRect:");
  v5 = [(PXDebugHierarchyMutableElement *)self contentsGravity];
  [v4 setContentsGravity:v5];

  objc_msgSend(v4, "setBackgroundColor:", -[PXDebugHierarchyMutableElement backgroundColor](self, "backgroundColor"));
  v6 = [(PXDebugHierarchyMutableElement *)self name];
  [v4 setName:v6];

  objc_msgSend(v4, "setCanHaveChildren:", -[PXDebugHierarchyMutableElement canHaveChildren](self, "canHaveChildren"));
  v4[2] = self->_identifier;
  objc_msgSend(v4, "setParentIdentifier:", -[PXDebugHierarchyMutableElement parentIdentifier](self, "parentIdentifier"));
  return v4;
}

- (void)prepareForReuse
{
  -[PXDebugHierarchyMutableElement setFrame:](self, "setFrame:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  [(PXDebugHierarchyMutableElement *)self setZPosition:0.0];
  [(PXDebugHierarchyMutableElement *)self setAlpha:1.0];
  [(PXDebugHierarchyMutableElement *)self setPreviewImage:0];
  -[PXDebugHierarchyMutableElement setContentsRect:](self, "setContentsRect:", *(double *)off_1E5DAB010, *((double *)off_1E5DAB010 + 1), *((double *)off_1E5DAB010 + 2), *((double *)off_1E5DAB010 + 3));
  [(PXDebugHierarchyMutableElement *)self setContentsGravity:*MEMORY[0x1E4F3A3E0]];
  [(PXDebugHierarchyMutableElement *)self setBackgroundColor:0];
  [(PXDebugHierarchyMutableElement *)self setName:0];
  [(PXDebugHierarchyMutableElement *)self setCanHaveChildren:0];
  self->_identifier = ++prepareForReuse_uniqueIdentifier;
  [(PXDebugHierarchyMutableElement *)self setParentIdentifier:0];
}

- (PXDebugHierarchyMutableElement)init
{
  v5.receiver = self;
  v5.super_class = (Class)PXDebugHierarchyMutableElement;
  v2 = [(PXDebugHierarchyMutableElement *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PXDebugHierarchyMutableElement *)v2 prepareForReuse];
  }
  return v3;
}

@end