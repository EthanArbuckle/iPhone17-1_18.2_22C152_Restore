@interface PFDownloadsStateReportCollector
- (PFDownloadsStateReportCollector)init;
- (PFDownloadsStateReportCollector)initWithManagedObjectContext:(id)a3 episodePropertiesToReport:(id)a4 showPropertiesToReport:(id)a5 allEpisodes:(BOOL)a6;
- (void)generateReportWithCompletionHandler:(id)a3;
@end

@implementation PFDownloadsStateReportCollector

- (PFDownloadsStateReportCollector)initWithManagedObjectContext:(id)a3 episodePropertiesToReport:(id)a4 showPropertiesToReport:(id)a5 allEpisodes:(BOOL)a6
{
  uint64_t v9 = sub_1ACE76578();
  uint64_t v10 = sub_1ACE76578();
  v11 = (char *)self + OBJC_IVAR___PFDownloadsStateReportCollector_checker;
  *(void *)v11 = a3;
  *((void *)v11 + 1) = v9;
  *((void *)v11 + 2) = v10;
  v11[24] = a6;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for DownloadStateReportCollector();
  id v12 = a3;
  return [(PFDownloadsStateReportCollector *)&v14 init];
}

- (void)generateReportWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_1ACB512FC((uint64_t)sub_1ACB51B9C, v5);

  swift_release();
}

- (PFDownloadsStateReportCollector)init
{
  result = (PFDownloadsStateReportCollector *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PFDownloadsStateReportCollector_checker);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end