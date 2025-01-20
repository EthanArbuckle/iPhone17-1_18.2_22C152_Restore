@interface TSDMagicMoveTextureZOrdererFlattenableMatches
- (NSArray)animationMatches;
- (NSArray)texturesInZOrder;
- (void)dealloc;
- (void)setAnimationMatches:(id)a3;
- (void)setTexturesInZOrder:(id)a3;
@end

@implementation TSDMagicMoveTextureZOrdererFlattenableMatches

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDMagicMoveTextureZOrdererFlattenableMatches;
  [(TSDMagicMoveTextureZOrdererFlattenableMatches *)&v3 dealloc];
}

- (NSArray)animationMatches
{
  return self->_animationMatches;
}

- (void)setAnimationMatches:(id)a3
{
}

- (NSArray)texturesInZOrder
{
  return self->_texturesInZOrder;
}

- (void)setTexturesInZOrder:(id)a3
{
}

@end