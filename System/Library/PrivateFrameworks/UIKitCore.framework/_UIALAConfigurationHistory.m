@interface _UIALAConfigurationHistory
- (BOOL)hasEstablishedAlignmentValues;
- (BOOL)isInAlignmentLayoutUpdateSection;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)alignment;
- (void)setAlignment:(unint64_t)a3;
- (void)setHasEstablishedAlignmentValues:(BOOL)a3;
- (void)setInAlignmentLayoutUpdateSection:(BOOL)a3;
@end

@implementation _UIALAConfigurationHistory

- (BOOL)hasEstablishedAlignmentValues
{
  return self->_hasEstablishedAlignmentValues;
}

- (void)setInAlignmentLayoutUpdateSection:(BOOL)a3
{
  self->_inAlignmentLayoutUpdateSection = a3;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
}

- (BOOL)isInAlignmentLayoutUpdateSection
{
  return self->_inAlignmentLayoutUpdateSection;
}

- (void)setHasEstablishedAlignmentValues:(BOOL)a3
{
  self->_hasEstablishedAlignmentValues = a3;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIALAConfigurationHistory;
  id v4 = [(_UILAConfigurationHistory *)&v6 copyWithZone:a3];
  [v4 setAlignment:self->_alignment];
  [v4 setHasEstablishedAlignmentValues:self->_hasEstablishedAlignmentValues];
  [v4 setInAlignmentLayoutUpdateSection:self->_inAlignmentLayoutUpdateSection];
  return v4;
}

@end