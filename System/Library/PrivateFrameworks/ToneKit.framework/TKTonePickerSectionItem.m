@interface TKTonePickerSectionItem
- (TKTonePickerController)_parentTonePickerController;
- (id)childItemAtIndex:(int64_t)a3;
- (int64_t)numberOfChildren;
- (unint64_t)regularToneSectionIndex;
- (unint64_t)sectionHeader;
- (void)_appendDescriptionOfAttributesToString:(id)a3;
- (void)_setNumberOfChildren:(int64_t)a3;
- (void)_setParentTonePickerController:(id)a3;
- (void)_setRegularToneSectionIndex:(unint64_t)a3;
- (void)_setSectionHeader:(unint64_t)a3;
@end

@implementation TKTonePickerSectionItem

- (id)childItemAtIndex:(int64_t)a3
{
  v5 = [(TKTonePickerSectionItem *)self _parentTonePickerController];
  v6 = [v5 _pickerRowItemAtIndex:a3 inSectionForItem:self];

  return v6;
}

- (void)_appendDescriptionOfAttributesToString:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TKTonePickerSectionItem;
  id v4 = a3;
  [(TKPickerSectionItem *)&v7 _appendDescriptionOfAttributesToString:v4];
  unint64_t v5 = [(TKTonePickerSectionItem *)self sectionHeader];
  if (v5 > 4) {
    v6 = 0;
  }
  else {
    v6 = off_264589DC0[v5];
  }
  [(TKPickerItem *)self _appendDescriptionOfAttributeNamed:@"sectionHeader" withStringValue:v6 toString:v4];
  [(TKPickerItem *)self _appendDescriptionOfAttributeNamed:@"regularToneSectionIndex" withIntegerValue:[(TKTonePickerSectionItem *)self regularToneSectionIndex] toString:v4];
}

- (unint64_t)sectionHeader
{
  return self->_sectionHeader;
}

- (void)_setSectionHeader:(unint64_t)a3
{
  self->_sectionHeader = a3;
}

- (unint64_t)regularToneSectionIndex
{
  return self->_regularToneSectionIndex;
}

- (void)_setRegularToneSectionIndex:(unint64_t)a3
{
  self->_regularToneSectionIndex = a3;
}

- (TKTonePickerController)_parentTonePickerController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__parentTonePickerController);

  return (TKTonePickerController *)WeakRetained;
}

- (void)_setParentTonePickerController:(id)a3
{
}

- (int64_t)numberOfChildren
{
  return self->_numberOfChildren;
}

- (void)_setNumberOfChildren:(int64_t)a3
{
  self->_numberOfChildren = a3;
}

- (void).cxx_destruct
{
}

@end