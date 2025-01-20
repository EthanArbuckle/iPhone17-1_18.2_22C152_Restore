@interface SKMediaKit
+ (id)getFilesystem:(id)a3;
+ (id)getMediaKitFilesystemInfo:(id)a3;
+ (id)getMediaKitFilesystemType:(id)a3;
+ (id)newMediaRefForDisk:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation SKMediaKit

+ (id)getMediaKitFilesystemType:(id)a3
{
  v3 = +[SKMediaKit getMediaKitFilesystemInfo:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 fsType];
    if (v5)
    {
      v6 = [v4 fsType];
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)getMediaKitFilesystemInfo:(id)a3
{
  [a3 UTF8String];
  v3 = (SKMediaKitFSInfo *)MKMediaCreateWithPath();
  if (v3)
  {
    v4 = (void *)MKCFCreateFSInfo();
    CFRelease(v3);
    if (v4) {
      v3 = [[SKMediaKitFSInfo alloc] initWithFSInfo:v4];
    }
    else {
      v3 = 0;
    }
  }

  return v3;
}

+ (id)newMediaRefForDisk:(id)a3 options:(id)a4 error:(id *)a5
{
  v7 = NSString;
  id v8 = a4;
  v9 = [a3 diskIdentifier];
  v10 = [v7 stringWithFormat:@"/dev/r%@", v9];

  id v11 = v10;
  [v11 UTF8String];
  v12 = (void *)MKMediaCreateWithPath();

  if (!v12)
  {
    v12 = +[SKError nilWithPOSIXCode:0 error:a5];
  }

  return v12;
}

+ (id)getFilesystem:(id)a3
{
  v21[14] = *MEMORY[0x263EF8340];
  v3 = [NSString stringWithFormat:@"/dev/%@", a3];
  v4 = +[SKMediaKit getMediaKitFilesystemInfo:v3];

  if (v4)
  {
    v20[0] = @"HFS Unknown variant";
    v20[1] = @"HFS";
    v21[0] = @"hfs";
    v21[1] = @"hfs";
    v20[2] = @"HFS+";
    v20[3] = @"HFS+ Embedded";
    v21[2] = @"hfs";
    v21[3] = @"hfs";
    v20[4] = @"HFS+ Extended";
    v20[5] = @"APFS";
    v21[4] = @"hfs";
    v21[5] = @"apfs";
    v20[6] = @"FAT";
    v20[7] = @"FAT12";
    v21[6] = @"msdos";
    v21[7] = @"msdos";
    v20[8] = @"FAT16";
    v20[9] = @"FAT32";
    v21[8] = @"msdos";
    v21[9] = @"msdos";
    v20[10] = @"NTFS";
    v20[11] = @"ExFAT";
    v21[10] = @"ntfs";
    v21[11] = @"exfat";
    v20[12] = @"UFS";
    v20[13] = @"ISO9660";
    v21[12] = @"ufs";
    v21[13] = @"cd9660";
    v5 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:14];
    v6 = [v4 fsInfo];
    v7 = [v6 objectForKey:@"Filesystem"];
    id v8 = [v5 objectForKey:v7];

    v9 = [v4 fsInfo];
    v10 = [v9 objectForKey:@"Attributes"];
    id v11 = [v10 objectForKey:@"Case sensitive"];
    uint64_t v12 = [v11 BOOLValue];

    v13 = +[SKFilesystem filesystemFor:v8 caseSensitive:v12];
    if (v13)
    {
      v14 = [v4 fsInfo];
      v15 = [v14 objectForKey:@"Attributes"];
      v16 = [v15 objectForKey:@"Journaled"];
      uint64_t v17 = [v16 BOOLValue];

      [v13 setIsJournaled:v17];
      id v18 = v13;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end