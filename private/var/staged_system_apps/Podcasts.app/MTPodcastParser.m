@interface MTPodcastParser
- (MTPodcastParser)init;
- (id)dateFromRSSDateString:(id)a3;
@end

@implementation MTPodcastParser

- (MTPodcastParser)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTPodcastParser;
  v2 = [(MTPodcastParser *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    dateParser = v2->_dateParser;
    v2->_dateParser = (MTDateParser *)v3;
  }
  return v2;
}

- (id)dateFromRSSDateString:(id)a3
{
  return [(MTDateParser *)self->_dateParser dateFromRSSDateString:a3];
}

- (void).cxx_destruct
{
}

@end