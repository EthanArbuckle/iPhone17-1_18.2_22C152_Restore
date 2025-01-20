@interface SerializationDateFormatter
@end

@implementation SerializationDateFormatter

uint64_t ___SerializationDateFormatter_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_SerializationDateFormatter__dateFormatter;
  _SerializationDateFormatter__dateFormatter = (uint64_t)v0;

  v2 = (void *)_SerializationDateFormatter__dateFormatter;
  return [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

@end