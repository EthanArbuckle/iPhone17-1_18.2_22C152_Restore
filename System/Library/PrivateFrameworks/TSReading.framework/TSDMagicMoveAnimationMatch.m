@interface TSDMagicMoveAnimationMatch
+ (unint64_t)magicMoveMorphTexturesPerSecond;
- (BOOL)isMatched;
- (BOOL)isMorphMatch;
- (BOOL)isTextStyleIdenticalExceptSize;
- (BOOL)shouldDisableTextMorphing;
- (BOOL)shouldTearDownTextures;
- (NSDictionary)outgoingTextureActionBuildFinalAttributes;
- (TSDMagicMoveAnimationMatch)init;
- (TSDMagicMoveAnimationMatch)initWithMatchType:(int64_t)a3 outgoingTexture:(id)a4 incomingTexture:(id)a5;
- (TSDTextureSet)incomingTexture;
- (TSDTextureSet)outgoingTexture;
- (id)description;
- (id)lockCurrentMorphTexture;
- (int64_t)matchType;
- (void)addMorphTexture:(id)a3;
- (void)clearMorphTexture;
- (void)dealloc;
- (void)setIncomingTexture:(id)a3;
- (void)setIsMorphMatch:(BOOL)a3;
- (void)setIsTextStyleIdenticalExceptSize:(BOOL)a3;
- (void)setMatchType:(int64_t)a3;
- (void)setOutgoingTexture:(id)a3;
- (void)setOutgoingTextureActionBuildFinalAttributes:(id)a3;
- (void)setShouldDisableTextMorphing:(BOOL)a3;
- (void)setShouldTearDownTextures:(BOOL)a3;
- (void)teardown;
- (void)unlockCurrentMorphTexture;
@end

@implementation TSDMagicMoveAnimationMatch

+ (unint64_t)magicMoveMorphTexturesPerSecond
{
  return 15;
}

- (TSDMagicMoveAnimationMatch)init
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSDMagicMoveAnimationMatch init]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 392, @"Do not call method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[TSDMagicMoveAnimationMatch init]"), 0 reason userInfo]);
}

- (TSDMagicMoveAnimationMatch)initWithMatchType:(int64_t)a3 outgoingTexture:(id)a4 incomingTexture:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)TSDMagicMoveAnimationMatch;
  v8 = [(TSDMagicMoveAnimationMatch *)&v10 init];
  if (v8)
  {
    v8->_morphTextureUpdateLock = (NSLock *)objc_opt_new();
    [(TSDMagicMoveAnimationMatch *)v8 setMatchType:a3];
    [(TSDMagicMoveAnimationMatch *)v8 setOutgoingTexture:a4];
    [(TSDMagicMoveAnimationMatch *)v8 setIncomingTexture:a5];
  }
  return v8;
}

- (void)dealloc
{
  if (!self->_hasBeenTornDown) {
    [(TSDMagicMoveAnimationMatch *)self teardown];
  }

  incomingTexture = self->_incomingTexture;
  if (incomingTexture)
  {
    v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSDMagicMoveAnimationMatch dealloc]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 416, @"expected nil value for '%s'", "_incomingTexture");
    incomingTexture = self->_incomingTexture;
  }

  outgoingTexture = self->_outgoingTexture;
  if (outgoingTexture)
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDMagicMoveAnimationMatch dealloc]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 418, @"expected nil value for '%s'", "_outgoingTexture");
    outgoingTexture = self->_outgoingTexture;
  }

  v9.receiver = self;
  v9.super_class = (Class)TSDMagicMoveAnimationMatch;
  [(TSDMagicMoveAnimationMatch *)&v9 dealloc];
}

