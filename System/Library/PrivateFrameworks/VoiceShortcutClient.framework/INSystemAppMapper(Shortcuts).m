@interface INSystemAppMapper(Shortcuts)
+ (id)sharedMapper;
@end

@implementation INSystemAppMapper(Shortcuts)

+ (id)sharedMapper
{
  if (sharedMapper_onceToken != -1) {
    dispatch_once(&sharedMapper_onceToken, &__block_literal_global_491);
  }
  v0 = (void *)sharedMapper_mapper;
  return v0;
}

@end