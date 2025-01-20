@interface ExclaveStackEntry
- (NSMutableArray)frames;
- (NSNumber)addressSpaceId;
- (void)addFrames:(id)a3;
- (void)setAddressSpaceId:(id)a3;
- (void)setFrames:(id)a3;
@end

@implementation ExclaveStackEntry

- (void)addFrames:(id)a3
{
  id v4 = a3;
  frames = self->_frames;
  id v8 = v4;
  if (!frames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_frames;
    self->_frames = v6;

    id v4 = v8;
    frames = self->_frames;
  }
  [(NSMutableArray *)frames addObject:v4];
}

- (NSNumber)addressSpaceId
{
  return self->_addressSpaceId;
}

- (void)setAddressSpaceId:(id)a3
{
}

- (NSMutableArray)frames
{
  return self->_frames;
}

- (void)setFrames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_addressSpaceId, 0);
}

@end