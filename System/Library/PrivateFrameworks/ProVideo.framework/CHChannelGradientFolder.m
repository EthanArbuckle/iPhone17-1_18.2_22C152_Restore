@interface CHChannelGradientFolder
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (id)addNewChannelWithXMLTypeInfo:(id)a3;
- (id)cloneSample:(unsigned int)a3;
- (id)insertSampleAtTime:(id *)a3 offset:(double)a4;
- (id)sampleBaseName;
- (void)deleteSample:(unsigned int)a3;
- (void)flopAtTime:(id *)a3;
- (void)ozChannel;
- (void)sortAndRename;
- (void)spreadAtTime:(id *)a3;
@end

@implementation CHChannelGradientFolder

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return 0;
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  return 0;
}

- (void)ozChannel
{
  result = self->super.super.super._pOZChannel;
  if (result) {
  return result;
  }
}

- (id)sampleBaseName
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  v3 = (PCString *)(*(uint64_t (**)(const void *, SEL))(*(void *)pOZChannel + 712))(pOZChannel, a2);
  }

  return PCString::ns_str(v3);
}

- (id)insertSampleAtTime:(id *)a3 offset:(double)a4
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  v7 = (OZChannelBase *)(*(uint64_t (**)(const void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *, double))(*(void *)pOZChannel + 720))(pOZChannel, a3, a4);
  }

  return CHChannelWrapperForOZChannel(v7, 0);
}

- (id)cloneSample:(unsigned int)a3
{
  pOZChannel = (OZChannelFolder *)self->super.super.super._pOZChannel;
  if (pOZChannel) {
  v5 = OZChannelGradientFolder::cloneSample(pOZChannel, a3);
  }

  return CHChannelWrapperForOZChannel(v5, 0);
}

- (void)deleteSample:(unsigned int)a3
{
  pOZChannel = (OZChannelFolder *)self->super.super.super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannelGradientFolder::deleteSample(pOZChannel, a3);
}

- (void)spreadAtTime:(id *)a3
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannelGradientFolder::spread((OZChannelGradientFolder *)pOZChannel, (const CMTime *)a3);
}

- (void)flopAtTime:(id *)a3
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannelGradientFolder::flop((OZChannelGradientFolder *)pOZChannel, (const CMTime *)a3);
}

- (void)sortAndRename
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannelGradientFolder::sortAndRename((OZChannelGradientFolder *)pOZChannel);
}

- (id)addNewChannelWithXMLTypeInfo:(id)a3
{
  long long v4 = *MEMORY[0x1E4F1FA48];
  uint64_t v5 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  return [(CHChannelGradientFolder *)self insertSampleAtTime:&v4 offset:0.0];
}

@end