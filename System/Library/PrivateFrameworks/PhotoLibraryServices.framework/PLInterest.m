@interface PLInterest
- (NSKnownKeysMappingStrategy)allKeysMappingStrategy;
- (unint64_t)indexesOfInterest;
- (void)setAllKeysMappingStrategy:(id)a3;
- (void)setIndexesOfInterest:(unint64_t)a3;
@end

@implementation PLInterest

- (void).cxx_destruct
{
}

- (void)setIndexesOfInterest:(unint64_t)a3
{
  self->_indexesOfInterest = a3;
}

- (unint64_t)indexesOfInterest
{
  return self->_indexesOfInterest;
}

- (void)setAllKeysMappingStrategy:(id)a3
{
}

- (NSKnownKeysMappingStrategy)allKeysMappingStrategy
{
  return self->_allKeysMappingStrategy;
}

@end