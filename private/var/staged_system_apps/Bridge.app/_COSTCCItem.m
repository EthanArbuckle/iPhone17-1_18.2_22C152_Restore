@interface _COSTCCItem
- (BOOL)enabled;
- (NSString)bundleID;
- (NSString)displayName;
- (_COSTCCItem)initWithBundleID:(id)a3 displayName:(id)a4 enabled:(BOOL)a5;
- (void)setEnabled:(BOOL)a3;
@end

@implementation _COSTCCItem

- (_COSTCCItem)initWithBundleID:(id)a3 displayName:(id)a4 enabled:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_COSTCCItem;
  v10 = [(_COSTCCItem *)&v16 init];
  if (v10)
  {
    v11 = (NSString *)[v8 copy];
    bundleID = v10->_bundleID;
    v10->_bundleID = v11;

    v13 = (NSString *)[v9 copy];
    displayName = v10->_displayName;
    v10->_displayName = v13;

    v10->_enabled = a5;
  }

  return v10;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end