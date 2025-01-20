@interface SXCollectionRowLayout
- (double)componentWidth;
- (double)leftMargin;
- (double)rightMargin;
- (double)spaceBetweenComponents;
- (id)description;
- (unint64_t)componentsPerRow;
- (unint64_t)intendedComponentsPerRow;
- (void)setComponentWidth:(double)a3;
- (void)setComponentsPerRow:(unint64_t)a3;
- (void)setIntendedComponentsPerRow:(unint64_t)a3;
- (void)setLeftMargin:(double)a3;
- (void)setRightMargin:(double)a3;
- (void)setSpaceBetweenComponents:(double)a3;
@end

@implementation SXCollectionRowLayout

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"intendedComponentsPerRow: %lu; ",
    [(SXCollectionRowLayout *)self intendedComponentsPerRow]);
  objc_msgSend(v3, "appendFormat:", @"componentsPerRow: %lu; ",
    [(SXCollectionRowLayout *)self componentsPerRow]);
  [(SXCollectionRowLayout *)self leftMargin];
  objc_msgSend(v3, "appendFormat:", @"leftMargin: %f; ", v4);
  [(SXCollectionRowLayout *)self rightMargin];
  objc_msgSend(v3, "appendFormat:", @"rightMargin: %f; ", v5);
  [(SXCollectionRowLayout *)self componentWidth];
  objc_msgSend(v3, "appendFormat:", @"componentWidth: %f; ", v6);
  [(SXCollectionRowLayout *)self spaceBetweenComponents];
  objc_msgSend(v3, "appendFormat:", @"spaceBetweenComponents: %f", v7);
  [v3 appendString:@">"];
  return v3;
}

- (unint64_t)intendedComponentsPerRow
{
  return self->_intendedComponentsPerRow;
}

- (void)setIntendedComponentsPerRow:(unint64_t)a3
{
  self->_intendedComponentsPerRow = a3;
}

- (unint64_t)componentsPerRow
{
  return self->_componentsPerRow;
}

- (void)setComponentsPerRow:(unint64_t)a3
{
  self->_componentsPerRow = a3;
}

- (double)leftMargin
{
  return self->_leftMargin;
}

- (void)setLeftMargin:(double)a3
{
  self->_leftMargin = a3;
}

- (double)rightMargin
{
  return self->_rightMargin;
}

- (void)setRightMargin:(double)a3
{
  self->_rightMargin = a3;
}

- (double)componentWidth
{
  return self->_componentWidth;
}

- (void)setComponentWidth:(double)a3
{
  self->_componentWidth = a3;
}

- (double)spaceBetweenComponents
{
  return self->_spaceBetweenComponents;
}

- (void)setSpaceBetweenComponents:(double)a3
{
  self->_spaceBetweenComponents = a3;
}

@end