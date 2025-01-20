@interface _UISectionFocusContainerGuidePackage
- (NSArray)focusGuides;
- (_UIFocusCollectionViewSectionContainerGuide)sectionEndFocusGuide;
- (_UIFocusCollectionViewSectionContainerGuide)sectionFocusGuide;
- (void)_updateFocusGuidesArray;
- (void)setSectionEndFocusGuide:(id)a3;
- (void)setSectionFocusGuide:(id)a3;
@end

@implementation _UISectionFocusContainerGuidePackage

- (void)setSectionFocusGuide:(id)a3
{
  v5 = (_UIFocusCollectionViewSectionContainerGuide *)a3;
  if (self->_sectionFocusGuide != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_sectionFocusGuide, a3);
    [(_UISectionFocusContainerGuidePackage *)self _updateFocusGuidesArray];
    v5 = v6;
  }
}

- (void)setSectionEndFocusGuide:(id)a3
{
  v5 = (_UIFocusCollectionViewSectionContainerGuide *)a3;
  if (self->_sectionEndFocusGuide != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_sectionEndFocusGuide, a3);
    [(_UISectionFocusContainerGuidePackage *)self _updateFocusGuidesArray];
    v5 = v6;
  }
}

- (void)_updateFocusGuidesArray
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = v3;
  if (self->_sectionFocusGuide) {
    -[NSArray addObject:](v3, "addObject:");
  }
  if (self->_sectionEndFocusGuide) {
    -[NSArray addObject:](v4, "addObject:");
  }
  focusGuides = self->_focusGuides;
  self->_focusGuides = v4;
}

- (_UIFocusCollectionViewSectionContainerGuide)sectionFocusGuide
{
  return self->_sectionFocusGuide;
}

- (_UIFocusCollectionViewSectionContainerGuide)sectionEndFocusGuide
{
  return self->_sectionEndFocusGuide;
}

- (NSArray)focusGuides
{
  return self->_focusGuides;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusGuides, 0);
  objc_storeStrong((id *)&self->_sectionEndFocusGuide, 0);
  objc_storeStrong((id *)&self->_sectionFocusGuide, 0);
}

@end