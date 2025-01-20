@interface PCFxBlendOptions
- (PCFxBlendOptions)initWithBlendOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)getBlendMode;
- (void)setBlendMode:(int)a3;
@end

@implementation PCFxBlendOptions

- (PCFxBlendOptions)initWithBlendOptions:(id)a3
{
  return self;
}

- (int)getBlendMode
{
  return self->_mode;
}

- (void)setBlendMode:(int)a3
{
  self->_mode = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[PCFxBlendOptions allocWithZone:a3];

  return [(PCFxBlendOptions *)v4 initWithBlendOptions:self];
}

@end