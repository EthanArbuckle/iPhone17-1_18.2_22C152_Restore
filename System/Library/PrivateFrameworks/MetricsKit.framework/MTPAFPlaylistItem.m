@interface MTPAFPlaylistItem
- (MTPAFPlaylistItem)initWithStart:(unint64_t)a3 end:(unint64_t)a4 metricsData:(id)a5;
- (NSArray)metricsData;
- (unint64_t)end;
- (unint64_t)start;
- (void)setEnd:(unint64_t)a3;
- (void)setMetricsData:(id)a3;
- (void)setStart:(unint64_t)a3;
@end

@implementation MTPAFPlaylistItem

- (MTPAFPlaylistItem)initWithStart:(unint64_t)a3 end:(unint64_t)a4 metricsData:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)MTPAFPlaylistItem;
  v9 = [(MTPAFPlaylistItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(MTPAFPlaylistItem *)v9 setStart:a3];
    [(MTPAFPlaylistItem *)v10 setEnd:a4];
    [(MTPAFPlaylistItem *)v10 setMetricsData:v8];
  }

  return v10;
}

- (unint64_t)start
{
  return self->_start;
}

- (void)setStart:(unint64_t)a3
{
  self->_start = a3;
}

- (unint64_t)end
{
  return self->_end;
}

- (void)setEnd:(unint64_t)a3
{
  self->_end = a3;
}

- (NSArray)metricsData
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMetricsData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end