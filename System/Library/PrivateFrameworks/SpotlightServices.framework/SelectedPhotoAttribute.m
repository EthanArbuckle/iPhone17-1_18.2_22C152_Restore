@interface SelectedPhotoAttribute
- (SelectedPhotoAttribute)initWithZeros;
- (float)maxAttributeFreq;
- (float)selectedTokenPercentage;
- (unint64_t)selectedAttribute;
- (void)setMaxAttributeFreq:(float)a3;
- (void)setSelectedAttribute:(unint64_t)a3;
- (void)setSelectedTokenPercentage:(float)a3;
@end

@implementation SelectedPhotoAttribute

- (SelectedPhotoAttribute)initWithZeros
{
  v5.receiver = self;
  v5.super_class = (Class)SelectedPhotoAttribute;
  v2 = [(SelectedPhotoAttribute *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(SelectedPhotoAttribute *)v2 setSelectedAttribute:0];
    [(SelectedPhotoAttribute *)v3 setMaxAttributeFreq:0.0];
    [(SelectedPhotoAttribute *)v3 setSelectedTokenPercentage:0.0];
  }
  return v3;
}

- (unint64_t)selectedAttribute
{
  return self->_selectedAttribute;
}

- (void)setSelectedAttribute:(unint64_t)a3
{
  self->_selectedAttribute = a3;
}

- (float)maxAttributeFreq
{
  return self->_maxAttributeFreq;
}

- (void)setMaxAttributeFreq:(float)a3
{
  self->_maxAttributeFreq = a3;
}

- (float)selectedTokenPercentage
{
  return self->_selectedTokenPercentage;
}

- (void)setSelectedTokenPercentage:(float)a3
{
  self->_selectedTokenPercentage = a3;
}

@end