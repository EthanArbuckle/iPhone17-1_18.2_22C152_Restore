@interface PXStoryMiroMusicInfo
+ (BOOL)supportsSecureCoding;
- (NSString)flexMusicID;
- (PXStoryMiroMusicInfo)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setFlexMusicID:(id)a3;
@end

@implementation PXStoryMiroMusicInfo

- (void).cxx_destruct
{
}

- (void)setFlexMusicID:(id)a3
{
}

- (NSString)flexMusicID
{
  return self->_flexMusicID;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PXStoryMiroMusicInfo *)self flexMusicID];
  [v4 encodeObject:v5 forKey:@"MoodSongDictID"];
}

- (PXStoryMiroMusicInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryMiroMusicInfo;
  id v5 = [(PXStoryMiroMusicInfo *)&v9 init];
  if (v5 && ([v4 containsValueForKey:@"MoodiTunesMediaID"] & 1) == 0)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MoodSongDictID"];
    flexMusicID = v5->_flexMusicID;
    v5->_flexMusicID = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end