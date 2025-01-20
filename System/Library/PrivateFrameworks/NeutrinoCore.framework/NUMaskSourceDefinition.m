@interface NUMaskSourceDefinition
- ($0AC6E346AE4835514AAA8AC86D8F4844)scale;
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)croppedExtent;
- (NUMaskSourceDefinition)initWithCIImage:(id)a3 croppedExtent:(id *)a4 scale:(id)a5 orientation:(int64_t)a6;
- (id)generateSourceNodeWithIdentifier:(id)a3 error:(id *)a4;
- (void)setCroppedExtent:(id *)a3;
- (void)setScale:(id)a3;
@end

@implementation NUMaskSourceDefinition

- (void)setScale:(id)a3
{
  self->_scale = ($F9703ADC4DD3124DE91DE417D7636CC9)a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)scale
{
  p_scale = &self->_scale;
  int64_t numerator = self->_scale.numerator;
  int64_t denominator = p_scale->denominator;
  result.var1 = denominator;
  result.var0 = numerator;
  return result;
}

- (void)setCroppedExtent:(id *)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  self->_croppedExtent.origin = ($86B46DF249C2B4242DBB096758D29184)a3->var0;
  self->_croppedExtent.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)var1;
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)croppedExtent
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[2].var0.var1;
  retstr->var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[1].var1.var1;
  retstr->$0AC6E346AE4835514AAA8AC86D8F4844 var1 = v3;
  return self;
}

- (id)generateSourceNodeWithIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [NUMaskSourceNode alloc];
  v7 = [(NUCIImageSourceDefinition *)self image];
  [(NUMaskSourceDefinition *)self croppedExtent];
  uint64_t v8 = [(NUMaskSourceDefinition *)self scale];
  v10 = -[NUMaskSourceNode initWithImage:croppedExtent:scale:identifier:orientation:](v6, "initWithImage:croppedExtent:scale:identifier:orientation:", v7, &v13, v8, v9, v5, [(NUCIImageSourceDefinition *)self orientation]);

  v11 = [(NUSingleSourceDefinition *)self sourceDerivation];
  [(NUSourceNode *)v10 setSourceDerivation:v11];

  return v10;
}

- (NUMaskSourceDefinition)initWithCIImage:(id)a3 croppedExtent:(id *)a4 scale:(id)a5 orientation:(int64_t)a6
{
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  v11.receiver = self;
  v11.super_class = (Class)NUMaskSourceDefinition;
  $0AC6E346AE4835514AAA8AC86D8F4844 result = [(NUCIImageSourceDefinition *)&v11 initWithCIImage:a3 orientation:a6];
  $0AC6E346AE4835514AAA8AC86D8F4844 v10 = a4->var1;
  result->_croppedExtent.origin = ($86B46DF249C2B4242DBB096758D29184)a4->var0;
  result->_croppedExtent.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)v10;
  result->_scale.int64_t numerator = var0;
  result->_scale.int64_t denominator = var1;
  return result;
}

@end