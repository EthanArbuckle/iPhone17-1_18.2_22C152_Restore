@interface _UITextKitTextRange
+ (id)rangeWithRange:(_NSRange)a3;
+ (id)rangeWithRange:(_NSRange)a3 affinity:(int64_t)a4;
+ (id)rangeWithStart:(id)a3 end:(id)a4;
+ (id)rangeWithTextContentManager:(id)a3 textRanges:(id)a4 affinity:(int64_t)a5;
+ (id)rangeWithTextContentManager:(id)a3 textRanges:(id)a4 startAffinity:(int64_t)a5 endAffinity:(int64_t)a6;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSArray)textKit2Ranges;
- (NSTextRange)unionTextRange;
- (_NSRange)asRange;
- (_UITextKitTextPosition)end;
- (_UITextKitTextPosition)start;
- (_UITextKitTextRange)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setEnd:(id)a3;
- (void)setStart:(id)a3;
- (void)setTextKit2Ranges:(id)a3;
@end

@implementation _UITextKitTextRange

- (_UITextKitTextPosition)start
{
  return self->_start;
}

- (_UITextKitTextPosition)end
{
  return self->_end;
}

+ (id)rangeWithTextContentManager:(id)a3 textRanges:(id)a4 startAffinity:(int64_t)a5 endAffinity:(int64_t)a6
{
  id v10 = a4;
  id v11 = a3;
  v12 = [v10 firstObject];
  v13 = [v10 lastObject];
  v14 = [v12 location];
  v15 = +[_UITextKitTextPosition positionWithTextContentManager:v11 location:v14 affinity:a5];

  v16 = [v13 endLocation];
  v17 = +[_UITextKitTextPosition positionWithTextContentManager:v11 location:v16 affinity:a6];

  v18 = [a1 rangeWithStart:v15 end:v17];
  v19 = (void *)v18[4];
  v18[4] = v10;

  return v18;
}

+ (id)rangeWithStart:(id)a3 end:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(_UITextKitTextRange);
  uint64_t v8 = [v5 offset];
  uint64_t v9 = [v6 offset];
  if (v8 >= v9) {
    id v10 = v6;
  }
  else {
    id v10 = v5;
  }
  if (v8 >= v9) {
    id v11 = v5;
  }
  else {
    id v11 = v6;
  }
  [(_UITextKitTextRange *)v7 setStart:v10];
  [(_UITextKitTextRange *)v7 setEnd:v11];

  return v7;
}

- (void)setStart:(id)a3
{
}

- (void)setEnd:(id)a3
{
}

- (_UITextKitTextRange)init
{
  v7.receiver = self;
  v7.super_class = (Class)_UITextKitTextRange;
  v2 = [(_UITextKitTextRange *)&v7 init];
  v3 = v2;
  if (v2)
  {
    start = v2->_start;
    v2->_start = 0;

    end = v3->_end;
    v3->_end = 0;
  }
  return v3;
}

- (NSTextRange)unionTextRange
{
  unionTextRange = self->_unionTextRange;
  if (!unionTextRange)
  {
    textKit2Ranges = self->_textKit2Ranges;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __37___UITextKitTextRange_unionTextRange__block_invoke;
    v6[3] = &unk_1E52EF558;
    v6[4] = self;
    [(NSArray *)textKit2Ranges enumerateObjectsUsingBlock:v6];
    unionTextRange = self->_unionTextRange;
  }
  return unionTextRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unionTextRange, 0);
  objc_storeStrong((id *)&self->_textKit2Ranges, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

+ (id)rangeWithTextContentManager:(id)a3 textRanges:(id)a4 affinity:(int64_t)a5
{
  return (id)[a1 rangeWithTextContentManager:a3 textRanges:a4 startAffinity:a5 endAffinity:a5];
}

- (BOOL)isEmpty
{
  int64_t v3 = [(_UITextKitTextPosition *)self->_start offset];
  return v3 == [(_UITextKitTextPosition *)self->_end offset];
}

- (NSArray)textKit2Ranges
{
  return self->_textKit2Ranges;
}

+ (id)rangeWithRange:(_NSRange)a3 affinity:(int64_t)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v8 = +[_UITextKitTextPosition positionWithOffset:a3.location affinity:a4];
  uint64_t v9 = +[_UITextKitTextPosition positionWithOffset:location + length affinity:a4];
  id v10 = [a1 rangeWithStart:v8 end:v9];

  return v10;
}

