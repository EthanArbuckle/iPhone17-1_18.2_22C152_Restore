@interface PDAnimationInfo
- (PDAnimationInfoData)mediaData;
- (PDMediaNode)mediaNode;
- (id)description;
- (id)entranceData;
- (id)exitData;
- (void)setEntranceData:(id)a3;
- (void)setExitData:(id)a3;
- (void)setMediaData:(id)a3;
- (void)setMediaNode:(id)a3;
@end

@implementation PDAnimationInfo

- (void)setEntranceData:(id)a3
{
}

- (id)entranceData
{
  return self->mEntrance;
}

- (void)setExitData:(id)a3
{
}

- (id)exitData
{
  return self->mExit;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PDAnimationInfo;
  v2 = [(PDAnimationInfo *)&v4 description];
  return v2;
}

- (PDAnimationInfoData)mediaData
{
  return self->mMedia;
}

- (void)setMediaData:(id)a3
{
}

- (PDMediaNode)mediaNode
{
  return self->mediaNode;
}

- (void)setMediaNode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mediaNode, 0);
  objc_storeStrong((id *)&self->mMedia, 0);
  objc_storeStrong((id *)&self->mExit, 0);
  objc_storeStrong((id *)&self->mEntrance, 0);
}

@end