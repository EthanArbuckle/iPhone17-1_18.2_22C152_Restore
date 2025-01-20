@interface PAAccessRecordAccumulator
- (NSMutableDictionary)ongoingIntervals;
- (NSMutableSet)seenEvents;
- (PAAccessRecord)record;
- (PAAccessRecordAccumulator)init;
- (void)setRecord:(id)a3;
@end

@implementation PAAccessRecordAccumulator

- (PAAccessRecordAccumulator)init
{
  v8.receiver = self;
  v8.super_class = (Class)PAAccessRecordAccumulator;
  v2 = [(PAAccessRecordAccumulator *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    ongoingIntervals = v2->_ongoingIntervals;
    v2->_ongoingIntervals = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    seenEvents = v2->_seenEvents;
    v2->_seenEvents = (NSMutableSet *)v5;
  }
  return v2;
}

- (PAAccessRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
}

- (NSMutableDictionary)ongoingIntervals
{
  return self->_ongoingIntervals;
}

- (NSMutableSet)seenEvents
{
  return self->_seenEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seenEvents, 0);
  objc_storeStrong((id *)&self->_ongoingIntervals, 0);

  objc_storeStrong((id *)&self->_record, 0);
}

@end