+ (id)rangeWithRange:(_NSRange)a3
{
  return (id)objc_msgSend(a1, "rangeWithRange:affinity:", a3.location, a3.length, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[_UITextKitTextPosition positionWithOffset:[(_UITextKitTextPosition *)self->_start offset]];
  id v5 = +[_UITextKitTextPosition positionWithOffset:[(_UITextKitTextPosition *)self->_end offset]];
  id v6 = +[_UITextKitTextRange rangeWithStart:v4 end:v5];

  uint64_t v7 = [(NSArray *)self->_textKit2Ranges copy];
  uint64_t v8 = (void *)v6[4];
  v6[4] = v7;

  return v6;
}

- (_NSRange)asRange
{
  int64_t v3 = [(_UITextKitTextPosition *)self->_start offset];
  int64_t v4 = [(_UITextKitTextPosition *)self->_end offset];
  NSUInteger v5 = v4 - [(_UITextKitTextPosition *)self->_start offset];
  NSUInteger v6 = v3;
  result.NSUInteger length = v5;
  result.NSUInteger location = v6;
  return result;
}

- (unint64_t)hash
{
  int64_t v3 = [(_UITextKitTextPosition *)self->_start offset];
  int64_t v4 = [(_UITextKitTextPosition *)self->_end offset] + v3;
  return [(NSArray *)self->_textKit2Ranges count] ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(UITextRange *)self _attachmentRange];
  if (v5)
  {
  }
  else
  {
    NSUInteger v6 = [v4 _attachmentRange];

    if (!v6)
    {
      int v10 = 0;
      if (v4) {
        goto LABEL_5;
      }
LABEL_12:
      char v15 = 0;
      goto LABEL_17;
    }
  }
  uint64_t v7 = [(UITextRange *)self _attachmentRange];
  uint64_t v8 = [v4 _attachmentRange];
  int v9 = [v7 isEqual:v8];

  int v10 = v9 ^ 1;
  if (!v4) {
    goto LABEL_12;
  }
LABEL_5:
  id v11 = [(_UITextKitTextRange *)self start];
  v12 = [v4 start];
  if ([v11 isEqual:v12])
  {
    v13 = [(_UITextKitTextRange *)self end];
    v14 = [v4 end];
    if (([v13 isEqual:v14] ^ 1 | v10))
    {
      char v15 = 0;
    }
    else
    {
      v16 = [(_UITextKitTextRange *)self textKit2Ranges];
      uint64_t v17 = [v16 count];
      v18 = [v4 textKit2Ranges];
      if (v17 == [v18 count])
      {
        char v15 = 1;
      }
      else
      {
        v19 = [(_UITextKitTextRange *)self textKit2Ranges];
        v20 = [v4 textKit2Ranges];
        char v15 = [v19 isEqualToArray:v20];
      }
    }
  }
  else
  {
    char v15 = 0;
  }

LABEL_17:
  return v15;
}

- (id)description
{
  int64_t v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)_UITextKitTextRange;
  id v4 = [(_UITextKitTextRange *)&v11 description];
  int64_t v5 = [(_UITextKitTextPosition *)self->_start offset];
  int64_t v6 = [(_UITextKitTextPosition *)self->_end offset];
  int64_t v7 = v6 - [(_UITextKitTextPosition *)self->_start offset];
  uint64_t v8 = [(_UITextKitTextRange *)self textKit2Ranges];
  int v9 = [v3 stringWithFormat:@"%@ (%li, %li) %lu textKit2 ranges", v4, v5, v7, objc_msgSend(v8, "count")];

  return v9;
}

- (void)setTextKit2Ranges:(id)a3
{
}

@end