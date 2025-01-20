@interface PXCloudQuotaTileView
- (CGSize)contentViewSizeForWidth:(double)a3;
- (PXCloudQuotaTileView)init;
- (PXCloudQuotaTileView)initWithCoder:(id)a3;
- (PXCloudQuotaTileView)initWithContentView:(id)a3;
- (PXCloudQuotaTileView)initWithFrame:(CGRect)a3;
- (PXCloudQuotaTileView)initWithTileView:(id)a3;
- (id)contentViewFont;
@end

@implementation PXCloudQuotaTileView

- (void).cxx_destruct
{
}

- (CGSize)contentViewSizeForWidth:(double)a3
{
  LODWORD(v3) = 1144750080;
  LODWORD(v4) = 1132068864;
  -[ICQTileView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_tileView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, 0.0, v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (id)contentViewFont
{
  return (id)[(ICQTileView *)self->_tileView font];
}

- (PXCloudQuotaTileView)initWithTileView:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXCloudQuotaTileView.m", 53, @"Invalid parameter not satisfying: %@", @"tileView" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXCloudQuotaTileView;
  v7 = [(PXCloudQuotaView *)&v11 initWithContentView:v6];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_tileView, a3);
  }

  return v8;
}

- (PXCloudQuotaTileView)initWithContentView:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCloudQuotaTileView.m", 49, @"%s is not available as initializer", "-[PXCloudQuotaTileView initWithContentView:]");

  abort();
}

- (PXCloudQuotaTileView)initWithCoder:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCloudQuotaTileView.m", 45, @"%s is not available as initializer", "-[PXCloudQuotaTileView initWithCoder:]");

  abort();
}

- (PXCloudQuotaTileView)initWithFrame:(CGRect)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCloudQuotaTileView.m", 41, @"%s is not available as initializer", "-[PXCloudQuotaTileView initWithFrame:]");

  abort();
}

- (PXCloudQuotaTileView)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCloudQuotaTileView.m", 37, @"%s is not available as initializer", "-[PXCloudQuotaTileView init]");

  abort();
}

@end