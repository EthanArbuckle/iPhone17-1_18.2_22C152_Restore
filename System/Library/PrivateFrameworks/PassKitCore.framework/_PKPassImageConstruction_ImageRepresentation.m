@interface _PKPassImageConstruction_ImageRepresentation
+ (id)representationFromDocument:(CGPDFDocument *)a3 page:(CGPDFPage *)a4;
+ (id)representationFromImage:(id)a3;
- (CGPDFPage)pageRef;
- (PKImage)image;
- (void)dealloc;
@end

@implementation _PKPassImageConstruction_ImageRepresentation

+ (id)representationFromImage:(id)a3
{
  id result = a3;
  if (result)
  {
    v4 = (PKImage *)result;
    v5 = objc_alloc_init(_PKPassImageConstruction_ImageRepresentation);
    image = v5->_image;
    v5->_image = v4;

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

+ (id)representationFromDocument:(CGPDFDocument *)a3 page:(CGPDFPage *)a4
{
  if (a3 && a4)
  {
    v6 = objc_alloc_init(_PKPassImageConstruction_ImageRepresentation);
    v6->_documentRef = CGPDFDocumentRetain(a3);
    v6->_pageRef = CGPDFPageRetain(a4);
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)dealloc
{
  CGPDFPageRelease(self->_pageRef);
  CGPDFDocumentRelease(self->_documentRef);
  v3.receiver = self;
  v3.super_class = (Class)_PKPassImageConstruction_ImageRepresentation;
  [(_PKPassImageConstruction_ImageRepresentation *)&v3 dealloc];
}

- (PKImage)image
{
  return self->_image;
}

- (CGPDFPage)pageRef
{
  return self->_pageRef;
}

- (void).cxx_destruct
{
}

@end