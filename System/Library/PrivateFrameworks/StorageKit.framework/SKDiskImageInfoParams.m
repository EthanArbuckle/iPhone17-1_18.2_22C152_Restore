@interface SKDiskImageInfoParams
+ (id)asif_info_key;
+ (id)checksum_info_key;
+ (id)compression_info_key;
+ (id)encryption_info_key;
+ (id)format_desc_info_key;
+ (id)format_info_key;
+ (id)getDictDescriptionWithDisk:(id)a3;
+ (id)identity_info_key;
+ (id)partitions_info_key;
+ (id)runs_info_key;
+ (id)size_info_key;
- (BOOL)extraInfo;
- (BOOL)stdinPassPhrase;
- (NSDictionary)imageInfo;
- (id)getInfoDictWithDisk:(id)a3;
- (void)setExtraInfo:(BOOL)a3;
- (void)setImageInfo:(id)a3;
- (void)setStdinPassPhrase:(BOOL)a3;
@end

@implementation SKDiskImageInfoParams

+ (id)format_info_key
{
  return @"Image Format";
}

+ (id)format_desc_info_key
{
  return @"Format Description";
}

+ (id)identity_info_key
{
  return @"Identity Info";
}

+ (id)size_info_key
{
  return @"Size Info";
}

+ (id)compression_info_key
{
  return @"Compression Info";
}

+ (id)encryption_info_key
{
  return @"Encryption Info";
}

+ (id)checksum_info_key
{
  return @"Master Checksum Info";
}

+ (id)asif_info_key
{
  return @"ASIF Info";
}

+ (id)runs_info_key
{
  return @"Runs";
}

+ (id)partitions_info_key
{
  return @"Partitions";
}

+ (id)getDictDescriptionWithDisk:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:4];
  v5 = [v3 ioContent];
  if (v5)
  {
    v6 = [v3 ioContent];
    [v4 setObject:v6 forKey:@"content-hint"];
  }
  else
  {
    [v4 setObject:@"N/A" forKey:@"content-hint"];
  }

  v7 = [v3 volumeName];
  if (v7)
  {
    v8 = [v3 volumeName];
    [v4 setObject:v8 forKey:@"volume-name"];
  }
  else
  {
    [v4 setObject:@"N/A" forKey:@"volume-name"];
  }

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "totalSpace"));
  [v4 setObject:v9 forKey:@"total-space"];

  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "usedSpace"));
    [v4 setObject:v10 forKey:@"used-space"];
  }
  else
  {
    [v4 setObject:@"N/A" forKey:@"used-space"];
  }

  return v4;
}

- (id)getInfoDictWithDisk:(id)a3
{
  id v4 = a3;
  v5 = [(SKDiskImageInfoParams *)self imageInfo];
  v6 = (void *)[v5 mutableCopy];

  if (v6)
  {
    v7 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
    v8 = [MEMORY[0x263EFF980] arrayWithObject:v4];
    while ([v8 count])
    {
      v9 = [v8 objectAtIndex:0];
      v10 = +[SKManager syncSharedManager];
      v11 = [v10 childDisksForWholeDisk:v9];
      [v8 addObjectsFromArray:v11];

      v12 = +[SKDiskImageInfoParams getDictDescriptionWithDisk:v9];
      [v7 addObject:v12];

      if ([v9 isMemberOfClass:objc_opt_class()])
      {
        v13 = [v9 container];
        v14 = [v13 volumes];
        [v8 addObjectsFromArray:v14];

        v15 = +[SKDiskImageInfoParams getDictDescriptionWithDisk:v13];
        [v7 addObject:v15];
      }
      [v8 removeObjectAtIndex:0];
    }
    [v6 setObject:v7 forKey:@"Partitions"];
    id v16 = v6;
  }

  return v6;
}

- (BOOL)stdinPassPhrase
{
  return self->_stdinPassPhrase;
}

- (void)setStdinPassPhrase:(BOOL)a3
{
  self->_stdinPassPhrase = a3;
}

- (BOOL)extraInfo
{
  return self->_extraInfo;
}

- (void)setExtraInfo:(BOOL)a3
{
  self->_extraInfo = a3;
}

- (NSDictionary)imageInfo
{
  return self->_imageInfo;
}

- (void)setImageInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end