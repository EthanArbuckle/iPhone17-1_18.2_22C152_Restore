@interface RBMetalRenderState
- ($3CC19D079FD0B010EE84973AA846B91B)bounds;
- (CGAffineTransform)CTM;
- (CGSize)size;
- (MTLCommandBuffer)commandBuffer;
- (MTLRenderCommandEncoder)encoder;
- (MTLRenderPassDescriptor)descriptor;
- (float)alpha;
- (int)blendMode;
- (unint64_t)formatKey;
- (unsigned)flags;
- (void)dealloc;
- (void)setAlpha:(float)a3;
- (void)setBlendMode:(int)a3;
- (void)setBounds:(id *)a3;
- (void)setCTM:(CGAffineTransform *)a3;
- (void)setCommandBuffer:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setEncoder:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setFormatKey:(unint64_t)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation RBMetalRenderState

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)RBMetalRenderState;
  [(RBMetalRenderState *)&v3 dealloc];
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (int)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (float)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(float)a3
{
  self->_alpha = a3;
}

- (MTLCommandBuffer)commandBuffer
{
  return self->_commandBuffer;
}

- (void)setCommandBuffer:(id)a3
{
}

- (MTLRenderPassDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (unint64_t)formatKey
{
  return self->_formatKey;
}

- (void)setFormatKey:(unint64_t)a3
{
  self->_formatKey = a3;
}

- (MTLRenderCommandEncoder)encoder
{
  return self->_encoder;
}

- (void)setEncoder:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- ($3CC19D079FD0B010EE84973AA846B91B)bounds
{
  long long v3 = *(_OWORD *)&self[2].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var1;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- (void)setBounds:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_bounds.double width = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_bounds.x = v3;
}

- (CGAffineTransform)CTM
{
  long long v3 = *(_OWORD *)&self[2].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].ty;
  return self;
}

- (void)setCTM:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_CTM.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_CTM.c = v4;
  *(_OWORD *)&self->_CTM.a = v3;
}

@end