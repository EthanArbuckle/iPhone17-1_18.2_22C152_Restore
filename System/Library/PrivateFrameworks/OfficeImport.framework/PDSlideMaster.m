@interface PDSlideMaster
- (BOOL)dateTimePlaceholderIsVisible;
- (BOOL)footerPlaceholderIsVisible;
- (BOOL)headerPlaceholderIsVisible;
- (BOOL)slideNumberPlaceholderIsVisible;
- (NSMutableArray)slideLayouts;
- (PDPresentation)presentation;
- (PDSlideMaster)initWithPresentation:(id)a3;
- (id)addSlideLayout;
- (id)bodyTextStyle;
- (id)colorMap;
- (id)colorScheme;
- (id)defaultTextListStyle;
- (id)defaultTheme;
- (id)description;
- (id)drawingTheme;
- (id)fontScheme;
- (id)masterGraphicForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5;
- (id)otherTextStyle;
- (id)parentShapePropertiesForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5;
- (id)parentSlideBase;
- (id)parentTextBodyPropertiesForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5;
- (id)parentTextStyleForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 defaultTextListStyle:(id)a5 overrideIndex:(BOOL)a6;
- (id)placeholderWithType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5;
- (id)slideLayoutAtIndex:(unint64_t)a3;
- (id)slideLayoutOfType:(int)a3;
- (id)styleMatrix;
- (id)theme;
- (id)titleTextStyle;
- (unint64_t)slideLayoutCount;
- (void)addSlideLayout:(id)a3;
- (void)doneWithContent;
- (void)removeUnnecessaryOverrides;
- (void)setBodyTextStyle:(id)a3;
- (void)setDateTimePlaceholderIsVisible:(BOOL)a3;
- (void)setFooterPlaceholderIsVisible:(BOOL)a3;
- (void)setHeaderPlaceholderIsVisible:(BOOL)a3;
- (void)setOtherTextStyle:(id)a3;
- (void)setSlideLayouts:(id)a3;
- (void)setSlideNumberPlaceholderIsVisible:(BOOL)a3;
- (void)setTitleTextStyle:(id)a3;
- (void)setUpPropertyHierarchyPreservingEffectiveValues;
@end

@implementation PDSlideMaster

- (id)theme
{
  return self->mTheme;
}

- (void)setTitleTextStyle:(id)a3
{
}

- (void)setBodyTextStyle:(id)a3
{
}

- (void)setOtherTextStyle:(id)a3
{
}

- (id)colorMap
{
  return self->mColorMap;
}

- (void)setHeaderPlaceholderIsVisible:(BOOL)a3
{
  self->mHeaderPlaceholderIsVisible = a3;
}

- (void)setFooterPlaceholderIsVisible:(BOOL)a3
{
  self->mFooterPlaceholderIsVisible = a3;
}

- (void)setDateTimePlaceholderIsVisible:(BOOL)a3
{
  self->mDateTimePlaceholderIsVisible = a3;
}

- (void)setSlideNumberPlaceholderIsVisible:(BOOL)a3
{
  self->mSlideNumberPlaceholderIsVisible = a3;
}

- (id)parentTextStyleForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 defaultTextListStyle:(id)a5 overrideIndex:(BOOL)a6
{
  id v8 = a5;
  v9 = v8;
  if (a3 > 8)
  {
    id v10 = [(PDSlideMaster *)self otherTextStyle];
  }
  else if (((1 << a3) & 0xF0) != 0)
  {
    id v10 = v8;
  }
  else
  {
    if (((1 << a3) & 0x10A) != 0) {
      [(PDSlideMaster *)self bodyTextStyle];
    }
    else {
    id v10 = [(PDSlideMaster *)self titleTextStyle];
    }
  }
  v11 = v10;

  return v11;
}

- (id)titleTextStyle
{
  return self->mTitleTextStyle;
}

- (id)parentTextBodyPropertiesForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  return 0;
}

- (id)parentShapePropertiesForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  return 0;
}

- (id)masterGraphicForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  return 0;
}

- (id)bodyTextStyle
{
  return self->mBodyTextStyle;
}

- (id)colorScheme
{
  v2 = [(PDSlideMaster *)self theme];
  v3 = [v2 baseStyles];
  v4 = [v3 colorScheme];

  return v4;
}

- (id)placeholderWithType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PDSlideMaster;
  v5 = [(PDSlideBase *)&v7 placeholderWithType:+[PDSlideBase inheritedPlaceholderType:](PDSlideBase, "inheritedPlaceholderType:", *(void *)&a3, *(void *)&a4, a5) placeholderTypeIndex:0 overrideIndex:1];
  return v5;
}

- (unint64_t)slideLayoutCount
{
  return [(NSMutableArray *)self->mSlideLayouts count];
}

- (id)slideLayoutOfType:(int)a3
{
  if ([(NSMutableArray *)self->mSlideLayouts count])
  {
    uint64_t v5 = 0;
    unsigned int v6 = 1;
    while (1)
    {
      objc_super v7 = [(NSMutableArray *)self->mSlideLayouts objectAtIndex:v5];
      if ([v7 slideLayoutType] == a3) {
        break;
      }

      uint64_t v5 = v6;
      if ([(NSMutableArray *)self->mSlideLayouts count] <= (unint64_t)v6++) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    objc_super v7 = 0;
  }
  return v7;
}

- (id)addSlideLayout
{
  v3 = [[PDSlideLayout alloc] initWithSlideMaster:self];
  [(PDSlideMaster *)self addSlideLayout:v3];
  return v3;
}

- (void)addSlideLayout:(id)a3
{
  id v4 = a3;
  -[NSMutableArray addObject:](self->mSlideLayouts, "addObject:");
  [v4 setSlideMaster:self];
}

- (id)slideLayoutAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mSlideLayouts objectAtIndex:a3];
}

