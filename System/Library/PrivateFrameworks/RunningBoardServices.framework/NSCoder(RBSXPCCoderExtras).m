@interface NSCoder(RBSXPCCoderExtras)
- (id)decodeCollectionOfClass:()RBSXPCCoderExtras containingClass:forKey:;
- (id)decodeStringForKey:()RBSXPCCoderExtras;
- (void)encodeCollection:()RBSXPCCoderExtras forKey:;
@end

@implementation NSCoder(RBSXPCCoderExtras)

- (void)encodeCollection:()RBSXPCCoderExtras forKey:
{
  id v6 = a4;
  v7 = [a3 objectEnumerator];
  id v8 = [v7 allObjects];

  [a1 encodeObject:v8 forKey:v6];
}

- (id)decodeCollectionOfClass:()RBSXPCCoderExtras containingClass:forKey:
{
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = a5;
  v10 = objc_msgSend(v8, "setWithObjects:", objc_opt_class(), a4, 0);
  v11 = [a1 decodeObjectOfClasses:v10 forKey:v9];

  v12 = 0;
  if (_NSIsNSArray()) {
    v12 = (void *)[[a3 alloc] initWithArray:v11];
  }

  return v12;
}

- (id)decodeStringForKey:()RBSXPCCoderExtras
{
  id v4 = a3;
  v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];

  return v5;
}

@end