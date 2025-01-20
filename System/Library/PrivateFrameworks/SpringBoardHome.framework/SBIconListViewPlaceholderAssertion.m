@interface SBIconListViewPlaceholderAssertion
- (BOOL)isInvalidated;
- (NSString)description;
- (NSString)gridSizeClass;
- (NSString)reason;
- (SBIcon)positioningRelativeIcon;
- (SBIcon)representedIcon;
- (SBIconListView)listView;
- (SBIconListViewPlaceholderAssertion)initWithGridCellIndex:(unint64_t)a3 gridSizeClass:(id)a4 reason:(id)a5 options:(unint64_t)a6 listView:(id)a7;
- (SBIconListViewPlaceholderAssertion)initWithGridCellIndex:(unint64_t)a3 representedIcon:(id)a4 reason:(id)a5 options:(unint64_t)a6 listView:(id)a7;
- (SBPlaceholderIcon)placeholderIcon;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)positioningType;
- (unint64_t)effectiveGridCellIndex;
- (unint64_t)folderMutationOptions;
- (unint64_t)gridCellIndex;
- (unint64_t)listMutationOptions;
- (unint64_t)options;
- (void)dealloc;
- (void)didChangePlaceholderPosition;
- (void)invalidate;
- (void)placeAboveIcon:(id)a3;
- (void)placeAfterIcon:(id)a3;
- (void)placeBeforeIcon:(id)a3;
- (void)placeBelowIcon:(id)a3;
- (void)setGridCellIndex:(unint64_t)a3;
- (void)setGridSizeClass:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPositioningRelativeIcon:(id)a3;
- (void)setPositioningType:(int64_t)a3;
- (void)swapWithIcon:(id)a3;
@end

@implementation SBIconListViewPlaceholderAssertion

- (SBIconListViewPlaceholderAssertion)initWithGridCellIndex:(unint64_t)a3 gridSizeClass:(id)a4 reason:(id)a5 options:(unint64_t)a6 listView:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v22.receiver = self;
  v22.super_class = (Class)SBIconListViewPlaceholderAssertion;
  v15 = [(SBIconListViewPlaceholderAssertion *)&v22 init];
  v16 = v15;
  if (v15)
  {
    v15->_gridCellIndex = a3;
    uint64_t v17 = [v12 copy];
    gridSizeClass = v16->_gridSizeClass;
    v16->_gridSizeClass = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    reason = v16->_reason;
    v16->_reason = (NSString *)v19;

    v16->_options = a6;
    objc_storeStrong((id *)&v16->_listView, a7);
  }

  return v16;
}

- (SBIconListViewPlaceholderAssertion)initWithGridCellIndex:(unint64_t)a3 representedIcon:(id)a4 reason:(id)a5 options:(unint64_t)a6 listView:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)SBIconListViewPlaceholderAssertion;
  v16 = [(SBIconListViewPlaceholderAssertion *)&v24 init];
  uint64_t v17 = v16;
  if (v16)
  {
    v16->_gridCellIndex = a3;
    v18 = [v13 gridSizeClass];
    uint64_t v19 = [v18 copy];
    gridSizeClass = v17->_gridSizeClass;
    v17->_gridSizeClass = (NSString *)v19;

    objc_storeStrong((id *)&v17->_representedIcon, a4);
    uint64_t v21 = [v14 copy];
    reason = v17->_reason;
    v17->_reason = (NSString *)v21;

    v17->_options = a6;
    objc_storeStrong((id *)&v17->_listView, a7);
  }

  return v17;
}

- (void)dealloc
{
  if (![(SBIconListViewPlaceholderAssertion *)self isInvalidated])
  {
    NSLog(&cfstr_Sbiconlistview_3.isa, self->_reason);
    [(SBIconListViewPlaceholderAssertion *)self invalidate];
  }
  v3.receiver = self;
  v3.super_class = (Class)SBIconListViewPlaceholderAssertion;
  [(SBIconListViewPlaceholderAssertion *)&v3 dealloc];
}

- (unint64_t)effectiveGridCellIndex
{
  objc_super v3 = [(SBIconListViewPlaceholderAssertion *)self placeholderIcon];
  v4 = [(SBIconListViewPlaceholderAssertion *)self listView];
  v5 = [v4 layoutMetrics];
  v6 = [v5 gridCellInfo];
  v7 = [v5 listModel];
  uint64_t v8 = [v7 indexForIcon:v3];
  unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v9 = [v6 gridCellIndexForIconIndex:v8];
  }

  return v9;
}

- (void)setGridCellIndex:(unint64_t)a3
{
  if (self->_gridCellIndex != a3 || [(SBIconListViewPlaceholderAssertion *)self positioningType])
  {
    self->_gridCellIndex = a3;
    [(SBIconListViewPlaceholderAssertion *)self setPositioningType:0];
    [(SBIconListViewPlaceholderAssertion *)self didChangePlaceholderPosition];
  }
}

