@interface _UIStatusBarItemUpdate
- (BOOL)dataChanged;
- (BOOL)enabilityChanged;
- (BOOL)enabled;
- (BOOL)styleAttributesChanged;
- (NSDictionary)placementInfo;
- (_UIStatusBarData)data;
- (_UIStatusBarStyleAttributes)styleAttributes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setData:(id)a3;
- (void)setDataChanged:(BOOL)a3;
- (void)setEnabilityChanged:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setPlacementInfo:(id)a3;
- (void)setStyleAttributes:(id)a3;
- (void)setStyleAttributesChanged:(BOOL)a3;
@end

@implementation _UIStatusBarItemUpdate

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(_UIStatusBarItemUpdate);
  [(_UIStatusBarItemUpdate *)v4 setEnabilityChanged:self->_enabilityChanged];
  [(_UIStatusBarItemUpdate *)v4 setEnabled:self->_enabled];
  [(_UIStatusBarItemUpdate *)v4 setDataChanged:self->_dataChanged];
  [(_UIStatusBarItemUpdate *)v4 setData:self->_data];
  [(_UIStatusBarItemUpdate *)v4 setStyleAttributesChanged:self->_styleAttributesChanged];
  [(_UIStatusBarItemUpdate *)v4 setStyleAttributes:self->_styleAttributes];
  [(_UIStatusBarItemUpdate *)v4 setPlacementInfo:self->_placementInfo];
  return v4;
}

- (id)description
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(sel_enabilityChanged);
  v13 = v3;
  v4 = NSStringFromSelector(sel_styleAttributesChanged);
  v14 = v4;
  v5 = NSStringFromSelector(sel_dataChanged);
  v15 = v5;
  v6 = NSStringFromSelector(sel_enabled);
  v16 = v6;
  v7 = NSStringFromSelector(sel_data);
  v17 = v7;
  v8 = NSStringFromSelector(sel_styleAttributes);
  v18 = v8;
  v9 = NSStringFromSelector(sel_placementInfo);
  v19 = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:7];
  v11 = +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v10, v13, v14, v15, v16, v17, v18);

  return v11;
}

- (BOOL)enabilityChanged
{
  return self->_enabilityChanged;
}

- (void)setEnabilityChanged:(BOOL)a3
{
  self->_enabilityChanged = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)dataChanged
{
  return self->_dataChanged;
}

- (void)setDataChanged:(BOOL)a3
{
  self->_dataChanged = a3;
}

- (_UIStatusBarData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (BOOL)styleAttributesChanged
{
  return self->_styleAttributesChanged;
}

- (void)setStyleAttributesChanged:(BOOL)a3
{
  self->_styleAttributesChanged = a3;
}

- (_UIStatusBarStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
}

- (NSDictionary)placementInfo
{
  return self->_placementInfo;
}

- (void)setPlacementInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placementInfo, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end