@interface _PXPhotosDetailsBarItem
- (NSString)description;
- (NSString)identifier;
- (_PXPhotosDetailsBarItem)initWithIdentifier:(id)a3;
@end

@implementation _PXPhotosDetailsBarItem

- (void).cxx_destruct
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)_PXPhotosDetailsBarItem;
  v4 = [(_PXPhotosDetailsBarItem *)&v7 description];
  v5 = [v3 stringWithFormat:@"<%@ identifier:%@>", v4, self->_identifier];

  return (NSString *)v5;
}

- (_PXPhotosDetailsBarItem)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXPhotosDetailsBarItem;
  v6 = [(_PXPhotosDetailsBarItem *)&v9 init];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

@end