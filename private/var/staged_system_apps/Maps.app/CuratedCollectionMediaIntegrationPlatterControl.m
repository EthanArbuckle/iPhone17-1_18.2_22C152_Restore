@interface CuratedCollectionMediaIntegrationPlatterControl
- (CGPoint)menuAttachmentPointForConfiguration:(id)a3;
- (CuratedCollectionMediaIntegrationInteractionDelegate)interactionDelegate;
- (CuratedCollectionMediaIntegrationPlatterControl)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)setInteractionDelegate:(id)a3;
@end

@implementation CuratedCollectionMediaIntegrationPlatterControl

- (CuratedCollectionMediaIntegrationPlatterControl)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CuratedCollectionMediaIntegrationPlatterControl;
  v3 = -[CuratedCollectionMediaIntegrationPlatterControl initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CuratedCollectionMediaIntegrationPlatterControl *)v3 setContextMenuInteractionEnabled:1];
    [(CuratedCollectionMediaIntegrationPlatterControl *)v4 setShowsMenuAsPrimaryAction:1];
  }
  return v4;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  objc_super v6 = [(CuratedCollectionMediaIntegrationPlatterControl *)self interactionDelegate];
  v7 = [v6 mediaIntegrationMenuConfigurationWithInteraction:v5];

  return v7;
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(CuratedCollectionMediaIntegrationPlatterControl *)self interactionDelegate];
  [v5 mediaIntegrationMenuAttachmentPointForConfiguration:v4];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)CuratedCollectionMediaIntegrationPlatterControl;
  [(CuratedCollectionMediaIntegrationPlatterControl *)&v7 contextMenuInteraction:a3 willDisplayMenuForConfiguration:a4 animator:a5];
  double v6 = [(CuratedCollectionMediaIntegrationPlatterControl *)self interactionDelegate];
  [v6 mediaIntegrationMenuWillAppear];
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)CuratedCollectionMediaIntegrationPlatterControl;
  [(CuratedCollectionMediaIntegrationPlatterControl *)&v7 contextMenuInteraction:a3 willEndForConfiguration:a4 animator:a5];
  double v6 = [(CuratedCollectionMediaIntegrationPlatterControl *)self interactionDelegate];
  [v6 mediaIntegrationMenuWillDisappear];
}

- (CuratedCollectionMediaIntegrationInteractionDelegate)interactionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);

  return (CuratedCollectionMediaIntegrationInteractionDelegate *)WeakRetained;
}

- (void)setInteractionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end