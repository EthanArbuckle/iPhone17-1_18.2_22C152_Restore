@interface PUIndexPathSet
- (BOOL)containsIndexPath:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)count;
- (void)enumerateIndexPathsUsingBlock:(id)a3;
@end

@implementation PUIndexPathSet

- (void)enumerateIndexPathsUsingBlock:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"PUIndexPathSet.m" lineNumber:37 description:@"not implemented yet"];
}

- (int64_t)count
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PUIndexPathSet.m" lineNumber:32 description:@"not implemented yet"];

  return 0;
}

- (BOOL)containsIndexPath:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PUIndexPathSet.m" lineNumber:27 description:@"not implemented yet"];

  return 0;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PUIndexPathSet.m" lineNumber:22 description:@"not implemented yet"];

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PUIndexPathSet.m" lineNumber:17 description:@"not implemented yet"];

  return 0;
}

@end