- (void)teardown
{
  if (!self->_hasBeenTornDown)
  {
    if (self->_isMorphMatch || [(TSDMagicMoveAnimationMatch *)self shouldTearDownTextures])
    {
      [(TSDTextureSet *)self->_outgoingTexture releaseSingleTextures];
      [(TSDTextureSet *)self->_outgoingTexture teardown];

      self->_outgoingTexture = 0;
      [(TSDTextureSet *)self->_incomingTexture releaseSingleTextures];
      [(TSDTextureSet *)self->_incomingTexture teardown];
    }
    else
    {

      self->_outgoingTexture = 0;
    }

    self->_incomingTexture = 0;
    [(TSDTextureSet *)self->_morphTexture releaseSingleTextures];
    [(TSDTextureSet *)self->_morphTexture teardown];

    self->_morphTexture = 0;
    [(TSDTextureSet *)self->_morphQueuedTexture releaseSingleTextures];
    [(TSDTextureSet *)self->_morphQueuedTexture teardown];

    self->_morphQueuedTexture = 0;
    [(TSDTextureSet *)self->_morphQueuedForDeletionTexture releaseSingleTextures];
    [(TSDTextureSet *)self->_morphQueuedForDeletionTexture teardown];

    self->_morphQueuedForDeletionTexture = 0;
    self->_hasBeenTornDown = 1;
  }
}

- (id)description
{
  uint64_t v3 = (void *)[MEMORY[0x263EFF980] array];
  if ([(TSDMagicMoveAnimationMatch *)self isMorphMatch]) {
    [v3 addObject:@"isMorphMatch"];
  }
  if ([(TSDMagicMoveAnimationMatch *)self isMatched]) {
    [v3 addObject:@"isMatched"];
  }
  if ([(TSDMagicMoveAnimationMatch *)self incomingTexture]) {
    [v3 addObject:objc_msgSend(NSString, "stringWithFormat:", @"incoming:%@", -[TSDMagicMoveAnimationMatch incomingTexture](self, "incomingTexture"))];
  }
  if ([(TSDMagicMoveAnimationMatch *)self outgoingTexture]) {
    [v3 addObject:objc_msgSend(NSString, "stringWithFormat:", @"outgoing:%@", -[TSDMagicMoveAnimationMatch outgoingTexture](self, "outgoingTexture"))];
  }
  uint64_t v4 = [v3 componentsJoinedByString:@", "];
  v6.receiver = self;
  v6.super_class = (Class)TSDMagicMoveAnimationMatch;
  return (id)[NSString stringWithFormat:@"%@: {%@}", -[TSDMagicMoveAnimationMatch description](&v6, sel_description), v4];
}

- (BOOL)isMatched
{
  uint64_t v3 = [(TSDMagicMoveAnimationMatch *)self incomingTexture];
  if (v3) {
    LOBYTE(v3) = [(TSDMagicMoveAnimationMatch *)self outgoingTexture] != 0;
  }
  return (char)v3;
}

- (void)addMorphTexture:(id)a3
{
  morphTextureUpdateLock = self->_morphTextureUpdateLock;
  objc_sync_enter(morphTextureUpdateLock);
  morphQueuedTexture = self->_morphQueuedTexture;
  if (*(_WORD *)&self->_isUsingMorphTexture)
  {
    morphTexture = 0;
    self->_morphQueuedTexture = (TSDTextureSet *)a3;
  }
  else
  {
    morphTexture = self->_morphTexture;
    self->_morphTexture = (TSDTextureSet *)a3;
    self->_didUseMorphTexture = 0;
  }
  objc_sync_exit(morphTextureUpdateLock);
  [(TSDTextureSet *)morphTexture releaseSingleTextures];
  [(TSDTextureSet *)morphTexture teardown];

  [(TSDTextureSet *)morphQueuedTexture releaseSingleTextures];
  [(TSDTextureSet *)morphQueuedTexture teardown];
}

- (void)clearMorphTexture
{
  morphTextureUpdateLock = self->_morphTextureUpdateLock;
  objc_sync_enter(morphTextureUpdateLock);
  morphTexture = self->_morphTexture;
  morphQueuedTexture = self->_morphQueuedTexture;
  *(_WORD *)&self->_isUsingMorphTexture = 0;
  self->_morphTexture = 0;
  self->_morphQueuedTexture = 0;
  objc_sync_exit(morphTextureUpdateLock);
  [(TSDTextureSet *)morphTexture releaseSingleTextures];
  [(TSDTextureSet *)morphTexture teardown];

  [(TSDTextureSet *)morphQueuedTexture releaseSingleTextures];
  [(TSDTextureSet *)morphQueuedTexture teardown];
}

