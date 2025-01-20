@interface SBHIconGridLayer
- (SBHIconGridSize)gridSize;
- (SBHIconImageAppearance)imageAppearance;
- (id)layerForIcon:(id)a3;
- (unint64_t)cellCount;
- (void)replaceLayerForIcon:(id)a3 withLayer:(id)a4;
- (void)setCellCount:(unint64_t)a3;
- (void)setGridSize:(SBHIconGridSize)a3;
- (void)setImageAppearance:(id)a3;
- (void)setLayer:(id)a3 forIcon:(id)a4;
@end

@implementation SBHIconGridLayer

- (void)setLayer:(id)a3 forIcon:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  iconLayers = self->_iconLayers;
  if (!iconLayers)
  {
    v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    v9 = self->_iconLayers;
    self->_iconLayers = v8;

    iconLayers = self->_iconLayers;
  }
  [(NSMapTable *)iconLayers setObject:v10 forKey:v6];
}

- (void)setImageAppearance:(id)a3
{
}

- (void)setGridSize:(SBHIconGridSize)a3
{
  self->_gridSize = a3;
}

- (void)setCellCount:(unint64_t)a3
{
  self->_cellCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAppearance, 0);
  objc_storeStrong((id *)&self->_iconLayers, 0);
}

- (id)layerForIcon:(id)a3
{
  return [(NSMapTable *)self->_iconLayers objectForKey:a3];
}

- (void)replaceLayerForIcon:(id)a3 withLayer:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(SBHIconGridLayer *)self layerForIcon:v8];
  if (v7)
  {
    [v8 applyTreatmentsToLayer:v6];
    [v7 position];
    objc_msgSend(v6, "setPosition:");
    [v7 bounds];
    objc_msgSend(v6, "setBounds:");
    [v7 removeFromSuperlayer];
    [(SBHIconGridLayer *)self addSublayer:v6];
    [(SBHIconGridLayer *)self setLayer:v6 forIcon:v8];
  }
}

- (SBHIconGridSize)gridSize
{
  return self->_gridSize;
}

- (unint64_t)cellCount
{
  return self->_cellCount;
}

- (SBHIconImageAppearance)imageAppearance
{
  return self->_imageAppearance;
}

@end