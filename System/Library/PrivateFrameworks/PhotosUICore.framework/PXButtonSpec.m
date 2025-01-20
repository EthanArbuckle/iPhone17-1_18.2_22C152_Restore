@interface PXButtonSpec
- (BOOL)isEqual:(id)a3;
- (PXButtonSpec)init;
- (UIColor)highlightedTextColor;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setHighlightedTextColor:(id)a3;
@end

@implementation PXButtonSpec

- (void).cxx_destruct
{
}

- (void)setHighlightedTextColor:(id)a3
{
}

- (UIColor)highlightedTextColor
{
  return self->_highlightedTextColor;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXButtonSpec;
  v4 = [(PXLabelSpec *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 28, self->_highlightedTextColor);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXButtonSpec;
  if ([(PXLabelSpec *)&v9 isEqual:v4])
  {
    v5 = [v4 highlightedTextColor];
    objc_super v6 = [(PXButtonSpec *)self highlightedTextColor];
    if (v5 == v6) {
      char v7 = 1;
    }
    else {
      char v7 = [v5 isEqual:v6];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)PXButtonSpec;
  unint64_t v3 = [(PXLabelSpec *)&v7 hash];
  id v4 = [(PXButtonSpec *)self highlightedTextColor];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (PXButtonSpec)init
{
  v4.receiver = self;
  v4.super_class = (Class)PXButtonSpec;
  v2 = [(PXLabelSpec *)&v4 init];
  if (v2)
  {
    [(PXLabelSpec *)v2 setTextAlignment:1];
    PXEdgeInsetsMake();
  }
  return 0;
}

@end