@interface OADExportedEmbeddedMediaFile
- (BOOL)isAudioOnly;
- (TSPData)tspData;
- (void)setIsAudioOnly:(BOOL)a3;
- (void)setTspData:(id)a3;
@end

@implementation OADExportedEmbeddedMediaFile

- (BOOL)isAudioOnly
{
  return *(&self->super.super.loop + 1);
}

- (void)setIsAudioOnly:(BOOL)a3
{
  *(&self->super.super.loop + 1) = a3;
}

- (TSPData)tspData
{
  return *(TSPData **)&self->isAudioOnly;
}

- (void)setTspData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end