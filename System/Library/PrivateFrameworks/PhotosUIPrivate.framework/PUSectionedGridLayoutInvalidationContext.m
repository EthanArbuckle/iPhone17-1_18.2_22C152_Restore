@interface PUSectionedGridLayoutInvalidationContext
- (BOOL)invalidateForVerticalScroll;
- (BOOL)invalidationHasBeenRedispatched;
- (BOOL)samplingIsPreserved;
- (BOOL)sectioningIsPreserved;
- (id)description;
- (void)setInvalidateForVerticalScroll:(BOOL)a3;
- (void)setInvalidationHasBeenRedispatched:(BOOL)a3;
- (void)setSamplingIsPreserved:(BOOL)a3;
- (void)setSectioningIsPreserved:(BOOL)a3;
@end

@implementation PUSectionedGridLayoutInvalidationContext

- (void)setInvalidationHasBeenRedispatched:(BOOL)a3
{
  self->_invalidationHasBeenRedispatched = a3;
}

- (BOOL)invalidationHasBeenRedispatched
{
  return self->_invalidationHasBeenRedispatched;
}

- (void)setSamplingIsPreserved:(BOOL)a3
{
  self->_samplingIsPreserved = a3;
}

- (BOOL)samplingIsPreserved
{
  return self->_samplingIsPreserved;
}

- (void)setSectioningIsPreserved:(BOOL)a3
{
  self->_sectioningIsPreserved = a3;
}

- (BOOL)sectioningIsPreserved
{
  return self->_sectioningIsPreserved;
}

- (void)setInvalidateForVerticalScroll:(BOOL)a3
{
  self->_invalidateForVerticalScroll = a3;
}

- (BOOL)invalidateForVerticalScroll
{
  return self->_invalidateForVerticalScroll;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)PUSectionedGridLayoutInvalidationContext;
  v3 = [(PUSectionedGridLayoutInvalidationContext *)&v9 description];
  BOOL v4 = [(UICollectionViewLayoutInvalidationContext *)self invalidateDataSourceCounts];
  v5 = @"N";
  if (v4) {
    v6 = @"Y";
  }
  else {
    v6 = @"N";
  }
  if (self->_invalidateForVerticalScroll) {
    v5 = @"Y";
  }
  v7 = [v3 stringByAppendingFormat:@" invalidateDataSourceCounts: %@, invalidateForVerticalScroll: %@", v6, v5];

  return v7;
}

@end