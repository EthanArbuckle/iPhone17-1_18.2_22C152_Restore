@interface NTKVideoPlayerListing
+ (id)listingForDevice:(id)a3 withFilename:(id)a4;
+ (id)listingForDevice:(id)a3 withFilename:(id)a4 andColor:(id)a5;
+ (id)listingForDevice:(id)a3 withURL:(id)a4;
- (BOOL)snapshotDiffers:(id)a3;
- (CLKVideo)video;
- (NSArray)attributes;
- (NSString)debugDescription;
- (NSString)description;
- (UIColor)color;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForDevice:(id)a3 withFilename:(id)a4;
- (id)initForDevice:(id)a3 withURL:(id)a4;
- (unint64_t)endBehavior;
- (void)discardAssets;
- (void)setAttributes:(id)a3;
- (void)setColor:(id)a3;
- (void)setEndBehavior:(unint64_t)a3;
@end

@implementation NTKVideoPlayerListing

+ (id)listingForDevice:(id)a3 withURL:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[NTKVideoPlayerListing alloc] initForDevice:v6 withURL:v5];

  return v7;
}

+ (id)listingForDevice:(id)a3 withFilename:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[NTKVideoPlayerListing alloc] initForDevice:v6 withFilename:v5];

  return v7;
}

+ (id)listingForDevice:(id)a3 withFilename:(id)a4 andColor:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[NTKVideoPlayerListing alloc] initForDevice:v9 withFilename:v8];

  [v10 setColor:v7];

  return v10;
}

- (id)initForDevice:(id)a3 withFilename:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NTKVideoPlayerListing;
  id v9 = [(NTKVideoPlayerListing *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    attributes = v9->_attributes;
    v9->_attributes = (NSArray *)MEMORY[0x1E4F1CBF0];

    objc_storeStrong((id *)&v10->_device, a3);
    v10->_endBehavior = 0;
    objc_storeStrong((id *)&v10->_filename, a4);
  }

  return v10;
}

- (id)initForDevice:(id)a3 withURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NTKVideoPlayerListing;
  id v9 = [(NTKVideoPlayerListing *)&v17 init];
  id v10 = v9;
  if (v9)
  {
    attributes = v9->_attributes;
    v9->_attributes = (NSArray *)MEMORY[0x1E4F1CBF0];

    v10->_endBehavior = 0;
    objc_storeStrong((id *)&v10->_url, a4);
    uint64_t v12 = [(NSURL *)v10->_url lastPathComponent];
    filename = v10->_filename;
    v10->_filename = (NSString *)v12;

    objc_storeStrong((id *)&v10->_device, a3);
    uint64_t v14 = [MEMORY[0x1E4F19AE8] videoAtURL:v10->_url forDevice:v10->_device];
    video = v10->_video;
    v10->_video = (CLKVideo *)v14;
  }
  return v10;
}

- (CLKVideo)video
{
  video = self->_video;
  if (!video)
  {
    v4 = (void *)MEMORY[0x1E4F19AE8];
    filename = self->_filename;
    device = self->_device;
    id v7 = NTKAssetsBundle();
    id v8 = [v4 videoNamed:filename forDevice:device inBundle:v7];
    id v9 = self->_video;
    self->_video = v8;

    video = self->_video;
  }

  return video;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  device = self->_device;
  filename = self->_filename;

  return (id)[v4 initForDevice:device withFilename:filename];
}

- (BOOL)snapshotDiffers:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = ![(NSString *)self->_filename isEqualToString:v4[3]];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)discardAssets
{
  video = self->_video;
  self->_video = 0;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"'%@'", self->_filename];
}

- (NSString)debugDescription
{
  v2 = NSString;
  filename = self->_filename;
  id v4 = [(CLKVideo *)self->_video url];
  BOOL v5 = [v2 stringWithFormat:@"filename: '%@' url: '%@'", filename, v4];

  return (NSString *)v5;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (unint64_t)endBehavior
{
  return self->_endBehavior;
}

- (void)setEndBehavior:(unint64_t)a3
{
  self->_endBehavior = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_video, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end