@interface AVMetadataItem(OZAdditions)
+ (id)simplyCreateMetadataItemWithMediaCharacteristic:()OZAdditions;
+ (id)simplyCreateMetadataItemWithRawData:()OZAdditions identifier:timeRange:;
+ (uint64_t)simplyCreateMetadataItemWithObject:()OZAdditions identifier:timeRange:error:;
@end

@implementation AVMetadataItem(OZAdditions)

+ (uint64_t)simplyCreateMetadataItemWithObject:()OZAdditions identifier:timeRange:error:
{
  uint64_t result = [a3 simplyEncode:a6];
  if (result)
  {
    long long v10 = a5[1];
    v11[0] = *a5;
    v11[1] = v10;
    v11[2] = a5[2];
    return [a1 simplyCreateMetadataItemWithRawData:result identifier:a4 timeRange:v11];
  }
  return result;
}

+ (id)simplyCreateMetadataItemWithRawData:()OZAdditions identifier:timeRange:
{
  id v8 = objc_alloc_init(MEMORY[0x1E4F165A0]);
  [v8 setIdentifier:a4];
  [v8 setValue:a3];
  [v8 setDataType:*MEMORY[0x1E4F1F020]];
  long long v12 = *a5;
  uint64_t v13 = *((void *)a5 + 2);
  [v8 setTime:&v12];
  long long v10 = *(long long *)((char *)a5 + 24);
  uint64_t v11 = *((void *)a5 + 5);
  [v8 setDuration:&v10];
  return v8;
}

+ (id)simplyCreateMetadataItemWithMediaCharacteristic:()OZAdditions
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F165A0]);
  objc_msgSend(v4, "setIdentifier:", objc_msgSend(MEMORY[0x1E4F16558], "identifierForKey:keySpace:", *MEMORY[0x1E4F15EC0], *MEMORY[0x1E4F15E00]));
  [v4 setValue:a3];
  return v4;
}

@end