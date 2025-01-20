@interface AllRefinementsViewModelMultiSelectElement
- (AllRefinementsViewModelMultiSelectElement)initWithDisplayName:(id)a3 isSelected:(BOOL)a4 optionalLabelWidth:(id)a5 refinementKey:(id)a6 data:(id)a7;
- (BOOL)isSelected;
- (NSNumber)labelWidth;
- (NSNumber)selectionSequenceNumber;
- (NSString)displayName;
- (NSString)refinementKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)data;
- (void)setIsSelected:(BOOL)a3;
- (void)setSelectionSequenceNumber:(id)a3;
@end

@implementation AllRefinementsViewModelMultiSelectElement

- (AllRefinementsViewModelMultiSelectElement)initWithDisplayName:(id)a3 isSelected:(BOOL)a4 optionalLabelWidth:(id)a5 refinementKey:(id)a6 data:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)AllRefinementsViewModelMultiSelectElement;
  v16 = [(AllRefinementsViewModelMultiSelectElement *)&v22 init];
  if (v16)
  {
    v17 = (NSString *)[v12 copy];
    displayName = v16->_displayName;
    v16->_displayName = v17;

    v16->_isSelected = a4;
    objc_storeStrong((id *)&v16->_labelWidth, a5);
    v19 = (NSString *)[v14 copy];
    refinementKey = v16->_refinementKey;
    v16->_refinementKey = v19;

    objc_storeStrong(&v16->_data, a7);
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [AllRefinementsViewModelMultiSelectElement alloc];
  v5 = [(AllRefinementsViewModelMultiSelectElement *)self displayName];
  BOOL v6 = [(AllRefinementsViewModelMultiSelectElement *)self isSelected];
  v7 = [(AllRefinementsViewModelMultiSelectElement *)self labelWidth];
  v8 = [(AllRefinementsViewModelMultiSelectElement *)self refinementKey];
  v9 = [(AllRefinementsViewModelMultiSelectElement *)self data];
  v10 = [(AllRefinementsViewModelMultiSelectElement *)v4 initWithDisplayName:v5 isSelected:v6 optionalLabelWidth:v7 refinementKey:v8 data:v9];

  return v10;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (NSString)refinementKey
{
  return self->_refinementKey;
}

- (id)data
{
  return self->_data;
}

- (NSNumber)selectionSequenceNumber
{
  return self->_selectionSequenceNumber;
}

- (void)setSelectionSequenceNumber:(id)a3
{
}

- (NSNumber)labelWidth
{
  return self->_labelWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelWidth, 0);
  objc_storeStrong((id *)&self->_selectionSequenceNumber, 0);
  objc_storeStrong(&self->_data, 0);
  objc_storeStrong((id *)&self->_refinementKey, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end