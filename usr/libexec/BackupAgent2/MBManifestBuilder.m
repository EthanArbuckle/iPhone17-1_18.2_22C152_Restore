@interface MBManifestBuilder
+ (id)manifestBuilderWithDirectory:(id)a3 error:(id *)a4;
- (BOOL)closeWithError:(id *)a3;
- (MBDatabaseBuilder)databaseBuilder;
- (MBManifestBuilder)initWithDirectory:(id)a3 error:(id *)a4;
- (MBProperties)properties;
- (NSString)databasePath;
- (NSString)directory;
- (NSString)propertiesPath;
- (void)dealloc;
@end

@implementation MBManifestBuilder

+ (id)manifestBuilderWithDirectory:(id)a3 error:(id *)a4
{
  v4 = [[MBManifestBuilder alloc] initWithDirectory:a3 error:a4];

  return v4;
}

- (MBManifestBuilder)initWithDirectory:(id)a3 error:(id *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MBManifestBuilder;
  v6 = [(MBManifestBuilder *)&v9 init];
  if (v6)
  {
    v6->_directory = (NSString *)a3;
    v6->_properties = objc_alloc_init(MBProperties);
    id v7 = +[MBEncoder encoderToFile:[(MBManifestBuilder *)v6 databasePath] error:a4];
    if (v7)
    {
      v6->_databaseBuilder = [[MBDatabaseBuilder alloc] initWithEncoder:v7];
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBManifestBuilder;
  [(MBManifestBuilder *)&v3 dealloc];
}

- (NSString)propertiesPath
{
  return [(NSString *)self->_directory stringByAppendingPathComponent:@"Manifest.plist"];
}

- (NSString)databasePath
{
  return [(NSString *)self->_directory stringByAppendingPathComponent:@"Manifest.mbdb"];
}

- (BOOL)closeWithError:(id *)a3
{
  BOOL v4 = [(MBProperties *)self->_properties writeToFile:[(MBManifestBuilder *)self propertiesPath] error:a3];
  if (v4) {
    [(MBDatabaseBuilder *)self->_databaseBuilder close];
  }
  return v4;
}

- (NSString)directory
{
  return self->_directory;
}

- (MBProperties)properties
{
  return self->_properties;
}

- (MBDatabaseBuilder)databaseBuilder
{
  return self->_databaseBuilder;
}

@end