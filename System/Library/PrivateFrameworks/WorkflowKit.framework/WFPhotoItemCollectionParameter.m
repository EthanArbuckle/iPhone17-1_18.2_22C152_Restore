@interface WFPhotoItemCollectionParameter
- (Class)singleStateClass;
- (NSString)pickerMode;
- (WFPhotoItemCollectionParameter)initWithDefinition:(id)a3;
- (int64_t)selectionLimit;
@end

@implementation WFPhotoItemCollectionParameter

- (void).cxx_destruct
{
}

- (int64_t)selectionLimit
{
  return self->_selectionLimit;
}

- (NSString)pickerMode
{
  return self->_pickerMode;
}

- (WFPhotoItemCollectionParameter)initWithDefinition:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFPhotoItemCollectionParameter;
  v5 = [(WFParameter *)&v16 initWithDefinition:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"PhotoItemCollectionPickerSelectionLimit"];
    uint64_t v7 = objc_opt_class();
    v8 = WFEnforceClass(v6, v7);
    v5->_selectionLimit = [v8 integerValue];

    v9 = [v4 objectForKey:@"PhotoItemCollectionPickerMode"];
    uint64_t v10 = objc_opt_class();
    v11 = WFEnforceClass(v9, v10);
    uint64_t v12 = [v11 copy];
    pickerMode = v5->_pickerMode;
    v5->_pickerMode = (NSString *)v12;

    v14 = v5;
  }

  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end