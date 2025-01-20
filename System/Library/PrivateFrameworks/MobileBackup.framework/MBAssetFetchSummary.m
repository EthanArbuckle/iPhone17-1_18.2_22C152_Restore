@interface MBAssetFetchSummary
- (NSDate)end;
- (NSDate)start;
- (id)description;
- (unint64_t)fetchedAssetBytes;
- (unint64_t)fetchedAssetCount;
- (void)setEnd:(id)a3;
- (void)setFetchedAssetBytes:(unint64_t)a3;
- (void)setFetchedAssetCount:(unint64_t)a3;
- (void)setStart:(id)a3;
@end

@implementation MBAssetFetchSummary

- (id)description
{
  v3 = [(MBAssetFetchSummary *)self end];
  v4 = [(MBAssetFetchSummary *)self start];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  unint64_t v7 = [(MBAssetFetchSummary *)self fetchedAssetCount];
  unint64_t v8 = [(MBAssetFetchSummary *)self fetchedAssetBytes];
  v9 = +[NSByteCountFormatter stringFromByteCount:(uint64_t)((double)v8 / v6) countStyle:0];
  v10 = (objc_class *)objc_opt_class();
  v11 = +[NSString stringWithFormat:@"<%s: %p duration=%.2fs fetchedAssetCount=%llu fetchedAssetBytes=%llu tx=%@/s>", class_getName(v10), self, *(void *)&v6, v7, v8, v9];

  return v11;
}

- (NSDate)start
{
  return self->_start;
}

- (void)setStart:(id)a3
{
}

- (NSDate)end
{
  return self->_end;
}

- (void)setEnd:(id)a3
{
}

- (unint64_t)fetchedAssetCount
{
  return self->_fetchedAssetCount;
}

- (void)setFetchedAssetCount:(unint64_t)a3
{
  self->_fetchedAssetCount = a3;
}

- (unint64_t)fetchedAssetBytes
{
  return self->_fetchedAssetBytes;
}

- (void)setFetchedAssetBytes:(unint64_t)a3
{
  self->_fetchedAssetBytes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

@end