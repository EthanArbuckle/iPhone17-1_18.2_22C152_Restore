@interface UITextSelectionRectImpl
+ (id)rectWithWebRect:(id)a3;
+ (id)rectsWithWebRects:(id)a3;
- (BOOL)containsEnd;
- (BOOL)containsStart;
- (BOOL)isVertical;
- (CGRect)rect;
- (UITextSelectionRectImpl)initWithWebRect:(id)a3;
- (WebSelectionRect)webRect;
- (id)range;
- (int64_t)writingDirection;
- (void)setWebRect:(id)a3;
@end

@implementation UITextSelectionRectImpl

- (UITextSelectionRectImpl)initWithWebRect:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UITextSelectionRectImpl;
  v5 = [(UITextSelectionRectImpl *)&v8 init];
  v6 = v5;
  if (v5) {
    [(UITextSelectionRectImpl *)v5 setWebRect:v4];
  }

  return v6;
}

+ (id)rectWithWebRect:(id)a3
{
  id v3 = a3;
  id v4 = [[UITextSelectionRectImpl alloc] initWithWebRect:v3];

  return v4;
}

+ (id)rectsWithWebRects:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = +[UITextSelectionRectImpl rectWithWebRect:](UITextSelectionRectImpl, "rectWithWebRect:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (CGRect)rect
{
  v2 = [(UITextSelectionRectImpl *)self webRect];
  [v2 rect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (int64_t)writingDirection
{
  v2 = [(UITextSelectionRectImpl *)self webRect];
  int64_t v3 = (int)[v2 writingDirection];

  return v3;
}

- (id)range
{
  return 0;
}

- (BOOL)containsStart
{
  v2 = [(UITextSelectionRectImpl *)self webRect];
  char v3 = [v2 containsStart];

  return v3;
}

- (BOOL)containsEnd
{
  v2 = [(UITextSelectionRectImpl *)self webRect];
  char v3 = [v2 containsEnd];

  return v3;
}

- (BOOL)isVertical
{
  v2 = [(UITextSelectionRectImpl *)self webRect];
  char v3 = [v2 isHorizontal] ^ 1;

  return v3;
}

- (WebSelectionRect)webRect
{
  return self->webRect;
}

- (void)setWebRect:(id)a3
{
}

- (void).cxx_destruct
{
}

@end