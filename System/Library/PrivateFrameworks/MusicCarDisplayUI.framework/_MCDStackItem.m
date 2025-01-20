@interface _MCDStackItem
+ (id)stackItemWithContainer:(id)a3;
- (NSIndexPath)indexPath;
- (NSString)identifier;
- (id)description;
@end

@implementation _MCDStackItem

+ (id)stackItemWithContainer:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = [v4 indexPath];
  uint64_t v7 = [v6 copy];
  v8 = (void *)v5[2];
  v5[2] = v7;

  v9 = [v4 identifier];

  uint64_t v10 = [v9 copy];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (id)description
{
  v2 = NSString;
  identifier = self->_identifier;
  id v4 = _MCDStringFromIndexPath(self->_indexPath);
  v5 = [v2 stringWithFormat:@"[%@:%@]", identifier, v4];

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end