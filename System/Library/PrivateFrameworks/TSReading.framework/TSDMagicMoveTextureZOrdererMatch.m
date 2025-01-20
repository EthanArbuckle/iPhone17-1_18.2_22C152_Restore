@interface TSDMagicMoveTextureZOrdererMatch
- (BOOL)intersectsZOrdererMatch:(id)a3;
- (BOOL)intersectsZOrdererMatch:(id)a3 withAttemptedZIndex:(int64_t)a4;
- (BOOL)isIncomingZIndexUnmatched;
- (BOOL)isOutgoingZIndexUnmatched;
- (TSDMagicMoveAnimationMatch)animationMatch;
- (TSDMagicMoveTextureZOrdererMatch)init;
- (TSDMagicMoveTextureZOrdererMatch)initWithAnimationMatch:(id)a3;
- (TSDTextureSet)incomingTexture;
- (TSDTextureSet)outgoingTexture;
- (double)interpolatedZIndexAtPercent:(double)a3;
- (double)intersectionPercentWithZOrdererMatch:(id)a3;
- (id)description;
- (int64_t)incomingZIndex;
- (int64_t)outgoingZIndex;
- (void)dealloc;
- (void)setIncomingZIndex:(int64_t)a3;
- (void)setOutgoingZIndex:(int64_t)a3;
@end

@implementation TSDMagicMoveTextureZOrdererMatch

- (TSDMagicMoveTextureZOrdererMatch)init
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSDMagicMoveTextureZOrdererMatch init]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 994, @"Do not call method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[TSDMagicMoveTextureZOrdererMatch init]"), 0 reason userInfo]);
}

