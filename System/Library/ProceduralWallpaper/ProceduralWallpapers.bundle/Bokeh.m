@interface Bokeh
+ (id)identifier;
+ (id)presetWallpaperOptions;
+ (id)representativeThumbnailImageName;
+ (id)thumbnailImageName;
@end

@implementation Bokeh

+ (id)identifier
{
  return @"Bokeh";
}

+ (id)presetWallpaperOptions
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  v3 = optionVariant(@"newmixedcolors", @"NewBokeh-Dark-Mixed_thumb");
  v18 = v3;
  v4 = optionVariant(@"newgreen", @"NewBokeh-Dark-Green_thumb");
  v19 = v4;
  v5 = optionVariant(@"newyellow", @"NewBokeh-Dark-Yellow_thumb");
  v20 = v5;
  v6 = optionVariant(@"neworange", @"NewBokeh-Dark-Orange_thumb");
  v21 = v6;
  v7 = optionVariant(@"newred", @"NewBokeh-Dark-Red_thumb");
  v22 = v7;
  v8 = optionVariant(@"newpurple", @"NewBokeh-Dark-Purple_thumb");
  v23 = v8;
  v9 = optionVariant(@"newblue", @"NewBokeh-Dark-Blue_thumb");
  v24 = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:7];

  objc_msgSend(v2, "addObjectsFromArray:", v10, v18, v19, v20, v21, v22, v23);
  v11 = optionVariant(@"Yellow_v03", @"NewBokeh-Light-Yellow_thumb");
  v18 = v11;
  v12 = optionVariant(@"Green_v01", @"NewBokeh-Light-Green_thumb");
  v19 = v12;
  v13 = optionVariant(@"Red_v01", @"NewBokeh-Light-Red_thumb");
  v20 = v13;
  v14 = optionVariant(@"Blue_v01", @"NewBokeh-Light-Blue_thumb");
  v21 = v14;
  v15 = optionVariant(@"Silver_v01", @"NewBokeh-Light-Silver_thumb");
  v22 = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:5];

  [v2 addObjectsFromArray:v16];
  [v2 addObjectsFromArray:&unk_26D73D910];

  return v2;
}

+ (id)representativeThumbnailImageName
{
  return @"NewBokeh-Dark-Mixed_thumb";
}

+ (id)thumbnailImageName
{
  v2 = [a1 presetWallpaperOptions];
  v3 = [v2 firstObject];
  v4 = [v3 objectForKey:@"thumbnailImageName"];

  return v4;
}

@end