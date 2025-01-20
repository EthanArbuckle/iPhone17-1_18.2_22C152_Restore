@interface _UIOLAConfigurationHistory
- (BOOL)_itemFittingSizeChanged;
- (BOOL)_itemOrderingChanged;
- (BOOL)hasEstablishedOrderingValues;
- (BOOL)isBaselineRelativeArrangement;
- (BOOL)isInOrderedArrangementUpdateSection;
- (NSMapTable)customSpacings;
- (double)customSpacingAfterItem:(id)a3;
- (double)proportionalFillDenominator;
- (double)spacing;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)distribution;
- (void)_setItemFittingSizeChanged:(BOOL)a3;
- (void)_setItemOrderingChanged:(BOOL)a3;
- (void)setBaselineRelativeArrangement:(BOOL)a3;
- (void)setCustomSpacing:(double)a3 afterItem:(id)a4;
- (void)setDistribution:(int64_t)a3;
- (void)setHasEstablishedOrderingValues:(BOOL)a3;
- (void)setInOrderedArrangementUpdateSection:(BOOL)a3;
- (void)setProportionalFillDenominator:(double)a3;
- (void)setSpacing:(double)a3;
@end

@implementation _UIOLAConfigurationHistory

- (double)spacing
{
  return self->_spacing;
}

- (int64_t)distribution
{
  return self->_distribution;
}

- (void)setInOrderedArrangementUpdateSection:(BOOL)a3
{
  self->_inOrderedArrangementUpdateSection = a3;
}

- (BOOL)_itemOrderingChanged
{
  return self->_itemOrderingChanged;
}

- (BOOL)isInOrderedArrangementUpdateSection
{
  return self->_inOrderedArrangementUpdateSection;
}

- (void)setSpacing:(double)a3
{
  self->_spacing = a3;
}

- (void)setDistribution:(int64_t)a3
{
  self->_distribution = a3;
}

- (void)_setItemOrderingChanged:(BOOL)a3
{
  self->_itemOrderingChanged = a3;
}

- (void)setBaselineRelativeArrangement:(BOOL)a3
{
  self->_baselineRelativeArrangement = a3;
}

- (void)setProportionalFillDenominator:(double)a3
{
  self->_proportionalFillDenominator = a3;
}

- (void)setHasEstablishedOrderingValues:(BOOL)a3
{
  self->_hasEstablishedOrderingValues = a3;
}

- (BOOL)isBaselineRelativeArrangement
{
  return self->_baselineRelativeArrangement;
}

- (NSMapTable)customSpacings
{
  return self->_customSpacings;
}

- (BOOL)hasEstablishedOrderingValues
{
  return self->_hasEstablishedOrderingValues;
}

- (double)proportionalFillDenominator
{
  return self->_proportionalFillDenominator;
}

- (BOOL)_itemFittingSizeChanged
{
  return self->_itemFittingSizeChanged;
}

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIOLAConfigurationHistory;
  v4 = [(_UILAConfigurationHistory *)&v8 copyWithZone:a3];
  [v4 setSpacing:self->_spacing];
  [v4 setDistribution:self->_distribution];
  [v4 setBaselineRelativeArrangement:self->_baselineRelativeArrangement];
  [v4 _setItemOrderingChanged:self->_itemOrderingChanged];
  [v4 setHasEstablishedOrderingValues:self->_hasEstablishedOrderingValues];
  [v4 setInOrderedArrangementUpdateSection:self->_inOrderedArrangementUpdateSection];
  [v4 setProportionalFillDenominator:self->_proportionalFillDenominator];
  [v4 _setItemFittingSizeChanged:self->_itemFittingSizeChanged];
  uint64_t v5 = [(NSMapTable *)self->_customSpacings copy];
  v6 = (void *)v4[9];
  v4[9] = v5;

  return v4;
}

- (void)_setItemFittingSizeChanged:(BOOL)a3
{
  self->_itemFittingSizeChanged = a3;
}

- (void)setCustomSpacing:(double)a3 afterItem:(id)a4
{
  id v10 = a4;
  customSpacings = self->_customSpacings;
  if (!customSpacings)
  {
    v7 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:0];
    objc_super v8 = self->_customSpacings;
    self->_customSpacings = v7;

    customSpacings = self->_customSpacings;
  }
  v9 = [NSNumber numberWithDouble:a3];
  [(NSMapTable *)customSpacings setObject:v9 forKey:v10];
}

- (double)customSpacingAfterItem:(id)a3
{
  v3 = [(NSMapTable *)self->_customSpacings objectForKey:a3];
  v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 3.40282347e38;
  }

  return v6;
}

@end