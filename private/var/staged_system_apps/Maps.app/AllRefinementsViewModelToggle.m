@interface AllRefinementsViewModelToggle
- (AllRefinementsViewModelToggle)initWithDisplayName:(id)a3 isSelected:(BOOL)a4 data:(id)a5 refinementKey:(id)a6;
- (BOOL)isSelected;
- (NSNumber)selectionSequenceNumber;
- (NSString)displayName;
- (NSString)refinementKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)data;
- (void)setIsSelected:(BOOL)a3;
- (void)setSelectionSequenceNumber:(id)a3;
@end

@implementation AllRefinementsViewModelToggle

- (AllRefinementsViewModelToggle)initWithDisplayName:(id)a3 isSelected:(BOOL)a4 data:(id)a5 refinementKey:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)AllRefinementsViewModelToggle;
  v13 = [(AllRefinementsViewModelToggle *)&v19 init];
  if (v13)
  {
    v14 = (NSString *)[v10 copy];
    displayName = v13->_displayName;
    v13->_displayName = v14;

    v13->_isSelected = a4;
    objc_storeStrong(&v13->_data, a5);
    v16 = (NSString *)[v12 copy];
    refinementKey = v13->_refinementKey;
    v13->_refinementKey = v16;
  }
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [AllRefinementsViewModelToggle alloc];
  v5 = [(AllRefinementsViewModelToggle *)self displayName];
  BOOL v6 = [(AllRefinementsViewModelToggle *)self isSelected];
  v7 = [(AllRefinementsViewModelToggle *)self data];
  v8 = [(AllRefinementsViewModelToggle *)self refinementKey];
  v9 = [(AllRefinementsViewModelToggle *)v4 initWithDisplayName:v5 isSelected:v6 data:v7 refinementKey:v8];

  return v9;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionSequenceNumber, 0);
  objc_storeStrong(&self->_data, 0);
  objc_storeStrong((id *)&self->_refinementKey, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end