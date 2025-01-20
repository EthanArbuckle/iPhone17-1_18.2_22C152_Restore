@interface MRCAMLLayer
- (MRCAMLLayer)init;
- (MRImageProvider)contents;
- (NSArray)animations;
- (NSArray)masks;
- (NSArray)sublayers;
- (NSDictionary)states;
- (NSString)name;
- (void)dealloc;
- (void)setAnimations:(id)a3;
- (void)setContents:(id)a3;
- (void)setMasks:(id)a3;
- (void)setName:(id)a3;
- (void)setStates:(id)a3;
- (void)setSublayers:(id)a3;
@end

@implementation MRCAMLLayer

- (MRCAMLLayer)init
{
  v9.receiver = self;
  v9.super_class = (Class)MRCAMLLayer;
  result = [(MRCAMLLayer *)&v9 init];
  if (result)
  {
    result->scaleZ = 1.0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&result->scaleX = _Q0;
    result->subScaleZ = 1.0;
    *(_OWORD *)&result->subScaleX = _Q0;
    __asm { FMOV            V0.2D, #0.5 }
    result->anchorPoint = _Q0;
  }
  return result;
}

- (void)dealloc
{
  [(MRCAMLLayer *)self setName:0];
  [(MRCAMLLayer *)self setAnimations:0];
  [(MRCAMLLayer *)self setSublayers:0];
  [(MRCAMLLayer *)self setStates:0];
  [(MRCAMLLayer *)self setMasks:0];
  v3.receiver = self;
  v3.super_class = (Class)MRCAMLLayer;
  [(MRCAMLLayer *)&v3 dealloc];
}

- (NSString)name
{
  return self->name;
}

- (void)setName:(id)a3
{
}

- (NSArray)animations
{
  return self->animations;
}

- (void)setAnimations:(id)a3
{
}

- (NSArray)sublayers
{
  return self->sublayers;
}

- (void)setSublayers:(id)a3
{
}

- (NSDictionary)states
{
  return self->states;
}

- (void)setStates:(id)a3
{
}

- (NSArray)masks
{
  return self->masks;
}

- (void)setMasks:(id)a3
{
}

- (MRImageProvider)contents
{
  return self->contents;
}

- (void)setContents:(id)a3
{
}

@end