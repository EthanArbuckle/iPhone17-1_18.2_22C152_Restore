@interface PXGHostingControllerProposedSize
- (BOOL)accept;
- (BOOL)shouldPreferAcceptingReferenceSize;
- (CGSize)referenceSize;
- (PXGHostingController)hostingController;
- (PXGHostingControllerProposedSize)initWithReferenceSize:(CGSize)a3 shouldPreferAcceptingReferenceSize:(BOOL)a4 hostingController:(id)a5;
- (id)description;
- (void)setHostingController:(id)a3;
- (void)willAccept;
@end

@implementation PXGHostingControllerProposedSize

- (void).cxx_destruct
{
}

- (void)setHostingController:(id)a3
{
}

- (PXGHostingController)hostingController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingController);
  return (PXGHostingController *)WeakRetained;
}

- (BOOL)shouldPreferAcceptingReferenceSize
{
  return self->_shouldPreferAcceptingReferenceSize;
}

- (CGSize)referenceSize
{
  double width = self->_referenceSize.width;
  double height = self->_referenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(PXGHostingControllerProposedSize *)self referenceSize];
  v6 = NSStringFromCGSize(v11);
  v7 = [(PXGHostingControllerProposedSize *)self hostingController];
  v8 = [v3 stringWithFormat:@"<%@: %p referenceSize: %@ hostingController: %@>", v5, self, v6, v7];

  return v8;
}

- (BOOL)accept
{
  v2 = self;
  v3 = [(PXGHostingControllerProposedSize *)self hostingController];
  [(PXGHostingControllerProposedSize *)v2 setHostingController:0];
  LOBYTE(v2) = objc_msgSend(v3, "layoutQueue_acceptSize:", v2);

  return (char)v2;
}

- (void)willAccept
{
  id v3 = [(PXGHostingControllerProposedSize *)self hostingController];
  objc_msgSend(v3, "layoutQueue_skipFrameCount:forProposedSize:", 1, self);
}

- (PXGHostingControllerProposedSize)initWithReferenceSize:(CGSize)a3 shouldPreferAcceptingReferenceSize:(BOOL)a4 hostingController:(id)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PXGHostingControllerProposedSize;
  v10 = [(PXGHostingControllerProposedSize *)&v13 init];
  CGSize v11 = v10;
  if (v10)
  {
    v10->_referenceSize.CGFloat width = width;
    v10->_referenceSize.CGFloat height = height;
    v10->_shouldPreferAcceptingReferenceSize = a4;
    objc_storeWeak((id *)&v10->_hostingController, v9);
  }

  return v11;
}

@end