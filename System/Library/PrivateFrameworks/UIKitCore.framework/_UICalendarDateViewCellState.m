@interface _UICalendarDateViewCellState
- (BOOL)forceEmphasizedFont;
- (BOOL)highlightsToday;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighlighted;
- (BOOL)isOutOfRange;
- (BOOL)isOverhangMonth;
- (BOOL)isSelected;
- (BOOL)isToday;
- (UITraitCollection)traits;
- (_UICalendarDateViewCellState)initWithTraits:(id)a3;
- (unint64_t)hash;
- (void)setForceEmphasizedFont:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightsToday:(BOOL)a3;
- (void)setOutOfRange:(BOOL)a3;
- (void)setOverhangMonth:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setToday:(BOOL)a3;
@end

@implementation _UICalendarDateViewCellState

- (_UICalendarDateViewCellState)initWithTraits:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UICalendarDateViewCellState;
  v6 = [(_UICalendarDateViewCellState *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_traits, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (int v5 = [(_UICalendarDateViewCellState *)self highlightsToday],
        v5 == [v4 highlightsToday])
    && (int v6 = [(_UICalendarDateViewCellState *)self isOutOfRange],
        v6 == [v4 isOutOfRange])
    && (int v7 = [(_UICalendarDateViewCellState *)self isOverhangMonth],
        v7 == [v4 isOverhangMonth])
    && (int v8 = -[_UICalendarDateViewCellState isToday](self, "isToday"), v8 == [v4 isToday])
    && (int v9 = [(_UICalendarDateViewCellState *)self isSelected],
        v9 == [v4 isSelected])
    && (int v10 = [(_UICalendarDateViewCellState *)self isHighlighted],
        v10 == [v4 isHighlighted]))
  {
    BOOL v13 = [(_UICalendarDateViewCellState *)self forceEmphasizedFont];
    int v11 = v13 ^ [v4 forceEmphasizedFont] ^ 1;
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  if ([(_UICalendarDateViewCellState *)self highlightsToday]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  BOOL v4 = [(_UICalendarDateViewCellState *)self isOutOfRange];
  uint64_t v5 = 4;
  if (!v4) {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5 | v3;
  if ([(_UICalendarDateViewCellState *)self isOverhangMonth]) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = 0;
  }
  BOOL v8 = [(_UICalendarDateViewCellState *)self isToday];
  uint64_t v9 = 16;
  if (!v8) {
    uint64_t v9 = 0;
  }
  uint64_t v10 = v6 | v7 | v9;
  if ([(_UICalendarDateViewCellState *)self isSelected]) {
    uint64_t v11 = 32;
  }
  else {
    uint64_t v11 = 0;
  }
  BOOL v12 = [(_UICalendarDateViewCellState *)self isHighlighted];
  uint64_t v13 = 64;
  if (!v12) {
    uint64_t v13 = 0;
  }
  uint64_t v14 = v11 | v13;
  BOOL v15 = [(_UICalendarDateViewCellState *)self forceEmphasizedFont];
  uint64_t v16 = 128;
  if (!v15) {
    uint64_t v16 = 0;
  }
  return v10 | v14 | v16;
}

- (UITraitCollection)traits
{
  return self->_traits;
}

- (BOOL)isOutOfRange
{
  return self->_outOfRange;
}

- (void)setOutOfRange:(BOOL)a3
{
  self->_outOfRange = a3;
}

- (BOOL)isOverhangMonth
{
  return self->_overhangMonth;
}

- (void)setOverhangMonth:(BOOL)a3
{
  self->_overhangMonth = a3;
}

- (BOOL)highlightsToday
{
  return self->_highlightsToday;
}

- (void)setHighlightsToday:(BOOL)a3
{
  self->_highlightsToday = a3;
}

- (BOOL)isToday
{
  return self->_today;
}

- (void)setToday:(BOOL)a3
{
  self->_today = a3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (BOOL)forceEmphasizedFont
{
  return self->_forceEmphasizedFont;
}

- (void)setForceEmphasizedFont:(BOOL)a3
{
  self->_forceEmphasizedFont = a3;
}

- (void).cxx_destruct
{
}

@end