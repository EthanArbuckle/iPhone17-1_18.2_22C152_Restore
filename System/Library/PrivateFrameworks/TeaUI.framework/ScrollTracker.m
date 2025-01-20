@interface ScrollTracker
- (_TtC5TeaUI13ScrollTracker)init;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation ScrollTracker

- (_TtC5TeaUI13ScrollTracker)init
{
  return (_TtC5TeaUI13ScrollTracker *)ScrollTracker.init()();
}

- (void).cxx_destruct
{
}

- (void)scrollViewDidScroll:(id)a3
{
  v4 = (UIScrollView *)a3;
  v5 = self;
  ScrollTracker.scrollViewDidScroll(_:)(v4);
}

@end