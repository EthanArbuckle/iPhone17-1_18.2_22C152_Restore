@interface _DASClosureBatch
- (NSArray)bundleIDs;
- (double)signpostTimestamp;
- (void)setBundleIDs:(id)a3;
- (void)setSignpostTimestamp:(double)a3;
@end

@implementation _DASClosureBatch

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (void)setBundleIDs:(id)a3
{
}

- (double)signpostTimestamp
{
  return self->_signpostTimestamp;
}

- (void)setSignpostTimestamp:(double)a3
{
  self->_signpostTimestamp = a3;
}

- (void).cxx_destruct
{
}

@end