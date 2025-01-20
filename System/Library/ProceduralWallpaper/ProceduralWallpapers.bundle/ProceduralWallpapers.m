id optionVariant(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void v8[3];
  void v9[4];
  uint64_t vars8;

  v9[3] = *MEMORY[0x263EF8340];
  v8[0] = @"bokehVariant";
  v8[1] = @"kSBUIMagicWallpaperThumbnailNameKey";
  v9[0] = a1;
  v9[1] = a2;
  v8[2] = @"thumbnailImageName";
  v9[2] = a2;
  v3 = NSDictionary;
  v4 = a2;
  v5 = a1;
  v6 = [v3 dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}