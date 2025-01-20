@interface PXPlacesMapLayoutChange
- (PXPlacesMapLayoutChange)initWithSourceLayoutItem:(id)a3 targetLayoutItem:(id)a4 type:(int64_t)a5;
- (PXPlacesMapLayoutItem)sourceLayoutItem;
- (PXPlacesMapLayoutItem)targetLayoutItem;
- (id)description;
- (int64_t)type;
@end

@implementation PXPlacesMapLayoutChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetLayoutItem, 0);
  objc_storeStrong((id *)&self->_sourceLayoutItem, 0);
}

- (int64_t)type
{
  return self->_type;
}

- (PXPlacesMapLayoutItem)targetLayoutItem
{
  return self->_targetLayoutItem;
}

- (PXPlacesMapLayoutItem)sourceLayoutItem
{
  return self->_sourceLayoutItem;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v11.receiver = self;
  v11.super_class = (Class)PXPlacesMapLayoutChange;
  v4 = [(PXPlacesMapLayoutChange *)&v11 description];
  v5 = [v3 stringWithFormat:@"%@\n", v4];

  unint64_t v6 = [(PXPlacesMapLayoutChange *)self type];
  if (v6 > 2) {
    v7 = @"UNKNOWN";
  }
  else {
    v7 = off_1E5DCFC70[v6];
  }
  [v5 appendFormat:@"TYPE:\t%@\n", v7];
  v8 = [(PXPlacesMapLayoutChange *)self sourceLayoutItem];
  [v5 appendFormat:@"SOURCE:\t%@\n", v8];

  v9 = [(PXPlacesMapLayoutChange *)self targetLayoutItem];
  [v5 appendFormat:@"TARGET:\t%@\n", v9];

  return v5;
}

- (PXPlacesMapLayoutChange)initWithSourceLayoutItem:(id)a3 targetLayoutItem:(id)a4 type:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXPlacesMapLayoutChange;
  objc_super v11 = [(PXPlacesMapLayoutChange *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sourceLayoutItem, a3);
    objc_storeStrong((id *)&v12->_targetLayoutItem, a4);
    v12->_type = a5;
  }

  return v12;
}

@end