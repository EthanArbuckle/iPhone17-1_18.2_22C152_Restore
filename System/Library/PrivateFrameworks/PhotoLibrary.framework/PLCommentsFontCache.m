@interface PLCommentsFontCache
+ (id)sharedCache;
- (PLCommentsFontCache)init;
- (UIFont)commentAttributionDateFont;
- (UIFont)commentAttributionNameFont;
- (UIFont)commentEntryFont;
- (UIFont)commentSendButtonFont;
- (UIFont)commentTextFont;
- (UIFont)likeFont;
- (UIFont)youLikeFont;
- (id)_bodyFontDescriptor;
- (id)_emphasizedBodyFontDescriptor;
- (id)_emphasizedShortCaptionFontDescriptor;
- (id)_shortBodyFontDescriptor;
- (id)_shortCaptionFontDescriptor;
- (id)_shortSubheadlineFontDescriptor;
- (void)_contentSizesDidChange:(id)a3;
- (void)_invalidateCache;
- (void)dealloc;
@end

@implementation PLCommentsFontCache

- (UIFont)commentSendButtonFont
{
  v2 = (void *)MEMORY[0x1E4F42A30];
  id v3 = [(PLCommentsFontCache *)self _emphasizedBodyFontDescriptor];
  return (UIFont *)[v2 fontWithDescriptor:v3 size:0.0];
}

- (UIFont)commentEntryFont
{
  v2 = (void *)MEMORY[0x1E4F42A30];
  id v3 = [(PLCommentsFontCache *)self _shortBodyFontDescriptor];
  return (UIFont *)[v2 fontWithDescriptor:v3 size:0.0];
}

- (UIFont)commentAttributionNameFont
{
  v2 = (void *)MEMORY[0x1E4F42A30];
  id v3 = [(PLCommentsFontCache *)self _emphasizedShortCaptionFontDescriptor];
  return (UIFont *)[v2 fontWithDescriptor:v3 size:0.0];
}

- (UIFont)commentAttributionDateFont
{
  v2 = (void *)MEMORY[0x1E4F42A30];
  id v3 = [(PLCommentsFontCache *)self _shortCaptionFontDescriptor];
  return (UIFont *)[v2 fontWithDescriptor:v3 size:0.0];
}

- (UIFont)commentTextFont
{
  v2 = (void *)MEMORY[0x1E4F42A30];
  id v3 = [(PLCommentsFontCache *)self _shortSubheadlineFontDescriptor];
  return (UIFont *)[v2 fontWithDescriptor:v3 size:0.0];
}

- (UIFont)likeFont
{
  v2 = (void *)MEMORY[0x1E4F42A30];
  id v3 = [(PLCommentsFontCache *)self _shortCaptionFontDescriptor];
  return (UIFont *)[v2 fontWithDescriptor:v3 size:0.0];
}

- (UIFont)youLikeFont
{
  v2 = (void *)MEMORY[0x1E4F42A30];
  id v3 = [(PLCommentsFontCache *)self _emphasizedShortCaptionFontDescriptor];
  return (UIFont *)[v2 fontWithDescriptor:v3 size:0.0];
}

- (id)_shortBodyFontDescriptor
{
  id result = self->__shortBodyFontDescriptor;
  if (!result)
  {
    id result = (id)objc_msgSend(-[PLCommentsFontCache _bodyFontDescriptor](self, "_bodyFontDescriptor"), "fontDescriptorWithSymbolicTraits:", 0x8000);
    self->__shortBodyFontDescriptor = (UIFontDescriptor *)result;
  }
  return result;
}

- (id)_emphasizedBodyFontDescriptor
{
  id result = self->__emphasizedBodyFontDescriptor;
  if (!result)
  {
    id result = (id)objc_msgSend(-[PLCommentsFontCache _bodyFontDescriptor](self, "_bodyFontDescriptor"), "fontDescriptorWithSymbolicTraits:", 2);
    self->__emphasizedBodyFontDescriptor = (UIFontDescriptor *)result;
  }
  return result;
}

- (id)_bodyFontDescriptor
{
  id result = self->__bodyFontDescriptor;
  if (!result)
  {
    id result = (id)[MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43870] addingSymbolicTraits:0 options:0];
    self->__bodyFontDescriptor = (UIFontDescriptor *)result;
  }
  return result;
}

- (id)_shortSubheadlineFontDescriptor
{
  id result = self->__shortSubheadlineFontDescriptor;
  if (!result)
  {
    id result = (id)[MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F438C8] addingSymbolicTraits:0x8000 options:0];
    self->__shortSubheadlineFontDescriptor = (UIFontDescriptor *)result;
  }
  return result;
}

- (id)_emphasizedShortCaptionFontDescriptor
{
  id result = self->__emphasizedShortCaptionFontDescriptor;
  if (!result)
  {
    id result = (id)objc_msgSend(-[PLCommentsFontCache _shortCaptionFontDescriptor](self, "_shortCaptionFontDescriptor"), "fontDescriptorWithSymbolicTraits:", 2);
    self->__emphasizedShortCaptionFontDescriptor = (UIFontDescriptor *)result;
  }
  return result;
}

- (id)_shortCaptionFontDescriptor
{
  id result = self->__shortCaptionFontDescriptor;
  if (!result)
  {
    id result = (id)[MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43880] addingSymbolicTraits:0 options:0];
    self->__shortCaptionFontDescriptor = (UIFontDescriptor *)result;
  }
  return result;
}

- (void)_invalidateCache
{
  self->__shortCaptionFontDescriptor = 0;
  self->__emphasizedShortCaptionFontDescriptor = 0;

  self->__shortSubheadlineFontDescriptor = 0;
  self->__bodyFontDescriptor = 0;

  self->__emphasizedBodyFontDescriptor = 0;
  self->__shortBodyFontDescriptor = 0;
}

- (void)_contentSizesDidChange:(id)a3
{
  [(PLCommentsFontCache *)self _invalidateCache];
  v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"PLCommentsFontCacheDidChangeNotification" object:self];
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PLCommentsFontCache;
  [(PLCommentsFontCache *)&v3 dealloc];
}

- (PLCommentsFontCache)init
{
  v5.receiver = self;
  v5.super_class = (Class)PLCommentsFontCache;
  v2 = [(PLCommentsFontCache *)&v5 init];
  if (v2)
  {
    objc_super v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__contentSizesDidChange_ name:*MEMORY[0x1E4F43788] object:0];
  }
  return v2;
}

+ (id)sharedCache
{
  return (id)sharedCache_sharedCache;
}

PLCommentsFontCache *__34__PLCommentsFontCache_sharedCache__block_invoke()
{
  id result = objc_alloc_init(PLCommentsFontCache);
  sharedCache_sharedCache = (uint64_t)result;
  return result;
}

@end