- (void)swapWithIcon:(id)a3
{
  [(SBIconListViewPlaceholderAssertion *)self setPositioningRelativeIcon:a3];
  [(SBIconListViewPlaceholderAssertion *)self setPositioningType:1];
  [(SBIconListViewPlaceholderAssertion *)self didChangePlaceholderPosition];
}

- (void)placeAfterIcon:(id)a3
{
  [(SBIconListViewPlaceholderAssertion *)self setPositioningRelativeIcon:a3];
  [(SBIconListViewPlaceholderAssertion *)self setPositioningType:2];
  [(SBIconListViewPlaceholderAssertion *)self didChangePlaceholderPosition];
}

- (void)placeBeforeIcon:(id)a3
{
  [(SBIconListViewPlaceholderAssertion *)self setPositioningRelativeIcon:a3];
  [(SBIconListViewPlaceholderAssertion *)self setPositioningType:3];
  [(SBIconListViewPlaceholderAssertion *)self didChangePlaceholderPosition];
}

- (void)placeAboveIcon:(id)a3
{
  [(SBIconListViewPlaceholderAssertion *)self setPositioningRelativeIcon:a3];
  [(SBIconListViewPlaceholderAssertion *)self setPositioningType:4];
  [(SBIconListViewPlaceholderAssertion *)self didChangePlaceholderPosition];
}

- (void)placeBelowIcon:(id)a3
{
  [(SBIconListViewPlaceholderAssertion *)self setPositioningRelativeIcon:a3];
  [(SBIconListViewPlaceholderAssertion *)self setPositioningType:5];
  [(SBIconListViewPlaceholderAssertion *)self didChangePlaceholderPosition];
}

- (void)setOptions:(unint64_t)a3
{
  if (self->_options != a3)
  {
    self->_options = a3;
    [(SBIconListViewPlaceholderAssertion *)self didChangePlaceholderPosition];
  }
}

- (void)setGridSizeClass:(id)a3
{
  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_gridSizeClass != v4)
  {
    v10 = v4;
    BOOL v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    v5 = v10;
    if (!v6)
    {
      v7 = (NSString *)[(NSString *)v10 copy];
      gridSizeClass = self->_gridSizeClass;
      self->_gridSizeClass = v7;

      unint64_t v9 = [(SBIconListViewPlaceholderAssertion *)self placeholderIcon];
      [v9 setGridSizeClass:v10];
      [(SBIconListViewPlaceholderAssertion *)self didChangePlaceholderPosition];

      v5 = v10;
    }
  }
}

- (void)didChangePlaceholderPosition
{
  if (![(SBIconListViewPlaceholderAssertion *)self isInvalidated])
  {
    id v3 = [(SBIconListViewPlaceholderAssertion *)self listView];
    [v3 placeholderAssertionDidChangePosition:self];
  }
}

- (SBPlaceholderIcon)placeholderIcon
{
  placeholderIcon = self->_placeholderIcon;
  if (!placeholderIcon)
  {
    v4 = [(SBIconListViewPlaceholderAssertion *)self reason];
    v5 = [(SBIconListViewPlaceholderAssertion *)self gridSizeClass];
    BOOL v6 = +[SBPlaceholderIcon placeholderForReason:v4];
    v7 = self->_placeholderIcon;
    self->_placeholderIcon = v6;

    [(SBIcon *)self->_placeholderIcon setGridSizeClass:v5];
    placeholderIcon = self->_placeholderIcon;
  }
  return placeholderIcon;
}

- (unint64_t)listMutationOptions
{
  unint64_t v3 = [(SBIconListViewPlaceholderAssertion *)self options];
  unint64_t v4 = (v3 & 1) << 21;
  v5 = [(SBIconListViewPlaceholderAssertion *)self gridSizeClass];
  BOOL v6 = v5;
  if (v5 == @"SBHIconGridSizeClassDefault")
  {
  }
  else
  {
    v7 = [(SBIconListViewPlaceholderAssertion *)self gridSizeClass];
    int v8 = [v7 isEqualToString:@"SBHIconGridSizeClassDefault"];

    if (!v8) {
      v4 |= 0x40uLL;
    }
  }
  unint64_t v9 = (v3 << 6) & 0x180 | (((v3 >> 4) & 1) << 9) | v4;
  v10 = [(SBIconListViewPlaceholderAssertion *)self listView];
  int v11 = [v10 allowsGaps];

  if (v11) {
    return v9 | 0x100000;
  }
  else {
    return v9;
  }
}

