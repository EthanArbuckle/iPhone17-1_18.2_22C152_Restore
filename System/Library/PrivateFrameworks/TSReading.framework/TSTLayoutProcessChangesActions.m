@interface TSTLayoutProcessChangesActions
- (BOOL)layoutInvalidate;
- (BOOL)layoutInvalidateProvider;
- (BOOL)layoutInvalidateSize;
- (BOOL)layoutInvalidateTableNameVisibility;
- (BOOL)layoutSpacesInvalidateCoordinates;
- (BOOL)layoutSpacesInvalidateTableOffsets;
- (void)setLayoutInvalidate:(BOOL)a3;
- (void)setLayoutInvalidateProvider:(BOOL)a3;
- (void)setLayoutInvalidateSize:(BOOL)a3;
- (void)setLayoutInvalidateTableNameVisibility:(BOOL)a3;
- (void)setLayoutSpacesInvalidateCoordinates:(BOOL)a3;
- (void)setLayoutSpacesInvalidateTableOffsets:(BOOL)a3;
@end

@implementation TSTLayoutProcessChangesActions

- (BOOL)layoutInvalidate
{
  return self->mLayoutInvalidate;
}

- (void)setLayoutInvalidate:(BOOL)a3
{
  self->mLayoutInvalidate = a3;
}

- (BOOL)layoutInvalidateProvider
{
  return self->mLayoutInvalidateProvider;
}

- (void)setLayoutInvalidateProvider:(BOOL)a3
{
  self->mLayoutInvalidateProvider = a3;
}

- (BOOL)layoutInvalidateSize
{
  return self->mLayoutInvalidateSize;
}

- (void)setLayoutInvalidateSize:(BOOL)a3
{
  self->mLayoutInvalidateSize = a3;
}

- (BOOL)layoutInvalidateTableNameVisibility
{
  return self->mLayoutInvalidateTableNameVisibility;
}

- (void)setLayoutInvalidateTableNameVisibility:(BOOL)a3
{
  self->mLayoutInvalidateTableNameVisibility = a3;
}

- (BOOL)layoutSpacesInvalidateCoordinates
{
  return self->mLayoutSpacesInvalidateCoordinates;
}

- (void)setLayoutSpacesInvalidateCoordinates:(BOOL)a3
{
  self->mLayoutSpacesInvalidateCoordinates = a3;
}

- (BOOL)layoutSpacesInvalidateTableOffsets
{
  return self->mLayoutSpacesInvalidateTableOffsets;
}

- (void)setLayoutSpacesInvalidateTableOffsets:(BOOL)a3
{
  self->mLayoutSpacesInvalidateTableOffsets = a3;
}

@end