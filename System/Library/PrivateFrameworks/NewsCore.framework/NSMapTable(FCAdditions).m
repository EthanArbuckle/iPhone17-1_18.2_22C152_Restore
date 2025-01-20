@interface NSMapTable(FCAdditions)
- (id)fc_objectsForKeys:()FCAdditions;
- (void)fc_addObjectsFromMapTable:()FCAdditions;
@end

@implementation NSMapTable(FCAdditions)

- (id)fc_objectsForKeys:()FCAdditions
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__NSMapTable_FCAdditions__fc_objectsForKeys___block_invoke;
  v5[3] = &unk_1E5B4DC20;
  v5[4] = a1;
  v3 = objc_msgSend(a3, "fc_arrayByTransformingWithBlock:", v5);
  return v3;
}

- (void)fc_addObjectsFromMapTable:()FCAdditions
{
  v4 = a3;
  memset(&enumerator, 0, sizeof(enumerator));
  NSEnumerateMapTable(&enumerator, v4);
  value = 0;
  for (key = 0; NSNextMapEnumeratorPair(&enumerator, &key, &value); [a1 setObject:value forKey:key])
    ;
  NSEndMapTableEnumeration(&enumerator);
}

@end