- (TSDMagicMoveTextureZOrdererMatch)initWithAnimationMatch:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)TSDMagicMoveTextureZOrdererMatch;
  v4 = [(TSDMagicMoveTextureZOrdererMatch *)&v12 init];
  v5 = v4;
  if (v4)
  {
    v4->_outgoingZIndex = -1;
    v4->_int64_t incomingZIndex = -1;
    uint64_t v6 = [a3 outgoingTexture];
    uint64_t v7 = [a3 incomingTexture];
    if (v6 | v7)
    {
      v5->_animationMatch = (TSDMagicMoveAnimationMatch *)a3;
      if (v6)
      {
        v5->_outgoingTexture = (TSDTextureSet *)v6;
        v5->_outgoingZIndex = [(id)v6 textureZOrder];
      }
      if (v7)
      {
        v5->_incomingTexture = (TSDTextureSet *)v7;
        v5->_int64_t incomingZIndex = [(id)v7 textureZOrder];
        if (!v6) {
          goto LABEL_10;
        }
        goto LABEL_11;
      }
    }
    else
    {
      v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v9 = [NSString stringWithUTF8String:"-[TSDMagicMoveTextureZOrdererMatch initWithAnimationMatch:]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 1005, @"incomingTexture and outgoingTexture are both nil!");
      v5->_animationMatch = (TSDMagicMoveAnimationMatch *)a3;
    }
    v5->_incomingTexture = (TSDTextureSet *)v6;
    if (!v6) {
LABEL_10:
    }
      v5->_outgoingTexture = (TSDTextureSet *)v7;
LABEL_11:
    int64_t incomingZIndex = v5->_incomingZIndex;
    v5->_isOutgoingZIndexUnmatched = v5->_outgoingZIndex == -1;
    v5->_isIncomingZIndexUnmatched = incomingZIndex == -1;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDMagicMoveTextureZOrdererMatch;
  [(TSDMagicMoveTextureZOrdererMatch *)&v3 dealloc];
}

- (BOOL)intersectsZOrdererMatch:(id)a3 withAttemptedZIndex:(int64_t)a4
{
  if ([a3 outgoingZIndex] == -1 || objc_msgSend(a3, "incomingZIndex") == -1) {
    return 0;
  }
  uint64_t v7 = [(TSDMagicMoveTextureZOrdererMatch *)self outgoingZIndex];
  int64_t v8 = 2 * a4 - 1;
  if (v7 >= 0) {
    uint64_t v9 = 2 * v7;
  }
  else {
    uint64_t v9 = v8;
  }
  uint64_t v10 = [(TSDMagicMoveTextureZOrdererMatch *)self incomingZIndex];
  if (v10 >= 0) {
    int64_t v8 = 2 * v10;
  }
  uint64_t v11 = [a3 outgoingZIndex];
  uint64_t v12 = [a3 incomingZIndex];
  uint64_t v13 = v8 > 2 * v12;
  if (v8 < 2 * v12) {
    uint64_t v13 = -1;
  }
  uint64_t v14 = v9 > 2 * v11;
  if (v9 < 2 * v11) {
    uint64_t v14 = -1;
  }
  BOOL v15 = v14 != v13 && v9 != 2 * v11;
  return v8 != 2 * v12 && v15;
}

- (BOOL)intersectsZOrdererMatch:(id)a3
{
  if ([(TSDMagicMoveTextureZOrdererMatch *)self outgoingZIndex] == -1
    || [(TSDMagicMoveTextureZOrdererMatch *)self incomingZIndex] == -1
    || [a3 outgoingZIndex] == -1
    || [a3 incomingZIndex] == -1)
  {
    return 0;
  }
  int64_t v5 = [(TSDMagicMoveTextureZOrdererMatch *)self outgoingZIndex];
  uint64_t v6 = [a3 outgoingZIndex];
  if (v5 < v6) {
    uint64_t v7 = -1;
  }
  else {
    uint64_t v7 = v5 > v6;
  }
  int64_t v8 = [(TSDMagicMoveTextureZOrdererMatch *)self incomingZIndex];
  uint64_t v9 = [a3 incomingZIndex];
  uint64_t v10 = v8 > v9;
  if (v8 < v9) {
    uint64_t v10 = -1;
  }
  return v7 != v10;
}

- (double)intersectionPercentWithZOrdererMatch:(id)a3
{
  int64_t v5 = [(TSDMagicMoveTextureZOrdererMatch *)self outgoingZIndex];
  uint64_t v6 = [a3 outgoingZIndex];
  if (v5 - v6 >= 0) {
    uint64_t v7 = v5 - v6;
  }
  else {
    uint64_t v7 = v6 - v5;
  }
  int64_t v8 = [(TSDMagicMoveTextureZOrdererMatch *)self incomingZIndex];
  uint64_t v9 = [a3 incomingZIndex];
  uint64_t v10 = v8 - v9;
  if (v8 - v9 < 0) {
    uint64_t v10 = v9 - v8;
  }
  return (double)v7 / (double)(v10 + v7);
}

- (double)interpolatedZIndexAtPercent:(double)a3
{
  TSUMix();
  return result;
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v3 = [(TSDMagicMoveTextureZOrdererMatch *)self outgoingTexture];
  if (!v3) {
    objc_super v3 = [(TSDMagicMoveTextureZOrdererMatch *)self incomingTexture];
  }
  v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int64_t v5 = [(TSDTextureSet *)v3 visibleTextures];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "addObject:", TSDStringFromTextureType(objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9++), "textureType")));
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  uint64_t v10 = [v4 componentsJoinedByString:@","];

  v12.receiver = self;
  v12.super_class = (Class)TSDMagicMoveTextureZOrdererMatch;
  return (id)[NSString stringWithFormat:@"%@: %d->%d (%@)", -[TSDMagicMoveTextureZOrdererMatch description](&v12, sel_description), -[TSDMagicMoveTextureZOrdererMatch outgoingZIndex](self, "outgoingZIndex"), -[TSDMagicMoveTextureZOrdererMatch incomingZIndex](self, "incomingZIndex"), v10];
}

- (TSDTextureSet)outgoingTexture
{
  return self->_outgoingTexture;
}

- (TSDTextureSet)incomingTexture
{
  return self->_incomingTexture;
}

- (int64_t)outgoingZIndex
{
  return self->_outgoingZIndex;
}

- (void)setOutgoingZIndex:(int64_t)a3
{
  self->_outgoingZIndex = a3;
}

- (int64_t)incomingZIndex
{
  return self->_incomingZIndex;
}

- (void)setIncomingZIndex:(int64_t)a3
{
  self->_int64_t incomingZIndex = a3;
}

- (BOOL)isOutgoingZIndexUnmatched
{
  return self->_isOutgoingZIndexUnmatched;
}

- (BOOL)isIncomingZIndexUnmatched
{
  return self->_isIncomingZIndexUnmatched;
}

- (TSDMagicMoveAnimationMatch)animationMatch
{
  return self->_animationMatch;
}

@end