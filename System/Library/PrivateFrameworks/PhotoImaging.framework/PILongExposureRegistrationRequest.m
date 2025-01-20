@interface PILongExposureRegistrationRequest
- ($FD18CD26FAB5729647810B74E671536E)cleanAperture;
- (NSDictionary)recipe;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newRenderJob;
- (int64_t)mediaComponentType;
- (void)setCleanAperture:(id *)a3;
- (void)setRecipe:(id)a3;
@end

@implementation PILongExposureRegistrationRequest

- (void).cxx_destruct
{
}

- (void)setCleanAperture:(id *)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  self->_cleanAperture.origin = ($86B46DF249C2B4242DBB096758D29184)a3->var0;
  self->_cleanAperture.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)var1;
}

- ($FD18CD26FAB5729647810B74E671536E)cleanAperture
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = self[5].var1;
  retstr->var0 = self[5].var0;
  retstr->$0AC6E346AE4835514AAA8AC86D8F4844 var1 = var1;
  return self;
}

- (void)setRecipe:(id)a3
{
}

- (NSDictionary)recipe
{
  return self->_recipe;
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (id)newRenderJob
{
  v3 = [PILongExposureRegistrationJob alloc];
  return [(NURenderJob *)v3 initWithRequest:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PILongExposureRegistrationRequest;
  v4 = [(NURenderRequest *)&v7 copyWithZone:a3];
  objc_storeStrong(v4 + 19, self->_recipe);
  $5BB7312FFE32F1AB3F1F5957C99A58B3 size = self->_cleanAperture.size;
  *((_OWORD *)v4 + 10) = self->_cleanAperture.origin;
  *(($5BB7312FFE32F1AB3F1F5957C99A58B3 *)v4 + 11) = size;
  return v4;
}

@end