- (id)otherTextStyle
{
  return self->mOtherTextStyle;
}

- (id)defaultTheme
{
  return self->mTheme;
}

- (id)fontScheme
{
  v2 = [(PDSlideMaster *)self theme];
  v3 = [v2 baseStyles];
  id v4 = [v3 fontScheme];

  return v4;
}

- (id)styleMatrix
{
  v2 = [(PDSlideMaster *)self theme];
  v3 = [v2 baseStyles];
  id v4 = [v3 styleMatrix];

  return v4;
}

- (PDSlideMaster)initWithPresentation:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PDSlideMaster;
  uint64_t v5 = [(PDSlideBase *)&v25 init];
  unsigned int v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mPresentation, v4);
    objc_super v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mSlideLayouts = v6->mSlideLayouts;
    v6->mSlideLayouts = v7;

    v9 = objc_alloc_init(OADTheme);
    mTheme = v6->mTheme;
    v6->mTheme = v9;

    v11 = objc_alloc_init(OADColorMap);
    mColorMap = v6->mColorMap;
    v6->mColorMap = v11;

    v13 = objc_alloc_init(OADTextListStyle);
    mTitleTextStyle = v6->mTitleTextStyle;
    v6->mTitleTextStyle = v13;

    v15 = objc_alloc_init(OADTextListStyle);
    mBodyTextStyle = v6->mBodyTextStyle;
    v6->mBodyTextStyle = v15;

    v17 = objc_alloc_init(OADTextListStyle);
    mOtherTextStyle = v6->mOtherTextStyle;
    v6->mOtherTextStyle = v17;

    for (uint64_t i = 0; i != 9; ++i)
    {
      v20 = [(OADTextListStyle *)v6->mTitleTextStyle propertiesForListLevel:i];
      v21 = [(OADTextListStyle *)v6->mBodyTextStyle propertiesForListLevel:i];
      LODWORD(v22) = 1116733440;
      [v20 setDefaultTab:v22];
      LODWORD(v23) = 1116733440;
      [v21 setDefaultTab:v23];
    }
  }

  return v6;
}

- (id)parentSlideBase
{
  return 0;
}

- (void)doneWithContent
{
  mSlideLayouts = self->mSlideLayouts;
  self->mSlideLayouts = 0;

  mTheme = self->mTheme;
  self->mTheme = 0;

  mColorMap = self->mColorMap;
  self->mColorMap = 0;

  mTitleTextStyle = self->mTitleTextStyle;
  self->mTitleTextStyle = 0;

  mBodyTextStyle = self->mBodyTextStyle;
  self->mBodyTextStyle = 0;

  mOtherTextStyle = self->mOtherTextStyle;
  self->mOtherTextStyle = 0;

  v9.receiver = self;
  v9.super_class = (Class)PDSlideMaster;
  [(PDSlideBase *)&v9 doneWithContent];
}

- (id)drawingTheme
{
  v2 = [[OADDrawingTheme alloc] initWithTheme:self->mTheme colorMap:self->mColorMap colorPalette:0];
  return v2;
}

- (id)defaultTextListStyle
{
  v2 = [(PDSlideMaster *)self presentation];
  v3 = [v2 defaultTextStyle];

  return v3;
}

- (void)setUpPropertyHierarchyPreservingEffectiveValues
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)PDSlideMaster;
  [(PDSlideBase *)&v11 setUpPropertyHierarchyPreservingEffectiveValues];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  v3 = self->mSlideLayouts;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "setUpPropertyHierarchyPreservingEffectiveValues", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)removeUnnecessaryOverrides
{
  [(NSMutableArray *)self->mSlideLayouts makeObjectsPerformSelector:sel_removeUnnecessaryOverrides];
  v3.receiver = self;
  v3.super_class = (Class)PDSlideMaster;
  [(PDSlideBase *)&v3 removeUnnecessaryOverrides];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PDSlideMaster;
  v2 = [(PDSlideBase *)&v4 description];
  return v2;
}

- (PDPresentation)presentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mPresentation);
  return (PDPresentation *)WeakRetained;
}

- (NSMutableArray)slideLayouts
{
  return self->mSlideLayouts;
}

- (void)setSlideLayouts:(id)a3
{
}

- (BOOL)headerPlaceholderIsVisible
{
  return self->mHeaderPlaceholderIsVisible;
}

- (BOOL)footerPlaceholderIsVisible
{
  return self->mFooterPlaceholderIsVisible;
}

- (BOOL)slideNumberPlaceholderIsVisible
{
  return self->mSlideNumberPlaceholderIsVisible;
}

- (BOOL)dateTimePlaceholderIsVisible
{
  return self->mDateTimePlaceholderIsVisible;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mPresentation);
  objc_storeStrong((id *)&self->mOtherTextStyle, 0);
  objc_storeStrong((id *)&self->mBodyTextStyle, 0);
  objc_storeStrong((id *)&self->mTitleTextStyle, 0);
  objc_storeStrong((id *)&self->mColorMap, 0);
  objc_storeStrong((id *)&self->mTheme, 0);
  objc_storeStrong((id *)&self->mSlideLayouts, 0);
}

@end