@interface MNRouteDivergenceOverlappingSection
- (NSArray)components;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (void)setComponents:(id)a3;
@end

@implementation MNRouteDivergenceOverlappingSection

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  v4 = [(MNRouteDivergenceOverlappingSection *)self components];
  v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (NSArray)components
{
  return self->_components;
}

- (void)setComponents:(id)a3
{
}

- (void).cxx_destruct
{
}

@end