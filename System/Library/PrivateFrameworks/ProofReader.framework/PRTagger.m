@interface PRTagger
- (PRTagger)initWithTagSchemes:(id)a3 orthoIndex:(unint64_t)a4;
- (unint64_t)orthoIndex;
- (void)setOrthoIndex:(unint64_t)a3;
@end

@implementation PRTagger

- (PRTagger)initWithTagSchemes:(id)a3 orthoIndex:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PRTagger;
  result = [(NLTagger *)&v6 initWithTagSchemes:a3];
  if (result) {
    result->_orthoIndex = a4;
  }
  return result;
}

- (void)setOrthoIndex:(unint64_t)a3
{
  self->_orthoIndex = a3;
}

- (unint64_t)orthoIndex
{
  return self->_orthoIndex;
}

@end