- (id)lockCurrentMorphTexture
{
  if (![(TSDMagicMoveAnimationMatch *)self isMorphMatch])
  {
    uint64_t v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDMagicMoveAnimationMatch lockCurrentMorphTexture]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 522, @"Not a morph animation!");
  }
  morphTextureUpdateLock = self->_morphTextureUpdateLock;
  objc_sync_enter(morphTextureUpdateLock);
  if (self->_isUsingMorphTexture)
  {
    objc_super v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSDMagicMoveAnimationMatch lockCurrentMorphTexture]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 529, @"Morph texture is already locked!");
    morphQueuedTexture = 0;
  }
  else
  {
    if (self->_morphQueuedForDeletionTexture) {
      self->_morphQueuedForDeletionTexture = 0;
    }
    morphTexture = self->_morphTexture;
    morphQueuedTexture = self->_morphQueuedTexture;
    if (morphQueuedTexture)
    {
      self->_morphQueuedTexture = 0;
      self->_morphQueuedForDeletionTexture = morphTexture;
      morphTexture = morphQueuedTexture;
      self->_morphTexture = morphQueuedTexture;
    }
    else
    {
      morphQueuedTexture = self->_morphTexture;
      if (!morphTexture) {
        morphQueuedTexture = self->_outgoingTexture;
      }
    }
    self->_isUsingMorphTexture = 1;
    self->_didUseMorphTexture = morphTexture != 0;
  }
  objc_sync_exit(morphTextureUpdateLock);
  return morphQueuedTexture;
}

- (void)unlockCurrentMorphTexture
{
  morphTextureUpdateLock = self->_morphTextureUpdateLock;
  objc_sync_enter(morphTextureUpdateLock);
  if (!self->_isUsingMorphTexture)
  {
    uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSDMagicMoveAnimationMatch unlockCurrentMorphTexture]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 554, @"Tried to unlock morph texture when not locked!");
  }
  self->_isUsingMorphTexture = 0;

  objc_sync_exit(morphTextureUpdateLock);
}

- (TSDTextureSet)outgoingTexture
{
  return self->_outgoingTexture;
}

- (void)setOutgoingTexture:(id)a3
{
}

- (TSDTextureSet)incomingTexture
{
  return self->_incomingTexture;
}

- (void)setIncomingTexture:(id)a3
{
}

- (BOOL)isMorphMatch
{
  return self->_isMorphMatch;
}

- (void)setIsMorphMatch:(BOOL)a3
{
  self->_isMorphMatch = a3;
}

- (BOOL)isTextStyleIdenticalExceptSize
{
  return self->_isTextStyleIdenticalExceptSize;
}

- (void)setIsTextStyleIdenticalExceptSize:(BOOL)a3
{
  self->_isTextStyleIdenticalExceptSize = a3;
}

- (BOOL)shouldDisableTextMorphing
{
  return self->_shouldDisableTextMorphing;
}

- (void)setShouldDisableTextMorphing:(BOOL)a3
{
  self->_shouldDisableTextMorphing = a3;
}

- (int64_t)matchType
{
  return self->_matchType;
}

- (void)setMatchType:(int64_t)a3
{
  self->_matchType = a3;
}

- (NSDictionary)outgoingTextureActionBuildFinalAttributes
{
  return self->_outgoingTextureActionBuildFinalAttributes;
}

- (void)setOutgoingTextureActionBuildFinalAttributes:(id)a3
{
}

- (BOOL)shouldTearDownTextures
{
  return self->_shouldTearDownTextures;
}

- (void)setShouldTearDownTextures:(BOOL)a3
{
  self->_shouldTearDownTextures = a3;
}

@end