- (unint64_t)folderMutationOptions
{
  unint64_t v3 = [(SBIconListViewPlaceholderAssertion *)self options];
  if (v3) {
    uint64_t v4 = 25165826;
  }
  else {
    uint64_t v4 = 8388610;
  }
  v5 = [(SBIconListViewPlaceholderAssertion *)self gridSizeClass];
  BOOL v6 = v5;
  if (v5 == @"SBHIconGridSizeClassDefault")
  {
  }
  else
  {
    v7 = [(SBIconListViewPlaceholderAssertion *)self gridSizeClass];
    int v8 = [v7 isEqualToString:@"SBHIconGridSizeClassDefault"];

    if (!v8) {
      v4 |= 0x80uLL;
    }
  }
  unint64_t v9 = (v3 << 7) & 0x300 | (((v3 >> 4) & 1) << 10) | v4;
  v10 = [(SBIconListViewPlaceholderAssertion *)self listView];
  int v11 = [v10 allowsGaps];

  if (v11) {
    return v9 | 0x400000;
  }
  else {
    return v9;
  }
}

- (void)invalidate
{
  if (![(SBIconListViewPlaceholderAssertion *)self isInvalidated])
  {
    unint64_t v3 = [(SBIconListViewPlaceholderAssertion *)self listView];
    [v3 removePlaceholderAssertion:self];

    [(SBIconListViewPlaceholderAssertion *)self setInvalidated:1];
  }
}

- (NSString)description
{
  return (NSString *)[(SBIconListViewPlaceholderAssertion *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBIconListViewPlaceholderAssertion *)self succinctDescriptionBuilder];
  unint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = [(SBIconListViewPlaceholderAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v4 = [(SBIconListViewPlaceholderAssertion *)self listView];
  v5 = [v4 gridSizeClassDomain];
  BOOL v6 = [(SBIconListViewPlaceholderAssertion *)self succinctDescriptionBuilder];
  id v7 = (id)objc_msgSend(v6, "appendInteger:withName:", -[SBIconListViewPlaceholderAssertion gridCellIndex](self, "gridCellIndex"), @"gridCellIndex");
  int v8 = [(SBIconListViewPlaceholderAssertion *)self gridSizeClass];
  unint64_t v9 = [v5 descriptionForGridSizeClass:v8];
  [v6 appendString:v9 withName:@"gridSizeClass"];

  v10 = [(SBIconListViewPlaceholderAssertion *)self representedIcon];
  id v11 = (id)[v6 appendObject:v10 withName:@"representedIcon" skipIfNil:1];

  id v12 = [(SBIconListViewPlaceholderAssertion *)self reason];
  id v13 = (id)[v6 appendObject:v12 withName:@"reason"];

  char v14 = [(SBIconListViewPlaceholderAssertion *)self options];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v16 = v15;
  if (v14)
  {
    [v15 addObject:@"minimizing layout disruption"];
    if ((v14 & 2) == 0)
    {
LABEL_3:
      if ((v14 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((v14 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v16 addObject:@"fixed"];
  if ((v14 & 0x10) == 0)
  {
LABEL_4:
    if ((v14 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  [v16 addObject:@"fixed if necessary"];
  if ((v14 & 4) == 0)
  {
LABEL_5:
    if ((v14 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_12:
  [v16 addObject:@"displacing existing fixed icons"];
  if ((v14 & 8) != 0) {
LABEL_6:
  }
    [v16 addObject:@"disallowing icon removal"];
LABEL_7:
  uint64_t v17 = [v16 componentsJoinedByString:@", "];

  [v6 appendString:v17 withName:@"options"];
  v18 = [(SBIconListViewPlaceholderAssertion *)self positioningRelativeIcon];
  id v19 = (id)[v6 appendObject:v18 withName:@"positioningRelativeIcon" skipIfNil:1];

  unint64_t v20 = [(SBIconListViewPlaceholderAssertion *)self positioningType];
  if (v20 > 5) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = off_1E6AB1020[v20];
  }
  [v6 appendString:v21 withName:@"positioningType"];
  objc_super v22 = [(SBIconListViewPlaceholderAssertion *)self listView];
  id v23 = (id)[v6 appendPointer:v22 withName:@"listView"];

  return v6;
}

- (unint64_t)gridCellIndex
{
  return self->_gridCellIndex;
}

- (NSString)gridSizeClass
{
  return self->_gridSizeClass;
}

- (SBIcon)representedIcon
{
  return self->_representedIcon;
}

- (NSString)reason
{
  return self->_reason;
}

- (unint64_t)options
{
  return self->_options;
}

- (SBIconListView)listView
{
  return self->_listView;
}

- (SBIcon)positioningRelativeIcon
{
  return self->_positioningRelativeIcon;
}

- (void)setPositioningRelativeIcon:(id)a3
{
}

- (int64_t)positioningType
{
  return self->_positioningType;
}

- (void)setPositioningType:(int64_t)a3
{
  self->_positioningType = a3;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_positioningRelativeIcon, 0);
  objc_storeStrong((id *)&self->_listView, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_representedIcon, 0);
  objc_storeStrong((id *)&self->_placeholderIcon, 0);
  objc_storeStrong((id *)&self->_gridSizeClass, 0);
}

@end