@interface PXStoryMemoryFeedPlayButtonSpec
- (NSDictionary)labelAttributesCache;
- (UIEdgeInsets)labelPadding;
- (id)labelAttributes;
- (int64_t)backgroundStyle;
- (void)setLabelAttributesCache:(id)a3;
@end

@implementation PXStoryMemoryFeedPlayButtonSpec

- (void).cxx_destruct
{
}

- (void)setLabelAttributesCache:(id)a3
{
}

- (NSDictionary)labelAttributesCache
{
  return self->_labelAttributesCache;
}

- (int64_t)backgroundStyle
{
  return 1;
}

- (id)labelAttributes
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = [(PXStoryMemoryFeedPlayButtonSpec *)self labelAttributesCache];

  if (!v3)
  {
    v4 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
    v5 = (void *)[v4 mutableCopy];

    [v5 setAlignment:0];
    uint64_t v8 = *MEMORY[0x1E4FB06F8];
    PXFontWithTextStyleSymbolicTraits();
  }
  v6 = [(PXStoryMemoryFeedPlayButtonSpec *)self labelAttributesCache];
  return v6;
}

- (UIEdgeInsets)labelPadding
{
}

@end