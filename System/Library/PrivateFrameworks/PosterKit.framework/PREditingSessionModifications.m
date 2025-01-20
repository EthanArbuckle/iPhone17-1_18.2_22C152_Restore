@interface PREditingSessionModifications
- (BOOL)colorModified;
- (BOOL)containedWidgetsBeforeEdit;
- (BOOL)fontModified;
- (BOOL)numberingSystemModified;
- (BOOL)posterContentModified;
- (BOOL)widgetsModified;
- (NSDate)startDate;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setColorModified:(BOOL)a3;
- (void)setContainedWidgetsBeforeEdit:(BOOL)a3;
- (void)setFontModified:(BOOL)a3;
- (void)setNumberingSystemModified:(BOOL)a3;
- (void)setPosterContentModified:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setWidgetsModified:(BOOL)a3;
@end

@implementation PREditingSessionModifications

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(PREditingSessionModifications);
  [(PREditingSessionModifications *)v4 setContainedWidgetsBeforeEdit:[(PREditingSessionModifications *)self containedWidgetsBeforeEdit]];
  [(PREditingSessionModifications *)v4 setColorModified:[(PREditingSessionModifications *)self colorModified]];
  [(PREditingSessionModifications *)v4 setFontModified:[(PREditingSessionModifications *)self fontModified]];
  [(PREditingSessionModifications *)v4 setNumberingSystemModified:[(PREditingSessionModifications *)self numberingSystemModified]];
  [(PREditingSessionModifications *)v4 setPosterContentModified:[(PREditingSessionModifications *)self posterContentModified]];
  [(PREditingSessionModifications *)v4 setWidgetsModified:[(PREditingSessionModifications *)self widgetsModified]];
  v5 = [(PREditingSessionModifications *)self startDate];
  [(PREditingSessionModifications *)v4 setStartDate:v5];

  return v4;
}

- (BOOL)containedWidgetsBeforeEdit
{
  return self->_containedWidgetsBeforeEdit;
}

- (void)setContainedWidgetsBeforeEdit:(BOOL)a3
{
  self->_containedWidgetsBeforeEdit = a3;
}

- (BOOL)colorModified
{
  return self->_colorModified;
}

- (void)setColorModified:(BOOL)a3
{
  self->_colorModified = a3;
}

- (BOOL)fontModified
{
  return self->_fontModified;
}

- (void)setFontModified:(BOOL)a3
{
  self->_fontModified = a3;
}

- (BOOL)numberingSystemModified
{
  return self->_numberingSystemModified;
}

- (void)setNumberingSystemModified:(BOOL)a3
{
  self->_numberingSystemModified = a3;
}

- (BOOL)posterContentModified
{
  return self->_posterContentModified;
}

- (void)setPosterContentModified:(BOOL)a3
{
  self->_posterContentModified = a3;
}

- (BOOL)widgetsModified
{
  return self->_widgetsModified;
}

- (void)setWidgetsModified:(BOOL)a3
{
  self->_widgetsModified = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end