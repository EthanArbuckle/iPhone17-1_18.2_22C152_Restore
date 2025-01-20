@interface SASItnAlignment
+ (id)itnAlignment;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)firstPostItnCharPos;
- (int64_t)firstPreItnTokenIndex;
- (int64_t)lastPostItnCharPos;
- (int64_t)lastPreItnTokenIndex;
- (void)setFirstPostItnCharPos:(int64_t)a3;
- (void)setFirstPreItnTokenIndex:(int64_t)a3;
- (void)setLastPostItnCharPos:(int64_t)a3;
- (void)setLastPreItnTokenIndex:(int64_t)a3;
@end

@implementation SASItnAlignment

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"ItnAlignment";
}

+ (id)itnAlignment
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)firstPostItnCharPos
{
  return AceObjectIntegerForProperty(self, @"firstPostItnCharPos");
}

- (void)setFirstPostItnCharPos:(int64_t)a3
{
}

- (int64_t)firstPreItnTokenIndex
{
  return AceObjectIntegerForProperty(self, @"firstPreItnTokenIndex");
}

- (void)setFirstPreItnTokenIndex:(int64_t)a3
{
}

- (int64_t)lastPostItnCharPos
{
  return AceObjectIntegerForProperty(self, @"lastPostItnCharPos");
}

- (void)setLastPostItnCharPos:(int64_t)a3
{
}

- (int64_t)lastPreItnTokenIndex
{
  return AceObjectIntegerForProperty(self, @"lastPreItnTokenIndex");
}

- (void)setLastPreItnTokenIndex:(int64_t)a3
{
}

@end