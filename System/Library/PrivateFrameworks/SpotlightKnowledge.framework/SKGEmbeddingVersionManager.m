@interface SKGEmbeddingVersionManager
+ (BOOL)embeddingsSupported;
+ (id)currentEmbeddingVersion;
+ (id)currentEmbeddingVersionDataReturningError:(id *)a3;
+ (id)embeddingVersionDataFromTextVersion:(id)a3 returningError:(id *)a4;
@end

@implementation SKGEmbeddingVersionManager

+ (BOOL)embeddingsSupported
{
  v2 = [MEMORY[0x263F78CD0] sharedInstance];
  char v3 = [v2 deviceCanGenerateEmbeddings];

  return v3;
}

+ (id)currentEmbeddingVersion
{
  v2 = NSNumber;
  uint64_t v3 = [MEMORY[0x263F78CD0] version];
  return (id)[v2 numberWithUnsignedInteger:v3];
}

+ (id)embeddingVersionDataFromTextVersion:(id)a3 returningError:(id *)a4
{
  return +[SKGProcessor embeddingVersionDataWithVersion:](SKGProcessor, "embeddingVersionDataWithVersion:", a3, a4);
}

+ (id)currentEmbeddingVersionDataReturningError:(id *)a3
{
  v5 = [a1 currentEmbeddingVersion];
  v6 = [a1 embeddingVersionDataFromTextVersion:v5 returningError:a3];

  return v6;
}

@end