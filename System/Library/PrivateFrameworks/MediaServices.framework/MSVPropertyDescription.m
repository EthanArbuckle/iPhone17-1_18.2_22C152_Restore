@interface MSVPropertyDescription
@end

@implementation MSVPropertyDescription

uint64_t ___MSVPropertyDescription_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 componentsSeparatedByString:@"="];
  v6 = [v5 firstObject];

  v7 = [v4 componentsSeparatedByString:@"="];

  v8 = [v7 firstObject];

  uint64_t v9 = [&unk_1EF651858 indexOfObject:v6];
  uint64_t v10 = [&unk_1EF651858 indexOfObject:v8];
  uint64_t v11 = -1;
  if (v9 >= v10) {
    uint64_t v11 = 1;
  }
  if (v9 == v10) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = v11;
  }

  return v12;
}

@end