@interface TSDInstantAlphaBinaryBitmap
- (TSDInstantAlphaBinaryBitmap)initWithWidth:(int64_t)a3 height:(int64_t)a4;
- (void)dealloc;
- (void)unionWithBitmap:(id)a3;
@end

@implementation TSDInstantAlphaBinaryBitmap

- (TSDInstantAlphaBinaryBitmap)initWithWidth:(int64_t)a3 height:(int64_t)a4
{
  if (a3 < 1 || a4 <= 0)
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDInstantAlphaBinaryBitmap initWithWidth:height:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInstantAlphaBinaryBitmap.m"), 19, @"Invalid parameter not satisfying: %s", "width > 0 && height > 0");
  }
  v14.receiver = self;
  v14.super_class = (Class)TSDInstantAlphaBinaryBitmap;
  v9 = [(TSDInstantAlphaBinaryBitmap *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->mWidth = a3;
    v9->mHeight = a4;
    size_t AlignedBytesPerRow = TSUBitmapGetAlignedBytesPerRow();
    v10->mRowBytes = AlignedBytesPerRow;
    v12 = (char *)malloc_type_calloc(v10->mHeight, AlignedBytesPerRow, 0x6DB49538uLL);
    v10->mData = v12;
    if (!v12)
    {

      return 0;
    }
  }
  return v10;
}

- (void)dealloc
{
  mData = self->mData;
  if (mData) {
    free(mData);
  }
  v4.receiver = self;
  v4.super_class = (Class)TSDInstantAlphaBinaryBitmap;
  [(TSDInstantAlphaBinaryBitmap *)&v4 dealloc];
}

- (void)unionWithBitmap:(id)a3
{
  if (self->mWidth == *((void *)a3 + 1) && (int64_t mHeight = self->mHeight, mHeight == *((void *)a3 + 2)))
  {
    if (mHeight >= 1)
    {
      int64_t v4 = 0;
      uint64_t v5 = *((void *)a3 + 4);
      int64_t mRowBytes = self->mRowBytes;
      mData = self->mData;
      do
      {
        if (mRowBytes >= 1)
        {
          for (int64_t i = 0; i < mRowBytes; ++i)
          {
            mData[i] |= *(unsigned char *)(v5 + i);
            int64_t mRowBytes = self->mRowBytes;
          }
          int64_t mHeight = self->mHeight;
        }
        ++v4;
        mData += mRowBytes;
        v5 += *((void *)a3 + 3);
      }
      while (mHeight > v4);
    }
  }
  else
  {
    v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSDInstantAlphaBinaryBitmap unionWithBitmap:]"];
    uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInstantAlphaBinaryBitmap.m"];
    [v9 handleFailureInFunction:v10 file:v11 lineNumber:50 description:@"unionWithBitmap: sizes do not match"];
  }
}

@end