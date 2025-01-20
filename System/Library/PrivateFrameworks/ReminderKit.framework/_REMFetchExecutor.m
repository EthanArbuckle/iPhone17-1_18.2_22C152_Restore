@interface _REMFetchExecutor
+ (BOOL)supportsSecureCoding;
- (id)metadataFromFetchResult:(id)a3 inStore:(id)a4 error:(id *)a5;
- (id)resultsFromFetchResult:(id)a3 inStore:(id)a4 error:(id *)a5;
@end

@implementation _REMFetchExecutor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)resultsFromFetchResult:(id)a3 inStore:(id)a4 error:(id *)a5
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)metadataFromFetchResult:(id)a3 inStore:(id)a4 error:(id *)a5
{
  return (id)[a3 metadata];
}

@end