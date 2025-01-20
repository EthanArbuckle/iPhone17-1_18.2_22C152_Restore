@interface SAMicrostackshotSummary
- (SAMicrostackshotSummary)init;
@end

@implementation SAMicrostackshotSummary

- (SAMicrostackshotSummary)init
{
  v8.receiver = self;
  v8.super_class = (Class)SAMicrostackshotSummary;
  v2 = [(SAMicrostackshotSummary *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:16];
    microstackshotStateCounts = v2->_microstackshotStateCounts;
    v2->_microstackshotStateCounts = (NSMutableDictionary *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:16];
    stateCounts = v2->_stateCounts;
    v2->_stateCounts = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCounts, 0);
  objc_storeStrong((id *)&self->_microstackshotStateCounts, 0);
}

@end