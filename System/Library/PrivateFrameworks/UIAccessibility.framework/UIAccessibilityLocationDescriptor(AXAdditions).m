@interface UIAccessibilityLocationDescriptor(AXAdditions)
- (BOOL)matchesDictionaryRepresentation:()AXAdditions;
- (id)dictionaryRepresentation;
- (uint64_t)_auxiliaryDataAsDictionaryRepresentation;
@end

@implementation UIAccessibilityLocationDescriptor(AXAdditions)

- (uint64_t)_auxiliaryDataAsDictionaryRepresentation
{
  return 0;
}

- (id)dictionaryRepresentation
{
  v17[3] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a1, "view"));
  [a1 point];
  valuePtr[0] = v3;
  valuePtr[1] = v4;
  AXValueRef v5 = AXValueCreate(kAXValueTypeCGPoint, valuePtr);
  v6 = [a1 attributedName];
  v7 = objc_opt_new();
  uint64_t v8 = *MEMORY[0x1E4F48878];
  v17[0] = v2;
  uint64_t v9 = *MEMORY[0x1E4F48870];
  v16[0] = v8;
  v16[1] = v9;
  CFTypeRef v10 = CFAutorelease(v5);
  v16[2] = *MEMORY[0x1E4F48848];
  v17[1] = v10;
  v17[2] = v6;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  [v7 addEntriesFromDictionary:v11];
  v12 = [a1 _auxiliaryDataAsDictionaryRepresentation];
  if (v12) {
    [v7 addEntriesFromDictionary:v12];
  }
  v13 = (void *)[v7 copy];

  return v13;
}

- (BOOL)matchesDictionaryRepresentation:()AXAdditions
{
  id v4 = a3;
  AXValueRef v5 = [a1 attributedName];
  v6 = [v5 string];
  v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F48848]];
  uint64_t v8 = [v7 attributedString];
  uint64_t v9 = [v8 string];
  int v10 = [v6 isEqualToString:v9];

  if (v10)
  {
    uint64_t v11 = [a1 view];
    v12 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F48878]];
    BOOL v13 = [v12 unsignedLongLongValue] == v11;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

@end