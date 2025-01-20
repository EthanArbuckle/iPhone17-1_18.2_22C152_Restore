@interface UASharedPasteboardActivityInfo
- (NSSet)pasteboardTypes;
- (int64_t)generation;
- (void)setGeneration:(int64_t)a3;
- (void)setPasteboardTypes:(id)a3;
@end

@implementation UASharedPasteboardActivityInfo

- (NSSet)pasteboardTypes
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPasteboardTypes:(id)a3
{
}

- (int64_t)generation
{
  return self->_generation;
}

- (void)setGeneration:(int64_t)a3
{
  self->_generation = a3;
}

- (void).cxx_destruct
{
}

@end