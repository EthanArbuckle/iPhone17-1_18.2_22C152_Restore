@interface NFArchiver
- (BOOL)archiveDirectory:(id)a3 toLocation:(id)a4;
- (BOOL)unarchive:(id)a3 toLocation:(id)a4;
@end

@implementation NFArchiver

- (BOOL)archiveDirectory:(id)a3 toLocation:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  BOMCopierNew();
  v7 = [MEMORY[0x263EFF980] array];
  BOMCopierSetUserData();
  BOMCopierSetCopyFileFinishedHandler();
  v12 = @"createPKZip";
  v13[0] = MEMORY[0x263EFFA88];
  v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v9 = v6;
  [v9 fileSystemRepresentation];

  id v10 = v5;
  [v10 fileSystemRepresentation];

  LODWORD(v10) = BOMCopierCopyWithOptions();
  BOMCopierFree();

  return v10 == 0;
}

- (BOOL)unarchive:(id)a3 toLocation:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  BOMCopierNew();
  v7 = [MEMORY[0x263EFF980] array];
  BOMCopierSetUserData();
  BOMCopierSetCopyFileFinishedHandler();
  v12 = @"extractPKZip";
  v13[0] = MEMORY[0x263EFFA88];
  v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v9 = v6;
  [v9 fileSystemRepresentation];

  id v10 = v5;
  [v10 fileSystemRepresentation];

  LODWORD(v10) = BOMCopierCopyWithOptions();
  BOMCopierFree();

  return v10 == 0;
}

@end