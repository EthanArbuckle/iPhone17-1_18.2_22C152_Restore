@interface _UILAConfigurationHistory
- (BOOL)hasEstablishedBaseValues;
- (BOOL)isInLayoutArrangementUpdateSection;
- (BOOL)layoutFillsCanvas;
- (BOOL)layoutUsesCanvasMarginsWhenFilling;
- (NSSet)_newlyHiddenItems;
- (NSSet)_newlyUnhiddenItems;
- (NSSet)invalidBaselineConstraints;
- (_UILAConfigurationHistory)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)axis;
- (void)_invalidateBaselineConstraint:(id)a3;
- (void)setAxis:(int64_t)a3;
- (void)setHasEstablishedBaseValues:(BOOL)a3;
- (void)setInLayoutArrangementUpdateSection:(BOOL)a3;
- (void)setLayoutFillsCanvas:(BOOL)a3;
- (void)setLayoutUsesCanvasMarginsWhenFilling:(BOOL)a3;
@end

@implementation _UILAConfigurationHistory

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setHasEstablishedBaseValues:self->_hasEstablishedBaseValues];
  [v4 setInLayoutArrangementUpdateSection:self->_inLayoutArrangementUpdateSection];
  [v4 setAxis:self->_axis];
  [v4 setLayoutFillsCanvas:self->_layoutFillsCanvas];
  [v4 setLayoutUsesCanvasMarginsWhenFilling:self->_layoutUsesCanvasMarginsWhenFilling];
  uint64_t v5 = [(NSMutableSet *)self->_newlyHiddenItems mutableCopy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSMutableSet *)self->_newlyUnhiddenItems mutableCopy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [(NSMutableSet *)self->_invalidBaselineConstraints mutableCopy];
  v10 = (void *)v4[3];
  v4[3] = v9;

  return v4;
}

- (_UILAConfigurationHistory)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UILAConfigurationHistory;
  v2 = [(_UILAConfigurationHistory *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    newlyHiddenItems = v2->_newlyHiddenItems;
    v2->_newlyHiddenItems = v3;

    uint64_t v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    newlyUnhiddenItems = v2->_newlyUnhiddenItems;
    v2->_newlyUnhiddenItems = v5;
  }
  return v2;
}

- (void)setInLayoutArrangementUpdateSection:(BOOL)a3
{
  self->_inLayoutArrangementUpdateSection = a3;
}

- (BOOL)layoutFillsCanvas
{
  return self->_layoutFillsCanvas;
}

- (int64_t)axis
{
  return self->_axis;
}

- (NSSet)_newlyUnhiddenItems
{
  return &self->_newlyUnhiddenItems->super;
}

- (NSSet)_newlyHiddenItems
{
  return &self->_newlyHiddenItems->super;
}

- (void)setLayoutFillsCanvas:(BOOL)a3
{
  self->_layoutFillsCanvas = a3;
}

- (BOOL)isInLayoutArrangementUpdateSection
{
  return self->_inLayoutArrangementUpdateSection;
}

- (void)setLayoutUsesCanvasMarginsWhenFilling:(BOOL)a3
{
  self->_layoutUsesCanvasMarginsWhenFilling = a3;
}

- (void)setAxis:(int64_t)a3
{
  self->_axis = a3;
}

- (void)setHasEstablishedBaseValues:(BOOL)a3
{
  self->_hasEstablishedBaseValues = a3;
}

- (NSSet)invalidBaselineConstraints
{
  return &self->_invalidBaselineConstraints->super;
}

- (BOOL)layoutUsesCanvasMarginsWhenFilling
{
  return self->_layoutUsesCanvasMarginsWhenFilling;
}

- (BOOL)hasEstablishedBaseValues
{
  return self->_hasEstablishedBaseValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidBaselineConstraints, 0);
  objc_storeStrong((id *)&self->_newlyUnhiddenItems, 0);
  objc_storeStrong((id *)&self->_newlyHiddenItems, 0);
}

- (void)_invalidateBaselineConstraint:(id)a3
{
  id v4 = a3;
  invalidBaselineConstraints = self->_invalidBaselineConstraints;
  id v8 = v4;
  if (!invalidBaselineConstraints)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v7 = self->_invalidBaselineConstraints;
    self->_invalidBaselineConstraints = v6;

    id v4 = v8;
    invalidBaselineConstraints = self->_invalidBaselineConstraints;
  }
  [(NSMutableSet *)invalidBaselineConstraints addObject:v4];
}

@end