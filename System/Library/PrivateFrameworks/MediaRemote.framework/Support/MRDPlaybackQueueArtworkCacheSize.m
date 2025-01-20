@interface MRDPlaybackQueueArtworkCacheSize
+ (MRDPlaybackQueueArtworkCacheSize)defaultSize;
- (BOOL)isEqual:(id)a3;
- (MRDPlaybackQueueArtworkCacheSize)initWithW:(double)a3 h:(double)a4;
- (double)h;
- (double)w;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
@end

@implementation MRDPlaybackQueueArtworkCacheSize

- (MRDPlaybackQueueArtworkCacheSize)initWithW:(double)a3 h:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MRDPlaybackQueueArtworkCacheSize;
  result = [(MRDPlaybackQueueArtworkCacheSize *)&v7 init];
  if (result)
  {
    result->_w = a3;
    result->_h = a4;
  }
  return result;
}

- (id)description
{
  id v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%lf x %lf", *(void *)&self->_w, *(void *)&self->_h);

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  return vabdd_f64(self->_w, *((double *)a3 + 1)) < 0.1 && vabdd_f64(self->_h, *((double *)a3 + 2)) < 0.1;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_w * self->_h);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MRDPlaybackQueueArtworkCacheSize alloc];
  [(MRDPlaybackQueueArtworkCacheSize *)self w];
  double v6 = v5;
  [(MRDPlaybackQueueArtworkCacheSize *)self h];

  return [(MRDPlaybackQueueArtworkCacheSize *)v4 initWithW:v6 h:v7];
}

+ (MRDPlaybackQueueArtworkCacheSize)defaultSize
{
  if (qword_10047E398 != -1) {
    dispatch_once(&qword_10047E398, &stru_10041E990);
  }
  id v2 = (void *)qword_10047E390;

  return (MRDPlaybackQueueArtworkCacheSize *)v2;
}

- (int64_t)compare:(id)a3
{
  if (self->_w * self->_h <= *((double *)a3 + 1) * *((double *)a3 + 2)) {
    return 1;
  }
  else {
    return -1;
  }
}

- (double)w
{
  return self->_w;
}

- (double)h
{
  return self->_h;
}

@end