@interface PhotosSearchBar.TextView
- (CGRect)layoutManager:(id)a3 boundingBoxForControlGlyphAtIndex:(int64_t)a4 forTextContainer:(id)a5 proposedLineFragment:(CGRect)a6 glyphPosition:(CGPoint)a7 characterIndex:(int64_t)a8;
- (_TtCV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C85238TextView)initWithCoder:(id)a3;
- (_TtCV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C85238TextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (int64_t)layoutManager:(id)a3 shouldGenerateGlyphs:(const unsigned __int16 *)a4 properties:(const int64_t *)a5 characterIndexes:(const int64_t *)a6 font:(id)a7 forGlyphRange:(_NSRange)a8;
- (int64_t)layoutManager:(id)a3 shouldUseAction:(int64_t)a4 forControlCharacterAtIndex:(int64_t)a5;
- (void)invalidateTextStorageAttributes;
- (void)textStorage:(id)a3 willProcessEditing:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6;
@end

@implementation PhotosSearchBar.TextView

- (_TtCV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C85238TextView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_259B7D2A0();
}

- (void)invalidateTextStorageAttributes
{
  v2 = self;
  sub_259B7CF68();
}

- (_TtCV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C85238TextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4 = a4;
  sub_259B7D658();
}

- (void)textStorage:(id)a3 willProcessEditing:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  char v8 = a4;
  id v10 = a3;
  v11 = self;
  sub_259B7FE6C((uint64_t)v10, v8, location, length);
}

- (int64_t)layoutManager:(id)a3 shouldGenerateGlyphs:(const unsigned __int16 *)a4 properties:(const int64_t *)a5 characterIndexes:(const int64_t *)a6 font:(id)a7 forGlyphRange:(_NSRange)a8
{
  id v13 = a3;
  id v14 = a7;
  v15 = self;
  int64_t v16 = sub_259B80A04(v13, (char *)a4, (uint64_t)a5, (uint64_t *)a6, (uint64_t)v14, a8.location, a8.length);

  return v16;
}

- (int64_t)layoutManager:(id)a3 shouldUseAction:(int64_t)a4 forControlCharacterAtIndex:(int64_t)a5
{
  return sub_259B81160((uint64_t)a3, a4);
}

- (CGRect)layoutManager:(id)a3 boundingBoxForControlGlyphAtIndex:(int64_t)a4 forTextContainer:(id)a5 proposedLineFragment:(CGRect)a6 glyphPosition:(CGPoint)a7 characterIndex:(int64_t)a8
{
  sub_259B811A0();
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

@end