@interface PXConcretePhotosLensControlItem
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (NSString)symbolName;
- (NSString)title;
- (PXConcretePhotosLensControlItem)initWithIdentifier:(id)a3 title:(id)a4 symbolName:(id)a5;
@end

@implementation PXConcretePhotosLensControlItem

- (PXConcretePhotosLensControlItem)initWithIdentifier:(id)a3 title:(id)a4 symbolName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXConcretePhotosLensControlItem;
  v12 = [(PXConcretePhotosLensControlItem *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_title, a4);
    objc_storeStrong((id *)&v13->_symbolName, a5);
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    identifier = self->_identifier;
    v6 = [v4 identifier];
    BOOL v7 = [(NSString *)identifier isEqualToString:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

@end