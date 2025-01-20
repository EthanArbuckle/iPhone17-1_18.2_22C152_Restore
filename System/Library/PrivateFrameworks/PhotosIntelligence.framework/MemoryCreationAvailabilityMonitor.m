@interface MemoryCreationAvailabilityMonitor
- (_TtC18PhotosIntelligence33MemoryCreationAvailabilityMonitor)init;
- (void)dealloc;
@end

@implementation MemoryCreationAvailabilityMonitor

- (void)dealloc
{
  v2 = self;
  MemoryCreationAvailabilityMonitor.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_2596F8D18((uint64_t)self + OBJC_IVAR____TtC18PhotosIntelligence33MemoryCreationAvailabilityMonitor_configuration);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18PhotosIntelligence33MemoryCreationAvailabilityMonitor_photoLibrary));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18PhotosIntelligence33MemoryCreationAvailabilityMonitor__listeners));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18PhotosIntelligence33MemoryCreationAvailabilityMonitor_workQueue));
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18PhotosIntelligence33MemoryCreationAvailabilityMonitor_processingAvailabilityReporter));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18PhotosIntelligence33MemoryCreationAvailabilityMonitor__processingAvailability);
}

- (_TtC18PhotosIntelligence33MemoryCreationAvailabilityMonitor)init
{
}

@end