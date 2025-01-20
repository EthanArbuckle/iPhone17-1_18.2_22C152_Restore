@interface PodcastsMediaLibrary.TaskMetricsDelegate
- (_TtCC18PodcastsFoundation20PodcastsMediaLibrary19TaskMetricsDelegate)init;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
@end

@implementation PodcastsMediaLibrary.TaskMetricsDelegate

- (_TtCC18PodcastsFoundation20PodcastsMediaLibrary19TaskMetricsDelegate)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCC18PodcastsFoundation20PodcastsMediaLibrary19TaskMetricsDelegate_strongRef) = 0;
  v6.receiver = self;
  v6.super_class = (Class)_s19TaskMetricsDelegateCMa();
  v2 = [(PodcastsMediaLibrary.TaskMetricsDelegate *)&v6 init];
  v3 = *(Class *)((char *)&v2->super.isa
                + OBJC_IVAR____TtCC18PodcastsFoundation20PodcastsMediaLibrary19TaskMetricsDelegate_strongRef);
  *(Class *)((char *)&v2->super.isa
           + OBJC_IVAR____TtCC18PodcastsFoundation20PodcastsMediaLibrary19TaskMetricsDelegate_strongRef) = (Class)v2;
  v4 = v2;

  return v4;
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1ACBF6550(v10);
}

- (void).cxx_destruct
{
  v2 = *(char **)((char *)&self->super.isa
                + OBJC_IVAR____TtCC18PodcastsFoundation20PodcastsMediaLibrary19TaskMetricsDelegate_strongRef);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCC18PodcastsFoundation20PodcastsMediaLibrary19TaskMetricsDelegate_strongRef) = 0;
  v3 = v2;
  if (v2)
  {
    while (1)
    {
      objc_super v6 = v3;
      if (!swift_isUniquelyReferenced()) {
        break;
      }
      v4 = *(char **)&v6[OBJC_IVAR____TtCC18PodcastsFoundation20PodcastsMediaLibrary19TaskMetricsDelegate_strongRef];
      v5 = v4;

      v3 = v4;
      if (!v4) {
        goto LABEL_6;
      }
    }
    v3 = v6;
  }
LABEL_6:
}

@end