@interface THModelDynamicAnchor
- ($DC674FFF4DF76ED3041042B2389D4EF7)p_anchorPointFromXPointer:(SEL)a3;
- (NSString)endElementId;
- (NSString)endPattern;
- (NSString)startElementId;
- (NSString)startPattern;
- (THModelDynamicAnchor)initWithContentNode:(id)a3 startElementId:(id)a4 startPattern:(id)a5 startOccurrence:(unint64_t)a6 startRange:(_NSRange)a7 endElementId:(id)a8 endPattern:(id)a9 endOccurrence:(unint64_t)a10 endRange:(_NSRange)a11;
- (THModelDynamicAnchor)initWithContentNode:(id)a3 startXPointer:(id)a4 endXPointer:(id)a5;
- (_NSRange)endRange;
- (_NSRange)startRange;
- (unint64_t)endOccurrence;
- (unint64_t)startOccurrence;
- (void)dealloc;
- (void)setEndElementId:(id)a3;
- (void)setEndOccurrence:(unint64_t)a3;
- (void)setEndPattern:(id)a3;
- (void)setEndRange:(_NSRange)a3;
- (void)setStartElementId:(id)a3;
- (void)setStartOccurrence:(unint64_t)a3;
- (void)setStartPattern:(id)a3;
- (void)setStartRange:(_NSRange)a3;
@end

@implementation THModelDynamicAnchor

- (THModelDynamicAnchor)initWithContentNode:(id)a3 startElementId:(id)a4 startPattern:(id)a5 startOccurrence:(unint64_t)a6 startRange:(_NSRange)a7 endElementId:(id)a8 endPattern:(id)a9 endOccurrence:(unint64_t)a10 endRange:(_NSRange)a11
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  v19.receiver = self;
  v19.super_class = (Class)THModelDynamicAnchor;
  v16 = [(THModelBoundAnchor *)&v19 initWithContentNode:a3];
  v17 = v16;
  if (v16)
  {
    [(THModelDynamicAnchor *)v16 setStartElementId:a4];
    [(THModelDynamicAnchor *)v17 setStartPattern:a5];
    [(THModelDynamicAnchor *)v17 setStartOccurrence:a6];
    -[THModelDynamicAnchor setStartRange:](v17, "setStartRange:", location, length);
    [(THModelDynamicAnchor *)v17 setEndElementId:a8];
    [(THModelDynamicAnchor *)v17 setEndPattern:a9];
    [(THModelDynamicAnchor *)v17 setEndOccurrence:a10];
    -[THModelDynamicAnchor setEndRange:](v17, "setEndRange:", a11.location, a11.length);
  }
  return v17;
}

- (THModelDynamicAnchor)initWithContentNode:(id)a3 startXPointer:(id)a4 endXPointer:(id)a5
{
  if (!self) {
    return -[THModelDynamicAnchor initWithContentNode:startElementId:startPattern:startOccurrence:startRange:endElementId:endPattern:endOccurrence:endRange:](self, "initWithContentNode:startElementId:startPattern:startOccurrence:startRange:endElementId:endPattern:endOccurrence:endRange:", a3, (unsigned __int128)0, 0, (unsigned __int128)0, 0, 0, 0);
  }
  [(THModelDynamicAnchor *)self p_anchorPointFromXPointer:a4];
  [(THModelDynamicAnchor *)self p_anchorPointFromXPointer:a5];
  return -[THModelDynamicAnchor initWithContentNode:startElementId:startPattern:startOccurrence:startRange:endElementId:endPattern:endOccurrence:endRange:](self, "initWithContentNode:startElementId:startPattern:startOccurrence:startRange:endElementId:endPattern:endOccurrence:endRange:", a3, (unsigned __int128)0, 0, (unsigned __int128)0, 0, 0, 0);
}

- (void)dealloc
{
  [(THModelDynamicAnchor *)self setEndPattern:0];
  [(THModelDynamicAnchor *)self setEndElementId:0];
  [(THModelDynamicAnchor *)self setStartPattern:0];
  [(THModelDynamicAnchor *)self setStartElementId:0];
  v3.receiver = self;
  v3.super_class = (Class)THModelDynamicAnchor;
  [(THModelBoundAnchor *)&v3 dealloc];
}

- ($DC674FFF4DF76ED3041042B2389D4EF7)p_anchorPointFromXPointer:(SEL)a3
{
  retstr->var0 = &stru_46D7E8;
  retstr->var1 = &stru_46D7E8;
  *(_OWORD *)&retstr->var2 = xmmword_344050;
  retstr->var3.NSUInteger length = 0;
  id v5 = [[a4 substringWithRange:9, [a4 length] - 10] componentsSeparatedByString:@","];
  result = ($DC674FFF4DF76ED3041042B2389D4EF7 *)[v5 count];
  if (result == ($DC674FFF4DF76ED3041042B2389D4EF7 *)((char *)&dword_4 + 1))
  {
    retstr->var0 = [v5 objectAtIndex:0];
    retstr->var1 = [v5 objectAtIndex:1];
    retstr->var2 = [(unint64_t)[v5 objectAtIndex:2] integerValue];
    retstr->var3.NSUInteger location = (NSUInteger)objc_msgSend(objc_msgSend(v5, "objectAtIndex:", 3), "integerValue");
    result = [v5[4] integerValue];
    retstr->var3.NSUInteger length = (NSUInteger)result;
  }
  return result;
}

- (NSString)startElementId
{
  return self->mStartElementId;
}

- (void)setStartElementId:(id)a3
{
}

- (NSString)startPattern
{
  return self->mStartPattern;
}

- (void)setStartPattern:(id)a3
{
}

- (unint64_t)startOccurrence
{
  return self->mStartOccurrence;
}

- (void)setStartOccurrence:(unint64_t)a3
{
  self->mStartOccurrence = a3;
}

- (_NSRange)startRange
{
  p_mStartRange = &self->mStartRange;
  NSUInteger location = self->mStartRange.location;
  NSUInteger length = p_mStartRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setStartRange:(_NSRange)a3
{
  self->mStartRange = a3;
}

- (NSString)endElementId
{
  return self->mEndElementId;
}

- (void)setEndElementId:(id)a3
{
}

- (NSString)endPattern
{
  return self->mEndPattern;
}

- (void)setEndPattern:(id)a3
{
}

- (unint64_t)endOccurrence
{
  return self->mEndOccurrence;
}

- (void)setEndOccurrence:(unint64_t)a3
{
  self->mEndOccurrence = a3;
}

- (_NSRange)endRange
{
  p_mEndRange = &self->mEndRange;
  NSUInteger location = self->mEndRange.location;
  NSUInteger length = p_mEndRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setEndRange:(_NSRange)a3
{
  self->mEndRange = a3;
}

@end