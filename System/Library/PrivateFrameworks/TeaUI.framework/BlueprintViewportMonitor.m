@interface BlueprintViewportMonitor
- (_TtC5TeaUI24BlueprintViewportMonitor)init;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation BlueprintViewportMonitor

- (_TtC5TeaUI24BlueprintViewportMonitor)init
{
}

- (void).cxx_destruct
{
}

- (void)scrollViewDidScroll:(id)a3
{
  v4 = (UIScrollView *)a3;
  v5 = self;
  BlueprintViewportMonitor.scrollViewDidScroll(_:)(v4);
}

@end