@interface _SUICStreamingWord
- (CALayer)wordLayer;
- (NSArray)emojiRangesInText;
- (UIImage)beginImage;
- (UIImage)endImage;
- (_NSRange)textRange;
- (_SUICStreamingWord)init;
- (_SUICStreamingWord)previous;
- (double)glyphLocationInWordX;
- (int64_t)insertType;
- (void)setBeginImage:(id)a3;
- (void)setEmojiRangesInText:(id)a3;
- (void)setEndImage:(id)a3;
- (void)setGlyphLocationInWordX:(double)a3;
- (void)setInsertType:(int64_t)a3;
- (void)setPrevious:(id)a3;
- (void)setTextRange:(_NSRange)a3;
- (void)setWordLayer:(id)a3;
@end

@implementation _SUICStreamingWord

- (_SUICStreamingWord)init
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)_SUICStreamingWord;
  v2 = [(_SUICStreamingWord *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F39BE8] layer];
    v4 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v4 setName:@"blurFilter"];
    [v4 setValue:&unk_1EFB50238 forKeyPath:*MEMORY[0x1E4F3A1D8]];
    v8[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v3 setFilters:v5];

    [(_SUICStreamingWord *)v2 setWordLayer:v3];
  }
  return v2;
}

- (_SUICStreamingWord)previous
{
  return self->_previous;
}

- (void)setPrevious:(id)a3
{
}

- (int64_t)insertType
{
  return self->_insertType;
}

- (void)setInsertType:(int64_t)a3
{
  self->_insertType = a3;
}

- (_NSRange)textRange
{
  NSUInteger length = self->_textRange.length;
  NSUInteger location = self->_textRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setTextRange:(_NSRange)a3
{
  self->_textRange = a3;
}

- (NSArray)emojiRangesInText
{
  return self->_emojiRangesInText;
}

- (void)setEmojiRangesInText:(id)a3
{
}

- (double)glyphLocationInWordX
{
  return self->_glyphLocationInWordX;
}

- (void)setGlyphLocationInWordX:(double)a3
{
  self->_glyphLocationInWordX = a3;
}

- (CALayer)wordLayer
{
  return self->_wordLayer;
}

- (void)setWordLayer:(id)a3
{
}

- (UIImage)beginImage
{
  return self->_beginImage;
}

- (void)setBeginImage:(id)a3
{
}

- (UIImage)endImage
{
  return self->_endImage;
}

- (void)setEndImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endImage, 0);
  objc_storeStrong((id *)&self->_beginImage, 0);
  objc_storeStrong((id *)&self->_wordLayer, 0);
  objc_storeStrong((id *)&self->_emojiRangesInText, 0);

  objc_storeStrong((id *)&self->_previous, 0);
}

@end