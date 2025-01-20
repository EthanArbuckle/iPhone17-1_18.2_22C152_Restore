@interface MTPodcastDatabaseDebugProvider
- (id)debugData;
- (id)debugDataFileName;
@end

@implementation MTPodcastDatabaseDebugProvider

- (id)debugData
{
  v3 = +[MTConstants sharedDocumentsDirectory];
  v4 = [(MTPodcastDatabaseDebugProvider *)self debugDataFileName];
  v5 = [v3 URLByAppendingPathComponent:v4];

  v6 = +[NSData dataWithContentsOfURL:v5];

  return v6;
}

- (id)debugDataFileName
{
  return kLibraryDatabaseFilename;
}

@end