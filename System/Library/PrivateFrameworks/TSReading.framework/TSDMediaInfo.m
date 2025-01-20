@interface TSDMediaInfo
- (BOOL)isPlaceholder;
- (BOOL)wasMediaReplaced;
- (CGPoint)centerForReplacingWithNewMedia;
- (CGSize)defaultOriginalSize;
- (CGSize)originalSize;
- (CGSize)rawDataSize;
- (NSString)mediaDisplayName;
- (NSString)mediaFileType;
- (TSDMediaInfo)initWithContext:(id)a3 geometry:(id)a4;
- (id)copyWithContext:(id)a3;
- (unsigned)flags;
- (void)setFlags:(unsigned int)a3;
- (void)setGeometry:(id)a3;
- (void)setIsPlaceholder:(BOOL)a3;
- (void)setOriginalSize:(CGSize)a3;
- (void)setWasMediaReplaced:(BOOL)a3;
- (void)takePropertiesFromReplacedMediaInfo:(id)a3;
- (void)updateGeometryToReplaceMediaInfo:(id)a3;
@end

@implementation TSDMediaInfo

- (TSDMediaInfo)initWithContext:(id)a3 geometry:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSDMediaInfo;
  v4 = [(TSDDrawableInfo *)&v7 initWithContext:a3 geometry:a4];
  v5 = v4;
  if (v4)
  {
    v4->super.super.mAspectRatioLocked = 1;
    [(TSDMediaInfo *)v4 defaultOriginalSize];
    -[TSDMediaInfo setOriginalSize:](v5, "setOriginalSize:");
  }
  return v5;
}

- (id)copyWithContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSDMediaInfo;
  id result = [(TSDDrawableInfo *)&v5 copyWithContext:a3];
  if (result)
  {
    *((_OWORD *)result + 9) = self->mOriginalSize;
    *((_DWORD *)result + 40) = self->mFlags;
  }
  return result;
}

- (void)setOriginalSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  p_mOriginalSize = &self->mOriginalSize;
  if (self->mOriginalSize.width != a3.width || self->mOriginalSize.height != a3.height)
  {
    [(TSPObject *)self willModify];
    p_mOriginalSize->CGFloat width = width;
    p_mOriginalSize->CGFloat height = height;
  }
}

- (CGSize)defaultOriginalSize
{
  v2 = [(TSDDrawableInfo *)self geometry];

  [(TSDInfoGeometry *)v2 size];
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (unsigned)flags
{
  return *(unsigned char *)&self->mFlags & 3;
}

- (void)setFlags:(unsigned int)a3
{
  char v3 = a3;
  [(TSDDrawableInfo *)self willChangeProperty:527];
  [(TSPObject *)self willModify];
  *(unsigned char *)&self->mFlags = *(unsigned char *)&self->mFlags & 0xFC | v3 & 3;
}

- (BOOL)isPlaceholder
{
  return *(unsigned char *)&self->mFlags & 1;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  *(unsigned char *)&self->mFlags = *(unsigned char *)&self->mFlags & 0xFE | a3;
}

- (BOOL)wasMediaReplaced
{
  return (*(unsigned char *)&self->mFlags >> 1) & 1;
}

- (void)setWasMediaReplaced:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->mFlags = *(unsigned char *)&self->mFlags & 0xFD | v3;
}

- (void)setGeometry:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSDMediaInfo;
  -[TSDDrawableInfo setGeometry:](&v5, sel_setGeometry_);
  [a3 size];
  -[TSDMediaInfo setOriginalSize:](self, "setOriginalSize:");
}

- (NSString)mediaDisplayName
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSDMediaInfo mediaDisplayName]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMediaInfo.m"), 112, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSDMediaInfo mediaDisplayName]"), 0 reason userInfo]);
}

- (NSString)mediaFileType
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSDMediaInfo mediaFileType]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMediaInfo.m"), 119, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSDMediaInfo mediaFileType]"), 0 reason userInfo]);
}

- (CGSize)rawDataSize
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSDMediaInfo rawDataSize]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMediaInfo.m"), 125, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSDMediaInfo rawDataSize]"), 0 reason userInfo]);
}

- (void)takePropertiesFromReplacedMediaInfo:(id)a3
{
  -[TSDMediaInfo updateGeometryToReplaceMediaInfo:](self, "updateGeometryToReplaceMediaInfo:");
  [a3 originalSize];
  -[TSDMediaInfo setOriginalSize:](self, "setOriginalSize:");
  -[TSDMediaInfo setIsPlaceholder:](self, "setIsPlaceholder:", [a3 isPlaceholder]);
  [(TSDMediaInfo *)self setWasMediaReplaced:1];
  -[TSDStyledInfo setStyle:](self, "setStyle:", [a3 style]);
  if ([(TSDDrawableInfo *)self supportsAttachedComments]) {
    -[TSDDrawableInfo setComment:](self, "setComment:", [a3 comment]);
  }
  -[TSDDrawableInfo setExteriorTextWrap:](self, "setExteriorTextWrap:", [a3 exteriorTextWrap]);
  -[TSDDrawableInfo setAspectRatioLocked:](self, "setAspectRatioLocked:", [a3 aspectRatioLocked]);
  uint64_t v5 = [a3 hyperlinkURL];

  [(TSDDrawableInfo *)self setHyperlinkURL:v5];
}

- (void)updateGeometryToReplaceMediaInfo:(id)a3
{
  id v17 = (id)objc_msgSend((id)objc_msgSend(a3, "geometry"), "mutableCopy");
  [a3 centerForReplacingWithNewMedia];
  double v6 = v5;
  double v8 = v7;
  [(TSDInfoGeometry *)[(TSDDrawableInfo *)self geometry] size];
  double v10 = v9;
  double v12 = v11;
  [a3 originalSize];
  if (TSDShrinkSizeToFitInSize(v10, v12, v13, v14) == *MEMORY[0x263F001B0]
    && v15 == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    [(TSDInfoGeometry *)[(TSDDrawableInfo *)self geometry] size];
  }
  objc_msgSend(v17, "setSize:");
  objc_msgSend(v17, "setCenter:", v6, v8);
  [(TSDMediaInfo *)self setGeometry:v17];
}

- (CGPoint)centerForReplacingWithNewMedia
{
  v2 = [(TSDDrawableInfo *)self geometry];

  [(TSDInfoGeometry *)v2 center];
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGSize)originalSize
{
  double width = self->mOriginalSize.width;
  double height = self->mOriginalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end