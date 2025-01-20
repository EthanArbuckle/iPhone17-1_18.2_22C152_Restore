@interface CALayer(PhotosPlayer)
- (double)is_blurRadius;
- (uint64_t)_is_blurFilter;
- (uint64_t)_is_setBlurFilter:()PhotosPlayer;
- (void)_is_removeBlurFilterIfNeeded;
- (void)is_addBlurFilterIfNeeded;
- (void)is_addFilter:()PhotosPlayer;
- (void)is_removeFilter:()PhotosPlayer;
- (void)is_setBlurRadius:()PhotosPlayer;
@end

@implementation CALayer(PhotosPlayer)

- (void)_is_removeBlurFilterIfNeeded
{
  v2 = objc_msgSend(a1, "_is_blurFilter");

  if (v2)
  {
    objc_msgSend(a1, "_is_blurFilter");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = [a1 filters];
    v4 = (void *)[v3 mutableCopy];

    [v4 removeObject:v5];
    [a1 setFilters:v4];
    objc_msgSend(a1, "_is_setBlurFilter:", 0);
  }
}

- (void)is_removeFilter:()PhotosPlayer
{
  id v8 = a3;
  v4 = [a1 filters];
  if (v4)
  {
    id v5 = v4;
    v6 = (void *)[v4 mutableCopy];
    [v6 removeObject:v8];
    v7 = (void *)[v6 copy];

    [a1 setFilters:v7];
  }
}

- (void)is_addFilter:()PhotosPlayer
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 filters];
  if (([v5 containsObject:v4] & 1) == 0)
  {
    if (v5)
    {
      v9[0] = v4;
      v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
      uint64_t v7 = [v6 arrayByAddingObjectsFromArray:v5];

      id v5 = (void *)v7;
    }
    else
    {
      id v8 = v4;
      id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
    }
    [a1 setFilters:v5];
  }
}

- (void)is_addBlurFilterIfNeeded
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(a1, "_is_blurFilter");

  if (!v2)
  {
    v3 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v3 setName:@"LivePhotoBlur"];
    [v3 setCachesInputImage:0];
    [v3 setValue:&unk_1F3554978 forKey:@"inputRadius"];
    [v3 setValue:MEMORY[0x1E4F1CC38] forKey:@"inputHardEdges"];
    [v3 setValue:@"medium" forKey:@"inputQuality"];
    objc_msgSend(a1, "_is_setBlurFilter:", v3);
    v9[0] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    id v5 = [a1 filters];
    if (v5)
    {
      id v8 = v3;
      v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
      uint64_t v7 = [v6 arrayByAddingObjectsFromArray:v5];

      id v4 = (void *)v7;
    }
    [a1 setFilters:v4];
  }
}

- (uint64_t)_is_blurFilter
{
  return [a1 valueForKeyPath:@"filters.LivePhotoBlur"];
}

- (uint64_t)_is_setBlurFilter:()PhotosPlayer
{
  return [a1 setValue:a3 forKeyPath:@"filters.LivePhotoBlur"];
}

- (double)is_blurRadius
{
  v1 = [a1 valueForKeyPath:@"filters.LivePhotoBlur.inputRadius"];
  [v1 floatValue];
  double v3 = v2;

  return v3;
}

- (void)is_setBlurRadius:()PhotosPlayer
{
  objc_msgSend(a1, "is_addBlurFilterIfNeeded");
  id v4 = [NSNumber numberWithDouble:a2];
  [a1 setValue:v4 forKeyPath:@"filters.LivePhotoBlur.inputRadius"];
}

@end