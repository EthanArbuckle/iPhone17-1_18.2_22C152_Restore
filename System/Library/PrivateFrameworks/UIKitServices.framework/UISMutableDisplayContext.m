@interface UISMutableDisplayContext
- (id)copyWithZone:(_NSZone *)a3;
- (void)setArtworkSubtype:(unint64_t)a3;
- (void)setDisplayConfiguration:(id)a3;
- (void)setDisplayEdgeInfo:(id)a3;
- (void)setExclusionArea:(id)a3;
- (void)setUserInterfaceStyle:(unint64_t)a3;
@end

@implementation UISMutableDisplayContext

- (void)setExclusionArea:(id)a3
{
  self->super._exclusionArea = (UISDisplayShape *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [UISDisplayContext alloc];
  return [(UISDisplayContext *)v4 _initWithDisplayContext:self];
}

- (void)setUserInterfaceStyle:(unint64_t)a3
{
  self->super._userInterfaceStyle = a3;
}

- (void)setArtworkSubtype:(unint64_t)a3
{
  self->super._artworkSubtype = a3;
}

- (void)setDisplayEdgeInfo:(id)a3
{
  self->super._displayEdgeInfo = (UISApplicationSupportDisplayEdgeInfo *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setDisplayConfiguration:(id)a3
{
  self->super._displayConfiguration = (FBSDisplayConfiguration *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end