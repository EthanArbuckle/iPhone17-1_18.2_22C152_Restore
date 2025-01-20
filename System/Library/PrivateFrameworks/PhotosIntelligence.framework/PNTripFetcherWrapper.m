@interface PNTripFetcherWrapper
+ (BOOL)supportsCollection:(id)a3;
@end

@implementation PNTripFetcherWrapper

+ (BOOL)supportsCollection:(id)a3
{
  return +[PNTripFetcher supportsCollection:a3];
}

@end